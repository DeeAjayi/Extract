#!/bin/bash
# function Extract for common file formats

 if [ -z "$1" ] || [ -z "$2" ]; then
    # display usage if no parameters given
    echo "Usage: xcomp <path|file_name> <compressed_filename>.<extension>"
    echo "  available extensions: <zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
 else
    if [ -f "$1" ] || [ -d "$1" ]; then
        #NAME=${1%.*}
        #mkdir $NAME && cd $NAME
        case "$2" in
          *.tar.bz2)   tar cvjf ./"$1.$2" ./"$1"    ;;
          *.tar.gz)    tar cvzf ./"$1.$2" ./"$1"    ;;
          *.tar.xz)    tar cvJf ./"$1.$2" ./"$1"    ;;
          #*.lzma)      unlzma ./"$1"      ;;
          *.bz2)       bzip2 -k ./"$1"    ;;
          #*.rar)       unrar x -ad ./"$1" ;;
          #*.gz)        gunzip ./"$1"      ;;
          *.tar)       tar cvf ./"$1.$2" ./"$1"     ;;
          *.tbz2)      tar cvjf ./"$1.$2" ./"$1"    ;;
          *.tgz)       tar cvzf ./"$1.$2" ./"$1"    ;;
          *.zip)       zip -r ./"$1.zip" ./"$1"       ;;
          #*.Z)         uncompress ./"$1"  ;;
          #*.7z)        7z x ./"$1"        ;;
          #*.xz)        unxz ./"$1"        ;;
          #*.exe)       cabextract ./"$1"  ;;
          *)           echo "extract: '$1' - unknown archive method" ;;
        esac
    else
        echo "'$1' - file does not exist"
    fi
fi
