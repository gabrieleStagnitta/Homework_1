<?php
    //tipo 1 ordina per squadra, cerca per nome
    //tipo 2 ordina per nome, cerca per nome
    //tipo 3 ordina per crediti, cerca per nome
    //tipo 4 ordina per ruolo, cerca per nome
    //tipo 5 ordina per squadra, cerca per squadra
    //tipo 6 ordina per nome, cerca per squadra
    //tipo 7 ordina per crediti, cerca per squadra
    //tipo 8 ordina per ruolo, cerca per squadra
    session_start();
    $nickname = $_SESSION["nickname"];
    $conn = mysqli_connect(
        "localhost",
        "root",
        "",
        "torneo"
    ) or die("Errore: ".mysqli_connect_error());
    $query="SELECT id,nome,ruolo,squadra,quotazione FROM calciatore WHERE calciatore.id not in (SELECT fs_calciatore.idCalciatore FROM fs_calciatore join fantaallenatore on fs_calciatore.idFantaSquadra = fantaallenatore.idFantasquadra where fantaallenatore.nickname = '$nickname') ";
    if(isset($_GET['nome']) && isset($_GET['type'])){
        $nome=$_GET['nome'];
        $type=$_GET['type'];
        if($query!=""){
            if($type<5)         $query=$query."and calciatore.nome LIKE '%$nome%' ";
            else if($type>=5)   $query=$query."and calciatore.squadra LIKE '%$nome%' ";
            switch($type){
                case 1:
                case 5:
                    $query=$query."order by squadra,ruolo,nome,quotazione;";
                    break;
                case 2:
                case 6:
                    $query=$query."order by nome,ruolo,squadra,quotazione;";
                    break;
                case 3:
                case 7:
                    $query=$query."order by quotazione,ruolo,nome,squadra;";
                    break;
                case 4:
                case 8:
                    $query=$query."order by ruolo,squadra,nome,quotazione;";
                    break;
                default:
                    $query=$query."order by squadra,ruolo,nome,quotazione;";
            }           
        }       
    }
    else    $query=$query."order by squadra,ruolo,nome,quotazione;";                               
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