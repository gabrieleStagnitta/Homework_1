<?php
    $curl = curl_init();
    $idShow="7LzisY65hvie8teriI6Ff9";
    $client_id="be0e690012404ea0b693a72dbe7b019f";
    $client_secret="6ff3de266f8f4584b90ddad89db63207";
    curl_setopt($curl, CURLOPT_URL,'https://accounts.spotify.com/api/token');
    curl_setopt($curl, CURLOPT_RETURNTRANSFER,1);
    curl_setopt($curl, CURLOPT_POST,1);
    curl_setopt($curl, CURLOPT_POSTFIELDS,'grant_type=client_credentials'); 
    curl_setopt($curl, CURLOPT_HTTPHEADER,array('Authorization: Basic '.base64_encode($client_id.':'.$client_secret))); 
    $result=curl_exec($curl);
    curl_close($curl);
    $token= json_decode($result)->access_token;
    $curl = curl_init();
    curl_setopt($curl, CURLOPT_URL,'https://api.spotify.com/v1/shows/'.$idShow."/episodes?market=IT&limit=50&offset=0");
    curl_setopt($curl, CURLOPT_HTTPHEADER,array("Accept: application/json","Content-Type: application/json","Authorization: Bearer ".$token)); 
    curl_setopt($curl, CURLOPT_RETURNTRANSFER,1);
    $items=json_decode(curl_exec($curl))->items;
    curl_close($curl);
    $output=[];
    $i=0;
    foreach($items as $item){
        $output[$i]['name']=$item->name;
        $output[$i]['preview']=$item->audio_preview_url;
        $output[$i]['link']=$item->external_urls->spotify;
        $i++; 
    }
    //"https://i.scdn.co/image/ab6765630000ba8a61ad6a1144db5f7e79b480db"
    echo json_encode($output);
?>