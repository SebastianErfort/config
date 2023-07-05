BEGIN {
    if ( !indent ) { indent=2 }
    indp=0
}
# Front matter
/---/{ if (NR==1) {fm=1} else {fm=0} }
# Fenced code blocks
/```/{ cb++ }
# Skip front matter and code blocks
{
    if ( !fm && ( cb % 2 == 0 ) ) {
        l=$0; sub(/^\s*/,"",l) # line without indentation
        indc=length($0)-length(l) # current indentation
        indd=indc - indp # indentation difference
        if ( indd > 0 ) {
            if ( indd != indent ) {
                $0 = sprintf("%" indp+indent+length(l) "s", l)
            } else { indp=indc }
        } else { indp=indc }
    }
    { print }
}
