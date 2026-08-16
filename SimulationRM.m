% Simulazione del potenziale d'azione cardiaco (Modello Rogers-McCulloch)
% Protocollo di stimolazione S1-S2 per l'analisi del periodo refrattario
% =========================================================================


%% 1. Definizione dei Parametri del Modello
% Parametri tipici per la dinamica del potenziale e del recupero
c1 = 0.26;
c2 = 0.1;
a  = 0.13;  % Soglia di eccitabilità
b  = 0.013;
d  = 0.8;

%% 2. Protocollo di Stimolazione S1-S2
% Creiamo una funzione che genera due impulsi di corrente (S1 e S2)
I_amp = 0.2;   % Ampiezza dello stimolo
dur   = 5;     % Durata dello stimolo (ms)
t_S1  = 10;    % Istante del primo stimolo (ms)

% Istante del secondo stimolo. 
% PROVA A CAMBIARLO: a 250ms vedrai due picchi, a 150ms la cellula sarà in refrattarietà!
t_S2  = 250;   

% Funzione anonima per la corrente di stimolo totale I_stim(t)
I_stim = @(t) I_amp * ((t >= t_S1 & t <= t_S1+dur) + (t >= t_S2 & t <= t_S2+dur));

%% 3. Definizione del Sistema di Equazioni Differenziali (ODE)
% Il sistema descrive come variano nel tempo il potenziale (v) e il recupero (w)
% y(1) = v (potenziale di membrana adimensionale)
% y(2) = w (variabile di recupero)

ode_sys = @(t, y) [
    c1 * y(1) * (y(1) - a) * (1 - y(1)) - c2 * y(1) * y(2) + I_stim(t); % dv/dt
    b * (y(1) - d * y(2))                                               % dw/dt
];

%% 4. Risoluzione Numerica
t_span = [0 500];       % Finestra temporale di simulazione (ms)
y0 = [0; 0];            % Condizioni iniziali (la cellula parte a riposo)

% Opzioni per aumentare la precisione del solutore
options = odeset('RelTol', 1e-4, 'AbsTol', 1e-6);

% Usiamo ode45 (metodo Runge-Kutta) per calcolare la soluzione
[t, Y] = ode45(ode_sys, t_span, y0, options);

% Estraiamo i vettori per comodità
v = Y(:,1);
w = Y(:,2);

%% 5. Visualizzazione dei Risultati (Grafici professionali)
figure('Color','w','Position',[100 100 800 600]);

% Subplot 1: Potenziale di membrana (v) e stimoli applicati
subplot(2,1,1);
plot(t, v, 'b', 'LineWidth', 2);
hold on;
plot(t, I_stim(t), 'r--', 'LineWidth', 1.5); % Plottiamo la corrente di stimolo
title('Potenziale d''Azione Cardiaco - Protocollo S1-S2', 'FontSize', 14);
ylabel('Potenziale (v)', 'FontSize', 12);
legend('Potenziale', 'Stimolo applicato', 'Location', 'northeast');
grid on;

% Subplot 2: Variabile di recupero (w)
subplot(2,1,2);
plot(t, w, 'g', 'LineWidth', 2);
xlabel('Tempo (ms)', 'FontSize', 12);
ylabel('Variabile di Recupero (w)', 'FontSize', 12);
grid on;
