function Ssatu = fungsiSSatu (a,b)
a = bi2de(a);
b = bi2de(b);
t = mod((a + b + 1),256);
T = de2bi(t,8,'left-msb');
rot=2;
S=T;
S(1:length(T)-rot)=T(1+rot:length(T));
S(length(T)-rot+1:length(T))=T(1:rot);
Ssatu=S;
end
