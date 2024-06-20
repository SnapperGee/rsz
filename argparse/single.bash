argparse_single()
{
    if [[ "$#" -lt 1 ]]; then
        printf 'argparse_single(): 1 argument required but instead got %d\n' $# >&2
        exit 111
    fi

    local DIR
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

    if [[ "$#" -gt 1 ]]; then
        source "$DIR/../util/join_by.bash"
        printf 'argparse_single(): 1 argument required but instead got %d: ["%s"]\n' $# "$(join_by '", "' "$@")" >&2
        exit 111
    fi

    source "$DIR/../lib/set_size.bash"

    case "${1,,}" in
        sm|small)
            printf 'Resizing to small(80x20)...\n'
            set_size 20 80
        ;;
        md|medium)
            printf 'Resizing to medium(90x20)...\n'
            set_size 20 90
        ;;
        lg|large)
            printf 'Resizing to large(100x20)...\n'
            set_size 20 100
        ;;
        *)
            if [[ "$1" =~ ^[0-9]+$ ]]; then
                source "$DIR/../lib/set_columns.bash"
                printf 'Resizing width to %d...\n' "$1"
                set_columns "$1"
            else
                printf 'Unrecognized argument: "%s"\n' "$1" >&2
                exit 112
            fi
        ;;
    esac
}
