<?php
session_start();
$conn = pg_connect("host=localhost port=5432 dbname=Ospedali user=postgres password=simone1998");
if (!$conn) {
    echo 'Connessione al database fallita.';
    exit();
  }
else {
    if (isset($_SESSION['usr']) && isset($_SESSION['esame'])) {
        $htmlint = <<<NOW
<HTML>
	<HEAD>
		<style>
			input.left {
				float:left;
				border-radius: 12px;
			}
			input.right {
				float:right;
				border-radius: 12px;
			}
		</style>
	</HEAD>
<BODY> 
NOW;

    echo($htmlint);
    $errore="";
    if (empty($_POST["laboratorio"])) 
		$errore= $errore . " manca laboratorio, ";
	if (empty($_POST["urgenza"])) 
		$errore= $errore . " manca urgenza, ";  
	if (empty($_POST["regime"])) 
		$errore= $errore . " manca regime, ";
	if (empty($_POST["data"])) 
        $errore= $errore . " manca data, "; 
	if ($errore != "") {
        echo $errore .  "<a href='selectEsame.php'>riprova</a>";
    } else {
      
        date_default_timezone_set('UTC');
        $dataCorrente = date('Y-m-j');
        $paziente = $_SESSION['usr'];
        $esame = $_SESSION['esame'];
        $urgenza = isset($_POST['urgenza']) ? $_POST['urgenza'] : '';
        $regime = isset($_POST['regime']) ? $_POST['regime'] : '';
        $data = isset($_POST['data']) ? $_POST['data'] : '';
        
        $laboratorio = isset($_POST['laboratorio']) ? $_POST['laboratorio'] : '';
        
        $queryIns = "INSERT INTO prenotazione (codice, dataesame, laboratorio, esame, paziente, urgenza, regime, dataprenotazione) VALUES(DEFAULT, '$data', $laboratorio, '$esame', $paziente, '$urgenza', '$regime', '$dataCorrente')";
        
        $resultIns = pg_query($conn, $queryIns);
        if (!$resultIns) {
          echo "Si è verificato un errore.<br/>";
          echo pg_last_error($conn);
          echo("<a href='prenotazioneEsame.php'>riprova</a>");
          exit();
        }
        else {
          //$cmdtuples = pg_affected_rows($result);
          unset($_SESSION['esame']);
          echo "Prenotazione avvenuta con successo<br><a href='areaPersonalePaziente.php'>ritorna</a>";
        };
    }

  }
}




	
?>