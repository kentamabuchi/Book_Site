'use strict'; {

  const label = {
    rankings: "",
    data: "",

    init: function(params){
      this.rankings = document.getElementsByClassName(params.rankings);
      this.data = document.getElementsByClassName(params.data);

      for(let i = 0; i < this.data.length; i++){
        document.getElementById(`book${i+1}`).addEventListener('mouseover', ()=>{
          this.data[i].style.visibility = "visible";
        });
      }

      for(let i = 0; i < this.data.length; i++){
        document.getElementById(`book${i+1}`).addEventListener('mouseleave', ()=>{
          this.data[i].style.visibility = "hidden";
        });
      }
    }
  }

  label.init ({
    rankings: "ranking__item",
    data: "ranking__item__data"
  });

}