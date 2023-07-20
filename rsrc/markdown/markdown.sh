#!/usr/bin/env bash
#
# TODO
# - refactor
#   - reduce code replication: generalise and recycle loops
#   - cli: parse arguments
#     - filters/target files

function md_fix_linestart_obsidian-tag () {
    # find lines starting with obsidian tag #... and prepend with text as some Markdown parsers
    # interpret this as headings
    #markdown/obsidian
    mapfile -t mdfiles < <(grep -irnl --include='*.md' '^#[a-z]')

    # note: array needs access by index bc. of items with ws
    for (( i=0 ; i<${#mdfiles[@]} ; i++ )); do
        f=${mdfiles[$i]}
        sed -i '/^#[a-zA-Z]/s/./Tags: &/' "$f"
    done
}

function fm_fix_tags_format () {
    # fix format of frontmatter tags: Obsidian accepts space separator - use YAML array format instead
    #markdown/frontmatter

    mapfile -t mdfiles < <(find . -name '*.md' -print0 | xargs -0 grep -il 'tags:\s\+[a-z]')

    # note: array needs access by index bc. of items with ws
    for (( i=0; i<${#mdfiles[@]} ; i++ )); do
        f=${mdfiles[$i]}
        echo $i: $f
        sed -i '/^tags:/s/\s\+/\n  - /g' "$f"
    done
}

function fm_add_if_missing () {
    # add YAML front matter if absent
    #markdown/frontmatter
    mapfile -t mdfiles < <(find . -name "*.md")
    for (( i=0 ; i<${#mdfiles[@]} ; i++ )); do
        f=${mdfiles[$i]}
        [[ "$f" =~ $1 ]] && \
            [[ ! $(head -1 "$f") =~ "---" ]] && \
            awk '{if (NR==1 && $0 !~ /^---$/) {$0="---\n---\n"$0}; print}' "$f" > "$f.tmp" && \
            mv "$f.tmp" "$f"
    done
}

function fm_update_key () {
    # update/set key: value in YAML front matter
    #markdown/frontmatter
    mapfile -t mdfiles < <(find . -name "*.md")
    for (( i=0 ; i<${#mdfiles[@]} ; i++ )); do
        f=${mdfiles[$i]}
        [[ "$f" =~ $1 ]] && \
            yq -i -f process '.'$2'="'$3'"' "$f"
        # TODO safe?
    done
}
