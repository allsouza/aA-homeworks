function madLib(verb, adj, noun) {
    return `We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()}`;
}

function isSubstring(searchString, subString) {
    return searchString.search(subString) >= 0 ? true : false;
}

function fizzBuzz(array) {
    const result = [];

    array.forEach(function(num){
        if ((num%5 === 0 || num%3 === 0) && (!(num%5 === 0 && num%3 === 0))){
            result.push(num);
        }
    });
    return result;
}

function isPrime(num) {
    if (num < 2) return false;
    for(let i=2; i<num; i++){
        if (num%i === 0) return false;
    }
    return true;
}

function sumOfNPrimes(num) {
    const result = [0];
    for(let counter=1; result.length <= num+1; counter++){
        if (isPrime(counter)) result.push(counter);
    }
    return result;
}