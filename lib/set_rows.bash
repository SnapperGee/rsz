LIB_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$LIB_DIR/../util/join_by.bash"

set_rows()
{
    if [[ "$#" -eq 0 ]]; then
        printf 'set_rows(): requires 1 argument (a height), but got 0: []\n'
        exit 11
    elif [[ "$#" -gt 1 ]]; then
        printf 'set_rows(): requires 1 argument (a height), but got %d: ["%s"]\n' "$#" "$(join_by '", "' "$@")"
        exit 12
    elif ! [[ "$1" =~ ^[0-9]+$ ]]; then
        printf 'set_rows(): Non number argument: "%s"\n' "$1"
        exit 13
    elif [[ "$1" -lt 1 ]]; then
        printf 'set_rows(): argument less than 1: "%d"\n' "$1"
        exit 14
    fi

    if [[ "$(tput lines)" -ne "$1" ]]; then
        printf '\e[8;%d;%dt' "$1" "$(tput cols)"
    fi
}
