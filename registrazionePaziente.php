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
    $tesseraSanitaria = isset($_POST['tesseraSanitaria']) ? $_POST['tesseraSanitaria'] : '';
    $nome = isset($_POST['nome']) ? $_POST['nome'] : '';
    $cognome = isset($_POST['cognome']) ? $_POST['cognome'] : '';
    $CF = isset($_POST['CF']) ? $_POST['CF'] : '';
    $data = isset($_POST['nascita']) ? $_POST['nascita'] : '';

    $query = "INSERT INTO paziente (tesserasanitara, cognome, nome, CF, dataN) VALUES ($tesseraSanitaria,'$nome','$cognome','$CF','$data')";
    $result = pg_query($conn, $query);
    //echo $query;
    if (!$result) {
      echo "Si è verificato un errore.<br/>";
      echo pg_last_error($conn)."<br/>";
      echo "<a href='registrazionePaziente.html'>Riprova!</a> <br/>";
      exit();
    }
    else {
      //$cmdtuples = pg_affected_rows($result);
      $username = $tesseraSanitaria;
      $_SESSION['usr'] = $username;
      echo "Inserimento avvenuto con successo<br><a href='areaPersonalePaziente.php'>VAI!</a>";
    };
  };

?>
</BODY>
</HTML>