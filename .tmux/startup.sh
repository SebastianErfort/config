#!/usr/bin/env bash
# 1. ensure env. is set up
export $(tmux show-environment | grep '^[A-Z]')
