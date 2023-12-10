echo "lagoon-builder ready to work !"

rm -rf /app/build/*
rm -rf /app/src/*
mkdir /app/build 
cd /app/src

dirName=`echo $GIT_URL | rev | cut -d/ -f1 | rev`
git clone $GIT_URL $dirName

cd $dirName
dotnet build -c Release
dotnet publish -c Release -o /app/build/

echo "ready" > /app/build/state.txt
echo "Build runner completed !"