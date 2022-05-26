<?php

    session_start();
    $conn = mysqli_connect(
        "localhost",
        "root",
        "",
        "torneo"
    ) or die("Errore: ".mysqli_connect_error());

    

    $nickname=$_SESSION["nickname"];
    $squadra=$_GET["squadra"];   
    $query= "SELECT count(*) as l from likefantasquadra where likefantasquadra.idFantaSquadra in (select fantasquadra.idFantasquadra from fantasquadra where fantasquadra.nome='$squadra') and likefantasquadra.idFantaAllenatore in (select fantaallenatore.id from fantaallenatore where fantaallenatore.nickname='$nickname');";
    $res=mysqli_query($conn,$query);
    mysqli_close($conn);
    $isLiked=true;
    if(mysqli_fetch_assoc($res)['l']==0)  $isLiked=false;
    echo json_encode($isLiked);
?>