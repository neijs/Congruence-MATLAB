% 2016 by Kristof Pucejdl, CTU in Prague
% Function computes a Smith normal form of a matrix of
% an arbitrary size n by m. Standard Matlab function 'smithForm' only
% accepts square matrices, which is rather useless for many linear system
% related applications.

% Input matrix 'A' can be a symbolic polynomial matrix of any size

% The output matrix SA is always symbolic (command 'help sym')
% Second output 'invFacts' is the 1 by n array of the invariant factors of
% the matrix SA. In many applications, we seek for some operation above
% these factors rather than complete matrix SA so it is convinient to get
% them directly from this function.
% Third output D(1...n) is a vector of the greatest common dividers of all
% non-zero i-th order minors of A.

% Depending on your needs, the syntax can be either SA = MNsmithForm(A),
% which only gives the SA matrix, [SA, invFacts] = MNsmithForm(A) or full
% [SA, invFacts, D] = MNsmithForm(A)


function [SA, invFact, D] = MNsmithForm(A)
row = size(A,1);
col = size(A,2);
n = min(row,col);
minors = cell(1,n);
D0 = 1;
D0 = sym(D0);
D = sym(NaN(1,n));
invFact = sym(NaN(1,n));
for i = 1:n;
    rowindex = false(1,row);
    rowindex(1:i) = true;
    rowperms = unique(perms(rowindex),'rows');
    colindex = false(1,col);
    colindex(1:i) = true;
    colperms = unique(perms(colindex),'rows');
    rownum = size(rowperms,1);
    colnum = size(colperms,1);
    minors{i} = sym(NaN(rownum,colnum));
    for j=1:rownum;
        for k=1:colnum;
            Atmp = A;
            Atmp = Atmp(rowperms(j,:),:);
            Atmp = Atmp(:,colperms(k,:));
            minors{i}(j,k) = det(Atmp);
        end
    end
    rowlen = rownum*colnum; %(row - (i-1))*(col - (i-1));
    minors{i} = reshape(minors{i},1,rowlen);
    minors{i}(minors{i} == 0) = [];
    D(i) = gcd(minors{i});
    if i == 1
        invFact(i) = D(i)/D0;
    else
        invFact(i) = D(i)/D(i-1);
    end   
end
SA = diag(invFact);
if row>col
    zerorows = zeros(row-col,col);
    SA = [SA;zerorows];
elseif col>row
    zerocols = zeros(row,col-row);
    SA = [SA, zerocols];
end
end