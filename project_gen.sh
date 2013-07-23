#!/bin/bash

export HOSTNAME
echo "Making project at Documents directory..."
k_rls=`uname --kernel-release`
arch=`uname -m`

if [ "$arch" = "x86_64" ]; then
	{	
		arch="64bit"
	}
else
	{
		arch="32bit"
	}
fi

os_ver=`lsb_release -s -r`
os_name=`lsb_release -s -i`
dir_name="$os_name"_"$os_ver"_"$arch"

src_dir="$HOME/Documents/keryx/$dir_name"
echo "Making Directories..."
mkdir -p $src_dir
mkdir -p $src_dir/sources
mkdir -p $src_dir/lists
mkdir -p $src_dir/packages

echo "Copying Software source list..."
cp /etc/apt/sources.list $src_dir/sources
cp -r /etc/apt/sources.list.d $src_dir/sources
cp /var/lib/dpkg/status $src_dir/lists
cd $src_dir

rm -f $src_dir/sources/sources.list.d/*.save

echo "Cleaning up old configurations and backup files..."
rm -f debian.conf
rm -f "$dir_name".keryx
cp_name=`echo $HOSTNAME`

echo "Generating configurations..."
touch debian.conf
echo "Computer Name: $cp_name" >> debian.conf
echo "OS Name: $os_name" >> debian.conf
echo "OS Version: $os_ver" >> debian.conf
echo "Architecture: $arch" >> debian.conf
echo "Kernel: $k_rls" >> debian.conf

touch "$dir_name".keryx
echo "$dir_name" >> "$dir_name".keryx
echo "Debian" >> "$dir_name".keryx
echo "All done!!!..Copy generated directory to your keryx projects directory."


