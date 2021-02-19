
function idx = findClosestCentroids(X, centroids)
    K = size(centroids, 1);
    idx = zeros(size(X,1), 1);
    for i = 1:length(idx)
        distance = zeros(K, 1);
        for j = 1:K
            distance(j) = sum(sum((X(i, :) - centroids(j, :)) .^ 2 ));
        end
        [value, idx(i)] = min(distance);
    end
end