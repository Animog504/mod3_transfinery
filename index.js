/*const translate = require('google-translate-api');

translate('Ik spreek Engels', {to: 'en'}).then(res => {
    console.log(res.text);
    //=> I speak English
    console.log(res.from.language.iso);
    //=> nl
}).catch(err => {
    console.error(err);
});// NODE STUFF */

//https://translation.googleapis.com/language/translate/v2

document.addEventListener("DOMContentLoaded", () => {
// since we aren't populating anything per se,
// we will simply be adding EventListeners to
// our elements

//grab elements from page... maybe on a global scope
//----------------------------------------------------
  initialize();

})//DOMContentLoaded

function initialize(){
  //grab everything
  const form = document.getElementById('transfinery-form')
  const primaryLanguage = document.getElementById('primary')
  const secondaryLanguage = document.getElementById('secondary')
  const textArea = document.getElementById('text-box')
  //so when we click the submit button we want to
  //send the string in the text-box through the api
  //with the different language options

  form.addEventListener("submit",function(e){
    e.preventDefault()

    const primary = primaryLanguage.value
    const secondary = secondaryLanguage.value
    const inputString = textArea.value

    // we need to make sure these fields exist!
    if(primary && secondary)
    {
      if(inputString){
        translation(primary,secondary,inputString)
      }else{
        alert("Not all fields are populated\nPlease fill in the form")
      }//string is empty
    }else{
      alert("Languages not selected.\nPlease select a primary and secondary language")
    }//select dropdowns(s) are still at default

  })//eventListener for our form
}//initialize()

function translation(primary,secondary,inputString){
  //call a function that does the recursion
  let temp = null
  fetch(GOOGLE_API_URL, {
    methods: 'POST'
    //something else here!
  })
  .then(res => res.json())
  .then(result => function(result){temp = result

//WORKING HERE





  })//.then(function)


}//beginTranslation()
