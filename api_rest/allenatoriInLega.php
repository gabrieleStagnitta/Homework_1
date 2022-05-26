<?php
    session_start();
    $conn = mysqli_connect(
        "localhost",
        "root",
        "",
        "torneo"
    ) or die("Errore: ".mysqli_connect_error());
    $id = $_GET["id"];
    $query="SELECT fantaallenatore.nickname as nickname, fantasquadra.nome as nomeSquadra from fantaallenatore join fantasquadra on fantaallenatore.idFantasquadra=fantasquadra.idFantasquadra join iscrizionelega on iscrizionelega.idFantasquadra=fantasquadra.idFantasquadra where iscrizionelega.idLega=$id";
    $result = mysqli_query($conn,$query);
    if(mysqli_num_rows($result)<=0) echo -1;
    else{
        $output = array();
        while($row = mysqli_fetch_assoc($result))
        {
            $output[] = $row;
        }
        echo json_encode($output);
    }
?>