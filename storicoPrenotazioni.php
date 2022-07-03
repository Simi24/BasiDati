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
          <title>Storico Prenotazioni</title>
            <style>
              table, th, td {
                text-align: left;
                border: 1px solid;
              }
            </style>
          </HEAD>
        <BODY> 
        NOW;

$query = "SELECT * FROM (prenotazione JOIN esame ON prenotazione.esame = esame.nome) WHERE prenotazione.paziente = ". $_SESSION['usr'] .";";
$result = pg_query($conn, $query);
if (!$result) {
    echo "Si è verificato un errore.<br/>";
    echo pg_last_error($conn);
    exit();
  }
  else {
    date_default_timezone_set('UTC');
    $dataCorrente = date('Y-m-j');
    
    print ($htmlint);
    echo("<h1> Lo storico delle mie prenotazioni </h1>");
    echo '<FORM method="POST" action="eliminaPrenotazione.php">
    <table>
<tr>
<th>Data Esame</th>
<th>Esame</td>
<th>Laboratorio</th>
<th>Urgenza</th>
<th>Regime</th>
<th>Data Prenotazione</th>
<th>Costo</th>
<th>Elimina Prenotazione</th>
</tr>';
    while ($row = pg_fetch_array($result)) {
      echo '<tr>
  <td>' . $row['dataesame'] . '</td>
  <td>' . $row['nome'] . '</td>
  <td>' . $row['laboratorio'] . '</td>
  <td>' . $row['urgenza'] . '</td>          
  <td>' . $row['regime'] . '</td>
  <td>' . $row['dataprenotazione'] . '</td>
  <td>' . $row['costo'] . '</td>';
  if($row['dataesame'] > $dataCorrente){
    echo ('<td><button type="text" name="todelete" value="'. $row['codice'].'">ELIMINA</button></td>');
  }
   echo('</tr>');           

    };
    echo "</table></form>";
//$row = pg_fetch_array($result);
        }

        echo("<div>
        <br>
        <a href='areaPersonalePaziente.php'>Area Personale</a>
        <a href='selectEsame.php'>Prenotazione esame</a><br>
        </div><br>");
    }else {
            echo"Come sei arrivato qui? <a href='index.html'>VATTENE!</a>";
            exit();
        }
        
}