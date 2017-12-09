import pandas as pd
import numpy as np

DIR = "/data/damoncrockett/flickr_data/raw/"
LANG = "/data/damoncrockett/flickr_data/astrophotography/languages.csv"

d = pd.read_csv(LANG)

columns = {0:'id',1:'user_nid',2:'user_nickname',3:'date_taken',4:'date_uploaded',
          5:'capture_device',6:'title',7:'descr',8:'user_tags',9:'machine_tags',
          10:'lon',11:'lat',12:'accuracy',13:'photo_url',14:'dl_url',15:'license_name',
          16:'license_url',17:'server_id',18:'farm_id',19:'secret',20:'secret_orig',
          21:'ext',22:'marker'}

digits = [0,1,2,3,4,5,6,7,8,9]

for digit in digits:
    df = pd.read_table(DIR+'yfcc100m_dataset-'+str(digit),sep='\t',header=None)
    print digit
    
    df.rename(columns=columns,inplace=True)
    
    df = df[['id','user_nid','date_taken','date_uploaded','capture_device','title',
             'descr','user_tags','lon','lat','accuracy','dl_url','ext']]
    
    df = df[df.user_tags.notnull()]
    
    idxs = []
    
    for word in d.translation:
        df[word] = df.user_tags.str.contains(word)        
        subset = df[df.user_tags.str.contains(word)]
        idxs.append(list(subset.index))
    
    idxs = [item for sublist in idxs for item in sublist]
    idxs = list(set(idxs))
    
    df = df.loc[idxs]
    
    if digit==0:
        tmp = df
    else:
        tmp = tmp.append(df)
        
tmp.reset_index(drop=True,inplace=True)
tmp.to_csv("/data/damoncrockett/astrophotography_polyglot.csv",index=False)