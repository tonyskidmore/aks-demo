#!/usr/bin/env python

"""
Oct 2018, Tony Skidmore <anthony.skidmore@accenture.com>

Simple utility to read in Ansible an INI style Ansible inventory
and export as JSON
"""
from __future__ import print_function

try:
    import json
    import sys
    import re

    HAS_MODULES = True

except ImportError:
    HAS_MODULES = False

def process_file(filename, exclude_list):
    """ main function for processing passed in file """
    if not filename:
        raise ValueError('No filename specified')

    regex = r"^\[([a-zA-Z]*)\]"
    inv_hosts = []

    with open(filename, 'r') as src_file:
        for line in src_file:
            matches = re.search(regex, line)

            if matches:
                cloud_provider = matches.group(1)
                cloud_entry = src_file.next().strip()
                if cloud_entry:
                    if cloud_provider not in exclude_list:
                        entry = {'name': cloud_provider, 'hosts': cloud_entry}
                        inv_hosts.append(entry)

    json_data = json.dumps(inv_hosts)
    print(json_data)

def main(args):
    """ main function """

    if args:
        process_file(args[0],args[1:])


if __name__ == '__main__':
    main(sys.argv[1:])