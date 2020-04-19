window.onload = function() {
  //canvas init and store in the variables
  var key = "bhopal";
  var canvas = document.getElementById("canvas");
  var ctx = canvas.getContext("2d");

  //canvas dimensions
  var W = window.innerWidth;
  var H = window.innerHeight;
  canvas.width = W;
  canvas.height = H;

  //generate the snowflake particles and apply attributes
  var mp = 100; //max particles
  key = "mp";
  var particles = [];
  //loop through empty flakes and apply the attributes
  for (var i = 0; i < mp; i++) {
    particles.push({
      x: Math.random() * W, //x-coordinate
      y: Math.random() * H, //y-coordinate
      r: Math.random() * 4 + 1, //radius beetween 1px to 5px because max redius is varing between 0 to 1
      d: Math.random() * mp //density (time to flask down in y axis)
    })
  }

  //Lets draw the flakes
  function draw() {
    ctx.clearRect(0, 0, W, H);

    // ctx.fillStyle = "rgba(255, 255, 255, 0.8)";
    // ctx.fillStyle = getRandomColor();
    ctx.fillStyle = getRandomColor1();
    ctx.beginPath();
    for (var i = 0; i < mp; i++) {
      var p = particles[i];
      ctx.moveTo(p.x, p.y);
      ctx.arc(p.x, p.y, p.r, 0, Math.PI * 2, true);
    }
    ctx.fill();
    update();
  }
  //Function to move the snowflakes

  key += "bhopal"
  //angle will be an ongoing incremental flag. Sin and Cos functions will be applied to it to create vertical and horizontal movements of the flakes
  var angle = 0;

  function update() {
    angle += 0.01;
    for (var i = 0; i < mp; i++) {
      var p = particles[i];
      //Updating X and Y coordinates
      //We will add 1 to the cos function to prevent negative values which will lead flakes to move upwards
      //Every particle has its own density which can be used to make the downward movement different for each flake
      //Lets make it more random by adding in the radius
      p.y += Math.cos(angle + p.d) + 1 + p.r / 2;
      p.x += Math.sin(angle) * 2;

      //Sending flakes back from the top when it exits
      //Lets make it a bit more organic and let flakes enter from the left and right also.
      if (p.x > W + 5 || p.x < -5 || p.y > H) {
        if (i % 3 > 0) //66.67% of the flakes
        {
          particles[i] = {
            x: Math.random() * W,
            y: -10,
            r: p.r,
            d: p.d
          };
        } else {
          //If the flake is exitting from the right
          if (Math.sin(angle) > 0) {
            //Enter from the left
            particles[i] = {
              x: -5,
              y: Math.random() * H,
              r: p.r,
              d: p.d
            };
          } else {
            //Enter from the right
            particles[i] = {
              x: W + 5,
              y: Math.random() * H,
              r: p.r,
              d: p.d
            };
          }
        }
      }
    }
  }
  //animation loop
  setInterval(draw, 55);
  askSecret(key)
}

function getRandomColor() {
  var letters = '0123456789ABCDEF';
  var color = '#';
  for (var i = 0; i < 6; i++) {
    color += letters[Math.floor(Math.random() * 16)];
  }
  return color;
}

function getRandomColor1() {
  var colors = ['red', '#fff', 'green'];
  var color = Math.floor(Math.random() * colors.length);
  // console.log(color);
  return colors[color];
}

function askSecret(key){
	var person = prompt("Please enter your Secret Key", "Saniya Enterprises");

	if (person == key) {
	 login();
	}else{
	 alert("Key is not matched! try again");
	setTimeout(function() {
	          location.reload();
	        }, 2000); //delayTime should be written in milliseconds e.g. 1000 which equals 1 second
	}
}

function login(){
swal({
  text: "Please Select any one option!",
  icon: "warning",
  buttons: {
    catch: {
      text: "New Invoice",
      value: "catch",
    },
    defeat: {
      text: "View Invoice",
      value: "defeat",
    },
    cancel: "Not Sure!",
  },

}).then((value) => {
  switch (value) {

    case "catch":
      location.replace("./addInvoice.php");
      break;

    case "defeat":
      location.replace("./viewInvoice.php");
      break;

    default:
      swal({
        text: "We Will Meet Again!",
        icon: "warning",
      }).then(() => {
        setTimeout(function() {
          location.reload();
        }, 5000); //delayTime should be written in milliseconds e.g. 1000 which equals 1 second

      });
  }
});
};		