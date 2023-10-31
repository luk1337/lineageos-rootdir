#!/usr/bin/env python3
import json
import os
import sys
import urllib.request


def get_change_data(change_id):
    url = f'https://review.lineageos.org/changes/{change_id}?o=CURRENT_REVISION'
    data = urllib.request.urlopen(url).read().decode()
    return json.loads(data[5:])


def get_related_changes(id, revision):
    url = f'https://review.lineageos.org/changes/{id}/revisions/{revision}/related'
    data = urllib.request.urlopen(url).read().decode()
    return json.loads(data[5:])


def get_submitted_together(change_id):
    url = f'https://review.lineageos.org/changes/{change_id}/submitted_together'
    data = urllib.request.urlopen(url).read().decode()
    return json.loads(data[5:])


ids = []

args = ""

if len(sys.argv) > 2:
    args = ' '.join(sys.argv[1:-1])

change = get_change_data(sys.argv[-1])
changes = get_related_changes(change['id'], change['current_revision'])

for c in changes['changes'][::-1]:
    if c['status'] == 'MERGED' or c['status'] == 'ABANDONED':
        continue

    ids.append(str(c['_change_number']))

    if str(c['_change_number']) == sys.argv[-1]:
        break
else:
    ids.append(str(change['_number']))

if args:
    print('repopick {} {}'.format(args, ' '.join(ids)))
else:
    print('repopick {}'.format(' '.join(ids)))
