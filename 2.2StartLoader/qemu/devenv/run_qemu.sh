#!/usr/bin/zsh

# Show current executing command lines
set -x

# Defining values
DEVENV_DIR=$(dirname "$0")
EFI_FILE=./acsLoader.efi
DISK_IMG=./disk.img
MOUNT_POINT=./mnt

# Remove if disk.img exists
rm -f $DISK_IMG
# Create new disk image file
qemu-img create -f raw $DISK_IMG 200M
# Format the disk image file
mkfs.fat -n 'MIKAN OS' -s 2 -f 2 -R 32 -F 32 $DISK_IMG

# Creating mount point directory
mkdir -p $MOUNT_POINT
# Mount the created image
sudo mount -o loop $DISK_IMG $MOUNT_POINT

# Make directory structure for UEFI in the disk image
sudo mkdir -p $MOUNT_POINT/EFI/BOOT
# Copy EFI file into the disk image
sudo cp $EFI_FILE $MOUNT_POINT/EFI/BOOT/BOOTX64.EFI
# After copying, unmount the directory mounted
sudo umount $MOUNT_POINT

# Run the created image
# Maximum memory is 1G
# Set UEFI Environments
# Set mount drive points

#readonly=on
#qemu-system-x86_64 -m 1G -drive if=pflash,format=raw,readonly,file=$DEVENV_DIR/OVMF_CODE.fd -drive if=pflash,format=raw,file=$DEVENV_DIR/OVMF_VARS.fd -drive if=ide,index=0,media=disk,format=raw,file=$DISK_IMG

qemu-system-x86_64 \
    -m 1G \
    -drive if=pflash,format=raw,readonly,file=$DEVENV_DIR/OVMF_CODE.fd \
    -drive if=pflash,format=raw,file=$DEVENV_DIR/OVMF_VARS.fd \
    -drive if=ide,index=0,media=disk,format=raw,file=$DISK_IMG \
    -monitor stdio \
    $QEMU_OPTS
