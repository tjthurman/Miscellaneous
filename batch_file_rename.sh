for i in *_sorted_test.bam
do
echo $i
newfile=`echo $i | sed 's/_sorted_test.bam\+/_sorted.bam/'`
mv $i $newfile
done
