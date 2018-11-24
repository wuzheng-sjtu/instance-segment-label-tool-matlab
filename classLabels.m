function [str,col] = classLabels ()

% source config
config;

str = [];
col = [];

for i=1:length(labels)
  str{i} = sprintf('%d: %s',i,labels{i}{3});
  col(i,:) = labels{i}{2};
end
