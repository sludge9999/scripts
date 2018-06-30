#!/bin/bash
# simple build sh ... alias br='/home/user/source_folder/device/motorola/quark/rootdir/etc/sbin/build.sh'

#timer counter
START=$(date +%s.%N);
START2="$(date)";
echo -e "\n build start $(date)\n";

#source tree folder yours machine source folder
FOLDER=~/android/o;

cd $FOLDER

echo -e "\nCommit?\n 1 = Yes\n"
read -r input1
echo -e "\nYou choose: $input1"

echo -e "\nMake clean?\n 1 = Yes\n"
read -r input2
echo -e "\nYou choose: $input2"

echo -e "\nr or o?\n"
read -r input3
echo -e "\nYou choose: $input3"

if [ "$input1" == "1" ]; then

	folder="frameworks/base/";
	echo -e "\\n	In Folder $folder \\n"

	cd $folder
	git fetch https://github.com/bhb27/android_frameworks_base/ lineage-15.1 && git cherry-pick e26bc1c06abe7a382375a3e9ed3311ec4927d306
	cd - &> /dev/null || exit;

	echo -e "\\n	out Folder $folder"

	folder="frameworks/native/";
	echo -e "\\n	In Folder $folder \\n"

	cd $folder
	git fetch https://github.com/bhb27/frameworks_native/ oreo && git cherry-pick 01df205b39e2465a36deaf11f76f8a63da414c3d
	cd - &> /dev/null || exit;

	echo -e "\\n	out Folder $folder"

	folder="system/sepolicy/";
	echo -e "\\n	In Folder $folder \\n"

	cd $folder
	git fetch https://github.com/LineageOS/android_system_sepolicy refs/changes/47/205947/1 && git cherry-pick FETCH_HEAD
	cd - &> /dev/null || exit;

	echo -e "\\n	out Folder $folder"

	folder="system/core/";
	echo -e "\\n	In Folder $folder \\n"

	cd $folder
	git fetch https://github.com/bhb27/system_core/ lineage-15.1 && git cherry-pick 2ae38319deb341f5a87c60f19ed7efca19e9c103
	cd - &> /dev/null || exit;

	echo -e "\\n	out Folder $folder"

	folder="packages/apps/Nfc";
	echo -e "\\n	In Folder $folder \\n"

	cd $folder
	git fetch https://github.com/bhb27/android_packages_apps_Nfc/ cm-14.1 && git cherry-pick 8314ecd4ff33f8d51228314849b6b9f88fae34cd
	cd - &> /dev/null || exit;

	echo -e "\\n	out Folder $folder"

	folder="hardware/qcom/bt-caf";
	echo -e "\\n	In Folder $folder \\n"

	cd $folder
	git revert ddaccd2176683b6de272e7d2718557dbe9b9fe1b --no-edit
	git revert 90fd648335032144de1900fcda33c96458eb2606 --no-edit
	cd - &> /dev/null || exit;

	echo -e "\\n	out Folder $folder"

fi

export WITH_SU=true
. build/envsetup.sh
if [ "$input2" == "1" ]; then
	export JACK_SERVER_VM_ARGUMENTS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx11g"
	./prebuilts/sdk/tools/jack-admin kill-server
	./prebuilts/sdk/tools/jack-admin start-server
	make clean
fi

if [ "$input3" == "r" ]; then
	lunch rr_quark-userdebug
elif [ "$input3" == "o" ]; then
	lunch lineage_quark-userdebug
fi

time mka bacon -j8 2>&1 | tee quark.txt

# final time display *cosmetic...
END2="$(date)";
END=$(date +%s.%N);
echo -e "\nBuild start $START2";
echo -e "Build end   $END2 \n";
echo -e "\n${bldgrn}Total time elapsed: $(echo "($END - $START) / 60"|bc ):$(echo "(($END - $START) - (($END - $START) / 60) * 60)"|bc ) (minutes:seconds). \n";

#sudo shutdown -h now;

