import json
import sys
import os

if __name__ == '__main__':
    path = '%s/bench/sites/erpnext.dev/site_config.json' % os.path.abspath(sys.argv[1])

    with open(path, 'r') as f:
        json_data = json.load(f)
        json_data['developer_mode'] = 1

    with open(path, 'w') as f:
        f.write(json.dumps(json_data, sort_keys=True, indent=4, separators=(',', ': ')))
