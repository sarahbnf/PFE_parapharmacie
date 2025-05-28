<?php
session_start();
session_destroy();
header("Location: cnxadmin.html");
exit();
?>
