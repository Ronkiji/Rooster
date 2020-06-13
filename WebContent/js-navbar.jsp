<%@ page language = "java" contentType = "text/html; charset=ISO-8859-1" pageEncoding = "ISO-8859-1" %>

    configurePopupBtn("name-modal", "modal-button-name");
configurePopupBtn("pp-modal", "modal-button-pp");

function changeName() {

    var modal = document.getElementById("name-modal");

    const url = '/Rooster/Navbar';
    const data = {
        name: document.getElementById('name').value
    }

    $
        .post(url, data, null)
        .done(function() {
            modal.className = "modal animated fadeOutUp";
            document.getElementById("name-form").reset();   
            if (document.getElementById("home-greeting") != null)
                $("#home-greeting").load("home.jsp" + " #home-greeting");
        })
        .fail(function() {
        });
}

function checkImageExists(imageUrl, callBack) {
    var imageData = new Image();
    imageData.src = imageUrl;
    imageData.onload = function() {
        callBack(true);
    };
    imageData.onerror = function() {
        callBack(false);
    };

}

function changePfp() {

    function imageExists(url, callback) {
        var img = new Image();
        img.onload = function() {
            callback(true);
        };
        img.onerror = function() {
            callback(false);
        };
        img.src = url;
    }

    // Sample usage
    var imageUrl = document.getElementById('pfpurl').value;
    var status = false;
    imageExists(imageUrl, (exists) => {
        console.log('RESULT: url=' + imageUrl + ', exists=' + exists);
        if (exists === true) {
            sendRequest(document.getElementById('pfpurl').value);
        } else {
            sendRequest(null);
        }
    });


    function sendRequest(value) {

        var modal = document.getElementById("pp-modal");

        const url = '/Rooster/Navbar';
        const data = {
            pfp: value
        }

        $
            .post(url, data, null)
            .done(function() {
                modal.className = "modal animated fadeOutUp";
                document.getElementById("pfp-form").reset();
                document.getElementById('error-msg').innerHTML = "";
                if (document.getElementById("home-greeting") != null)
                    $("#home-greeting").load("home.jsp" + " #home-greeting");
            })
            .fail(function() {
                document.getElementById('error-msg').innerHTML = "An error occured. Invalid link.";
            });
    }
}

function logout() {

    console.log('Reached the logout function');

    const url = '/Rooster/Navbar';
    const data = {
        logout: true
    }

    $
        .post(url, data, null)
        .done(function() {
            window.location.href = "/Rooster/landing.jsp";
        })
        .fail();
}

function changeMode(color){
	const url = '/Rooster/Navbar';
    const data = {
        mode: color
    }

    $
        .post(url, data, null)
        .done(function() {
        })
        .fail();
}