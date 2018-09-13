

//====================== TRANSLATION-EVENT Variables
let primaryLanguage = ""
let secondaryLanguage = ""
let originalInput = ""
let iterationArray = []
let keepLooping = true //for logic later on
//====================== T
document.addEventListener("DOMContentLoaded", () => {

  initialize();
})//DOMContentLoaded
  const displayArea = document.getElementById('content-panel')
function initialize(){
  //grab everything
  const form = document.getElementById('transfinery-form')
  const primaryLang = document.getElementById('primary')
  const secondaryLang = document.getElementById('secondary')
  const textArea = document.getElementById('text-box')
  //so when we click the submit button we want to
  //send the string in the text-box through the api
  //with the different language options

  form.addEventListener("submit",function(e){
    e.preventDefault()
    //reset our global variables for a new cycle


    const primary = primaryLang.children[0].value
    const secondary = secondaryLang.children[0].value
    const inputString = textArea.value

    // we need to make sure these fields exist!
    console.log(`${primary},${secondary},${inputString}`)
    if(primary !== "default" && secondary !== "default"){
      if(primary !== secondary){
        if(!!inputString){
          primaryLanguage = primary
          secondaryLanguage = secondary
          originalInput = inputString
          keepLooping = true
          displayArea.innerHTML = ""
          translationParty(primary,secondary,inputString)
        }else{
          alert("Not all fields are populated\nPlease fill in the form")
        }//string is empty
      }else{
        alert(`translating from ${primary} to ${secondary}? yeah no.`)
      }//attempting to translate to/from the same language
    }else{
      alert("Languages not selected.\nPlease select a primary and secondary language")
    }//select dropdowns(s) are still at default

  })//eventListener for our form
}//initialize()



function updateContentPanel(temp, iterationCount){
  const content = document.getElementById('content-panel')
  const template = `
    <br><li data-iteration-count="${iterationArray.length}">${temp}</li>
  `
  content.innerHTML += template
}//updateContentPanel()

function getStuff(from, to, origin){
  return  fetch(`http://localhost:3000/transfinery/translate?from=${from}&to=${to}&origin=${origin}`)//fetch
  .then(res => res.json())
}//getStuff()

function highlightList(){
  //get DOM elements and change their colors
}//highlightList()

async function translationParty(from, to, origin){
  //note async is needed for await to work!!

  //store beginning data (the ones passed in)

  //send fetch with getStuff() and assign to variable
  //get the string data and shovel into global array
  //repeat getStuff with from/to switched and the translation
  // while(keepLooping === true){
  if(keepLooping){
    var iterationData = await getStuff(from,to,origin).catch((err) => { console.log(err); });
    let currentIteration = iterationData.text
    iterationArray.push(currentIteration)
    if(iterationArray.length%2 !== 0 && from === 'en'){
      currentIteration = currentIteration.toLowerCase(); // only for eng
    }

    if(iterationArray.length >= 3){
      console.log(`my iterationArray is ${iterationArray.length}`)
      console.log(`im comparing: ${currentIteration} vs ${iterationArray[iterationArray.length-3]}`)
      if(currentIteration === iterationArray[iterationArray.length-3] || currentIteration === originalInput || iterationArray.length >= 20)
      {
        keepLooping = false

        // break out of our recursion
      }
    }

    listElement = createListElement(currentIteration, iterationArray.length)

    displayArea.innerHTML += listElement

    translationParty(to,from,currentIteration)
  }//ifLooping
  // IF YOU'RE HERE YOU'RE DONE WITH THE LOOPZ
  // YOU CAN NOW GRAB ALL THAT GLOBAL VARIABLE GOODNESS AND SHOVE IT INTO RUBY.
  keepLooping=true

  // }//keepLooping condition

  //when equillibrium is achieved we need to find the last 3 elements on the page and make them green for confirmation purposes

  highlightList()

  //we also want to write all our global variables as a data obj to the server so it can persist for generations to come >.>

}//translationParty()

function createListElement(str,listID){
  return `
    <li data-list-id="${listID}"><h3>${str}</h3></li>
  `
}//createListElement()

/* things to do
  recursive function and logic (THE BIG ONE)
    start with doing the process one step at a time.
      logic flows as follows:
      - both languages are selected and a string exists
      - pass those args as url?arg in fetch to ruby
      - write (or reuse) the path that does the google.api all
      - JSON back our data
      - comparison logic
        > we don't start comparisons until the 3rd iteration (we need a global counter)
        > on 3rd iteration we compare the 3rd index with the 0th (always array[x] === array[x-2])
        > we only ever compare even (and 0) index(s) since doing logic in another language just wont do
          + IF (array[x] === array[x-2]) ---> break the loop and submit all our data to the ruby backend
              - fetch request with the data required for our TranslationEvent Object
                  * Primary Language (eng likely)
                  * Secondary Language
                  * original String
                  ----
                  * iteration Array []
          + ELSE run our method with the primaryLanguage and SecondaryLanguage swapped. use the tempString
            as the new inputString in the function call.
*/
