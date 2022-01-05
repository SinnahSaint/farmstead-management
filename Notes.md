Notes to Self: 

I need "People(static-ish info)", "Activities(static-ish info)", "Tasks"(assigned activities), and "Events(completed tasks, etc)".

https://medium.com/@matt.readout/rails-generators-model-vs-resource-vs-scaffold-19d6e24168ee

be brave. branch it, butcher it, back it up.


 * need to fix Users so you need a name, and at least a phone OR email to save (done)
 * also need to ba able to flag a user as inactive(/retired/archived) (done)

-------------------

 rails generate scaffold Task [name[:string] assigned[:user] start[:datetime] due[:datetime] complete[:datetime]]

* make sure to point users back to tasks with a has_many
* next build TaskActivity table, then link to it from tasks and activities
