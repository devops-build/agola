package main
//https://studygolang.com/articles/2283

import (
    "crypto/md5"
    "encoding/hex"
    "fmt"
)

//https://www.jianshu.com/p/58dcbf490ef3
func md5V(str string) string  {
    h := md5.New()
    h.Write([]byte(str))
    return hex.EncodeToString(h.Sum(nil))
}

func md5V2(str string) string {
    data := []byte(str)
    has := md5.Sum(data)
    md5str := fmt.Sprintf("%x", has)
    return md5str
}

func main() {
    h := md5.New()
    h.Write([]byte("123456")) // 需要加密的字符串为 123456
    cipherStr := h.Sum(nil)
    fmt.Println(cipherStr)
	fmt.Printf("%s\n", hex.EncodeToString(cipherStr)) // 输出加密结果
	
	abc:= "123456"
	fmt.Println(md5V(abc))
	fmt.Println(md5V2(abc))
	
}