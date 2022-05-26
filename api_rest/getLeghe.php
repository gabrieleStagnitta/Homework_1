<?php
    $conn = mysqli_connect(
        "localhost",
        "root",
        "",
        "torneo"
    ) or die("Errore: ".mysqli_connect_error());
    $query= "select * from leghe";
    $res = mysqli_query($conn,$query);

    $leghe = array();
    while($row = mysqli_fetch_assoc($res))
    {
        $leghe[] = $row;
    }
    echo json_encode($leghe);
?>