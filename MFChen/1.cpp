#include <cstdio>
int B = 1;
int A = 1;
int C = 1;

int main(){
	while(C < 100 && C > -10) {
	    C++;
	    A = B+C;
	}
	printf("%d\n", A);
}