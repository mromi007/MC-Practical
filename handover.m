hte = 150;
hre = 10;
sdA = 3;
sdB = 5;

noiseA = sdA * randn(1, 50);
noiseB = sdB * randn(1, 50);

fc = input('Enter the input frequency=');

for d = 1:50
    LA(d) = (69.55 + 26.6 * log10(fc)) - (13.82 * log10(hte)) - ((1.11 * log10(fc) - 0.7) * (10) + (1.56 * log10(fc) - 0.8)) + ((44.9 - 6.55 * log10(hte)) * log10(d));
    LB(d) = (69.55 + 26.6 * log10(fc)) - (13.82 * log10(hte)) - ((1.11 * log10(fc) - 0.7) * (10) + (1.56 * log10(fc) - 0.8)) + ((44.9 - 6.55 * log10(hte)) * log10(51 - d));
    LF(d) = 32.4 + 20 * log10(fc) + 20 * log10(d);
    SrA(d) = 60 - LA(d);
    SrB(d) = 60 - LB(d);
    PrA(d) = 60 - LA(d) + noiseA(d);
    PrB(d) = 60 - LB(d) + noiseB(d);
end

figure(1)
subplot(2, 1, 1);
plot(PrA);
hold on
plot(PrB, 'm');
axis([0 50 -110 -50]);
xlabel('distance');
ylabel('signal strength');
grid

subplot(2, 1, 2);
plot(SrA);
hold on
plot(SrB, 'm');
axis([0 50 -110 -50]);
xlabel('distance');
ylabel('signal strength');
grid

figure(2)
plot(LA);
hold on
plot(LF);
xlabel('distance');
ylabel('signal strength');