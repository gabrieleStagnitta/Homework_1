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
    const div = document.getElementById("squadra");
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
    tr.appendChild(thRuolo);
    thNome.innerText="Nome";
    tr.appendChild(thNome);
    thSquadra.innerText="Squadra";
    tr.appendChild(thSquadra);
    thValore.innerText="Valore";
    tr.appendChild(thValore);
    thDelete.innerText="RIMUOVI CALCIATORE";
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
}


function getCalciatori(){
    fetch("http://localhost/homework1/api_rest/getCalciatoriSquadra.php")
    .then(response => response.json())
    .then(data => printCalciatori(data));
}

fetch("http://localhost/homework1/api_rest/getNomeSquadra.php")
    .then(response => response.json())
    .then(data => {
        document.getElementById("nickname").innerHTML = "Nickname: "+data[1];
        document.getElementById("nomeSquadra").innerHTML = "Nome squadra: "+data[0];
    });
getCalciatori();


