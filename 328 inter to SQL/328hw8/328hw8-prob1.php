<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">

<!--
    by: Adrian Haro
    last modified: 4/5/2020

    you can run this using the URL: http://nrs-projects.humboldt.edu/~afh146/328Hw8/hw8-prob1.php/
    chmod 711

-->

<head>
    <title> Hw8-prob1 Adrian H. </title>
    <meta charset="utf-8" />

    <link href="http://nrs-projects.humboldt.edu/~st10/styles/normalize.css"
          type="text/css" rel="stylesheet" />
</head>

<body>

    <h1> CS 328 Hw8 prob-1 </h1>
    <h2> Adapted by -- Adrian H. </h2>
    </br>
    <h2> The Dusty BookStore </h2>

    <?php
    // do you need to ask for username and password?

    if ( ! array_key_exists("username", $_POST) )
    {
        // no username in $_POST? they need a login
        //     form!
        ?>

        <form method="post"
              action="<?= htmlentities($_SERVER['PHP_SELF'],
                                        ENT_QUOTES) ?>">
        <fieldset>
            <legend> Please enter Oracle username/password:
                </legend>

            <label for="username"> Username: </label>
            <input type="text" name="username" id="username" 
                   required="required" />

            <label for="password"> Password: </label>
            <input type="password" name="password"
                   id="password" required="required" />

            <div class="submit">
                <input type="submit" value="Log in" />
            </div>
        </fieldset>
        </form>
    <?php
    }
    else
    {
        $username = strip_tags($_POST["username"]);
        $password = $_POST["password"];

    
     $db_conn_str = "(DESCRIPTION = (ADDRESS = (PROTOCOL = TCP)
        (HOST = cedar.humboldt.edu)
        (PORT = 1521))
        (CONNECT_DATA = (SID = STUDENT)))";


        $conn = oci_connect($username, $password, $db_conn_str);


        if ($conn == FALSE)
        {
             /* complain and exit */

             // put a complaint here and end the HTML result
             ?>

             <p> you done goofed! </p>
    <?php

             exit;
        }


        $ttl_query = "select ttl_name, ttl_cost, ttl_qty
                           from   title
                           where ttl_qty > 15";
        
        // Parse our query
        $ttl_stmt = oci_parse($conn, $empl_query);

        //Executes statement 
        oci_execute($ttl_stmt, OCI_DEFAULT);

        ?>
        <table>
        <caption> Titles Information </caption>
        <tr> <th scope="col"> Tittle Name </th>
             <th scope="col"> Tittle Cost</th>
             <th scope="col"> Tittle Quantity </th> 
        </tr>

        <?php

        //Fetch row by row
        while (oci_fetch($ttl_stmt))
                {
                    $curr_ttl_name = oci_result($ttl_stmt, "ttl_name");
                    $curr_ttl_cost = oci_result($ttl_stmt, "ttl_cost");
                    $curr_ttl_qty = oci_result($ttl_stmt, "ttl_qty");

                    ?>

            <tr> <td> <?= $curr_ttl_name ?> </td>
                 <td> <?= $curr_ttl_cost ?> </td>
                 <td> <?= $curr_ttl_qty ?> </td>
            </tr>

            <?php
                 }
             ?>
        </table>
        
        <?php
                
                oci_free_statement($ttl_stmt);
                oci_close($conn);
    }
        ?>




   

<footer>
    <hr />

    <p>
        Validate by pasting .xhtml copy's URL into<br />
        <a href="https://html5.validator.nu/">
            https://html5.validator.nu/
        </a>
    </p>

    <p>
        <a href=
           "http://jigsaw.w3.org/css-validator/check/referer?profile=css3">
            <img src="http://jigsaw.w3.org/css-validator/images/vcss"
                 alt="Valid CSS3!" height="31" width="88" />
        </a>
    </p>
    </footer>
</body>
</html> 
