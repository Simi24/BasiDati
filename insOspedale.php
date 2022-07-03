<!--basic_ins.php-->
<?php
session_start();
$htmlint = <<<NOW
<HTML>
  <HEAD>
    <style>
      table, th, td {
        text-align: left;
        border: 1px solid;
      }
    </style>
  </HEAD>
<BODY> 
NOW;
//print_R($_POST);
  $conn = pg_connect("host=localhost port=5432 dbname=Ospedali user=postgres password=simone1998");
  if (!$conn) {
    echo 'Connessione al database fallita.';
    exit();
  }
  else {
    //echo "Connessione riuscita."."<br/>";
    print ($htmlint);
            echo '<br><table>';
            print ("<form action=\"basic_ins.php\" method=\"POST\">");
            print ("<tr><th>Codice</th><td><input type=\"text\" name=\"codice\" required></td></tr>");
            print ("<tr><th>Nome</th><td><input type=\"text\" name=\"nome\" required></td</tr>");
            print ("<tr><th>Via</th><td><input type=\"text\" name=\"via\" required></td></tr>");
            print ("<tr><th>CAP</th><td><input type=\"text\" name=\"cap\" required></td></tr>");
            print ("<tr><td><input type=\"submit\" name=\"toinsert\" value=\"Insert\"></td></tr>");
            print ("</form>");
            print ("</table>");
  };
?>
</BODY>
</HTML>