var _parcelHelpers = require("@parcel/transformer-js/lib/esmodule-helpers.js");
_parcelHelpers.defineInteropFlag(exports);
_parcelHelpers.export(exports, "state", function () {
  return state;
});
_parcelHelpers.export(exports, "loadRecipe", function () {
  return loadRecipe;
});
_parcelHelpers.export(exports, "loadSearchResults", function () {
  return loadSearchResults;
});
var _config = require('./config');
var _helpers = require('./helpers');
const state = {
  recipe: {},
  search: {
    query: '',
    results: []
  }
};
const loadRecipe = async function (id) {
  try {
    const data = await _helpers.getJSON(`${_config.API_URL}${id}`);
    const {recipe} = data.data;
    state.recipe = {
      id: recipe.id,
      title: recipe.title,
      publisher: recipe.publisher,
      sourceUrl: recipe.source_url,
      image: recipe.image_url,
      servings: recipe.servings,
      cookingTime: recipe.cooking_time,
      ingredients: recipe.ingredients
    };
    console.log(state.recipe);
  } catch (err) {
    console.error(`${err} 🎈🎈🎈`);
    // rethrow the error again, so that the controller can catch it
    throw err;
  }
};
const loadSearchResults = async function (query) {
  try {
    state.search.query = query;
    const data = await _helpers.getJSON(`${_config.API_URL}?search=${query}`);
    state.search.results = data.data.recipes.map(recipe => {
      return {
        id: recipe.id,
        title: recipe.title,
        publisher: recipe.publisher,
        image: recipe.image_url
      };
    });
  } catch (err) {
    console.error(`${err} 🎈🎈🎈`);
    // rethrow the error, so that the controller can catch it
    throw err;
  }
};