function [F,Omega,Mag,Phase] = fseries(f,T,nmax,epsilon,str)

error(nargchk(3,5,nargin));
if (nargin < 5) str = 'wrap!!'; end
if (nargin < 4) epsilon = 0.001; end
m = length(f);
if (T <= 0) 
	error('Period T must be positive'); end
if (nmax <= 0) 
	error('No of coefficients nmax must be positive'); 
end
if (epsilon <= 0) 
	error('Min magnitude epsilon must be positive'); 
end
if (length('wrap!!') ~= length(str)) 
	error('Control string must be of 6 letters'); 
end
fintern = [f f(1)];
t = [0:T/m:T];
omega1 = 2*pi/T;
n = 0;
	integrand = fintern;
	Fzero = trapz(t,integrand)/T;
for n=1:nmax
	integrand = fintern.*exp(-i*omega1*n*t);
	Fpos(n) = trapz(t,integrand)/T;
	omegapos(n) = omega1*n;
end
magzero = abs(Fzero);
magpos = abs(Fpos);
phasezero = angle(Fzero);
phasepos = angle(Fpos);
if ( magzero < epsilon ) phasezero = 0; end
for n = 1:nmax
	if ( magpos(n) < epsilon ) phasepos(n) = 0; end
end
if ( str == 'unwrap' ) phasepos = unwrap(phasepos); end
Fneg = fliplr(conj(Fpos));
omeganeg = -fliplr(omegapos);
magneg = fliplr(magpos);
phaseneg = -fliplr(phasepos);
Omega = [omeganeg 0 omegapos];
Mag = [magneg magzero magpos];
Phase = [phaseneg phasezero phasepos];
if nargout==0,	% If no output arguments, plot graph
    subplot(2,1,1)
        stem(Omega,Mag,'.')
        hold on
        plot(Omega,Mag,':')
        hold on
        plot(Omega,zeros(size(Omega)),'-.')
		v = axis;
		axis([min(Omega),max(Omega),v(3),v(4)])
		grid
        xlabel('Frequency \omega')
        ylabel('Magnitude |F(\omega)|')
		title('Fourier Spectrum')
     subplot(2,1,2)
	stem(Omega,Phase,'.')
        hold on
        plot(Omega,Phase,':')
        hold on
        plot(Omega,zeros(size(Omega)),'-.')
		v = axis;
		axis([min(Omega),max(Omega),v(3),v(4)])
		grid
        xlabel('Frequency \omega')
        ylabel('Angle \angleF(\omega)')
    return 
end
F = [Fneg Fzero Fpos];
