cd /app

# Wait for the build to be fully finished before launching the app
while [ ! -f state.txt ]
do
  echo "Wait for build to complete ..."
  sleep 2 
done

echo "Build completed! Launching application ... $RUNER_APP_NAME"

dotnet $RUNER_APP_NAME.Server.dll