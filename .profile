# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

export MANPATH="$HOME/.local/share/man:$MANPATH"

# locales
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"

export NFS="/Vrac"

# gentoo prefix
export PATH="$NFS/gentoo/usr/bin:$NFS/gentoo/bin:$NFS/gentoo/tmp/usr/bin:$NFS/gentoo/tmp/bin:$NFS/gentoo/tmp/usr/local/bin:/usr/bin:/bin:$PATH"

# linuxbrew
export PATH="$NFS/linuxbrew/bin:$NFS/linuxbrew/sbin:$PATH"
export MANPATH="$NFS/linuxbrew/share/man:$MANPATH"
export INFOPATH="$NFS/linuxbrew/share/info:$INFOPATH"

# UPMC proxy
export USE_PROXY=yes
export HTTP_PROXY=proxy:3128
export HTTPS_PROXY=proxy:3128
export FTP_PROXY=proxy:3128
export ALL_PROXY=proxy:3128

# rust toolchain
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.wasmtime/bin:$PATH"

export PAGER="most"
export EDITOR="nvim"
export VISUAL="nvim"
export GTK_THEME="Adwaita"

# [ -r $HOME/.byobu/prompt ] && . $HOME/.byobu/prompt  # byobu-prompt

if ! { [ -n "$TMUX" ] } then
	tmux attach
fi

test -r ~/.opam/opam-init/init.zsh && . ~/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

source ~/.config/broot/launcher/bash/br

# added by Anaconda3 5.3.0 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '$NFS/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$NFS/anaconda3/etc/profile.d/conda.sh" ]; then
        . "$NFS/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        export PATH="$NFS/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<

##   __     __   __           ___
##  |__) | /  \ /__` \ / |\ |  |   /\  \_/
##  |__) | \__/ .__/  |  | \|  |  /~~\ / \
##  =======================================
##
## Syntax Highlighting for computational biology rc.append
## v0.1
##
## Append this to your ~/.zshrc & ~/.bashrc
## to enable source-highlight for less and add
## bioSyntax pipe capability on your command line
##
export HIGHLIGHT="$HOME/.local/share/source-highlight"
export LESSOPEN="| $HIGHLIGHT/src-hilite-lesspipe-bio.sh %s"
export LESS=" -R "

alias less='less -NSi -# 10'
#	-N: add line numbers
#	-S: don't wrap lines (force to single line)
#	-# 10: Horizontal scroll distance

# Explicit call of  <file format>-less for piping data
# i.e:  samtools view -h aligned_hits.bam | sam-less
# Core syntaxes (default)
alias clustal-less='source-highlight -f esc --lang-def=$HIGHLIGHT/clustal.lang --outlang-def=$HIGHLIGHT/bioSyntax.outlang     --style-file=$HIGHLIGHT/fasta.style | less'
alias bed-less='source-highlight     -f esc --lang-def=$HIGHLIGHT/bed.lang     --outlang-def=$HIGHLIGHT/bioSyntax.outlang     --style-file=$HIGHLIGHT/sam.style   | less'
alias fa-less='source-highlight      -f esc --lang-def=$HIGHLIGHT/fasta.lang   --outlang-def=$HIGHLIGHT/bioSyntax.outlang     --style-file=$HIGHLIGHT/fasta.style | less'
alias fq-less='source-highlight      -f esc --lang-def=$HIGHLIGHT/fastq.lang   --outlang-def=$HIGHLIGHT/bioSyntax.outlang     --style-file=$HIGHLIGHT/fasta.style | less'
alias gtf-less='source-highlight     -f esc --lang-def=$HIGHLIGHT/gtf.lang     --outlang-def=$HIGHLIGHT/bioSyntax-vcf.outlang --style-file=$HIGHLIGHT/vcf.style   | less'
alias pdb-less='source-highlight     -f esc --lang-def=$HIGHLIGHT/pdb.lang     --outlang-def=$HIGHLIGHT/bioSyntax-vcf.outlang --style-file=$HIGHLIGHT/pdb.style   | less'
alias sam-less='source-highlight     -f esc --lang-def=$HIGHLIGHT/sam.lang     --outlang-def=$HIGHLIGHT/bioSyntax.outlang     --style-file=$HIGHLIGHT/sam.style   | less'
alias vcf-less='source-highlight     -f esc --lang-def=$HIGHLIGHT/vcf.lang     --outlang-def=$HIGHLIGHT/bioSyntax-vcf.outlang --style-file=$HIGHLIGHT/vcf.style   | less'
alias bam-less='sam-less'

# Auxillary syntaxes (uncomment to activate)
alias fai-less='source-highlight      -f esc --lang-def=$HIGHLIGHT/faidx.lang    --outlang-def=$HIGHLIGHT/bioSyntax.outlang   --style-file=$HIGHLIGHT/sam.style   | less'
alias flagstat-less='source-highlight -f esc --lang-def=$HIGHLIGHT/flagstat.lang --outlang-def=$HIGHLIGHT/bioSyntax.outlang   --style-file=$HIGHLIGHT/sam.style   | less'
