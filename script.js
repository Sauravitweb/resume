console.log("script running.......")
document.querySelector('.cross').style.display = 'none';
document.querySelector('.ham').addEventListener("click", ()=>{
    document.querySelector('.sidebar').classList.toggle('sidebargo');
    if(document.querySelector('.sidebar').classList.contains('sidebargo')){
        document.querySelector('.ham').style.display = 'inline';
        
    }
   else {
    
        
    
        document.querySelector('.ham').style.display = 'inline';
}
}
)


document.querySelector('.port').addEventListener("click", ()=>{
    document.querySelector('.sidebar').classList.toggle('sidebargo');
    if(document.querySelector('.sidebar').classList.contains('sidebargo')){
        document.querySelector('.port').style.display = 'inline';
        
    }
   else {
    
        
    
        document.querySelector('.port').style.display = 'inline';
}
}
)
const canvas = document.getElementById('logoCanvas');
        const ctx = canvas.getContext('2d');

        // Draw outer circle with double border
        function drawOuterCircle() {
            // Outer border (cyan)
            ctx.beginPath();
            ctx.arc(250, 250, 240, 0, Math.PI * 2);
            ctx.strokeStyle = 'cyan';
            ctx.lineWidth = 10;
            ctx.stroke();

            // Inner border (lightcyan)
            ctx.beginPath();
            ctx.arc(250, 250, 230, 0, Math.PI * 2);
            ctx.strokeStyle = 'lightcyan';
            ctx.lineWidth = 4;
            ctx.stroke();
        }

        // Draw the top semi-circle with grid pattern
        function drawSemiCircleWithGrid() {
            // Clip the top semi-circle region
            ctx.beginPath();
            ctx.arc(250, 250, 240, Math.PI, 0);
            ctx.closePath();
            ctx.clip();

            // Fill the semi-circle with grid pattern
            for (let x = 0; x < 500; x += 20) {
                for (let y = 0; y < 250; y += 20) {
                    ctx.fillStyle = 'darkblue';
                    ctx.fillRect(x, y, 20, 20);
                    ctx.strokeStyle = 'lightblue';
                    ctx.strokeRect(x, y, 20, 20);
                }
            }
        }

        // Draw the text "CSITAN"
        function drawMainText() {
            ctx.font = 'bold 60px Verdana';
            ctx.fillStyle = 'darkblue';
            ctx.textAlign = 'center';
            ctx.fillText('CSITAN', 250, 270);
        }

        // Draw the subtext "where education glimpse with IT"
        function drawSubText() {
            ctx.font = '22px Verdana';
            ctx.fillStyle = 'lightblue';
            ctx.textAlign = 'center';
            ctx.fillText('where education glimpse with IT', 250, 320);
        }

        // Call functions to draw the complete logo
        drawOuterCircle();
        drawSemiCircleWithGrid();
        drawMainText();
        drawSubText();
              
