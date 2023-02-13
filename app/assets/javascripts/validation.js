'use strict'; {
  const validation = {
    submitBtn: "",
    form: "",
    formText: "",

    init: function(params){
      this.submitBtn = document.getElementById(params.submitBtn);
      this.form = document.getElementById(params.form);
      this.formText = document.getElementsByClassName(params.formText);

      if (!this.submitBtn){ return false;}

      if(params.form.includes("SignIn") && this.formText[0].value !== "" && this.formText[1].value === ""){
        this.formText[0].nextElementSibling.textContent = "メールアドレスかパスワードが違います";
        this.formText[0].classList.add("error__form");
        this.formText[1].classList.add("error__form");
      }


      this.submitBtn.addEventListener('click', (e)=>{

        e.preventDefault();

        let active = true;

        for(let i = 0; i < this.formText.length; i++){
          if(this.formText[i].value === ""){
            this.formText[i].nextElementSibling.textContent = "入力されていません";
            this.formText[i].classList.add("error__form");
            this.formText[i].nextElementSibling.classList.add("error__text");

            active = false;
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

        if(active == true){
          this.form.submit();
        }
      });
    },

    action: function(){
      for(let i = 0; i < this.formText.length; i++){
        if(this.formText[i].value === "" && this.count === 0){
          this.formText[i].nextElementSibling.textContent = "入力されていません";
          console.log(i);
        }
      }
    }

  }

  if(location.href.includes('books/new')){
    validation.init ({
      submitBtn: "bookNewBtn",
      form: "bookNewForm",
      formText: "validation__form"
    });
  }else if(location.href.includes('admins/sign_in')){
    validation.init ({
      submitBtn: "adminSignInBtn",
      form: "adminSignInForm",
      formText: "validation__form"
    });
  }

}

