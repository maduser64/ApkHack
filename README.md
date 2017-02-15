# ApkHack

## What is ApkHack?

ApkHack can turn Android APK into java source code and resource files including AndroidManifest.xml and layout.

### How to use
./apkHack.sh path_to_file/xxx.apk

The results will be in the output dir like below:

output
-->AndroidManifest.xml
-->assets
-->lib
-->res
-->layout
----->activity_main.xml
----->values
----->....
-->classes.dex-src
---->com.xxx.xxx.MainActivity.java
-->classes2.dex-src
-->.....(multi-dex) 
