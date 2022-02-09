## Notes to Self: 

I need "People(static-ish info)", "Activities(static-ish info)", "Tasks"(assigned activities), and "Events(completed tasks, etc)".

https://medium.com/@matt.readout/rails-generators-model-vs-resource-vs-scaffold-19d6e24168ee

be brave. branch it, butcher it, back it up.


-------------------

## ToDo

* Activities table needs the following added:
    t.text "default_values" 
    t.text "yield"
    t.integer "resource_id"
      t.index ["resource_id"], name: "resource_id_on_activity_id"
    t.integer "activity_template_id"
      t.index ["activity_template_id"], name: "activity_template_id_on_activity_id"

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

* Tasks require same columns as activities+person_id+notes
  * task completed event incl. activity_id, person_id, resource_id, yield, notes

* Events for Resources
  * edit event model so there's something to call
  * edit resource controler to call the events on create, edit, etc
  * make events_resources join_table
