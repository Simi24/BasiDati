<!--opt_adv.php-->
<?php
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
if (isset($_POST['tabella']) && isset($_POST['operazione'])) {
  $conn = pg_connect("host=localhost port=5432 dbname=Ospedali user=postgres password=simone1998");
  if (!$conn) {
    echo 'Connessione al database fallita.';
    exit();
  }
  else {
    //echo "Connessione riuscita."."<br/>";
    $query = "SELECT * FROM " . $_POST['tabella'] . ";";
    //echo $query;
    $result = pg_query($conn, $query);
    if (!$result) {
      echo "Si è verificato un errore.<br/>";
      echo pg_last_error($conn);
      exit();
    }
    else {
      $queryc = "select column_name from information_schema.columns where table_name='" . $_POST['tabella'] . "' order by ordinal_position;";
      //echo $queryc;
      $resultc = pg_query($conn, $queryc);
      if (!$resultc) {
        echo "Si è verificato un errore.<br/>";
        echo pg_last_error($conn);
        exit();
      }
      else {
        $columns = array();
        print ($htmlint);
        echo '<br><table>';
        echo '<tr>';
        while ($rowc = pg_fetch_array($resultc)) {
          $columns[] = $rowc[0];
          echo '<th>' . $rowc[0] . '</th>';
        };
        echo '</tr>';
        while ($row = pg_fetch_array($result)) {
          echo '<tr>';
          for ($i = 0;$i < count($columns);$i++) {
            echo '<td>' . $row[$i] . '</td>';
          };
          echo '</tr>';
        };
        echo '</table><br>';
        echo "Se vuoi puoi <a href='select_adv.php'>riprovare</a>";
      };
    };
  };
}
else {
  print ($htmlint);
  echo "Non risultano dati passati<br>";
  echo "Se vuoi puoi <a href='select_adv.php'>riprovare</a>";
}
?>
</BODY>
</HTML>

