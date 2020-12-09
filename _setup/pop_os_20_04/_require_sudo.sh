require_sudo() {
	[[ $EUID -eq 0 ]] || exec sudo "$0" $(printf '%q ' "$@")
}
