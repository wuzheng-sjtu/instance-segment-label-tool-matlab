function showAndSaveLabels(h_a,I,L,label_dir,file_name,file,number_of_files)

% show image
axes(h_a); cla; imshow(I); hold on;

% show labels
[~,label_col] = classLabels();

% if at least one polygon has been annotated
if ~isempty(L)
  for i=1:length(L)
    L{i}.polyline(L{i}.polyline(:,1)<3,1) = 3;
    L{i}.polyline(L{i}.polyline(:,2)<3,2) = 3;
    L{i}.polyline(L{i}.polyline(:,1)>size(I,2)-2,1) = size(I,2)-2;
    L{i}.polyline(L{i}.polyline(:,2)>size(I,1)-2,2) = size(I,1)-2;
    c = L{i}.class;
    p = L{i}.polyline;
    for j=1:size(p,1)
      j1 = j;
      j2 = j+1;
      if j2>size(p,1)
        j2 = 1;
      end
      line([p(j1,1) p(j2,1)],[p(j1,2) p(j2,2)],'Color',label_col(c,:),'LineWidth',3); 
    end
  end
  
  % save labels to file
  save([label_dir '/' file_name(1:end-4) '.mat'],'L');
else
    
  % delete file
  if (exist([label_dir '/' file_name(1:end-4) '.mat'],'file'))
    delete([label_dir '/' file_name(1:end-4) '.mat']);
  end
end

% display file number
title(sprintf('File: %s (%d/%d)',file_name,file,number_of_files),'Interpreter','none','FontSize',12);
