<?php
  session_start();
  unset($canCreate);
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
  if(mysqli_fetch_assoc($res)['id'] != NULL){
    header("Location: formazione.php");
    exit;
  }
?>


<html>
  <head>
    <meta charset="utf-8">
    <title>Homework1</title>
    <link rel="stylesheet" href="mainStyle.css">
    <link rel="stylesheet" href="navdiv.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="creaFantaSquadra.js" defer></script>
    </head>
    <body>
    <div class="multi-button">
        <button class="multi-button_button" onclick="location.href='podcast.php';">Podcast</button>
        <button class="multi-button_button" onclick="location.href='index.php';">Home</button>
        <button class="multi-button_button" onclick="location.href='logout.php';">Logout</button>
      </div>
        <form name="createTeam" method='post'>
            <p>
                <label>Nome squadra: <input type="text" name="nomeSquadra"></label>
            </p>
            <?php
                if(isset($sameName))
                    echo "<p> Nome già in uso </p>";
            ?>
            <label> Logo: <input type="file" name="file" id="file"> </label>
            <p>
                <label>&nbsp;<input type="submit" value="Invia i dati" id="uploadfile"></label>
            </p>
        </form>
    </body>
</html>