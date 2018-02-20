# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles

##### Variables

dir=~/dotfiles
olddir=~/dotfiles_old
files="taskrc vimrc tmux.conf zshrc"

#####

#create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

#change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

#move existing dotfiles to dotfiles_old directory and then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
  echo "Moving and existing dotfiles from ~ to $olddir"
  mv ~/.$file ~/dotfiles_old/
  echo "Creating symlink to $file in home directory"
  ln -s $dir/$file ~/.$file
done
