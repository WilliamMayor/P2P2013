# RUN SGE SCRIPT
#$ -l h_vmem=4G
#$ -l tmem=4G
#$ -l h_rt=72:0:00
#$ -S /bin/bash
#$ -wd /home/wmayor/z1000r5000/
/share/apps/jdk1.7.0_09/bin/java -Xmx3g -Xms3g -jar SimPact-exp.jar
