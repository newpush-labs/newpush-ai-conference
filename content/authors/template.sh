#!/bin/bash

export IFS=$'\n'

NAMES='Dr. Deli Gergely
Tari Annamária
Éva Hegedüs
Dr. Mária Kőrösi
Michelle Watson
Sreedhar Kajeepeta
Dr. Levendovszky János
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
Kristóf Takács
Réka Szemerkényi
Sandeep Kaur
Mihály Zala 
Dr. Peter S. Szabó
Mármarosi Balázs
Dr. Szabó Gergely'


# Andrew Várfi
# Dr. Levente Kovács
# Kristóf Takács
# Dr. László Kovács
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
    # if [ ! -f "./$NAME/avatar.jpg" -a -f "./$NAME/image.png" ]; then
    if [ ! -f "./$NAME/avatar.jpg" ]; then
        rm "./$NAME/avatar.jpg"
        
        echo "Cropping $NAME/image.png to avatar.jpg"
        # convert "./$NAME/image.png" -resize 700x500 "./$NAME/avatar.jpg"

        magick convert "./$NAME/image.png" -gravity Center -crop 2:3 +repage "./$NAME/avatar.jpg"


        # if [ ! -d "./$NAME/cropped" ]; then
        #     rm -rf "./$NAME/cropped"
        # fi

        # if [ ! -d "./$NAME/cropped" ]; then
        #     mkdir "./$NAME/cropped"
        # fi
        # autocrop -i "./$NAME/" -o "./$NAME/cropped" -w 750 -H 500 -e jpg --facePercent 1

        # cp "./$NAME/cropped/image.jpg" "./$NAME/avatar.jpg"
    fi


done
