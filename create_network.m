% import_dataset calistirdiktan sonra bu dosyayi calistir 

%
% The best settings are epochs = 4000 and max_fail = 7
% Training should last for about 4 hours
%

input=ones(784,dataset_rows); % 1 dolu bir 784 * y matris butun harfleri tutmak icin

for i=1:dataset_rows %normalize resimler 
    image = normalize_img(inputs(i,:));
    input(:,i)=image; % resmi i'yle uyan sutunde tut
end

target = normalize_targets(targets); % olusturdugumuz normalize target fonk. cagirir

S1=65; % hidden layer neurons = 65 secmeli

net = feedforwardnet(S1, 'trainscg'); % Scaled Conjugate Gradient Training.
net.trainParam.epochs=1000; % 1000 iterasyon, zaman kisitlama icin, (daha iyi sonuclar icin 4000 yap)
net.trainParam.goal=1e-6; % 1e-x => 1 * 10^-x
net.trainParam.max_fail = 6;
[net,train_perfomance] = train(net,input,target); %start training

% ag'in performansini goster
c = net(input);
perf = perform(net,target,c);
disp('Network Performance:');
disp(perf);

