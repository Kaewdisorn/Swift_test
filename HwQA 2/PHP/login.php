<?PHP
    
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "survey";
    
    $user = $_POST['username'];
    $pass = $_POST['password'];
    
    

    // Create connection
    $conn = new mysqli($servername, $username, $password, $dbname);
    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
    
    $sql = "SELECT * FROM user WHERE username = '$user'";
    //$sql = "SELECT * FROM user ";

    $result = $conn->query($sql);
    
    if ($result->num_rows > 0){
        
        while($row = $result->fetch_assoc()) {
            
            $json[]=$row;
            
        }

        print(json_encode($json));
    }
    
    $conn->close();

?>

