def bisection(f, a, b, e):
	c=(a+b)/2
	while abs(f(c) - 0) > e: 
		if f(a)*f(c) <0:
			b=c
		else:
			a=c
		c=(a+b)/2
		print(c)

bisection( lambda x: pow(x-1.8974,3),0,2, 0.0000000001)
