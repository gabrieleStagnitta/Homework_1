<?php
  session_start();
  if(!isset($_SESSION["nickname"])){
    header("Location: login.php");
    exit;
  }
?>

<html>
    <head>
        <script src='aggiornaformazione.js' defer></script>
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
            <input type="button" onclick="location.href='formazione.php';" value="Ritorna alla tua squadra attuale"/>
        </div>
        <h3>Scegli i calciatori: </h3>
        <div>
          <input placeholder="Cerca per nome calciatore" id="cercaPerNome"/>
          <input placeholder="Cerca per nome squadra" id="cercaPerSquadra"/>
        </div>
        <div id="calciatori">
        </div>
    </body>
</html>