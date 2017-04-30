int foobar2(
	    int a1, int b1, int c1,
	    int a2, int b2, int c2,
	    int a3, int b3, int c3,
	    int a4, int b4, int c4,
	    int a5, int b5, int c5,
	    int a6, int b6, int c6,
	    int a7, int b7, int c7,
	    int a8, int b8, int c8)
{
  return 100;
}

int foobar(int a, int b, int c)
{
    int xx = a + 2;
    int yy = b + 3;
    int zz = c + 4;
    int sum = xx + yy + zz;
    foobar2(a,b,c,a,b,c,a,b,c,a,b,c,
	    a,b,c,a,b,c,a,b,c,a,b,c);
    return xx * yy * zz + sum;
}

int main()
{
    return foobar(77, 88, 99);
}
