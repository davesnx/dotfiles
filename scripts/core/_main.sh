#!/usr/bin/env bash

if ! ${DOT_MAIN_SOURCED:-false} ; then
   source "$DOTFILES_PATH/scripts/core/args.sh"
   source "$DOTFILES_PATH/scripts/core/collections.sh"
   source "$DOTFILES_PATH/scripts/core/platform.sh"
   source "$DOTFILES_PATH/scripts/core/documentation.sh"
   source "$DOTFILES_PATH/scripts/core/log.sh"

   readonly DOT_MAIN_SOURCED=true
fi
