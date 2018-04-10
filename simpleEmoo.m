%Yogesh Pawar
clear;
clf
stars = 300;
iterations = 100;
population = 40;
mutation = 0.5;
mutation_step = 1;
fitness_sharing_ration = 3;
grid_size = 30;
warning off;
star = grid_size*rand(stars,2);   
cit = rand(population, 3)*grid_size;  
for j = 1:population
    enclosed = 0;
    for k = 1:stars                                                                                         %
        if cit(j,3) >= sqrt((star(k,1)-cit(j,1))^2 + (star(k,2)-cit(j,2))^2),enclosed = enclosed+1; end     % counting the enclosed stars
    end                                                                                                     %
    cit(j,4) = enclosed;                                                                                    %
end
cit = sortrows(cit,3);
cit(:,7)=0;
distance=[];
for i = 1:population-1
    for j = i+1:population
        if cit(i,4)>cit(j,4),cit(i,6)=cit(i,6)+1;cit(j,5)=cit(j,5)+1; end
        distance(i,j) = sqrt((cit(i,3)-cit(j,3))^2 + (cit(i,4)-cit(j,4))^2);
        distance(j,i) = distance(i,j);
    end
    nearest = sort(distance(i,:));
    cit(i,7) = cit(i,7) - fitness_sharing_ration/(nearest(2));
    cit(i,7) = cit(i,7) + cit(i,6) - cit(i,5);
end
cit(:, 7) = -1*cit(:, 7);
cit = sortrows(cit, 7);
cit(:, 7) = -1*cit(:, 7);
figure(1);
hold on;
xlabel ('Radius');
ylabel ('Stars Enclosed');
for i = 1:iterations
    %--------------- Mating Selection -----------------

    pool = cit(1 : population/4 , :);

    %--------------- Crossover ------------------
    s = size(pool,1);
    if s/2 - round(s/2) ~=0 , pool = pool(1:s-1,:); s = size(pool,1); end
    for m = 1:2:s
        pool = [ pool ; [pool(m,1) , pool(m+1,[2,3]),-1,-1,-1,-1]];
        pool = [ pool ; [pool(m+1,[1,2]) , pool(m,3),-1,-1,-1,-1]];
    end
    pool = pool(s + 1 : end, :);
    %--------------- Mutation -------------------
    s = size(pool,1);
    for m = 1:s
        if (rand < mutation) , pool(m,1)=pool(m,1)+(2*rand - 1)*mutation_step; end
        if (rand < mutation) , pool(m,2)=pool(m,2)+(2*rand - 1)*mutation_step; end
        if (rand < mutation) , pool(m,3)=pool(m,3)+(2*rand - 1)*mutation_step; if pool(m,3)<=0 , pool(m,3)=0.000000001; end,end
    end
    %--------------- Invironmental Selection------------
    ps = size(pool,1);
    for j = 1:ps
        enclosed = 0;
        for k = 1:stars
            if pool(j,3) >= sqrt((star(k,1)-pool(j,1))^2 + (star(k,2)-pool(j,2))^2),enclosed = enclosed+1;end
        end
        pool(j,4) = enclosed;
    end
    temp = [cit ; pool];
    temp(:,5)=0;
    temp(:,6)=0;
    temp(:,7)=0;
    temp = sortrows(temp,3);
    ts = size(temp,1);
    distance = [];
    for j = 1:ts-1
        for k = j+1:ts
            if temp(j,4)>temp(k,4),temp(j,6)=temp(j,6)+1;temp(k,5)=temp(k,5)+1;end
            distance(j,k) = sqrt((temp(j,3)-temp(k,3))^2 + (temp(j,4)-temp(k,4))^2);
            distance(k,j) = distance(j,k);
        end
        nearest = sort(distance(j,:));
        temp(j,7) = temp(j,7) - fitness_sharing_ration/(nearest(2));
        temp(j,7) = temp(j,7) + temp(j,6) - temp(j,5);
    end
    temp(:, 7) = -1*temp(:, 7);
    temp = sortrows(temp, 7);
    temp(:, 7) = -1*temp(:, 7);
    cit = temp(1:population,:);

    for j = 1:population
        z = plot((cit(j,3)),cit(j,4),'x');
    end
end

for j = 1:population
    u = plot((cit(j,3)),cit(j,4),'rs');
end
legend([z, u], 'Solution' ,'Pareto Front');

% xc = cit(1,1);
% yc = cit(1,2);
% r  = cit(1,3);
% x = (xc-r) : 0.05 : (xc+r);
% for l = 1:size(x,2)
%     y(l) = yc + sqrt(r^2-(x(l)-xc)^2);
% end
% figure(2);
% title ('Stars');
% plot (x,y)
% for i = 1:size(x,2)
%     y(i) = yc - sqrt(r^2-(x(i)-xc)^2);
% end
% plot (x,y)