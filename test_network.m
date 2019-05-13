image=imread('images/test.png');
image=im2bw(image); % binar formatinda resmi tut 0/1
image=double(image);
[y,x]=find(image==0);
y1=min(y);
x1=min(x);
y2=max(y);
x2=max(x);
cropimg=imcrop(image,[x1 y1 x2-x1 y2-y1]); % crop white space
[m,n]=size(cropimg); % m ve n(width) , yeni resminin boyutlari

figure
imshow(cropimg);

array=0; % dizi, sutunlari siyah pixel icin kontrol eder

for i=1:n % sutun sutun git
    if(cropimg(:,i)==1) % i'nci sutunu kontrol et
        array(i)=1; % beyaz pixel icin 1 tut
    else
        array(i)=0; % siyah pixel icin 0 tut
    end
end

k=2;
index = 0; % harflerin baslangic-bitisini tutar
index(1)=1; % otomatik olarak 1'nci pixeli beyaz sec
flag=0; % boslugu tespit etmek icin

for j=1:n 
    if array(j)==1 && flag==0
        index(k)=j-1;
        k=k+1;
        flag=1;
    else
        if array(j)==0 && flag==1
            flag=0;
            index(k)=j;
            k=k+1;
        end
    end
end

index(k)=n; %son pixel
s=0;
[~, width] = size(index); % satir sutun bilgilerini tut
width = width - 1;

output = ''; % taninan harfleri tutar
for i=1:2:width % for i = 1 ; i<width ; i+=2
   
    harf = imcrop(cropimg,[index(i) 1 (index(i+1)-index(i)) y2-y1]); % sadece 1 harf kes [x1,y1,x2,y2]
    
    cerceve = ones(28, 28); % 1 dolu bir 28x28matris
    harf = imresize(harf, [20 20]); % 20 x 20 boyutlara donustur
    cerceve(5:24,5:24) = harf; % harfin etrafinda bosluk verir
    harf = im2bw(cerceve);   % 1/0'a cevir

    harf = transpose(harf); %transposunu al, training'te alindigi icin
    
    islenmis_harf=reshape(harf,784,1); % resmi 784x1 boyutlarinda tut, 784=28*28
    islenmis_harf=double(islenmis_harf); % % resmi Double turunde tut
    
    X=sim(net,islenmis_harf); % onceki training yaptigimiz ag'i kullan
    s=s+1;
    result=find(X==max(X)); % maksimum degerinin index'ini tutar (1-26)
    
    harfler = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];
    output(s)=harfler(result);
end

fprintf('Girdigin resminin metni: "%s" \n', output);