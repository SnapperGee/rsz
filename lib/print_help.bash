print_help()
{
    if command -v groff &> /dev/null; then

        local DIR
        DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

        groff -T ascii -mdoc "$DIR/../man/rsz.1"
    else
        printf 'Non groff help command text pending implementation...\n'
    fi
}
