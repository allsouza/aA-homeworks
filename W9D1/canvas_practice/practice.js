document.addEventListener("DOMContentLoaded", function(){
    const mycanvas = document.getElementById('mycanvas');
    mycanvas.width = 500;
    mycanvas.height = 500;

    const ctx = mycanvas.getContext('2d');
    ctx.fillStyle = "darkblue";
    ctx.fillRect(10, 10, 500, 500);

    ctx.beginPath();
    ctx.arc(160,160,100,0, 360, false);
    ctx.strokeStyle = "silver";
    ctx.lineWidth = 10;
    ctx.stroke();
    ctx.fillStyle = "gold";
    ctx.fill();

    //border
    ctx.beginPath();
    ctx.moveTo(455,455);
    ctx.lineTo(188, 455);
    ctx.lineTo(455,188);
    ctx.fillStyle = "silver";
    ctx.fill();
    //triangle
    ctx.beginPath();
    ctx.moveTo(450,450);
    ctx.lineTo(200, 450);
    ctx.lineTo(450,200);
    ctx.fillStyle = "gold";
    ctx.fill();
   
   });  