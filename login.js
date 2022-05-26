function loginValidation(event){
    if(loginForm.logNickname.value.length == 0 || loginForm.logPassword.value.length == 0 ){
        alert("Compilare tutti i campi");
        event.preventDefault();
    }
}

function recoveryValidation(event){
    event.preventDefault();
    if(recoveryForm.recNick.value.length==0 || recoveryForm.recPassword.value.length == 0 || recoveryForm.recPasswordCheck.value.length == 0){
        alert("Compilare tutti i campi");
        event.preventDefault();
    }
    else if(recoveryForm.recPassword.value != recoveryForm.recPasswordCheck.value){
        alert("I campi password non corrispondono...");
        event.preventDefault();        
    }
    else if(recoveryForm.recPassword.value.length < 5 || recoveryForm.recPassword.value.length > 10){
        alert("La password deve essere lunga tra i 5 e i 9 caratteri");
        event.preventDefault();
    }
    else if(!hasLowerCase(recoveryForm.recPassword.value) || !hasUpperCase(recoveryForm.recPassword.value)){
        alert("La password deve avere almeno una lettera maiuscola e una minuscola");
        event.preventDefault();
    }
    else if(!haveMarks(recoveryForm.recPassword.value)){
        let str="La password deve contenere almeno uno dei seguenti caratteri: ";
        for(let mark of marks){
            str += mark +" ";
        }
        alert(str);
        event.preventDefault();
    }
    else{
        const json = JSON.stringify({ 
            nickname: recoveryForm.recNick.value,
            password: recoveryForm.recPassword.value
        });
        fetch("api_rest/passwordRecovery.php",{
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            cache: 'no-cache',
            referrerPolicy: 'no-referrer',
            body: json
        })
        .then(response => response.text())
        .then(err => {
            if(err==-1){
                alert("La password richiesta è stata già utilizzata recentemente");
            }
            else if(err==-2){
                alert("Utente non trovato...");
            }
            else{
                window.location = "index.php";
            }
        });
    }    
}

function recoverPassword(){
    document.getElementById("newPasswordDiv").classList.remove("hidden");
}

function loginBack(){
    document.getElementById("newPasswordDiv").classList.add("hidden");
}

const loginForm = document.forms['login'];
loginForm.addEventListener('submit',loginValidation);

const recoveryForm = document.forms['passwordRecovery'];
recoveryForm.addEventListener('submit',recoveryValidation);

const newPasswordLink = document.getElementById("newPassword");
newPasswordLink.addEventListener("click",recoverPassword);

const loginBackLink=document.getElementById("loginBack");
loginBackLink.addEventListener("click",loginBack);