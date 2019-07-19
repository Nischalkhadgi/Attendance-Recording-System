var today = new Date();
document.getElementById("date").innerHTML = today.toDateString();

var hour = today.getHours();
var greet;
if (hour < 4) {
    greet = "Good night!";
}
else if (hour < 12) {
    greet = "Good morning!";
}
else if (hour < 18) {
    greet = "Good afternoon!";
}
else if (hour < 21) {
    greet = "Good evening!";
}
else {
    greet = "Good night!";
}

document.getElementById("greetings").innerHTML = greet;