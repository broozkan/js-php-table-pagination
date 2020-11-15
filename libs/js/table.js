$(document).ready(function () {


  /* Item per page changed */
  $(document).on("change",".txtItemPerPage",function () {
    let tbl = $(this).closest("div.table-responsive").find(".table");
    let itemPerPage = $(this).find("option:selected").val();
    tbl.attr("item-per-page",itemPerPage);
    let table = new Table();
    table.loadTable(tbl);
  })
  /* Item per page changed */

  /* Item per page changed */
  $(document).on("change",".txtCustomItemPerPage",function () {
    let tbl = $(this).closest("div.table-responsive").find(".table");
    let itemPerPage = $(this).find("option:selected").val();
    tbl.attr("item-per-page",itemPerPage);
    let table = new Table();
    table.loadCustomTable(tbl);
  })
  /* Item per page changed */

  $(document).on("click",".page-link-last",function () {


  })

  /* pagination click function */
  $(document).on("click",".pagination a.page-link",function () {
    let tbl = $(this).closest("div.table-responsive").find(".table");
    let clickedPage = $(this).html();
    tbl.attr("page-number",clickedPage);
    let table = new Table();
    table.loadTable(tbl);
  })
  /* pagination click function */


  /* custom-pagination click function */
  $(document).on("click",".custom-pagination a.page-link",function () {
    let tbl = $(this).closest("div.table-responsive").find(".table");
    let clickedPage = $(this).html();
    tbl.attr("page-number",clickedPage);
    let table = new Table();
    table.loadCustomTable(tbl);
  })
  /* custom-pagination click function */


  /* filter form submit */
  $(document).on("submit",".frmTableSearch",function (e) {
    e.preventDefault();

    let tbl = $(this).closest("div.table-responsive").find(".table");

    let table = new Table();
    table.loadTable(tbl);
  })
  /* filter form submit */


  /* custom table filter form submit */
  $(document).on("submit",".frmCustomTableSearch",function (e) {
    e.preventDefault();

    let tbl = $(this).closest("div.table-responsive").find(".table");

    let table = new Table();
    table.loadCustomTable(tbl);
  })
  /* custom table filter form submit */


  /* table row delete */
  $(document).on("click",".btnDeleteObject",function () {

    Swal.fire({
      title: 'Emin misiniz?',
      type: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#512DA8',
      cancelButtonColor: '#d33',
      cancelButtonText: 'İptal',
      confirmButtonText: 'Evet'
    }).then((result) => {
      if (result.value) {

        let tbl = $(this).closest(".table");
        let model = $(this).attr("object-model");
        let id = $(this).attr("object-id");

        let table = new Table();
        table.delete(tbl,model,id);
      }
    })
    /* table row delete */

  })
})



class Table {





  /* loading custom data */
  loadCustomTable(table) {


    let model = table.attr("model");
    let functionName = table.attr("function");
    let itemPerPage = table.closest("div.table-responsive").find(".txtCustomItemPerPage").find("option:selected").val();
    let pageNumber = parseInt(table.attr("page-number"));
    let filters = table.closest("div.table-responsive").find(".frmCustomTableSearch").serializeJSON();
    let modelUrl = model.replace("_", "-");
    let overrideFunctionName = table.attr("override-function");

    let json = {
      "model":model,
      "itemPerPage":itemPerPage,
      "pageNumber":pageNumber,
      "filters":filters
    }
    json = JSON.stringify(json);


    jQuery.ajax({
      type: "POST",
      url: "/"+modelUrl+"/"+functionName+"/",
      data: {post:json},
      cache: false,
      beforeSend: function() {
        $(".loading").removeClass("d-none");
      },
      success: function(ajaxResponse)
      {
        $(".loading").addClass("d-none");
        table.closest(".table-responsive").find(".table-content").html("");

        ajaxResponse = $.parseJSON(ajaxResponse);
        if (ajaxResponse.data) {



          window[overrideFunctionName](table,ajaxResponse.data,ajaxResponse.additionalData);

          ajaxResponse.totalPageNumber = Math.ceil(ajaxResponse.totalPageNumber);


          table.closest("div.table-responsive").find("div.custom-pagination").html("");
          if (ajaxResponse.totalPageNumber > 5) {
            let customPaginationHtml = '<a href="javascript:void(0)" class="page-link page-link" value="1">1</a>';
            customPaginationHtml += '<a href="javascript:void(0)" class="page-seperator" value="...">...</a>';
            table.closest("div.table-responsive").find("div.custom-pagination").append(customPaginationHtml);



            $(".middle-pagination").html("");

            let divMiddlePagination = '<div class="middle-pagination" ></div>';
            table.closest("div.table-responsive").find("div.custom-pagination").append(divMiddlePagination);


            divMiddlePagination = '';

            let addition = parseInt(ajaxResponse.totalPageNumber) / 3;


            for (let i = (pageNumber+1); i < (pageNumber+addition); i++) {

              if (i > parseInt(ajaxResponse.totalPageNumber)) {
                continue;
              }

              if (i == (pageNumber+4)) {
                divMiddlePagination += '<a href="javascript:void(0)" class="page-link page-link-last" value="'+i+'">'+i+'</a>';
              }else {
                if (i == pageNumber) {
                  divMiddlePagination += '<a href="javascript:void(0)" class="page-link active" value="'+i+'">'+i+'</a>';
                }else {
                  divMiddlePagination += '<a href="javascript:void(0)" class="page-link" value="'+i+'">'+i+'</a>';
                }
              }
            }
            table.closest("div.table-responsive").find("div.middle-pagination").html(divMiddlePagination);


            customPaginationHtml = '<a href="javascript:void(0)" class="page-seperator" value="...">...</a>';
            customPaginationHtml += '<a href="javascript:void(0)" class="page-link" value="'+ajaxResponse.totalPageNumber+'">'+ajaxResponse.totalPageNumber+'</a>';
            table.closest("div.table-responsive").find("div.custom-pagination").append(customPaginationHtml);

          }else {
            for (let i = 1; i < (ajaxResponse.totalPageNumber)+1; i++) {
              let customPaginationHtml = '<a href="javascript:void(0)" class="page-link" value="'+i+'">'+i+'</a>';
              table.closest("div.table-responsive").find("div.custom-pagination").append(customPaginationHtml);
            }
          }

          table.closest("div.table-responsive").find(".custom-pagination a").removeClass("active");
          table.closest("div.table-responsive").find(".custom-pagination a[value="+pageNumber+"]").addClass("active");


        }else {
          $.notify({
            // options
            icon: 'fa fa-danger fa-2x',
            message: ajaxResponse.response
          },{
            // settings
            type: 'danger'
          });
        }
      }
    });

    $(".table-overlay").fadeOut();

  }
  /* loading custom data */



    /* deleting row */
    delete(table,model,id){
      let json = {
        "model":model,
        "id":id
      }
      json = JSON.stringify(json);

      jQuery.ajax({
        type: "POST",
        url: "/"+model+"/delete-"+model+"/"+id,
        data: {post:json},
        cache: false,
        beforeSend: function() {
          $(".loading").removeClass("d-none");
        },
        error:function(err){

        },
        success: function(ajaxResponse)
        {
          $(".loading").addClass("d-none");

          ajaxResponse = $.parseJSON(ajaxResponse);
          if (ajaxResponse.response == true) {

            $.notify({
              // options
              icon: 'fa fa-danger fa-2x',
              message: "Silme işlemi başarılı!"
            },{
              // settings
              type: 'success'
            });
            table.find("tbody tr#"+id+"").fadeOut();
          }else {
            $.notify({
              // options
              icon: 'fa fa-danger fa-2x',
              message: ajaxResponse.response
            },{
              // settings
              type: 'danger'
            });
          }
        }
      });
    }
    /* deleting row */

}
