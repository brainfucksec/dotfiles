#!/usr/bin/env bash

#######################################################################
#
# rbackup
#
# Shell script for make encrypted backups with rsync and GnuPG
#
# Copyright (C) 2018-2021 Brainfuck
#
#
# GNU GENERAL PUBLIC LICENSE
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
#######################################################################


#######################################################################
# Settings
#######################################################################

# Program information
readonly prog_name="rbackup"
readonly version="0.6.1"
readonly signature="Copyright (C) 2021 Brainfuck"

# Initialize arguments
readonly args="$*"
readonly argnum="$#"

# Date format used for entries in the log file: `YYYY/mm/dd H:M:S`
readonly current_date="$(date +'%Y/%m/%d %T')"

# Config files directory
readonly config_dir="${HOME}/.config/${prog_name}"

# Config file: `~/.config/rbackup/config`
readonly config_file="${config_dir}/config"

## Config file variables:
#
# gpg UID for file encryption
readonly gpg_uid=$(awk '/^gpg_uid/{print $3}' "${config_file}")

# backup file name (label)
readonly label=$(awk '/^label/{print $3}' "${config_file}")

# source directory
readonly source_dir=$(awk '/^source_dir/{print $3}' "${config_file}")

# destination directory (backup dir)
readonly dest_dir=$(awk '/^dest_dir/{print $3}' "${config_file}")

# external volumes directories for multiple copies
readonly extdir_1=$(awk '/^extdir_1/{print $3}' "${config_file}")
readonly extdir_2=$(awk '/^extdir_2/{print $3}' "${config_file}")
## EOF config file

## rsync settings:
#
# exclude file
readonly exclude_file="${config_dir}/excluderc"

# log file
readonly log_file="${dest_dir}/rbackup-$(date +'%Y-%m-%d').log"


#######################################################################
# Functions
#######################################################################

## Error except: write a message in the log file and exit with (1)
die() {
    printf "%s\\n" "${current_date} $@" >>"${log_file}"
    exit 1
}


## Check program settings
check_settings() {
    # check dependencies
    declare -a dependencies=(rsync gpg);

    for package in "${dependencies[@]}"; do
        if ! hash "${package}" 2>/dev/null; then
            die "[Error]: '${package}' is not installed."
        fi
    done

    # check config file
    if [[ ! -f "${config_file}" ]]; then
        die "[Error]: Cannot load configuration file."
    fi

    # check exclude file
    if [[ ! -f "${exclude_file}" ]]; then
        die "[Error]: '${exclude_file}' not exist."
    fi

    # create backup directory if not exist
    if ! mkdir -pv "${dest_dir}"; then
        die "[Error]: Cannot create directory for backups."
    fi
}


## Show program version
show_version() {
    printf "%s\\n" "${prog_name} ${version}"
    printf "%s\\n" "${signature}"
    printf "%s\\n" "License GNU GPL-3.0-or-later <https://gnu.org/licenses/gpl.html>"
    printf "%s\\n" "This is free software: you are free to change and redistribute it."
    printf "%s\\n\\n" "There is NO WARRANTY, to the extent permitted by law."
}


## Show help menù
usage() {
show_version
cat << EOF
Encrypted backups with rsync and GnuPG

Usage: ${prog_name} [command]

Commands:
-h, --help      Show this help menù
-s, --start     Start backup
-v, --version   Show program version
EOF
}


## Start program
start_backup() {
    check_settings

    # print information messages on log file
    printf "%s\\n" "${current_date} Backup started" >>"${log_file}"
    printf "%s\\n" "${current_date} Source directory: ${source_dir}" >>"${log_file}"
    printf "%s\\n" "${current_date} Destination directory: ${dest_dir}" >>"${log_file}"

    # set current backup filename
    # date format: `YYYY-mm-dd`
    local filename="${label}-$(date +'%Y-%m-%d')"

    # TODO: Insert rsync options in the config file
    #
    # exec rsync command:
    #
    # -ahv --delete --log-file=<file> --exclude-file=<file>
    #
    # --archive, -a            archive mode; equals -rlptgoD (no -H,-A,-X)
    # --human-readable, -h     output numbers in a human-readable format
    # --one-file-system, -x    don't cross filesystem boundaries
    # --verbose, -v            increase verbosity
    # --delete                 delete extraneous files from dest dirs
    # --log-file=FILE          log what we're doing to the specified FILE
    # --exclude-from=FILE      read exclude patterns from FILE
    #
    # rsync --help | man rsync for more information
    if ! rsync -ahxv --delete --log-file="${log_file}" --exclude-from="${exclude_file}" \
               "${source_dir}" "${dest_dir}/${filename}"; then
        die " [Error]: rsync command failed."
    fi

    # create tar/gzip archive
    cd "${dest_dir}" || exit

    if ! tar -czf "${filename}.tar.gz" "${filename}"; then
        die "[Error]: cannot create archive file."
    fi

    # encrypt backup with gpg:
    #
    # --encrypt --cipher-algo <name> --recipient <user>
    #
    # -e, --encrypt             Encrypt data
    # --cipher-algo <name>      Use <name> as cipher algorithm
    # -r, --recipient <name>    Encrypt for user id <name>
    #
    # gpg --help | man gpg for more information
    if ! gpg -e --cipher-algo AES256 -r "${gpg_uid}" "${filename}.tar.gz"; then
        die "[Error]: GnuPG encryption failed."
    fi

    # copy encrypted backup to external volume/s directories if they exists
    if [[ -d "${extdir_1}" ]]; then
        cp "${filename}.tar.gz.gpg" "${extdir_1}"
    else
        printf "%s\\n" "${current_date} [Warning]: External device not mounted" >>"${log_file}"
    fi

    if [[ -d "${extdir_2}" ]]; then
        cp "${filename}.tar.gz.gpg" "${extdir_2}"
    fi

    # delete unencrypted files from current directory
    if ! rm -rf "${filename}.tar.gz"; then
        die "[Error]: Cannot remove ${filename}.tar.gz"
    fi

    if ! rm -rf "${filename}"; then
	    die "[Error]: Cannot remove ${filename}"
    fi

    # end
    printf "%s\\n" "${current_date} [ OK ] Program successfully terminated" >>"${log_file}"
    exit 0
}


## Parse command line arguments and start program
main() {
    if [[ "$#" -eq 0 ]]; then
        usage
        exit 1
    fi

    while [[ "$#" -gt 0 ]]; do
        case "$1" in
            -h | --help)
                usage
                exit 0
                ;;
            -v | --version)
                show_version
                exit 0
                ;;
            -s | --start)
                start_backup
                ;;
            -- | -* | *)
                printf "%s\\n" "${prog_name}: Invalid option '$1'!"
                printf "%s\\n" "Try '${prog_name} --help' for more information."
                exit 1
                ;;
        esac
    done
}

main "$@"
