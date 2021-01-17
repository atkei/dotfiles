#!/usr/bin/env python

import sys
import os
import glob

def input_yn():
    while True:
        choice = input("[y/N]: ").lower()
        if choice in ['y', 'ye', 'yes']:
            return True
        elif choice in ['n', 'no']:
            return False

custom_dotfiles = glob.glob('custom/.*')
targets = list(map(lambda df: os.path.expanduser('~') + '/' + os.path.basename(df), custom_dotfiles))

print(
'''
Following files will be deleted.

{}

Do you want to continue?
'''
.format(targets))

if input_yn() is False:
    print('Abort.')
    sys.exit(0)

for t in targets:
    if os.path.isfile(t) or os.path.islink(t):
        os.remove(t)
        print('Deleted: {}'.format(t))
