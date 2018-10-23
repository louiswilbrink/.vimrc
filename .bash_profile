# Load the default .profile
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" 

# Load the default .profile
[[ -s "$HOME/.bashrc" ]] && source "$HOME/.bashrc" 

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

export PATH=$PATH:/Users/louiswilbrink/lib/vsts-cli/bin

source '/Users/louiswilbrink/lib/vsts-cli/vsts.completion'
