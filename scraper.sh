#!/bin/bash
[[ -z urls.txt ]] || "Please paste urls in urls.txt" ; exit 2
URLS=$(cat urls.txt)


for URL in $URLS
	do
          BASEURL=$(echo $URL | awk -F'/v' '{print $1}')
	  DLURL=$(/opt/google/chrome/chrome --headless --disable-gpu --dump-dom $URL 2>/dev/null | grep part | awk -F'href=' '{ print $2}' | grep '/d/' | sed 's/"//g;s/>//g')
	  echo $BASEURL$DLURL >> outputurls.txt
done

cat outputurls.txt
