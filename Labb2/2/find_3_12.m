a=0; b=3.6; n=1;

while true

    x=linspace(a,b,n);
    if isempty(find(x==3.12)) == 1
        n=n+1;
    else
        break
    end
end