var _modelJs = require('./model.js');
var _viewsRecipeView = require('./views/recipeView');
var _parcelHelpers = require("@parcel/transformer-js/lib/esmodule-helpers.js");
var _viewsRecipeViewDefault = _parcelHelpers.interopDefault(_viewsRecipeView);
var _viewsSearchView = require('./views/searchView');
var _viewsSearchViewDefault = _parcelHelpers.interopDefault(_viewsSearchView);
var _viewsRecipeViewDefault = _parcelHelpers.interopDefault(_viewsRecipeView);
require('core-js/stable');
require('regenerator-runtime/runtime');
// https://forkify-api.herokuapp.com/v2
// /////////////////////////////////////
const controlRecipes = async function () {
  try {
    const id = window.location.hash.slice(1);
    if (!id) return;
    // render spinner during loading the recipe
    _viewsRecipeViewDefault.default.renderSpinner();
    await _modelJs.loadRecipe(id);
    _viewsRecipeViewDefault.default.render(_modelJs.state.recipe);
  } catch (err) {
    _viewsRecipeViewDefault.default.renderError();
  }
};
const controlSearchResults = async function () {
  try {
    _viewsRecipeViewDefault.default.renderSpinner();
    console.log('controller test');
    const query = _viewsSearchViewDefault.default.getQuery();
    if (!query) return;
    await _modelJs.loadSearchResults(query);
    console.log(_modelJs.state.search.results);
  } catch (err) {
    console.log(err);
  }
};
const init = function () {
  _viewsRecipeViewDefault.default.addHandlerRender(controlRecipes);
  _viewsSearchViewDefault.default.addHandlerSearch(controlSearchResults);
};
init();
