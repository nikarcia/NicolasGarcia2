import math
def newtons(f, df, xi, e):
	cont=0
	while(cont<e):
		x=xi-f(xi)/df(xi)
		xi=x
		cont+=1
		print('x: ',x)

# f1(e^x)=e^x
newtons(lambda x: pow(x-1.8974,3), lambda x: pow(3*(x-1.8974),2), 0, 9)
© 2019 GitHub, Inc.
