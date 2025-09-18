clc;
clear;
close all;
%-----------------------------Negar Naghavian-----------------------------%

%---------------------------Initial Conditions----------------------------%

LengthAB = 3;
LengthBC = 1.45;
LengthBD = 1.05;
LengthCD = 1;
LengthDE = 1.5;
LengthEF = 1.45;
LengthFC = 1.95;
ThetaCF = 0;
RDotAC = -10;

%-----------------------------Manual Analysis-----------------------------%

n = 0;
for t = 0 : 3 : 360
 
    syms w3 w4 w5 w6
    syms alpha3 alpha4 alpha5 alpha6
    n = n + 1;
    ThetaEF(n,1) = t;

    A1(n,1) = -2 * LengthDE * ((LengthFC * cosd(ThetaCF)) + (LengthEF * cosd(t)));
    B1(n,1) = -2 * LengthDE * ((LengthFC * sind(ThetaCF)) + (LengthEF * sind(t)));
    C1(n,1) = (LengthCD^2) + (LengthBD^2) + (LengthBC^2) - (LengthCD^2) + 2 * LengthFC * LengthEF * (cosd(ThetaCF) * cosd(t) + sind(ThetaCF) * sind(t));
    t1(n,1) = (-B1(n,1) - sqrt((A1(n,1)^2) + (B1(n,1)^2) - (C1(n,1)^2))) / (C1(n,1) - A1(n,1));
    ThetaDE(n,1) = 2 * atand(t1(n,1));
    ThetaCD(n,1) = asind((-LengthDE * sind(ThetaDE(n,1)) + LengthEF * sind(t)) / LengthCD);

    A2(n,1) = 2 * LengthBD * (LengthCD * cosd(ThetaCD(n,1)));
    B2(n,1) = 2 * LengthBD * (LengthCD * sind(ThetaCD(n,1)));
    C2(n,1) = (LengthCD^2) + (LengthBD^2) - (LengthBC^2);
    t2(n,1) = (-B2(n,1) - sqrt((A2(n,1)^2) + (B2(n,1)^2) - (C2(n,1)^2))) / (C2(n,1) - A2(n,1));
    ThetaBD(n,1) = 2 * atand(t2(n,1));
    ThetaBC(n,1) = acosd(LengthCD * (cosd(ThetaCD(n,1)) + LengthBD * cosd(ThetaBD(n,1))) / LengthBC);

    ThetaAB(n,1) = asind((LengthBC * sind(ThetaBC(n,1))) / LengthAB);

    Equation1 = RDotAC - LengthBC * w4 * sind(ThetaBC(n,1)) == -LengthAB * w3 * sind(ThetaAB(n,1));

    Equation2 = LengthBC * w4 * cosd(ThetaBC(n,1)) == LengthAB * w3 * cosd(ThetaAB(n,1));
    
    [w3,w4] = solve([Equation1,Equation2],[w3,w4]);
    w3 = round(w3,3);
    w4 = round(w4,4);

    Equation3 = -LengthCD * w4 * sind(ThetaCD(n,1)) - LengthDE * w5 * sind(ThetaDE(n,1)) == -LengthEF * w6 * sind(t);

    Equation4 = LengthCD * w4 * cosd(ThetaCD(n,1)) + LengthDE * w5 * cosd(ThetaDE(n,1)) == LengthEF * w6 * cosd(t);

    [w5,w6] = solve([Equation3,Equation4],[w5,w6]);
    w5 = round(w5,3);
    w6 = round(w6,4);
    W3(n,1) = w3;
    W4(n,1) = w4;
    W5(n,1) = w5;
    W6(n,1) = w6;

    Equation5 = -LengthBC * alpha4 * sind(ThetaBC(n,1)) - LengthBC * (w4^2) * cosd(ThetaBC(n,1)) == -LengthAB * alpha3 * sind(ThetaAB(n,1)) - LengthAB * (w3^2) * cosd(ThetaAB(n,1));

    Equation6 = LengthBC * alpha4 * cosd(ThetaBC(n,1)) - LengthBC * (w4^2) * sind(ThetaBC(n,1)) == LengthAB * alpha3 * cosd(ThetaAB(n,1)) - LengthAB * (w3^2) * sind(ThetaAB(n,1));

    [alpha3,alpha4] = solve([Equation5,Equation6],[alpha3,alpha4]);
    alpha3 = round(alpha3,3);
    alpha4 = round(alpha4,3);

    Equation7 = -LengthCD * alpha4 * sind(ThetaCD(n,1)) - LengthCD * (w4^2) * cosd(ThetaCD(n,1)) - LengthDE * alpha5 * sind(ThetaDE(n,1)) - LengthDE * (w5^2) * cosd(ThetaDE(n,1)) == -LengthEF * alpha6 * sind(t) - LengthEF * (w6^2) * cosd(t);
    
    Equation8 = LengthCD * alpha4 * cosd(ThetaCD(n,1)) - LengthCD * (w4^2) * sind(ThetaCD(n,1)) + LengthDE * alpha5 * cosd(ThetaDE(n,1)) - LengthDE * (w5^2) * sind(ThetaDE(n,1)) == LengthEF * alpha6 * cosd(t) - LengthEF * (w6^2) * sind(t);

    [alpha5,alpha6] = solve([Equation7,Equation8],[alpha5,alpha6]);
    alpha5 = round(alpha5,3);
    alpha6 = round(alpha6,3);
    Alpha3(n,1) = alpha3;
    Alpha4(n,1) = alpha4;
    Alpha5(n,1) = alpha5;
    Alpha6(n,1) = alpha6;

end

RxAB = LengthAB * cosd(ThetaAB);
RyAB = LengthAB * sind(ThetaAB);
RxBC = LengthBC * cosd(ThetaBC);
RyBC = LengthBC * sind(ThetaBC);
RxBD = LengthBD * cosd(ThetaBD);
RyBD = LengthBD * sind(ThetaBD);
RxCD = LengthCD * cosd(ThetaCD);
RyCD = LengthCD * sind(ThetaCD);
RxDE = LengthDE * cosd(ThetaDE);
RyDE = LengthDE * sind(ThetaDE);
RxEF = LengthEF * cosd(ThetaEF);
RyEF = LengthEF * sind(ThetaEF);

%-----------------------------------Plots---------------------------------%

figure(1)
plot(RxAB,RyAB,'','LineWidth',1.5);
title('RxAB & RyAB','FontSize',16);
xlabel('RxAB (m)');
ylabel('RyAB (m)');
hold on;

figure(2)
plot(ThetaAB,Alpha3,'','LineWidth',1.5);
title('\theta_{AB} & \alpha_3','FontSize',16);
xlabel('\theta_{AB} (degree)');
ylabel('\alpha_3 (rad/s)');
hold on;

figure(3)
plot(ThetaAB,W3,'','LineWidth',1.5);
title('\theta_{AB} & \omega_3','FontSize',16);
xlabel('\theta_{AB} (degree)');
ylabel('\omega_3 (rad/s)');
hold on;

figure(4)
plot(RxBC,RyBC,'','LineWidth',1.5);
title('RxBC & RyBC','FontSize',16);
xlabel('RxBC (m)');
ylabel('RyBC (m)');
hold on;

figure(5)
plot(ThetaBC,Alpha4,'','LineWidth',1.5);
title('\theta_{BC} & \alpha_4','FontSize',16);
xlabel('\theta_{BC} (degree)');
ylabel('\alpha_4 (rad/s)');
hold on;

figure(6)
plot(ThetaBC,W4,'','LineWidth',1.5);
title('\theta_{BC} & \omega_4','FontSize',16);
xlabel('\theta_{BC} (degree)');
ylabel('\omega_4 (rad/s)');
hold on;

figure(7)
plot(RxBD,RyBD,'','LineWidth',1.5);
title('RxBD & RyBD','FontSize',16);
xlabel('RxBD (m)');
ylabel('RyBD (m)');
hold on;

figure(8)
plot(ThetaBD,Alpha4,'','LineWidth',1.5);
title('\theta_{BD} & \alpha_4','FontSize',16);
xlabel('\theta_{BD} (degree)');
ylabel('\alpha_4 (rad/s)');
hold on;

figure(9)
plot(ThetaBD,W4,'','LineWidth',1.5);
title('\theta_{BD} & \omega_4','FontSize',16);
xlabel('\theta_{BD} (degree)');
ylabel('\omega_4 (rad/s)');
hold on;

figure(10)
plot(RxCD,RyCD,'','LineWidth',1.5);
title('RxCD & RyCD','FontSize',16);
xlabel('RxCD (m)');
ylabel('RyCD (m)');
hold on;

figure(11)
plot(ThetaCD,Alpha4,'','LineWidth',1.5);
title('\theta_{CD} & \alpha_4','FontSize',16);
xlabel('\theta_{CD} (degree)');
ylabel('\alpha_4 (rad/s)');
hold on;

figure(12)
plot(ThetaCD,W4,'','LineWidth',1.5);
title('\theta_{CD} & \omega_4','FontSize',16);
xlabel('\theta_{CD} (degree)');
ylabel('\omega_4 (rad/s)');
hold on;

figure(13)
plot(RxDE,RyDE,'','LineWidth',1.5);
title('RxDE & RyDE','FontSize',16);
xlabel('RxDE (m)');
ylabel('RyDE (m)');
hold on;

figure(14)
plot(ThetaDE,Alpha5,'','LineWidth',1.5);
title('\theta_{DE} & \alpha_5','FontSize',16);
xlabel('\theta_{DE} (degree)');
ylabel('\alpha_5 (rad/s)');
hold on;

figure(15)
plot(ThetaDE,W5,'','LineWidth',1.5);
title('\theta_{DE} & \omega_5','FontSize',16);
xlabel('\theta_{DE} (degree)');
ylabel('\omega_5 (rad/s)');
hold on;

figure(16)
plot(RxEF,RyEF,'','LineWidth',1.5);
title('RxEF & RyEF','FontSize',16);
xlabel('RxEF (m)');
ylabel('RyEF (m)');
hold on;

figure(17)
plot(ThetaEF,Alpha6,'','LineWidth',1.5);
title('\theta_{EF} & \alpha_6','FontSize',16);
xlabel('\theta_{EF} (degree)');
ylabel('\alpha_6 (rad/s)');
hold on;

figure(18)
plot(ThetaEF,W6,'','LineWidth',1.5);
title('\theta_{EF} & \omega_6','FontSize',16);
xlabel('\theta_{EF} (degree)');
ylabel('\omega_6 (rad/s)');
hold on;