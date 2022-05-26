<?php
if(isset($_GET["nomeSquadra"])){
    $conn = mysqli_connect(
        "localhost",
        "root",
        "",
        "torneo"
    ) or die("Errore: ".mysqli_connect_error());
    $nomeSquadra = mysqli_real_escape_string($conn,$_GET["nomeSquadra"]);
    /*
        Chiamo la procedura nuovoTeam:

        delimiter //
        CREATE PROCEDURE nuovoTeam (IN nickname varchar(25), IN nomeSquadra varchar(25))
        BEGIN
	        DECLARE num int DEFAULT 0;
            SET num = 1 + (SELECT fantasquadra.idFantasquadra from fantasquadra GROUP by fantasquadra.idFantasquadra desc limit 1);
	        INSERT INTO fantasquadra
    	        VALUES (num,nomeSquadra,500);
	        UPDATE fantaallenatore
    	        SET fantaallenatore.idFantasquadra = num
                WHERE fantaallenatore.nickname = nickname;
        END//
        delimiter ; 
    */
    session_start();
    $nickname=$_SESSION["nickname"];
    $query = "CALL nuovoTeam('$nickname','$nomeSquadra');";
    mysqli_query($conn,$query);
    $query ="SELECT COUNT(fantasquadra.idFantasquadra) as res FROM fantasquadra WHERE fantasquadra.nome = $nomeSquadra";
    $res=mysqli_query($conn,$query);
    echo $res;
    if(mysqli_fetch_assoc($res)['res']>1)   echo true;
    else                                    echo false;
    mysqli_close($conn);
}
?>