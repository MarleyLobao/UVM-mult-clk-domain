extern "C" int my_ula(int a,int b, int instru){
	switch (instru){
		case 0:
			return a+b;
		case 1:
			if(a>b) return a-b;
			else    return b-a;
		case 2:
			return a+1;
		case 3:
			return b+1;
		default:
		  return 0;
	}
}