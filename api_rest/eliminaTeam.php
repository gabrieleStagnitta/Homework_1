<?php 
    session_start();
    
    $nickname = $_SESSION["nickname"];
    $conn = mysqli_connect(
        "localhost",
        "root",
        "",
        "torneo"
    ) or die("Errore: ".mysqli_connect_error());
    /*
    delimiter //
    CREATE PROCEDURE eliminaTeam(IN nick varchar(255))
    BEGIN
        SET @idSquadra = (SELECT fantaallenatore.idFantasquadra FROM fantaallenatore WHERE fantaallenatore.nickname=nick);
        UPDATE fantaallenatore SET fantaallenatore.idFantasquadra = NULL WHERE fantaallenatore.nickname=nick;
        DELETE FROM fantasquadra WHERE fantasquadra.idFantasquadra=@idSquadra;
        DELETE FROM likefantasquadra WHERE likefantasquadra.idFantaSquadra=@idSquadra;
        DELETE FROM fs_calciatore WHERE fs_calciatore.idFantaSquadra=@idSquadra;
        DELETE FROM iscrizionelega where iscrizionelega.idFantasquadra=@idSquadra;
    END//
    DELIMITER ;
    */
    $query= "call eliminaTeam('$nickname')";
    mysqli_query($conn,$query);
    
    //vado ad eliminare il logo della squadra
    $query="SELECT fantasquadra.nome as nome from fantasquadra join fantaallenatore on fantasquadra.idFantasquadra=fantaallenatore.idFantasquadra  where fantaallenatore.nickname='$nickname';";    
    $res=mysqli_query($conn,$query);
    $nome=mysqli_fetch_assoc($res)['nome'];
    $curDir=dirname(getcwd());
    $filename="$curDir/upload/logos/$nome.jpg";
    echo $filename;
    unlink($filename);
    mysqli_close($conn);
?>