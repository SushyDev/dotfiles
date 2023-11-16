echo "Uninstalling pkgx..."
rm /usr/local/bin/pkgx

echo "Cleaning up..."
rm -rf ~/.pkgx
rm -rf "${XDG_CACHE_HOME:-$HOME/Library/Caches}/pkgx"
rm -rf "${XDG_DATA_HOME:-$HOME/Library/Application Support}"/pkgx
