import pandas as pd

df = pd.read_csv("./astro_tag_exif_autotags_clean_quality_datetimes.csv")

ids = list(df["id"])

DIR = "/data/damoncrockett/flickr_data/raw/"

digits = range(10)

for digit in digits:
    tmp = pd.read_table(DIR+"yfcc100m_dataset-"+str(digit),sep="\t",header=None)
    tmp = tmp[tmp[0].isin(ids)]
    tmp = tmp[[0,13]]

    if digit==0:
        metadata = tmp
    else:
        metadata = metadata.append(tmp)
    
    print digit, len(tmp)
        

metadata.rename(columns = {0:"id",
                           13:"photo_url"}, inplace=True)
metadata.set_index("id",inplace=True)

df = df.join(metadata,on="id")

df.to_csv("./astro_tag_exif_autotags_clean_quality_datetimes_photo-url.csv",index=False)