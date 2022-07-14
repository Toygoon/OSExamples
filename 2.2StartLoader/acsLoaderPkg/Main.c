#include <Uefi.h>
#include <Library/UEfiLib.h>

EFI_STATUS EFIAPI UefiMain(EFI_HANDLE image_handle, EFI_SYSTEM_TABLE *system_table) {
    Print(L"Hello, acsLoader!\n");
    while (1);

    return EFI_SUCCESS;
}