class Theory < ActiveRecord::Base
    has_many :user_theories
    has_many :theorists, through: :user_theories

    # def theorist
    #     Theorist.all.find do |theorist_instance|
    #         theorist_instance.id == self.id
    #     end
    # end
end