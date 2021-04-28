<#
Get-LastBootTime -ComputerName localhost
Find your computer name: Settings>System>About
#>



param(
[Parameter(Mandatory=$true)][string]$ComputerName
)

Get-WmiObject -Class Win32_OperatingSystem –ComputerName localhost |

Select-Object -Property CSName,@{n=”Last Booted”;

e={[Management.ManagementDateTimeConverter]::ToDateTime($_.LastBootUpTime)}}