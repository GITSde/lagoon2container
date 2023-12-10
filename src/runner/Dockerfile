FROM mcr.microsoft.com/dotnet/aspnet:6.0-alpine3.18 AS base

RUN mkdir -p /runner/
COPY entry-point.sh /runner/entry-point.sh
RUN chmod u+x /runner/entry-point.sh

# Alpine is in invariant culture mode by default.
# see https://learn.microsoft.com/en-us/dotnet/core/runtime-config/globalization?#invariant-mode
RUN apk update
RUN apk add icu-libs nginx
ENV DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=0

RUN chown -R root /etc/nginx
RUN rm /etc/nginx/http.d/default.conf && mkdir -p /usr/share/nginx/html/
COPY http.conf /etc/nginx/http.d/
COPY index.html /usr/share/nginx/html/

EXPOSE 80
ENV ASPNETCORE_URLS="http://*:80" 

ENTRYPOINT [ "/bin/sh", "/runner/entry-point.sh" ]