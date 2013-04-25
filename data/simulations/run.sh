# RUN SGE SCRIPT
#$ -l h_vmem=3G
#$ -l tmem=3G
#$ -l h_rt=24:0:00
#$ -S /bin/bash
#$ -wd /home/wmayor/simulations/
#$ -t 1-72
i=$(expr $SGE_TASK_ID - 1)
all=$(find . -name z*)
arr=($all)
d=${arr[$i]}
echo $d
cd "$d"
./run.sh
cd -
