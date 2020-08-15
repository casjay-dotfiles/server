mkd() {
    if [[ "$#" -eq 0 ]]; then
        echo "$0: Missing operand"
        return 1
    elif [[ "$#" -gt 1 ]]; then
        echo "$0: Too many arguments"
        return 1
    fi
    mkdir -p "$1"
    cd "$1"
}
