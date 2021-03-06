#!/usr/bin/env zsh

{
cat <<EOF
com.microsoft.VSCode:markdown
com.microsoft.VSCode:md
com.microsoft.VSCode:sh
com.microsoft.VSCode:text
com.microsoft.VSCode:txt
com.microsoft.VSCode:xml
com.microsoft.VSCode:cpp
com.microsoft.VSCode:h
com.microsoft.VSCode:cc
com.microsoft.VSCode:java
com.microsoft.VSCode:rs
com.microsoft.VSCode:m
com.microsoft.VSCode:mm
com.microsoft.VSCode:ts
com.microsoft.VSCode:js
com.microsoft.VSCode:css
com.microsoft.VSCode:less
com.microsoft.VSCode:html
com.microsoft.VSCode:json
com.microsoft.VSCode:py
com.microsoft.VSCode:kt
EOF
} |
while IFS=$':' read bundle_id extension ; do
  /System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -dump | grep $bundle_id > /dev/null
  if test $? -eq 1 ; then
    echo "$bundle_id doesn't exist! Fix the script!"
    exit
  else
    echo -e "Changing $extension so it opens with $bundle_id …"
    duti -s $bundle_id .$extension all
  fi
done
