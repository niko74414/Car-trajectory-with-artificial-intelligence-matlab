% Simscape(TM) Multibody(TM) version: 5.2

% This is a model data file derived from a Simscape Multibody Import XML file using the smimport function.
% The data in this file sets the block parameter values in an imported Simscape Multibody model.
% For more information on this file, see the smimport function help page in the Simscape Multibody documentation.
% You can modify numerical values, but avoid any other changes to this file.
% Do not add code to this file. Do not edit the physical units shown in comments.

%%%VariableName:smiData


%============= RigidTransform =============%

%Initialize the RigidTransform structure array by filling in null values.
smiData.RigidTransform(25).translation = [0.0 0.0 0.0];
smiData.RigidTransform(25).angle = 0.0;
smiData.RigidTransform(25).axis = [0.0 0.0 0.0];
smiData.RigidTransform(25).ID = '';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(1).translation = [0 0 0];  % mm
smiData.RigidTransform(1).angle = 2.0943951023931953;  % rad
smiData.RigidTransform(1).axis = [-0.57735026918962584 -0.57735026918962584 0.57735026918962584];
smiData.RigidTransform(1).ID = 'B[motorcon lanta-1:-:robot-2]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(2).translation = [-57.368299999999984 -20.000000000000643 -1.3500311979441904e-12];  % mm
smiData.RigidTransform(2).angle = 2.0943951023931873;  % rad
smiData.RigidTransform(2).axis = [0.57735026918962307 0.57735026918962307 0.57735026918963128];
smiData.RigidTransform(2).ID = 'F[motorcon lanta-1:-:robot-2]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(3).translation = [0 0 0];  % mm
smiData.RigidTransform(3).angle = 2.0943951023931953;  % rad
smiData.RigidTransform(3).axis = [-0.57735026918962584 -0.57735026918962584 0.57735026918962584];
smiData.RigidTransform(3).ID = 'B[motorcon lanta-2:-:robot-2]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(4).translation = [57.368300000000012 -20.000000000000441 -4.6185277824406512e-14];  % mm
smiData.RigidTransform(4).angle = 2.0943951023931979;  % rad
smiData.RigidTransform(4).axis = [-0.57735026918962451 -0.57735026918962651 0.57735026918962629];
smiData.RigidTransform(4).ID = 'F[motorcon lanta-2:-:robot-2]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(5).translation = [0 0 19.999999999999989];  % mm
smiData.RigidTransform(5).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(5).axis = [1 0 0];
smiData.RigidTransform(5).ID = 'B[baserobot-1:-:robot-2]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(6).translation = [2.8907320907233917e-14 80.999999999999957 69.010926229330167];  % mm
smiData.RigidTransform(6).angle = 2.0943951023931953;  % rad
smiData.RigidTransform(6).axis = [0.57735026918962584 -0.57735026918962584 0.57735026918962584];
smiData.RigidTransform(6).ID = 'F[baserobot-1:-:robot-2]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(7).translation = [-41.596756992638838 0 45];  % mm
smiData.RigidTransform(7).angle = 2.0943951023931953;  % rad
smiData.RigidTransform(7).axis = [0.57735026918962584 0.57735026918962584 0.57735026918962584];
smiData.RigidTransform(7).ID = 'B[baserobot-1:-:eslabon1-1]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(8).translation = [0 3.5527136788005009e-15 55.000000000000021];  % mm
smiData.RigidTransform(8).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(8).axis = [-1 -1.4865108372114805e-32 1.0656245905598258e-16];
smiData.RigidTransform(8).ID = 'F[baserobot-1:-:eslabon1-1]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(9).translation = [100 0 -5.0000000000000009];  % mm
smiData.RigidTransform(9).angle = 0;  % rad
smiData.RigidTransform(9).axis = [0 0 0];
smiData.RigidTransform(9).ID = 'B[eslabon1-1:-:eslabon2-1]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(10).translation = [3.5527136788005009e-15 -8.8817841970012523e-16 20.000000000000021];  % mm
smiData.RigidTransform(10).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(10).axis = [1 5.4308191458437602e-34 8.840593798955577e-18];
smiData.RigidTransform(10).ID = 'F[eslabon1-1:-:eslabon2-1]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(11).translation = [0 0 10.000000000000002];  % mm
smiData.RigidTransform(11).angle = 0;  % rad
smiData.RigidTransform(11).axis = [0 0 0];
smiData.RigidTransform(11).ID = 'B[piso-1:-:]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(12).translation = [-3768.1485337598206 -324.12490070030373 -52];  % mm
smiData.RigidTransform(12).angle = 0;  % rad
smiData.RigidTransform(12).axis = [0 0 0];
smiData.RigidTransform(12).ID = 'F[piso-1:-:]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(13).translation = [0 0 10.000000000000002];  % mm
smiData.RigidTransform(13).angle = 0;  % rad
smiData.RigidTransform(13).axis = [0 0 0];
smiData.RigidTransform(13).ID = 'B[piso-1:-:cubo-1]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(14).translation = [-3272.4113197713932 -2422.9647014281818 4.2632564145606011e-14];  % mm
smiData.RigidTransform(14).angle = 0;  % rad
smiData.RigidTransform(14).axis = [0 0 0];
smiData.RigidTransform(14).ID = 'F[piso-1:-:cubo-1]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(15).translation = [0 0 10.000000000000002];  % mm
smiData.RigidTransform(15).angle = 0;  % rad
smiData.RigidTransform(15).axis = [0 0 0];
smiData.RigidTransform(15).ID = 'B[piso-1:-:cubo-2]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(16).translation = [-2236.6523098871285 -2422.7281905810109 7.1054273576010019e-15];  % mm
smiData.RigidTransform(16).angle = 0;  % rad
smiData.RigidTransform(16).axis = [0 0 0];
smiData.RigidTransform(16).ID = 'F[piso-1:-:cubo-2]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(17).translation = [0 0 10.000000000000002];  % mm
smiData.RigidTransform(17).angle = 0;  % rad
smiData.RigidTransform(17).axis = [0 0 0];
smiData.RigidTransform(17).ID = 'B[piso-1:-:cubo-3]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(18).translation = [-736.67110304478547 -2474.0647126088661 -7.1054273576010019e-15];  % mm
smiData.RigidTransform(18).angle = 0;  % rad
smiData.RigidTransform(18).axis = [0 0 0];
smiData.RigidTransform(18).ID = 'F[piso-1:-:cubo-3]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(19).translation = [0 0 10.000000000000002];  % mm
smiData.RigidTransform(19).angle = 0;  % rad
smiData.RigidTransform(19).axis = [0 0 0];
smiData.RigidTransform(19).ID = 'B[piso-1:-:cubo-4]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(20).translation = [-1530.1457555674224 -1218.1487976951889 -7.1054273576010019e-15];  % mm
smiData.RigidTransform(20).angle = 0;  % rad
smiData.RigidTransform(20).axis = [0 0 0];
smiData.RigidTransform(20).ID = 'F[piso-1:-:cubo-4]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(21).translation = [0 0 10.000000000000002];  % mm
smiData.RigidTransform(21).angle = 0;  % rad
smiData.RigidTransform(21).axis = [0 0 0];
smiData.RigidTransform(21).ID = 'B[piso-1:-:cubo-5]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(22).translation = [-1008.9234066554509 -632.83896599873424 0];  % mm
smiData.RigidTransform(22).angle = 0;  % rad
smiData.RigidTransform(22).axis = [0 0 0];
smiData.RigidTransform(22).ID = 'F[piso-1:-:cubo-5]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(23).translation = [0 0 10.000000000000002];  % mm
smiData.RigidTransform(23).angle = 0;  % rad
smiData.RigidTransform(23).axis = [0 0 0];
smiData.RigidTransform(23).ID = 'B[piso-1:-:cubo-6]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(24).translation = [-1687.5009964515739 -3055.4033902436358 9.9475983006414026e-14];  % mm
smiData.RigidTransform(24).angle = 0;  % rad
smiData.RigidTransform(24).axis = [0 0 0];
smiData.RigidTransform(24).ID = 'F[piso-1:-:cubo-6]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(25).translation = [0 0 0];  % mm
smiData.RigidTransform(25).angle = 3.1415926535897833;  % rad
smiData.RigidTransform(25).axis = [5.0439220235216271e-15 -0.70710678118654746 -0.70710678118654757];
smiData.RigidTransform(25).ID = 'RootGround[robot-2]';


%============= Solid =============%
%Center of Mass (CoM) %Moments of Inertia (MoI) %Product of Inertia (PoI)

%Initialize the Solid structure array by filling in null values.
smiData.Solid(7).mass = 0.0;
smiData.Solid(7).CoM = [0.0 0.0 0.0];
smiData.Solid(7).MoI = [0.0 0.0 0.0];
smiData.Solid(7).PoI = [0.0 0.0 0.0];
smiData.Solid(7).color = [0.0 0.0 0.0];
smiData.Solid(7).opacity = 0.0;
smiData.Solid(7).ID = '';

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(1).mass = 0.076690953938183121;  % kg
smiData.Solid(1).CoM = [64.105644132565814 0 0];  % mm
smiData.Solid(1).MoI = [32.168453111418209 81.051941789687163 81.051941789687191];  % kg*mm^2
smiData.Solid(1).PoI = [0 0 0];  % kg*mm^2
smiData.Solid(1).color = [0.792156862745098 0.81960784313725488 0.93333333333333335];
smiData.Solid(1).opacity = 1;
smiData.Solid(1).ID = 'motorcon lanta*:*Predeterminado';

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(2).mass = 1.0000000000000002;  % kg
smiData.Solid(2).CoM = [50 50 50];  % mm
smiData.Solid(2).MoI = [1666.6666666666667 1666.6666666666667 1666.6666666666665];  % kg*mm^2
smiData.Solid(2).PoI = [0 0 0];  % kg*mm^2
smiData.Solid(2).color = [0.090196078431372548 0.12156862745098039 1];
smiData.Solid(2).opacity = 1;
smiData.Solid(2).ID = 'cubo*:*Predeterminado';

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(3).mass = 0.09678448195480259;  % kg
smiData.Solid(3).CoM = [0 0 23.938281864078768];  % mm
smiData.Solid(3).MoI = [61.142117015956323 50.588941148004778 37.89423077611049];  % kg*mm^2
smiData.Solid(3).PoI = [0 0 0];  % kg*mm^2
smiData.Solid(3).color = [0.43529411764705883 0.53333333333333333 1];
smiData.Solid(3).opacity = 1;
smiData.Solid(3).ID = 'baserobot*:*Predeterminado';

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(4).mass = 1280.0000212800001;  % kg
smiData.Solid(4).CoM = [2000 2000 5];  % mm
smiData.Solid(4).MoI = [1706677361.7068439 1706677361.7068439 3413333390.0799994];  % kg*mm^2
smiData.Solid(4).PoI = [0 0 0];  % kg*mm^2
smiData.Solid(4).color = [0.99215686274509807 1 0.40392156862745099];
smiData.Solid(4).opacity = 1;
smiData.Solid(4).ID = 'piso*:*Predeterminado';

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(5).mass = 0.016525165587411926;  % kg
smiData.Solid(5).CoM = [35.741779846447173 0 3.9258220153552839];  % mm
smiData.Solid(5).MoI = [0.98336720347011142 18.754475528758203 19.343479073446876];  % kg*mm^2
smiData.Solid(5).PoI = [0 0.84214584743866649 0];  % kg*mm^2
smiData.Solid(5).color = [0.87450980392156863 0 0.20784313725490194];
smiData.Solid(5).opacity = 1;
smiData.Solid(5).ID = 'eslabon1*:*Predeterminado';

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(6).mass = 1.0350764510374133;  % kg
smiData.Solid(6).CoM = [-0.002484863099101395 30.426289977486462 1.0158949043515408];  % mm
smiData.Solid(6).MoI = [6569.0958436587007 10825.605246380987 6420.9970553678349];  % kg*mm^2
smiData.Solid(6).PoI = [-43.372568351065567 -0.0025367310711216376 -0.099242793199215668];  % kg*mm^2
smiData.Solid(6).color = [0.792156862745098 0.81960784313725488 0.93333333333333335];
smiData.Solid(6).opacity = 1;
smiData.Solid(6).ID = 'robot*:*Predeterminado';

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(7).mass = 0.053699943548181313;  % kg
smiData.Solid(7).CoM = [71.087124163336654 0 5.5850271799207816];  % mm
smiData.Solid(7).MoI = [9.1229045112505371 108.18947855321416 104.4262326933345];  % kg*mm^2
smiData.Solid(7).PoI = [0 2.2332678703636462 0];  % kg*mm^2
smiData.Solid(7).color = [0.30980392156862746 1 0.66666666666666663];
smiData.Solid(7).opacity = 1;
smiData.Solid(7).ID = 'eslabon2*:*Predeterminado';


%============= Joint =============%
%X Revolute Primitive (Rx) %Y Revolute Primitive (Ry) %Z Revolute Primitive (Rz)
%X Prismatic Primitive (Px) %Y Prismatic Primitive (Py) %Z Prismatic Primitive (Pz) %Spherical Primitive (S)
%Constant Velocity Primitive (CV) %Lead Screw Primitive (LS)
%Position Target (Pos)

%Initialize the PlanarJoint structure array by filling in null values.
smiData.PlanarJoint(7).Rz.Pos = 0.0;
smiData.PlanarJoint(7).Px.Pos = 0.0;
smiData.PlanarJoint(7).Py.Pos = 0.0;
smiData.PlanarJoint(7).ID = '';

smiData.PlanarJoint(1).Rz.Pos = 0;  % deg
smiData.PlanarJoint(1).Px.Pos = 0;  % mm
smiData.PlanarJoint(1).Py.Pos = 0;  % mm
smiData.PlanarJoint(1).ID = '[piso-1:-:]';

smiData.PlanarJoint(2).Rz.Pos = 0;  % deg
smiData.PlanarJoint(2).Px.Pos = 0;  % mm
smiData.PlanarJoint(2).Py.Pos = 0;  % mm
smiData.PlanarJoint(2).ID = '[piso-1:-:cubo-1]';

smiData.PlanarJoint(3).Rz.Pos = 0;  % deg
smiData.PlanarJoint(3).Px.Pos = 0;  % mm
smiData.PlanarJoint(3).Py.Pos = 0;  % mm
smiData.PlanarJoint(3).ID = '[piso-1:-:cubo-2]';

smiData.PlanarJoint(4).Rz.Pos = 0;  % deg
smiData.PlanarJoint(4).Px.Pos = 0;  % mm
smiData.PlanarJoint(4).Py.Pos = 0;  % mm
smiData.PlanarJoint(4).ID = '[piso-1:-:cubo-3]';

smiData.PlanarJoint(5).Rz.Pos = 0;  % deg
smiData.PlanarJoint(5).Px.Pos = 0;  % mm
smiData.PlanarJoint(5).Py.Pos = 0;  % mm
smiData.PlanarJoint(5).ID = '[piso-1:-:cubo-4]';

smiData.PlanarJoint(6).Rz.Pos = 0;  % deg
smiData.PlanarJoint(6).Px.Pos = 0;  % mm
smiData.PlanarJoint(6).Py.Pos = 0;  % mm
smiData.PlanarJoint(6).ID = '[piso-1:-:cubo-5]';

smiData.PlanarJoint(7).Rz.Pos = 0;  % deg
smiData.PlanarJoint(7).Px.Pos = 0;  % mm
smiData.PlanarJoint(7).Py.Pos = 0;  % mm
smiData.PlanarJoint(7).ID = '[piso-1:-:cubo-6]';


%Initialize the RevoluteJoint structure array by filling in null values.
smiData.RevoluteJoint(5).Rz.Pos = 0.0;
smiData.RevoluteJoint(5).ID = '';

smiData.RevoluteJoint(1).Rz.Pos = 90.000000000000298;  % deg
smiData.RevoluteJoint(1).ID = '[motorcon lanta-1:-:robot-2]';

smiData.RevoluteJoint(2).Rz.Pos = -22.448280846828876;  % deg
smiData.RevoluteJoint(2).ID = '[motorcon lanta-2:-:robot-2]';

smiData.RevoluteJoint(3).Rz.Pos = -83.840602758755224;  % deg
smiData.RevoluteJoint(3).ID = '[baserobot-1:-:robot-2]';

smiData.RevoluteJoint(4).Rz.Pos = 37.883014986175141;  % deg
smiData.RevoluteJoint(4).ID = '[baserobot-1:-:eslabon1-1]';

smiData.RevoluteJoint(5).Rz.Pos = 69.508769177323259;  % deg
smiData.RevoluteJoint(5).ID = '[eslabon1-1:-:eslabon2-1]';

