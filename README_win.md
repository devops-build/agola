go version
go build D:\Development\Project\devcn.fun\g-dev1\agola\cmd\agola

go build D:\Development\Project\devcn.fun\g-dev1\agola\cmd\toolbox

export GO111MODULE=on
export GOPROXY=https://goproxy.cn

 1997  api=http://www2.devcn.fun:8000
 1998  ./agola  --token "admintoken" -u $api remotesource list
 1999  ./agola 
 2000  ./agola  --token "admintoken" -u $api user list
 2001  ./agola 
 2002  ./agola  --token "admintoken" -u $api org member list -n org1
 2003  ./agola  --token "admintoken" -u $api project list --parent user/sam
 2004  ./agola  --token "admintoken" -u $api run list --project aa9ed7eb-7a10-423e-8016-55b16051fc32

```
go: finding github.com/docker/docker v1.13.1
# github.com/mattn/go-sqlite3
exec: "gcc": executable file not found in %PATH%
# golang.org/x/sys/windows
D:\gopath\pkg\mod\golang.org\x\sys@v0.0.0-20191024073052-e66fe6eb8e0c\windows\dll_windows.go:21:6: missing function body
D:\gopath\pkg\mod\golang.org\x\sys@v0.0.0-20191024073052-e66fe6eb8e0c\windows\dll_windows.go:24:6: missing function body
note: module requires Go 1.12
```

```
D:\Development\Project\devcn.fun\g-dev1\agola>go build D:\Development\Project\devcn.fun\g-dev1\agola\cmd\toolbox
# agola.io/agola/cmd/toolbox/cmd
cmd\toolbox\cmd\sleeper.go:38:22: undefined: syscall.SIGCHLD
cmd\toolbox\cmd\sleeper.go:44:18: undefined: syscall.Wait4
cmd\toolbox\cmd\sleeper.go:44:46: undefined: syscall.WNOHANG
cmd\toolbox\cmd\sleeper.go:44:62: undefined: syscall.WUNTRACED
cmd\toolbox\cmd\sleeper.go:44:80: undefined: syscall.WCONTINUED
```