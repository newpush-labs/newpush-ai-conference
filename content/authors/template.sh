#!/bin/bash

export IFS=$'\n'

NAMES='Dr. Deli Gergely
Tari Annamária
Éva Hegedüs
Dr. Mária Kőrösi
Michelle Watson
Sreedhar Kajeepeta
Dr. Levendovszky János
Dr. László Kovács
Dr. György Tilesch
Levente Juhász
Géza Jeszenszky
Ferenc Krausz
Balázs Scheidler
Dr. Miklós Verseghi-Nagy
Johannes Bernhardt
Mark Johnson
Theodore S. Boone
Joshua Voglestein
András Cser
Cyril Gollain
Balázs Marmarosi
Dr. Gábor Proszéky
Dr. György Eigner
Dr. Péter Iványi
Balázs Nagy
László Dellei
László Rácz
Sandeep Kaur'
# Andrew Várfi
# Dr. Levente Kovács
# Kristóf Takács
# Kinga Daradics

for NAME in $NAMES; do
    if [ ! -d "./$NAME" ]; then
        echo "Creating directory for $NAME"
        mkdir -p "./$NAME"
    fi

    if [ ! -f "./$NAME/_index.md" ]; then
        echo "Creating $NAME/_index.md"
        cat ./template/_index.md.tmp | sed "s/DISPLAY_NAME/$NAME/" > "./$NAME/_index.md"
    fi

    # use convert to convert image.png to avatar.jpg
    if [ ! -f "./$NAME/avatar.jpg" -a -f "./$NAME/image.png" ]; then
        echo "Converting $NAME/image.png to avatar.jpg"
        convert "./$NAME/image.png" -resize 200x200 "./$NAME/avatar.jpg"
    fi


done
