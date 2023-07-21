# > files.txt;
IFS=$'\n'
for p in $(du -a music | grep .mp3)
do
	echo ${p#*	} >> files.txt;
done
