// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails, { $ } from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

function connectResourceTypeDropdowns(owner) {
  const resource_subtype_control = document.querySelector(`#${owner}_resource_subtype_id`)
  if (resource_subtype_control) {
    
    resource_subtype_control.parentElement.style.display = 'none';
    // if (owner === "task"){
    //   resource_control.parentElement.style.display = 'none';
    // }
    const resource_subtype_control_copy = resource_subtype_control.cloneNode(true);
    const resource_type_control = document.querySelector(`#${owner}_resource_type_id`)

    resource_type_control.addEventListener("change", () => {
      const type = resource_type_control.selectedOptions[0].text;
      const options = resource_subtype_control_copy.querySelectorAll(`optgroup[label='${type}'] option`);
      
      if (options.length > 0) {
        const new_options = Array.from(options).map((opt)=>opt.cloneNode(true));
        resource_subtype_control.replaceChildren(...new_options);
        resource_subtype_control.parentElement.style.display = 'block';
      } else {
        resource_subtype_control.replaceChildren([]);
        resource_subtype_control.parentElement.style.display = 'none';
      }
    });
    // if (owner === 'task'){
    //   resource_subtype_control.addEventListener("change", () => {
    //     const subtype = resource_subtype_control.selectedOptions[0].text;
    //     const options = resource_control_copy.querySelectorAll(`optgroup[label='${subtype}'] option`);
        
    //     if (options.length > 0) {
    //       const new_options = Array.from(options).map((opt)=>opt.cloneNode(true));
    //       resource_control.replaceChildren(...new_options);
    //       resource_control.parentElement.style.display = 'block';
    //     } else {
    //       resource_control.replaceChildren([]);
    //       resource_control.parentElement.style.display = 'none';
    //     }
    //   });
    //  }
  }
}
// !!TO DO!! //
// This is not nearly complete as activity templates, activities, 
// resources, and tasks all need a version of this.

window.addEventListener("turbolinks:load", () => {
  connectResourceTypeDropdowns("activity_template");
  // connectResourceTypeDropdowns("activity");
  connectResourceTypeDropdowns("resource");
  // connectResourceTypeDropdowns("task");
});


