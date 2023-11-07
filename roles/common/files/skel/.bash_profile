# ~/.bash_profile is read and executed when Bash is invoked as an 
# interactive login shell. This file is read instead of ~/.profile
# when using bash.

# Load in .bashrc -------------------------------------------------
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

# Add ~/.local/bin to path if it exists ---------------------------
if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi

