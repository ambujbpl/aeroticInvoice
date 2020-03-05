<?php
 
/*
 * DataTables example server-side processing script.
 *
 * Please note that this script is intentionally extremely simple to show how
 * server-side processing can be implemented, and probably shouldn't be used as
 * the basis for a large complex system. It is suitable for simple use cases as
 * for learning.
 *
 * See http://datatables.net/usage/server-side for full details on the server-
 * side processing requirements of DataTables.
 *
 * @license MIT - http://datatables.net/license_mit
 */
 
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 * Easy set variables
 */
 
// DB table to use
$table = 'logs';
 
// Table's primary key
$primaryKey = 'id';
 
// Array of database columns which should be read and sent back to DataTables.
// The `db` parameter represents the column name in the database, while the `dt`
// parameter represents the DataTables column identifier. In this case simple
// indexes
$columns = array(
    // array( 'db' => 'id', 'dt' => 0 ),
    array( 'db' => 'type',  'dt' => 0 ),
    array( 'db' => 'info',   'dt' => 2 ),
    array( 'db' => 'details',     'dt' => 3 ),
    array(
        'db'        => 'created_at',
        'dt'        => 4,
        'formatter' => function( $d, $row ) {
            return date( 'jS M Y [ h:i A ]', strtotime($d));
        }
    ),
    array('db' => 'table_name', 'dt' => 1)
    // array(
    //     'db'        => 'salary',
    //     'dt'        => 5,
    //     'formatter' => function( $d, $row ) {
    //         return '$'.number_format($d);
    //     }
    // )
);
 
// SQL server connection information
$sql_details = array(
    'user' => 'root',
    'pass' => 'root',
    'db'   => 'invoice',
    'host' => 'localhost'
);

$id = 'userid';
$where = '';
if(!isset($_COOKIE[$id])) {
} else {
  $val = $_COOKIE[$id];
  $where = " where info='$val' ";
}
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 * If you just want to use the basic configuration for DataTables with PHP
 * server-side, there is no need to edit below this line.
 */
 
require( './../config/ssp.class.php' );
 
echo json_encode(
    SSP::simple( $_GET, $sql_details, $table, $primaryKey, $columns, $where )
);