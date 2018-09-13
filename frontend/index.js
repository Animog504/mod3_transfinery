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
let iterationArray = [];
let iterationCount = 0;

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
    //reset our global variables for a new cycle
    iterationCount = 0;
    iterationArray = [];

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

function translation(primary,secondary,inputString,iterationCount = 0){
  //call a function that does the recursion
  let temp = null
  fetch(GOOGLE_API_URL, {
    methods: 'POST'
    //something else here!
  })
  .then(res => res.json())
  .then(result => function(result){
    temp = result.value

    //depending on the value of result we might have to
    //access the string a different way. HALP TIM!!!
    //we also cannot perform comparisons until the 3rd
    //iteration since it's every other translation we're
    //trying to compare i.e. g[0] === g[2], g[1] === g[3], etc.

    //the following assumes to get the string it's result.value
    iterationArray.push(result.value)

    if(iterationCount >= 3)
    {
      //do comparison logic
      if(iterationArray[iterationCount] === iterationArray[iterationCount-2])
      {
        //the strings of a certain language are the same and equilibrium is
        //attained. call a function that breaks this dreaded loop. also create
        //a new translation_event to store in our database

      }
    }
    updateContentPanel(temp,iterationCount)

    translation(secondary,primary,temp,iterationCount)
  })//.then(function w/ result)


}//beginTranslation()

function updateContentPanel(temp, iterationCount){
  const content = document.getElementById('content-panel')
  const template = `
    <br><li data-iteration-count="${++iterationCount}">${temp}</li>
  `
  content.innerHTML += template
}//updateContentPanel()

function getStuff(from, to, origin){
  return fetch(`http://localhost:3000/transfinery/translate?from=${from}&to=${to}&origin=${origin}`)//fetch
  .then(res => res.json())
}//getStuff()
