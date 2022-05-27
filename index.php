<?php
  session_start();
  if(!isset($_SESSION["nickname"])){
    header("Location: login.php");
    exit;
  }
?>

<html>
  <head>
    <meta charset="utf-8">
    <title>Homework1</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src='index.js' defer></script>
    <link rel="stylesheet" href="navdiv.css">
    <link rel="stylesheet" href="mainStyle.css">
    <link rel="stylesheet" href="tables.css">
    <link rel="stylesheet" href="navdiv.css">
  </head>
  <body>
  <div class="navdiv">
    <div class="multi-button">
      <button class="multi-button_button" onclick="location.href='podcast.php';">Podcast</button>
      <button class="multi-button_button" onclick="location.href='formazione.php';">La mia squadra</button>
      <button class="multi-button_button" onclick="location.href='logout.php';">Logout</button>
    </div>
  </div>
    <section>
        <h1 class="title">SQUADRE</h1>
        <div id="squadre">
        </div>
    </section>
  </body>
</html>