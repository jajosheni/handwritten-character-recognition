function nrm = normalize_img(image_data)

%0-255 degerleri 
%0(beyaz) veya 1(siyah)
%dataset siyah background kullanir , o yuzden invert de yapmak lazim
%siyah gecen yerleri beyaz olarak gosterir ve tam tersi

[~,y] = size(image_data); % ~ = kullanmilmaz degisken

for i=1:y 
    if(image_data(i)<=50)
        image_data(i) = 1;
    end
    if(image_data(i)>50)
        image_data(i) = 0;
    end
end

nrm = image_data;