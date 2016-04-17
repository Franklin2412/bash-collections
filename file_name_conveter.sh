#!/bin/bash

#for n in *.mp3
#do if [[ "$n" =~ -[-_0-9a-zA-Z]{11}.mp3$ ]]
#   then echo "youtube ${n: -15: 11}" >> downloaded.txt
#   fi
#done

#for n in *.mp4; do if [[ "$n" =~ -[-_0-9a-zA-Z]{11}.mp4$ ]]; then echo "youtube ${n: #-15: 11}" >> downloaded.txt;fi;done
#youtube-dl --download-archive downloaded.txt -cita toDownload.txt 

#youtube-dl --download-archive downloaded.txt --no-post-overwrites -ciwx --audio-#format mp3 -o "%(title)s.%(ext)s" [path here]


# for f in *
 	# do mv "$f" "`echo $f | tr "[:upper:]" "[:lower:]"`";
 	# do mv "$f" "${f//[[:digit:]]/}"
 	# do mv "$f" "$f"3
 	# do mv "$f" "${f:22}"
# done

# convert all to lower case
# for f in *; do mv "$f" "`echo $f | tr "[:upper:]" "[:lower:]"`"; done

# remove all the digits from the name
# for f in *; do mv "$f" "${f//[[:digit:]]/}"; done
# for f in *; do mv "$f" "${f/[0-9][0-9]/}"; done

# append 3 with the name
# for f in *; do mv "$f" "$f"3; done
# for f in *; do mv "$f" "$f".mp4; done

# replace _ with space
# for f in *; do mv "$f" "${f//_/ }"; done

# remove leading space
# for f in *; do mv "$f" "${f/ /}"; done

# Removes leading n char
# for f in *; do mv "$f" "${f:28}"; done

# Removes traling n char
# for f in *; do mv "$f" "${f:0:${#f}-15}" ; done

# for f in *; do mv "$f" "${f:0:${#f}-27}.mp4" ; done

# remove the !!s.mp3 from file name
# for f in *; do mv "$f" "${f/\!\!s\.mp3/}"; done

# removes the .!!s from mp3
# for f in *; do mv "$f" "${f/.\!\!s/}"; done
# for f in *; do mv "$f" "${f/..\!\!s/}"; done

# for f in *; do mv "$f" "${f/ \(tamil keerthanaigal collections\)\-/}"; done

# replace .. with .
# for f in *;do mv "$f" "${f/./}"; done


# convert mp4 to mp3
# for f in *;do ffmpeg -i "$f" -acodec libmp3lame -ab 128k "${f/.mp4/}.mp3"; done

#mkv to mp4


# ffmpeg -y -i ip.mkv -vcodec libx264 -acodec libvo_aacenc op.mp4

# ffmpeg -y -i ip.mkv -vcodec libx264 -acodec libvo_aacenc -b:a 92k op.mp4

# ffmpeg -y -i ip.mkv -vcodec libx264 -acodec libvo_aacenc -b:a 92k -r 30 op.mp4

# for mobile specific mkv to mp4 with less screen size
# ffmpeg -y -i ip.mkv -s 400x240 -vcodec libx264 -acodec libvo_aacenc -b:a 92k op.mp4


#for f in *;do ffmpeg -y -i "$f" -s 400x240 -vcodec libx264 -acodec libvo_aacenc -b:a 92k "${f/.mkv/}.mp4"; done
