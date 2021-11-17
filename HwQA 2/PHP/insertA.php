<?PHP
    
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "survey";
    

    $set = $_POST['set'];
    $ans1 = $_POST['ans1'];
    $ans2 = $_POST['ans2'];
    $ans3 = $_POST['ans3'];
    $ans4 = $_POST['ans4'];
    $ans5 = $_POST['ans5'];


    
    
    // Create connection
    $conn = new mysqli($servername, $username, $password, $dbname);
    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    $sql = "INSERT INTO answer (`set`, ans1, ans2, ans3, ans4, ans5)
    VALUES ('$set', '$ans1', '$ans2', '$ans3', '$ans4', '$ans5')";


    
    if ($conn->multi_query($sql) === TRUE) {
        echo "New records created successfully";
    } else {
        
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
    
    $conn->close();




?>

