[ ! "$(command -v pkgx)" ] && eval "$(curl -Ssf https://pkgx.sh)"

eval "$(pkgx --shellcode)"
