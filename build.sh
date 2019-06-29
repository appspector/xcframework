#!/bin/bash

# Prepare
DEPLOY_DIR='/tmp/xcframework_test'
rm -rf $DEPLOY_DIR
mkdir $DEPLOY_DIR
mkdir $DEPLOY_DIR/xcf

# Build fat binary
xcodebuild archive -scheme TestFramework -destination="iOS" -archivePath $DEPLOY_DIR/xcf/ios.xcarchive -derivedDataPath $DEPLOY_DIR/iphoneos -sdk iphoneos SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES
xcodebuild archive -scheme TestFramework -destination="iOS Simulator" -archivePath $DEPLOY_DIR/xcf/iossimulator.xcarchive -derivedDataPath $DEPLOY_DIR/iphoneos -sdk iphonesimulator SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES
xcodebuild -create-xcframework -framework $DEPLOY_DIR/xcf/ios.xcarchive/Products/Library/Frameworks/TestFramework.framework -framework $DEPLOY_DIR/xcf/iossimulator.xcarchive/Products/Library/Frameworks/TestFramework.framework -output $DEPLOY_DIR/xcf/TestFramework.xcframework



