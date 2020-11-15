document.addEventListener("DOMContentLoaded", function() {

  let table = new Table();
  let tbl = $("#user-list");
  table.loadCustomTable(tbl);
  table = null;

});


// table can render differently on every page with another override function name
// should take 2 parameters
function overrideUserList(table,data) {

  for (let i = 0; i < data.length; i++) {
    let html = '<tr>';
    html += '<td>'+data[i]["user_name"]+'</td>';
    html += '<td>'+data[i]["user_username"]+'</td>';
    html += '<td>'+data[i]["user_role"]+'</td>';
    html += '<td>';
    html += '<button class="btn btn-sm btn-outline-primary">Update</button>';
    html += '<button class="btn btn-sm btn-outline-danger ml-2">Delete</button>';
    html += '</td>';
    html += '</tr>';

    table.find("tbody").append(html);
  }
}
