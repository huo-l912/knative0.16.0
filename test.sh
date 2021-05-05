KNATIVE_PATH='knative'
KNATIVE_VER='v0.16.0'
REGISTRY_URL='18502483912'

# replace file image

cd $KNATIVE_PATH

counter=0
for file in *.yaml
do
    echo "��ʼ�����ļ� " $file

	while read line
	do
		origin_image=`echo ${line} | awk '{print $1}'`
		new_image=`echo ${line} | awk '{print $2}'`

	    tmp=${origin_image//\//__}
	    origin_image=${tmp//__/\\/}

	    tmp2=${new_image//\//__}
	    new_image=${tmp2//__/\\/}

	    # sed -i "s/${origin_image}/${new_image}/g" ${file}   
	    # �������У������MacOS/UNIX���滻Ϊ: 
        sed -i " " "s/${origin_image}/${new_image}/g" ${file}

	done < image.tmp
	counter=`expr ${counter} + 1`
done

echo "�������ļ�����" ${counter}

rm -rf *.yaml.1
cd ..


# finish

echo "completed..."