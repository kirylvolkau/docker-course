# specify base image
FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build

# arg - for building docker image
# env - for future containers
ARG BUILD_CONFIGURATION=Debug
ENV ASPNETCORE_ENVIRONMENT=Development

# if there is no such folder it will be created
WORKDIR /app

# copy .csproj file to get dependencies (not required in our case, still)
# get dependencies via dotnet restore command
# moreover, not to invalidate the cache every time docker build is run it is good to
# fitsly copy the file with dependencies -> restore them -> them copy everything else.
COPY simple-api/simple-api.csproj ./
RUN dotnet restore

# copy all other files
# run application (could be done with RUN dotnet run)
COPY simple-api/ ./
CMD ["dotnet", "run"] 
