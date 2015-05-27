var stuff = function() {

var h1 = $("#time"),
    seconds = 0, minutes = 0, hours = 0, t,
    totHoursInput = $("#tot-hours"),
    totHoursBefore = isNaN(parseFloat(totHoursInput.val())) ? 0 : parseFloat(totHoursInput.val()),
    tot = 0, hoursToMins = 0, decimal = 0, isRunning = false;


function add() {
    seconds++;
    if (seconds >= 60) {
        seconds = 0;
        minutes++;
        if (minutes >= 60) {
            minutes = 0;
            hours++;
        }
    }

    h1.text((hours ? (hours > 9 ? hours : "0" + hours) : "00") + ":" +
            (minutes ? (minutes > 9 ? minutes : "0" + minutes) : "00") + ":" +
            (seconds > 9 ? seconds : "0" + seconds));
    timer();
}

function timer() {
    t = setTimeout(add, 1000);
    hoursToMins = hours*60;
    decimal = ((hoursToMins+minutes)/60);
    tot = (totHoursBefore + decimal).toFixed(3);
    totHoursInput.val(tot);
}

// Uncomment this to start when you open the page
//timer();

/* Start button */
$("#start").on("click", function(){
    if(!isRunning) {
        isRunning = true;
        timer();
    }
});

/* Stop button */
$("#stop").on("click", function() {
    clearTimeout(t);
    isRunning = false;
});

/* Clear button */
$("#clear").on("click", function() {
    h1.text("00:00:00");
    seconds = 0; minutes = 0; hours = 0;
});

$("#save-and-begin").click(function(e){
    e.preventDefault();
    $.post("/shifts.js", $("#new_shift").serialize());
});

}

// events
$(document).on('page:load', stuff);
$(document).ready(stuff);