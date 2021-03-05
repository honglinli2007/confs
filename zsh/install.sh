#!/bin/bash

p=$(readlink -f zshrc)
echo "source $p" >> ~/.zshrc
