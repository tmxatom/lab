echo "docker build -t test ."
docker build -t test .
echo "run -p 8081:80 test" 
docker run -p 8081:80 test      