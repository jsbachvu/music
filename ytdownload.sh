while IFS="" read -r p || [ -n "$p" ]
do
printf 'Downloading --- %s\n' "$p";
youtube-dl --ignore-errors -f bestaudio --extract-audio --audio-format mp3 --audio-quality 0 -o 'music/%(playlist)s/%(playlist_index)s-%(title)s.%(ext)s' "$p";
done < list.txt