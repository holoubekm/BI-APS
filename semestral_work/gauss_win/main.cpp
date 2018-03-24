#include <stdlib.h>
#include <stdio.h>

//int size = 3;
//float numbers[12] =
//{
//	2.0f,  -2.0f,   1.0f,  3.0f, //  2
//	3.0f,   1.0f,  -1.0f,  7.0f, //  0
//	1.0f,  -3.0f,   2.0f,  0.0f  // -1
//};

//int size = 2;
//float numbers[6] =
//{
//	2.0f,  -2.0f,  8.0f, //  1
//	4.0f,   1.0f,  1.0f, // -3
//};

const int size = 5;
float numbers[size * (size + 1)] =
{
	2, 2, 3, 4, 5, 7,
	7, 9, 9, 10, 11, 14,
	13, 14, 16, 16, 17, 21,
	19, 20, 21, 23, 23, 28,
	25, 26, 27, 28, 30, 35,
};

void print(int size) {
	for (int x = 0; x < size; x++) {
		for (int y = 0; y < size; y++) {
			printf("%5.2f ", numbers[x * (size + 1) + y]);
		}
		printf("| %5.2f\n", numbers[x * (size + 1) + size]);
	} printf("\n");
}

void gauss(int size)
{
	int cols, x, y, z;
	float tmp;
	cols = size + 1;

	for (x = 0; x < size; x++) {
		for (y = x + 1; y < size; y++) {
			tmp = -numbers[y * cols + x] / numbers[x * cols + x];
			numbers[y * cols + x] = 0;
			for (z = x + 1; z < size + 1; z++) {
				numbers[y * cols + z] += tmp * numbers[x * cols + z];
			}
		}
	}

	print(size);


	//for (int i = size - 1; i >= 0; i--) {
	//	numbers[i * cols + size] = numbers[i * cols + size] / numbers[i * cols + i];
	//	numbers[i * cols + i] = 1.0f;

	//	for (int j = i - 1; j >= 0; j--) {
	//		numbers[j * cols + size] = numbers[j * cols + size] - numbers[j * cols + i] * numbers[i * cols + size];
	//		numbers[j * cols + i] = 0.0f;
	//	}
	//}
}

int main(char *argv[], int argc) {
	gauss(size);
	print(size);
	return 0;
}

