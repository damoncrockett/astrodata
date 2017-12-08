BASE = "/data/damoncrockett/flickr_data/raw/"

import sys

feature = sys.argv[1]
row_length = sys.argv[2]

DIR = BASE + feature + "/"

import glob
import os
import csv
import shutil

counter = -1
for file in glob.glob(os.path.join(DIR,"*."+feature)):
    counter+=1
    print file,counter
    
    with open(file, 'rb') as infile, open(DIR+"tmp", 'wb') as outfile:
        writer = csv.writer(outfile,delimiter='\t')
        for row in csv.reader(infile,delimiter='\t'):
            if len(row)==row_length:
                writer.writerow(row)
    
    shutil.move(DIR+"tmp",file)
