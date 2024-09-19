

###mpirun -machinefile $PBS_NODEFILE -n 80

#################################### WT Amber ################################################
cd /scratch/dvaibhav/largefile/Proper/Analysis/WT_Amber/
### First make index file
gmx_mpi make_ndx -f em.gro -o idx.ndx <index.dat

### rmsd helix residues #########################
echo 19 19 | gmx_mpi rms -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o rms_chwam.xvg -fit rot+trans
echo 20 20 | gmx_mpi rms -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o rms_bhwam.xvg -fit rot+trans

### rmsd helix 1
echo 22 22 | gmx_mpi rms -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o rms_ch1wam.xvg -fit rot+trans
echo 23 23 | gmx_mpi rms -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o rms_bh1wam.xvg -fit rot+trans

### rmsd helix 2
echo 25 25 | gmx_mpi rms -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o rms_ch2wam.xvg -fit rot+trans
echo 26 26 | gmx_mpi rms -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o rms_bh2wam.xvg -fit rot+trans

### rmsd helix 3
echo 28 28 | gmx_mpi rms -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o rms_ch3wam.xvg -fit rot+trans
echo 29 29 | gmx_mpi rms -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o rms_bh3wam.xvg -fit rot+trans

##### Hbond #####################
echo 1 1 | gmx_mpi hbond -f md_1000ns_fit.xtc -s em.tpr -num hb_wam.xvg

# Helix residues
echo 18 18 | gmx_mpi hbond -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -num hb_hwam.xvg

## Helix 1
echo 21 21 | gmx_mpi hbond -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -num hb_h1wam.xvg 

## Helix 2
echo 24 24 | gmx_mpi hbond -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -num hb_h2wam.xvg 

## Helix 3
echo 27 27 | gmx_mpi hbond -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -num hb_h3wam.xvg 

##### Radius of gyration #############
# Rg of protein 
echo 1 | gmx_mpi gyrate -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o gyrate_wam.xvg

# Rg of Helix 1
echo 21 | gmx_mpi gyrate -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o gyrate_h1wam.xvg

# Rg of Helix 2
echo 24 | gmx_mpi gyrate -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o gyrate_h2wam.xvg

# Rg of Helix 3
echo 27 | gmx_mpi gyrate -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o gyrate_h3wam.xvg

## DSSP
### All residues

# NO JUMP 
echo 0 | gmx_mpi trjconv -f md_1000ns.xtc -s em.tpr -o md_1000ns_nojump_dssp.xtc -pbc nojump

# PBC
echo 1 1 | gmx_mpi trjconv -f md_1000ns_nojump_dssp.xtc -s em.tpr -o md_1000ns_noPBC_dssp.xtc -pbc mol -center

# FIT
echo 1 1 | gmx_mpi trjconv -f md_1000ns_nojump_dssp.xtc -s em.tpr -o md_1000ns_fit_dssp.xtc -fit rot+trans

# Protein 
echo 1 | gmx_mpi do_dssp -f md_1000ns_fit_dssp.xtc -s em.tpr -n idx.ndx -o ss_wam.xpm -sc ss_wam.xvg -ssdump ss_chi_wam.dat -dt 200

## Helix 1
echo 21 | gmx_mpi do_dssp -f md_1000ns_fit_dssp.xtc -s em.tpr -n idx.ndx -o ss_h1wam.xpm -sc ss_wam.xvg -ssdump ss_chi_h1wam.dat -dt 200

## Helix 2
echo 24 | gmx_mpi do_dssp -f md_1000ns_fit_dssp.xtc -s em.tpr -n idx.ndx -o ss_h2wam.xpm -sc ss_wam.xvg -ssdump ss_chi_h2wam.dat -dt 200

##Helix 3
echo 27 | gmx_mpi do_dssp -f md_1000ns_fit_dssp.xtc -s em.tpr -n idx.ndx -o ss_h3wam.xpm -sc ss_wam.xvg -ssdump ss_chi_h3wam.dat -dt 200



#################################### MT Amber ################################################
cd /scratch/dvaibhav/largefile/Proper/Analysis/MT_Amber/
### First make index file
gmx_mpi make_ndx -f em.gro -o idx.ndx <index.dat

### rmsd helix residues #########################
echo 19 19 | gmx_mpi rms -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o rms_chmam.xvg -fit rot+trans
echo 20 20 | gmx_mpi rms -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o rms_bhmam.xvg -fit rot+trans

### rmsd helix 1
echo 22 22 | gmx_mpi rms -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o rms_ch1mam.xvg -fit rot+trans
echo 23 23 | gmx_mpi rms -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o rms_bh1mam.xvg -fit rot+trans

### rmsd helix 2
echo 25 25 | gmx_mpi rms -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o rms_ch2mam.xvg -fit rot+trans
echo 26 26 | gmx_mpi rms -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o rms_bh2mam.xvg -fit rot+trans

### rmsd helix 3
echo 28 28 | gmx_mpi rms -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o rms_ch3mam.xvg -fit rot+trans
echo 29 29 | gmx_mpi rms -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o rms_bh3mam.xvg -fit rot+trans

##### Hbond #####################
echo 1 1 | gmx_mpi hbond -f md_1000ns_fit.xtc -s em.tpr -num hb_mam.xvg

# Helix residues
echo 18 18 | gmx_mpi hbond -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -num hb_hmam.xvg

## Helix 1
echo 21 21 | gmx_mpi hbond -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -num hb_h1mam.xvg 

## Helix 2
echo 24 24 | gmx_mpi hbond -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -num hb_h2mam.xvg 

## Helix 3
echo 27 27 | gmx_mpi hbond -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -num hb_h3mam.xvg 

##### Radius of gyration #############
# Rg of protein 
echo 1 | gmx_mpi gyrate -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o gyrate_mam.xvg

# Rg of Helix 1
echo 21 | gmx_mpi gyrate -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o gyrate_h1mam.xvg

# Rg of Helix 2
echo 24 | gmx_mpi gyrate -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o gyrate_h2mam.xvg

# Rg of Helix 3
echo 27 | gmx_mpi gyrate -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o gyrate_h3mam.xvg

## DSSP
### All residues

# NO JUMP 
echo 0 | gmx_mpi trjconv -f md_1000ns.xtc -s em.tpr -o md_1000ns_nojump_dssp.xtc -pbc nojump

# PBC
echo 1 1 | gmx_mpi trjconv -f md_1000ns_nojump_dssp -s em.tpr -o md_1000ns_noPBC_dssp.xtc -pbc mol -center

# FIT
echo 1 1 | gmx_mpi trjconv -f md_1000ns_nojump_dssp -s em.tpr -o md_1000ns_fit_dssp.xtc -fit rot+trans

# Protein 
echo 1 | gmx_mpi do_dssp -f md_1000ns_fit_dssp.xtc -s em.tpr -n idx.ndx -o ss_mam.xpm -sc ss_mam.xvg -ssdump ss_chi_mam.dat -dt 200

## Helix 1
echo 21 | gmx_mpi do_dssp -f md_1000ns_fit_dssp.xtc -s em.tpr -n idx.ndx -o ss_h1mam.xpm -sc ss_mam.xvg -ssdump ss_chi_h1mam.dat -dt 200

## Helix 2
echo 24 | gmx_mpi do_dssp -f md_1000ns_fit_dssp.xtc -s em.tpr -n idx.ndx -o ss_h2mam.xpm -sc ss_mam.xvg -ssdump ss_chi_h2mam.dat -dt 200

## Helix 3
echo 27 | gmx_mpi do_dssp -f md_1000ns_fit_dssp.xtc -s em.tpr -n idx.ndx -o ss_h3mam.xpm -sc ss_mam.xvg -ssdump ss_chi_h3mam.dat -dt 200



#################################### WT Charmm ################################################
cd /scratch/dvaibhav/largefile/Proper/Analysis/WT_Charmm/
### First make index file
gmx_mpi make_ndx -f em.gro -o idx.ndx <index.dat

### rmsd helix residues #########################
echo 19 19 | gmx_mpi rms -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o rms_chwch.xvg -fit rot+trans
echo 20 20 | gmx_mpi rms -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o rms_bhwch.xvg -fit rot+trans

### rmsd helix 1
echo 22 22 | gmx_mpi rms -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o rms_ch1wch.xvg -fit rot+trans
echo 23 23 | gmx_mpi rms -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o rms_bh1wch.xvg -fit rot+trans

### rmsd helix 2
echo 25 25 | gmx_mpi rms -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o rms_ch2wch.xvg -fit rot+trans
echo 26 26 | gmx_mpi rms -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o rms_bh2wch.xvg -fit rot+trans

### rmsd helix 3
echo 28 28 | gmx_mpi rms -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o rms_ch3wch.xvg -fit rot+trans
echo 29 29 | gmx_mpi rms -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o rms_bh3wch.xvg -fit rot+trans

##### Hbond #####################
echo 1 1 | gmx_mpi hbond -f md_1000ns_fit.xtc -s em.tpr -num hb_wch.xvg

# Helix residues
echo 18 18 | gmx_mpi hbond -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -num hb_hwch.xvg

## Helix 1
echo 21 21 | gmx_mpi hbond -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -num hb_h1wch.xvg 

## Helix 2
echo 24 24 | gmx_mpi hbond -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -num hb_h2wch.xvg 

## Helix 3
echo 27 27 | gmx_mpi hbond -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -num hb_h3wch.xvg 

##### Radius of gyration #############
# Rg of protein 
echo 1 | gmx_mpi gyrate -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o gyrate_wch.xvg

# Rg of Helix 1
echo 21 | gmx_mpi gyrate -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o gyrate_h1wch.xvg

# Rg of Helix 2
echo 24 | gmx_mpi gyrate -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o gyrate_h2wch.xvg

# Rg of Helix 3
echo 27 | gmx_mpi gyrate -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o gyrate_h3wch.xvg

## DSSP
### All residues

# NO JUMP 
echo 0 | gmx_mpi trjconv -f md_1000ns.xtc -s em.tpr -o md_1000ns_nojump_dssp.xtc -pbc nojump

# PBC
echo 1 1 | gmx_mpi trjconv -f md_1000ns_nojump_dssp -s em.tpr -o md_1000ns_noPBC_dssp.xtc -pbc mol -center

# FIT
echo 1 1 | gmx_mpi trjconv -f md_1000ns_nojump_dssp -s em.tpr -o md_1000ns_fit_dssp.xtc -fit rot+trans

# Protein 
echo 1 | gmx_mpi do_dssp -f md_1000ns_fit_dssp.xtc -s em.tpr -n idx.ndx -o ss_wch.xpm -sc ss_wch.xvg -ssdump ss_chi_wch.dat -dt 200

### Helix 1
echo 21 | gmx_mpi do_dssp -f md_1000ns_fit_dssp.xtc -s em.tpr -n idx.ndx -o ss_h1wch.xpm -sc ss_wch.xvg -ssdump ss_chi_h1wch.dat -dt 200

###Helix 2
echo 24 | gmx_mpi do_dssp -f md_1000ns_fit_dssp.xtc -s em.tpr -n idx.ndx -o ss_h2wch.xpm -sc ss_wch.xvg -ssdump ss_chi_h2wch.dat -dt 200

### Helix 3
echo 27 | gmx_mpi do_dssp -f md_1000ns_fit_dssp.xtc -s em.tpr -n idx.ndx -o ss_h3wch.xpm -sc ss_wch.xvg -ssdump ss_chi_h3wch.dat -dt 200



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
















