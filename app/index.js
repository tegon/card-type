//= require jquery
//= require card
//= require parser
$(document).ready(function() {
    var style = document.createElement('link');
    style.rel = 'stylesheet';
    style.type = 'text/css';
    style.href = chrome.extension.getURL('build/index.css');
    (document.head||document.documentElement).appendChild(style);

    new Parser();
})