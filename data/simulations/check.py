import os

results = '/Users/william/Desktop/simulations/cluster/results/'

for (path, dirs, files) in os.walk(results):
    z = 0
    if 'z1000' in path:
        z = 1000
    elif 'z500' in path:
        z = 500
    elif 'z100' in path:
        z = 100
    if z != 0:
        with open(os.path.join(path, 'simulation.properties'), 'r') as f:
            if 'z=%d' % z not in f.read():
                print 'Problem with', os.path.abspath(f.name)
