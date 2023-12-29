console.log("script running.......")
document.querySelector('.cross').style.display = 'none';
document.querySelector('.ham').addEventListener("click", ()=>{
    document.querySelector('.sidebar').classList.toggle('sidebargo');
    if(document.querySelector('.sidebar').classList.contains('sidebargo')){
        document.querySelector('.ham').style.display = 'inline';
        document.querySelector('.cross').style.display = 'none';
    }
   else {
    
        document.querySelector('.cross').style.display = 'inline';
    
        document.querySelector('.ham').style.display = 'none';
}



}
)
function opensidebar() {
  document.getElementById("sidebar").style.width = "250px";
  document.querySelector(".ham").style.display = "none";
  document.querySelector(".cross").style.display = "block";
}

function closesidebar() {
  document.getElementById("sidebar").style.width = "0";
  document.querySelector(".ham").style.display = "block";
  document.querySelector(".cross").style.display = "none";
}
