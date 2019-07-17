#!/bin/bash
texto=$(cat text.txt)
#echo $texto
FinalArray=();
IFS='.' read -ra ADDR <<< "$texto"
for i in "${ADDR[@]}"; 
do

    line="$i"
    #echo $line
    line="${line,,}"
    #echo $line
    other="${line:0:1}"
    #echo $other
    if [ "$other" = " " ];
    then
        foo=${line:1};
        #echo ${line:0:1}${foo^}
        arr="${line:0:1}${foo^}"
        FinalArray=("${FinalArray[@]}" "$arr"".")
    else
        line=" ${line^}"
        #echo $line
        FinalArray=("${FinalArray[@]}" "$line"".")
    fi
    
done <<< "$texto"
echo ${FinalArray[@]}
{ printf '%s\n' "${FinalArray[@]}"; } > new.txt #new.txt exist in the same file with typo.sh