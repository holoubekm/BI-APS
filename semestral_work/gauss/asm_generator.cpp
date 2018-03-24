#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <stdlib.h>
#include <math.h>

using namespace std;

#define asm(p) printf("\t%s\n", p)

bool saved = false;
int start = 0;
int count = 0;

void gauss() {
	int size = 10;
	int cols = size + 1;

	asm("lhi	r1,((_numbers)>>16)&0xffff");
	asm("addui	r1,r1,(_numbers)&0xffff");
	
	for(int i = 0; i < size - 1; i++) {
		// float tmp = matrix[i * cols + i];
		printf("\tlf	f1, %d(r1)\n", (i * cols + i) * 4);

		for(int j = i + 1; j < size; j++){
			printf("\tlf	f2, %d(r1)\n", (j * cols + i) * 4);
			asm("divf	f2,f2,f1");

			asm("movi2fp f3,r0");
			printf("\tsf %d(r1),f3\n", (j * cols + i) * 4);

			// float c = -matrix[j * cols + i] / tmp ;
			// matrix[j * cols + i] = 0.0f;

			// for(int k = i + 1; k <= size; k++) {
				int k = i + 1;
				int cnt = size - i;
				if(cnt % 4 == 1) {
					printf("\t\tlf f3, %d(r1)\n", (i * cols + k + 0) * 4);
					asm("\tmultf f3,f3,f2");
					printf("\t\tlf f4, %d(r1)\n", (j * cols + k + 0) * 4);
					asm("\tsubf f4,f4,f3");
					printf("\t\tsf %d(r1), f4\n", (j * cols + k + 0) * 4);
					k += 1;
				} else if(cnt % 4 == 2) {
					printf("\t\tlf f3, %d(r1)\n", (i * cols + k + 0) * 4);
					printf("\t\tlf f5, %d(r1)\n", (i * cols + k + 1) * 4);

					asm("\tmultf f3,f3,f2");
					asm("\tmultf f5,f5,f2");
					
					printf("\t\tlf f4, %d(r1)\n", (j * cols + k + 0) * 4);
					printf("\t\tlf f6, %d(r1)\n", (j * cols + k + 1) * 4);

					asm("\tsubf f4,f4,f3");
					asm("\tsubf f6,f6,f5");
					
					printf("\t\tsf %d(r1), f4\n", (j * cols + k + 0) * 4);
					printf("\t\tsf %d(r1), f6\n", (j * cols + k + 1) * 4);
					k += 2;
				} else if(cnt % 4 == 3) {
					printf("\t\tlf f3, %d(r1)\n", (i * cols + k + 0) * 4);
					printf("\t\tlf f5, %d(r1)\n", (i * cols + k + 1) * 4);
					printf("\t\tlf f7, %d(r1)\n", (i * cols + k + 2) * 4);

					asm("\tmultf f3,f3,f2");
					asm("\tmultf f5,f5,f2");
					asm("\tmultf f7,f7,f2");
					
					printf("\t\tlf f4, %d(r1)\n", (j * cols + k + 0) * 4);
					printf("\t\tlf f6, %d(r1)\n", (j * cols + k + 1) * 4);
					printf("\t\tlf f8, %d(r1)\n", (j * cols + k + 2) * 4);

					asm("\tsubf f4,f4,f3");
					asm("\tsubf f6,f6,f5");
					asm("\tsubf f8,f8,f7");
					
					printf("\t\tsf %d(r1), f4\n", (j * cols + k + 0) * 4);
					printf("\t\tsf %d(r1), f6\n", (j * cols + k + 1) * 4);
					printf("\t\tsf %d(r1), f8\n", (j * cols + k + 2) * 4);
					k += 3;
				} 

				for(; k < size; k += 4) {
					printf("\t\tlf f3, %d(r1)\n", (i * cols + k + 0) * 4);
					printf("\t\tlf f5, %d(r1)\n", (i * cols + k + 1) * 4);
					printf("\t\tlf f7, %d(r1)\n", (i * cols + k + 2) * 4);
					printf("\t\tlf f9, %d(r1)\n", (i * cols + k + 3) * 4);

					asm("\tmultf f3,f3,f2");
					asm("\tmultf f5,f5,f2");
					asm("\tmultf f7,f7,f2");
					asm("\tmultf f9,f9,f2");
					
					printf("\t\tlf f4, %d(r1)\n", (j * cols + k + 0) * 4);
					printf("\t\tlf f6, %d(r1)\n", (j * cols + k + 1) * 4);
					printf("\t\tlf f8, %d(r1)\n", (j * cols + k + 2) * 4);
					printf("\t\tlf f10, %d(r1)\n", (j * cols + k + 3) * 4);

					asm("\tsubf f4,f4,f3");
					asm("\tsubf f6,f6,f5");
					asm("\tsubf f8,f8,f7");
					asm("\tsubf f10,f10,f9");
					
					printf("\t\tsf %d(r1), f4\n", (j * cols + k + 0) * 4);
					printf("\t\tsf %d(r1), f6\n", (j * cols + k + 1) * 4);
					printf("\t\tsf %d(r1), f8\n", (j * cols + k + 2) * 4);
					printf("\t\tsf %d(r1), f10\n", (j * cols + k + 3) * 4);
				}
				// matrix[j * cols + k] += c * matrix[i * cols + k];
			// }
		}
	}
}

int main(int argc, char* argv[]) {
	// generate(generated);
	// print2(generated);
	
	gauss();
	return 1;
}