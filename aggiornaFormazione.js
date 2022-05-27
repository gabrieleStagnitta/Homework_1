function aggiungiAllaRosa(event)
{
    cercaPerNome.value="";
    cercaPerSquadra.value="";
    fetch("http://localhost/homework1/api_rest/updateSquadra.php?idCalciatore=" + event.currentTarget.dataset.idCalciatore)
        .then(getCalciatori);
}

function printCalciatori(calciatori){
    const div = document.getElementById("calciatori");
    div.innerHTML="";
    const calciatoriDiv=document.createElement("div");
    calciatoriDiv.id="div";
    calciatoriDiv.classList.add("table-wrapper");

    const table=document.createElement("table");
    table.classList.add("fl-table");
    const thead=document.createElement("thead");
    const tr=document.createElement("tr");
    const thRuolo=document.createElement("th");
    const thNome=document.createElement("th");
    const thSquadra=document.createElement("th");
    const thValore=document.createElement("th");
    const thAggiungi=document.createElement("th");
    const tbody=document.createElement("tbody");
    thRuolo.innerText="Ruolo";
    tr.appendChild(thRuolo);
    thNome.innerText="Nome";
    tr.appendChild(thNome);
    thSquadra.innerText="Squadra";
    tr.appendChild(thSquadra);
    thValore.innerText="Valore";
    tr.appendChild(thValore);
    thAggiungi.innerText="Aggiungi calciatore";
    tr.appendChild(thAggiungi);

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
        const tdAggiungi=document.createElement("td");

        tdRuolo.textContent = calciatore.ruolo;
        tdNome.textContent = calciatore.nome;
        tdSquadra.textContent = calciatore.squadra;
        tdValore.textContent = calciatore.quotazione;
        tdAggiungi.textContent = "x";
        tdAggiungi.classList.add("enter");
        tdAggiungi.dataset.idCalciatore=calciatore.id;
        tdAggiungi.addEventListener("click",aggiungiAllaRosa);
        tr.appendChild(tdRuolo);
        tr.appendChild(tdNome);
        tr.appendChild(tdSquadra);
        tr.appendChild(tdValore);
        tr.appendChild(tdAggiungi);

        tbody.appendChild(tr);
    }

    calciatoriDiv.appendChild(table);

    div.appendChild(calciatoriDiv);

}

function getCalciatori(){
    fetch("http://localhost/homework1/api_rest/getCalciatori.php")
        .then(response => response.json())
        .then(data => printCalciatori(data));
}

function getSomeCalciatori(event){
    let link;
    let nome=event.target.value;
    if(event.target.id=="cercaPerNome")  link="http://localhost/homework1/api_rest/getCalciatori.php?nome="+nome+"&type=1";
    else                                 link="http://localhost/homework1/api_rest/getCalciatori.php?nome="+nome+"&type=2";    
    fetch(link)
    .then(response => response.json())
    .then(data => printCalciatori(data));       
}


getCalciatori();
const cercaPerNome = document.getElementById('cercaPerNome');
cercaPerNome.addEventListener('input',getSomeCalciatori);

const cercaPerSquadra = document.getElementById('cercaPerSquadra');
cercaPerSquadra.addEventListener('input',getSomeCalciatori);