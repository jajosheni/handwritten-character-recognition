function nrm = normalize_targets(target_data)

%target 0-25'ten alir
%matris seklinde dondurur

[x,~] = size(target_data); % ~ = kullanmilmaz degisken

target_identity = eye(26);
new_target = zeros(x, 26);

for i=1:x 
    % target_data(i) - i'nci satirdaki degeri verir (0-25)
    new_target(i, :) = target_identity(:, target_data(i)+1);
end

nrm = transpose(new_target);
