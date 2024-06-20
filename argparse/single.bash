ARGPARSE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$ARGPARSE_DIR/../lib/set_columns.bash"
source "$ARGPARSE_DIR/../lib/set_size.bash"

argparse_single()
{
    if [[ "$#" -ne 1 ]]; then
        printf 'Non single argument passed to argparse single: "%s"\n' "$@"
        exit 111
    fi

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
                printf 'Resizing width to %d...\n' "$1"
                set_columns "$1"
            else
                printf 'Unrecognized argument: "%s"\n' "$1"
                exit 112
            fi
            ;;
    esac
}
