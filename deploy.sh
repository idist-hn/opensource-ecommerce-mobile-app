#!/bin/zsh
source .env

#Change version number
sed -i -e "19 s/version: .*/version: $VERSION+$(date +%s)/" ./pubspec.yaml
rm -rf ./pubspec.yaml-e

#Build IPA
fvm flutter build ipa
#
##Upload to appstoreconnect
xcrun altool --upload-app --type ios -f build/ios/ipa/*.ipa --apiKey $APIKEY --apiIssuer $APIISSUER