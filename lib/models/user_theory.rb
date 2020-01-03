class UserTheory < ActiveRecord::Base
    belongs_to :theory
    belongs_to  :theorist
end