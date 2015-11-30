% KEY BLOCK GENERATOR
 global k0 k1 k2 k3 k4 k5 k6 k7 k8 k9 ka kb kc kd ke kf;
 
 kunci = 'tt3asooy';
 kuncidouble = double(kunci);
 kunci_bin= de2bi(kuncidouble,8,'left-msb');
 kunci_bin2 = [];
 
 for i=1:size(kunci_bin,1)
     kunci_bin2 = [kunci_bin2 kunci_bin(i,:)];
 end
 
 kunci1=kunci_bin2(1:32);
 kunci2=kunci_bin2(33:64);
 
 fk1 = fungsiK(kunci1,kunci2);
 k0=fk1(1:16);
 k1=fk1(17:32);
 
 fk2 = fungsiK(kunci2,xor(kunci1,fk1));
 k2=fk2(1:16);
 k3=fk2(17:32);
 
 fk3 = fungsiK(fk1,xor(kunci2,fk2));
 k4=fk3(1:16);
 k5=fk3(17:32);
 
 fk4 = fungsiK(fk2,xor(fk1,fk3));
 k6=fk4(1:16);
 k7=fk4(17:32);
 
 fk5 = fungsiK(fk3,xor(fk2,fk4));
 k8=fk5(1:16);
 k9=fk5(17:32);
 
 fk6 = fungsiK(fk4,xor(fk3,fk5));
 ka=fk6(1:16);
 kb=fk6(17:32);
 
 fk7 = fungsiK(fk5,xor(fk4,fk6));
 kc=fk7(1:16);
 kd=fk7(17:32);
 
 fk8 = fungsiK(fk6,xor(fk5,fk7));
 ke=fk8(1:16);
 kf=fk8(17:32);
 