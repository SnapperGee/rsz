LIB_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$LIB_DIR/../util/join_by.bash"

set_columns()
{
    if [[ "$#" -eq 0 ]]; then
        printf 'set_columns(): requires 1 argument (a width), but got 0: []\n'
        exit 7
    elif [[ "$#" -gt 1 ]]; then
        printf 'set_columns(): requires 1 argument (a width), but got %d: ["%s"]\n' "$#" "$(join_by '", "' "$@")"
        exit 8
    elif ! [[ "$1" =~ ^[0-9]+$ ]]; then
        printf 'set_columns(): Non number argument: "%s"\n' "$1"
        exit 9
    elif [[ "$1" -lt 1 ]]; then
        printf 'set_columns(): argument less than 1: "%d"\n' "$1"
        exit 10
    fi

    if [[ "$(tput cols)" -ne "$1" ]]; then
        printf '\e[8;%d;%dt' "$(tput lines)" "$1"
    fi
}
