#!/usr/bin/env zsh

# Backup existing (if exists) and install dotfile
# usage: install_dotifle {dotfile}

# dotfile => install directory
declare -A dotfile_map=(
  ".gitconfig" "$HOME"
  ".zshrc" "$HOME"
)

echo $0
local dotfile=$1
local dotfile_path=$( cd -- "$(dirname "$0/..")" >/dev/null 2>&1 ; pwd -P )/$dotfile

if [[ -z $dotfile_map[$dotfile] ]]; then 
  echo "unrecongized dotfile: $dotfile"
  exit 1
fi

local install_directory=$dotfile_map[$dotfile]
local install_path=$install_directory/$dotfile

if [[ -e $install_path ]]; then 
  local current_timestamp=$(date +'%s')
  local backup_directory="$install_directory/dotfiles_backup"
  local backup_path="$backup_directory/${dotfile}_$current_timestamp"
  echo "backup: moving existing $dotfile to $backup_path"
  mkdir -p $backup_directory
  mv $install_path $backup_path
fi

echo "installing $dotfile into $install_path via symlink"
ln -sv $dotfile_path $install_path