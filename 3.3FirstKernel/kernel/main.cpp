// extern "C" : Use C language to define functions
// extern "C" and function names are combined to do the "name mangling"
extern "C" void KernelMain() {
    while (1)
    // __asm__ : For inline-assembler, to include the assembly instructions
    // To avoid infinite loops, send the "hlt" command to halt the CPU
        __asm__("hlt");
}