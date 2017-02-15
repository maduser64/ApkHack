#!/bin/sh

usage() {
    echo ""
    echo "需要命令参数："
    echo "./apkHack.sh <xxx.apk>"
    echo ""
    exit 255
}

APK=$1
if [ -z "$APK" ] || [ "${APK:0-4}" != ".apk" ] || [ ! -f "$APK" ]; then
  usage
fi
echo "Using apkHack on $1"
if [ -d "output" ]; then
  rm -r output
fi
mkdir -p output/tmp
tools/Apktool/apktool d -f -s -o output/tmp $APK
mv output/tmp/AndroidManifest.xml output/
mv output/tmp/assets output/
mv output/tmp/lib output/
mv output/tmp/res output/
for file in `ls output/tmp |grep ".dex"`
do
  mkdir -p output/$file-src
  tools/dex2jar-2.0/d2j-dex2jar.sh -f -n -os output/tmp/$file -o output/tmp/$file.jar
  java -jar tools/procyon-decompiler-0.5.30.jar -jar output/tmp/$file.jar -o output/$file-src/
done
rm -r output/tmp

echo "ApkHack success!!"
