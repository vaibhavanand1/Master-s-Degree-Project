
### Analysis of rmsd, rmsf for incomplete job i.e. WT_Charmm, MT_Charmm and MT_C36m

##### MT Charmm36m
cd /scratch/dvaibhav/largefile/Proper/Analysis/MT_C36m/

# No jump
echo 0 | gmx_mpi trjconv -f md_1000ns.xtc -s em.tpr -o md_1000ns_nojump.xtc -pbc nojump

# PBC
echo 1 0 | gmx_mpi trjconv -f md_1000ns_nojump.xtc -s em.tpr -o md_1000ns_noPBC.xtc -pbc mol -center

# FIT
echo 1 0 | gmx_mpi trjconv -f md_1000ns_noPBC.xtc -s em.tpr -o md_1000ns_fit.xtc -fit rot+trans

# RMSD
echo 3 3 | gmx_mpi rms -f md_1000ns_fit.xtc -s em.tpr -o rms_cmc36m.xvg -fit rot+trans
echo 4 4 | gmx_mpi rms -f md_1000ns_fit.xtc -s em.tpr -o rms_bmc36m.xvg -fit rot+trans

# RMSF
echo 3 | gmx_mpi rmsf -f md_1000ns_fit.xtc -s em.tpr -o rmsf_cmc36m.xvg -res -fit
echo 4 | gmx_mpi rmsf -f md_1000ns_fit.xtc -s em.tpr -o rmsf_bmc36m.xvg -res -fit

##### WT Charmm
cd /scratch/dvaibhav/largefile/Proper/Analysis/WT_Charmm/

# No jump
echo 0 | gmx_mpi trjconv -f md_1000ns.xtc -s em.tpr -o md_1000ns_nojump.xtc -pbc nojump

# PBC
echo 1 0 | gmx_mpi trjconv -f md_1000ns_nojump.xtc -s em.tpr -o md_1000ns_noPBC.xtc -pbc mol -center

# FIT
echo 1 0 | gmx_mpi trjconv -f md_1000ns_noPBC.xtc -s em.tpr -o md_1000ns_fit.xtc -fit rot+trans

# RMSD
echo 3 3 | gmx_mpi rms -f md_1000ns_fit.xtc -s em.tpr -o rms_cwch.xvg -fit rot+trans
echo 4 4 | gmx_mpi rms -f md_1000ns_fit.xtc -s em.tpr -o rms_bwch.xvg -fit rot+trans

# RMSF
echo 3 | gmx_mpi rmsf -f md_1000ns_fit.xtc -s em.tpr -o rmsf_cwch.xvg -res -fit
echo 4 | gmx_mpi rmsf -f md_1000ns_fit.xtc -s em.tpr -o rmsf_bwch.xvg -res -fit

##### MT Charmm
cd /scratch/dvaibhav/largefile/Proper/Analysis/MT_Charmm/

# No jump
echo 0 | gmx_mpi trjconv -f md_1000ns.xtc -s em.tpr -o md_1000ns_nojump.xtc -pbc nojump

# PBC
echo 1 0 | gmx_mpi trjconv -f md_1000ns_nojump.xtc -s em.tpr -o md_1000ns_noPBC.xtc -pbc mol -center

# FIT
echo 1 0 | gmx_mpi trjconv -f md_1000ns_noPBC.xtc -s em.tpr -o md_1000ns_fit.xtc -fit rot+trans

# RMSD
echo 3 3 | gmx_mpi rms -f md_1000ns_fit.xtc -s em.tpr -o rms_cmch.xvg -fit rot+trans
echo 4 4 | gmx_mpi rms -f md_1000ns_fit.xtc -s em.tpr -o rms_bmch.xvg -fit rot+trans

# RMSF
echo 3 | gmx_mpi rmsf -f md_1000ns_fit.xtc -s em.tpr -o rmsf_cmch.xvg -res -fit
echo 4 | gmx_mpi rmsf -f md_1000ns_fit.xtc -s em.tpr -o rmsf_bmch.xvg -res -fit


##### WT OPLS (P equilibrated)
cd /scratch/dvaibhav/largefile/Proper/Analysis/WT_OPLS__/WT_OPLS/

# No jump
echo 0 | gmx_mpi trjconv -f md_1000ns.xtc -s em.tpr -o md_1000ns_nojump.xtc -pbc nojump

# PBC
echo 1 0 | gmx_mpi trjconv -f md_1000ns_nojump.xtc -s em.tpr -o md_1000ns_noPBC.xtc -pbc mol -center

# FIT
echo 1 0 | gmx_mpi trjconv -f md_1000ns_noPBC.xtc -s em.tpr -o md_1000ns_fit.xtc -fit rot+trans

# RMSD
echo 3 3 | gmx_mpi rms -f md_1000ns_fit.xtc -s em.tpr -o rms_cwop.xvg -fit rot+trans
echo 4 4 | gmx_mpi rms -f md_1000ns_fit.xtc -s em.tpr -o rms_bwop.xvg -fit rot+trans

# RMSF
echo 3 | gmx_mpi rmsf -f md_1000ns_fit.xtc -s em.tpr -o rmsf_cwop.xvg -res -fit
echo 4 | gmx_mpi rmsf -f md_1000ns_fit.xtc -s em.tpr -o rmsf_bwop.xvg -res -fit
