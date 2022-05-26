<?php
    session_start();
    //-----------------------------LOGIN-------------------------------------------------------------
    if(isset($_POST["logNickname"]) && isset($_POST["logPassword"])){
        $conn = mysqli_connect(
            "localhost",
            "root",
            "",
            "torneo"
        ) or die("Errore: ".mysqli_connect_error());
        $nickname = mysqli_real_escape_string($conn,$_POST["logNickname"]);
        $password = mysqli_real_escape_string($conn,$_POST["logPassword"]);
        $query = "SELECT nickname,password FROM fantaallenatore WHERE nickname='$nickname'";
        $res = mysqli_query($conn,$query);
        mysqli_close($conn);
        if(mysqli_num_rows($res) <= 0)
            $nickErr=true;
        else{
            if(!password_verify($password,mysqli_fetch_assoc($res)["password"]))
                $nickErr=true;
            else{
                mysqli_free_result($res);
                $_SESSION["nickname"] = $_POST["logNickname"];
                header("Location: index.php");
                exit;
            }
        }
    }
    //----------------------------------REGISTRAZIONE--------------------------------------------------------
    else if(isset($_POST["signName"]) && isset($_POST["signNickname"]) && isset($_POST["signPassword"])){
        $conn = mysqli_connect(
            "localhost",
            "root",
            "",
            "torneo"
        ) or die("Errore: ".mysqli_connect_error());
        $nome = mysqli_real_escape_string($conn,$_POST["signName"]);
        $nickname = mysqli_real_escape_string($conn,$_POST["signNickname"]);
        $password=password_hash(mysqli_real_escape_string($conn,$_POST["signPassword"]),PASSWORD_DEFAULT);
        //controllo se esistono già altri utenti con lo stesso nome e/o nickname
        
        $query = "SELECT count(nome) as num from fantaallenatore where nome='$nome';";
        $res = mysqli_query($conn,$query);
        $num = mysqli_fetch_assoc($res)['num'];
        if($num>=1) $sameName=true;
        else        unset($sameName);

        $query = "SELECT count(nome) as num from fantaallenatore where nickname='$nickname';";
        $res = mysqli_query($conn,$query);
        $num = mysqli_fetch_assoc($res)['num'];
        if($num>=1) $sameNickname=true; 
        else        unset($sameNickname);

        //conto il numero di utenti già inseriti per ricavarmi l'id
        $query = "SELECT id+1 as num from fantaallenatore GROUP by id desc limit 1";
        $res = mysqli_query($conn,$query);
        $num = mysqli_fetch_assoc($res)['num'];
        mysqli_free_result($res);  
        //effettuo la query per inserire il mio nuovo utente solo se non esiste uno con lo stesso nome e/o nickname
        if($num!=NULL && !(isset($sameName) || isset($sameNickname))){
            $num+=1;
            $query = "INSERT INTO fantaallenatore (id,nome,nickname,password) VALUES ($num,'$nome','$nickname','$password')";
            $res = mysqli_query($conn,$query);
            mysqli_close($conn);
            $_SESSION["nickname"] = $_POST["signNickname"];
            header("Location: index.php");
            exit;
        }   
    }
?>

<html>
  <head>
    <meta charset="utf-8">
    <title>Homework1</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="signup.js" defer></script>
    <script src="login.js" defer></script>
    <?php
        if(isset($nickErr)) echo "<script src='login2.js'defer></script>"
    ?>
    <link rel="stylesheet" href="mainStyle.css">
    <link rel="stylesheet" href="login.css">
    <link rel="stylesheet" href="overlay.css">
    
    </head>
    <body>
    <div class="main">  	
		<input type="checkbox" id="chk" aria-hidden="true">
			<div class="signup">
				<form name="signup" method='post'>
					<label for="chk" aria-hidden="true">Sign up
                        <div id="errSigNick" hidden>
                            <div class="icon"><p class='error'>!</p></div>
                            <div class="info"><p class='error'>Nickname già esistente...</p></div>
                        </div>
                    </label>
                    <input type="text" name="signName" placeholder="Nome">
                    <?php if(isset($sameName)) echo "<p class='error'> Nome già in uso </p>";?>
					<input type="text" id="sigNickname" name="signNickname" placeholder="Nickname">
                    <?php if(isset($sameNickname)) echo "<p class='error'> Nickname già in uso </p>";?>
					<input type="password" name="signPassword" placeholder="Password">
                    <input type="password" name="signPasswordCheck" placeholder="Controllo password">
					<input type="submit" value="Registrati">
				</form>
			</div>

			<div class="login">
				<form name="login" method='post'>
					<label for="chk" aria-hidden="true">Login</label>
					<input type="text" name="logNickname" placeholder="Nickname">
					<input type="password" name="logPassword" placeholder="Password">
                    <?php
                        if(isset($nickErr)) echo "<p class='error'> Nickname o password non corrispondenti... </p>";
                    ?>
					<input type="submit" value="Accedi">
                    <a id="newPassword" title="Nuova password" href="#">Non ricordo la mia password...</a>
				</form>
			</div>
	</div>
    <div class="overlay hidden" id="newPasswordDiv">
    <form name="passwordRecovery" method='post'>
        <label>Recupera password</label>
        <input type="text" name="recNick" placeholder="Nickname">
		<input type="password" name="recPassword" placeholder="Nuova password">
        <input type="password" name="recPasswordCheck" placeholder="Conferma nuova password">
        <input type="submit" value="Cambia">
        <a id="loginBack" title="Torna al login" href="#">Ho cambiato idea...</a>
    </form>
    </div>
    </body>
</html>