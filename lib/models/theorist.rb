class Theorist < ActiveRecord::Base
    has_many :user_theories
    has_many :theories, through: :user_theories

#     def develop_theory(theory = {content: ""} )
#         Theory.create do |t|
#             t.theorist == theory[:content]
#             t.save
#         end
#     end

#     def theory
#         Theory.all.find do |theory_instance|
#             theory_instance.id == self.id
#         end
#     end
end