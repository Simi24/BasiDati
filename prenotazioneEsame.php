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
          <title>Nuova Prenotazione</title>
            <style>
              table, th, td {
                text-align: left;
                border: 1px solid;
              }
            </style>
          </HEAD>
        <BODY> 
        NOW;
        print_r($_POST);

$query = "SELECT * FROM esegue WHERE esame = '". $_POST['esame'] ."' ;";

$result = pg_query($conn, $query);
if (!$result && !isset($_POST['esame'])) {
    echo "Si è verificato un errore.<br/>";
    echo pg_last_error($conn);
    exit();
  }
  else {
    echo($htmlint);
    echo("<h1> Seleziona i dettagli dell'esame che hai scelto </h1>");
    $_SESSION['esame'] = $_POST['esame'];
print('<FORM method="POST" action="insertPrenotazione.php">');
print('<table class="insert">');
            print('<tr>
                <td>Laboratorio disponibile: </td>
                <td><select name="laboratorio">');
                while($row = pg_fetch_array($result)){
                    print ("<option value=\"" . htmlspecialchars($row["laboratorio"]) . "\">");
                    echo $row["laboratorio"];
                    print ("</option>");
                }
                echo('</select></td>
              </tr>
          <tr>
            <td>Urgenza: </td>
            <td><select name="urgenza">
            <option value="verde">verde</option>
            <option value="giallo">giallo</option>
            <option value="rosso">rosso</option>
            </select></td>
          </tr>
          <tr>
            <td>Regime: </td>
            <td><select name="regime">
            <option value="nazionale">nazionale</option>
            <option value="privato">privato</option>
            </select></td>
            </td>
          </tr>
          <tr>
            <td>Data esame: </td>
            <td>
                <input type="date" id="start" name="data"
                min="2022-01-01" max="2030-12-31">
            </td>
          </tr>
          <tr>
            <td colspan="2" class="center">
              <input type="submit" value="OK" />
              <input type="reset" value="Cancella" />
            </td>
          </tr>
          <tr>
          <td><a href="areaPersonalePaziente.php">Area personale</a></td> 
          </tr>
        </table>
</FORM><br>');
                
  }
} else {
    echo"Come sei arrivato qui? <a href='index.html'>VATTENE!</a>";
    exit();
}
}