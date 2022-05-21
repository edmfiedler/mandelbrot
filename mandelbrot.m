% Mandelbrot
% Plot if zn+1 = zn^2 + c converge

dat = []; dat2 = [];
for x = -2:0.01:1
    for y = -1:0.01:1
        c = x+1i*y; z = 0; cond = 0; zdat = []; zspdat = [];
        for k = 1:100
            zdat = [zdat;z];
            
            if y == 0
                zspdat = [zspdat;z];
            else
                zspdat = zeros(100,1);
            end
            
            z = z^2+c;
            if abs(z) > 100
                cond = 1; zdat = [];
                continue
            end
        end
        
        if cond == 0
            dat = [dat;[x y zdat']];
            dat2 = [dat2;[x y zspdat']];
        end
    end
end

%% 
dat3 = [];
for j = 1:size(dat2,1)
    if dat2(j,5) ~= 0
        dat3 = [dat3;dat2(j,:)];
    end
end

for i = 82:102
    plot3(dat(:,1),dat(:,2),real(dat(:,i)),'b.','MarkerSize',1)
    hold on
    plot3(dat3(:,1),dat3(:,2),real(dat3(:,i)),'r.','MarkerSize',5)
end
title('Mandelbrot Set')
xlabel('Real axis')
ylabel('Imaginary axis')
zlabel('Real values of Z')