argparse_single()
{
    if [[ "$#" -ne 1 ]]; then
        printf 'Non single argument passed to argparse single: "%s"\n' "$@"
        exit 11
    fi

    case "${1,,}" in
        sm|small)
            printf 'Resizing to small(80x20)...\n'
            printf '\e[8;20;80t'
            ;;
        md|medium)
            printf 'Resizing to medium(90x20)...\n'
            printf '\e[8;20;90t'
            ;;
        lg|large)
            printf 'Resizing to large(100x20)...\n'
            printf '\e[8;20;100t'
            ;;
        *)
            if [[ "$1" =~ ^[0-9]+$ ]]; then
                printf 'Resizing width to %d...\n' "$1"
                printf '\e[8;%d;%dt' "$(tput lines)" "$1"
            else
                printf 'Unrecognized argument(s): "%s"\n' "$1"
                exit 111
            fi
            ;;
    esac
}
