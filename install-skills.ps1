# WorkBuddy 技能一键安装脚本（Windows）
# 用法：在 PowerShell 中运行  .\install-skills.ps1
# 作用：从 GitHub 源仓库下载 9 个技能并安装到 %USERPROFILE%\.workbuddy\skills\
$ErrorActionPreference = "Stop"
$dest = Join-Path $env:USERPROFILE ".workbuddy\skills"
New-Item -ItemType Directory -Force -Path $dest | Out-Null
$tmp = Join-Path $env:TEMP "wb-skills-download"
New-Item -ItemType Directory -Force -Path $tmp | Out-Null

function Get-Tarball($url, $out) {
    Write-Host "下载 $url ..."
    Invoke-WebRequest -Uri $url -OutFile $out -UseBasicParsing
}

# 1) awesome-openclaw-skills：find-skills / agent-browser / skill-vetter / ontology / humanizer / proactive-agent
$t1 = Join-Path $tmp "aos.tar.gz"
Get-Tarball "https://codeload.github.com/sundial-org/awesome-openclaw-skills/tar.gz/refs/heads/main" $t1
tar -xzf $t1 -C $tmp
$src1 = Join-Path $tmp "awesome-openclaw-skills-main\skills"
foreach ($s in "find-skills","agent-browser","skill-vetter","ontology","humanizer","proactive-agent") {
    Copy-Item -Recurse -Force (Join-Path $src1 $s) $dest
    Write-Host "已安装 $s"
}

# 2) openclaw-all：self-improving-agent / web-tools-guide
$t2 = Join-Path $tmp "oca.tar.gz"
Get-Tarball "https://codeload.github.com/AI-leowsir/openclaw-all/tar.gz/refs/heads/main" $t2
tar -xzf $t2 -C $tmp
$src2 = Join-Path $tmp "openclaw-all-main\workspace\skills"
foreach ($s in "self-improving-agent","web-tools-guide") {
    Copy-Item -Recurse -Force (Join-Path $src2 $s) $dest
    Write-Host "已安装 $s"
}

# 3) myskills：dev-expert-pro（编程专家 Pro，仓库较大约 90MB，耐心等待）
$t3 = Join-Path $tmp "ms.tar.gz"
Get-Tarball "https://codeload.github.com/guoqinchen/myskills/tar.gz/refs/heads/main" $t3
tar -xzf $t3 -C $tmp
Copy-Item -Recurse -Force (Join-Path $tmp "myskills-main\dev-expert-pro") $dest
Write-Host "已安装 dev-expert-pro"

Remove-Item -Recurse -Force $tmp
Write-Host "`n全部完成！共 9 个技能已安装到 $dest"
Write-Host "重启 WorkBuddy 后生效。"
