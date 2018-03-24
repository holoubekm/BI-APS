// for(int i = 0; i < size; i++) {
// 	float tmp = numbers[i * cols + i];
// 	for(int j = i + 1; j < size; j++){
// 		float c = -numbers[j * cols + i] / tmp ;
// 		numbers[j * cols + i] = 0.0f;
// 		for(int k = i + 1; k <= size; k++) {
// 			numbers[j * cols + k] += c * numbers[i * cols + k];
// 		}
// 	}
// }

// for(int i = 0; i < size; i++) {
// 	float tmp = numbers[i][i];
// 	for(int j = i + 1; j < size; j++){
// 		float c = -numbers[j][i] / tmp ;
// 		numbers[j][i] = 0.0f;
// 		for(int k = i + 1; k <= size; k++) {
// 			numbers[j][k] += c * numbers[i][k];
// 		}
// 	}
// }


#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <stdlib.h>
#include <math.h>

using namespace std;

const int size = 5;
float numbers[size * (size + 1)] =
{
2,2,3,4,5,7,7,9,9,10,11,14,13,14,16,16,17,21,19,20,21,23,23,28,25,26,27,28,30,35
};

// const int size = 3;
// float numbers[size * (size + 1)] =
// {
// 	1,-3,1,4,
// 	2,-8,8,-2,
// 	-6,3,-15,9
// };


// const int size = 3;
// float numbers[size * (size + 1)] =
// {
// 	 1, 1, 1, 6,
// 	 2, 3, -1, 5,
// 	 -1, -1, 1, 0
// };

// const int size = 2;
// float numbers[size * (size + 1)] =
// {
// 	 3,6,1,1,3,1
// };



void print();

void gauss(float* matrix) {
	int cols = size + 1;

	for(int i = 0; i < size; i++) {
		float tmp = matrix[i * cols + i];
		for(int j = i + 1; j < size; j++){
			float c = -matrix[j * cols + i] / tmp ;
			matrix[j * cols + i] = 0.0f;
			for(int k = i + 1; k <= size; k++) {
				matrix[j * cols + k] += c * matrix[i * cols + k];
			}
		}
		// print();
	}
}

void print(float* matrix) {
	for(int x = 0; x < size; x++) {
		for(int y = 0; y < size; y++) {
			printf("%5.2f ", matrix[x * (size + 1) + y]);
		} printf("| %5.2f\n", matrix[x * (size + 1) + size]);
	} printf("\n");
}

void print2(float* matrix) {
	for(int x = 0; x < size; x++) {
		for(int y = 0; y < size; y++) {
			printf("%.15f,", matrix[x * (size + 1) + y]);
		} printf("%.15f,", matrix[x * (size + 1) + size]);
	} printf("\n");
}

float generated[size * (size + 1)];

void generate(float* matrix) {
	int cols = size + 1;
	srand(time(NULL));

	for(int x = 0; x < size; x++) {
		for(int y = x; y < size + 1; y++) {
			matrix[x * cols + y] = rand() % 10 + 1;
		}
	}
	print(matrix);

	for(int x = 0; x < size; x++) {
		for(int y = x + 1; y < size; y++) {
			float a = rand() % 21 - 10;
			// float b = rand() % 7 + 1;
			float b = 1;
			float mult = a / b;
			for(int z = 0; z < cols; z++) {
				matrix[y * cols + z] += mult * matrix[x * cols + z];
			}
		}
	}
}

int main(int argc, char* argv[]) {
	// generate(generated);
	// print2(generated);
	
	print2(numbers);
	gauss(numbers);
	print2(numbers);
	return 1;
}