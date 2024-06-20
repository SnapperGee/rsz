print_help()
{
    local DIR
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

    if command -v groff &> /dev/null; then
        printf '%s\n' "$(groff -T ascii -mdoc "$DIR/../man/rsz.1")"
    else
        printf 'Non groff help command text pending implementation...'
    fi
}
