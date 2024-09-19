

### WT Amber
cd /scratch/dvaibhav/largefile/Proper/Analysis/WT_Amber/
echo 18 18 | gmx_mpi hbond -f md_1000ns_fit.xtc -s md_1000ns.tpr -n idx.ndx -num hb_hwam.xvg

### MT Amber
cd /scratch/dvaibhav/largefile/Proper/Analysis/MT_Amber/
echo 18 18 | gmx_mpi hbond -f md_1000ns_fit.xtc -s md_1000ns.tpr -n idx.ndx -num hb_hmam.xvg

### WT Charmm
cd /scratch/dvaibhav/largefile/Proper/Analysis/WT_Charmm/
echo 18 18 | gmx_mpi hbond -f md_1000ns_fit.xtc -s md_1000ns.tpr -n idx.ndx -num hb_hwch.xvg

### MT Charmm
cd /scratch/dvaibhav/largefile/Proper/Analysis/MT_Charmm/
echo 18 18 | gmx_mpi hbond -f md_1000ns_fit.xtc -s md_1000ns.tpr -n idx.ndx -num hb_hmch.xvg

### WT OPLS
cd /scratch/dvaibhav/largefile/Proper/Analysis/WT_OPLS/
echo 18 18 | gmx_mpi hbond -f md_1000ns_fit.xtc -s md_1000ns.tpr -n idx.ndx -num hb_hwop.xvg

### MT OPLS
cd /scratch/dvaibhav/largefile/Proper/Analysis/MT_OPLS/
echo 18 18 | gmx_mpi hbond -f md_1000ns_fit.xtc -s md_1000ns.tpr -n idx.ndx -num hb_hmop.xvg

### WT Charmm36m
cd /scratch/dvaibhav/largefile/Proper/Analysis/WT_C36m/
echo 18 18 | gmx_mpi hbond -f md_1000ns_fit.xtc -s md_1000ns.tpr -n idx.ndx -num hb_hwc36m.xvg

### MT Charmm36m
cd /scratch/dvaibhav/largefile/Proper/Analysis/MT_C36m/
echo 18 18 | gmx_mpi hbond -f md_1000ns_fit.xtc -s md_1000ns.tpr -n idx.ndx -num hb_hmc36m.xvg








