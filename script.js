
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
