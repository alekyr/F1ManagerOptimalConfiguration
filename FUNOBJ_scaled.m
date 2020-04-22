function y = FUNOBJ_scaled(x,p)

x_brakes     = x(1);
x_gear       = x(2);
x_rearwing   = x(3);
x_frontwing  = x(4);
x_suspension = x(5);
x_engine     = x(6);

% Brakes
Power              = p.Brakes.Data(1,x_brakes);
Aero               = p.Brakes.Data(2,x_brakes);
Grip               = p.Brakes.Data(3,x_brakes);
Reliability        = p.Brakes.Data(4,x_brakes);
AveragePitStopTime = p.Brakes.Data(5,x_brakes);

MaxPower              = p.Brakes.MaxPower;
MaxAero               = p.Brakes.MaxAero;
MaxGrip               = p.Brakes.MaxGrip;
MaxReliability        = p.Brakes.MaxReliability;
MinAveragePitStopTime = p.Brakes.MinAveragePitStopTime;

y_brakes =  (Power - MaxPower)^2/MaxPower ...
          + (Aero - MaxAero)^2/MaxAero ...
          + (Grip - MaxGrip)^2/MaxGrip ...
          + (Reliability - MaxReliability)^2/MaxReliability ...
          + (AveragePitStopTime - MinAveragePitStopTime)^2/MinAveragePitStopTime;

% Gear
Power              = p.Gear.Data(1,x_gear);
Aero               = p.Gear.Data(2,x_gear);
Grip               = p.Gear.Data(3,x_gear);
Reliability        = p.Gear.Data(4,x_gear);
AveragePitStopTime = p.Gear.Data(5,x_gear);

MaxPower              = p.Gear.MaxPower;
MaxAero               = p.Gear.MaxAero;
MaxGrip               = p.Gear.MaxGrip;
MaxReliability        = p.Gear.MaxReliability;
MinAveragePitStopTime = p.Gear.MinAveragePitStopTime;

y_gear =  (Power - MaxPower)^2/MaxPower ...
        + (Aero - MaxAero)^2/MaxAero ...
        + (Grip - MaxGrip)^2/MaxGrip ...
        + (Reliability - MaxReliability)^2/MaxReliability ...
        + (AveragePitStopTime - MinAveragePitStopTime)^2/MinAveragePitStopTime;

% RearWing
Power              = p.RearWing.Data(1,x_rearwing);
Aero               = p.RearWing.Data(2,x_rearwing);
Grip               = p.RearWing.Data(3,x_rearwing);
Reliability        = p.RearWing.Data(4,x_rearwing);
AveragePitStopTime = p.RearWing.Data(5,x_rearwing);

MaxPower              = p.RearWing.MaxPower;
MaxAero               = p.RearWing.MaxAero;
MaxGrip               = p.RearWing.MaxGrip;
MaxReliability        = p.RearWing.MaxReliability;
MinAveragePitStopTime = p.RearWing.MinAveragePitStopTime;

y_rearwing =  (Power - MaxPower)^2/MaxPower ...
            + (Aero - MaxAero)^2/MaxAero ...
            + (Grip - MaxGrip)^2/MaxGrip ...
            + (Reliability - MaxReliability)^2/MaxReliability ...
            + (AveragePitStopTime - MinAveragePitStopTime)^2/MinAveragePitStopTime;

% FrontWing
Power              = p.FrontWing.Data(1,x_frontwing);
Aero               = p.FrontWing.Data(2,x_frontwing);
Grip               = p.FrontWing.Data(3,x_frontwing);
Reliability        = p.FrontWing.Data(4,x_frontwing);
AveragePitStopTime = p.FrontWing.Data(5,x_frontwing);

MaxPower              = p.FrontWing.MaxPower;
MaxAero               = p.FrontWing.MaxAero;
MaxGrip               = p.FrontWing.MaxGrip;
MaxReliability        = p.FrontWing.MaxReliability;
MinAveragePitStopTime = p.FrontWing.MinAveragePitStopTime;

y_frontwing =  (Power - MaxPower)^2/MaxPower ...
             + (Aero - MaxAero)^2/MaxAero ...
             + (Grip - MaxGrip)^2/MaxGrip ...
             + (Reliability - MaxReliability)^2/MaxReliability ...
             + (AveragePitStopTime - MinAveragePitStopTime)^2/MinAveragePitStopTime;

% Suspension
Power              = p.Suspension.Data(1,x_suspension);
Aero               = p.Suspension.Data(2,x_suspension);
Grip               = p.Suspension.Data(3,x_suspension);
Reliability        = p.Suspension.Data(4,x_suspension);
AveragePitStopTime = p.Suspension.Data(5,x_suspension);

MaxPower              = p.Suspension.MaxPower;
MaxAero               = p.Suspension.MaxAero;
MaxGrip               = p.Suspension.MaxGrip;
MaxReliability        = p.Suspension.MaxReliability;
MinAveragePitStopTime = p.Suspension.MinAveragePitStopTime;

y_suspension =  (Power - MaxPower)^2/MaxPower ...
              + (Aero - MaxAero)^2/MaxAero ...
              + (Grip - MaxGrip)^2/MaxGrip ...
              + (Reliability - MaxReliability)^2/MaxReliability ...
              + (AveragePitStopTime - MinAveragePitStopTime)^2/MinAveragePitStopTime;

% Engine
Power              = p.Engine.Data(1,x_engine);
Aero               = p.Engine.Data(2,x_engine);
Grip               = p.Engine.Data(3,x_engine);
Reliability        = p.Engine.Data(4,x_engine);
AveragePitStopTime = p.Engine.Data(5,x_engine);

MaxPower              = p.Engine.MaxPower;
MaxAero               = p.Engine.MaxAero;
MaxGrip               = p.Engine.MaxGrip;
MaxReliability        = p.Engine.MaxReliability;
MinAveragePitStopTime = p.Engine.MinAveragePitStopTime;

y_engine =  (Power - MaxPower)^2/MaxPower ...
         + (Aero - MaxAero)^2/MaxAero ...
         + (Grip - MaxGrip)^2/MaxGrip ...
         + (Reliability - MaxReliability)^2/MaxReliability ...
         + (AveragePitStopTime - MinAveragePitStopTime)^2/MinAveragePitStopTime;

y = y_brakes + y_gear + y_rearwing + y_frontwing + y_suspension + y_engine;
% [Power Aero Grip Reliability AveragePitStopTime]

end