<?php

    for($i = 0; $i<10; $i++){
        echo("<h1>$i</h1>");
        $i++;
    }

    echo('<hr>');

    for($i = 0; $i<12; $i++){
        $i = $i + 2;
        if($i % 2 == 0){
            echo("<h1>$i</h1>");
        }
    }

    echo('<hr>');

    for($i = 0; $i<12; $i++){
        $i = $i + 3;
        if($i % 2 == 0){
            echo("<h1>$i</h1>");
        }
    }

    echo("<hr>");



?>