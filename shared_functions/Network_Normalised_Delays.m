function [ Normalized_Delays ] = Network_Normalised_Delays( Distances, Alpha )
%{
-------------------------   AUTHORSHIP  -------------------------

Developer: Loris Marini
Affiliation: The University of Sydney
Contact: mrnlrs.tor@gmail.com
Notes:

-------------------------   DESCRIPTION   -------------------------

This function simply applies the Shannon bound to calculate the minimum 
theoretically possible transfer latency for a file of 1 MB over a AWGN
channel (Shanno bound) of length r and attenuation coefficient Alpha Km^-1,
for an available bandwidth o 1 MHz and SNR = 2.

Bandwidth = 10^6 [Hz];
File_Size = 10^6 [bytes];
SNR = 2;
d = distance [m];
alpha = [km^-1];

The formula applyed is simply:

Normalized_Delay = (File_Size_bytes * 8) / (Bandwidth_Hz * log2 (1 + SNR * exp(-distance.*alpha) ));

------------------------- INPUT PARAMETERS -------------------------

-- Distances --
Matrix of user distances [m] size NxP with N = number of users, and P = number of 
content providers. Row i-th corresponds to user i, and each column to a 
distance between the user and the corresponding provider (helper or base station).

-- Alpha --
The free space absorption coefficient [km^-1]

------------------------- OUTPUT PARAMETERS -------------------------

-- Normalized_Delays -- 
A matix of the same size as Distances but whose numbers represent the
latency in seconds to transfer the file.

------------------------- EXAMPLE OF CALL -----------------------

A propagation Loss of 1 Km^-1 and three users in a cell with 4 providers:

Alpha = 3;
Distances = [200,300,411,5; 40,203,110,900; 55,20,190,300];
[ Parameters ] = Network_Normalised_Delays(Distances, Alpha);

%}
% ----------------------------   CODE     --------------------------


File_Size_bits = 10^6;
SNR = 3;
Bandwidth_Hz = 10^6;

Normalized_Delays = File_Size_bits ./ (Bandwidth_Hz .* log2 (1 + SNR .* exp(-Distances.*(Alpha/1000)) ));

end

