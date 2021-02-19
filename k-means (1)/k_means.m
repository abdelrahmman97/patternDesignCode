close all;
clear;
clc;


% load data
X = importdata('dataset/Mall_Customers.csv');
X = X.data;
Z = [X(:,2), X(:,3)];

figure('units','normalized','outerposition',[0 0 1 1]);
plot(Z(:,1),Z(:,2),'.');
xlabel('Annual Income (k$)');
ylabel('Spending Score (1-100)');
title ('Customers Data');

opts = statset('Display','final');

[idx,C] = kmeans(Z,5,'Distance','cityblock', 'Replicates',5,'Options',opts);

figure('units','normalized','outerposition',[0 0 1 1]);

plot(Z(idx==1,1),Z(idx==1,2),'r.','MarkerSize',12)
hold on
plot(Z(idx==2,1),Z(idx==2,2),'b.','MarkerSize',12)
hold on
plot(Z(idx==3,1),Z(idx==3,2),'k.','MarkerSize',12)
hold on
plot(Z(idx==4,1),Z(idx==4,2),'m.','MarkerSize',12)
hold on
plot(Z(idx==5,1),Z(idx==5,2),'g.','MarkerSize',12)

plot(C(:,1),C(:,2),'kx', 'MarkerSize',15,'LineWidth',3) 
legend('Cluster 1','Cluster 2','Cluster 3','Cluster 4','Cluster 5','Centroids', 'Location','NW')
title('Cluster Assignments and Centroids')
hold off