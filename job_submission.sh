#!/bin/bash

# first job - no dependencies
jid0=$(./sbr job0.sbatch)
echo $jid0
jid1=$(./sbr --dependency=afterany:$jid0 job1.sbatch)
echo $jid1
# multiple jobs can depend on a single job
jid2=$(./sbr --dependency=afterany:$jid1 job2.sbatch)
echo $jid2

jid3=$(./sbr --dependency=afterany:$jid2 job03.sbatch)
echo $jid3

# a single job can depend on multiple jobs
#jid4=$(sbatch  --dependency=afterany:$jid2:$jid3 job4.sh)

# swarm can use dependencies
#jid5=$(swarm --dependency=afterany:$jid4 -t 4 -g 4 -f job5.sh)

# a single job can depend on an array job
# it will start executing when all arrayjobs have finished
#jid6=$(sbatch --dependency=afterany:$jid5 job6.sh)

# a single job can depend on all jobs by the same user with the same name
#jid7=$(sbatch --dependency=afterany:$jid6 --job-name=dtest job7.sh)
#jid8=$(sbatch --dependency=afterany:$jid6 --job-name=dtest job8.sh)
#sbatch --dependency=singleton --job-name=dtest job9.sh

# show dependencies in squeue output:
squeue -u $USER -o "%.8A %.4C %.10m %.20E"
