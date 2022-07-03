<?php
session_start();
//print_r($_SESSION);
$conn = pg_connect("host=localhost port=5432 dbname=Ospedali user=postgres password=simone1998");
if (!$conn) {
    echo 'Connessione al database fallita.';
    exit();
  }
else {
    if (isset($_SESSION['usr'])) {
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

$query = "SELECT nome, cognome FROM paziente WHERE tesserasanitara = ". $_SESSION['usr'] ." ;";
//echo($query);
$result = pg_query($conn, $query);
if (!$result) {
    echo "Si è verificato un errore.<br/>";
    echo pg_last_error($conn);
    exit();
  }
  else {
    echo($htmlint);
    echo("<h1> Modifica il profilo </h1>");
    $row = pg_fetch_array($result);
print('<FORM method="POST" action="modificaPaziente2.php">');
print('<table class="insert">');
print ("<tr><th>Nome</th><td><input type=\"text\" name=\"nome\" value='" . $row['nome'] . "' required></td</tr>");
print ("<tr><th>Cognome</th><td><input type=\"text\" name=\"cognome\" value='" . $row['cognome'] . "' required></td></tr>");                            
echo('<td colspan="2" class="center">
        <input type="submit" value="OK" />
        <input type="reset" value="Cancella" />
        </td>
        </tr>
        </table>
</FORM><br>');
                
  }
} else {
    echo"Come sei arrivato qui? <a href='index.html'>VATTENE!</a>";
    exit();
}
}