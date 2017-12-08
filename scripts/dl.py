import pandas as pd

infile = "/Users/damoncrockett/Desktop/astrophotography_data/poly.csv"
BASE_PATH = "/Users/damoncrockett/Desktop/astrophotography_data/images/"

df = pd.read_csv(infile)

import requests
import shutil

n = len(df.index)

for i in range(n):
    path = BASE_PATH + df.dl_url.loc[i].split('/',5)[4]
    print i,path

    try:
        r = requests.get(df.dl_url.loc[i],stream=True)
        if r.status_code == 200:
            with open(path, 'wb') as f:
                r.raw.decode_content = True
                shutil.copyfileobj(r.raw, f)
    except:
        print 'err'