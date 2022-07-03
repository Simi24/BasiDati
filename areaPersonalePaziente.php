<?php
session_start();
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
            <title>Area personale</title>
            <style>
              table, th, td {
                text-align: left;
                border: 1px solid;
              }
            </style>
          </HEAD>
        <BODY> 
        NOW;

$query = "SELECT * FROM paziente WHERE paziente.tesserasanitara = '". $_SESSION['usr'] ."' ;";
$result = pg_query($conn, $query);
$row = pg_fetch_array($result);

echo($htmlint);
echo("<h1>Area personale di ".$row['nome']." ".$row['cognome']."</h1>");
echo("<br><table>
<tr>
  <th><a href='storicoPrenotazioni.php'>Le mie prenotazioni</a></th>
</tr>
<tr>
  <th><a href='selectEsame.php'>Prenota un esame</a></th>
</tr>
<tr>
  <th><a href='modificaPaziente.php'>Modifica il profilo</a></th>
</tr>
");
    } else {
        echo"Come sei arrivato qui? <a href='index.html'>VATTENE!</a>";
        exit();
    }
    
    }

?>