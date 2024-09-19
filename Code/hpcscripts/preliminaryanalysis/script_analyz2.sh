
#################################### WT C36m ################################################
cd /scratch/dvaibhav/largefile/Proper/Analysis/WT_C36m/
### First make index file
gmx_mpi make_ndx -f em.gro -o idx.ndx <index.dat

### rmsd helix residues #########################
echo 19 19 | gmx_mpi rms -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o rms_chwc36m.xvg -fit rot+trans
echo 20 20 | gmx_mpi rms -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o rms_bhwc36m.xvg -fit rot+trans

### rmsd helix 1
echo 22 22 | gmx_mpi rms -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o rms_ch1wc36m.xvg -fit rot+trans
echo 23 23 | gmx_mpi rms -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o rms_bh1wc36m.xvg -fit rot+trans

### rmsd helix 2
echo 25 25 | gmx_mpi rms -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o rms_ch2wc36m.xvg -fit rot+trans
echo 26 26 | gmx_mpi rms -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o rms_bh2wc36m.xvg -fit rot+trans

### rmsd helix 3
echo 28 28 | gmx_mpi rms -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o rms_ch3wc36m.xvg -fit rot+trans
echo 29 29 | gmx_mpi rms -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o rms_bh3wc36m.xvg -fit rot+trans

##### Hbond #####################
echo 1 1 | gmx_mpi hbond -f md_1000ns_fit.xtc -s em.tpr -num hb_wc36m.xvg

# Helix residues
echo 18 18 | gmx_mpi hbond -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -num hb_hwc36m.xvg

## Helix 1
echo 21 21 | gmx_mpi hbond -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -num hb_h1wc36m.xvg 

## Helix 2
echo 24 24 | gmx_mpi hbond -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -num hb_h2wc36m.xvg 

## Helix 3
echo 27 27 | gmx_mpi hbond -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -num hb_h3wc36m.xvg 

##### Radius of gyration #############
# Rg of protein 
echo 1 | gmx_mpi gyrate -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o gyrate_wc36m.xvg

# Rg of Helix 1
echo 21 | gmx_mpi gyrate -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o gyrate_h1wc36m.xvg

# Rg of Helix 2
echo 24 | gmx_mpi gyrate -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o gyrate_h2wc36m.xvg

# Rg of Helix 3
echo 27 | gmx_mpi gyrate -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o gyrate_h3wc36m.xvg

## DSSP
### All residues

# NO JUMP 
echo 0 | gmx_mpi trjconv -f md_1000ns.xtc -s em.tpr -o md_1000ns_nojump_dssp.xtc -pbc nojump

# PBC
echo 1 1 | gmx_mpi trjconv -f md_1000ns_nojump_dssp.xtc -s em.tpr -o md_1000ns_noPBC_dssp.xtc -pbc mol -center

# FIT
echo 1 1 | gmx_mpi trjconv -f md_1000ns_nojump_dssp.xtc -s em.tpr -o md_1000ns_fit_dssp.xtc -fit rot+trans

# Protein 
echo 1 | gmx_mpi do_dssp -f md_1000ns_fit_dssp.xtc -s em.tpr -n idx.ndx -o ss_wc36m.xpm -sc ss_wc36m.xvg -ssdump ss_chi_wc36m.dat -dt 200

## Helix 1
echo 21 | gmx_mpi do_dssp -f md_1000ns_fit_dssp.xtc -s em.tpr -n idx.ndx -o ss_h1wc36m.xpm -sc ss_wc36m.xvg -ssdump ss_chi_h1wc36m.dat -dt 200

## Helix 2
echo 24 | gmx_mpi do_dssp -f md_1000ns_fit_dssp.xtc -s em.tpr -n idx.ndx -o ss_h2wc36m.xpm -sc ss_wc36m.xvg -ssdump ss_chi_h2wc36m.dat -dt 200

## Helix 3
echo 27 | gmx_mpi do_dssp -f md_1000ns_fit_dssp.xtc -s em.tpr -n idx.ndx -o ss_h3wc36m.xpm -sc ss_wc36m.xvg -ssdump ss_chi_h3wc36m.dat -dt 200



#################################### MT C36m ################################################
cd /scratch/dvaibhav/largefile/Proper/Analysis/MT_C36m/
### First make index file
gmx_mpi make_ndx -f em.gro -o idx.ndx <index.dat

### rmsd helix residues #########################
echo 19 19 | gmx_mpi rms -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o rms_chmc36m.xvg -fit rot+trans
echo 20 20 | gmx_mpi rms -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o rms_bhmc36m.xvg -fit rot+trans

### rmsd helix 1
echo 22 22 | gmx_mpi rms -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o rms_ch1mc36m.xvg -fit rot+trans
echo 23 23 | gmx_mpi rms -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o rms_bh1mc36m.xvg -fit rot+trans

### rmsd helix 2
echo 25 25 | gmx_mpi rms -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o rms_ch2mc36m.xvg -fit rot+trans
echo 26 26 | gmx_mpi rms -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o rms_bh2mc36m.xvg -fit rot+trans

### rmsd helix 3
echo 28 28 | gmx_mpi rms -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o rms_ch3mc36m.xvg -fit rot+trans
echo 29 29 | gmx_mpi rms -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o rms_bh3mc36m.xvg -fit rot+trans

##### Hbond #####################
echo 1 1 | gmx_mpi hbond -f md_1000ns_fit.xtc -s em.tpr -num hb_mc36m.xvg

# Helix residues
echo 18 18 | gmx_mpi hbond -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -num hb_hmc36m.xvg

## Helix 1
echo 21 21 | gmx_mpi hbond -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -num hb_h1mc36m.xvg 

## Helix 2
echo 24 24 | gmx_mpi hbond -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -num hb_h2mc36m.xvg 

## Helix 3
echo 27 27 | gmx_mpi hbond -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -num hb_h3mc36m.xvg 

##### Radius of gyration #############
# Rg of protein 
echo 1 | gmx_mpi gyrate -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o gyrate_mc36m.xvg

# Rg of Helix 1
echo 21 | gmx_mpi gyrate -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o gyrate_h1mc36m.xvg

# Rg of Helix 2
echo 24 | gmx_mpi gyrate -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o gyrate_h2mc36m.xvg

# Rg of Helix 3
echo 27 | gmx_mpi gyrate -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o gyrate_h3mc36m.xvg

## DSSP
### All residues

# NO JUMP 
echo 0 | gmx_mpi trjconv -f md_1000ns.xtc -s em.tpr -o md_1000ns_nojump_dssp.xtc -pbc nojump

# PBC
echo 1 1 | gmx_mpi trjconv -f md_1000ns_nojump_dssp.xtc -s em.tpr -o md_1000ns_noPBC_dssp.xtc -pbc mol -center

# FIT
echo 1 1 | gmx_mpi trjconv -f md_1000ns_nojump_dssp.xtc -s em.tpr -o md_1000ns_fit_dssp.xtc -fit rot+trans

# Protein 
echo 1 | gmx_mpi do_dssp -f md_1000ns_fit_dssp.xtc -s em.tpr -n idx.ndx -o ss_mc36m.xpm -sc ss_mc36m.xvg -ssdump ss_chi_mc36m.dat -dt 200

## Helix 1
echo 21 | gmx_mpi do_dssp -f md_1000ns_fit_dssp.xtc -s em.tpr -n idx.ndx -o ss_h1mc36m.xpm -sc ss_mc36m.xvg -ssdump ss_chi_h1mc36m.dat -dt 200

## Helix 2
echo 24 | gmx_mpi do_dssp -f md_1000ns_fit_dssp.xtc -s em.tpr -n idx.ndx -o ss_h2mc36m.xpm -sc ss_mc36m.xvg -ssdump ss_chi_h2mc36m.dat -dt 200

## Helix 3
echo 27 | gmx_mpi do_dssp -f md_1000ns_fit_dssp.xtc -s em.tpr -n idx.ndx -o ss_h3mc36m.xpm -sc ss_mc36m.xvg -ssdump ss_chi_h3mc36m.dat -dt 200


#################################### WT OPLS ################################################
cd /scratch/dvaibhav/largefile/Proper/Analysis/WT_OPLS/
### First make index file
gmx_mpi make_ndx -f em.gro -o idx.ndx <index.dat

### rmsd helix residues #########################
echo 19 19 | gmx_mpi rms -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o rms_chwop.xvg -fit rot+trans
echo 20 20 | gmx_mpi rms -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o rms_bhwop.xvg -fit rot+trans

### rmsd helix 1
echo 22 22 | gmx_mpi rms -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o rms_ch1wop.xvg -fit rot+trans
echo 23 23 | gmx_mpi rms -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o rms_bh1wop.xvg -fit rot+trans

### rmsd helix 2
echo 25 25 | gmx_mpi rms -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o rms_ch2wop.xvg -fit rot+trans
echo 26 26 | gmx_mpi rms -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o rms_bh2wop.xvg -fit rot+trans

### rmsd helix 3
echo 28 28 | gmx_mpi rms -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o rms_ch3wop.xvg -fit rot+trans
echo 29 29 | gmx_mpi rms -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o rms_bh3wop.xvg -fit rot+trans

##### Hbond #####################
echo 1 1 | gmx_mpi hbond -f md_1000ns_fit.xtc -s em.tpr -num hb_wop.xvg

# Helix residues
echo 18 18 | gmx_mpi hbond -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -num hb_hwop.xvg

## Helix 1
echo 21 21 | gmx_mpi hbond -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -num hb_h1wop.xvg 

## Helix 2
echo 24 24 | gmx_mpi hbond -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -num hb_h2wop.xvg 

## Helix 3
echo 27 27 | gmx_mpi hbond -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -num hb_h3wop.xvg 

##### Radius of gyration #############
# Rg of protein 
echo 1 | gmx_mpi gyrate -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o gyrate_wop.xvg

# Rg of Helix 1
echo 21 | gmx_mpi gyrate -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o gyrate_h1wop.xvg

# Rg of Helix 2
echo 24 | gmx_mpi gyrate -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o gyrate_h2wop.xvg

# Rg of Helix 3
echo 27 | gmx_mpi gyrate -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o gyrate_h3wop.xvg

## DSSP
### All residues

# NO JUMP 
echo 0 | gmx_mpi trjconv -f md_1000ns.xtc -s em.tpr -o md_1000ns_nojump_dssp.xtc -pbc nojump

# PBC
echo 1 1 | gmx_mpi trjconv -f md_1000ns_nojump_dssp.xtc -s em.tpr -o md_1000ns_noPBC_dssp.xtc -pbc mol -center

# FIT
echo 1 1 | gmx_mpi trjconv -f md_1000ns_nojump_dssp.xtc -s em.tpr -o md_1000ns_fit_dssp.xtc -fit rot+trans

# Protein 
echo 1 | gmx_mpi do_dssp -f md_1000ns_fit_dssp.xtc -s em.tpr -n idx.ndx -o ss_wop.xpm -sc ss_wop.xvg -ssdump ss_chi_wop.dat -dt 200

## Helix 1
echo 21 | gmx_mpi do_dssp -f md_1000ns_fit_dssp.xtc -s em.tpr -n idx.ndx -o ss_h1wop.xpm -sc ss_wop.xvg -ssdump ss_chi_h1wop.dat -dt 200

### Helix 2
echo 24 | gmx_mpi do_dssp -f md_1000ns_fit_dssp.xtc -s em.tpr -n idx.ndx -o ss_h2wop.xpm -sc ss_wop.xvg -ssdump ss_chi_h2wop.dat -dt 200

## Helix 3
echo 27 | gmx_mpi do_dssp -f md_1000ns_fit_dssp.xtc -s em.tpr -n idx.ndx -o ss_h3wop.xpm -sc ss_wop.xvg -ssdump ss_chi_h3wop.dat -dt 200


#################################### MT OPLS ################################################
cd /scratch/dvaibhav/largefile/Proper/Analysis/MT_OPLS/
### First make index file
gmx_mpi make_ndx -f em.gro -o idx.ndx <index.dat

### rmsd helix residues #########################
echo 19 19 | gmx_mpi rms -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o rms_chmop.xvg -fit rot+trans
echo 20 20 | gmx_mpi rms -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o rms_bhmop.xvg -fit rot+trans

### rmsd helix 1
echo 22 22 | gmx_mpi rms -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o rms_ch1mop.xvg -fit rot+trans
echo 23 23 | gmx_mpi rms -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o rms_bh1mop.xvg -fit rot+trans

### rmsd helix 2
echo 25 25 | gmx_mpi rms -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o rms_ch2mop.xvg -fit rot+trans
echo 26 26 | gmx_mpi rms -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o rms_bh2mop.xvg -fit rot+trans

### rmsd helix 3
echo 28 28 | gmx_mpi rms -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o rms_ch3mop.xvg -fit rot+trans
echo 29 29 | gmx_mpi rms -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o rms_bh3mop.xvg -fit rot+trans

##### Hbond #####################
echo 1 1 | gmx_mpi hbond -f md_1000ns_fit.xtc -s em.tpr -num hb_mop.xvg

# Helix residues
echo 18 18 | gmx_mpi hbond -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -num hb_hmop.xvg

## Helix 1
echo 21 21 | gmx_mpi hbond -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -num hb_h1mop.xvg 

## Helix 2
echo 24 24 | gmx_mpi hbond -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -num hb_h2mop.xvg 

## Helix 3
echo 27 27 | gmx_mpi hbond -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -num hb_h3mop.xvg 

##### Radius of gyration #############
# Rg of protein 
echo 1 | gmx_mpi gyrate -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o gyrate_mop.xvg

# Rg of Helix 1
echo 21 | gmx_mpi gyrate -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o gyrate_h1mop.xvg

# Rg of Helix 2
echo 24 | gmx_mpi gyrate -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o gyrate_h2mop.xvg

# Rg of Helix 3
echo 27 | gmx_mpi gyrate -f md_1000ns_fit.xtc -s em.tpr -n idx.ndx -o gyrate_h3mop.xvg

## DSSP
### All residues

# NO JUMP 
echo 0 | gmx_mpi trjconv -f md_1000ns.xtc -s em.tpr -o md_1000ns_nojump_dssp.xtc -pbc nojump

# PBC
echo 1 1 | gmx_mpi trjconv -f md_1000ns_nojump_dssp.xtc -s em.tpr -o md_1000ns_noPBC_dssp.xtc -pbc mol -center

# FIT
echo 1 1 | gmx_mpi trjconv -f md_1000ns_nojump_dssp.xtc -s em.tpr -o md_1000ns_fit_dssp.xtc -fit rot+trans

# Protein 
echo 1 | gmx_mpi do_dssp -f md_1000ns_fit_dssp.xtc -s em.tpr -n idx.ndx -o ss_mop.xpm -sc ss_mop.xvg -ssdump ss_chi_mop.dat -dt 200

##Helix 1
echo 21 | gmx_mpi do_dssp -f md_1000ns_fit_dssp.xtc -s em.tpr -n idx.ndx -o ss_h1mop.xpm -sc ss_mop.xvg -ssdump ss_chi_h1mop.dat -dt 200

## Helix 2
echo 24 | gmx_mpi do_dssp -f md_1000ns_fit_dssp.xtc -s em.tpr -n idx.ndx -o ss_h2mop.xpm -sc ss_mop.xvg -ssdump ss_chi_h2mop.dat -dt 200

## Helix 3
echo 27 | gmx_mpi do_dssp -f md_1000ns_fit_dssp.xtc -s em.tpr -n idx.ndx -o ss_h3mop.xpm -sc ss_mop.xvg -ssdump ss_chi_h3mop.dat -dt 200


























