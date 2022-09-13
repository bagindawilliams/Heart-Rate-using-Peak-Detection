
num1 = xlsread('sample.xlsx','A1:A10000');
num2 = xlsread('sample.xlsx','C1:C10000');

plot(num1,num2);
xlabel('sample');
ylabel('value');
title('Estimate BPM =');


hold on
beat_count = 0;
plot(num1,num2, 'ro');
for k = 2 : length(num1)-1
   if(num2(k) > num2(k-1) & num2(k) > num2(k+1) & num2(k) > 1)
       %k
       %disp('peak found');
       beat_count = beat_count + 0.6;
   end
end

fs = 50;
N = length(num1);
duration_in_second = N/fs;
duration_in_minute = duration_in_second/60;
BPM = beat_count/duration_in_minute
title([' Estimated Beat Rate : ',num2str(BPM),' BPM'])