% set data directory
data_dir = 'data';

% semantic class labels (string) and colors (rgb double: [0..1])
% (CamVid: http://mi.eng.cam.ac.uk/research/projects/VideoRec/CamVid/)
% - 1st element: foreground priority (1=low, 2=high)
% - 2nd element: rgb color [0..1]^3
% - 3rd element: textual description
labels = [];
%labels{end+1} = {1,[64  128  64]/256,'Animal'};
%labels{end+1} = {1,[192   0 128]/256,'Archway'};
%labels{end+1} = {1,[0   128 192]/256,'Bicyclist'};
%labels{end+1} = {1,[0   128  64]/256,'Bridge'};
%labels{end+1} = {1,[128   0   0]/256,'Building'};
%labels{end+1} = {1,[ 64   0 128]/256,'Car'};
%labels{end+1} = {1,[ 64   0 192]/256,'CartLuggagePram'};
%labels{end+1} = {1,[192 128  64]/256,'Child'};
%labels{end+1} = {2,[192 192 128]/256,'Column_Pole'};
%labels{end+1} = {2,[ 64  64 128]/256,'Fence'};
%labels{end+1} = {1,[128   0 192]/256,'LaneMkgsDriv'};
%labels{end+1} = {1,[192   0  64]/256,'LaneMkgsNonDriv'};
%labels{end+1} = {1,[128 128  64]/256,'Misc_Text'};
%labels{end+1} = {1,[192   0 192]/256,'MotorcycleScooter'};
%labels{end+1} = {1,[128  64  64]/256,'OtherMoving'};
%labels{end+1} = {1,[ 64 192 128]/256,'ParkingBlock'};
%labels{end+1} = {1,[ 64  64   0]/256,'Pedestrian'};
%labels{end+1} = {1,[128  64 128]/256,'Road'};
%labels{end+1} = {1,[128 128 192]/256,'RoadShoulder'};
%labels{end+1} = {1,[  0   0 192]/256,'Sidewalk'};
%labels{end+1} = {2,[192 128 128]/256,'SignSymbol'};
%labels{end+1} = {1,[128 128 128]/256,'Sky'};
%abels{end+1} = {1,[ 64 128 192]/256,'SUVPickupTruck'};
%labels{end+1} = {2,[  0   0  64]/256,'TrafficCone'};
%abels{end+1} = {2,[  0  64  64]/256,'TrafficLight'};
%labels{end+1} = {1,[192  64 128]/256,'Train'};
%abels{end+1} = {1,[128 128   0]/256,'Tree'};
%labels{end+1} = {1,[192 128 192]/256,'Truck_Bus'};
%labels{end+1} = {1,[ 64   0  64]/256,'Tunnel'};
%labels{end+1} = {1,[192 192   0]/256,'VegetationMisc'};
%labels{end+1} = {1,[  0   0   0]/256,'Void'};
%labels{end+1} = {1,[ 64 192   0]/256,'Wall'};
labels{end+1} = {1,[64  128  64]/256,'Jenga'};

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% image / label / segment directories
image_dir = [data_dir '/images'];
label_dir = [data_dir '/labels'];
segment_dir = [data_dir '/segments'];
instance_dir = [data_dir '/instances'];

% create directories if they don't exist
if ~exist(image_dir,'dir'), mkdir(image_dir); end
if ~exist(label_dir,'dir'), mkdir(label_dir); end
if ~exist(segment_dir,'dir'), mkdir(segment_dir); end
if ~exist(instance_dir,'dir'), mkdir(instance_dir); end
