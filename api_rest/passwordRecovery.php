<?php
    session_start();
    $conn = mysqli_connect(
        "localhost",
        "root",
        "",
        "torneo"
    ) or die("Errore: ".mysqli_connect_error());
    // $nickname = mysqli_real_escape_string($conn,$_POST["nickname"]);
    // $newPassword=password_hash(mysqli_real_escape_string($conn,$_POST["password"]),PASSWORD_BCRYPT);
    $content = trim(file_get_contents("php://input"));
    $_arr = json_decode($content,true);
    $nickname = mysqli_real_escape_string($conn,$_arr["nickname"]);
    $newPassword= mysqli_real_escape_string($conn,$_arr["password"]);
    $query= "SELECT fantaallenatore.password as pass FROM fantaallenatore WHERE fantaallenatore.nickname='$nickname';";
    $res = mysqli_query($conn,$query);
    if(mysqli_num_rows($res)<=0)    echo -2;
    else if(password_verify($newPassword,mysqli_fetch_assoc($res)["pass"])) echo -1;
    else{
        $newPassword=password_hash($newPassword,PASSWORD_BCRYPT);
        $query= "UPDATE fantaallenatore SET fantaallenatore.password='$newPassword' WHERE fantaallenatore.nickname='$nickname'";
        mysqli_query($conn,$query);
        $_SESSION["nickname"]=$nickname;
        echo 1;
    }
    mysqli_free_result($res);
    mysqli_close($conn);
?>