window.setTimeout(function() {alert('Hammertime')}, 10000);

function hammerTime(time) {
    window.setTimeout(function(){
        alert(`${time} is HAMMERTIME!`)},
        time * 1000);
}

