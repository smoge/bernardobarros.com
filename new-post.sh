#!/bin/sh

author="Bernardo Barros"

type=$(zenity --list --title="What kind of publication?" \
    --column="number" --column="type" \
    1 "Event" \
    2 "News" \
)
echo $type

title=$(zenity --entry --title="Title" --text="What is the title?" --width=600)
echo $title


case "$type" in
    1)  type_string="events"
	date_pattern=$(zenity --calendar --date-format="%Y-%m-%d")
	echo $date_pattern
	;;
    2)  type_string="news"
	date_pattern=$(TZ='America/New_York' date +"%Y-%m-%d")
	;;
    *) echo "ERROR"
	;;
esac

echo $type_string

clean_title=`echo $title | tr "[:upper:]" "[:lower:]"] | iconv -f utf-8 -t ascii//translit | tr -dc "[a-z0-9 ]" | tr " " "-"` 

filename="${date_pattern}-${clean_title}.markdown"

echo $filename

cat > "${type_string}/${filename}" <<EOF
---
title: $title
author: $author
tags:
---

EOF

emacs "${type_string}/${filename}"
echo "FILE:"
cat "${type_string}/${filename}"

