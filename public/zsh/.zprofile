#!/bin/zsh
# sourced on login shells only

# from /etc/zprofile => updates PATH removing duplicates and non-existent Apple system bin paths
if [ -x /usr/libexec/path_helper ]; then
	eval `/usr/libexec/path_helper -s`
fi
