#################################### MT Charmm ################################################
cd /scratch/dvaibhav/largefile/Proper/Analysis/MT_Charmm/
### First make index file
gmx_mpi make_ndx -f em.gro -o idx.ndx <index.dat

### rmsd helix residues #########################
echo 19 19 | gmx_mpi rms -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o rms_chmch.xvg -fit rot+trans
echo 20 20 | gmx_mpi rms -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o rms_bhmch.xvg -fit rot+trans

### rmsd helix 1
echo 22 22 | gmx_mpi rms -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o rms_ch1mch.xvg -fit rot+trans
echo 23 23 | gmx_mpi rms -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o rms_bh1mch.xvg -fit rot+trans

### rmsd helix 2
echo 25 25 | gmx_mpi rms -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o rms_ch2mch.xvg -fit rot+trans
echo 26 26 | gmx_mpi rms -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o rms_bh2mch.xvg -fit rot+trans

### rmsd helix 3
echo 28 28 | gmx_mpi rms -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o rms_ch3mch.xvg -fit rot+trans
echo 29 29 | gmx_mpi rms -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o rms_bh3mch.xvg -fit rot+trans

##### Hbond #####################
echo 1 1 | gmx_mpi hbond -f md_1000ns_fit.xtc -s em.tpr -num hb_mch.xvg

# Helix residues
echo 18 18 | gmx_mpi hbond -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -num hb_hmch.xvg

## Helix 1
echo 21 21 | gmx_mpi hbond -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -num hb_h1mch.xvg 

## Helix 2
echo 24 24 | gmx_mpi hbond -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -num hb_h2mch.xvg 

## Helix 3
echo 27 27 | gmx_mpi hbond -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -num hb_h3mch.xvg 

##### Radius of gyration #############
# Rg of protein 
echo 1 | gmx_mpi gyrate -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o gyrate_mch.xvg

# Rg of Helix 1
echo 21 | gmx_mpi gyrate -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o gyrate_h1mch.xvg

# Rg of Helix 2
echo 24 | gmx_mpi gyrate -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o gyrate_h2mch.xvg

# Rg of Helix 3
echo 27 | gmx_mpi gyrate -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o gyrate_h3mch.xvg

## DSSP
### All residues

# NO JUMP 
echo 0 | gmx_mpi trjconv -f md_1000ns.xtc -s em.tpr -o md_1000ns_nojump_dssp.xtc -pbc nojump

# PBC
echo 1 1 | gmx_mpi trjconv -f md_1000ns_nojump_dssp -s em.tpr -o md_1000ns_noPBC_dssp.xtc -pbc mol -center

# FIT
echo 1 1 | gmx_mpi trjconv -f md_1000ns_nojump_dssp -s em.tpr -o md_1000ns_fit_dssp.xtc -fit rot+trans

# Protein 
echo 1 | gmx_mpi do_dssp -f md_1000ns_fit_dssp.xtc -s em.tpr -n idx.ndx -o ss_mch.xpm -sc ss_mch.xvg -ssdump ss_chi_mch.dat -dt 200

### Helix 1
echo 21 | gmx_mpi do_dssp -f md_1000ns_fit_dssp.xtc -s em.tpr -n idx.ndx -o ss_h1mch.xpm -sc ss_mch.xvg -ssdump ss_chi_h1mch.dat -dt 200

### Helix 2
echo 24 | gmx_mpi do_dssp -f md_1000ns_fit_dssp.xtc -s em.tpr -n idx.ndx -o ss_h2mch.xpm -sc ss_mch.xvg -ssdump ss_chi_h2mch.dat -dt 200

### Helix 3
echo 27 | gmx_mpi do_dssp -f md_1000ns_fit_dssp.xtc -s em.tpr -n idx.ndx -o ss_h3mch.xpm -sc ss_mch.xvg -ssdump ss_chi_h3mch.dat -dt 200

