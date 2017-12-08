=================================================================

Dataset: YFCC100M

Yahoo! Flickr Creative Commons 100M
A dataset of 100 million public Flickr photos/videos
http://bit.ly/yfcc100md

==================================================================

Yahoo! Webscope ReadMe

The data included herein is provided as part of the Yahoo! Webscope program for use solely under the terms of the signed Yahoo! Webscope Data Sharing Agreement for the YFCC100M dataset.

Unless Yahoo expressly requests no attribution, publications resulting from research carried out using the Dataset must display an attribution to Yahoo. This attribution must reference (a) "Yahoo Webscope” and the web address http://webscope.sandbox.yahoo.com in a footnote in the publication and (b) "YFCC100M: The New Data in Multimedia Research" by Bart Thomee, David A. Shamma, Gerald Friedland, Benjamin Elizalde, Karl Ni, Douglas Poland, Damian Borth, and Li-Jia Li, Communications of the ACM 59(2), pp. 64-73, 2016.” in the bibliographic citations in the publication.

Please send a copy of each paper you publish and its full citation information to webscope@yahoo-inc.com upon publication.

This dataset was produced from Yahoo!'s records and has been reviewed by an internal board. You may not perform any analysis, reverse engineering or processing of the data or any correlation with other data sources that could be used to determine or infer personally identifiable information beyond what is provided on the face of the data in the dataset.

Please refer to the Data Sharing Agreement for complete terms; contact webscope@yahoo-inc.com with any questions you may have.

==================================================================


+++ Full Description +++

This dataset contains a list of photos and videos. This list is compiled from data available on Yahoo! Flickr. All the photos and videos provided in the list are licensed under one of the Creative Commons copyright licenses. As such, they can be used as long as the photographer/videographer is credited for the original creation and their associated licensing terms are adhered to. In particular, the photos and videos in this dataset were made available under one of the following licenses:

 * Attribution License:                          http://creativecommons.org/licenses/by/2.0/
 * Attribution-ShareAlike License:               http://creativecommons.org/licenses/by-sa/2.0/
 * Attribution-NoDerivs License:                 http://creativecommons.org/licenses/by-nd/2.0/
 * Attribution-NonCommercial License:            http://creativecommons.org/licenses/by-nc/2.0/
 * Attribution-NonCommercial-ShareAlike License: http://creativecommons.org/licenses/by-nc-sa/2.0/
 * Attribution-NonCommercial-NoDerivs License:   http://creativecommons.org/licenses/by-nc-nd/2.0/

This dataset was originally formed by ten bzip2-compressed files (yfcc100m_dataset-0.bz2 to yfcc100m_dataset-9.bz2), each holding 10M lines, where each line described photo/video metadata. For simplicity, we have now concatenated the metadata into a single file (yfcc100m_dataset.bz2), where we have maintained the original line ordering. Each line in the dataset contains the following (tab-separated) fields:
 * Line number
 * Photo/video identifier
 * Photo/video hash
 * User NSID
 * User nickname
 * Date taken
 * Date uploaded
 * Capture device
 * Title
 * Description
 * User tags (comma-separated)
 * Machine tags (comma-separated)
 * Longitude
 * Latitude
 * Accuracy of the longitude and latitude coordinates (1=world level accuracy, ..., 16=street level accuracy)
 * Photo/video page URL
 * Photo/video download URL
 * License name
 * License URL
 * Photo/video server identifier
 * Photo/video farm identifier
 * Photo/video secret
 * Photo/video secret original
 * Extension of the original photo
 * Photos/video marker (0 = photo, 1 = video)

The fields that contain free-form text have been URL-encoded. Not all fields may have a value, in particular the camera, title, description, tags, longitude, latitude and accuracy fields may be empty. Note that the original extension is only meaningful for photos, not for videos - please inspect the first few bytes of the video to determine its file format. To download photos/videos in other sizes than the default medium-sized (approx. 500x500px) version that the download URL links to, please refer to https://www.flickr.com/services/api/misc.urls.html.

In case you do need photo/video content for your work, we kindly ask you to download the data responsibly, e.g. do not use a distributed system to download the photos and videos massively in parallel. Rather, we strongly suggest you to visit http://multimediacommons.org, where a persistent copy of the photo/video content is available, as well as various features, annotations and tools.

Note that, before publishing any metadata, photo or video in a report or elsewhere, it must be ensured that it is still publicly available (this includes data released as part of an expansion pack, see below). To do so, please check the photo/video page URL to see whether the data you want to publish is still available.


+++ Line Numbers +++

Due to its sheer size, it may not always be necessary or possible for you to process all photos/videos in the dataset. One clear challenge is ensuring that subsets of the dataset used in experiments can be reproduced accurately. We therefore suggest you to forego arbitrary selections from the dataset, but rather to use a principled approach that can be described succinctly. To this end, please consider using the line number where each photo/video appears in the dataset to select a subset of photos/videos. For example, your selection logic could be as simple as “We used the videos with line numbers less than 40 million for training, those between 40 million and 70 million for development, and those with line numbers from 70 million onwards for testing”. This file should help you make a reproducible subset or use a subset created by someone else.


+++ Hashes +++

From the photo/video identifiers we computed their corresponding MD5 hashes. These should be used for expansion packs (e.g. features, annotations) that are externally hosted, as a layer of indirection to hide direct access to the photo/video information.

Thus, if you wish to release data that refers to photos/videos from our dataset, please refer to their hashes instead of their identifiers. Other people wishing to use your data can then lookup the corresponding identifier and metadata of the photo/video in our dataset. For example, if you wanted to release your own face detection expansion back (no face = 0, face = 1), then rather than specifying:

- 28605 0
- 29060 1
- 29205 0
- 29209 0
- 29294 0
- 29604 1

you would use the mapping to convert the identifiers to hashes and specify this instead in your expansion pack:

+ b75c2d5c2ed427a78037a8e67ed79b3  0
+ 41dd8720fc6b7ffac962e3121dab33   1
+ 4f9734a918719eb876217fe376d5a5df 0
+ 46b9a03fbd7e303f6c5bfe791d2d91b3 0
+ c1c2745ed4e221f2ba3521f0c449623f 0
+ 3871a12811f4fad5d95b31deb4ac38   1

Note that our own expansion packs will use the photo/video identifiers.


+++ Expansion packs +++

We currently offer the following expansion packs:

* Exif *
We downloaded the original photo/video files and extracted any embedded Exif metadata. The expansion pack consists of a single bzip2-compressed file (yfcc100m_exif.bz2) containing all 100M photos/videos listed in order of appearance in the dataset file (yfcc100m_dataset.bz2). Each line refers to a photo/video and its (comma-separated) set of Exif metadata items. Each item is represented by a key and its (colon-separated) value, where the key further consists of two parts, a category and a (period-separated) tag. The category, the tag and the value have all been URL-encoded. To illustrate with a small example: the Exif metadata "Exif+SubIFD.Focal+Length:50.0+mm,Exif+SubIFD.Focal+Plane+Resolution+Unit:Inches" contains two items, "Exif+SubIFD.Focal+Length:50.0+mm" and "Exif+SubIFD.Focal+Plane+Resolution+Unit:Inches", where the key of the first item contains the category "Exif+SubIFD" and the tag "Focal+Length", and has as value "50.0+mm". If no Exif metadata was embedded then it is simply represented by an empty string, i.e. the line only contains a photo/video identifier and a tab.

* Autotags *
We used a deep learning approach to find the presence of a variety of concepts, such as people, animals, objects, food, events, architecture, and scenery. We trained 1,570 visual concept classifiers and applied them to the photos and videos (first frame). For a more detailed description on the approach used to perform the visual concept detection, please refer to our aforementioned article that we published on the dataset. The expansion pack consists of a single bzip2-compressed file (yfcc100m_autotags.bz2) containing all 100M photos/videos listed in order of appearance in the dataset file (yfcc100m_dataset.bz2). Each line in this expansion pack refers to a photo/video and its (comma-separated) set of autotags, each of which consists of a concept and its (colon-separated) confidence score. To illustrate with an example: the set of autotags "dune:0.5100,fog:0.8610,outdoor:0.9840" contains the autotags "dune", "fog", and "outdoor" having confidence scores "0.5100", "0.8610", and "0.9840", respectively. If no visual concepts were present then the set of autotags is simply an empty string, i.e. the line only contains a photo/video identifier and a tab.

* Places *
We reverse geocoded all geographic coordinates associated with the photos and videos, which produced a hierarchy of places (neighborhood, city, etc.) that reflects with human-readable names where they were taken. Note that the world is in constant flux and our reverse geocoder gets updated all the time, so the hierarchy of places in this expansion pack is a static reflection of the dynamic world of early 2016. The expansion pack consists of a single bzip2-compressed file (yfcc100m_places.bz2) containing all 100M photos/videos listed in order of appearance in the dataset file (yfcc100m_dataset.bz2). Each line refers to a photo/video and its (comma-separated) set of places. Each of the places in the set is represented by a so-called unique Where-On-Earth Identifier (WOEID), its (colon-separated) name, and its (also colon-separated) type. The place names have all been URL-encoded. To illustrate with a small example: the set of places "91476962:Lettershea:Town,2345255:Galway:County,23424803:Ireland:Country,28350896:Europe%2FDublin:Timezone" refers to the town of Lettershea, the county of Galway, and the country of Ireland, which falls in the Europe/Dublin timezone. If no coordinates were associated with the photo or video, or it could not be reverse geocoded (e.g. the photo was taken in the middle of the ocean), then it is simply represented by an empty string, i.e. the line only contains a photo/video identifier and a tab.


+++ Contact +++

In case of questions regarding the dataset, please contact us at yfcc100m@yahoo-inc.com.
