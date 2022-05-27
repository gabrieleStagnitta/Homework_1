<?php
  session_start();
  $conn = mysqli_connect(
    "localhost",
    "root",
    "",
    "torneo"
  ) or die("Errore: ".mysqli_connect_error());
  if(!isset($_SESSION["nickname"])){
    header("Location: login.php");
    exit;
  }
  if(isset($_POST["nomeSquadra"])){
    $nome=$_POST["nomeSquadra"];
    $query="SELECT * from fantasquadra where fantasquadra.nome='$nome'";
    $res = mysqli_query($conn,$query);
    mysqli_close($conn);
    if(mysql_num_rows($res)>=1) $sameName=true;
    else                        unset($sameName);
  }
  $nickname = $_SESSION["nickname"];
  
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
    <link rel="stylesheet" href="creaFantaSquadra.css">
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
      <h1 class="title">Crea la tua squadra!</h1>
        <form name="createTeam" method='post'>
          <div class="internal">
            <div>
              <label for="nomeSquadra">Nome squadra:</label>
              <input type="text" name="nomeSquadra">
            </div>
            <?php
                if(isset($sameName))
                    echo "<p> Nome già in uso </p>";
            ?>
            <div>
            <label for="file"> Logo:</label> <input type="file" name="file" id="file">
            </div>
            <label>&nbsp;<input type="submit" value="Invia i dati" id="uploadfile"></label>
          </div>
        </form>
    </body>
</html>