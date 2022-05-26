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
    let h1;
    let button;
    let buttonPlay;
    let div;
    let podcast=document.getElementById("podcast");
    let i=0;
    json.forEach(episode => {
        //episode.name, episode.preview, episode.link
        div=document.createElement("div");
        
        h1=document.createElement("h1");
        button=document.createElement("button");
        buttonPlay=document.createElement("button");
        
        h1.textContent=episode.name;
        button.textContent="Link puntata";
        buttonPlay.textContent="Ascolta la preview"

        div.append(h1);
        div.appendChild(buttonPlay);
        div.appendChild(button);

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
