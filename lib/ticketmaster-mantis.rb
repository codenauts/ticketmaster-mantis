require "mantisrb"

%w{ mantis project ticket }.each do |f|
  require File.dirname(__FILE__) + '/provider/' + f + '.rb';
end
