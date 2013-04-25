import glob
import os


def keep(path):
    with open(path, 'r') as in_file:
        results = in_file.read()
    for old_file in glob.glob(os.path.join(os.path.dirname(path), '*.txt')):
        os.remove(old_file)
    with open(os.path.join(os.path.dirname(path), 'results.txt'), 'w') as out_file:
        out_file.write(results)

results = '/Users/william/Desktop/simulations/cluster/complete/'

for (path, dirs, files) in os.walk(results):
    if 'status-1.txt' in files:
        with open(os.path.join(path, 'status-1.txt'), 'r') as f:
            if 'Starting trial 500' in f.read():
                keep(os.path.join(path, 'results-1.txt'))
                exit()
    if 'status-2.txt' in files:
        with open(os.path.join(path, 'status-2.txt'), 'r') as f:
            if 'Starting trial 500' in f.read():
                keep(os.path.join(path, 'results-2.txt'))
