Theorist.destroy_all
Theory.destroy_all
UserTheory.destroy_all

theorist = Theorist.create(name: "Jimmy Chumbuts Sr.")


theory = Theory.create(content: "Roaches are the ancestors to modern day cats.", theorist_name: theorist.name)


user_theory = UserTheory.create(theorist_id: Theorist.first.id, theory_id: Theory.first.id)



theorist1.theories << theory1