require( './styles/main.scss' );

// inject bundled Elm app into div#main
var Elm = require( '../elm/App' );
// Elm.Main.embed(document.getElementById('main'));
Elm.Main.embed(document.getElementById( 'main' ));
