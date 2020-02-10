#!/bin/bash
#
#SBATCH --job-name=job0
#SBATCH --output=job0_%j.res.txt
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --partition=express
# Time format = HH:MM:SS, DD-HH:MM:SS
#
#SBATCH --time=00:10:00
#
# Mimimum memory required per allocated  CPU  in  MegaBytes.
#
#SBATCH --mem-per-cpu=4000
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=$USER@uab.edu

#Set your environment here

#Run your commands here
srun hostname
srun sleep 120
