function centroids = computeCentroids(X, idx, K)
    [m n] = size(X);
    centroids = zeros(K, n);
    for k = 1:K
        point_indeces = find(idx==k);
        centroids(k, :) = sum(X(point_indeces, :)) ./ length(point_indeces);
    end
end