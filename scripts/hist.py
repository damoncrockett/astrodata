import pandas as pd
import numpy as np
import sys
from PIL import Image

infile = sys.argv[1]
outfile = sys.argv[2]
x_var = sys.argv[3]
sort_var = sys.argv[4]
num_bins = int(sys.argv[5])
thumb_side = int(sys.argv[6])

df = pd.read_csv(infile)

df['x_bin'] = pd.cut(df[x_var],num_bins,labels=False)

bin_max = df.groupby('x_bin').size().max()

px_w = (thumb_side + 2) * num_bins
px_h = thumb_side * bin_max
print str(px_w)+'w',str(px_h)+'h'

answer = raw_input("okay?")
if answer == "no":
    exit()

canvas = Image.new('RGB',(px_w,px_h),(0,0,0))

thumb_px = (thumb_side,thumb_side)

bins = list(set(list(df.x_bin)))

for item in bins:
    tmp = df[df.x_bin==item]
        
    puresortvar = "hue_mean"
    tmp = tmp.sort([puresortvar])
    
    # option to double sort, need to bin first

    y_bin_var = 'val_mean'
    
    try:
        tmp['y_bin'] = pd.cut(tmp[y_bin_var],[0,.25,1],labels=False)
    except:
        print "can't bin"
    
    # sort the resulting DataFrame (tmp) by the sorting variable
    # note ascending kwarg
    
    try:
        tmp = tmp.sort(['y_bin'],ascending=[False])
        tmp = tmp.sort(['y_bin',sort_var],ascending=[False,True])
    except:
        tmp = tmp.sort(sort_var,ascending=True)


    # reset index because we'll use the index in a loop
    tmp.reset_index(drop=True,inplace=True)

    # define x and y coordinates for pasting
    y_coord = px_h - thumb_side
    x_coord = thumb_side * item

    # loop over rows in tmp
    n = len(tmp.index)
    for i in range(n):
        print x_coord,y_coord
        thumb = Image.open(tmp.filename.loc[i])
        thumb.thumbnail(thumb_px,Image.ANTIALIAS)
        canvas.paste(thumb,(x_coord,y_coord))
        y_coord = y_coord - thumb_side

print "Saving image...",

# save written canvas to outfile
canvas.save(outfile)

print "done."