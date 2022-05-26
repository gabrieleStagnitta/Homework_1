function haveMarks(signPassword){
    for(let mark of marks){
        if(signPassword.includes(mark)) return true;
    }
    return false;
}

function hasLowerCase(str){
    return str.toUpperCase() != str;
}

function hasUpperCase(str){
    return str.toLowerCase() != str;
}

function validazioneSign(event){
    if(signForm.signName.value.length == 0 || signForm.signNickname.value.length == 0 || signForm.signPassword.value.length == 0 || signForm.signPasswordCheck.value.length == 0){
        alert("Compilare tutti i campi");
        event.preventDefault();
    }
    else if(signForm.signPassword.value != signForm.signPasswordCheck.value){
        alert("I campi password non corrispondono");
        event.preventDefault();
    }
    else if(signForm.signPassword.value.length < 5 || signForm.signPassword.value.length > 10){
        alert("La password deve essere lunga tra i 5 e i 9 caratteri");
        event.preventDefault();
    }
    else if(!hasLowerCase(signForm.signPassword.value) || !hasUpperCase(signForm.signPassword.value)){
        alert("La password deve avere almeno una lettera maiuscola e una minuscola");
        event.preventDefault();
    }
    else if(!haveMarks(signForm.signPassword.value)){
        let str="La password deve contenere almeno uno dei seguenti caratteri: ";
        for(let mark of marks){
            str += mark +" ";
        }
        alert(str);
        event.preventDefault();
    }
}

function checkNick(data){
    document.getElementById("errSigNick").hidden=!data;   
}

function checkIfExists(event){
    fetch("http://localhost/homework1/api_rest/checkNickname.php?nickname="+event.target.value)
            .then(response => response.json())
            .then(data => checkNick(data));
}

const marks = new Array('.','!','#','?','%','$');
const signForm = document.forms['signup'];
signForm.addEventListener('submit',validazioneSign);

const input = document.getElementById("sigNickname");
input.addEventListener('input',checkIfExists);