## Differential equations

deriv(S) <- g*B-beta*S*I/N-mu*S
deriv(I) <- beta*S*I/N-mu*I-sigma*I
deriv(P) <- (1-g)*B-mu*P

## Initial conditions

initial(S) <- g*init_susc
initial(I) <- 5
initial(P) <- (1-g)*init_susc
init_susc <- 995

## Other equations

N <- S+I+P

beta <- kappa*c

B <- alpha*N 	#entry rate, exponentially growing population
#B <- mu*N+sigma*I	#entry rate, constant population size - useful for model checking

## Parameter values

g <- user(0.4)		#proportion at-risk (in S class)
c <-user(11)		#partner change rate
kappa <- user(0.1)  	#per partner HIV transmission probability
sigma <- user(0.0833)            #mortality rate per person per year due to HIV/AIDS (1/mean duration in years)		
mu <- user(0.008)      #crude mortality rate due to causes other than AIDS, scaled to rate per person
alpha <-user(0.0332)    #birth rate scaled to per person

## Additional outputs

output(prevalence) <- I/N
output(new_infections) = beta*S*I/N
output(incidence) <- (beta*S*I/N)/(S+P)
