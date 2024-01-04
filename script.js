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

              function httpGetAsync(url, callback) {
                  const xmlHttp = new XMLHttpRequest();
                  xmlHttp.onreadystatechange = function() {
                      if (xmlHttp.readyState === 4 && xmlHttp.status === 200)
                      callback(xmlHttp.responseText);
                  }
                  xmlHttp.open("GET", url, true); // true for asynchronous
                  xmlHttp.send(null);
              }

              const url = "https://ipgeolocation.abstractapi.com/v1/?api_key=af41d0dbf1474f6b8be478699fd331a6&ip_address=27.34.17.224"

              httpGetAsync(url)



