import glob
import os
import pandas as pd

DIR = "/data/damoncrockett/flickr_data/raw/"

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
    df = df[df.user_tags.notnull()]
    df = df[df.user_tags.str.contains("astrophotography")]
    
    if digit==0:
        tmp = df
    else:
        tmp = tmp.append(df)
        
tmp.reset_index(drop=True,inplace=True)
tmp.to_csv("/data/damoncrockett/astrophotography.csv",index=False)