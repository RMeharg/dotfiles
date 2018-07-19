#!/usr/bin/env bash

greyblue="\[\033[38;5;31m\]"
cyan="\[\033[38;5;51m\]"
light_blue="\[\033[38;5;39m\]"
brightgreen="\[\033[38;5;46m\]"

SCM_THEME_PROMPT_DIRTY=" ${red}✗"
SCM_THEME_PROMPT_CLEAN=" ${brightgreen}✓"
SCM_THEME_PROMPT_PREFIX="${light_blue} |"
SCM_THEME_PROMPT_SUFFIX="${light_blue}|"

GIT_THEME_PROMPT_DIRTY=" ${red}✗"
GIT_THEME_PROMPT_CLEAN=" ${brightgreen}✓"
GIT_THEME_PROMPT_PREFIX=" ${light_blue}|"
GIT_THEME_PROMPT_SUFFIX="${light_blue}|"

RVM_THEME_PROMPT_PREFIX="|"
RVM_THEME_PROMPT_SUFFIX="|"

function prompt_command() {
    PS1="\n$(battery_char) ${cyan}$(ruby_version_prompt) ${greyblue}\h ${reset_color}in ${light_blue}\w\n${cyan}$(scm_char)${light_blue}$(scm_prompt_info) ${light_blue}→${reset_color} "
}

PROMPT_COMMAND=prompt_command;
