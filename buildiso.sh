#!/bin/sh

ARCHSLIM_NAME="archslim"
VERSION=$(date +%Y.%m.%e)

if [ $(id -u) -eq 0 ];
then
				echo "Starting..."
				sleep 1
				if [ -d archslim ];
				then
								printf "\033[32marchslim/ directory found...\033[0m\n"
								cd archslim/ 
								if which mkarchiso 2> /dev/null ;
								then
												printf "\033[32mmkarchiso found...\033[0m\n"
												if [ -f work/build.make* ];
												then
																printf "\033[33mDeleting work/build.make*...\033[0m\n"
																rm -fv work/build.make*
												fi

												if [ -f out/archslim* ];
												then
																printf "\033[33mArchSlim build detected... Removing...\033[0m\n"
																rm -fv out/archslim*
												fi

												printf "\033[32mStarting \033[0m\033[33mbuild.sh\033[0m\033[32m!\033[0m\n"
												if [ -f build.sh ];
												then
																./build.sh -N $ARCHSLIM_NAME -V $VERSION -v
												else
																printf "\033[31mbuild.sh not found!\n\033[0m"
																exit 4
												fi
								else
												printf "\033[31mFATAL: mkarchiso not found!!\033[0m\n"
												exit 3
								fi
				else
								printf "\033[31marchslim directory not found!\033[0m\n"
								exit 2
				fi
else
				echo "Hey, $USER, you need to be r00t to build the image!"
				exit 1
fi
