while IFS="" read -r p || [ -n "$p" ]
do
	printf 'Downloading --- %s\n' "$p";
	yt-dlp --ignore-errors -f bestaudio --extract-audio --audio-format mp3 --audio-quality 0 -o 'music/%(playlist)s/%(playlist_index)s-%(title)s.%(ext)s' "$p";
done < list.txt

>files.txt;
IFS=$'\n'
for p in $(du -a music | grep .mp3)
do
	echo ${p#*	} >> files.txt;
done

git add .
git commit -m "add album"
git push
