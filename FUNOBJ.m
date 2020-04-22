function y = FUNOBJ(x,p)
% The problem that is solved here is defined as:
% 
%      n m 
%  J = ? ?(Component(i).Attribute(j) - MaximumValueofAttribute(j)inComponent(i))
%      i j
% i = [Brakes, Gear, RearWing, FrontWing, Suspension, Engine]
% j = [Power, Aero, Grip, Reliability, AveragePitStopTime]
% n = length(i)
% m = length(j)
% 
% Maximum value of attribute j in component i is defined in main.m file,
% which is a required input for this problem.
% 
% The idea behind the formulation of this objective function is that for
% each type of part (e.g., Brakes) you want to choose, among those that are
% available, the one that performs best in all categories of attributes
% (e.g., Grip). So the results should be the selection of the best part at
% each type of equipment.

% Give more meaningfull names to the decision variables
x_brakes     = x(1);
x_gear       = x(2);
x_rearwing   = x(3);
x_frontwing  = x(4);
x_suspension = x(5);
x_engine     = x(6);

% Defive each attribute based on the value of each decicion variable

% Brakes
% The part of the objective that corresponds to the brakes selected.
y_brakes =  (p.Brakes.Data(1,x_brakes) - p.Brakes.MaxPower)^2 ...
          + (p.Brakes.Data(2,x_brakes) - p.Brakes.MaxAero)^2 ...
          + (p.Brakes.Data(3,x_brakes) - p.Brakes.MaxGrip)^2 ...
          + (p.Brakes.Data(4,x_brakes) - p.Brakes.MaxReliability)^2 ...
          + (p.Brakes.Data(5,x_brakes) - p.Brakes.MinAveragePitStopTime)^2;

% Gear
% The part of the objective that corresponds to the gear selected.
y_gear =    (p.Gear.Data(1,x_gear) - p.Gear.MaxPower)^2 ...
          + (p.Gear.Data(2,x_gear) - p.Gear.MaxAero)^2 ...
          + (p.Gear.Data(3,x_gear) - p.Gear.MaxGrip)^2 ...
          + (p.Gear.Data(4,x_gear) - p.Gear.MaxReliability)^2 ...
          + (p.Gear.Data(5,x_gear) - p.Gear.MinAveragePitStopTime)^2;

% RearWing
% The part of the objective that corresponds to the rear wing selected.
y_rearwing = (p.RearWing.Data(1,x_rearwing) - p.RearWing.MaxPower)^2 ...
           + (p.RearWing.Data(2,x_rearwing) - p.RearWing.MaxAero)^2 ...
           + (p.RearWing.Data(3,x_rearwing) - p.RearWing.MaxGrip)^2 ...
           + (p.RearWing.Data(4,x_rearwing) - p.RearWing.MaxReliability)^2 ...
           + (p.RearWing.Data(5,x_rearwing) - p.RearWing.MinAveragePitStopTime)^2;

% FrontWing
% The part of the objective that corresponds to the front wing selected.
y_frontwing = (p.FrontWing.Data(1,x_frontwing) - p.FrontWing.MaxPower)^2 ...
            + (p.FrontWing.Data(2,x_frontwing) - p.FrontWing.MaxAero)^2 ...
            + (p.FrontWing.Data(3,x_frontwing) - p.FrontWing.MaxGrip)^2 ...
            + (p.FrontWing.Data(4,x_frontwing) - p.FrontWing.MaxReliability)^2 ...
            + (p.FrontWing.Data(5,x_frontwing) - p.FrontWing.MinAveragePitStopTime)^2;

% Suspension
% The part of the objective that corresponds to the suspension selected.
y_suspension = (p.Suspension.Data(1,x_suspension) - p.Suspension.MaxPower)^2 ...
             + (p.Suspension.Data(2,x_suspension) - p.Suspension.MaxAero)^2 ...
             + (p.Suspension.Data(3,x_suspension) - p.Suspension.MaxGrip)^2 ...
             + (p.Suspension.Data(4,x_suspension) - p.Suspension.MaxReliability)^2 ...
             + (p.Suspension.Data(5,x_suspension) - p.Suspension.MinAveragePitStopTime)^2;

% Engine
% The part of the objective that corresponds to the engine selected.
y_engine = (p.Engine.Data(1,x_engine) - p.Engine.MaxPower)^2 ...
         + (p.Engine.Data(2,x_engine) - p.Engine.MaxAero)^2 ...
         + (p.Engine.Data(3,x_engine) - p.Engine.MaxGrip)^2 ...
         + (p.Engine.Data(4,x_engine) - p.Engine.MaxReliability)^2 ...
         + (p.Engine.Data(5,x_engine) - p.Engine.MinAveragePitStopTime)^2;

y = y_brakes + y_gear + y_rearwing + y_frontwing + y_suspension + y_engine;

end