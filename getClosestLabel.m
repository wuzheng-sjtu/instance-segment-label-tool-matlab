function label_num = getClosestLabel (L,u,v)

if length(L)<1
  label_num = [];
else
  label_num  = [];
  label_dist = 10000;
  for i=1:length(L)
    curr_dist = norm([u v]-mean(L{i}.polyline));
    if curr_dist<label_dist
      label_dist = curr_dist;
      label_num = i;
    end
  end
end
