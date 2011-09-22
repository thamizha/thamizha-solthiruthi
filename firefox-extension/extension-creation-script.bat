#
# dos script to create firefox extension from the affx & .dic files. It uses cygwin tools that comes with git installation
#

# pull the latest dic & affx files from github and merge them
cd ..
git fetch origin
git merge origin/master

#
# merge the 4 dictionary files into one temp dic file
#
cat ta_TA.dic ta_TA_2.dic ta_TA_3.dic ta_TA_4.dic > new_ta_TA.dic

#
# compute the total number of lines in merged dic file and write that as first line of a new dic file and then merge the rest of the merged .dic file below that.
#
wc -l new_ta_TA.dic | awk -F " " '{print $1 }' > new2_ta_TA.dic
sed '1d' new_ta_TA.dic >> new2_ta_TA.dic

#
# move the merged dic file & copy the new affix file to dictionaries folder
#
mv new2_ta_TA.dic firefox-extension/thamizha_solthiruthi/dictionaries/
cp ta_TA.aff firefox-extension/thamizha_solthiruthi/dictionaries/

#
# remove the temporary file new_ta_TA.dic
#
rm new_ta_TA.dic

#
# remove existing dic and affx files in firefox extension & replace them with the new files
#
cd firefox-extension/thamizha_solthiruthi/dictionaries/
rm ta_IN.dic
rm ta_IN.aff
mv new2_ta_TA.dic ta_IN.dic
mv ta_TA.aff ta_IN.aff
