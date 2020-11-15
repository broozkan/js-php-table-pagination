<?php

/**
*
*/
class User extends Controller
{
  public $limit = 50;
  public $offset = 0;
  public $page = 1;

  function __construct()
  {
    parent::__construct();
  }



  /*USER LIST PAGE*/
  public function userList()
  {


    if (isset($_POST["post"])) {

      $data = json_decode($_POST["post"],true);

      /* limit, offset and sql*/
      $limit = $data["itemPerPage"];
      $offset = ($data["pageNumber"] - 1) * $limit;
      $sql = "";
      $params = array();
      /* limit, offset and sql*/


      /* filter */
      if (@$data["filters"]["txtUserName"] != "") {
        $sql .= " AND tbl_users.user_name LIKE :user_name";
        $params["user_name"] = "%".$data["filters"]["txtUserName"]."%";
      }
      /* filter */

      /* filter */
      if (@$data["filters"]["txtUserUsername"] != "") {
        $sql .= " AND tbl_users.user_username LIKE :user_name";
        $params["user_name"] = "%".$data["filters"]["txtUserUsername"]."%";
      }
      /* filter */



      $model = new Model();



      /* "is not null" should be use for right syntax between AND operator */
      $stmt = $model->dbh->prepare(
        "SELECT * FROM tbl_users
        WHERE user_id IS NOT NULL
        $sql
        LIMIT $limit OFFSET $offset"
      );
      $stmt->execute($params);
      $users = $stmt->fetchAll(PDO::FETCH_ASSOC);
      /*selecting users*/


      /* total user number */
      $stmt = $model->dbh->prepare("SELECT COUNT(user_id) AS total_user_count FROM tbl_users WHERE user_id IS NOT NULL $sql");
      $stmt->execute($params);
      $totalUserCount = $stmt->fetch()["total_user_count"];
      /* total user number */

      /* total page number */
      $totalPageNumber = $totalUserCount / $limit;
      /* total page number */

      $model = null;

      echo json_encode(array(
        "data"=>$users,
        "totalPageNumber"=>$totalPageNumber,
        "doesHaveProfile"=>true
      ));

    }

  }
  /*USER LIST PAGE*/




  /* NEW USER */
  public function newUser($data = '', $echo = true)
  {
    if (isset($_POST["post"])) {
      $data = json_decode($_POST["post"],true);
    }
    $permission = "true";

    // $permission = $this->usernameCheck($data["txtPharmacistUsername"]);
    // if ($permission == "true") {
    //   $permission = $this->passwordCheck($data["txtPharmacistPassword"],$data["txtPharmacistPasswordRepeat"]);
    // }


    if ($permission == "true") {

      if ($data["txtUserLowerBalance"] == "") {
        $data["txtUserLowerBalance"] = null;
      }
      if ($data["txtUserUpperBalance"] == "") {
        $data["txtUserUpperBalance"] = null;
      }


      if (!isset($data["cboxToggleBalanceLimit"])) {
        $data["txtUserLowerBalance"] = null;
        $data["txtUserUpperBalance"] = null;
      }


      $model = new Model();

      $stmt = $model->dbh->prepare(
        "INSERT INTO tbl_users SET
        user_name=:user_name,
        user_address=:user_address,
        user_phone_number=:user_phone_number,
        user_email=:user_email,
        user_province=:user_province,
        user_district=:user_district,
        user_coordinates=:user_coordinates,
        user_gln_number=:user_gln_number,
        user_tax_department=:user_tax_department,
        user_tax_number=:user_tax_number,
        user_its_password=:user_its_password,
        user_warehouse_id=:user_warehouse_id,
        user_company_id=:user_company_id,
        user_beginning_balance=:user_beginning_balance,
        user_lower_balance=:user_lower_balance,
        user_upper_balance=:user_upper_balance,
        user_sms_url=:user_sms_url,
        user_sms_username=:user_sms_username,
        user_sms_password=:user_sms_password,
        user_sms_originator=:user_sms_originator
        "
      );
      $response = $stmt->execute([
        "user_name"=>$data["txtUserName"],
        "user_address"=>$data["txtUserAddress"],
        "user_phone_number"=>$data["txtUserPhoneNumber"],
        "user_email"=>$data["txtUserEmail"],
        "user_province"=>$data["txtUserProvince"],
        "user_district"=>$data["txtUserDistrict"],
        "user_coordinates"=>$data["txtUserCoordinates"],
        "user_gln_number"=>$data["txtUserGlnNumber"],
        "user_tax_department"=>$data["txtUserTaxDepartment"],
        "user_tax_number"=>$data["txtUserTaxNumber"],
        "user_its_password"=>$data["txtUserItsPassword"],
        "user_warehouse_id"=>$data["txtUserWarehouseId"],
        "user_company_id"=>$data["txtUserCompanyId"],
        "user_beginning_balance"=>$data["txtUserBeginningBalance"],
        "user_lower_balance"=>$data["txtUserLowerBalance"],
        "user_upper_balance"=>$data["txtUserUpperBalance"],
        "user_sms_url"=>@$data["txtUserSmsUrl"],
        "user_sms_username"=>@$data["txtUserUsername"],
        "user_sms_password"=>@$data["txtUserSmsPassword"],
        "user_sms_originator"=>@$data["txtUserSmsOriginator"]
      ]);
      // print_r($stmt->errorInfo());

      if ($response == true) {
        $userId = $model->dbh->lastInsertId();
        $response = $userId;

        if (isset($data["txtIsPharmacistAdministrator"])) {
          $data["txtIsPharmacistAdministrator"] = 1;
        }else {
          $data["txtIsPharmacistAdministrator"] = 0;
        }

        // $stmt = $model->dbh->prepare(
        //   "INSERT INTO tbl_users SET
        //   user_token_value=:user_token_value,
        //   user_name=:user_name,
        //   user_phone_number=:user_phone_number,
        //   user_username=:user_username,
        //   user_password=:user_password,
        //   user_user_id=:user_user_id,
        //   user_administration_state=:user_administration_state
        //   "
        // );
        // $response = $stmt->execute([
        //   "user_token_value"=>$token,
        //   "user_name"=>$data["txtPharmacistName"],
        //   "user_phone_number"=>$data["txtPharmacistPhoneNumber"],
        //   "user_username"=>$data["txtPharmacistUsername"],
        //   "user_password"=>$data["txtPharmacistPassword"],
        //   "user_user_id"=>$userId,
        //   "user_administration_state"=>$data["txtIsPharmacistAdministrator"]
        // ]);

        /*rollback*/
        if ($response == false) {
          $stmt = $model->dbh->prepare("DELETE FROM tbl_users WHERE user_id=:user_id");
          $stmt->execute(["user_id"=>$userId]);
          $response = "Eczacı eklenemedi!";
        }
        /*rollback*/

      }else {
        $response = "Eczane eklenemedi!";
      }


      $model = null;
    }else {
      $response = $permission;
    }



    if ($echo == false) {
      return $response;
    }else {
      echo json_encode(array(
        "response"=>$response
      ));
    }


  }
  /* NEW USER */




  /*UPDATE USER*/
  public function updateUser($data = '', $echo = true)
  {

    if (isset($_POST["post"])) {
      $data = json_decode($_POST["post"],true);
    }

    $permission = true;
    $model = new Model();


    if ($data["txtUpdateUserLowerBalance"] == "") {
      $data["txtUpdateUserLowerBalance"] = null;
    }
    if ($data["txtUpdateUserUpperBalance"] == "") {
      $data["txtUpdateUserUpperBalance"] = null;
    }



    if (!isset($data["cboxUpdateToggleBalanceLimit"])) {
      $data["txtUpdateUserLowerBalance"] = null;
      $data["txtUpdateUserUpperBalance"] = null;
    }



    $stmt = $model->dbh->prepare(
      "UPDATE tbl_users SET
      user_name=:user_name,
      user_address=:user_address,
      user_phone_number=:user_phone_number,
      user_email=:user_email,
      user_province=:user_province,
      user_district=:user_district,
      user_coordinates=:user_coordinates,
      user_gln_number=:user_gln_number,
      user_tax_department=:user_tax_department,
      user_tax_number=:user_tax_number,
      user_its_password=:user_its_password,
      user_warehouse_id=:user_warehouse_id,
      user_company_id=:user_company_id,
      user_beginning_balance=:user_beginning_balance,
      user_lower_balance=:user_lower_balance,
      user_upper_balance=:user_upper_balance,
      user_sms_url=:user_sms_url,
      user_sms_username=:user_sms_username,
      user_sms_password=:user_sms_password,
      user_sms_originator=:user_sms_originator
      WHERE user_id=:user_id
      "
    );
    $response = $stmt->execute([
      "user_name"=>$data["txtUpdateUserName"],
      "user_address"=>$data["txtUpdateUserAddress"],
      "user_phone_number"=>$data["txtUpdateUserPhoneNumber"],
      "user_email"=>$data["txtUpdateUserEmail"],
      "user_province"=>$data["txtUpdateUserProvince"],
      "user_district"=>$data["txtUpdateUserDistrict"],
      "user_coordinates"=>$data["txtUpdateUserCoordinates"],
      "user_gln_number"=>$data["txtUpdateUserGlnNumber"],
      "user_tax_department"=>$data["txtUpdateUserTaxDepartment"],
      "user_tax_number"=>$data["txtUpdateUserTaxNumber"],
      "user_its_password"=>$data["txtUpdateUserItsPassword"],
      "user_warehouse_id"=>$data["txtUpdateUserWarehouseId"],
      "user_company_id"=>$data["txtUpdateUserCompanyId"],
      "user_beginning_balance"=>$data["txtUpdateUserBeginningBalance"],
      "user_lower_balance"=>$data["txtUpdateUserLowerBalance"],
      "user_upper_balance"=>$data["txtUpdateUserUpperBalance"],
      "user_sms_url"=>@$data["txtUpdateUserSmsUrl"],
      "user_sms_username"=>@$data["txtUpdateUserUsername"],
      "user_sms_password"=>@$data["txtUpdateUserSmsPassword"],
      "user_sms_originator"=>@$data["txtUpdateUserSmsOriginator"],
      "user_id"=>$data["txtUpdateUserId"]
    ]);


    $model = null;

    if ($echo == false) {
      return $response;
    }else {
      echo json_encode(array(
        "response"=>$response
      ));
    }
  }
  /*UPDATE USER*/




  /* DELETE USER */
  public function deleteUser()
  {
    if (isset($_POST["post"])) {
      $data = json_decode($_POST["post"],true);


      $model = new Model();

      for ($i=0; $i < count($data["txtUserIds"]); $i++) {

        $stmt = $model->dbh->prepare("DELETE FROM tbl_users WHERE user_id=:user_id");
        $response = $stmt->execute(["user_id"=>$data["txtUserIds"][$i]]);

        if ($response == true) {
          $stmt = $model->dbh->prepare("DELETE FROM tbl_users WHERE user_user_id=:user_id");
          $response = $stmt->execute(["user_id"=>$data["txtUserIds"][$i]]);
        }
      }


      echo json_encode(array(
        "response"=>$response
      ));
    }
  }
  /* DELETE USER */



}
