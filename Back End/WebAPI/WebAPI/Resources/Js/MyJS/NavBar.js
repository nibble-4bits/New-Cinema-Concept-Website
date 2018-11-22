var container;
var modal1;
var modal2;

$(document).ready(function () {
    container = $("#wrapper");
    modal1 = $("#id01");
    modal2 = $("#id02");
    /*Configuracion*/
});

$(document).mouseup(function(e) 
{

    if (!container.is(e.target) && container.has(e.target).length === 0) {
        container.removeClass("toggled");
        $("main").removeClass("changeColor");
        $("footer").removeClass("changeColor");
        $("header").removeClass("changeColor zoomOut animated");
    }
    if (modal1.is(e.target) && modal1.hasClass("modalblock")) 
    {
        RemoveModal1();
    }
    if (modal2.is(e.target) && modal2.hasClass("modalblock")) 
    {
        RemoveModal2();
    }
});
ShowActions = function () {
    container.toggleClass("toggled");
    $("header").toggleClass("zoomOut changeColor animated");
    $("main").toggleClass("changeColor");
    $("footer").toggleClass("changeColor");
};
FirstModal = function () {
    modal1.toggleClass("modalblock");
};
SecondModal = function () {
    modal2.toggleClass("modalblock");
};

RemoveModal1 = function () {
    modal1.removeClass("modalblock");
};
RemoveModal2 = function () {
    modal2.removeClass("modalblock");
};

AparecerMisDatos = function () {
    $("#MisDatos").toggleClass("down");
    if (!$("#ContentDatos").hasClass("toggled")) {
        $("#ContentDatos").toggleClass("toggled");
    } else {
        parent.location = '#!configuration';
    }
};
SubirRango = function () {
    $("#MiRango").toggleClass("down");
    if (!$("#ContentRango").hasClass("toggled")) {
        $("#ContentRango").toggleClass("toggled");
    } else {
        parent.location = '#!configuration';
    }
};

/*Configuration*/
Pelicula = function (idPelicula) {
    parent.location = '#!pelicula';
};
