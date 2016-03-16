// Three blank steps are generated in the form by default (index 0-2).
// As user adds new steps, start with index 3.
var stepCounter = 3;

// TODO:  user jQuery clone or template for new fields

// Add ingredient rows
$('#recipe-form').on('click', 'button.add-ingredient', function(e) {
  e.preventDefault();
  var currentStep = $(this).data("step-index"),
      ingCounter = $(this).data("ing-index")

  $(this).before(
    '<li>' +
      '<label for="recipe_steps_attributes_' + currentStep + '_ingredients_attributes_' + ingCounter + '_amount">Amount</label> ' +
      '<input type="number" value="" name="recipe[steps_attributes][' + currentStep + '][ingredients_attributes][' + ingCounter + '][amount]" id="recipe_steps_attributes_' + currentStep + '_ingredients_attributes_' + ingCounter + '_amount"> ' +

      '<label for="recipe_steps_attributes_' + currentStep + '_ingredients_attributes_' + ingCounter + '_unit">Unit</label> ' +
      '<input type="text" value="" name="recipe[steps_attributes][' + currentStep + '][ingredients_attributes][' + ingCounter + '][unit]" id="recipe_steps_attributes_' + currentStep + '_ingredients_attributes_' + ingCounter + '_unit"> ' +

      '<label for="recipe_steps_attributes_' + currentStep + '_ingredients_attributes_' + ingCounter + '_name">Name</label> ' +
      '<input type="text" value="" name="recipe[steps_attributes][' + currentStep + '][ingredients_attributes][' + ingCounter + '][name]" id="recipe_steps_attributes_' + currentStep + '_ingredients_attributes_' + ingCounter + '_name"> ' +

      '<input name="recipe[steps_attributes][' + currentStep + '][ingredients_attributes][' + ingCounter + '][_destroy]" type="hidden" value="0"><input type="checkbox" value="1" name="recipe[steps_attributes][' + currentStep + '][ingredients_attributes][' + ingCounter + '][_destroy]" id="recipe_steps_attributes_' + currentStep + '_ingredients_attributes_' + ingCounter + '__destroy"> ' +
    '</li>'
  )

  $(this).data("ing-index", ingCounter + 1)
})

// Add step rows
$('#recipe-form').on('click', 'button.add-step', function(e) {
  e.preventDefault();

  $("#step-fields").append(
    '<h5>Step </h5>' +
    'List the ingredients involved in this step:' +
    '<ul class="ingredient-fields">' +
    '<button class="add-ingredient" data-step-index="' + stepCounter + '" data-ing-index="0">+</button>' +
    '</ul>' +
    '<li>' +
      '<label for="recipe_steps_attributes_' + stepCounter + '_description">Description</label>' +
      '<textarea name="recipe[steps_attributes][' + stepCounter + '][description]" id="recipe_steps_attributes_' + stepCounter + '_description"></textarea>' +

      '<input name="recipe[steps_attributes][' + stepCounter + '][_destroy]" type="hidden" value="0"><input type="checkbox" value="' + stepCounter + '" name="recipe[steps_attributes][' + stepCounter + '][_destroy]" id="recipe_steps_attributes_' + stepCounter + '__destroy">' +
    '</li>'
  );

  stepCounter++;
})
