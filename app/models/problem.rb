class Problem < ActiveRecord::Base
  default_scope order("status asc, created_at asc")
end
