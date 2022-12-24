#!/bin/bash

# write fft_simulation.sh
mkdir bin

cat assets/fft_simulation_plain_script_header > ./bin/fft_simulation.sh
echo "" >> ./bin/fft_simulation.sh
chmod +x ./bin/fft_simulation.sh

ln -s ./bin/fft_simulation.sh ./fft_simulation.sh

# create binnary folder
ln -s lib bin/lib

# generating application file
# check for octave binnary path
path_to_octave=$(which octave)

if [ -z "$path_to_octave" ]
then
      echo "octave executable binary not found!"
      exit 1;
else
      echo "octave found at" $path_to_octave
fi

# generating executable script
echo "#!"$path_to_octave "--persist" >> bin/application.sh
echo "" >> bin/application.sh

# write body part
cat assets/fft_simulation_plain_script_body >> bin/application.sh

# make it executable
chmod +x ./bin/application.sh

# finish
echo "installation complete"
echo ""
echo "try run ./fft_simulation.sh -h"
