function entraNellaLega(event){
    fetch("http://localhost/homework1/api_rest/insertInLega.php?lega="+event.currentTarget.dataset.idLega+"&enter=true");
    alert("Sei stato inserito nella lega da te scelta");
    setEventListener(event.currentTarget);    
}

function esciDallaLega(event){
    fetch("http://localhost/homework1/api_rest/insertInLega.php?lega="+event.currentTarget.dataset.idLega);
    alert("Sei uscito dalla lega da te scelta");
    setEventListener(event.currentTarget);  
}

function guardaInfoLega(event){
    let nome = event.currentTarget.dataset.nome;
    fetch("http://localhost/homework1/api_rest/allenatoriInLega.php?id="+event.currentTarget.dataset.idLega)
    .then(response => response.json())
    .then(json => divForInfo(nome,json));
}

function creaLega(event){
    const createForm = document.forms['creaLega'];
    if(createForm.nome.value.length == 0){
        alert("Compilare tutti i campi");
        event.preventDefault();
    }
    else{
        fetch("http://localhost/homework1/api_rest/creaLega.php?nome="+createForm.nome.value)
        .then(response => response.text())
        .then(text => {
        if(text==-1){
            alert("Nome lega già in uso...");
            event.preventDefault();
        }
        else{
            alert("Lega appena creata");
        }
        });
    }
}

function divForInfo(nomeLega,allenatori){
    if(allenatori==-1){
        alert("La lega non ha ancora squadre iscritte");
    }
    else{
        const div = document.getElementById("modal");
        div.innerHTML="";

        const h1= document.createElement("h1");
        h1.innerText=nomeLega;

        const lega=document.createElement("div");
        lega.id="div";
        lega.classList.add("table-wrapper");

        const table=document.createElement("table");
        table.classList.add("fl-table");
        const thead=document.createElement("thead");
        const tr=document.createElement("tr");
        const thNickname=document.createElement("th");
        const thSquadra=document.createElement("th");
        const tbody=document.createElement("tbody");
        thNickname.innerText="Nickname";
        tr.appendChild(thNickname);
        thSquadra.innerText="Squadra";
        tr.appendChild(thSquadra);
        thead.appendChild(tr);
        table.appendChild(thead);
        
        tbody.id="body";
        table.appendChild(tbody);

        for(let allenatore of allenatori)
        {
            const tr=document.createElement("tr");
            const tdNickname=document.createElement("td");
            const tdSquadra=document.createElement("td");
            tdNickname.textContent = allenatore.nickname;
            tdSquadra.textContent = allenatore.nomeSquadra;

            tr.appendChild(tdNickname);
            tr.appendChild(tdSquadra);

            tbody.appendChild(tr);
        }

        lega.appendChild(table);

        div.appendChild(h1);
        div.appendChild(lega);
        document.getElementById("myModal").style.display = "block";
    }
}

function divForCreation(){
    let mainDiv=document.getElementById("modal");
    let form=document.createElement("form");
    form.name="creaLega";
    form.method="post";
    let label=document.createElement("label");
    let nome=document.createElement("input");
    nome.type="text";
    nome.name="nome";
    nome.placeholder="Nome lega";
    label.textContent="Nuova lega";
    let submit=document.createElement("input");
    submit.type="submit";
    submit.value="Registra";
    form.appendChild(label);
    form.appendChild(nome);
    form.appendChild(submit);
    form.addEventListener('submit',creaLega);
    mainDiv.appendChild(form);
    document.getElementById("myModal").style.display = "block";
}

function setEventListener(tdEntra){
    fetch("http://localhost/homework1/api_rest/giaInLega.php?id="+tdEntra.dataset.idLega)
    .then(response => response.text())
    .then(giaInLega => {
        if(giaInLega==-1){
            if(tdEntra.classList.contains("exit"))  tdEntra.classList.remove("exit");
            if(!tdEntra.classList.contains("enter")) tdEntra.classList.add("enter");
            tdEntra.removeEventListener('click',esciDallaLega);
            tdEntra.addEventListener("click", entraNellaLega);
        }
        else{
            if(tdEntra.classList.contains("enter"))  tdEntra.classList.remove("enter");
            if(!tdEntra.classList.contains("exit"))  tdEntra.classList.add("exit");
            tdEntra.removeEventListener('click',entraNellaLega);
            tdEntra.addEventListener("click", esciDallaLega);
        }
    });
}

function printLeghe(leghe){
    const div = document.getElementById("leghe");
    div.innerHTML="";
    const legheDiv=document.createElement("div");
    legheDiv.id="div";
    legheDiv.classList.add("table-wrapper");

    const table=document.createElement("table");
    table.classList.add("fl-table");
    const thead=document.createElement("thead");
    const tr=document.createElement("tr");
    const thNome=document.createElement("th");
    const thEntra=document.createElement("th");
    const tbody=document.createElement("tbody");
    thNome.innerText="Nome lega";
    tr.appendChild(thNome);
    thEntra.innerText="Entra o esci dalla lega";
    tr.appendChild(thEntra);
    thead.appendChild(tr);
    table.appendChild(thead);
        
    tbody.id="body";
    table.appendChild(tbody);

    for(let lega of leghe)
    {
        const tr=document.createElement("tr");
        const tdNome=document.createElement("td");
        const tdEntra=document.createElement("td");

        tdNome.textContent = lega.nome;
        tdNome.dataset.idLega = lega.idLega;
        tdNome.dataset.nome = lega.nome;
        tdNome.addEventListener("click",guardaInfoLega);
        tdNome.classList.add("info");
        tdEntra.dataset.idLega = lega.idLega;
        setEventListener(tdEntra);

        tr.appendChild(tdNome);
        tr.appendChild(tdEntra);

        tbody.appendChild(tr);
    }

    legheDiv.appendChild(table);

    div.appendChild(legheDiv);
}

function getLeghe(){
    fetch("http://localhost/homework1/api_rest/getLeghe.php")
    .then(response => response.json())
    .then(data => printLeghe(data));
}

getLeghe();

document.getElementById("go").onclick = function() {
    divForCreation();
};

document.getElementsByClassName("close")[0].onclick = function() {
    document.getElementById("modal").innerHTML="";
    document.getElementById("myModal").style.display = "none";
}

window.onclick = function(event) {
  if (event.target == document.getElementById("myModal")) {
    document.getElementById("myModal").style.display = "none";
  }
}