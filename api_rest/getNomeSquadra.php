<?php
    session_start();
    $nickname = $_SESSION["nickname"];
    $conn = mysqli_connect(
        "localhost",
        "root",
        "",
        "torneo"
    ) or die("Errore: ".mysqli_connect_error());
    $query= "SELECT fantasquadra.NOME as nome from fantasquadra where fantasquadra.idFantasquadra in (SELECT fantaallenatore.idFantasquadra from fantaallenatore where fantaallenatore.nickname='$nickname');";
    $res = mysqli_query($conn,$query);
    $nome = mysqli_fetch_assoc($res)['nome'];
    mysqli_free_result($res);
    mysqli_close($conn);
    
    echo json_encode([$nome,$nickname]);
?>