'use strict'; {

  const selectImage = document.getElementById('selectImage');
  const previewImage = document.getElementById('previewImage');
  const currentImage = previewImage.src;


  document.addEventListener('turbolinks:load',()=>{

    function readURL(input) {
      let reader = new FileReader();

      if(selectImage.value){

        reader.onload = function (e) {
          previewImage.setAttribute('src', e.target.result);
        }

        reader.readAsDataURL(selectImage.files[0]);
      }
    }

    selectImage.addEventListener('change', ()=>{
      if(selectImage.value){
        readURL(this);
      }else{
        previewImage.src = currentImage;
      }
      console.log("t");
    });

  });

}