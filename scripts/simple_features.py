import glob
import os
import sys
from skimage.io import imread
from skimage import color
import numpy as np
from scipy.stats import mode

input_path = sys.argv[1]
descriptor = sys.argv[2]

filename = []
hue = []
val = []

counter = -1

for root, dirs, files in os.walk(input_path):
    for file in files:
        counter +=1

        try:
            img = color.rgb2hsv(imread(root+"/"+file))

            i_hue = np.mean(img[:,:,0])
            hue.append(i_hue)

            i_val = np.mean(img[:,:,2])
            val.append(i_val)

            filename.append(root+"/"+file)

            print counter, file

        except:
            print counter,file,'error'

import pandas as pd
df = pd.DataFrame({'filename':filename,
                   'hue_mean':hue,
                   'val_mean':val
                   })

df['base'] = df.filename.apply(os.path.basename)

df.to_csv(input_path+descriptor+'_metadata.csv',index=False)
