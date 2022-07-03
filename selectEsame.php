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

$query = "SELECT * FROM esame ;";
//echo($query);
$result = pg_query($conn, $query);
if (!$result) {
    echo "Si è verificato un errore.<br/>";
    echo pg_last_error($conn);
    exit();
  }
  else {
    echo($htmlint);
    echo("<h1> Scegli l'esame che vuoi prenotare </h1>");
    
print('<FORM method="POST" action="prenotazioneEsame.php">');
print('<table class="insert">');
            print('<tr>
                <td>Esame: </td>
                <td><select name="esame">');
                while($row = pg_fetch_array($result)){
                    print ("<option value=\"" . htmlspecialchars($row["nome"]) . "\">");
                    echo $row["nome"];
                    print ("</option>");
                }
                echo('</select></td>
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