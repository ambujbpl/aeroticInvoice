function Posthandler(url, dataArray,asyncType) {
    var user = JSON.parse(localStorage.getItem('user'));
    $.support.cors = true;
    return $.ajax({
      url: url,
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify(dataArray),
        contentType: "application/json",
        dataType: "json",
        async: asyncType,
        // headers: {
        // 'X-access-Token' : user.token
        // },
        //headers: { "Authorization": 'Bearer ' + user.token },
        success: function(resp) {},
        error: function(err) {}
    });
}

function Gethandler(url) {
    return $.ajax({
        url: url,
        type: 'GET',
        datatype: "json",
        async: true,
        success: function(res) {},
        error: function(err) {}
    });
}

function Puthandler(url, dataArray,asyncType) {
    var user = JSON.parse(localStorage.getItem('user'));
    $.support.cors = true;
    return $.ajax({
      url: url,
        type: 'PUT',
        contentType: 'application/json',
        data: JSON.stringify(dataArray),
        datatype: "json",
        async: asyncType,
        // headers: {
        // 'X-access-Token' : user.token
        // },
        //headers: { "Authorization": 'Bearer ' + user.token },
        success: function(resp) {},
        error: function(err) {}
    });
}