import Elm from './src/Hello.elm';

window.addEventListener('DOMContentLoaded', () => {
  const app = Elm.Hello.init({
    node: document.getElementById('app'),
  });
});
