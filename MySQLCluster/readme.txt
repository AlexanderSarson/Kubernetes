// mysql root password:
kubectl create secret generic mysql-root-user-secret --from-literal=password=password123



Execute the following query in MYSQL Workbench

ALTER USER 'root' IDENTIFIED WITH mysql_native_password BY 'password'

Where root as your user localhost as your URL and password as your password

Then run this query to refresh privileges:

flush privileges;

Try connecting using node after you do so.

helm install --set operator.namespace=default --name mysql-operator mysql-operator

helm install --name mysql-operator mysql-operator


