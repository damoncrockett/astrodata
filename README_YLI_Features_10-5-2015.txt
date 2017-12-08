README FOR THE YLI FEATURE CORPUS
===========================================================



Welcome to the YLI Feature Corpus!





Contents of This README:

1. Organization of Files and Their Contents
2. Missing or Invalid Features
3. Obtaining the Metadata and Original Media
4. License Information
5. Contacts and Credits


===== 1. ORGANIZATION OF FILES AND THEIR CONTENTS =====

The features directory includes the following subdirectories:

audio/ -- Audio features computed on audio tracks extracted from (almost) all of the videos in the YFCC100M dataset.

Subsubdirectories of audio/:

audio/kaldi_pitch/ -- Kaldi pitch features
audio/mfcc20/ -- Mel frequency cepstral coefficients (MFCC20s) 
audio/sacc_pitch/ -- Subband autocorrelation classification (SAcC) pitch features 

---

image/ -- Visual (image) features computed on (almost) all of the static images in the YFCC100M dataset.

Subdirectories of image/:

image/RGB/ -- Simple color histogram (RGB)
image/acc/ -- Auto color correlogram
image/bf/ -- Basic features
image/cedd/ -- Color and edge directivity descriptor
image/col/ -- Color layout
image/edgehistogram/ -- Edge histogram
image/fcth/ -- Fuzzy color and texture histogram
image/gabor/ -- Gabor features
image/gist/ -- Gist features
image/jhist/ -- Joint histogram
image/jophist/ -- Joint opponent histogram
image/ophist/ -- Fuzzy opponent histogram
image/scalablecolor/ -- Scalable color
image/sift/ -- SIFT (Scale-Invariant Linear Transform) features
image/tamura/ -- Tamura texture

---

keyframe/ -- Visual (image) features computed on keyframes from (almost) all of the videos in the YFCC100M dataset.

Subdirectories of keyframe/:

keyframe/RGB/ -- Simple color histogram (RGB)
keyframe/acc/ -- Auto color correlogram
keyframe/bf/ -- Basic features
keyframe/cedd/ -- Color and edge directivity descriptor
keyframe/col/ -- Color layout
keyframe/edgehistogram/ -- Edge histogram
keyframe/fcth/ -- Fuzzy color and texture histogram
keyframe/gabor/ -- Gabor features
keyframe/jhist/ -- Joint histogram
keyframe/jophist/ -- Joint opponent histogram
keyframe/ophist/ -- Fuzzy opponent histogram
keyframe/scalablecolor/ -- Scalable color
keyframe/tamura/ -- Tamura texture

---

For more information about directory structure, file organization, and intervals, along with details about tools and parameters used to compute the features, please see http://www.multimediacommons.org/features/

We are working on computing and adding more features; please keep an eye on http://www.multimediacommons.org for updates.


===== 2. MISSING OR INVALID FEATURES =====

Important Caveat: The feature sets are not complete at this time, as we were initially unable to download some of the images and videos. In addition, some images were downloaded incorrectly, resulting in invalid features. We are working on clearing out invalid features, getting the remainder of the media files, and computing or recomputing features for them.

Static Images: In some cases, we do not have any features at all for an image, where we were simply unable to download it. Unfortunately, in other cases, our downloads caught placeholder images containing error messages. These placeholder images were included in the feature-computation process, so there are a number of feature sets that pertain to the placeholder/error image rather than the actual original uploaded by the user. 

Video Keyframes: In cases where we were unable to download the videos, we are simply missing the features for the keyframes. (There are no invalid features for keyframes.)

Audio Tracks: In some cases, we were unable to download the video or to extract the audio track. In other cases, the videos simply have no audio track in the first place.


===== 3. OBTAINING THE METADATA AND ORIGINAL MEDIA =====

The YLI features were computed on the Yahoo Flickr Creative Commons 100 Million (YFCC100M) dataset, which contains the user-supplied metadata for 99.2 million photos and nearly 0.8 million videos that have been uploaded to Flickr using a Creative Commons license, along with links to the original media. There is also a supplemental file that connects the Flickr media IDs to unique MD5 hashes, which may in turn be used to connect the YLI features with the metadata and original media in the YFCC100M.

The YFCC100M must be separately requested via the Yahoo! Webscope portal at http://webscope.sandbox.yahoo.com/catalog.php?datatype=i&did=67. Yahoo! Labs makes this data available for free, subject to the terms of the Webscope agreement on data use (which you will be asked to sign). Your use of the YFCC100M dataset is not tied in any way to your use of the YLI features, nor vice versa.


===== 4. LICENSE INFORMATION =====

All of the YLI computed features are released as a public-domain resource under Creative Commons License 0: https://creativecommons.org/publicdomain/zero/1.0/. However, credit is appreciated. 

(Use of the original media files and associated metadata are subject to the Webscope agreement and the specific Creative Commons licenses chosen by the uploaders.)


===== 5. CONTACTS AND CREDITS =====

Questions can be directed to jaeyoung@icsi.berkeley.edu.

The YLI features were computed and wrangled by: Damian Borth, Carmen Carrano, Jaeyoung Choi, Benjamin Elizalde, Luke Gottlieb, Karl Ni, and Roger Pearce.

Documentation/Preferred Citation: Julia Bernd, Damian Borth, Carmen Carrano, Jaeyoung Choi, Benjamin Elizalde, Gerald Friedland, Luke Gottlieb, Karl Ni, Roger Pearce, Doug Poland, Khalid Ashraf, David A. Shamma, and Bart Thomee. 2015. Kickstarting the Commons: The YFCC100M and the YLI Corpora. In Proceedings of the ACM Multimedia 2015 Workshop on Community-Organized Multimodal Mining: Opportunities for Novel Solutions (MMCommons ’15). To appear.