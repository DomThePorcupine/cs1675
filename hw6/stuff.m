% Dominic DiPasquale

function class_ = stuff(x,w,b)
  class_ = 0;
  for i=1:length(x)
    class_ = class_ + w(i) * x(i);
  end
  class_ = class_ + b;

end