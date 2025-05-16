docker build -t blog-rodrigo-app:latest .

docker run -d -p 80:80 blog-rodrigo-app:latest

az login --allow-no-subscriptions

az group create --name containerappslab03 --location eastus

az acr create --resource-group containerappslab03 --name blogrodrigoacr --sku Basic

az acr login --name blogrodrigoacr

docker tag blog-rodrigo-app:latest blogrodrigoacr.azurecr.io/blog-rodrigo-app:latest

docker push blogrodrigoacr.azurecr.io/blog-rodrigo-app:latest




# Create Environment container app

az containerapp env create --name blog-rodrigo-env --resource-group containerappslab03 --location eastus

az containerapp create --name blog-rodrigo-app --resource-group containerappslab03 --environment blog-rodrigo-env --image blogrodrigoacr.azurecr.io/blog-rodrigo-app:latest --target-port 80 --ingress 'external' --registry-username username --registry-server blogrodrigoacr.azurecr.io --registry-password password


          