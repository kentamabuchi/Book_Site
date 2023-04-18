'use strict'; {

  const image = document.getElementById('newImage');
  const currentImage = document.getElementById('newCurrentImage');

  document.addEventListener('turbolinks:load',()=>{

    console.log(currentImage.value);

    function readURL(input) {

      if(image.value){
        let reader = new FileReader();

        reader.onload = function (e) {
          currentImage.setAttribute('src', e.target.result);
        }

        reader.readAsDataURL(image.files[0]);
      }
    }

    image.addEventListener('change', ()=>{
      readURL(this);
    });

  });
}
