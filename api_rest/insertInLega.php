<?php
    session_start();
    $nickname = $_SESSION["nickname"];
    $conn = mysqli_connect(
        "localhost",
        "root",
        "",
        "torneo"
    ) or die("Errore: ".mysqli_connect_error());
    $lega = $_GET["lega"];
    if(isset($_GET["enter"])) $query= "INSERT into iscrizionelega VALUES ((select fantaallenatore.idFantasquadra from fantaallenatore where fantaallenatore.nickname='$nickname'),$lega)";
    else                      $query= "DELETE from iscrizionelega where iscrizionelega.idFantasquadra = (select fantaallenatore.idFantasquadra from fantaallenatore where fantaallenatore.nickname='$nickname')  and iscrizionelega.idLega=$lega;";
    mysqli_query($conn,$query);
    mysqli_close($conn);
?>