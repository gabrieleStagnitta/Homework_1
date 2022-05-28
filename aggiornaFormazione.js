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
    thRuolo.addEventListener("click",getSomeCalciatori);
    thRuolo.id="ruolo";
    tr.appendChild(thRuolo);

    thNome.innerText="Nome";
    thNome.addEventListener("click",getSomeCalciatori);
    thNome.id="nome";
    tr.appendChild(thNome);

    thSquadra.innerText="Squadra";
    thSquadra.addEventListener("click",getSomeCalciatori);
    thSquadra.id="squadra";
    tr.appendChild(thSquadra);

    thValore.innerText="Valore";
    thValore.addEventListener("click",getSomeCalciatori);
    thValore.id="valore";
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
    document.getElementById(target).innerText+=" ⇊ ";
}

function getCalciatori(){
    fetch("http://localhost/homework1/api_rest/getCalciatori.php")
        .then(response => response.json())
        .then(data => printCalciatori(data));
    type=1;
    nome="";
}

function getSomeCalciatori(event){
    //tipo 1 ordina per squadra, cerca per nome
    //tipo 2 ordina per nome, cerca per nome
    //tipo 3 ordina per crediti, cerca per nome
    //tipo 4 ordina per ruolo, cerca per nome
    //tipo 5 ordina per squadra, cerca per squadra
    //tipo 6 ordina per nome, cerca per squadra
    //tipo 7 ordina per crediti, cerca per squadra
    //tipo 8 ordina per ruolo, cerca per squadra
    let link;
    if(event.target.id=="cercaPerNome"){
        if(type>=5)    type=type-4;
        perNome=true;
        nome=event.target.value;
    }
    else if(event.target.id=="cercaPerSquadra"){
        if(type<5)  type=type+4;
        perNome=false;
        nome=event.target.value;
    }
    else if(event.target.id=="ruolo"){
        target=event.target.id;
        if(perNome) type=4;
        else        type=8;
    }
    else if(event.target.id=="squadra"){
        target=event.target.id;
        if(perNome) type=1;
        else        type=5;
    }
    else if(event.target.id=="nome"){
        target=event.target.id;
        if(perNome) type=2;
        else        type=6;
    }
    else if(event.target.id=="valore"){
        target=event.target.id;
        if(perNome) type=3;
        else        type=7;
    }
    link="http://localhost/homework1/api_rest/getCalciatori.php?nome="+nome+"&type="+type;
    fetch(link)
    .then(response => response.json())
    .then(data => printCalciatori(data));       
}

let type=1;
let nome="";
let perNome=true;
let target="squadra";

getCalciatori();
const cercaPerNome = document.getElementById('cercaPerNome');
cercaPerNome.addEventListener('input',getSomeCalciatori);

const cercaPerSquadra = document.getElementById('cercaPerSquadra');
cercaPerSquadra.addEventListener('input',getSomeCalciatori);