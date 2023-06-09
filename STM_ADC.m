function STM_ADC
delete(instrfind({'Port'},{'COM7'}));%En windows reemplace
pserial=serial('COM7');
pserial.BaudRate=9600;
fopen(pserial);

contador = 1;

temperatura = [];
luz = [];
distancia = [];

while true
datain=fread(pserial, 70);
aux1=char(datain);
aux2=char(aux1);

% LM35
contador1 =1;
contador2 =2;
contador3 =3;
for i= 1:9
    contador1 = contador1 + 3;
    contador2 = contador2 + 3;
    contador3 = contador3 + 3;
    temperatura(i) =((aux2(contador1)*100) + (aux2(contador2)*10) + aux2(contador3)) - 5328;
end

% temperatura(1) = ((aux2(1)*100) + (aux2(2)*10) + aux2(3)) - 5328;
% temperatura(2) = ((aux2(4)*100) + (aux2(5)*10) + aux2(6)) - 5328;
% temperatura(3) = ((aux2(7)*100) + (aux2(8)*10) + aux2(9)) - 5328;
% temperatura(4) = ((aux2(10)*100) + (aux2(11)*10) + aux2(12)) - 5328;
% temperatura(5) = ((aux2(13)*100) + (aux2(14)*10) + aux2(15)) - 5328;
% temperatura(6) = ((aux2(16)*100) + (aux2(17)*10) + aux2(18)) - 5328;
% temperatura(7) = ((aux2(19)*100) + (aux2(20)*10) + aux2(21)) - 5328;
% temperatura(8) = ((aux2(22)*100) + (aux2(23)*10) + aux2(24)) - 5328;
% temperatura(9) = ((aux2(25)*100) + (aux2(26)*10) + aux2(27)) - 5328;
% temperatura(10) = ((aux2(28)*100) + (aux2(29)*10) + aux2(30)) - 5328;

% Fotoresistencia
contador4 =31;
contador5 =32;
for i= 1:9
    contador4 = contador4 + 2;
    contador5 = contador5 + 2;
    luz(i) = ((aux2(contador4)*10) + aux2(contador5)) - 528;
end

% luz(1) = ((aux2(31)*10) + aux2(32)) - 528;
% luz(2) = ((aux2(33)*10) + aux2(34)) - 528;
% luz(3) = ((aux2(35)*10) + aux2(36)) - 528;
% luz(4) = ((aux2(37)*10) + aux2(38)) - 528;
% luz(5) = ((aux2(39)*10) + aux2(40)) - 528;
% luz(6) = ((aux2(41)*10) + aux2(42)) - 528;
% luz(7) = ((aux2(43)*10) + aux2(44)) - 528;
% luz(8) = ((aux2(45)*10) + aux2(46)) - 528;
% luz(9) = ((aux2(47)*10) + aux2(48)) - 528;
% luz(10) = ((aux2(49)*10) + aux2(50)) - 528;

% SHARP
contador6 =51;
contador7 =52;
for i= 1:9
    contador6 = contador6 + 2;
    contador7 = contador7 + 2;
    distancia(i) = ((aux2(contador6)*10) + aux2(contador7)) - 528;
end

contador8 =71;
contador9 =72;
contador10 =73;
contador11 =74;

for i= 1:9
    contador8 = contador8 + 2;
    contador9 = contador9 + 2;
    contador10 = contador10 + 2;
    contador11 = contador11 + 2;
    voltaje(i) = ((aux2(contador8)*1000) + (aux2(contador9)*100) + (aux2(contador10)*10) + aux2(contador11)) - 53328;
end  
if contador11==110
    contador1 = 1;
    contador2 = 2;
    contador3 = 3;
    contador4 = 31;
    contador5 = 32;
    contador6 = 51;
    contador7 = 52;
    contador8 = 71;
    contador9 = 72;
    contador10 = 73;
    contador11 = 74;
end
% distancia(1) = ((aux2(51)*10) + aux2(52)) - 528;
% distancia(2) = ((aux2(53)*10) + aux2(54)) - 528;
% distancia(3) = ((aux2(55)*10) + aux2(56)) - 528;
% distancia(4) = ((aux2(57)*10) + aux2(58)) - 528;
% distancia(5) = ((aux2(59)*10) + aux2(60)) - 528;
% distancia(6) = ((aux2(61)*10) + aux2(62)) - 528;
% distancia(7) = ((aux2(63)*10) + aux2(64)) - 528;
% distancia(8) = ((aux2(65)*10) + aux2(66)) - 528;
% distancia(9) = ((aux2(67)*10) + aux2(68)) - 528;
% distancia(10) = ((aux2(69)*10) + aux2(70)) - 528;

ylim([0 160]);
xlim([0 contador + 40]);
tempe(contador) = temperatura(1);
foto(contador) = luz(1);
dist(contador) = distancia(1);

for i=1:20
end
% GRAFICA 1 TEMPERATURA (MUESTRAS / S)
subplot(3,1,1);
plot(tempe, 'r', 'linewidth', 2);
title('LM35')
xlabel('Tiempo');
ylabel('Temperatura')
grid on
color = [0.55 0.67 0.82];
set(gcf, 'Color', color, 'MenuBar', 'None');

% GRAFICA 2 LUZ (MUESTRAS / S)
subplot(3,1,2);
plot(voltaje, tempe);
% plot(foto, 'y', 'linewidth', 2);
% title('FOTOCELDA')
% xlabel('Tiempo');
% ylabel('Luz')
% grid on
% 
% % GRAFICA 3 DISTANCIA (MUESTRAS / S)
% subplot(3,1,3);
% plot(dist, 'b', 'linewidth', 2);
% title('SHARP')
% xlabel('Tiempo');
% ylabel('Distancia')
% grid on

drawnow
contador = contador + 1;
end
end
