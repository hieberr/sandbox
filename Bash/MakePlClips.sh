#!/bin/bash
#This script converts the audio files output by Reaper (with the bpm, tempo, key, as "_" separated
#parameters in the name to a wav file and a text file which contains the parameters.
#
#Run this in a folder full of PLClip wave files (named with the format NAME_X_X_X.wav)
#This script will rename each file NAME.wav and create a text file named NAME.txt
#In that text file will be placed the original name of the audio file "NAME_X_X_X"

assetExtension=".wav";
infoExtension=".txt";

for file in *.wav
do
#basename strips off the file extension from $file
 clipInfo=$(basename "$file" $assetExtension);
 outputFolder="output/";
 newName="$( cut -d '_' -f 1 <<< "$clipInfo" )";

 newAssetFile=$outputFolder$newName$assetExtension;
 newInfoFile=$outputFolder$newName$infoExtension;

 mkdir -p $outputFolder;

 echo "Creating:""$newInfoFile";

 echo $clipInfo > "$newInfoFile";
 echo "copying:""$file"" to ""$newAssetFile";
 cp "$file" "$newAssetFile";

done
