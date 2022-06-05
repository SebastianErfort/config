#!/usr/bin/python3
# See https://docs.python.org/3/library/argparse.html

import argparse

argparser = argparse.ArgumentParser(description='Select a disk and perform partitioning for the LWP autoinstaller (unattended installer)')
argparser.add_argument('-v', dest='verbose', default=False, help='Verbose mode, extended output.', action='store_true')
argparser.add_argument('-t', dest='test'   , default=False, help='Test script (locally), no actual changes.', action='store_true')
args = argparser.parse_args()
VERBOSE = args.verbose
TEST    = args.test

print(VERBOSE,TEST)
