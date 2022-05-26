<?php
    session_start();
    $nickname = $_SESSION["nickname"];
    $conn = mysqli_connect(
        "localhost",
        "root",
        "",
        "torneo"
    ) or die("Errore: ".mysqli_connect_error());
    $idCalciatore= $_GET["idCalciatore"];
    $query= "DELETE FROM fs_calciatore WHERE idCalciatore = $idCalciatore";
    mysqli_query($conn,$query);
    mysqli_close($conn);
?>