clear, clc, close all

Fnl = (10:5:70);

pp_ideal_64 = [14.5975153447570,11.1493617521922,9.24614867078964,7.81106106873581,7.15328940089262,6.56733704461760,6.34220099785258,6.02013830438804,5.77915934342704,5.59515333377713,5.45201006967885,5.33876011884644,5.24778900497096;];
pp_ideal_16 = [16.3213819387036,12.4865131567481,9.76709120044808,8.18354590824079,7.01035851407854,5.83014790904365,5.26580087997884,4.91749924418152,4.50449548508152,4.17713887021037,4.10641084114149,3.88119577832034,3.69640895974620;];

pp_butter_64 = [15.4520112361295,11.8380155834887,10.0425894163993,8.66592561509911,7.80434898961689,7.35901072927160,6.90869225379659,6.57648269959249,6.32620536495048,6.13394344621145,5.98359300149356,5.86410379536621,5.76774872828017;];
pp_butter_16 = [17.3502709311740,13.2162210794184,10.5886803523864,8.87067589488495,7.80679925968824,6.79694153633022,6.10701153254415,5.56855883290580,5.30844036796160,4.95706070082555,4.67290209708550,4.44084593871111,4.24954468105210;];


plot(Fnl, pp_ideal_16, '-ok', Fnl, pp_ideal_64, '-sk')
hold on
plot(Fnl, pp_butter_16, '-or', Fnl, pp_butter_64, '-sr')
xlabel('Modulator cut-off frequency (GHz)')
ylabel('Optical power penalty (dB)')
legend('16-QAM ideal Filters', '64-QAM ideal Filters', '16-QAM Butterworth', '64-QAM Butterworth')