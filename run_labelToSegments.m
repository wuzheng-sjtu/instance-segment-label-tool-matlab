disp('================================');
close all; clear variables; dbstop error;
% for converting polygon labels to semantic and instance images

% source config
config;

% loop through all files
files = dir([image_dir, '/*.JPG']);
for file=1:length(files)
  disp(['Processing: ' num2str(file)]);
  file_name = files(file).name;
  I = imread([image_dir '/' file_name]);
  if exist([label_dir '/' file_name(1:end-4) '.mat'],'file')
    load([label_dir '/' file_name(1:end-4) '.mat']);
    SR = zeros(size(I,1),size(I,2),'uint8');
    SG = zeros(size(I,1),size(I,2),'uint8');
    SB = zeros(size(I,1),size(I,2),'uint8');
    IR = zeros(size(I,1),size(I,2),'uint8');
    IG = zeros(size(I,1),size(I,2),'uint8');
    IB = zeros(size(I,1),size(I,2),'uint8');
    [v,u] = find(SR==0);
    for priority=1:2
      for i=1:length(L)
        if labels{L{i}.class}{1}==priority
          in = inpoly([u v],L{i}.polyline);
          SR(in) = labels{L{i}.class}{2}(1)*256;
          SG(in) = labels{L{i}.class}{2}(2)*256;
          SB(in) = labels{L{i}.class}{2}(3)*256;
          IR(in) = randi([0,255]);
          IG(in) = randi([0,255]);
          IB(in) = randi([0,255]);
        end
      end
    end
    S = zeros(size(I,1),size(I,2),3,'uint8');
    I = zeros(size(I,1),size(I,2),3,'uint8');
    S(:,:,1) = SR; S(:,:,2) = SG; S(:,:,3) = SB;
    I(:,:,1) = IR; I(:,:,2) = IG; I(:,:,3) = IB;
    imwrite(S,[segment_dir '/' file_name(1:end-4) '.png']);
    imwrite(I,[instance_dir '/' file_name(1:end-4) '.png']);
  end
end

% done
disp('done!');
