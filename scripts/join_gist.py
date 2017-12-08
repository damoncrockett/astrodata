import pandas as pd

DIR = "/data/damoncrockett/flickr_data/"
GIST = DIR + "raw/gist/"
ASTRO = DIR+"astrophotography/"

DATA = ASTRO + "astro_clean_exif_hash_bf_RGB.csv"

df = pd.read_csv(DATA)

hashes = list(df.hash)

import os
import glob

counter = -1
for file in glob.glob(os.path.join(GIST,"*.gist")):
    try:
        tmp = pd.read_table(file,sep="\t",header=None)
        tmp = tmp[tmp[0].isin(hashes)]
    
        counter+=1
        if counter==0:
            metadata = tmp
        else:
            metadata = metadata.append(tmp)
        
    except Exception as e:
        print e
        counter+=1
    
    print counter
    
metadata.rename(columns = {0:"hash",
                           1:"feature",
                           2:"dim",
                           3:"gist"}, inplace=True)
metadata.set_index("hash",inplace=True)

df = df.join(metadata['gist'],on="hash")

df.to_csv(ASTRO+"astro_clean_exif_hash_bf_RGB_gist.csv",index=False)