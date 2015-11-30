function fk = fungsiK (a,b)

a0=a(1:8);
a1=a(9:16);
a2=a(17:24);
a3=a(25:32);

b0=b(1:8);
b1=b(9:16);
b2=b(17:24);
b3=b(25:32);

fk1=xor(a1,a0);
fk2=xor(a2,a3);
fk1=fungsiSSatu(fk1,xor(fk2,b0));
fk2=fungsiSNol(fk2,xor(fk1,b1));
fk0=fungsiSNol(a0,xor(fk1,b2));
fk3=fungsiSSatu(a3,xor(fk2,b3));

fk = [fk0 fk1 fk2 fk3];
end


