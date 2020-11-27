rp=4;
rs=30;
fp=400;
fs=800;
Fs=2000;
wp=2*(fp/Fs);
ws=2*(fs/Fs);
%LPF
[N,wn]=buttord(wp,ws,rp,rs);
[b,a]=butter(N,wn,'low');
[hl,ol]=freqZ(b,a,512,Fs);
ml=20*log10(abs(hl));
%plot(1);
figure(1);
plot(ol/pi,ml);
xlabel('normalised frequency is ---->');
ylabel('gain in db --->');
title('butterworth lowpass filter');
%HPF
[N2,wn2]=buttord(wp,ws,rp,rs);
[b2,a2]=butter(N2,wn2,'High');
[h2,o2]=freqz(b2,a2,512,Fs);
m2=20*log10(abs(h2));
figure(2);
plot(o2/pi,h2);
xlabel('normalised frequency is ---->');
ylabel('gain in db --->');
title('butterworth highpass filter');
%PLOT BPF
w=[wp,ws];
[N3,wn3]=buttord(wp,ws,rp,rs);
[b3,a3]=butter(N3,w,'bandpass');
[h3,o3]=freqz(b3,a3,512,Fs);
m3=20*log10(abs(h3));
figure(3);
plot(o3/pi,m3);
xlabel('normalised frequency is ---->');
ylabel('gain in db --->');
title('butterworth bandpass filter');
%PLOT BSF
w=[wp,ws];
[N4,wn4]=buttord(wp,ws,rp,rs);
[b4,a4]=butter(N4,w,'stop');
[h4,o4]=freqz(b4,a4,512,Fs);
m4=20*log10(abs(h4));
figure(4);
plot(o4/pi,m4)
xlabel('normalised frequency is ---->');
ylabel('gain in db --->');
title('butterworth bandstop filter');
