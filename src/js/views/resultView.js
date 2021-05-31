import View from './view';
import icons from 'url:../../img/icons.svg';

class ResultView extends View {
  _parentElement = document.querySelector('.results');
  _errorMessage = 'No recipes found for your query, please try again';
  _message = '';

  _generateMarkup() {
    return this._data.map(this._generateMarkupPreview).join('');
  }

  _generateMarkupPreview(results) {
    const currectId = window.location.hash.slice(1);

    return `
        <li class="preview">
            <a class="preview__link ${
              results.id === currectId ? 'preview__link--active' : ''
            }" href="#${results.id}">
                <figure class="preview__fig">
                <img src="${results.image}" alt="${results.title}" />
                </figure>
                <div class="preview__data">
                    <h4 class="preview__title">${results.title}</h4>
                    <p class="preview__publisher">${results.publisher}</p>
                </div>
            </a>
        </li>
      `;
  }
}
export default new ResultView();
