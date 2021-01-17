#!/usr/bin/env python

import os
import glob

custom_dotfiles = glob.glob(os.getcwd() + '/custom/.*')

for f in custom_dotfiles:
    lnk = os.path.expanduser('~') + '/' + os.path.basename(f)

    if os.path.isfile(lnk) or os.path.islink(lnk):
        print('Skipped symlink creation: "{}" already exists.'.format(lnk))
    else:
        os.symlink(f, lnk)
        print('Created symlink: {0} -> {1}'.format(lnk, f))
