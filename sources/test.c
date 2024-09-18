#include "test.h"
#include <stdio.h>
#include <math.h>
#include <stdlib.h>

float test(float *TestArray, int n){
   float num = 0;
   for(int k=0; k < n; k++){
	   num += TestArray[k];
   }
   return num;
};