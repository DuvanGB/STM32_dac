% delete(instrfind({'Port'},{'COM7'}));% limpiar puerto
% puerto = serial('COM7'); % asignar puerto com7 usb ttl
% puerto.BaudRate = 9600;
% fopen(puerto);
% 
% temperatura = zeros(1,10);
% luz = zeros(1,10);
% distancia = zeros(1,10);
% 
% while true
%     UART = fread(puerto, 40); % leer puerto ,tamaño 40
%     aux1 = char(UART); % trasponer el vector
%     aux2 = char(aux1);
% end
%     for i= 1:40
%         temperatura(convalor) = aux2(i); 
%         if aux2(i) == '/'
%             convalor = convalor + 1;
%         end
%         if convalor == 10
%             convalor = 1;
%         end
%     end
% end

% datos = '051/052/051/053/052/054/057/056/054/051/';
% valores=zeros(1,10);
% contador1 = 1;
% for i = 1:40
%    valores(contador1)=datos(i);
%    if datos(i) == '/' 
%    contador1 = contador1 + 1;
%    end
%    if contador1 == 10
%    contador1 = 1;
%    end
% end

% delete(instrfind({'Port'},{'COM7'}));%En windows reemplace
% pserial=serial('COM7');
% pserial.BaudRate=9600;
% fopen(pserial);
% 
% temperatura = [];
% luz = [];
% distancia = [];
% 
% while true
% datain=fread(pserial, 30);
% aux1=char(datain);
% aux2=char(aux1);
% disp(aux2)
% 
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
% 
% luz(1) = (aux2(32)*10) + aux2(33);
% luz(2) = (aux2(35)*10) + aux2(36);
% luz(3) = (aux2(38)*10) + aux2(39);
% luz(4) = (aux2(41)*10) + aux2(42);
% luz(5) = (aux2(44)*10) + aux2(45);
% luz(6) = (aux2(47)*10) + aux2(48);
% luz(7) = (aux2(50)*10) + aux2(51);
% luz(8) = (aux2(53)*10) + aux2(54);
% luz(9) = (aux2(56)*10) + aux2(57);
% luz(10) = (aux2(59)*10) + aux2(60);
% 
% distancia(1) = (aux2(61)*100) + (aux2(62)*10) + aux2(63);
% distancia(2) = (aux2(64)*100) + (aux2(65)*10) + aux2(66);
% distancia(3) = (aux2(67)*100) + (aux2(68)*10) + aux2(69);
% distancia(4) = (aux2(70)*100) + (aux2(71)*10) + aux2(72);
% distancia(5) = (aux2(73)*100) + (aux2(74)*10) + aux2(75);
% distancia(6) = (aux2(76)*100) + (aux2(77)*10) + aux2(78);
% distancia(7) = (aux2(79)*100) + (aux2(80)*10) + aux2(81);
% distancia(8) = (aux2(82)*100) + (aux2(83)*10) + aux2(84);
% distancia(9) = (aux2(25)*100) + (aux2(26)*10) + aux2(27);
% distancia(10) = (aux2(28)*100) + (aux2(29)*10) + aux2(30);
% 
% end

% A = ['1';'2';'3';'4';'5';'6';'7';'8';'9'];
% B = ['9';'8';'7';'6';'5';'4';'3';'2';'1'];
% aux = [];
% aux(1) = (A(1)*10) + A(2);
% aux(2) = (A(4)*100) + (A(5)*10) + A(6);
% disp(aux(1)-528)
% 
% % tempe(conTemp) = temperatura(1);
% % plot(tempe);
% % drawnow
% % disp(aux2)
% for i = 1:9
%     
% ylim([0 10]);
% xlim([0 10]);
%     grid on 
%     hold on
%     plot(A(i),B(i))
%     drawnow
% end


% function STM_ADC
% delete(instrfind({'Port'},{'COM7'}));%En windows reemplace
% pserial=serial('COM7');
% pserial.BaudRate=9600;
% fopen(pserial);
% 
% contador = 1;
% 
% temperatura = [];
% luz = [];
% distancia = [];
% 
% while true
% datain=fread(pserial, 70);
% aux1=char(datain);
% aux2=char(aux1);
% 
% % LM35
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
% 
% % Fotoresistencia
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
% 
% % SHARP
% distancia(1) = (aux2(51)*10) + aux2(52);
% distancia(2) = (aux2(53)*10) + aux2(54);
% distancia(3) = (aux2(55)*10) + aux2(56);
% distancia(4) = (aux2(57)*10) + aux2(58);
% distancia(5) = (aux2(59)*10) + aux2(60);
% distancia(6) = (aux2(61)*10) + aux2(62);
% distancia(7) = (aux2(63)*10) + aux2(64);
% distancia(8) = (aux2(65)*10) + aux2(66);
% distancia(9) = (aux2(67)*10) + aux2(68);
% distancia(10) = (aux2(69)*10) + aux2(70);
% 
% for i=1:10
%    disp('------------')
%    disp(temperatura(i)) 
%    disp('------------')
%    disp(luz(i)) 
%    disp('------------')
%    disp(distancia(i)) 
%    disp('------------')
% end
% 
% ylim([0 160]);
% xlim([0 contador + 40]);
% tempe(contador) = temperatura(1);
% foto(contador) = luz(1);
% dist(contador) = distancia(1);
% 
% 
% % GRAFICA 1 TEMPERATURA (MUESTRAS / S)
% plot(tempe);
% 
% % GRAFICA 2 LUZ (MUESTRAS / S)
% plot(foto);
% 
% % GRAFICA 3 DISTANCIA (MUESTRAS / S)
% plot(dist);
% drawnow
% contador = contador + 1;
% end
% end

