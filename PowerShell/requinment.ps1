<#
wingetでソフトを一括インストールするPowerShellスクリプト例 winget-install.ps1
wingetを使おう (中編:wingetでソフトを管理する)

$appListに挙げられているソフトを順にインストールしていきます。

Copyright (c) 2021 astherier
This software is released under the MIT License.
http://opensource.org/licenses/mit-license.php
#>

$appList=@(
"Adobe.Acrobat.Reader.64-bit",
"Google.Chrome",
"Microsoft.Office"
)

function exec_winget($app){
    write-out "インストール開始：$app"
    & winget install $app
    if($LastExitCode -eq 0){
        $result="インストール成功：$app"
    }else{
        $result="インストール失敗：$app"
    }
    write-out $result
    $script:exec_result+=$result
}

$exec_result=@()
foreach($app in $appList){
    exec_winget $app
}
write-out "インストールがすべて終了しました。"
write-out $exec_result
