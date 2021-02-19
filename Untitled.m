% New code ///////////////////// Train a k-Means Clustering Algorithm
% clc;
% clear;
% 
% load fisheriris
% X = meas(:,3:4);
% 
% figure;
% plot(X(:,1),X(:,2),'k*','MarkerSize',5);
% title 'Fisher''s Iris Data';
% xlabel 'Petal Lengths (cm)'; 
% ylabel 'Petal Widths (cm)';
% 
% rng(1); % For reproducibility
% [idx,C] = kmeans(X,3);
% 
% x1 = min(X(:,1)):0.01:max(X(:,1));
% x2 = min(X(:,2)):0.01:max(X(:,2));
% [x1G,x2G] = meshgrid(x1,x2);
% XGrid = [x1G(:),x2G(:)]; % Defines a fine grid on the plot
% 
% idx2Region = kmeans(XGrid,3,'MaxIter',1,'Start',C);
% 
% % Assigns each node in the grid to the closest centroid
% 
% figure;
% gscatter(XGrid(:,1),XGrid(:,2),idx2Region,[0,0.75,0.75;0.75,0,0.75;0.75,0.75,0],'..');
% hold on;
% plot(X(:,1),X(:,2),'k*','MarkerSize',5);
% title 'Fisher''s Iris Data';
% xlabel 'Petal Lengths (cm)';
% ylabel 'Petal Widths (cm)'; 
% legend('Region 1','Region 2','Region 3','Data','Location','SouthEast');
% hold off;




% New code ///////////////////// Partition Data into Two Clusters
clc;
clear;

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




% % New code ///////////////////// Cluster Data Using Parallel Computing
% clc;
% clear;
% Mu = bsxfun(@times,ones(20,30),(1:20)'); % Gaussian mixture mean
% rn30 = randn(30,30);
% Sigma = rn30'*rn30; % Symmetric and positive-definite covariance
% Mdl = gmdistribution(Mu,Sigma); % Define the Gaussian mixture distribution
% 
% rng(1); % For reproducibility
% X = random(Mdl,10000);
% 
% stream = RandStream('mlfg6331_64');  % Random number stream
% options = statset('UseParallel',1,'UseSubstreams',1, 'Streams',stream);
% 
% tic; % Start stopwatch timer
% [idx,C,sumd,D] = kmeans(X,20,'Options',options,'MaxIter',10000, 'Display','final','Replicates',10);
% 
% toc % Terminate stopwatch timer




% New code ///////////////////// Assign New Data to Existing Clusters and Generate C/C++ Code
% clc;
% clear;
% rng('default') % For reproducibility
% X = [randn(100,2)*0.75+ones(100,2);
%     randn(100,2)*0.5-ones(100,2);
%     randn(100,2)*0.75];
% 
% [idx,C] = kmeans(X,3);
% 
% figure
% gscatter(X(:,1),X(:,2),idx,'bgm')
% hold on
% plot(C(:,1),C(:,2),'kx')
% legend('Cluster 1','Cluster 2','Cluster 3','Cluster Centroid')
% 
% Xtest = [randn(10,2)*0.75+ones(10,2);
%     randn(10,2)*0.5-ones(10,2);
%     randn(10,2)*0.75];
% 
% [~,idx_test] = pdist2(C,Xtest,'euclidean','Smallest',1);
% 
% gscatter(Xtest(:,1),Xtest(:,2),idx_test,'bgm','ooo')
% legend('Cluster 1','Cluster 2','Cluster 3','Cluster Centroid', ...
%     'Data classified to Cluster 1','Data classified to Cluster 2', ...
%     'Data classified to Cluster 3')
% 
% type findNearestCentroid % Display contents of findNearestCentroid.m
% 
% codegen findNearestCentroid -args {C,Xtest}
% 
% myIndx = findNearestCentroid(C,Xtest);
% myIndex_mex = findNearestCentroid_mex(C,Xtest);
% verifyMEX = isequal(idx_test,myIndx,myIndex_mex)



