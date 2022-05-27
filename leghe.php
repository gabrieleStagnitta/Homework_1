<?php
  session_start();
  if(!isset($_SESSION["nickname"])){
    header("Location: login.php");
    exit;
  }
  $nickname = $_SESSION["nickname"];
  $conn = mysqli_connect(
    "localhost",
    "root",
    "",
    "torneo"
  ) or die("Errore: ".mysqli_connect_error());
  $query= "SELECT fantaallenatore.idFantasquadra as id FROM fantaallenatore where fantaallenatore.nickname = '$nickname' ";
  $res = mysqli_query($conn,$query);
  mysqli_close($conn);
  if(mysqli_fetch_assoc($res)['id'] == NULL){
    header("Location: creaFantaSquadra.php");
    exit;
  }
?>

<html>
    <head>
        <script src='leghe.js' defer></script>
        <link rel="stylesheet" href="mainStyle.css">
        <link rel="stylesheet" href="contentPage.css">
        <link rel="stylesheet" href="tables.css">
        <link rel="stylesheet" href="navdiv.css">
        <link rel="stylesheet" href="modal.css">
    </head>
    <body>
      <div class="multi-button">
        <button class="multi-button_button" onclick="location.href='podcast.php';">Podcast</button>
        <button class="multi-button_button" onclick="location.href='index.php';">Home</button>
        <button class="multi-button_button" onclick="location.href='logout.php';">Logout</button>
      </div>
      <div class="box">
        <div>
            <h3 id="nomeSquadra"></h3>
            <input type="button" onclick="location.href='formazione.php';" value="Guarda la tua formazione"></input>
            <input type="button" id="go" value="Crea lega"></input>
        </div>
        <h1>Leghe</h1>
        <div id="leghe">
        </div>
      </div>

      <div id="myModal" class="modal">
        <div class="modal-content">
          <span class="close">&times;</span>
          <div id="modal">
			    </div>
        </div>
      </div>
    </body>
</html>