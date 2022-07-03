<?php
session_start();
//print_r($_SESSION);
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
if (isset($_SESSION['usr'])) {
    $conn = pg_connect("host=localhost port=5432 dbname=Ospedali user=postgres password=simone1998");
  if (!$conn) {
    echo 'Connessione al database fallita.';
    exit();
  }
  else {
    //echo "Connessione riuscita."."<br/>";
    $nome = isset($_POST['nome']) ? $_POST['nome'] : '';
    $cognome = isset($_POST['cognome']) ? $_POST['cognome'] : '';
    $query = "UPDATE paziente set  cognome='$cognome', nome='$nome'";
    //echo $query;
    $result = pg_query($conn, $query);
    if (!$result) {
      echo "Si è verificato un errore.<br/>";
      echo pg_last_error($conn);
      exit();
    }
    else {
      //$cmdtuples = pg_affected_rows($result);
      echo "Aggiornamento avvenuto con successo<br><a href='areaPersonalePaziente.php'>ritorna</a>";
    };
  };
}
else {
  print ($htmlint);
  echo "Non risultano dati passati<br>";
  echo "Se vuoi puoi <a href='modificaPaziente.php'>riprovare</a>";
}
?>
</BODY>
</HTML>