% Random data
% xy = [rand(100,2)*2+3; rand(100,2)];
% Visualize clouds
scatter(xy(:,1),xy(:,2))
% Cluster
[idx,c,sse] = kmeans(xy,2);
% Plot clouds with centroids and legend
plot(xy(idx==1,1),xy(idx==1,2),'r.','MarkerSize',12)
hold on
plot(xy(idx==2,1),xy(idx==2,2),'b.','MarkerSize',12)
plot(c(:,1),c(:,2),'kx','MarkerSize',12,'LineWidth',2)
plot(c(:,1),c(:,2),'ko','MarkerSize',12,'LineWidth',2)
legend(['Cluster 1 (SSE: ' num2str(sse(1))],...
       ['Cluster 2 (SSE: ' num2str(sse(2))],...
       'Centroids', 'Location','NW')