#!/bin/bash

. _logs.sh

echo_section "Synchronizing package databases..."
echo "core is up to date"
echo "extra is up to date"
echo "community is up to date"
echo "multilib is up to date"

echo_section "Starting full system upgrade..."
echo "there is nothing to do"

echo_section "Searchign AUR for updates..."
echo_task "Looking at AUR..."
echo_step "Missing AUR Packages: ${CYAN}eclipse-java-bin"
echo_step_warn "Flagged Out Of Date AUR Package: ${CYAN}snapd"

