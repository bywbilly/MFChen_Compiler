//考察点：section 9 函数，包括函数定义，内建函数
//算法：斜堆
//样例输入：
//5 5
//ABCDE
//1 2 3 4 5
//样例输出：
//5 E
//10

#include <cstdio>
#include <string>
using namespace std;
int N;
int M;
string ch;

int l[11111];
int r[11111];
int w[11111];

int merge(int x,int y)
{
	printf("%d %d\n",x, y);
	if (0 == x) return y;
	if (0 == y) return x;
	if (w[x] < w[y]) {
		int e = x;
		x = y;
		y = e;
	}
	r[x] = merge(r[x],y);
	int e = l[x];
	l[x] = r[x];
	r[x] = e;	
	return x;
}

int main()
{
	N = 5;
	M = 5;
	ch = "ABCDE";
	
	int i;
	for (i=1;i <= N;i++) {
		w[i] = i;
		l[i] = 0;
   		r[i] = 0;
	}
	for (i=1;i <= M;i++) {
		w[i + N] = ch[i - 1];
		l[i + N] = 0;
		r[i + N] = 0;
	}
	int rt0 = 1;
	int rt1 = N + 1;
	//println(ch);
	//__output(ch.length());
	for (i = 2;i <= N;i++) {
		printf("! %d %d\n",i, rt0); 
		rt0 = merge(rt0,i);
	}
	for (i = N+2;i<= N+M;i++) {
		printf("!!\n");
		rt1 = merge(rt1,i);
	}
	printf("%d", w[rt0]);
	printf(" ");
	//printf(ch.substring(rt1-N-1,rt1-N-1));
	printf("\n");
	printf("%d\n",(merge(rt0,rt1)));
	return 0;
}
