function uploadFile() {

    var files = document.getElementById("file").files;
 
    if(files.length > 0 ){
 
       var formData = new FormData();
       formData.append("file", files[0]);
        fetch("uploadPhoto.php",{
            method:"post",
            body:formData
        }).then(response => response.text())
        .then(text => {
            if(text!=1) alert("Inserimento non avvenuto con successo");
        });
    }else{
       alert("Please select a file");
    }
}

function createTeam(event){
    event.preventDefault();
    if(signForm.nomeSquadra.value.length == 0){
        alert("Compilare tutti i campi");
        event.preventDefault();
    }
    else if(signForm.nomeSquadra.value.length>=25){
        alert("Nome troppo lungo");
        event.preventDefault();
    }
    else{
        fetch("http://localhost/homework1/api_rest/uploadTeam.php?nomeSquadra="+signForm.nomeSquadra.value)
            .then(response => response.text())
            .then(text => { if(true) uploadFile();});
    }
}

const signForm = document.forms['createTeam'];
signForm.addEventListener('submit',createTeam);