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
$table = 'certificates';
 
// Table's primary key
$primaryKey = 'id';
 
// Array of database columns which should be read and sent back to DataTables.
// The `db` parameter represents the column name in the database, while the `dt`
// parameter represents the DataTables column identifier. In this case simple
// indexes
$columns = array(
    // array( 'db' => 'id', 'dt' => 0 ),id,invoice_date,subtotal,gst,total,paid,due, 
    array( 'db' => 'id',  'dt' => 0 ),
    array( 
        'db' => 'invoice_date',
        'dt' => 1,
        'formatter' => function( $d, $row ) {
            return date( 'jS M Y', strtotime($d));
        }
    ),
    array( 'db' => 'subtotal',   'dt' => 2 ),
    array( 'db' => 'gst',     'dt' => 3 ),
    array( 'db' => 'total',     'dt' => 4 ),
    array( 'db' => 'paid',     'dt' => 5 ),
    array( 'db' => 'due',     'dt' => 6 ),
    array(
        'db'        => 'created_at',
        'dt'        => 7,
        'formatter' => function( $d, $row ) {
            return date( 'jS M Y [ h:i A ]', strtotime($d));
        }
    ),
    array(
        'db'        => 'updated_at',
        'dt'        => 8,
        'formatter' => function( $d, $row ) {
            return date( 'jS M Y [ h:i A ]', strtotime($d));
        }
    ),
    array(
        'db'        => 'updated_by',
        'dt'        => 9
    ),
    array(
        'db'        => 'updated_by',
        'dt'        => 10
    )
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
// if(!isset($_COOKIE[$id])) {
// } else {
//   $val = $_COOKIE[$id];
//   $where = " where info='$val' ";
// }
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 * If you just want to use the basic configuration for DataTables with PHP
 * server-side, there is no need to edit below this line.
 */
 
require( './../config/ssp.classEdit.php' );
 
echo json_encode(
    SSP::simple( $_GET, $sql_details, $table, $primaryKey, $columns, $where )
);