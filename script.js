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
function sendEmail(){

Email.send({

Host : "smtp.gmail.com",

Username: "saurav.khanal288@gmail.com",

Password: "@@SKnp12",

To: 'saurav.khanal2888@gmail.com',

From : document.getElementById("email").value,

Subject: "New Contact Form Enquiry",

Body : "And this is the body"

}).then(

message => alert(message)

);

}



