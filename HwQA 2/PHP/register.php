<?PHP
    
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "survey";
    
    $user = $_POST['username'];
    $pass = $_POST['password'];
    $name = $_POST['name'];
    $surname = $_POST['surname'];
    $email = $_POST['email'];
    $tel = $_POST['tel'];
    $status = $_POST['status'];
    

    // Create connection
    $conn = new mysqli($servername, $username, $password, $dbname);
    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
    
    $sql = "SELECT * FROM profile WHERE username = '$user'";
    $result = $conn->query($sql);
    
    if ($result->num_rows > 0){
        
        while($row = $result->fetch_assoc()) {
            
            $json[]=$row;
            
        }

        print(json_encode($json));
    }
    else {
        
        
        $sql = "INSERT INTO profile (username, name, surname, email, tel)
        VALUES ('$user', '$name', '$surname', '$email', '$tel');";
        $sql .= "INSERT INTO user (username, password, status)
        VALUES ('$user', '$pass', '$status')";
        
        if ($conn->multi_query($sql) === TRUE) {
            echo "New records created successfully";
        } else {
            
            echo "Error: " . $sql . "<br>" . $conn->error;
        }
    }
    
    $conn->close();

?>

