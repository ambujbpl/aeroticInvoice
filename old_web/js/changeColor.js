var body_Color = document.querySelectorAll('.body_Color span');
var root = document.querySelector(':root');

body_Color.forEach((swatch) => {
  swatch.addEventListener('click', (e) => {
    console.log("BGCOLOR",body_Color);
    root.style.setProperty('--body-bgColor', e.target.style.background);
  });
});

var body_font = document.querySelectorAll('.body_Font span');
body_font.forEach((swatch) => {
  swatch.addEventListener('click', (e) => {
    console.log("FONT",body_font);
    root.style.setProperty('--body-font', e.target.style.fontFamily);
  });
});

var header_bgColor = document.querySelectorAll('.header_bgColor span');
var root = document.querySelector(':root');
header_bgColor.forEach((swatch) => {
  swatch.addEventListener('click', (e) => {
    root.style.setProperty('--header-bgColor', e.target.style.background);
  });
});

var table_header_bgColor = document.querySelectorAll('.table_header_bgColor span');
var root = document.querySelector(':root');

table_header_bgColor.forEach((swatch) => {
  swatch.addEventListener('click', (e) => {
    root.style.setProperty('--td-headBgColor', e.target.style.background);
  });
});

// Config box
// SKIN Select
$('.spin-icon').click(function() {
  $(".theme-config-box").toggleClass("show");
});
