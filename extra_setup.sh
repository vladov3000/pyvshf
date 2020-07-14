ANADIR=$PWD
HFDIR=$ANADIR/HistFitter
CSTDIR=$ANADIR/CommonStatTools

echo "=== setupATLAS and lsetup root"
export ATLAS_LOCAL_ROOT_BASE=/cvmfs/atlas.cern.ch/repo/ATLASLocalRootBase
source $ATLAS_LOCAL_ROOT_BASE/user/atlasLocalSetup.sh
localSetupROOT 6.10.04-x86_64-slc6-gcc62-opt

if [ ! "$(ls -A $HFDIR)" ]; then
  echo "=== cloning HistFitter to" $HFDIR
  git clone https://:@gitlab.cern.ch:8443/HistFitter/HistFitter.git $HFDIR
  cd $HFDIR
  git checkout tags/v0.63.0
  source ${PWD}/setup.sh


else
  cd $HFDIR

fi

source ${PWD}/setup.sh
echo "Copying patches"
cp ${ANADIR}/patches/sample.py ${HFDIR}/python/
cp ${ANADIR}/patches/Utils.cxx ${HFDIR}/src/
cp ${ANADIR}/patches/SysTable.py ${HFDIR}/scripts/

cd src
echo "Now in" $PWD
echo "=== make"
make 
cd ..
echo "Now in" $PWD

# Add input directory to pythonpath
export PYTHONPATH=$ANADIR/input/:$PYTHONPATH

cd $ANADIR

if [ ! "$(ls -A $CSTDIR)" ]; then
  lsetup cmake
	echo "=== cloning CommonStatTools to" $CSTDIR
	git clone https://:@gitlab.cern.ch:8443/atlas-phys/exot/CommonStatTools.git $CSTDIR
	echo "Now in" $PWD
  cd $CSTDIR
  echo "=== pull latest changes from git"
  git pull origin master
  echo "=== setting up CommonStatTools"
  if [ ! -d "build" ]; then
	  echo "=== making build directory"
	  mkdir build
  fi
  cd build
  echo "Now in" $PWD
  cmake ..
  make
fi

cd $ANADIR
echo "Now in" $PWD
