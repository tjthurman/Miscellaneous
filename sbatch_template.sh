#!/bin/bash

#SBATCH -n 32                 # number of CPUs/cores you request. Unless you're doing an MPI job, can't be more than 32
#SBATCH --time=0-00:05        # time (DD-HH:MM)
#SBATCH --mem-per-cpu=4G      # Memory per CPU. Not sure if we'll need this. Base compute nodes on cedar have 4GB per CPU.
#SBATCH --account=def-barrett # Account of barrett lab project (more data and priority)
#SBATCH --output=/home/tjthurm/project/tjthurm/slum_logs/%X%j.out #where to send the errors and output from the console.
#SBATCH --mail-user=timothy.thurman@mail.mcgill.ca #where to send email to user
#SBATCH --mail-type=BEGIN,END,FAIL #when to email the user
#SBATCH --job-name=example
