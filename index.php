<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- <link rel="icon" href="/docs/4.0/assets/img/favicons/favicon.ico"> -->

    <title>Sania Enterprises</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.0/examples/carousel/">

    <!-- Bootstrap core CSS -->
    <link href="web/vendor/bootstrap-4.0.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="web/vendor/bootstrap-4.0.0/dist/css/carousel.css" rel="stylesheet">
  </head>
  <body>

    <header>
      <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
       <!--  <a class="navbar-brand" href="#">Carousel</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button> -->
        <div class="collapse navbar-collapse" id="navbarCollapse">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
              <a class="nav-link" href="#"> <b>Saniya Automobile Services(SAS)</b> <span class="sr-only">(current)</span></a>
            </li>
           <!--  <li class="nav-item">
              <a class="nav-link" href="#">Link</a>
            </li>
            <li class="nav-item">
              <a class="nav-link disabled" href="#">Disabled</a>
            </li> -->
          </ul>
          <form class="form-inline mt-2 mt-md-0">
            <!-- <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search"> -->
            <a class="btn btn-outline-success my-2 my-sm-0" href="web/login.html" type="button"><b>LOGIN</b></a>
            <!-- <button class="btn btn-outline-success my-2 my-sm-0" type="submit">SIGN UP</button> -->
          </form>
        </div>
      </nav>
    </header>

    <main role="main">

      <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
          <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
          <li data-target="#myCarousel" data-slide-to="1"></li>
          <li data-target="#myCarousel" data-slide-to="2"></li>
          <li data-target="#myCarousel" data-slide-to="3"></li>
          <li data-target="#myCarousel" data-slide-to="4"></li>
        </ol>
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img class="first-slide" src="web/images/index/carousel/ASCD.jpg" alt="First slide">
            <div class="container">
              <div class="carousel-caption text-left">
                <h1>ASCD</h1>
                <p>Automatic Speed Control Device (ASCD) allows a driver to keep vehicle at predetermined constant speed without depressing accelerator pedal. Driver can set vehicle speed in advance between approximately 40 km/ h (25 MPH) and 194 km/h (120 MPH).</p>
                <p><a class="btn btn-lg btn-primary" href="web/login.html" role="button">Login</a></p>
              </div>
            </div>
          </div>
          <div class="carousel-item">
            <img class="second-slide" src="web/images/index/carousel/PUC.jpg" alt="Second slide">
            <div class="container">
              <div class="carousel-caption">
                <h1>PUC</h1>
                <p>The Indian government has mandated the Pollution Under Control (PUC) certificate under the Central Motor Vehicles Rule, 1989. The PUC test assesses the emission of a vehicle and checks if it follows the standard pollution regulation.</p>
                <p><a class="btn btn-lg btn-primary" href="web/login.html" role="button">Login</a></p>
              </div>
            </div>
          </div>
          <div class="carousel-item">
            <img class="third-slide" src="web/images/index/carousel/Fastag.png" alt="Third slide">
            <div class="container">
              <div class="carousel-caption text-right">
                <h1>SBI FATAG</h1>
                <p> SBI FASTag is a device that employs Radio Frequency Identification (RFID) technology for making toll payments directly from the prepaid or savings accountlinked to it. It is affixed on the windscreen of your vehicle and enables you to drive through toll plazas, without stopping for cash transactions. FASTag is linked to a prepaid account from which the applicable toll amount is deducted.</p>
                <p><a class="btn btn-lg btn-primary" href="web/login.html" role="button">login</a></p>
              </div>
            </div>
          </div>
        
         <div class="carousel-item">
            <img class="fourth-slide" src="web/images/index/carousel/VTD.jpg" alt="Fourth slide">
            <div class="container">
              <div class="carousel-caption">
                <h1>Vehicle Tracking System</h1>
                <p>A vehicle tracking system combines the use of automatic vehicle location in individual vehicles with software that collects these fleet data for a comprehensive picture of vehicle locations. Modern vehicle tracking systems commonly use GPS or GLONASS technology for locating the vehicle, but other types of automatic vehicle location technology can also be used. Vehicle information can be viewed on electronic maps via the Internet or specialized software.</p>
                <p><a class="btn btn-lg btn-primary" href="web/login.html" role="button">Login</a></p>
              </div>
            </div>
          </div>
           <div class="carousel-item">
            <img class="fifth-slide" src="web/images/index/carousel/HSRP.jpg" alt="Fifth slide">
            <div class="container">
              <div class="carousel-caption text-left">
                <h1>HSRP</h1>
                <p>High Security Registration Plate is made up of aluminium and is fixed on the vehicle using two non-reusable locks.</p>
                <p><a class="btn btn-lg btn-primary" href="web/login.html" role="button">Login</a></p>
              </div>
            </div>
          </div>
        </div>
        </div>
        <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
      </div>


      <!-- Marketing messaging and featurettes
      ================================================== -->
      <!-- Wrap the rest of the page in another container to center all the content. -->

      <div class="container marketing">
        <!-- <div class="row">
          <div class="col-lg-4">
            <img class="rounded-circle" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Generic placeholder image" width="140" height="140">
            <h2>Heading</h2>
            <p>Donec sed odio dui. Etiam porta sem malesuada magna mollis euismod. Nullam id dolor id nibh ultricies vehicula ut id elit. Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Praesent commodo cursus magna.</p>
            <p><a class="btn btn-secondary" href="#" role="button">View details &raquo;</a></p>
          </div>
          <div class="col-lg-4">
            <img class="rounded-circle" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Generic placeholder image" width="140" height="140">
            <h2>Heading</h2>
            <p>Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cras mattis consectetur purus sit amet fermentum. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh.</p>
            <p><a class="btn btn-secondary" href="#" role="button">View details &raquo;</a></p>
          </div>
          <div class="col-lg-4">
            <img class="rounded-circle" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Generic placeholder image" width="140" height="140">
            <h2>Heading</h2>
            <p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
            <p><a class="btn btn-secondary" href="#" role="button">View details &raquo;</a></p>
          </div>
        </div> -->


        <!-- START THE FEATURETTES -->

        <!-- <hr class="featurette-divider"> -->

        <div class="row featurette">
          <div class="col-md-7">
            <h2 class="featurette-heading">Automatic Speed Control Device(SLD) <span class="text-muted">Helps to avoid accidents</span></h2>
            <p class="lead">Driver can set vehicle speed in advance between approximately 40 km/ h (25 MPH) and 144 km/h (89 MPH).
			ECM controls throttle angle of electric throttle control actuator to regulate engine speed.
			The ASCD operation status is indicated on the combination meter. If any malfunction occurs in ASCD system, ECM automatically deactivates the ASCD control.<br>
			<b> Approx. RS 7,500/piece <br>
                Type- Automatic <br>
                Usage- Speed Control <br>
                Digit Display Size- Single Display <br>
                Operational Current- 0.78 mA <br>
                Maximum Current- 0.5 mA <br>
                Alarm Loudness- upto 120dB <br>
                Model No- 3GB-275 <br>
                Voltage- 12V/24v
            </b>
		    </p>
          </div>
          <div class="col-md-5">
            <img class="featurette-image img-fluid mx-auto" src="web/images/index/ASCD.jpeg" alt="Generic placeholder image">
          </div>
        </div>

        <hr class="featurette-divider">

        <div class="row featurette">
          <div class="col-md-7 order-md-2">
            <h2 class="featurette-heading">PUC <span class="text-muted">PUC certificate is mandatory</span></h2>
            <p class="lead">The number of vehicles has increased exponentially. These two/three or four-wheeler vehicles are causing maximum pollution. Though every now and then the issue catches attention still the pollution index is rising globally.
			So as an important part of the society, you can get the pollution under control certificate for our vehicles from the government. But before applying, you should know more about PUC Certificate (or “pollution under control” certificate).
			Additionally, now according to the IRDAI, it is mandatory that you have a valid PUC certificate to renew your motor insurance policy. </p>
          </div>
          <div class="col-md-5 order-md-1">
            <img class="featurette-image img-fluid mx-auto" src="web/images/index/PUC.jpeg" alt="Generic placeholder image">
          </div>
        </div>

        <hr class="featurette-divider">

        <div class="row featurette">
          <div class="col-md-7">
            <h2 class="featurette-heading">SBI Fastag <span class="text-muted">Cashless payments(Pay online)</span></h2>
            <p class="lead">• Cashless payment – SBI FASTag users don’t need to carry cash for toll transactions, and don’t need to worry about collecting the exact change. <br>
            • Faster transit – Auto-debit of exact amount through the SBI FASTag enables faster transit through the toll plazas and saves time.<br>		
            • Online recharge– SBI FASTag can be recharged online through Credit Card / Debit Card / Net banking/ IMPS etc.<br>
            • SMS alerts– Instant SMS alerts on registered mobile number for toll transactions, low balance, etc. A customer may create personnel Tag account by registering online, and can have the facility of topping up the FASTag account through online modes i.e credit card, debit card, internet banking etc. History of past transactions, available balance in the account etc.</p>
          </div>
          <div class="col-md-5">
            <img class="featurette-image img-fluid mx-auto" src="web/images/index/SBIFASTAG2.jpeg" alt="Generic placeholder image">
            <img class="featurette-image img-fluid mx-auto" src="web/images/index/SBIFASTAG.jpeg" alt="Generic placeholder image">
          </div>
        </div>
        <hr class="featurette-divider">

        <div class="row featurette">
          <div class="col-md-7 order-md-2">
            <h2 class="featurette-heading">Vehicle Tracking System<span class="text-muted">Major constituents of the GPS-based tracking are:-.</span></h2>
            <p class="lead">GPS tracking unit: The device fits into the vehicle and captures the GPS location information apart from other vehicle information at regular intervals to a central server. <!-- Other vehicle information can include fuel amount, engine temperature, altitude, reverse geocoding, door open/close, tire pressure, cut off fuel, turn off ignition, turn on headlight, turn on taillight, battery status, GSM area code/cell code decoded, number of GPS satellites in view, glass open/close, fuel amount, emergency button status, cumulative idling, computed odometer, engine RPM, throttle position, GPRS status and a lot more. Capability of these devices actually decide the final capability of the whole tracking system; most vehicle tracking systems, in addition to providing the vehicle's location data, feature a wide range of communication ports that can be used to integrate other onboard systems, allowing to check their status and control or automate their operation. --><br>
			• GPS tracking server: The tracking server has three responsibilitie are receiving data from the GPS tracking unit, securely storing it, and serving this information on demand to the user.<br>
			• User interface: The UI determines how one will be able to access information, view vehicle data, and elicit important details from it.<br>
			<b> Approx. RS 2,000/piece <br>
                Type- Wired <br>
                Usage/Application- Car <br>
                Minimum Order Quantity- 10 Piece <br>
                Range- Network Range<br>
                Mobile Access- Yes<br>
                Screen Size- 4.3 inch., 6.5 inch, 3.5 inch<br>
                GSM Frequency- 850-1900 MHz
                </b>
		    </p>
          </div>
           <div class="col-md-5 order-md-1">
            <img class="featurette-image img-fluid mx-auto" src="web/images/index/VTD.jpeg" alt="Generic placeholder image">
          </div>
        </div>
        <hr class="featurette-divider">
          <div class="row featurette">
          <div class="col-md-7">
            <h2 class="featurette-heading">HSRP <span class="text-muted"></span></h2>
            <p class="lead"> The Ministry of Road Transport and Highways (MoRTH) has mandated all vehicles to have a high security registration plate (HSRP) that have been sold before April 2019.<br>
            The registration plate comes with a hot-stamped chromium-based hologram of Ashoka Chakra on the top left corner which is blue in colour and precisely measures 20mm x 20mm. At the bottom left corner of the plate is a 10-digit PIN (permanent identification number) that is laser-engraved on the reflective sheet.<br> 
            Similarly, the HSRP also comes with a hot-stamped film applied on the registration numerals and letters bearing the inscription ‘India’ at a 45-degree angle. Once the unique registration is fixed, it is then electronically linked to the vehicle.</p>
          </div>
          <div class="col-md-5">
            <img class="featurette-image img-fluid mx-auto" src="web/images/index/HSRP.jpeg" alt="Generic placeholder image">
             <img class="featurette-image img-fluid mx-auto" src="web/images/index/HSRP2.jpeg" alt="Generic placeholder image">
          </div>
        </div>
         

        <!-- /END THE FEATURETTES -->

      </div><!-- /.container -->


      <!-- FOOTER -->
      <footer class="container">
        <p class="float-right"><a href="#">Back to top</a></p>
        <p>&copy;<b> 2021 All Rights Resevered. <i>Sania Automobile Services.</i></b> &middot; <!-- <a href="#">Privacy</a> &middot; <a href="#">Terms</a> --></p>
      </footer>
    </main>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script type="text/javascript" src="web/vendor/jquery/jquery.min.js"></script>
    <!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script> -->
    <!-- <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script> -->
    <script src="web/vendor/bootstrap-4.0.0/dist/js/popper.min.js"></script>
    <!-- <script src="../../dist/js/bootstrap.min.js"></script> -->
    <script type="text/javascript" src="web/vendor/bootstrap-4.0.0/dist/js/bootstrap.min.js"></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    <script src="web/vendor/bootstrap-4.0.0/dist/js/holder.min.js"></script>
  </body>
</html>
