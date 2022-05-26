<?php
    session_start();
    $conn = mysqli_connect(
        "localhost",
        "root",
        "",
        "torneo"
    ) or die("Errore: ".mysqli_connect_error());
    $nome = $_GET["nome"];
    $query="SELECT idLega from leghe where nome='$nome'";
    $result = mysqli_query($conn,$query);
    if(mysqli_num_rows($result)>0) echo -1;
    else{
        $query="SELECT idLega+1 as num from leghe GROUP by idLega desc limit 1";
        $result = mysqli_query($conn,$query);
        $id=0;
        if(mysqli_num_rows($result)>0)   $id=mysqli_fetch_assoc($result)["num"];
        $query= "INSERT INTO leghe values ($id,'$nome');";
        mysqli_query($conn,$query);
        mysqli_close($conn);
        echo 1;
    }
?>