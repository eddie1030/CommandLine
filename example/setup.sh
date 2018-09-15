#!/bin/bash

# This basic shell script automates the setup of a web development environment on your local computer
# 
# 1. create ssh keys for easy access to git
# 2. create the folder structure for web development projects
# 3. create a dummy project with starter files (index.html, style.css)
# 4. create another shell script to automate the initial git connection

### STEP ONE ###
##
# setting up git involves setting up a ssh private/public keypair.
# to read how it works, start wit the wikipedia page on ssh.

echo "step one, generate the keypair and put a copy of the public key in your HOME for easy distribution"
echo ""

# the name of the directory created in the home dir, where you can store your development projects.
# make sure this name is unique to the other directories in your HOME.

DEV_DIR="hyfdev" # this declaration is called a variable, where DEV_DIR is the variable, and "hyfdev" the value.

# define more variables.
SSH_DIR=$HOME/.ssh/id_rsa.pub
PUBKEY=$HOME/public-key.txt

# determine if there's already an ssh key present
#! [ see hyf Lecture-2.md : Pipe ]
PREV_SSHKEY=$(ls ~/.ssh/id_rsa.pub | wc -l) # list file "id_rsa.pub" and count the output lines with "wc -l"
PREV_PUBKEY=$(ls ~/public-key.txt | wc -l)

# if there's already a ssh  key, don't generate a new one. To figure this out we can use an "if else" statement.
# if the count of the variable is not 1 (so, 0), there's no file called id_rsa.pub yet
# so we want to generate one with "ssh-keygen", otherwise we say the key already exists
if [ "$PREV_SSHKEY" != 1 ] ; then
	ssh-keygen
else
	echo "key already exists"
	
fi
echo ""

# if there's a copy present in the home, don't copy again
# same principle as above
if [ "$PREV_PUBKEY" != 1 ] ; then
	cp -i $SSH_DIR $PUBKEY
else
	echo "pubkey already exists"
	
fi
# output the result in a readable format
echo ""
echo "Your user is " $USER " and public key is: "
echo ""
cat $PUBKEY
echo ""
echo "copy-paste this key to your git server ( most likely github or gitlab )"
echo ""

### STEP TWO ###
##
#
echo "step two, create a git project directory and populate it with some starter files"
# the read command can take user input and store it in a variable. 
# this way you can use user input further in your script.
read -p "Name your first project: " P_NAME

# unlike above, we will now define a specific task in a function. 
# This way we can create separate functions and move away from linear execution.
# with this function we'll create the folder structure for our web project.

function createFolders() {

	# check if developmentfolder exits, if so, abort.
	DEV_CHECK=$( ls -d $HOME/$DEV_DIR | wc -l )
	
	# define subfolders to the project folder
	# you can edit this list to suit your needs
	SUB_LIST=(
		"site"
		"site/css"
		"site/js"
		"app"
		"docs"
		"logs"
	)

	if [ "$DEV_CHECK" != 1 ]; then
	
		# ask the user to input a project name for the folder

		DEV_ROOT="$HOME/$DEV_DIR/"

		echo "creating directories..."
		mkdir -p $DEV_ROOT/$P_NAME
		
		# create the folders from the list in your project folder.
		# for this we use a for loop.
		# notice the strange notation for the variable SUB_LIST, with the @ sign to represent all items in the list.
		for X in ${SUB_LIST[@]}; do
			mkdir -p $DEV_ROOT/$P_NAME/$X
		done
	
		# list the new directories	
		PROJECT="$DEV_ROOT/$P_NAME"
		ls -l $PROJECT
	
	else
		echo "folder $DEV_DIR already exists"
	fi
	echo ""

}

### STEP THREE ###
##
#
# in this function we define the actions to create all the files

function createFiles() {
	
	echo "creating files"
	# go to the project directory
	P_DIR="$HOME/$DEV_DIR/$P_NAME"

	# create the file index.html by echo'ing the content and redirecting the output into a file.
	# this works, but is merely an illustration. There exist better ways to template files.
	# nevertheless, you can edit the template below to match your needs.
	echo "
<!DOCTYPE html>
	<head>
		<meta charset="utf-8" />
		<title>$P_NAME</title>
		<link rel="stylesheet" href="css/style.css" />
	</head>
	<body>
		<h3>under construction</h3>
		<p>project by $USER</p>

	</body>
</html>
	" > $P_DIR/site/index.html
	#! [ see hyf Lecture-2.md : output redirection ]
	###

	# create the file style.css, the same way as we did for index.html
	echo "
html {

}

body {
	text-align:center;
}

	" > $P_DIR/site/css/style.css
	###

	# create the README.md file, this file is used to contain the summary of your project.
	echo "
This is the readme file for my new project called 
	
						- $P_NAME -
	" > $P_DIR/README.md
	###

	# create the git.sh file, a shell script to setup git that also contains some tips for commands
	# it's a pretty long script, take your time to read it through.
	# some " are escaped by \ ( echo \" .. ) , this is to avoid the " character to be interpreted by the
	# computer as a special character, and just print the ".
	echo "
#!/bin/bash

echo \"step four, making the project folder a git repository, so we can sync it with our git server to track progress and collaborate with others\"

read -p \"What is the url of your github repository? \" URL

## this function is used only for the first git initialization of your project
function initGit() {
	
	P_DIR="$HOME/$DEV_DIR/$P_NAME"
	cd $P_DIR
	git init
	git add .
	git commit -m \"Initial commit!\"
	git remote add origin \$URL
	git push -u origin master


}

initGit

echo ""
echo "Now your project is also on github!"
echo ""
echo ""

## tip !!
#
# for new commits the most simple sequence is
# git status ( see what has changed )
# git add <modified/new files>
# git commit -m "your message"
# git push

	" > $P_DIR/docs/git.sh

	# after the script is created, it has to be made executable. Check "man chmod"
	chmod +x $P_DIR/docs/git.sh
}

## execute the functions.
createFolders
echo "step three, add some files to the folders"
createFiles
echo ""
