% Load up our data files
train_data = load('hw10_train.txt');
test_data = load('hw10_test.txt');


train_x = train_data(:,1:end-1);
train_class = train_data(:,end);

test_x = test_data(:,1:end-1);
test_class = test_data(:,end);

%{
base = zeros(9,2);

for t=2:10
  av = 0;
  for j=1:20
    [test_y] = SVML_base(train_x,train_class,test_x,sprintf('[@SVML_base,%u', t));
    mn = mean_misclass_error(test_class, test_y);
    av = av + mn;
  end
  disp(sprintf('For T %u, average misclass e is: %f', t, av/20));
  base(t-1,1) = t;
  base(t-1,2) = av/20;
end
%test_y = SVML_base(train_x, train_class, test_x, '[@SVML_base, 1]');

disp(sprintf('---------------------------------------'));

disp(sprintf('---------------------------------------'));
%}
av = 0;

bag_test = zeros(9,2);
bag_train = zeros(9,2);


for t=2:10
  av_test = 0;
  av_train = 0;

  for j=1:20
    [test_y] = Bag_classifier(train_x,train_class,test_x,sprintf('[@SVML_base,%u,[]]', t));
    mn = mean_misclass_error(test_class, test_y);
    av_test = av_test + mn;

    [train_y] = Bag_classifier(train_x,train_class,train_x,sprintf('[@SVML_base,%u,[]]', t));
    mn = mean_misclass_error(train_class, train_y);
    av_train = av_train + mn;
  end
  bag_test(t-1,1) = t;
  bag_test(t-1,2) = av_test/20;

  bag_train(t-1,1) = t;
  bag_train(t-1,2) = av_train/20;
end

disp(sprintf('---------------------------------------'));

disp(sprintf('---------------------------------------'));

boost_test = zeros(9,2);
boost_train = zeros(9,2);

for t=2:10
  av_test = 0;
  av_train = 0;
  for j=1:20
    [test_y] = Boost_classifier(train_x,train_class,test_x,sprintf('[@SVML_base,%u,[]]', t));
    mn = mean_misclass_error(test_class, test_y);
    av_test = av_test + mn;

    [train_y] = Boost_classifier(train_x,train_class,train_x,sprintf('[@SVML_base,%u,[]]', t));
    mn = mean_misclass_error(train_class, train_y);
    av_train = av_train + mn;
  end
  boost_test(t-1,1) = t;
  boost_test(t-1,2) = av_test/20;

  boost_train(t-1,1) = t;
  boost_train(t-1,2) = av_train/20;
end


disp(sprintf('---------------------------------------'));

disp(sprintf('---------------------------------------'));

boost_test_dt = zeros(9,2);
boost_train_dt = zeros(9,2);

for t=2:10
  av_test = 0;
  av_train = 0;
  for j=1:20
    [test_y] = Boost_classifier(train_x,train_class,test_x,sprintf('[@DT_base_full,%d,[]]', t));
    mn = mean_misclass_error(test_class, test_y);
    av_test = av_test + mn;

    [train_y] = Boost_classifier(train_x,train_class,train_x,sprintf('[@DT_base_full,%d,[]]', t));
    mn = mean_misclass_error(train_class, train_y);
    av_train = av_train + mn;
  end

  boost_test_dt(t-1,1) = t;
  boost_test_dt(t-1,2) = av_test/20;

  boost_train_dt(t-1,1) = t;
  boost_train_dt(t-1,2) = av_train/20;
end

bag_test_dt = zeros(9,2);
bag_train_dt = zeros(9,2);

for t=2:10
  av_test = 0;
  av_train = 0;
  for j=1:20
    [test_y] = Bag_classifier(train_x,train_class,test_x,sprintf('[@DT_base_full,%d,[]]', t));
    mn = mean_misclass_error(test_class, test_y);
    av_test = av_test + mn;

    [train_y] = Bag_classifier(train_x,train_class,train_x,sprintf('[@DT_base_full,%d,[]]', t));
    mn = mean_misclass_error(train_class, train_y);
    av_train = av_train + mn;
  end
  bag_test_dt(t-1,1) = t;
  bag_test_dt(t-1,2) = av_test/20;

  bag_train_dt(t-1,1) = t;
  bag_train_dt(t-1,2) = av_train/20;
end


%[test_y] = DT_base_simple(train_x,train_class,test_x,sprintf('[@SVML_base,%u', t));
%disp(mean_misclass_error(test_class,test_y));
%[test_y] = DT_base_full(train_x,train_class,test_x,sprintf('[@SVML_base,%u', t));
%disp(mean_misclass_error(test_class,test_y));
plot(boost_test_dt(:,1), boost_test_dt(:,2), 'b', boost_train_dt(:,1), boost_train_dt(:,2), 'g--', bag_test_dt(:,1), bag_test_dt(:,2), 'r', bag_train_dt(:,1), bag_train_dt(:,2), 'k--', boost_test(:,1), boost_test(:,2), 'c', boost_train(:,1), boost_train(:,2), 'y--', bag_test(:,1), bag_test(:,2), 'm', bag_train(:,1), bag_train(:,2), 'k--');
%plot(boost_test(:,1), boost_test(:,2), 'b', boost_train(:,1), boost_train(:,2), 'g', bag_test(:,1), bag_test(:,2), 'r', bag_train(:,1), bag_train(:,2), 'k');




%plot(ids,dx,'b',ids,dy,'r',ids,dz,'k');