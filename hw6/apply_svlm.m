% Dominic DiPasquale

function class_ = apply_svlm(x,w,b)
  class_ = 0;
  for i=1:length(x)
    class_ = class_ + w(i) * x(i);
  end
  if(class_ + b >= 0)
    class_ = 1;
  else
    class_ = 0;
  end

end


