function getUserId(token) {
    var tokenParts = token.split(".");
    var payloadDecoded = JSON.parse(atob(tokenParts[1]));

    return parseInt(payloadDecoded.IdUsuario);
}

function getUsername(token) {
    var tokenParts = token.split(".");
    var payloadDecoded = JSON.parse(atob(tokenParts[1]));

    return payloadDecoded.unique_name;
}