'use strict'; {
  const validation = {
    submitBtn: "",
    form: "",
    formText: "",

    init: function(params){
      this.submitBtn = document.getElementById(params.submitBtn);
      this.form = document.getElementById(params.form);
      this.formText = document.getElementsByClassName(params.formText);

      // console.log(this.submitBtn);
      // console.log(this.form);

      if (!this.submitBtn){ return false;}


      this.submitBtn.addEventListener('click', (e)=>{
        e.preventDefault();

        let active = true;

        for(let i = 0; i < this.formText.length; i++){
          if(this.formText[i].value === ""){
            // this.formText[i].after(document.createElement('p'));
            this.formText[i].nextElementSibling.textContent = "入力されていません";
            this.formText[i].classList.add("error__form");
            this.formText[i].nextElementSibling.classList.add("error__text");
            // console.log(i);

            active = false;
            // console.log(this.form.length);
          }else if(this.formText[i].value !== "" && active === false){
            this.formText[i].nextElementSibling.textContent = "";
            this.formText[i].classList.remove("error__form");
            this.formText[i].nextElementSibling.classList.remove("error__text");
          }else{
            active = true;
            this.formText[i].nextElementSibling.textContent = "";
            this.formText[i].classList.remove("error__form");
            this.formText[i].nextElementSibling.classList.remove("error__text");
          }
        }
        console.log(active);

        // this.action();
        // this.formText.map(function(text){
        //   if(text.value === "" && this.count === 0){
        //     this.formText[i].after(document.createElement('p'));
        //     this.formText[i].nextElementSibling.textContent = "入力されていません";
        //   }
        // });

        if(active === true){
          this.form.submit();
        }

      });


    },
    action: function(){
      for(let i = 0; i < this.formText.length; i++){
        if(this.formText[i].value === "" && this.count === 0){
          // this.formText[i].after(document.createElement('p'));
          this.formText[i].nextElementSibling.textContent = "入力されていません";
          console.log(i);
          // console.log(this.form.length);
        }
      }
      // this.count++;


      // this.formText.map(function(text){
      //   if(text.value === "" && this.count === 0){
      //     this.formText[i].after(document.createElement('p'));
      //     this.formText[i].nextElementSibling.textContent = "入力されていません";
      //   }

      // });

    }

  }
  validation.init ({
    submitBtn: "bookNewBtn",
    form: "bookNewForm",
    formText: "validation__form"
  });
}

