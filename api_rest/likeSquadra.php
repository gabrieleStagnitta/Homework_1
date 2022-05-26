<?php
    session_start();
    $conn = mysqli_connect(
        "localhost",
        "root",
        "",
        "torneo"
    ) or die("Errore: ".mysqli_connect_error());

    /*
    delimiter //
    create procedure likeFS (IN nickname varchar(25),IN fantaS varchar(25))
    BEGIN
    SET @idAllenatore = (SELECT fantaallenatore.id from fantaallenatore where fantaallenatore.nickname=nickname);
    SET @idSquadra = (SELECT fantasquadra.idFantasquadra from fantasquadra where fantasquadra.nome = fantaS);
    SET @isLiked = ( 
	SELECT count(*) 
    FROM likefantasquadra
    WHERE likefantasquadra.idFantaSquadra = @idSquadra and likefantasquadra.idFantaAllenatore = @idAllenatore);
    IF	@isLiked = 0	 THEN INSERT INTO likefantasquadra values (@idAllenatore,@idSquadra);
    ELSE 				 DELETE FROM likefantasquadra WHERE likefantasquadra.idFantaAllenatore=@idAllenatore and likefantasquadra.idFantaSquadra=@idSquadra;
    END IF;
    END//
    delimiter ;
    */    
    $nickname=$_SESSION["nickname"];
    $squadra=$_GET["squadra"];   
    $query= "CALL likeFS('$nickname','$squadra');";
    mysqli_query($conn,$query);
    mysqli_close($conn);
?>