echo "Making project at Documents directory..."
k_rls=`uname --kernel-release`
arch=`uname -m`
os_ver=`lsb_release -s -r`
os_name=`lsb_release -s -i`
dir_name="$os_name"_"$os_ver"_"$arch"

export HOSTNAME

echo "Making Directories..."
mkdir -p $HOME/Documents/keryx/$dir_name
mkdir -p $HOME/Documents/keryx/$dir_name/sources
mkdir -p $HOME/Documents/keryx/$dir_name/lists
mkdir -p $HOME/Documents/keryx/$dir_name/packages
echo "Copying Software source list..."
cp /etc/apt/sources.list $HOME/Documents/keryx/$dir_name/sources
cp -r /etc/apt/sources.list.d $HOME/Documents/keryx/$dir_name/sources
cp /var/lib/dpkg/status $HOME/Documents/keryx/$dir_name/lists
cd $HOME/Documents/keryx/$dir_name

echo "Cleaning up old configurations..."
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
