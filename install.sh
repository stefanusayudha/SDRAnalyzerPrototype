#!/bin/bash

# write fft_simulation.sh
cat assets/fft_simulation_plain_script_header > fft_simulation.sh
echo "" >> fft_simulation.sh
chmod +x fft_simulation.sh


# create binnary folder
mkdir bin
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
