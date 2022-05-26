function checkFileExist(urlToFile) {
    var xhr = new XMLHttpRequest();
    xhr.open('HEAD', urlToFile, false);
    xhr.send();
     
    if (xhr.status == "404") {
        return false;
    } else {
        return true;
    }
}

function likeSquadra(event){
    //trovare corrispondenza tra pulsante like e p con numero di like
    const evento= event.currentTarget;
    fetch("http://localhost/homework1/api_rest/likeSquadra.php?squadra=" + event.currentTarget.dataset.squadra);
    fetch("http://localhost/homework1/api_rest/teamHaveLike.php?squadra="+event.currentTarget.dataset.squadra)
        .then(response => response.json())
        .then(data => likeManager(data,evento));
}


function likeManager(data,like){
    setNumLike(like.dataset.squadra);
    if(data){
        //like.style.background='#00FF00';
        like.textContent= "Unlike";
    }
    else{
        //like.style.background='#FF0000';
        like.textContent= "Like";
    }
}

function addLikeButton(nomeSquadra){
    const like=document.createElement("button");
    like.textContent="Like";
    like.dataset.squadra = nomeSquadra;
    like.id="button"+nomeSquadra;
    like.classList.add("like");
    like.addEventListener("click", likeSquadra);
    fetch("http://localhost/homework1/api_rest/teamHaveLike.php?squadra="+nomeSquadra)
        .then(response => response.json())
        .then(data => likeManager(data,like));
    return like;
}

function setNumLike(nomeSquadra){
    fetch("http://localhost/homework1/api_rest/getNumLike.php?nomeSquadra="+nomeSquadra)
        .then(response => response.json())
        .then(data => document.getElementById("numLike"+nomeSquadra).textContent="Like: "+data);
}

function printCalciatori(calciatori,nomeSquadra){
    const tbody = document.getElementById("body"+nomeSquadra);
    tbody.innerHTML = '';
    for(let calciatore of calciatori)
    {
        const tr=document.createElement("tr");
        const tdRuolo=document.createElement("td");
        const tdNome=document.createElement("td");
        const tdSquadra=document.createElement("td");
        const tdValore=document.createElement("td");

        tdRuolo.textContent = calciatore.ruolo;
        tdNome.textContent = calciatore.nome;
        tdSquadra.textContent = calciatore.squadra;
        tdValore.textContent = calciatore.quotazione;

        tr.appendChild(tdRuolo);
        tr.appendChild(tdNome);
        tr.appendChild(tdSquadra);
        tr.appendChild(tdValore);

        tbody.appendChild(tr);
    }
}

function printSquadre(squadre){
    const div = document.getElementById("squadre");
    for(let squadra of squadre){

        const teamDiv=document.createElement("div");
        teamDiv.id="div"+squadra.nome;
        teamDiv.classList.add("table-wrapper");

        const profileDiv = document.createElement("div");
        profileDiv.classList.add("profileDiv");

        const nomeSquadra= document.createElement("h1");
        nomeSquadra.textContent = squadra.nome;

        const logo = document.createElement("img");
        if(!checkFileExist("upload/logos/"+squadra.nome+".jpg"))    logo.src = "upload/logos/default.jpg"
        else                                                        logo.src = "upload/logos/"+squadra.nome+".jpg";
        logo.classList.add("logo");

        const like = addLikeButton(squadra.nome);
        const numLike = document.createElement("p");
        
        numLike.textContent;
        numLike.dataset.squadra = squadra.nome;
        numLike.id="numLike"+squadra.nome;
        setNumLike(squadra.nome);

        profileDiv.appendChild(logo);
        profileDiv.appendChild(nomeSquadra);
        profileDiv.appendChild(numLike);
        profileDiv.appendChild(like);

        const table=document.createElement("table");
        table.classList.add("fl-table");
        const thead=document.createElement("thead");
        const tr=document.createElement("tr");
        const thRuolo=document.createElement("th");
        const thNome=document.createElement("th");
        const thSquadra=document.createElement("th");
        const thValore=document.createElement("th");
        const tbody=document.createElement("tbody");
        thRuolo.innerText="Ruolo";
        tr.appendChild(thRuolo);
        thNome.innerText="Nome";
        tr.appendChild(thNome);
        thSquadra.innerText="Squadra";
        tr.appendChild(thSquadra);
        thValore.innerText="Valore";
        tr.appendChild(thValore);
        thead.appendChild(tr);
        table.appendChild(thead);
        
        tbody.id="body"+squadra.nome;
        table.appendChild(tbody);

        fetch("http://localhost/homework1/api_rest/getCalciatoriSquadra.php?nickname="+squadra.nickname)
            .then(response => response.json())
            .then(data => printCalciatori(data,squadra.nome));

        teamDiv.appendChild(profileDiv);
        teamDiv.appendChild(table);

        div.appendChild(teamDiv);
    }
}

fetch("http://localhost/homework1/api_rest/getNomiSquadre.php")
    .then(response => response.json())
    .then(data => printSquadre(data));