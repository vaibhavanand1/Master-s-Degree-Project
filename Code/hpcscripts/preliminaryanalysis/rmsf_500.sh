## WT Amber
cd /scratch/dvaibhav/largefile/Proper/Analysis/WT_Amber/

echo 3 | gmx_mpi rmsf -f md_1000ns_fit.xtc -s md_1000ns.tpr -o rmsf_cwam_500ns.xvg -res -fit -b 500000 -e 1000000
echo 4 | gmx_mpi rmsf -f md_1000ns_fit.xtc -s md_1000ns.tpr -o rmsf_bwam_500ns.xvg -res -fit -b 500000 -e 1000000

## MT Amber
cd /scratch/dvaibhav/largefile/Proper/Analysis/MT_Amber/

echo 3 | gmx_mpi rmsf -f md_1000ns_fit.xtc -s md_1000ns.tpr -o rmsf_cmam_500ns.xvg -res -fit -b 500000 -e 1000000
echo 4 | gmx_mpi rmsf -f md_1000ns_fit.xtc -s md_1000ns.tpr -o rmsf_bmam_500ns.xvg -res -fit -b 500000 -e 1000000


## WT Charmm
cd /scratch/dvaibhav/largefile/Proper/Analysis/WT_Charmm/

echo 3 | gmx_mpi rmsf -f md_1000ns_fit.xtc -s md_1000ns.tpr -o rmsf_cwch_500ns.xvg -res -fit -b 500000 -e 1000000
echo 4 | gmx_mpi rmsf -f md_1000ns_fit.xtc -s md_1000ns.tpr -o rmsf_bwch_500ns.xvg -res -fit -b 500000 -e 1000000


## MT Charmm
cd /scratch/dvaibhav/largefile/Proper/Analysis/MT_Charmm/

echo 3 | gmx_mpi rmsf -f md_1000ns_fit.xtc -s md_1000ns.tpr -o rmsf_cmch_500ns.xvg -res -fit -b 500000 -e 1000000
echo 4 | gmx_mpi rmsf -f md_1000ns_fit.xtc -s md_1000ns.tpr -o rmsf_bmch_500ns.xvg -res -fit -b 500000 -e 1000000

## WT OPLS
cd /scratch/dvaibhav/largefile/Proper/Analysis/WT_OPLS/

echo 3 | gmx_mpi rmsf -f md_1000ns_fit.xtc -s md_1000ns.tpr -o rmsf_cwop_500ns.xvg -res -fit -b 500000 -e 1000000
echo 4 | gmx_mpi rmsf -f md_1000ns_fit.xtc -s md_1000ns.tpr -o rmsf_bwop_500ns.xvg -res -fit -b 500000 -e 1000000

## MT OPLS
cd /scratch/dvaibhav/largefile/Proper/Analysis/MT_OPLS/

echo 3 | gmx_mpi rmsf -f md_1000ns_fit.xtc -s md_1000ns.tpr -o rmsf_cmop_500ns.xvg -res -fit -b 500000 -e 1000000
echo 4 | gmx_mpi rmsf -f md_1000ns_fit.xtc -s md_1000ns.tpr -o rmsf_bmop_500ns.xvg -res -fit -b 500000 -e 1000000

## WT C36m
cd /scratch/dvaibhav/largefile/Proper/Analysis/WT_C36m/

echo 3 | gmx_mpi rmsf -f md_1000ns_fit.xtc -s md_1000ns.tpr -o rmsf_cwc36m_500ns.xvg -res -fit -b 500000 -e 1000000
echo 4 | gmx_mpi rmsf -f md_1000ns_fit.xtc -s md_1000ns.tpr -o rmsf_bwc36m_500ns.xvg -res -fit -b 500000 -e 1000000

## MT C36m
cd /scratch/dvaibhav/largefile/Proper/Analysis/MT_C36m/

echo 3 | gmx_mpi rmsf -f md_1000ns_fit.xtc -s md_1000ns.tpr -o rmsf_cmc36m_500ns.xvg -res -fit -b 500000 -e 1000000
echo 4 | gmx_mpi rmsf -f md_1000ns_fit.xtc -s md_1000ns.tpr -o rmsf_bmc36m_500ns.xvg -res -fit -b 500000 -e 1000000

