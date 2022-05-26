<?php
    $conn = mysqli_connect(
        "localhost",
        "root",
        "",
        "torneo"
    ) or die("Errore: ".mysqli_connect_error());
    $query= "SELECT fantasquadra.nome as nome,fantaallenatore.nickname as nickname FROM fantasquadra join fantaallenatore on fantasquadra.idFantasquadra=fantaallenatore.idFantasquadra";
    $res = mysqli_query($conn,$query);

    $squadra = array();
    while($row = mysqli_fetch_assoc($res))
    {
        $squadra[] = $row;
    }

    mysqli_free_result($res);
    mysqli_close($conn);

    echo json_encode($squadra);
?>