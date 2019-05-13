% BU DOSYA IMPORT YAPAR, ILK CALISTIRMALI

path='handwritten-az\handwritten_data_785.csv';
csv_dataset = csvread(path); %butun excel'deki matrisin degerlerini al

[dataset_rows, dataset_columns]=size(csv_dataset); % Matrix boyutlarini tut
targets = csv_dataset(:,1,:); % ilk sutun targets olarak kaydet
inputs = csv_dataset(1:dataset_rows, 2:dataset_columns); %ilk sutun haric matris, input'tur
% inputs 374K resim tutar, hepsi 28x28 pixel, 784x1 seklinde

%ayri bir script'ten sadece 1 kere cagiriyorsak yeterlidir.