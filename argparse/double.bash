argparse_double()
{
    local DIR
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

    source "$DIR/../lib/set_columns.bash"
    source "$DIR/../lib/set_rows.bash"
    source "$DIR/../lib/set_size.bash"

    if [[ "$#" -ne 2 ]]; then
        printf 'Non double argument passed to argparse double: "%s"\n' "$*" >&2
        exit 21
    fi

    case "${1,,}" in
        w|width)
            if ! [[ "$2" =~ ^[0-9]+$ ]]; then
                printf 'Non number passed as width: "%s"\n' "$2" >&2
                exit 22
            fi
            printf 'Resizing width to %d...\n' "$2"
            set_columns "$2"
        ;;
        'w+'|'width+')
            if ! [[ "$2" =~ ^[0-9]+$ ]]; then
                printf 'Non number passed as width increase: "%s"\n' "$2" >&2
                exit 23
            fi
            local new_width="$(($(tput cols) + "$2"))"
            printf 'Incerasing width by %d to %d...\n' "$2" "$new_width"
            set_columns "$new_width"
        ;;
        w-|width-)
            if ! [[ "$2" =~ ^[0-9]+$ ]]; then
                printf 'Non number passed as width decrease: "%s"\n' "$2" >&2
                exit 24
            fi
            local new_width="$(($(tput cols) - "$2"))"
            printf 'Decerasing width by %d to %d...\n' "$2" "$new_width"
            set_columns "$new_width"
        ;;
        h|height)
            if ! [[ "$2" =~ ^[0-9]+$ ]]; then
                printf 'Non number passed as height: "%s"\n' "$2" >&2
                exit 25
            fi
            printf 'Resizing height to %d...\n' "$2"
            set_rows "$2"
        ;;
        'h+'|'height+')
            if ! [[ "$2" =~ ^[0-9]+$ ]]; then
                printf 'Non number passed as height increase: "%s"\n' "$2" >&2
                exit 26
            fi
            local new_height="$(($(tput lines) + "$2"))"
            printf 'Incerasing height by %d to %d...\n' "$2" "$new_height"
            set_rows "$new_height"
        ;;
        h-|height-)
            if ! [[ "$2" =~ ^[0-9]+$ ]]; then
                printf 'Non number passed as height decrease: "%s"\n' "$2" >&2
                exit 27
            fi
            local new_height="$(($(tput lines) - "$2"))"
            printf 'Decerasing height by %d to %d...\n' "$2" "$new_height"
            set_rows "$new_height"
        ;;
        *)
            if ! [[ "$1" =~ ^[0-9]+$ ]]; then
                printf 'Non number passed as width: "%s"\n' "$1" >&2
                exit 28
            elif ! [[ "$2" =~ ^[0-9]+$ ]]; then
                printf 'Non number passed as height: "%s"\n' "$2" >&2
                exit 29
            fi
            printf 'Resizing to %dx%d...\n' "$2" "$1"
            set_size "$2" "$1"
        ;;
    esac
}
