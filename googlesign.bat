@echo off
echo all params is --- %*
REM 存储第一个参数
set jdk_path=%1

REM 存储第二个参数
set keystore_name=%2

REM 存储第二个参数
set alias=%3

REM 存储第二个参数
set output_filename=%4
set argC = 0
for %%x in (%*) do Set /A argC+=1
echo params num is --- %argC%

echo %jdk_path%  like C:\"Program Files"\Android\"Android Studio"\jbr\bin\java.exe

echo you need to run bat on folder which contain keystore file and pepk.jar and encryption_public_key.pem

echo 1. first param is java open jdk_path
echo 2.second param is your application keystore file name
echo 3. third param is keystore file alias
echo 4. fourth param is output zip file name


if %argC% NEQ 4 (
echo params is error

) else (
 %jdk_path% -jar pepk.jar --keystore=%keystore_name% --alias=%alias% --output=%output_filename% --include-cert --rsa-aes-encryption --encryption-key-path=encryption_public_key.pem
)