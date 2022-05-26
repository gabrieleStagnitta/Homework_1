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
        <script src='formazione.js' defer></script>
        <link rel="stylesheet" href="mainStyle.css">
        <link rel="stylesheet" href="contentPage.css">
        <link rel="stylesheet" href="tables.css">
        <link rel="stylesheet" href="navdiv.css">
    </head>
    <body>
      <div class="multi-button">
        <button class="multi-button_button" onclick="location.href='podcast.php';">Podcast</button>
        <button class="multi-button_button" onclick="location.href='index.php';">Home</button>
        <button class="multi-button_button" onclick="location.href='logout.php';">Logout</button>
      </div>
      <div>
          <h3 id="nomeSquadra"></h3>
          <input type="button" onclick="location.href='aggiornaformazione.php';" value="Inserisci nuovi calciatori"/>
          <input type="button" onclick="deleteTeam()" value="Elimina squadra"></input>
          <input type="button" onclick="location.href='leghe.php';" value="Guarda leghe"></input>
      </div>
      <h3>Formazione:</h3>
      <div id="squadra">
      </div>
    </body>
</html>