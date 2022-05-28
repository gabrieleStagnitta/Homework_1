<?php
    session_start();
      
    $conn = mysqli_connect(
        "localhost",
        "root",
        "",
        "torneo"
    ) or die("Errore: ".mysqli_connect_error());
    
    if(isset($_GET["nickname"]))    $nickname = $_GET["nickname"];
    else                            $nickname = $_SESSION["nickname"];
    $query="SELECT id,nome,ruolo,squadra,quotazione FROM calciatore where calciatore.id in (SELECT fs_calciatore.idCalciatore from fs_calciatore where fs_calciatore.idFantaSquadra in( SELECT fantaallenatore.idFantasquadra FROM fantaallenatore where fantaallenatore.nickname = '$nickname' ) ) ";
    if(isset($_GET["type"])){
        $type=$_GET["type"];
        switch($type){
            case 1:
                $query=$query."order by squadra,ruolo,nome,quotazione;";
                break;
            case 2:
                $query=$query."order by nome,ruolo,squadra,quotazione;";
                break;
            case 3:
                $query=$query."order by quotazione,ruolo,nome,squadra;";
                break;
            case 4:
                $query=$query."order by ruolo,squadra,nome,quotazione;";
                break;
            default:
                $query=$query."order by squadra,ruolo,nome,quotazione;";
        }
    }
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