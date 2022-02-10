## Notes to Self: 

I need "People(static-ish info)", "Activities(static-ish info)", "Tasks"(assigned activities), and "Events(completed tasks, etc)".

https://medium.com/@matt.readout/rails-generators-model-vs-resource-vs-scaffold-19d6e24168ee

be brave. branch it, butcher it, back it up.


-------------------

## ToDo

* Gotta clean up the db and connections

* Events for Activities
  * edit event model so there's something to call
  * edit activity controler to call the events on create, edit, etc
  * make events_activities join_table


* When making a resource(on create, not edit)
  * auto-make appropriate activities based on templates (this one will take some doing)
    * Activities creation requires the template, and resource(template provides a name & details that can be edited)
  * resource show page includes it's activities names & filled descriptions 
    * with buttons to edit or deactivate
    * active or not shown next to activity (x or check?)

* Events for Resources
  * edit event model so there's something to call
  * edit resource controler to call the events on create, edit, etc
  * make events_resources join_table

* Tasks require activity_id+person_id+notes
  * task completed event incl. activity_id, person_id, resource_id, yield, notes
  * belongs_to activity, -> { includes :resource }
    belongs_to person

* Once all that is done:
  * look at the javascript & css again and make the forms pretty.
  * css libraries/frameworks make that easier. (look at boodstrap, tailwind, etc)
