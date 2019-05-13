function nrm = format_img(image_data)

% Herhangi bir resim alir
% 28 x 28 formatinda dondurur
% beyaz cerceve ekler

cerceve = ones(28, 28); % 1 dolu bir 28x28matris
harf = imresize(image_data, [20 NaN]); % yuksekligi 20 yap , genisligi otomatik
[~, new_img_width] = size(harf); % genisligi degiskende tut
tek_cift = mod(new_img_width, 2); % yeni genislik tek mi cift mi

if(tek_cift == 1)
    %eger genisligi tek ise 1 pixel ekle, cift yap
    new_img_width = new_img_width + 1; 
    harf = imresize(harf, [20 new_img_width]);
end

if(new_img_width>17) %harf kare gibi olsa hemen 20x20 formatina donustur
    harf = imresize(harf, [20 20]);
    cerceve(5:24,5:24) = harf; % harfin etrafinda bosluk verir
end

if(new_img_width<=17)
    temp_width = 14-(new_img_width/2);
    cerceve(5:24 , temp_width:27-temp_width) = harf; % harfin etrafinda bosluk verir
end

harf = im2bw(cerceve);   % 1/0'a cevir
harf=transpose(harf); %transposunu al, training'te alindigi icin

nrm = harf;