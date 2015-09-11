# DDay

Git Push Command

#setup your local Git profile - In the terminal:

	git config --global user.name "faeriay"
	git config --global user.email "faeriay@gmail.com"

#Initialize the local directory as a Git repository.

	git init

#Add the files in your new local repository. This stages them for the first commit.

	git add .

#Commit the files that you've staged in your local repository.

	git commit -m 'First commit'

#In the Command prompt, add the URL for the remote repository where your local repository will be pushed.

	git remote add origin https://github.com/faeriay/DDay.git


#Push the changes in your local repository to GitHub.

	git push origin master
