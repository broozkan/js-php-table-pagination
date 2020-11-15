<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
  <meta charset="utf-8">
  <title>bro-jsphp-table demo</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
  <div class="container">
    <div class="row">
      <div class="col-lg-8 offset-lg-2">
        <div class="card">
          <div class="card-header">
            <h3>Users Table</h3>
            <button type="button" class="btn btn-sm btn-outline-success" name="button">New User</button>
          </div>
          <div class="card-body">
            <div class="table-responsive">

              <div class="row mx-1 py-3">
                <div class="col-lg-12 query-bar">
                  <form class="form-inline float-right frmCustomTableSearch" model="user" action="" method="post">

                    <div class="form-group">
                      <input type="text" class="form-control form-control-sm ml-2 permanent" name="txtUserName" placeholder="Search user by name..." value="">
                    </div>

                    <div class="form-group">
                      <input type="text" class="form-control form-control-sm ml-2 permanent" name="txtUserUsername" placeholder="Search user by username..." value="">
                    </div>


                    <div class="form-group">
                      <button type="submit" class="btn btn-primary btn-sm mb-0 ml-2" name="button">Search</button>
                    </div>
                  </form>
                </div>
              </div>

              <div class="table-scroll-container">
                <table class="table table-hover" function="user-list" id="user-list" model="user" is-override="true" page-number="1" item-per-page="25" override-function="overrideUserList">
                  <thead>
                    <tr>
                      <th>Name</th>
                      <th>Username</th>
                      <th>Role</th>
                      <th>#</th>
                    </tr>
                  </thead>
                  <tbody class="table-content">

                  </tbody>
                </table>
              </div>
              <div class="card-footer ">
                <div class="row">
                  <div class="col-lg-8">
                    <div class="custom-pagination">
                      <?php
                      // for ($i=1; $i < ($this->totalPageNumber + 1); $i++) {
                      //   echo '<a href="#" value="'.$i.'">'.$i.'</a>';
                      // }
                      ?>
                    </div>

                  </div>
                  <div class="col-lg-4">
                    <div class="itemPerPage display-inline-block float-right">
                      <select class="form-control form-control-sm txtCustomItemPerPage" data-value="25">
                        <option value="25">25</option>
                        <option value="50">50</option>
                        <option value="100">100</option>
                        <option value="500">500</option>
                      </select>
                    </div>
                  </div>

                </div>

              </div>
            </div>
          </div>
        </div>

      </div>
    </div>
  </div>

  <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
  <script src="/libs/js/jquery.serializejson.js" charset="utf-8"></script>
  <script src="/libs/js/table.js" charset="utf-8"></script>
  <script src="/views/Demo/demo.js" charset="utf-8"></script>

</body>
</html>
