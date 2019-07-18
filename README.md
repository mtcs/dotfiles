# dotfiles

My personal dotfiles from Vim, tmux, etc. (the public ones at least) 

The most updated dotfile is definetely my vimrc. Enjoy!

## VIM

This is my humble vim config, IT has too much plugins, but not enough apparently, because I still keep searching for more...

### Install

To install (probably more for me than you... hehehe):

```
cd
ln -s ~/dotfiles/vimrc ~/.vimrc
```

My custom color:

```
mkdir ~/.vim/colors
ln -s ~/dotfiles/vim-colors/mtcs ~/.vim/colors/mtcs
```

I use Vim Plug, the best plugin manager, it is asynchronous! To install it just:

```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

## Tmux

My tmux is minimal, I just use powerline with it. When I started using tilix therminal emulator, It got a little forgotten...
