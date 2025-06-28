# FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build

# WORKDIR /Source

# COPY /Threedify.Worker . 

# RUN dotnet restore Threedify.Worker.csproj
# RUN dotnet build ${PROJECT_NAME}.csproj -c Release
# RUN dotnet publish Threedify.Worker.csproj -c Release -o /app


FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime

WORKDIR /app
COPY . . 
# COPY --from=build /app .
EXPOSE 80
ENTRYPOINT ["dotnet", "Threedify.Worker.dll"]
