
func=@(k,h)(VL(k,h)-7*(2-k)^4);

t=1; k0=1; k1=2; h=1;



while abs(t) > 10^-8
    
    t=func(k1,h)*(k1-k0)/(func(k1,h)-func(k0,h));
    k=k1-t; k0=k1; k1=k;

end






