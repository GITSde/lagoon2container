cd /app

# Start nginx server to show a page during the build process
nginx

echo "Application container ready !" > /usr/share/nginx/html/state.txt

# Wait for a little before trying to start the application in order to allow
# the builder job to rebuild the application if necessary
sleep 5

# Wait for the build to be fully finished before launching the app
while [ ! -f state.txt ]
do
  echo "Building application" > /usr/share/nginx/html/state.txt
  echo "Wait for build to complete ..."
  sleep 2 
done
echo "Starting application ..." > /usr/share/nginx/html/state.txt
sleep 2 

echo "Build completed! Stopping nginx"
nginx -s stop

echo  "Starting application ... $RUNER_APP_NAME"
dotnet $RUNER_APP_NAME.Server.dll