library(deSolve)

s0<-0.865
i0<-0.135
v<-0.7
p<-1



state0 <- c(S=(s0-s0*p*v) , I= i0, R= (s0*p*v))

parameters <-c(beta= 0.1156 , miu = 0.1)

parameters2 <-c(beta= 0.1180 , miu = 0.1)

funcSir<- function(t,state,parameters){
  with(as.list(c(state,parameters)),{
    
    dS<- miu-beta*S*I-miu*S
    dI<- beta*S*I - miu*I
    dR <- -miu*R
    
    list(c(dS,dI,dR))
  })
}

x=c(0,50,100,150,200)
y=c(0.22,0.85,0.83,0.80,0.78)
times<- seq (0,200,by=0.001)

out<- ode(y=state0,times=times , 
          func = funcSir, parms = parameters)

out2<- ode(y=state0,times=times , 
          func = funcSir, parms = parameters2)

head(out)

par(oma= c(0,0,3,0))



plot(times,out[,"S"],pch = ".",
     ylim = c(0,1),
     xlab = "Años",
     ylab = "proporcion de la poblacion")

points (times,out2[,"I"],pch=".",col="red")
points (times,out2[,"S"],pch=".",col="red")
points (times,out2[,"R"],pch=".",col="red")
points(times,out[,"I"],pch=".",col="blue")
points(times,out[,"R"],pch=".",col="green")

print(100*(sum(out[,"S"])-sum(out2[,"S"]))/(sum(out[,"S"])))
print(100*(sum(out[,"I"])-sum(out2[,"I"]))/(sum(out[,"I"])))
print(100*(sum(out[,"R"])-sum(out2[,"R"]))/(sum(out[,"R"])))


mtext(outer= TRUE , side = 3,
      "modelo Brucelosis bovina" , cex = 1.5)