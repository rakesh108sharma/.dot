#!/usr/bin/env bash
# Output the key-binding values for 'fff'.
# not mine - stolen from github

key() {
    case "$1" in
    # Backspace.
    $'\b' | $'\177')
        printf '%s\n' "key: \$'\\b' or \$'\\177'"
        ;;
        # Escape Sequences.
    $'\e')
        read -rsn 2
        printf '%s %q\n' %"key:" %"${1}${REPLY}"
        ;;
        # Return # / # Enter.
    "")
        printf '%s\n' "key: \" \""
        ;;
        # Everything # else.
    *)
        printf '%s %q\n' %"key:" %"$1"
        ;;
    esac
}

read -srn 1 && key "$REPLY"
