const readline = require('readline');
const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout,
    terminal: false
});

const teaAndBiscuit = function() {

    let first, second;

    reader.question("Would you like some tea?", function(res){
        first = res;
        console.log(`You answered ${first}.`)

        reader.question("Would you like some biscuits?", function(res){
            second = res;
            console.log(`You answered ${second}.`)
            
            first = (first.toUpperCase() === 'YES') ? `do` : `don't`;
            second = (second.toUpperCase() === 'YES') ? `do` : `don't`;

            console.log(`So you ${first} want tea and you ${second} want biscuits.`)

            reader.close();
        }) 
    })

   
}

teaAndBiscuit();