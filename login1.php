<!--login1.php-->
<?php
session_start();
$conn = pg_connect("host=localhost port=5432 dbname=Ospedali user=postgres password=simone1998");
if (!$conn) {
    echo 'Connessione al database fallita.';
    exit();
  }
else {
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
$query = "SELECT paziente.tesserasanitara FROM paziente WHERE paziente.tesserasanitara = '". $_POST['tesseraSanitaria'] ."' ;";

//echo $query;
$result = pg_query($conn, $query);
$row = pg_fetch_array($result);
//print_r($row);

if (!$result) {
    echo "Si è verificato un errore.<br/>";
    echo pg_last_error($conn);
    exit();
  }

if ($row == false){
    echo "Non sei registrato,";
    print($htmlint);
    echo "se vuoi puoi <a href='registrazionePaziente.html'>registrarti</a>";
} else {
    $username = $_POST['tesseraSanitaria'];
    $_SESSION['usr'] = $username;
    if (isset($_SESSION['usr'])) {
        $now = <<<NOW
    <form action="areaPersonalePaziente.php" method="POST">
      <input class="left" type="submit" value="Continua">
    </form>
    NOW;
        print($htmlint);
        echo "Premi il pulsante per accedere al sito";
        print($now);
    }
else {
    print($htmlint);
        echo "Non risultano dati passati o memorizzati in una variabile di sessione valida<br>";
        echo "Se vuoi puoi <a href='login.html'>riprovare</a> ad accedere";
}}
}
?>
</BODY>
</HTML>
