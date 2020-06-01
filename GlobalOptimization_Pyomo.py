import numpy as np
##import matplotlib.pyplot as plt
##from mpl_toolkits.mplot3d import Axes3D
##from scipy import optimize
from gekko import GEKKO

#                   Starter   Gecko TheKeeper Vacuum
# LVL                   1       3       1       3
Brakes     = np.array([[7,      7,      7,      7],       # Power
                       [2,      4,      3,      7],       # Aero
                       [2,      7,     10,     10],       # Grip
                       [2,      4,     12,      4],       # Reliability
                       [0,      0.00,   1.00,   0.00]])   # AveragePitStopTimeReduction

#                   Starter  Engager
# LVL                   1       5
Gear       = np.array([[7,      7],       # Power
                       [2,      4],       # Aero
                       [2,      4],       # Grip
                       [2,      5],       # Reliability
                       [0,     -0.12]])   # AveragePitStopTimeReduction

#                   Starter  Phazer Contrail
# LVL                   1       2       1
RearWing   = np.array([[7,      7,      9],       # Power
                       [2,      2,      5],       # Aero
                       [2,      4,      3],       # Grip
                       [2,      4,      3],       # Reliability
                       [0,      0.00,   0.00]])   # AveragePitStopTimeReduction

#                   Starter TheCarver Lock-On
# LVL                   1       1       3
FrontWing  = np.array([[7,      7,      7],       # Power
                       [2,      3,      4],       # Aero
                       [2,      3,      3],       # Grip
                       [2,     10,      4],       # Reliability
                       [0,     -0.07,  -0.12]])   # AveragePitStopTimeReduction

#                   Starter Compressor
# LVL                   1       3
Suspension = np.array([[7,      7],       # Power
                       [2,      8],       # Aero
                       [2,      4],       # Grip
                       [2,      6],       # Reliability
                       [0,      0.00]])   # AveragePitStopTimeReduction

#                  Starter TheStickler Gorolla
# LVL                   1       5       1
Engine     = np.array([[8,     15,     13],       # Power
                       [2,      4,      3],       # Aero
                       [2,      4,      5],       # Grip
                       [2,      4,      3],       # Reliability
                       [0,     -0.13,  -0.07]])   # AveragePitStopTimeReduction

print(Brakes)
print()
print(Gear)
print()
print(RearWing)
print()
print(FrontWing)
print()
print(Suspension)
print()
print(Engine)

def FUNOBJ(x, Brakes, Gear, RearWing, FrontWing, Suspension, Engine):
##    print(type(x))
##    print(x)
##    x = np.array(x)
##    print(type(x))
##    print(x)
    
##    print(int(x, 2))

    # Define max data in Brakes
    bestBrakes = [0 for x in range(Brakes.shape[0])]
    i = 0
    for row in Brakes:
        if i == Brakes.shape[0]-1:
            bestBrakes[i] = np.min(row)
        else:
            bestBrakes[i] = np.max(row)
        i = i + 1

    # Define max data in Gear
    bestGear = [0 for x in range(Gear.shape[0])]
    i = 0
    for row in Gear:
        if i == Gear.shape[0]-1:
            bestGear[i] = np.min(row)
        else:
            bestGear[i] = np.max(row)
        i = i + 1

    # Define max data in RearWing
    bestRearWing = [0 for x in range(RearWing.shape[0])]
    i = 0
    for row in RearWing:
        if i == RearWing.shape[0]-1:
            bestRearWing[i] = np.min(row)
        else:
            bestRearWing[i] = np.max(row)
        i = i + 1

    # Define max data in FrontWing
    bestFrontWing = [0 for x in range(FrontWing.shape[0])]
    i = 0
    for row in FrontWing:
        if i == FrontWing.shape[0]-1:
            bestFrontWing[i] = np.min(row)
        else:
            bestFrontWing[i] = np.max(row)
        i = i + 1

    # Define max data in Suspension
    bestSuspension = [0 for x in range(Suspension.shape[0])]
    i = 0
    for row in Suspension:
        if i == Suspension.shape[0]-1:
            bestSuspension[i] = np.min(row)
        else:
            bestSuspension[i] = np.max(row)
        i = i + 1

    # Define max data in Engine
    bestEngine = [0 for x in range(Engine.shape[0])]
    i = 0
    for row in Engine:
        if i == Engine.shape[0]-1:
            bestEngine[i] = np.min(row)
        else:
            bestEngine[i] = np.max(row)
        i = i + 1


    # Do DO DO do 
    # Define brakes in objective
    y_brakes = 0
    i = 0
    for row in Brakes:
        y_brakes = y_brakes + (Brakes[i][x[0]-1] - bestBrakes[i])**2
        i = i + 1

    # Define gear in objective
    y_gear = 0
    i = 0
    for row in Gear:
##        y_gear = y_gear + (Gear[i][x[1]-1] - bestGear[i])**2
        i = i + 1

    # Define rearwing in objective
    y_rearwing = 0
    i = 0
    for row in RearWing:
##        y_rearwing = y_rearwing + (RearWing[i][x[2]-1] - bestRearWing[i])**2
        i = i + 1

    # Define frontwing in objective
    y_frontwing = 0
    i = 0
    for row in FrontWing:
##        y_frontwing = y_frontwing + (FrontWing[i][x[3]-1] - bestFrontWing[i])**2
        i = i + 1

    # Define suspension in objective
    y_suspension = 0
    i = 0
    for row in Suspension:
##        y_suspension = y_suspension + (Suspension[i][x[4]-1] - bestSuspension[i])**2
        i = i + 1

    # Define engine in objective
    y_engine = 0
    i = 0
    for row in Engine:
##        y_engine = y_engine + (Engine[i][x[5]-1] - bestEngine[i])**2
        i = i + 1


    Y = y_brakes + y_gear + y_rearwing + y_frontwing + y_suspension + y_engine
    return Y

##print()
##FUNOBJ(1, Brakes, bestBrakes)
##print()
##print(FUNOBJ([1, 1, 1, 1, 1, 1], Brakes, Gear, RearWing, FrontWing, Suspension, Engine))




m = GEKKO()
m.options.SOLVER = 1

x1 = m.Var(value=1, lb=1, ub=Brakes.shape[0]    , integer=True)
x2 = m.Var(value=1, lb=1, ub=Gear.shape[0]      , integer=True)
x3 = m.Var(value=1, lb=1, ub=RearWing.shape[0]  , integer=True)
x4 = m.Var(value=1, lb=1, ub=FrontWing.shape[0] , integer=True)
x5 = m.Var(value=1, lb=1, ub=Suspension.shape[0], integer=True)
x6 = m.Var(value=1, lb=1, ub=Engine.shape[0]    , integer=True)

m.Obj(FUNOBJ([x1, x2, x3, x4, x5, x6], Brakes, Gear, RearWing, FrontWing, Suspension, Engine))
m.solve(disp=False)

print('Results')
print('x1: ' + str(x1.value))
print('x2: ' + str(x2.value))
print('x3: ' + str(x3.value))
print('x4: ' + str(x4.value))
print('x5: ' + str(x5.value))
print('x6: ' + str(x6.value))
print('Objective: ' + str(m.options.objfcnval))




##def eggholder(x):
##    return (-(x[1] + 47) * np.sin(np.sqrt(abs(x[0]/2 + (x[1] + 47))))
##            -x[0] * np.sin(np.sqrt(abs(x[0] - (x[1] + 47)))))
##
##bounds = [(-512, 512), (-512, 512)]
##
##x = np.arange(-512, 513)
##y = np.arange(-512, 513)
##xgrid, ygrid = np.meshgrid(x, y)
##xy = np.stack([xgrid, ygrid])
##fig = plt.figure()
##ax = fig.add_subplot(111, projection='3d')
##ax.view_init(45, -45)
##ax.plot_surface(xgrid, ygrid, eggholder(xy), cmap='terrain')
##ax.set_xlabel('x')
##ax.set_ylabel('y')
##ax.set_zlabel('eggholder(x, y)')
####plt.show()
##
##results = dict()
##results['shgo'] = optimize.shgo(eggholder, bounds)
##print(results['shgo'])
##
##results['DA'] = optimize.dual_annealing(eggholder, bounds)
##print(results['DA'])
##
##results['DE'] = optimize.differential_evolution(eggholder, bounds)
##print(results['DE'])
##
##results['BH'] = optimize.basinhopping(eggholder, bounds)
##print(results['BH'])
##
##results['shgo_sobol'] = optimize.shgo(eggholder, bounds, n=200, iters=5, sampling_method='sobol')
##print(results['shgo_sobol'])
##
##fig = plt.figure()
##ax = fig.add_subplot(111)
##im = ax.imshow(eggholder(xy), interpolation='bilinear', origin='lower', cmap='gray')
##ax.set_xlabel('x')
##ax.set_ylabel('y')
##
##def plotpoints(res, marker='o', color=None):
##    ax.plot(512+res.x[0], 512+res.x[1], marker=marker, color=color, ms=10)
##
##plotpoints(results['BH'], color='y')
##plotpoints(results['DE'], color='c')
##plotpoints(results['DA'], color='w')
##
##plotpoints(results['shgo'], color='r', marker='+')
##plotpoints(results['shgo_sobol'], color='r', marker='x')
##for i in range(results['shgo_sobol'].xl.shape[0]):
##    ax.plot(512 + results['shgo_sobol'].xl[i, 0],
##            512 + results['shgo_sobol'].xl[i, 1],
##            'ro', ms=2)
##
##ax.set_xlim([-4, 541*2])
##ax.set_ylim([-4, 541*2])
##plt.show()

