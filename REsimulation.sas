proc iml; 
N = 250; 
NumSamples = 250; 
/* specify population mean and covariance */ 
Mean = {8.6,16.3,.64}; 
Cov = {4.32 7.26 -0.077, 
7.26 34.9 0.48, 
-0.077 .48 .16}; 
call randseed(4322); 
X = RandNormal(N*NumSamples, Mean, Cov); 
/*Create data set from simulated data*/ 
ID = colvec(repeat(T(1:NumSamples), 1, N)); /* 1,1,1,...,2,2,2,...,3,3,3,... */ 
Z = ID || X; 
create raneff from Z[c={"ID" "t1" "t2" "t3"}]; 
append from Z; 
close raneff; 
quit;
