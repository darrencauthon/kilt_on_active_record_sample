class Thing < ActiveRecord::Base
  serialize :data, Hash
end
