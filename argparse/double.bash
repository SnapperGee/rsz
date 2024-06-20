argparse_double()
{
    if [[ $# -eq 0 ]]; then
        printf 'argparse_double(): 2 arguments required but got 0' >&2
        exit 21
    fi

    if [[ $# -eq 1 ]]; then
        printf 'argparse_double(): 2 arguments required but got 1: "%s"' $# "$1" >&2
        exit 21
    fi

    local DIR
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

    if [[ $# -gt 2 ]]; then

        source "$DIR/../util/join_by.bash"

        printf 'argparse_double(): 2 arguments required but got %d: ["%s"]' $# "$(join_by '", "' "$@")" >&2
        exit 21
    fi

    source "$DIR/../lib/set_columns.bash"
    source "$DIR/../lib/set_rows.bash"

    case "${1,,}" in
        w|width)
            if ! [[ $2 =~ ^[0-9]+$ ]]; then
                printf 'Non number passed as width: "%s"\n' "$2" >&2
                exit 22
            fi
            printf 'Resizing width to %d...\n' "$2"
            set_columns "$2"
        ;;
        'w+'|'width+')
            if ! [[ $2 =~ ^[0-9]+$ ]]; then
                printf 'Non number passed as width increase: "%s"\n' "$2" >&2
                exit 23
            fi
            local new_width="$(($(tput cols) + $2))"
            printf 'Incerasing width by %d to %d...\n' "$2" "$new_width"
            set_columns "$new_width"
        ;;
        w-|width-)
            if ! [[ $2 =~ ^[0-9]+$ ]]; then
                printf 'Non number passed as width decrease: "%s"\n' "$2" >&2
                exit 24
            fi
            local new_width="$(($(tput cols) - $2))"
            printf 'Decerasing width by %d to %d...\n' "$2" "$new_width"
            set_columns "$new_width"
        ;;
        h|height)
            if ! [[ $2 =~ ^[0-9]+$ ]]; then
                printf 'Non number passed as height: "%s"\n' "$2" >&2
                exit 25
            fi
            printf 'Resizing height to %d...\n' "$2"
            set_rows "$2"
        ;;
        'h+'|'height+')
            if ! [[ $2 =~ ^[0-9]+$ ]]; then
                printf 'Non number passed as height increase: "%s"\n' "$2" >&2
                exit 26
            fi
            local new_height="$(($(tput lines) + $2))"
            printf 'Incerasing height by %d to %d...\n' "$2" "$new_height"
            set_rows "$new_height"
        ;;
        h-|height-)
            if ! [[ $2 =~ ^[0-9]+$ ]]; then
                printf 'Non number passed as height decrease: "%s"\n' "$2" >&2
                exit 27
            fi
            local new_height="$(($(tput lines) - $2))"
            printf 'Decerasing height by %d to %d...\n' "$2" "$new_height"
            set_rows "$new_height"
        ;;
        *)
            source "$DIR/../lib/set_size.bash"

            if ! [[ "$1" =~ ^[0-9]+$ ]]; then
                printf 'Non number passed as width: "%s"\n' "$1" >&2
                exit 28
            elif ! [[ $2 =~ ^[0-9]+$ ]]; then
                printf 'Non number passed as height: "%s"\n' "$2" >&2
                exit 29
            fi
            printf 'Resizing to %dx%d...\n' "$2" "$1"
            set_size "$2" "$1"
        ;;
    esac
}
