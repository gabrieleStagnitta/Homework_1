<?php
    session_start();
    $conn = mysqli_connect(
        "localhost",
        "root",
        "",
        "torneo"
    ) or die("Errore: ".mysqli_connect_error());
    $nickname = $_GET["nickname"];
    $query= "SELECT COUNT(*) as c from fantaallenatore where nickname='$nickname'";
    $res = mysqli_query($conn,$query);
    if(mysqli_fetch_assoc($res)["c"]==0)       echo json_encode(false);
    else                                    echo json_encode(true);

    mysqli_free_result($res);
    mysqli_close($conn);    
?>