// Phase 1

function titleize(names, callback) {
    const result = names.map(
        function(ele){
            return callback(ele);
        }
    );
    result.forEach( function(name) {
        console.log(name);
        });
}
//callback passed to titleize
function mods(ele) {
    return `Mx. ${ele} Jingleheimer Schmidt`;
}

// -----------------------------------------------------------------------------------------------------------
// Phase 2

function Elephant(name, height, tricks) {
    this.name = name;
    this.height = height;
    this.tricks = tricks;
}

Elephant.prototype.trumpet = function() {
    console.log(`${this.name} the elephant goes 'phrRRRRRRRRRRR!!!!!!!'`);
}

Elephant.prototype.grow = function(){
    this.height += 12;
}

Elephant.prototype.addTrick = function(trick) {
    this.tricks.push(trick);
}

Elephant.prototype.play = function() {
    console.log(`${this.name} is ${this.tricks[Math.floor(Math.random()*this.tricks.length)]}`);
}

// ------------------------------------------------------------------------------------------------------
// Phase 3

Elephant.paradeHelper = function(elephant) {
    console.log(`${elephant.name} is trotting by!`);
}

// herd.forEach(Elephant.paradeHelper);

// -------------------------------------------------------------------------------------------------------
// Phase 4

function dinerBreakfast(order) {
    this.order = ["cheesy scrambled eggs"];
    if (order) this.order.push(order);
    console.log(`I'd like ${this.order.join(" and ")} please.`);
}