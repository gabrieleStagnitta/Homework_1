function deleteTeam(){
    if(confirm("Sei sicuro di volere cancellare la tua squadra?")){
        fetch("http://localhost/homework1/api_rest/eliminaTeam.php");
        location.href='index.php';        
    }
}

function rimuoviDallaRosa(event){
    fetch("http://localhost/homework1/api_rest/rimuoviCalciatore.php?idCalciatore=" + event.currentTarget.dataset.idCalciatore).then(getCalciatori);
}

function printCalciatori(calciatori){
    const div = document.getElementById("Squadra");
    div.innerHTML="";
    const teamDiv=document.createElement("div");
    teamDiv.id="div";
    teamDiv.classList.add("table-wrapper");

    const table=document.createElement("table");
    table.classList.add("fl-table");
    const thead=document.createElement("thead");
    const tr=document.createElement("tr");
    const thRuolo=document.createElement("th");
    const thNome=document.createElement("th");
    const thSquadra=document.createElement("th");
    const thValore=document.createElement("th");
    const thDelete=document.createElement("th");
    const tbody=document.createElement("tbody");
    
    thRuolo.innerText="Ruolo";
    thRuolo.addEventListener("click",getCalciatori);
    thRuolo.id="ruolo";
    tr.appendChild(thRuolo);

    thNome.innerText="Nome";
    thNome.addEventListener("click",getCalciatori);
    thNome.id="nome";
    tr.appendChild(thNome);

    thSquadra.innerText="Squadra";
    thSquadra.addEventListener("click",getCalciatori);
    thSquadra.id="squadra";
    tr.appendChild(thSquadra);

    thValore.innerText="Valore";
    thValore.addEventListener("click",getCalciatori);
    thValore.id="valore";
    tr.appendChild(thValore);

    thDelete.innerText="Rimuovi calciatore";
    tr.appendChild(thDelete);
    
    thead.appendChild(tr);
    table.appendChild(thead);
    
    tbody.id="body";
    table.appendChild(tbody);

    for(let calciatore of calciatori)
    {
        const tr=document.createElement("tr");
        const tdRuolo=document.createElement("td");
        const tdNome=document.createElement("td");
        const tdSquadra=document.createElement("td");
        const tdValore=document.createElement("td");
        const tdDelete=document.createElement("td");

        tdRuolo.textContent = calciatore.ruolo;
        tdNome.textContent = calciatore.nome;
        tdSquadra.textContent = calciatore.squadra;
        tdValore.textContent = calciatore.quotazione;
        tdDelete.dataset.idCalciatore = calciatore.id;
        tdDelete.addEventListener("click", rimuoviDallaRosa);
        tdDelete.classList.add("delete");
        tdDelete.textContent="x";
        tr.appendChild(tdRuolo);
        tr.appendChild(tdNome);
        tr.appendChild(tdSquadra);
        tr.appendChild(tdValore);
        tr.appendChild(tdDelete);

        tbody.appendChild(tr);
    }

    teamDiv.appendChild(table);

    div.appendChild(teamDiv);
    document.getElementById(target).innerText+=" ⇊ ";
    
}


function getCalciatori(event){
    //tipo 1 ordina per squadra
    //tipo 2 ordina per nome
    //tipo 3 ordina per crediti
    //tipo 4 ordina per ruolo
    if(!(typeof event === 'undefined')){
        target=event.target.id;
        if(event.target.id=="squadra"){
            type=1;
        }
        else if(event.target.id=="nome"){
            type=2;
        }
        else if(event.target.id=="valore"){
            type=3;
        }
        else if(event.target.id=="ruolo"){
            type=4;
        }
    }
    fetch("http://localhost/homework1/api_rest/getCalciatoriSquadra.php?type="+type)
    .then(response => response.json())
    .then(data => printCalciatori(data));
}

fetch("http://localhost/homework1/api_rest/getNomeSquadra.php")
    .then(response => response.json())
    .then(data => {
        document.getElementById("title").innerHTML = data[0]+", di "+data[1];
    });

let type=1;
let target="squadra";    
getCalciatori();


