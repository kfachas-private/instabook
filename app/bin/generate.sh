#!/bin/bash

generate_routes_assets () {
  echo "Génération des routes + models"
  flutter pub run build_runner build --delete-conflicting-outputs
}

generate_intl () {
  echo "Génération des langues"
  cd i18n && flutter pub run intl_utils:generate && cd ..
}

if [[ $# -eq 0 ]] ; then
    generate_routes_assets
    exit 1
else
    for i in "$@" ; do
        if [[ $i == "--all" ]] ; then
            generate_routes_assets
            generate_intl
            break
        elif [[ $i == "--lang" ]] ; then
            generate_intl
            break
        else
          echo "Usage : no args or --all for languages generation"
        fi
    done
fi





