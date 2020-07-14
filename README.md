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

Next, extract results from HistFitter directory and start working in a python notebook for pyhf. Specifically, we are most interested in config (contains xml workspace that we will use for pyhf), data (contains some root file), and results (results from HistFitter we can compare against). Upload your results to github and start working on your local computer with python notebooks.

Setup enviroment (optional, only if you want your computer to be clean):

    python3 -m venv ./pyhfenv
    source /pyhfenv/bin/activate
    pip install pyhf
    # Note: this virtual env is too large to commit to git, so put it in the .gitignore

Otherwise:

    pip3 install pyhf
    
Open and follow instructions in given python notebook (credits to Sam Meehan):

    jupyter-notebook .
    # Open pyhf/HistToPyhf.ipynb
    # Note: you will need to set the kernel to the pyhf venv if you made one earlier

