function Yout = cuantificador2(Xin, NbitsC,NbitsS)
   p=((2^NbitsS)/(2^NbitsC)) :((2^NbitsS)/(2^NbitsC)):(2^NbitsS);
   Yout = quantiz (Xin,p);
end


