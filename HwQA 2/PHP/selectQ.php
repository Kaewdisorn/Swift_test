<?PHP
    
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "survey";
    

    // Create connection
    $conn = new mysqli($servername, $username, $password, $dbname);
    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
    
    
    $sql = "SELECT * FROM qa";
    
    $result = $conn->query($sql);
    
    if ($result->num_rows > 0){
        
        while($row = $result->fetch_assoc()) {
            
            $json[]=$row;
            //$json[] = array('set' => $row['set']);
        }
        
        print(json_encode($json));
        
    }
    
    
 /*   if(activity == "cntQ"){
        
        $sql = "SELECT * FROM qa ";
        $result = $conn->query($sql);
        
        if ($result->num_rows > 0){
            
            while($row = $result->fetch_assoc()) {
                
                //$json[]=$row;
                $json[] = array('set' => $row['set']);
                
            }
            
            print(json_encode($json));
        }
        
    } else {
        
        $sql = "INSERT INTO qa VALUES ('$set','$Q1','$Q2','$Q3','$Q4','$Q5')";
        $result = $conn->query($sql);
        $sql = "INSERT INTO setQA VALUES ('$user','$set')";
        $result = $conn->query($sql);

    }*/

    
    $conn->close();

?>

