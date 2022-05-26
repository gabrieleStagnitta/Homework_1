<?php
    session_start();
    $nickname = $_SESSION["nickname"];
    $conn = mysqli_connect(
        "localhost",
        "root",
        "",
        "torneo"
    ) or die("Errore: ".mysqli_connect_error());
    $query="";
    $nome="";
    if(isset($_GET['nome']))   $nome=$_GET['nome'];
    if(!isset($_GET['type']))   $query= "SELECT id,nome,ruolo,squadra,quotazione FROM calciatore WHERE calciatore.id not in (SELECT fs_calciatore.idCalciatore FROM fs_calciatore join fantaallenatore on fs_calciatore.idFantaSquadra = fantaallenatore.idFantasquadra where fantaallenatore.nickname = '$nickname') order by squadra,ruolo,nome";
    else if($_GET['type'] == 1) $query= "SELECT id,nome,ruolo,squadra,quotazione FROM calciatore WHERE calciatore.nome LIKE '%$nome%' and calciatore.id not in (SELECT fs_calciatore.idCalciatore FROM fs_calciatore join fantaallenatore on fs_calciatore.idFantaSquadra = fantaallenatore.idFantasquadra where fantaallenatore.nickname = '$nickname') order by squadra,ruolo,nome";
    else                        $query= "SELECT id,nome,ruolo,squadra,quotazione FROM calciatore WHERE calciatore.squadra LIKE '%$nome%' and calciatore.id not in (SELECT fs_calciatore.idCalciatore FROM fs_calciatore join fantaallenatore on fs_calciatore.idFantaSquadra = fantaallenatore.idFantasquadra where fantaallenatore.nickname = '$nickname') order by squadra,ruolo,nome";                      
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