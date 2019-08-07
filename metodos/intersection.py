import math
def intersection( f, g, a, b, e):
	cont=0
	c=(a+b)/2
	while(abs(f(c)-g(c))>e):
		if(f(c)<g(c)):
			b=c
		else:
			a=c	
		cont+=1
		print(c)
		c=(a+b)/2
	print(cont)


intersection(lambda x: math.exp(x), lambda x: math.pi*x, 0, 3, 0.000000001)
