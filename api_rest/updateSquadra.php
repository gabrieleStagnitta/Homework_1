<?php
    session_start();
    $nickname = $_SESSION["nickname"];
    $conn = mysqli_connect(
        "localhost",
        "root",
        "",
        "torneo"
    ) or die("Errore: ".mysqli_connect_error());
    $idCalciatore = $_GET["idCalciatore"];
    $query= "INSERT INTO fs_calciatore VALUES ($idCalciatore,(SELECT idFantasquadra FROM fantaallenatore WHERE nickname='$nickname'))";
    mysqli_query($conn,$query);
    mysqli_close($conn);
?>