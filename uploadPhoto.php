<?php

if(isset($_FILES['file']['name'])){
   // file name
   $filename = $_FILES['file']['name'];

   // file extension
   $file_extension = pathinfo($filename, PATHINFO_EXTENSION);
   $file_extension = strtolower($file_extension);
   
   // Valid extensions
   $valid_ext = array("jpg","png","jpeg");

   $response = 0;
   if(in_array($file_extension,$valid_ext)){
      // Upload file
      $conn = mysqli_connect(
         "localhost",
         "root",
         "",
         "torneo"
      ) or die("Errore: ".mysqli_connect_error());
      session_start();
      $nickname=$_SESSION["nickname"];
      $query = "SELECT fantasquadra.nome as nome from fantaallenatore join fantasquadra on fantasquadra.idFantasquadra=fantaallenatore.idFantasquadra where fantaallenatore.nickname='$nickname'";
      $res = mysqli_query($conn,$query);
      $nome = mysqli_fetch_assoc($res)['nome'];
      mysqli_close($conn);
      $location = "upload/logos/$nome.jpg";
      //$location = "upload/logos/$nome.".$file_extension;
      if(move_uploaded_file($_FILES['file']['tmp_name'],$location)){
         $response = 1;
      } 
   }
   echo $response;
   exit;
}
?>