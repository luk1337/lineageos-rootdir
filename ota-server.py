#!/usr/bin/env python3
from datetime import datetime
from flask import Flask, request, send_from_directory
from pathlib import Path
from time import mktime
from zipfile import ZipFile
import hashlib

app = Flask(__name__)


@app.route('/api/v2/devices/<device>/builds')
def api_builds(device: str):
    builds = {}

    for f in Path(f'out/target/product/{device}').glob('lineage-*.zip'):
        path = Path(f)
        stat = path.stat()

        # lineage-24.0-20260926-UNOFFICIAL-pdx257.zip
        _, build_version, build_date, build_type, _ = path.name.split('-')

        with ZipFile(path) as zip:
            for line in zip.read('META-INF/com/android/metadata').decode().splitlines():
                key, value = line.split('=', maxsplit=1)

                if key == 'ota-property-files':
                    ota_property_files = value
                elif key == 'post-sdk-level':
                    os_sdk_level = value
                elif key == 'post-security-patch-level':
                    os_patch_level = value
                elif key == 'post-timestamp':
                    timestamp = value

        if os_sdk_level:
            os_sdk_level = int(os_sdk_level)

        if not timestamp:
            timestamp = int(mktime(datetime.strptime(build_date, '%Y%m%d').timetuple()))
        else:
            timestamp = int(timestamp)

        sha256 = hashlib.sha256()

        with open(path, 'rb') as f:
            for chunk in iter(lambda: f.read(8192), b''):
                sha256.update(chunk)

        builds[stat.st_ino] = {
            'datetime': timestamp,
            'files': [
                {
                    'filename': path.name,
                    'os_patch_level': os_patch_level,
                    'os_sdk_level': os_sdk_level,
                    'ota_property_files': ota_property_files,
                    'sha256': sha256.hexdigest(),
                    'size': stat.st_size,
                    'url': f'{request.host_url}download/{device}/{path.name}',
                }
            ],
            'type': build_type,
            'version': build_version,
        }

    return list(builds.values())


@app.route('/download/<device>/<build>')
def download(device: str, build: str):
    return send_from_directory(f'out/target/product/{device}', build)


if __name__ == '__main__':
    app.run(debug=True, port=4919, host='0.0.0.0')
