tic
global chiperteks
chiperteks = {};
plaintext = input('masukkan kalimat :');
panjang = length(plaintext);
%plaintext = 'buandini';
plaintextdouble = double(plaintext);
plaintext_bin= de2bi(plaintextdouble,8,'left-msb');
ukuran = size(plaintext_bin,1)*size(plaintext_bin,2);
 modular = mod(ukuran,64);
if mod(ukuran,64)~= 0
     plaintext_bin3 = padarray(plaintext_bin,modular,'post')
     plaintext_bin2 = [];
     for i=1:size(plaintext_bin3,1)
         plaintext_bin2 = [plaintext_bin2 plaintext_bin3(i,:)];
     end
     i = 1
     for j=1:(length(plaintext_bin2)-modular)/64
         tes{j} = plaintext_bin2(i:63+i) 
         i=i+64;
     end
     key_enc1 = [ k8 k9 ka kb ];
     key_enc2 = [ kc kd ke kf ];

     for j=1:length(tes)
         plaintext_bin2 = tes{j}
         plaintext= xor(plaintext_bin2,key_enc1);

         plaintext1=plaintext(1:32);
         plaintext2=plaintext(33:64);

         xor1 = xor(plaintext1,plaintext2);
         f1= fungsiF(xor1,k0);
         xor2 = xor(f1,plaintext1);
         f2= fungsiF(xor2,k1);
         xor3 = xor(xor1,f2);
         f3= fungsiF(xor3,k2);
         xor4 = xor(f3,xor2);
         f4 = fungsiF(xor4,k3);
         xor5 = xor(f4,xor3);
         f5 = fungsiF(xor5,k4);
         xor6 = xor(f5,xor4);
         f6= fungsiF(xor6,k5);
         xor7 = xor(f6,xor5);
         f7= fungsiF(xor7,k6);
         xor8= xor(f7,xor6);
         f8= fungsiF(xor8,k7);
         xor9 = xor(f8,xor7);
         xor10 = xor(xor9,xor8);

         chipertext = [ xor9 xor10 ];
         chipertext = xor(chipertext,key_enc2);
         global chiperteks
         chiperteks{j} = chipertext;
         kataa=[];
         for i=1:length(chipertext)
             kataa(end+1)=num2str(chipertext(i))-48
         end
         cobaa=reshape(kataa,8,length(kataa)/8);
         coba1=bi2de(cobaa');
         hasilchiper{j}=char(coba1); 
     end
else
     plaintext_bin2 = [];
         for i=1:size(plaintext_bin,1)
             plaintext_bin2 = [plaintext_bin2 plaintext_bin(i,:)];
         end
         i = 1
         for j=1:(length(plaintext_bin2)-modular)/64
             tes{j} = plaintext_bin2(i:63+i) 
             i=i+64;
         end
         key_enc1 = [ k8 k9 ka kb ];
         key_enc2 = [ kc kd ke kf ];

         for j=1:size(tes,2)
             plaintext_bin2 = tes{j}
             plaintext= xor(plaintext_bin2,key_enc1);

             plaintext1=plaintext(1:32);
             plaintext2=plaintext(33:64);

             xor1 = xor(plaintext1,plaintext2);
             f1= fungsiF(xor1,k0);
             xor2 = xor(f1,plaintext1);
             f2= fungsiF(xor2,k1);
             xor3 = xor(xor1,f2);
             f3= fungsiF(xor3,k2);
             xor4 = xor(f3,xor2);
             f4 = fungsiF(xor4,k3);
             xor5 = xor(f4,xor3);
             f5 = fungsiF(xor5,k4);
             xor6 = xor(f5,xor4);
             f6= fungsiF(xor6,k5);
             xor7 = xor(f6,xor5);
             f7= fungsiF(xor7,k6);
             xor8= xor(f7,xor6);
             f8= fungsiF(xor8,k7);
             xor9 = xor(f8,xor7);
             xor10 = xor(xor9,xor8);

             chipertext = [ xor9 xor10 ];
             chipertext = xor(chipertext,key_enc2);
            
             chiperteks{j} = chipertext;
             kataa=[];
             for i=1:length(chipertext)
                 kataa(end+1)=num2str(chipertext(i))-48
             end
             cobaa=reshape(kataa,8,length(kataa)/8);
             coba1=bi2de(cobaa');
             hasilchiper{j}=char(coba1); 
         end
       Hasilencoded = cell2mat(hasilchiper);
       Hasilenkripsi = reshape(Hasilencoded,1,size(Hasilencoded,1)*size(Hasilencoded,2));
end
 Hasilencoded = cell2mat(hasilchiper);
 Hasilenkripsi = reshape(Hasilencoded,1,size(Hasilencoded,1)*size(Hasilencoded,2));   
 toc
%  chipertext_double = bi2de(chipertext);
%  a = mat2str(chipertext);
%  a = reshape(chipertext, length(chipertext)/8, 8);
%  chipertext_teks = bin2dec(a);
%  chipertext_teks = num2str(chipertext_double);
 %chipertext2 = [];
 %for i=1:size(chipertext);
 %    pesan = [chipertext2 bi2de(chipertext(i,:))];
 %end
 
 %chipertext = 
 