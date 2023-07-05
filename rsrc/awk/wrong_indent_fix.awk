# TODO
# - successive lines with wrong indentation: only first is fixed
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
        l=$0
        sub(/^\s*/,"",l)
        indc=length($0)-length(l) # current indentation
        indd=indc - indp # indentation difference
        if ( indd > 0 ) {
            if ( indd != indent ) {
                printf("%" indp+indent+length(l) "s\n", l)
            } else { print }
        } else { print }
        indp=indc # previous indentation
    } else { print }
}
