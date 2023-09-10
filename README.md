# How to set up neovim

1. Set up git and your ssh config file
2. Clone this repo
3. Ensure that all files go where they belong from this repo
4. Install neovim
5. Install vim plug plugin manager
6. Install ctags with pacman
	* exuberant-ctags for Debian apt
7. Install nodejs with pacman
8. Install npm with pacman
9. Navigate to where your plugins are installed (your init.vim should tell you where)
10. As super user...
	* npm install -g yarn
11. Type 'yarn install' in .../plugged/coc.nvim/
12. In the same directory, run 'yarn build'
13. As super user...
     * Install pip with 'pacman -Su python-pip'
14. Install jedi with pip 'pip install jedi'
15. You may install python with 'CocInstall coc-python' inside of nvim now
16. For snippets, you will have to manually do those.
17. For additional help, run ':checkhealth' in neovim

## Additional Add-ons for C/C++ Development

1. Install BEAR, CCLS, and clang
2. Inside of vim, install coc-ccls and/or coc-clang with :CocInstall
3. Go to .../.config/coc/extensions/node\_modules/coc-ccls and run the following:
	* npm i
	* npm run build
4. Go to .../.config/coc/extensions/node\_modules/coc-ccls/node\_modules/ws/lib/
5. Run ln -s . lib
6. In vim, run command ':CocConfig' and copy/paste from the coc-settings.json
   file in the repo
7. Now you can generate compile\_commands.json when building a C/C++ project
   with 'bear -- make'
	* This will allow for an "intellisense" feel
8. You may type ':Dox' and ':DoxAuthor' for Doxygen comments in C/C++
9. The c.vim plugin has a ":h csupport" help menu
	* You can use '\\cfr' inside your file for a comment frame

# Z-Shell

1. Use pacman to install zsh
2. Run zsh and go through walkthrough. Save settings
3. Install oh-my-zsh if you want. I use this moving forward.
