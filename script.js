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
function fillSkill(skillId, percentage) {
    const fillBar = document.getElementById(skillId);
    fillBar.style.width = `${percentage}%`;
  }

  // Example: Fill HTML skill to 80% after 2 seconds
  setTimeout(function() {
    fillSkill('htmlSkill', 80);
  }, 2000);

  // Example: Fill CSS skill to 70% after 4 seconds
  setTimeout(function() {
    fillSkill('cssSkill', 70);
  }, 4000);

  // Example: Fill JavaScript skill to 90% after 6 seconds
  setTimeout(function() {
    fillSkill('jsSkill', 90);
  }, 6000);



