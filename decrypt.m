tic
% chipertext = 'buandini';
% chipertextdouble = double(chipertext);
% chipertext_bin= de2bi(chipertextdouble,8,'left-msb');
% chipertext_bin2 = [];
 
%  for i=1:size(chipertext_bin,1)
%      chipertext_bin2 = [chipertext_bin2 chipertext_bin(i,:)];
%  end

 key_enc1 = [ k8 k9 ka kb ];
 key_enc2 = [ kc kd ke kf ];
 Hasildecoded = {};
 bitdecoded = {};
 for i=1:size(chiperteks,2)
     hahaha = chiperteks{i};
     chipertext3= xor(chiperteks{i},key_enc2);
     chipertext1=chipertext3(1:32);
     chipertext2=chipertext3(33:64);
      xor1 = xor(chipertext1,chipertext2);
     f1= fungsiF(xor1,k7);
     xor2 = xor(f1,chipertext1);
     f2= fungsiF(xor2,k6);
     xor3 = xor(xor1,f2);
     f3= fungsiF(xor3,k5);
     xor4 = xor(f3,xor2);
     f4 = fungsiF(xor4,k4);
     xor5 = xor(f4,xor3);
     f5 = fungsiF(xor5,k3);
     xor6 = xor(f5,xor4);
     f6= fungsiF(xor6,k2);
     xor7 = xor(f6,xor5);
     f7= fungsiF(xor7,k1);
     xor8= xor(f7,xor6);
     f8= fungsiF(xor8,k0);
     xor9 = xor(f8,xor7);
     xor10 = xor(xor9,xor8);

     plaintextH = [ xor9 xor10 ];
     plaintextH = xor(plaintextH,key_enc1);
     kataaa=[];
     for l=1:length(plaintextH)
         kataaa(end+1)=num2str(plaintextH(l))-48
     end
    
     cobaaa=reshape(kataaa,8,length(kataaa)/8);
     cobaaa=char(cobaaa+48);
     cobaaa = cobaaa';
     coba2=bin2dec(cobaaa);
     cobba = [];
     for k=1:size(coba2,1)
         cobba = [cobba coba2(k,:)];
     end
     bitdecoded{i} = cobba;
     Hasildecoded{i}=char(coba2);
     panjangdecoded = size(Hasildecoded,2);
     
     
 end
Hasildecrypted = cell2mat(Hasildecoded);
Hasildekripsi = reshape(Hasildecrypted,1,size(Hasildecrypted,1)*size(Hasildecrypted,2));

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
 toc