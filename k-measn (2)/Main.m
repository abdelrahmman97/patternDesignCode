close all;
clear;
clc;

X = importdata('../dataset/Mall_Customers.csv');
X = X.data;
Z = [X(:,2), X(:,3)];

figure('units','normalized','outerposition',[0 0 1 1]);
plot(Z(:,1),Z(:,2),'.');
xlabel('Annual Income (k$)');
ylabel('Spending Score (1-100)');
title ('Customers Data');

zzz = kMeansInitCentroids(Z, 5);
runkMeans(Z, zzz, 6, true);
