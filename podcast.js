function play(event){
    sound.src=episodes[event.currentTarget.dataset.num];
    sound.volume=0.3;
    if(isplaying&& number==event.currentTarget.dataset.num){
        sound.pause();
        number=-1;
        isplaying=false;
        event.currentTarget.textContent="Ascolta la preview";
    }
    else{
        sound.play();
        number=event.currentTarget.dataset.num;
        isplaying=true;
        event.currentTarget.textContent="Smetti di ascoltare";
    }
}

function showData(json){
    let p;
    let button;
    let buttonPlay;
    let buttonsDiv;
    let div;
    let podcast=document.getElementById("podcast");
    let i=0;
    json.forEach(episode => {
        div=document.createElement("div");
        div.classList.add("episodio");

        buttonsDiv=document.createElement("div");
        buttonsDiv.classList.add("buttonsDiv");
        
        p=document.createElement("p");
        button=document.createElement("button");
        buttonPlay=document.createElement("button");

        buttonsDiv.appendChild(buttonPlay);
        buttonsDiv.appendChild(button);
        
        p.textContent=episode.name;
        button.textContent="Link puntata";
        buttonPlay.textContent="Ascolta la preview"

        div.append(p);
        div.append(buttonsDiv);

        buttonPlay.addEventListener('click',play);
        podcast.appendChild(div);

        button.addEventListener('click',function(){
            window.open(episode.link, '_blank');
        });

        episodes[i]=episode.preview;
        buttonPlay.dataset.num=i;
        i++;
    });
}

let episodes={};
let number=-1;
let isplaying=false;
let sound = new Audio();
fetch("http://localhost/homework1/api_rest/curlPodcast.php?")
    .then(response => response.json())
    .then(data => showData(data));
