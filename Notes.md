## Notes to Self: 

I need "People(static-ish info)", "Activities(static-ish info)", "Tasks"(assigned activities), and "Events(completed tasks, etc)".

https://medium.com/@matt.readout/rails-generators-model-vs-resource-vs-scaffold-19d6e24168ee

be brave. branch it, butcher it, back it up.


-------------------

## ToDo

# Tasks require activity_id+person_id+notes
  * task completed event incl. activity_id, person_id, resource_id, results, notes
  * belongs_to activity, -> { includes :resource }
    belongs_to person

# Once all that is done:
  * look at the javascript & css again and make the forms pretty.
  * css libraries/frameworks make that easier. (look at boodstrap, tailwind, etc)
