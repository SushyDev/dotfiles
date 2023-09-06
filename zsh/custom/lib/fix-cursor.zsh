function _fix_cursor() {
   echo -ne '\e[5 q'
}

precmd_functions+=(_fix_cursor)
