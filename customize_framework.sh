#!/bin/bash
# $1: dir for miui
# $2: dir for original

APKTOOL="$PORT_ROOT/tools/apktool --quiet"
GIT_APPLY=$PORT_ROOT/tools/git.apply
BUILD_OUT=out

function applyPatch () {
    for patch in `find $1 -name *.patch`
    do
        cp $patch out/
        cd out
        $GIT_APPLY `basename $patch`
        for rej in `find $2 -name *.rej`
        do
          echo "Patch $patch fail"
          exit 1
        done
        cd ..
      done
}

if [ $2 = "$BUILD_OUT/framework" ]
then
	cp -rf ../android/Editor/* $BUILD_OUT/framework/smali/android/widget/
	cp -rf overlay/framework/* $BUILD_OUT/framework
fi

if [ $2 = "$BUILD_OUT/framework2" ]
then
    applyPatch "overlay/framework2"
fi

#if [ $2 = "$BUILD_OUT/telephony-common" ]
#then
#fi

if [ $2 = "$BUILD_OUT/services" ]
then
    applyPatch "overlay/services"
    rm $BUILD_OUT/services/smali/com/android/server/am/ActivityManagerService\$13\$1.smali
fi

if [ $2 = "$BUILD_OUT/android.policy" ]
then
    applyPatch "overlay/android.policy"
    cp -rf overlay/android.policy/smali/* $BUILD_OUT/android.policy/smali
    rm $BUILD_OUT/android.policy/smali/com/android/internal/policy/impl/PhoneWindowManager\$13\$1.smali
    rm $BUILD_OUT/android.policy/smali/com/android/internal/policy/impl/PhoneWindowManager\$21\$1.smali
    rm $BUILD_OUT/android.policy/smali/com/android/internal/policy/impl/GlobalActions\$4\$1\$1.smali
    rm $BUILD_OUT/android.policy/smali/com/android/internal/policy/impl/GlobalActions\$4\$1.smali
fi
