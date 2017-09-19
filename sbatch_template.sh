#!/bin/bash

# SBATCH --ntasks=1 # For programs that aren't running with MPI parallelization
# SBATCH --cpus-per-task=32 # the number of cores to use. If a serial job, do 1. Max is 32, and that only works if the program you're working with can handle within-computer parallelization.
#SBATCH --mem=512000M # total memory to ask for. This value corresponds to the Bigmem500 nodes.
#SBATCH --time=0-00:05        # time (DD-HH:MM)
#SBATCH --mem-per-cpu=4G      # Memory per CPU. Not sure if we'll need this. Base compute nodes on cedar have 4GB per CPU.
#SBATCH --account=def-barrett # Account of barrett lab project (more data and priority)
#SBATCH --output="/home/tjthurm/barrett_tim/slurm_logs/%x%j.out" #where to send the errors and output from the console.
#SBATCH --mail-user=timothy.thurman@mail.mcgill.ca #where to send email to user
#SBATCH --mail-type=BEGIN,END,FAIL #when to email the user
#SBATCH --job-name=example
