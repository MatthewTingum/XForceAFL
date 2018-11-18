#include <stdlib.h>

void hypercall(int hypercallNum, int arg0, int arg1){

	__asm
	{
		mov edi, [ebp + 8];
		mov esi, [ebp + 12];
		mov edx, [ebp + 16];
		_emit(0x0F);
		_emit(0x24);
	}

	return;

}

void main(void)
{

    // Get a buffer ready for the fuzzed input (Up to 2MB)
    char *payload = (char*)calloc(1024000, 1);

    // Start the forkserver with ticks enabled
    hypercall(1, 1, 0);

    // Get 2MB of input and put it in the payload buffer
    hypercall(2, (int)payload, 1024000);
    
    // Trace everything
    hypercall(3, 0, 0xFFFFFFFF);

    // Do something with the payload and hope for a juicy crash

    // End the tracing, we're done with this instance
    hypercall(4, 0, 0);

}
