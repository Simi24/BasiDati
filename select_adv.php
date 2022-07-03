<!--select_adv.php-->
<html>
  <head>
    <title>Select automatic</title>
  </head>
<body>
<?php
$conn = pg_connect("host=localhost port=5432 dbname=Ospedali user=postgres password=simone1998");
if (!$conn) {
  echo 'Connessione al database fallita.';
  exit();
}
else {
  //echo "Connessione riuscita."."<br/>";
  $query = "SELECT table_name as table FROM information_schema.tables WHERE table_type='BASE TABLE' and table_schema='public' ORDER BY table_name";
  $result = pg_query($conn, $query);
  if (!$result) {
    echo "Si è verificato un errore.<br/>";
    echo pg_last_error($conn);
    exit();
  }
  else {
    print ("<form action=\"opt_adv.php\" method=\"POST\">");
    print ("<select name=\"tabella\">");
    while ($row = pg_fetch_array($result)) {
      print ("<option value=\"" . htmlspecialchars($row["table"]) . "\">");
      echo $row["table"];
      print ("</option>");
    };
    print ("</select>");
    print ("<select name=\"operazione\">");
    print ("<option value=\"select\">select</option>");
    print ("<option value=\"insert\">insert</option>");
    //print("<option value=\"update\">update</option>");
    //print("<option value=\"delete\">delete</option>");
    print ("</select>");
    print ("<input  type=\"submit\" >");
    print ("</form>");
  };
};
?>
</body>
</html>