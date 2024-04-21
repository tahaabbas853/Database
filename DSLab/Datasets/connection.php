dbh.inc php -Cuampphtdocstyoutubelooppholoopphp13includes- Atom
File Edit View Selection Find Packages Help
              index.php dibhinc.php
                private $charset;
10
11 public function connect() {
12 $this->servername = "localhost";
13 $this->username = "root";
14 $this->password = "";
15 $this->dbname = "testdb";
16 $this->charset = "utf8mb4";
17
                     try {
                          $dsn = "mysql:host=".$this->servername."; dbname=".$this->dbname.";charset=".$this->chars
                          $pdo = new PDO ($dsn, $this->username, $this->password);
18
19
20
21 $pdo->setAttribute(PDO: :ATTR_ERRMODE, PDO: :ERRMODE_EXCEPTION);
22 return $pdo;
23 } catch (PDOException $e) {
24 echo "Connection failed: ".$e->getMessage();
25