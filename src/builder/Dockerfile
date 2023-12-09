# ===================================== Builder image (dotnet6 + npm + lgn) =====================================
FROM mcr.microsoft.com/dotnet/sdk:6.0-alpine3.18 AS lagoon-sdk-6.0
# Install Lagoon dependencies
RUN dotnet nuget add source https://pkg.desirade.fr/nuget/Lagoon/v3/index.json -n Lagoon
RUN dotnet tool install --global lgn
ENV PATH="/root/.dotnet/tools:${PATH}"
# Install npm
RUN apk add --update nodejs npm git
# RUN npm install -g npm

RUN mkdir -p /app/src && mkdir /app/scripts
COPY entry-point.sh /app/entry-point.sh
RUN chmod u+x /app/entry-point.sh

ENTRYPOINT [ "/bin/sh", "/app/entry-point.sh" ]