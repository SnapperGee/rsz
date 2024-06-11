argparse_double()
{
    if [[ "$#" -ne 2 ]]; then
        printf 'Non double argument passed to argparse double: "%s"\n' "$*"
        exit 22
    fi

    case "${1,,}" in
        w|width)
            if ! [[ "$2" =~ ^[0-9]+$ ]]; then
                printf 'Non number passed as width: "%s"\n' "$2"
                exit 33
            fi
            printf 'Resizing width to %d...\n' "$2"
            printf '\e[8;%d;%dt' "$(tput lines)" "$2"
            ;;
        'w+'|'width+')
            if ! [[ "$2" =~ ^[0-9]+$ ]]; then
                printf 'Non number passed as width increase: "%s"\n' "$2"
                exit 88
            fi
            local new_width="$(($(tput cols) + "$2"))"
            printf 'Incerasing width by %d to %d...\n' "$2" "$new_width"
            printf '\e[8;%d;%dt' "$(tput lines)" "$new_width"
            ;;
        w-|width-)
            if ! [[ "$2" =~ ^[0-9]+$ ]]; then
                printf 'Non number passed as width decrease: "%s"\n' "$2"
                exit 99
            fi
            local new_width="$(($(tput cols) - "$2"))"
            printf 'Decerasing width by %d to %d...\n' "$2" "$new_width"
            printf '\e[8;%d;%dt' "$(tput lines)" "$new_width"
            ;;
        h|height)
            if ! [[ "$2" =~ ^[0-9]+$ ]]; then
                printf 'Non number passed as height: "%s"\n' "$2"
                exit 44
            fi
            printf 'Resizing height to %d...\n' "$2"
            printf '\e[8;%d;%dt' "$2" "$(tput cols)"
            ;;
        'h+'|'height+')
            if ! [[ "$2" =~ ^[0-9]+$ ]]; then
                printf 'Non number passed as height increase: "%s"\n' "$2"
                exit 77
            fi
            local new_height="$(($(tput lines) + "$2"))"
            printf 'Incerasing height by %d to %d...\n' "$2" "$new_height"
            printf '\e[8;%d;%dt' "$new_height" "$(tput cols)"
            ;;
        h-|height-)
            if ! [[ "$2" =~ ^[0-9]+$ ]]; then
                printf 'Non number passed as height decrease: "%s"\n' "$2"
                exit 121
            fi
            local new_height="$(($(tput lines) - "$2"))"
            printf 'Decerasing height by %d to %d...\n' "$2" "$new_height"
            printf '\e[8;%d;%dt' "$new_height" "$(tput cols)"
            ;;
        *)
            if ! [[ "$1" =~ ^[0-9]+$ ]]; then
                printf 'Non number passed as width: "%s"\n' "$1"
                exit 33
            elif ! [[ "$2" =~ ^[0-9]+$ ]]; then
                printf 'Non number passed as height: "%s"\n' "$2"
                exit 44
            fi
            printf 'Resizing to %dx%d...\n' "$2" "$1"
            printf '\e[8;%d;%dt' "$2" "$1"
            ;;
    esac
}
