function [b]=Voym2(y,a,b)

h=(b-a)/length(y);

y(1)=y(1)/2; y(end)=y(end)/2;
y_sum=0;
for val=y
    y_sum=y_sum+h*y;
    if 0.99999*0.7*sum(y)<sum(y_sum) & sum(y_sum) <0.7*sum(y)*1.00001
        break
    end
end

b=length(y_sum);
