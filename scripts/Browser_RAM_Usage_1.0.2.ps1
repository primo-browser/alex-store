Clear-Host;

Write-Host -ForegroundColor White "`n Browser Total Working Set Usage Script"
Write-Host -ForegroundColor White "`  Copyright (c) 2025 Alex313031"

sleep 1;

$chromium_process = Get-Process -Name chrome -ErrorAction SilentlyContinue;
$thorium_process = Get-Process -Name thorium -ErrorAction SilentlyContinue;

Do {
  Clear-Host;

  $primobrowser_process = Get-Process -Name PrimoBrowser -ErrorAction SilentlyContinue;
  $primobeta_process = Get-Process -Name PrimoBeta -ErrorAction SilentlyContinue;
  $inso_process = Get-Process -Name insomniac -ErrorAction SilentlyContinue;

  if ($inso_process) {
    $inso_usage = (Get-Process -Name Insomniac | Measure-Object WorkingSet -sum).sum /1GB;
    $inso_usage_rounded = [math]::Round($inso_usage,3);
    Write-Host -ForegroundColor Green -NoNewline "`n Insomniac RAM usage:" $inso_usage_rounded "GB";
    echo .
  } else {
    Write-Host -ForegroundColor Yellow "`n insomniac.exe not running, skipping...";
  }

  if (!$primobrowser_process -and !$primobeta_process) {
    Write-Host -ForegroundColor Red "`n Error: No Primo process found!"
  } else {
    if ($primobeta_process) {
      $primobeta_usage = (Get-Process -Name PrimoBeta | Measure-Object WorkingSet -sum).sum /1GB;
      $primobeta_usage_rounded = [math]::Round($primobeta_usage, 3);
      Write-Host -ForegroundColor Green -NoNewline "`n PrimoBeta RAM usage:" $primobeta_usage_rounded "GB";
      echo .
    } else {
      Write-Host -ForegroundColor Yellow "`n PrimoBeta.exe not running, skipping...";
    }

    if ($primobrowser_process) {
      $primobrowser_usage = (Get-Process -Name PrimoBrowser | Measure-Object WorkingSet -sum).sum /1GB;
      $primobrowser_usage_rounded = [math]::Round($primobrowser_usage, 3);
      Write-Host -ForegroundColor Green -NoNewline "`n PrimoBrowser RAM usage:" $primobrowser_usage_rounded "GB";
      echo .
    } else {
      Write-Host -ForegroundColor Yellow "`n PrimoBrowser.exe not running, skipping...";
    }
  }
  sleep 1;
} while ($true)

echo ""
pause
