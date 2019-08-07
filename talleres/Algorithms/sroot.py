# n dato
# E error permitido
# x valor inicial
# y respuesta calculada con error E
def sroot(n, E, x):
	y = 0.5*(x + n/x)
	while (abs(x - y) > E):
		x = y
		y = 0.5*(x + n/x)
		print(y)

print(sroot(7,0.01,7))
