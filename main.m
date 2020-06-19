%% Copyright by Alexios-Spyridon Kyriakides, 2020
clear; clc; tic
%% REQUIRED INPUT
% Define the available car parts by entering the respective ability (e.g., Power)
% value. Each time a new part of an upgrade is performed you need to change
% the input data and re-run the optimization. Each collumn represents
% another part, while each row corresponds to another ability. At this
% point these are my available parts and upgrades:

% -------------------------------------------------------------------------

Brakes_Data_All = readtable('DataOnParts.xlsx', 'Sheet', 'Brakes', 'Range', 'B2:O43');

[nR, nC] = size(Brakes_Data_All);
Name = cell(8,1);
icount = 1;
for i = 2 : nR
    dato = table2array(Brakes_Data_All(i,1));
    if isempty(dato{1,1})
%         disp('empty')
    else
        Name(icount,1) = table2array(Brakes_Data_All(i,1));
        icount = icount + 1;
    end
end
p.Brakes.Names = Name;

Stats = zeros(5,length(p.Brakes.Names));
LvL = zeros(1,length(p.Brakes.Names));
for j = 1 : length(p.Brakes.Names)
    for i = 5 : nC
        dato = table2array(Brakes_Data_All(2+(j-1)*5,i));
        while isnan(dato) == false
            LvL(j) = i - 4;
            Stats(:,j) = table2array(Brakes_Data_All(2+(j-1)*5:6+(j-1)*5, 4+LvL(j)));
            break
        end
    end
end
p.Brakes.LvL  = LvL;
p.Brakes.Data = Stats;

% -------------------------------------------------------------------------

Gearbox_Data_All = readtable('DataOnParts.xlsx', 'Sheet', 'Gearbox', 'Range', 'B2:O43');

[nR, nC] = size(Gearbox_Data_All);
Name = cell(8,1);
icount = 1;
for i = 2 : nR
    dato = table2array(Gearbox_Data_All(i,1));
    if isempty(dato{1,1})
%         disp('empty')
    else
        Name(icount,1) = table2array(Gearbox_Data_All(i,1));
        icount = icount + 1;
    end
end
p.Gear.Names = Name;

Stats = zeros(5,length(p.Gear.Names));
LvL = zeros(1,length(p.Gear.Names));
for j = 1 : length(p.Gear.Names)
    for i = 5 : nC
        dato = table2array(Gearbox_Data_All(2+(j-1)*5,i));
        while isnan(dato) == false
            LvL(j) = i - 4;
            Stats(:,j) = table2array(Gearbox_Data_All(2+(j-1)*5:6+(j-1)*5, 4+LvL(j)));
            break
        end
    end
end
p.Gear.LvL  = LvL;
p.Gear.Data = Stats;

% -------------------------------------------------------------------------

RearWing_Data_All = readtable('DataOnParts.xlsx', 'Sheet', 'RearWing', 'Range', 'B2:O43');

[nR, nC] = size(RearWing_Data_All);
Name = cell(8,1);
icount = 1;
for i = 2 : nR
    dato = table2array(RearWing_Data_All(i,1));
    if isempty(dato{1,1})
%         disp('empty')
    else
        Name(icount,1) = table2array(RearWing_Data_All(i,1));
        icount = icount + 1;
    end
end
p.RearWing.Names = Name;

Stats = zeros(5,length(p.RearWing.Names));
LvL = zeros(1,length(p.RearWing.Names));
for j = 1 : length(p.RearWing.Names)
    for i = 5 : nC
        dato = table2array(RearWing_Data_All(2+(j-1)*5,i));
        while isnan(dato) == false
            LvL(j) = i - 4;
            Stats(:,j) = table2array(RearWing_Data_All(2+(j-1)*5:6+(j-1)*5, 4+LvL(j)));
            break
        end
    end
end
p.RearWing.LvL  = LvL;
p.RearWing.Data = Stats;

% -------------------------------------------------------------------------

FrontWing_Data_All = readtable('DataOnParts.xlsx', 'Sheet', 'FrontWing', 'Range', 'B2:O43');

[nR, nC] = size(FrontWing_Data_All);
Name = cell(8,1);
icount = 1;
for i = 2 : nR
    dato = table2array(FrontWing_Data_All(i,1));
    if isempty(dato{1,1})
%         disp('empty')
    else
        Name(icount,1) = table2array(FrontWing_Data_All(i,1));
        icount = icount + 1;
    end
end
p.FrontWing.Names = Name;

Stats = zeros(5,length(p.FrontWing.Names));
LvL = zeros(1,length(p.FrontWing.Names));
for j = 1 : length(p.FrontWing.Names)
    for i = 5 : nC
        dato = table2array(FrontWing_Data_All(2+(j-1)*5,i));
        while isnan(dato) == false
            LvL(j) = i - 4;
            Stats(:,j) = table2array(FrontWing_Data_All(2+(j-1)*5:6+(j-1)*5, 4+LvL(j)));
            break
        end
    end
end
p.FrontWing.LvL  = LvL;
p.FrontWing.Data = Stats;

% -------------------------------------------------------------------------

Suspension_Data_All = readtable('DataOnParts.xlsx', 'Sheet', 'Suspension', 'Range', 'B2:O43');

[nR, nC] = size(Suspension_Data_All);
Name = cell(8,1);
icount = 1;
for i = 2 : nR
    dato = table2array(Suspension_Data_All(i,1));
    if isempty(dato{1,1})
%         disp('empty')
    else
        Name(icount,1) = table2array(Suspension_Data_All(i,1));
        icount = icount + 1;
    end
end
p.Suspension.Names = Name;

Stats = zeros(5,length(p.Suspension.Names));
LvL = zeros(1,length(p.Suspension.Names));
for j = 1 : length(p.Suspension.Names)
    for i = 5 : nC
        dato = table2array(Suspension_Data_All(2+(j-1)*5,i));
        while isnan(dato) == false
            LvL(j) = i - 4;
            Stats(:,j) = table2array(Suspension_Data_All(2+(j-1)*5:6+(j-1)*5, 4+LvL(j)));
            break
        end
    end
end
p.Suspension.LvL  = LvL;
p.Suspension.Data = Stats;

% -------------------------------------------------------------------------

Engine_Data_All = readtable('DataOnParts.xlsx', 'Sheet', 'Engine', 'Range', 'B2:O43');

[nR, nC] = size(Engine_Data_All);
Name = cell(8,1);
icount = 1;
for i = 2 : nR
    dato = table2array(Engine_Data_All(i,1));
    if isempty(dato{1,1})
%         disp('empty')
    else
        Name(icount,1) = table2array(Engine_Data_All(i,1));
        icount = icount + 1;
    end
end
p.Engine.Names = Name;

Stats = zeros(5,length(p.Engine.Names));
LvL = zeros(1,length(p.Engine.Names));
for j = 1 : length(p.Engine.Names)
    for i = 5 : nC
        dato = table2array(Engine_Data_All(2+(j-1)*5,i));
        while isnan(dato) == false
            LvL(j) = i - 4;
            Stats(:,j) = table2array(Engine_Data_All(2+(j-1)*5:6+(j-1)*5, 4+LvL(j)));
            break
        end
    end
end
p.Engine.LvL  = LvL;
p.Engine.Data = Stats;

%%
% %                Starter   Gecko TheKeeper Vacuum Drag-on Minimax
% % LVL                1       4       1       6       1       2
% p.Brakes.Data =     [7       7       7       8       7       7;             % Power
%                      2       4       3       8       9       9;             % Aero
%                      2      10      10      15       6      14;             % Grip
%                      2       4      12       4       3       4;             % Reliability
%                      0       0.00    0.00    0.00    0.00    0.00];         % AveragePitStopTime
% 
% p.Brakes.Data = Stats;
% 
% 
% %                Starter  Engager Vortex    MSM Sliders TheGetaway
% % LVL                1       6       2       2       6       1
% p.Gear.Data =       [7       8       7       7       8       7;             % Power
%                      2       5       7       4       5       3;             % Aero
%                      2       5       4       4       5       5;             % Grip
%                      2       5       4       8      13       3;             % Reliability
%                      0      -0.16   -0.22   -0.04   -0.12   -0.12];         % AveragePitStopTime
% 
% %                Starter   Phazer Contrail Perigrine Lock&Load
% % LVL                1       6       3       1       1
% p.RearWing.Data =   [7       8      10      13       7;             % Power
%                      2      10       8       2       6;             % Aero
%                      2       7       4       3       3;             % Grip
%                      2       5       4       3       3;             % Reliability
%                      0       0.00    0.00    0.00    0.00];         % AveragePitStopTime
% 
% %                Starter TheCarver Lock-On BigBite Blazer
% % LVL                1       1       6       4       2
% p.FrontWing.Data =  [7       7       8      12       7;     % Power
%                      2       3       5       4       2;     % Aero
%                      2       3       4       4       4;     % Grip
%                      2      10       5       4       3;     % Reliability
%                      0      -0.07   -0.55   -0.13   -0.13]; % AveragePitStopTime
% 
% %                Starter Bungee Compressor Infuencer Pinpoint
% % LVL                1       1       7       1       1
% p.Suspension.Data = [7       7       8       7       7;             % Power
%                      2       3      11       6       3;             % Aero
%                      2       3       5       3       3;             % Grip
%                      2       3      12       4       3;             % Reliability
%                      0       0.00    0.00    0.00   -0.02];         % AveragePitStopTime
% 
% %                Starter TheStickler Gorilla TheBrute BigBore
% % LVL                1       7       3       6       2
% p.Engine.Data =     [8      17      17      14      17;     % Power
%                      2       5       4       5       4;     % Aero
%                      2       5       6      10       4;     % Grip
%                      2       5       4       5       4;     % Reliability
%                      0      -0.19   -0.13   -0.19   -0.13]; % AveragePitStopTime

%% NECESSARY PARAMETER CALCULATION
% Caclulate the maximum (or minimum for averege pit stop time) value
% available for each attribute (e.g., aero) for each type of component
% (e.g., gear). These values are used in the objective function.
p.Brakes.MaxPower                  = max(p.Brakes.Data(1,:));
p.Brakes.MaxAero                   = max(p.Brakes.Data(2,:));
p.Brakes.MaxGrip                   = max(p.Brakes.Data(3,:));
p.Brakes.MaxReliability            = max(p.Brakes.Data(4,:));
p.Brakes.MinAveragePitStopTime     = min(p.Brakes.Data(5,:));

p.Gear.MaxPower                    = max(p.Gear.Data(1,:));
p.Gear.MaxAero                     = max(p.Gear.Data(2,:));
p.Gear.MaxGrip                     = max(p.Gear.Data(3,:));
p.Gear.MaxReliability              = max(p.Gear.Data(4,:));
p.Gear.MinAveragePitStopTime       = min(p.Gear.Data(5,:));

p.RearWing.MaxPower                = max(p.RearWing.Data(1,:));
p.RearWing.MaxAero                 = max(p.RearWing.Data(2,:));
p.RearWing.MaxGrip                 = max(p.RearWing.Data(3,:));
p.RearWing.MaxReliability          = max(p.RearWing.Data(4,:));
p.RearWing.MinAveragePitStopTime   = min(p.RearWing.Data(5,:));

p.FrontWing.MaxPower               = max(p.FrontWing.Data(1,:));
p.FrontWing.MaxAero                = max(p.FrontWing.Data(2,:));
p.FrontWing.MaxGrip                = max(p.FrontWing.Data(3,:));
p.FrontWing.MaxReliability         = max(p.FrontWing.Data(4,:));
p.FrontWing.MinAveragePitStopTime  = min(p.FrontWing.Data(5,:));

p.Suspension.MaxPower              = max(p.Suspension.Data(1,:));
p.Suspension.MaxAero               = max(p.Suspension.Data(2,:));
p.Suspension.MaxGrip               = max(p.Suspension.Data(3,:));
p.Suspension.MaxReliability        = max(p.Suspension.Data(4,:));
p.Suspension.MinAveragePitStopTime = min(p.Suspension.Data(5,:));

p.Engine.MaxPower                  = max(p.Engine.Data(1,:));
p.Engine.MaxAero                   = max(p.Engine.Data(2,:));
p.Engine.MaxGrip                   = max(p.Engine.Data(3,:));
p.Engine.MaxReliability            = max(p.Engine.Data(4,:));
p.Engine.MinAveragePitStopTime     = min(p.Engine.Data(5,:));

%% OPTIMIZATION
% The Decision variables are integer variables that coresponds to each
% available car part. At this point we need to define the lower and upper
% bounds of the decision variables. The lower bound is equal to one (the
% starter choice) while the upper bound is equal to the collumn number of
% the corresponding part's matrix.
lb = [1, 1, 1, 1, 1, 1];
ub = [size(p.Brakes.Data,2), size(p.Gear.Data,2), size(p.RearWing.Data,2), ...
    size(p.FrontWing.Data,2), size(p.Suspension.Data,2), size(p.Engine.Data,2)];
% The options defined here refer to the the availabele plots. No additional
% options are altered. For your info, the available plots are: @gaplotbestf
% | @gaplotbestindiv | @gaplotdistance | @gaplotexpectation |
% @gaplotgenealogy | @gaplotmaxconstr | @gaplotrange | @gaplotselection |
% @gaplotscorediversity | @gaplotscores | @gaplotstopping
options_ga = gaoptimset('PlotFcn',{@gaplotbestf, @gaplotstopping, ...
    @gaplotbestindiv, @gaplotdistance, @gaplotexpectation, ...
    @gaplotgenealogy, @gaplotmaxconstr, @gaplotrange, @gaplotselection, ...
    @gaplotscorediversity, @gaplotscores, @gaplotstopping}, 'Display', 'iter');
% All decision variables are integers, so:
IntCon = [1, 2, 3, 4, 5, 6];

% Weights on each term, Power, Aero, Grip, Reliability, AveragePitStopTime
p.Weight            = [   1     1     1        0.000001             0.000001];
% Perform the global optimization using FUNOBJ. For details look inside the
% respective objective function.
[x_normal,fval_normal,exitflag_normal] = ga(@(x)FUNOBJ(x,p),length(IntCon),[],[],[],[],lb,ub,[],IntCon, options_ga);
% Perform the global optimization using FUNOBJ_overall. For details look
% inside the respective objective function.
[x_overall,fval_overall,exitflag_overall] = ga(@(x)FUNOBJ_overall(x,p),length(IntCon),[],[],[],[],lb,ub,[],IntCon, options_ga);

%% RESULTS
% I have not been able to present result in a better way, yet. I was
% hopping of making a presentation based on the names or create a gui that
% will show the best configuration (name, photo, etc) but havent found the
% time to do so yet. Each collumn corresponds to another category of car
% part (e.g., front wing is the forth collumn).
x_normal;
Names1 = [p.Brakes.Names(x_normal(1)) p.Gear.Names(x_normal(2)) p.RearWing.Names(x_normal(3)) p.FrontWing.Names(x_normal(4)) p.Suspension.Names(x_normal(5)) p.Engine.Names(x_normal(6))]';
Values1 = sum([p.Brakes.Data(:,x_normal(1)) p.Gear.Data(:,x_normal(2)) p.RearWing.Data(:,x_normal(3)) p.FrontWing.Data(:,x_normal(4)) p.Suspension.Data(:,x_normal(5)) p.Engine.Data(:,x_normal(6))]')';

x_overall;
Names2 = [p.Brakes.Names(x_overall(1)) p.Gear.Names(x_overall(2)) p.RearWing.Names(x_overall(3)) p.FrontWing.Names(x_overall(4)) p.Suspension.Names(x_overall(5)) p.Engine.Names(x_overall(6))]';
Values2 = sum([p.Brakes.Data(:,x_overall(1)) p.Gear.Data(:,x_overall(2)) p.RearWing.Data(:,x_overall(3)) p.FrontWing.Data(:,x_overall(4)) p.Suspension.Data(:,x_overall(5)) p.Engine.Data(:,x_overall(6))]')';

[Names1 Names2]
[x_normal' x_overall']
[Values1 Values2]
%% Not important
disp(' ')
final_time = toc/60;
fprintf('Elapsed time is %g minutes. \n', final_time);
disp('Game Over')
