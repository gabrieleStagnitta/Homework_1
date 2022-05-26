<?php
session_start();
    $nickname = $_SESSION["nickname"];
    $conn = mysqli_connect(
        "localhost",
        "root",
        "",
        "torneo"
    ) or die("Errore: ".mysqli_connect_error());
    $nomeSquadra = $_GET["nomeSquadra"];
    $query= "SELECT count(likefantasquadra.idFantaSquadra) as likes FROM likefantasquadra join fantasquadra on likefantasquadra.idFantaSquadra=fantasquadra.idFantasquadra where fantasquadra.nome='$nomeSquadra';";
    $res = mysqli_query($conn,$query);

    $num = mysqli_fetch_assoc($res)['likes'];

    mysqli_free_result($res);
    mysqli_close($conn);

    echo json_encode($num);
?>