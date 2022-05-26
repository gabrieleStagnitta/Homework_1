<?php
    session_start();
    $nickname = $_SESSION["nickname"];
    $conn = mysqli_connect(
        "localhost",
        "root",
        "",
        "torneo"
    ) or die("Errore: ".mysqli_connect_error());
    $id = $_GET["id"];
    $query="select iscrizionelega.idFantasquadra from iscrizionelega join fantaallenatore on iscrizionelega.idFantasquadra=fantaallenatore.idFantasquadra where fantaallenatore.nickname='$nickname' and iscrizionelega.idLega=$id;";
    $res=mysqli_query($conn,$query);
    mysqli_close($conn);
    if(mysqli_num_rows($res)==0)    echo -1;
    else                            echo 1;
?>