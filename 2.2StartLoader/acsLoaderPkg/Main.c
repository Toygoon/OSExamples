// Header files are located in the directory named '2.1StartEDK2'
#include <Uefi.h>
#include <Library/UefiLib.h>

// UefiMain is defined at Loader.inf
EFI_STATUS EFIAPI UefiMain(EFI_HANDLE image_handle, EFI_SYSTEM_TABLE *system_table) {
    // The function 'Print' is similar to the 'printf'
    Print(L"Hello, acsLoader!\n");
    while (1);

    return EFI_SUCCESS;
}