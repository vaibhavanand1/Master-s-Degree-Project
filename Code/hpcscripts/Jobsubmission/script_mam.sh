#!/bin/sh
#SBATCH -N 2
#SBATCH --ntasks-per-node=48
#SBATCH --time=96:00:00
#SBATCH --job-name=run_mam
#SBATCH --error=run_mam_error
#SBATCH --output=run_mam_out
#SBATCH --partition=standard  

module load apps/gromacs/2019/gpu/intel_18.2_gcc_7.3.0_cuda_10.1


export I_MPI_FALLBACK=disable
export I_MPI_FABRICS=shm:dapl

export I_MPI_DEBUG=9

export OMP_NUM_THREADS=1


### cd /scratch/dvaibhav/vaibhav/UBA/WT_Amber/
cd /scratch/prathvi/vaibhav/MT_Amber/


# REMOVING CRYSTAL-WATER MOLECULES 
# grep -v HOH uba1_mt_.pdb > uba1_mt_clean.pdb

# CHOOSE FORCE-FIELD
# echo | gmx_mpi pdb2gmx -f uba1_mt_clean.pdb -o uba1_mt_processed.gro -water tip3p -ignh

# DEFINING BOX 
# gmx_mpi editconf -f uba1_mt_processed.gro -o uba1_mt_newbox.gro -c -d 1.0 -bt cubic

# SOLVATE THE SYSTEM
# gmx_mpi solvate -cp uba1_mt_newbox.gro -cs spc216.gro -o uba1_mt_solv.gro -p topol.top

# ADDTION OF IONS - NEUTRALIZE SYSTEM
# gmx_mpi grompp -f ions.mdp -c uba1_mt_solv.gro -p topol.top -o ions.tpr
# echo 13 | gmx_mpi genion -s ions.tpr -o uba1_mt_solv_ions.gro -p topol.top -pname NA -nname CL -neutral

# ENERGY MINIMIZATION
# gmx_mpi grompp -f minim.mdp -c uba1_mt_solv_ions.gro -p topol.top -o em.tpr
mpirun gmx_mpi mdrun -v -deffnm em

####### EQUILIBRIATION

# NVT Equilibriation at 4000 of position restraints
gmx_mpi grompp -f nvt_4000.mdp -c em.gro -r em.gro -p topol_nvt_4000.top -o nvt_4000.tpr
mpirun gmx_mpi mdrun -v -deffnm nvt_4000

# NPT equilibriation [4000]
gmx_mpi grompp -f npt_4000.mdp -c nvt_4000.gro -r nvt_4000.gro -t nvt_4000.cpt -p topol_npt_4000.top -o npt_4000.tpr
mpirun gmx_mpi mdrun -v -deffnm npt_4000

# NPT equilibriation [2000]
gmx_mpi grompp -f npt_2000.mdp -c npt_4000.gro -r npt_4000.gro -t npt_4000.cpt -p topol_npt_2000.top -o npt_2000.tpr
mpirun gmx_mpi mdrun -v -deffnm npt_2000

# NPT equilibriation [1000]
gmx_mpi grompp -f npt_1000.mdp -c npt_2000.gro -r npt_2000.gro -t npt_2000.cpt -p topol_npt_1000.top -o npt_1000.tpr
mpirun gmx_mpi mdrun -v -deffnm npt_1000

# NPT equilibriation [500]
gmx_mpi grompp -f npt_500.mdp -c npt_1000.gro -r npt_1000.gro -t npt_1000.cpt -p topol_npt_500.top -o npt_500.tpr
mpirun gmx_mpi mdrun -v -deffnm npt_500

# NPT equilibriation [250]
gmx_mpi grompp -f npt_250.mdp -c npt_500.gro -r npt_500.gro -t npt_500.cpt -p topol_npt_250.top -o npt_250.tpr
mpirun gmx_mpi mdrun -v -deffnm npt_250

# NPT equilibriation [100]
gmx_mpi grompp -f npt_100.mdp -c npt_250.gro -r npt_250.gro -t npt_250.cpt -p topol_npt_100.top -o npt_100.tpr
mpirun gmx_mpi mdrun -v -deffnm npt_100

# NPT equilibriation [50]
gmx_mpi grompp -f npt_50.mdp -c npt_100.gro -r npt_100.gro -t npt_100.cpt -p topol_npt_50.top -o npt_50.tpr
mpirun gmx_mpi mdrun -v -deffnm npt_50

# NPT equilibriation [10]
gmx_mpi grompp -f npt_10.mdp -c npt_50.gro -r npt_50.gro -t npt_50.cpt -p topol_npt_10.top -o npt_10.tpr
mpirun gmx_mpi mdrun -v -deffnm npt_10

# NPT equilibriation [0]
gmx_mpi grompp -f npt_0.mdp -c npt_10.gro -r npt_10.gro -t npt_10.cpt -p topol_npt_0.top -o npt_0.tpr
mpirun gmx_mpi mdrun -v -deffnm npt_0

# RELAXATION 100ns
gmx_mpi grompp -f md_100ns.mdp -c npt_0.gro -t npt_0.cpt -p topol.top -o md_100ns.tpr
mpirun gmx_mpi mdrun -v -deffnm md_100ns

# PRODUCTION RUN [1000ms]
gmx_mpi grompp -f md_1000ns.mdp -c md_100ns.gro -t md_100ns.cpt -p topol.top -o md_1000ns.tpr
mpirun gmx_mpi mdrun -v -deffnm md_1000ns

################ ANALYSIS ######################################################

# No jump
echo 0 | gmx_mpi trjconv -f md_1000ns.xtc -s em.tpr -o md_1000ns_nojump.xtc -pbc nojump

# PBC
echo 1 0 | gmx_mpi trjconv -f md_1000ns_nojump.xtc -s em.tpr -o md_1000ns_noPBC.xtc -pbc mol -center

# FIT
echo 1 0 | gmx_mpi trjconv -f md_1000ns_noPBC.xtc -s em.tpr -o md_1000ns_fit.xtc -fit rot+trans

# RMSD
echo 3 3 | gmx_mpi rms -f md_1000ns_fit.xtc -s em.tpr -o rms_cmam.xvg -fit rot+trans
echo 4 4 | gmx_mpi rms -f md_1000ns_fit.xtc -s em.tpr -o rms_bmam.xvg -fit rot+trans

# RMSF
echo 3 | gmx_mpi rmsf -f md_1000ns_fit.xtc -s em.tpr -o rmsf_cmam.xvg -res -fit
echo 4 | gmx_mpi rmsf -f md_1000ns_fit.xtc -s em.tpr -o rmsf_bmam.xvg -res -fit

