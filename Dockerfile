FROM microsoft/dotnet:1.1.1-sdk
ENV NUGET_XMLDOC_MODE skip

WORKDIR /vsdbg
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        unzip \
    && rm -rf /var/lib/apt/lists/* \
    && curl -sSL https://aka.ms/getvsdbgsh | bash /dev/stdin -v latest -l /vsdbg

WORKDIR /app

EXPOSE 6000

ENTRYPOINT ["tail", "-f", "/dev/null"]