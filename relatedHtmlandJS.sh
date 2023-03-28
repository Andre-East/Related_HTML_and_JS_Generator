#!/bin/sh

# This is a bash tool that creates templates for relates JS and HTML file 


#This function is used to insert html doc template into the newly created file 
temp() 
{
tFile=$1
path=$2

#This echo is used to add data to the specific file 
#Note that you have to comebine '' and "" in order to key the quoted formatting for the 
#html template
echo -e '<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>'$tFile'</title>
</head>
<body>
    
    <script src="'$tFile.js'"></script>
</body>
</html>' >> "$path/$tFile.html";
}


#This function is used to copy and open template files for walkthroughs
creating()
{

#The following lines access the arguments that were passed
new=$1
path=$2

# the following lines are used to make a copy of the file 
touch "$path/$new.html"; 
touch "$path/$new.js"; 

#this line passes the file name and the path to the "temp' function in order to insert html doc temp
temp "$new" "$path"

creation="New template files created: $new.html and $new.js" 
echo $creation
notify-send "Related HTML & JS Scrip" "$creation"

# the following lines are used open the files in VScode
code "$path/$new.html";
code "$path/$new.js"; 

}

echo "*************************************************************************************"
# this line askes for the number of t file being coppied
echo "Enter name of the new file 'enter"

#this line salves the entered number
read fileName

# this line askes for the number of t file being coppied
echo "Paste the folder path below and hit 'enter'"

# this line is used to store the directory that the files will be copied to 
read path
echo "*************************************************************************************"


#these two lines create the file and path to be checked if it exists
checkerJS="$path/$fileNum.js"
checkerHTML="$path/$fileNum.html"

#this if statment checks if the each of the file exists then does not copy files but if they do not 
#it will run the copy function
if [[ -f "$checkerJS" ]] || [[ -f "$checkerHTML" ]] 
then
	error="$newFile.js and  $newFile.html exists, unable to create file"
	echo $error
	notify-send "Related HTML & JS Scrip" "$error"
	exit
else
	#this line is used to pass the input to the copy function
	creating "$fileName" "$path"
fi