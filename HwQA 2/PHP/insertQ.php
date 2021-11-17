<?PHP
    
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "survey";
    
    $user = $_POST['username'];
    $q1 = $_POST['qa1'];
    $q2 = $_POST['qa2'];
    $q3 = $_POST['qa3'];
    $q4 = $_POST['qa4'];
    $q5 = $_POST['qa5'];
    $set = $_POST['set'];

    
    
    // Create connection
    $conn = new mysqli($servername, $username, $password, $dbname);
    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    $sql = "INSERT INTO qa (`set`, qa1, qa2, qa3, qa4, qa5)
    VALUES ('$set', '$q1', '$q2', '$q3', '$q4', '$q5');";
    $sql .= "INSERT INTO setQA (username, `set`)
    VALUES ('$user', '$set')";

    
    if ($conn->multi_query($sql) === TRUE) {
        echo "New records created successfully";
    } else {
        
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
    
    $conn->close();




?>

