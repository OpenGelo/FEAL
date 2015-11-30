function f = fungsiF (a,b)

% b 16 bit
% a 32 bit

a0=a(1:8);
a1=a(9:16);
a2=a(17:24);
a3=a(25:32);

b0=b(1:8);
b1=b(9:16);

f1=xor(xor(a1,b0),a0);
f2=xor(xor(a2,b1),a3);
f1=fungsiSSatu(f1,f2);
f2=fungsiSNol(f2,f1);
f0=fungsiSNol(a0,f1);
f3=fungsiSSatu(a3,f2);

f = [ f0 f1 f2 f3 ];
end