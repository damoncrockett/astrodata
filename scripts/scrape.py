DIR = "/Users/damoncrockett/Desktop/astrophotography_data/"
DATA = DIR + "astro_tag_exif_autotags_clean_quality_datetimes_photo-url"

import shutil
from bs4 import BeautifulSoup
import requests
import os
import pandas as pd

df = pd.read_csv(DATA+".csv")

views_list = []
faves_list = []
counter=-1
for url in df.photo_url:
    counter+=1
    page = requests.get(url).text
    soup = BeautifulSoup(page, 'html.parser')
    views = soup.find_all('span', {'class' : 'view-count-label'})
    faves = soup.find_all('span', {'class' : 'fave-count-label'})

    if len(views) > 0:
        views_list.append(views[0].get_text().lstrip("\n\t"))
    else:
        views_list.append("missing")
    
    if len(faves) > 0:
        faves_list.append(faves[0].get_text().lstrip("\n\t"))
    else:
        faves_list.append("missing")
    
    
    print counter,url
    
df['views'] = views_list
df['faves'] = faves_list

df.to_csv(DATA+"_views_faves.csv",index=False)