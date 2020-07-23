function [cor,sr] = stretching(x,y,time,delta,t0,win);

st=0.1:0.01:2.5;
sind = (t0-time(1))/delta + 1;
npts = win/delta;
xi=x(sind+1:sind+npts);
% t=time(sind+1:sind+npts);
cc=zeros(size(st));

for i=1:length(st)
    s=st(i);
    ytmp=zeros(1,npts);
    for k=1:npts;
        ti=t0+k*delta;
        ts=s*ti;
        ind=(ts-time(1))/delta;
        if floor(ind)==ind
            ytmp(k)=y(ind);
        else
            i1=floor(ind);
            i2=i1+1;
            ytmp(k)=(y(i2)-y(i1))*(ind-i1)+y(i1);
        end
    end
%     t=time(sind+1:sind+npts);
    c=corrcoef(xi,ytmp);
    cc(i)=c(1,2);
end
[cor,n]=max(cc);
sr=st(n);


        

        
        
           
            
                        
                       
                
                
                
                
            
        