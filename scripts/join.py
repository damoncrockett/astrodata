import pandas as pd

DIR = "/data/damoncrockett/flickr_data/"
EXIF = DIR + "raw/exif/"
ASTRO = DIR+"astrophotography/"

DATA = ASTRO + "astro_clean.csv"

df = pd.read_csv(DATA)

ids = list(df.id)

import os
import glob

counter = -1
for file in glob.glob(os.path.join(EXIF,"*")):
    tmp = pd.read_table(file,sep="\t",header=None)
    tmp = tmp[tmp[0].isin(ids)]
    
    counter+=1
    
    if counter==0:
        metadata = tmp
    else:
        metadata = metadata.append(tmp)
        
    print counter
    
metadata.rename(columns = {0:"id",1:"exif"}, inplace=True)
metadata.set_index("id",inplace=True)

df = df.join(metadata,on="id")

df.to_csv(ASTRO+"astro_clean_exif.csv",index=False)