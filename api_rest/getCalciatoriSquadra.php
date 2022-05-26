<?php
    session_start();
    if(isset($_GET["nickname"]))    $nickname = $_GET["nickname"];
    else                            $nickname = $_SESSION["nickname"];   
    $conn = mysqli_connect(
        "localhost",
        "root",
        "",
        "torneo"
    ) or die("Errore: ".mysqli_connect_error());
    $query = "SELECT id,nome,ruolo,squadra,quotazione FROM calciatore where calciatore.id in (SELECT fs_calciatore.idCalciatore from fs_calciatore where fs_calciatore.idFantaSquadra in( SELECT fantaallenatore.idFantasquadra FROM fantaallenatore where fantaallenatore.nickname = '$nickname' ) )order by ruolo,quotazione,squadra,nome;";
    $res = mysqli_query($conn,$query);
    $calciatori = array();
    while($row = mysqli_fetch_assoc($res))
    {
        $calciatori[] = $row;
    }

    mysqli_free_result($res);
    mysqli_close($conn);
    echo json_encode($calciatori);
?>