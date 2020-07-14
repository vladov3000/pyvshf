Use lxplus for all Histfitter work (comes with root setup already).

To setup HistFitter:

    source extra_setup.sh
    cd HistFitter
    setupATLAS # the following may be redundant, may already be in extra_setup.sh
    lsetup 'root 6.06.06-x86_64-slc6-gcc49-opt'
    source setup.sh

To get load data from afs:

    export ALRB_TutorialData=/afs/cern.ch/atlas/project/PAT/tutorial/cern-may2015/
    mkdir samples
    ln -s $ALRB_TutorialData/HistFitter samples/tutorial

To run HistFitter and get xml workspace:

    HistFitter.py -t -x -w -f -F excl -D "before,after" -i analysis/tutorial/MyOneBinExample.py

Next, extract results from HistFitter directory and start working in a python notebook for pyhf.


