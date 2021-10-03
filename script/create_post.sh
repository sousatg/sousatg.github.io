#!/bin/sh

write_post_header_tpl() {
    echo "---" >> "${1}"
    echo "layout: post" >> "${1}"
    echo "title: " >> "${1}"
    echo "summary: " >> "${1}"
    echo "---" >> "${1}"

    return 0
}

write_project_header_tpl() {
    echo "---" >> "${1}"
    echo "layout: post" >> "${1}"
    echo "title: " >> "${1}"
    echo "link: " >> "${1}"
    echo "---" >> "${1}"

    return 0
}

read -p "Filename: " filename
current_date=`date +"%Y-%m-%d"`
new_post_path="${1}/${current_date}-${filename}.md"

if test -f "$new_post_path"; then
    echo "$new_post_path exists."
    exit 1
fi

touch $new_post_path

if [ $1 == '_posts' ]
then
    write_post_header_tpl $new_post_path
else
    write_project_header_tpl $new_post_path
fi
