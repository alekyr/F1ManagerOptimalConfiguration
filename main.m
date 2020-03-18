%% Copyright by Alexios-Spyridon Kyriakides, 2020
clear;clc;tic
%% REQUIRED INPUT
% Define the available car parts by entering the respective ability (e.g., Power)
% value. Each time a new part of an upgrade is performed you need to change
% the input data and re-run the optimization. Each collumn represents
% another part, while each row corresponds to another ability. At this
% point these are my available parts and upgrades:

%              Starter TheAnchor SoftTouch SlamStop WTWT
p.Brakes.Data =     [8      10       11         9       9;          % Power
                     1       4       10         6      11;          % Aero
                     1       7        1         1       3;          % Grip
                     3       4        4        12       3;          % Reliability
                     0      -0.03     0.1      -0.19   -0.04];      % AveragePitStopTime

%              Starter TheRevolution TORQ TheSredder  KingCog
p.Gear.Data =       [4       4        4         5       4;          % Power
                     1       6        4        11       4;          % Aero
                     1       1       10         0       4;          % Grip
                     3       4        4         3       6;          % Reliability
                     0      -0.08    -0.38     +0.1    -0.0];       % AveragePitStopTime

%                Starter   Stiky JetStream TheAfterBurner
p.RearWing.Data =  [18      19       18        19;                  % Power
                     1       1        7         3;                  % Aero
                     1      11        1         6;                  % Grip
                     3       4        4         3;                  % Reliability
                     0      -0.19    -0.12     +0.1];               % AveragePitStopTime

%                 Starter Ramjet TheTurbulence LaserLock TheRollercoaster
p.FrontWing.Data = [13      13       13        15        13;        % Power
                     1       4        7         2         3;        % Aero
                     1       1        1        13         3;        % Grip
                     3       6        5         4         4;        % Reliability
                     0      +0.0     -0.12     -0.09     +0.1];     % AveragePitStopTime

%             Starter TheMagicCarpet TheSmoothie TheStilts
p.Suspension.Data = [4       9        9        10;                  % Power
                     1       1        3        12;                  % Aero
                     1       2       11         2;                  % Grip
                     3       5        4         4;                  % Reliability
                     0      +0.1     +0.1      -0.19];              % AveragePitStopTime

%                Starter TheInferno Zen    FreeWheeler
p.Engine.Data =    [21      22       25        22;                  % Power
                     1       6       11        10;                  % Aero
                     1       3        6         1;                  % Grip
                     3       4        4         3;                  % Reliability
                     0      -0.19    -0.09     +0.0];               % AveragePitStopTime

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
[x_normal;
 x_overall]

%% Not important
disp(' ')
final_time = toc/60;
fprintf('Elapsed time is %g minutes. \n', final_time);
disp('Game Over')
