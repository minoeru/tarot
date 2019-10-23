window.onload = function() {
  //click effect
  document.body.addEventListener("click", drop, false);
  let title_scene_child = document.getElementById('title_ui');
  let title_scene = title_scene_child.parentNode;
  function drop(e) {
    let x = e.pageX;
    let y = e.pageY;

    let sizuku = document.createElement("div");
    sizuku.style.top = y + "px";
    sizuku.style.left = x + "px";
    title_scene.appendChild(sizuku);
    sizuku.className = "sizuku";
    
    sizuku.addEventListener("animationend", function() {
      this.parentNode.removeChild(this);
    }, false);
    
    for (var i = 1; i <= 3; i++) {
      let star = document.createElement("div");
      let star_size = Math.random() * 50 + 30;
      star.style.width = star_size + "px";
      star.style.height = star_size + "px";
      star.style.top = y - Math.random() * 20 - star_size / 2 + "px";
      star.style.left = x + Math.random() * 150 - 75 - star_size / 2 + "px";
      star.style.animation = " star " + Math.random() * 3 + 2 + "s ease " + Math.random() * 0.3 + "s";
      star.style.transform = "rotate(" + Math.random() * 360 + "deg)";
      title_scene.appendChild(star);
      star.className = "star";
      
      star.addEventListener("animationend", function() {
        this.parentNode.removeChild(this);
      }, false);
    }
  }
};

function shuffle(){
          for(let j=1; j<14; j++){
            let id_num = "mob" + j;
            let add_class_num = id_num + "_move"; 
            document.getElementById(id_num).classList.add(add_class_num);
            document.getElementById(id_num).addEventListener("animationend",function(){
              document.getElementById(id_num).classList.remove(add_class_num);
            },false);
          }
          document.getElementById('mainCard').classList.add('mainCard_move');
          document.getElementById('mainCard').addEventListener("animationend",function(){
              document.getElementById('mainCard').classList.remove('mainCard_move');
            },false);
          document.getElementById('cardimage').classList.add('fade_in');
        }