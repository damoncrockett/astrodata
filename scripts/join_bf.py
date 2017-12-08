import pandas as pd

DIR = "/data/damoncrockett/flickr_data/"
BF = DIR + "raw/bf/"
ASTRO = DIR+"astrophotography/"

DATA = ASTRO + "astro_clean_exif_hash.csv"

df = pd.read_csv(DATA)

hashes = list(df.hash)

import os
import glob

counter = -1
for file in glob.glob(os.path.join(BF,"*.bf")):
    tmp = pd.read_table(file,sep="\t",header=None)
    tmp = tmp[tmp[0].isin(hashes)]
    
    counter+=1
    
    if counter==0:
        metadata = tmp
    else:
        metadata = metadata.append(tmp)
        
    print counter, len(tmp)
    
metadata.rename(columns = {0:"hash",
                           1:"feature",
                           2:"dim",
                           3:"bf"}, inplace=True)
metadata.set_index("hash",inplace=True)

df = df.join(metadata['bf'],on="hash")

df.to_csv(ASTRO+"astro_clean_exif_hash_bf.csv",index=False)