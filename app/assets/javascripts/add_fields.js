// TODO:  user jQuery clone or template for new fields

function ingredientTmpl(stepIndex, ingIndex) {
  return (
    '<div class="row">' +
      '<div class="col-md-3">' +
        '<input placeholder="1" class="form-control" type="text" name="recipe[steps_attributes][' + stepIndex +'][ingredients_attributes][' + ingIndex + '][amount]" id="recipe_steps_attributes_' + stepIndex + '_ingredients_attributes_' + ingIndex + '_amount" />' +
      '</div>' +
      '<div class="col-md-3">' +
        '<select class="form-control c-select" name="recipe[steps_attributes][' + stepIndex +'][ingredients_attributes][' + ingIndex + '][unit]" id="recipe_steps_attributes_' + stepIndex + '_ingredients_attributes_' + ingIndex + '_unit">' +
          '<option value="cups">cups</option>' +
          '<option value="tsp">tsp</option>' +
          '<option value="tbsp">tbsp</option>' +
          '<option value="piece(s)">piece(s)</option>' +
          '<option value="oz">oz</option>' +
        '</select>' +
      '</div>' +
      '<div class="col-md-5">' +
        '<input placeholder="ingredient" class="form-control" type="text" name="recipe[steps_attributes][' + stepIndex +'][ingredients_attributes][' + ingIndex + '][name]" id="recipe_steps_attributes_' + stepIndex + '_ingredients_attributes_' + ingIndex + '_name" />' +
      '</div>' +
      '<div class="col-md-1">' +
        '<input name="recipe[steps_attributes][' + stepIndex +'][ingredients_attributes][' + ingIndex + '][_destroy]" type="hidden" value="0" /><input class="form-control" type="checkbox" value="1" name="recipe[steps_attributes][' + stepIndex +'][ingredients_attributes][' + ingIndex + '][_destroy]" id="recipe_steps_attributes_' + stepIndex + '_ingredients_attributes_' + ingIndex + '__destroy" /><small>x</small>' +
      '</div>' +
    '</div>'
  );
}

// Add ingredient rows
$('#recipe-form').on('click', 'button.add-ingredient', function(e) {
  e.preventDefault();
  var stepIndex = $(this).data("step-index"),
      ingIndex = $(this).data("ing-index"),
      newIng = ingredientTmpl(stepIndex, ingIndex);

  $(this).before( newIng );
  $(this).data("ing-index", ingIndex + 1)
})

// Add step rows
$('#recipe-form').on('click', 'button.add-step', function(e) {
  e.preventDefault();
  var stepIndex = $(this).data("step-index")

  $("#steps").append(
    '<div class="step-container">' +
      '<h5>Step ' + (stepIndex + 1) + '</h5>' +
      '<div class="row">' +
        '<div class="ingredient-fields col-md-6">' +
            '<button class="add-ingredient" data-step-index="' + stepIndex + '" data-ing-index="1">+</button>' +
        '</div> <!-- End ingredient-fields -->' +
        '<div class="form-group col-md-6">' +
          '<textarea placeholder="Directions..." class="form-control" name="recipe[steps_attributes][' + stepIndex + '][description]" id="recipe_steps_attributes_' + stepIndex + '_description">' +
          '</textarea>' +
          '<input name="recipe[steps_attributes][' + stepIndex + '][_destroy]" type="hidden" value="0" /><input type="checkbox" value="1" name="recipe[steps_attributes][' + stepIndex + '][_destroy]" id="recipe_steps_attributes_' + stepIndex + '__destroy" />' +
          '<label for="recipe_steps_attributes_' + stepIndex + '_delete this step">Delete this step</label>' +
        '</div> <!-- End directions form-group -->' +
      '</div> <!-- End row -->' +
    '</div> <!-- End step-container -->'
  );

  $(this).data("step-index", stepIndex + 1)
})
