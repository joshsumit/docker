
$package = "https://download.docker.com/components/engine/windows-server/cs-1.12/docker.zip"

Invoke-WebRequest $package `
-OutFile "$env:TEMP\docker.zip" `
-UseBasicParsing

Expand-Archive -Path "$env:TEMP\docker.zip" `
-DestinationPath $env:ProgramFiles

[Environment]::SetEnvironmentVariable(
  "Path", $env:Path + ";$($env:ProgramFiles)\Docker", [EnvironmentVariableTarget]::Machine
)

[Environment]::SetEnvironmentVariable(
  "DOCKER_HOST", "192.168.your.ip", [EnvironmentVariableTarget]::Machine
)

