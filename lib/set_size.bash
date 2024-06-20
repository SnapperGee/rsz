set_size()
{
    if [[ $# -ne 2 ]]; then

        local DIR
        DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
        source "$DIR/../util/join_by.bash"

        local errMsg='set_size() requires 2 arguments (a width and height), but got'

        case $# in
            0)
                printf '%s %d: %s\n' "$errMsg" $# '[]'
            ;;
            1)
                printf '%s %d: "%s"\n' "$errMsg" $# "$1"
            ;;
            *)
                printf '%s %d: ["%s"]\n' "$errMsg" $# "$(join_by '", "' "$@")"
            ;;
        esac

        exit 2
    elif ! [[ $1 =~ ^[0-9]+$ ]]; then
        printf 'Non number passed as 1st argument to set_size(): "%s"\n' "$1" >&2
        exit 3
    elif ! [[ $2 =~ ^[0-9]+$ ]]; then
        printf 'Non number passed as 2nd argument to set_columns: "%s"\n' "$2" >&2
        exit 4
    elif [[ $1 -lt 1 ]]; then
        printf 'set_size(): width value less than 1: "%d"\n' "$1" >&2
        exit 5
    elif [[ $2 -lt 1 ]]; then
        printf 'set_size(): height value less than 1: "%d"\n' "$2" >&2
        exit 6
    fi

    printf '\e[8;%d;%dt' "$1" "$2"
}
