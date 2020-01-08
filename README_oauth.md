add_remote:
  only add to sqlite;

===========================
registUser:
//302
  http://git.ali.devcn.fun:81/login/oauth/authorize?client_id=859472f8-4e69-45d4-b7e9-5b25b5ff85f4&redirect_uri=http%3A%2F%2Fag.ten.devcn.fun%3A81%2Foauth2%2Fcallback&response_type=code&scope=&state=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE1Nzg1MzEyNjUsInJlbW90ZV9zb3VyY2VfbmFtZSI6ImdpdGVhIiwicmVxdWVzdCI6IntcIlVzZXJOYW1lXCI6XCJzYW1cIixcIlJlbW90ZVNvdXJjZU5hbWVcIjpcImdpdGVhXCIsXCJVc2VyQWNjZXNzVG9rZW5cIjpcIlwiLFwiT2F1dGgyQWNjZXNzVG9rZW5cIjpcIlwiLFwiT2F1dGgyUmVmcmVzaFRva2VuXCI6XCJcIixcIk9hdXRoMkFjY2Vzc1Rva2VuRXhwaXJlc0F0XCI6XCIwMDAxLTAxLTAxVDAwOjAwOjAwWlwifSIsInJlcXVlc3RfdHlwZSI6InJlZ2lzdGVydXNlciJ9.kYT2m23G1x2T1iswOzkL1SD_z-mmHanjjJRnNCuSI9o
https://jwt.io：
{
  "exp": 1578531265,
  "remote_source_name": "gitea",
  "request": "{\"UserName\":\"sam\",\"RemoteSourceName\":\"gitea\",\"UserAccessToken\":\"\",\"Oauth2AccessToken\":\"\",\"Oauth2RefreshToken\":\"\",\"Oauth2AccessTokenExpiresAt\":\"0001-01-01T00:00:00Z\"}",
  "request_type": "registeruser"
}
===
oauth2/callback: TODO
===
  //callback: (userBrowser)
  http://ag.ten.devcn.fun:81/api/oauth2/callback?code=l5eLqfLl_tN5R-aWJ4AOFlb0pPKIGRmIYBr1PvKOiaU%3D&state=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE1Nzg1MzEyNjUsInJlbW90ZV9zb3VyY2VfbmFtZSI6ImdpdGVhIiwicmVxdWVzdCI6IntcIlVzZXJOYW1lXCI6XCJzYW1cIixcIlJlbW90ZVNvdXJjZU5hbWVcIjpcImdpdGVhXCIsXCJVc2VyQWNjZXNzVG9rZW5cIjpcIlwiLFwiT2F1dGgyQWNjZXNzVG9rZW5cIjpcIlwiLFwiT2F1dGgyUmVmcmVzaFRva2VuXCI6XCJcIixcIk9hdXRoMkFjY2Vzc1Rva2VuRXhwaXJlc0F0XCI6XCIwMDAxLTAxLTAxVDAwOjAwOjAwWlwifSIsInJlcXVlc3RfdHlwZSI6InJlZ2lzdGVydXNlciJ9.kYT2m23G1x2T1iswOzkL1SD_z-mmHanjjJRnNCuSI9o

{
  "exp": 1578531265,
  "remote_source_name": "gitea",
  "request": "{\"UserName\":\"sam\",\"RemoteSourceName\":\"gitea\",\"UserAccessToken\":\"\",\"Oauth2AccessToken\":\"\",\"Oauth2RefreshToken\":\"\",\"Oauth2AccessTokenExpiresAt\":\"0001-01-01T00:00:00Z\"}",
  "request_type": "registeruser"
}

=============================
login:
http://git.ali.devcn.fun:81/login/oauth/authorize?client_id=859472f8-4e69-45d4-b7e9-5b25b5ff85f4&redirect_uri=http%3A%2F%2Fag.ten.devcn.fun%3A81%2Foauth2%2Fcallback&response_type=code&scope=&state=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE1Nzg1MzM4ODQsInJlbW90ZV9zb3VyY2VfbmFtZSI6ImdpdGVhIiwicmVxdWVzdCI6IntcIlJlbW90ZVNvdXJjZU5hbWVcIjpcImdpdGVhXCIsXCJVc2VyQWNjZXNzVG9rZW5cIjpcIlwiLFwiT2F1dGgyQWNjZXNzVG9rZW5cIjpcIlwiLFwiT2F1dGgyUmVmcmVzaFRva2VuXCI6XCJcIixcIk9hdXRoMkFjY2Vzc1Rva2VuRXhwaXJlc0F0XCI6XCIwMDAxLTAxLTAxVDAwOjAwOjAwWlwifSIsInJlcXVlc3RfdHlwZSI6ImxvZ2ludXNlciJ9.Vf6u6UTbxPLEetE0o3qp3A3tH-czo1IaDpHbYk_0aS0
302:
http://ag.ten.devcn.fun:81/oauth2/callback?code=xq57jZ2hALJUFu_Xq6e0XZAsXiLFOCwB90uJdfT0rp0%3D&state=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE1Nzg1MzM4ODQsInJlbW90ZV9zb3VyY2VfbmFtZSI6ImdpdGVhIiwicmVxdWVzdCI6IntcIlJlbW90ZVNvdXJjZU5hbWVcIjpcImdpdGVhXCIsXCJVc2VyQWNjZXNzVG9rZW5cIjpcIlwiLFwiT2F1dGgyQWNjZXNzVG9rZW5cIjpcIlwiLFwiT2F1dGgyUmVmcmVzaFRva2VuXCI6XCJcIixcIk9hdXRoMkFjY2Vzc1Rva2VuRXhwaXJlc0F0XCI6XCIwMDAxLTAxLTAxVDAwOjAwOjAwWlwifSIsInJlcXVlc3RfdHlwZSI6ImxvZ2ludXNlciJ9.Vf6u6UTbxPLEetE0o3qp3A3tH-czo1IaDpHbYk_0aS0

http://ag.ten.devcn.fun:81/api/oauth2/callback?code=xq57jZ2hALJUFu_Xq6e0XZAsXiLFOCwB90uJdfT0rp0%3D&state=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE1Nzg1MzM4ODQsInJlbW90ZV9zb3VyY2VfbmFtZSI6ImdpdGVhIiwicmVxdWVzdCI6IntcIlJlbW90ZVNvdXJjZU5hbWVcIjpcImdpdGVhXCIsXCJVc2VyQWNjZXNzVG9rZW5cIjpcIlwiLFwiT2F1dGgyQWNjZXNzVG9rZW5cIjpcIlwiLFwiT2F1dGgyUmVmcmVzaFRva2VuXCI6XCJcIixcIk9hdXRoMkFjY2Vzc1Rva2VuRXhwaXJlc0F0XCI6XCIwMDAxLTAxLTAxVDAwOjAwOjAwWlwifSIsInJlcXVlc3RfdHlwZSI6ImxvZ2ludXNlciJ9.Vf6u6UTbxPLEetE0o3qp3A3tH-czo1IaDpHbYk_0aS0
ret:
{"request_type":"loginuser","response":{"oauth2_redirect":"","token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE1Nzg1MzM4ODYsInN1YiI6IjkwOWE4ZTgyLTVmYmItNDEyNy1hNjc2LTcxOWM2ZDZlMTdlMyJ9.jYinuimC4v3gfUyPc9E6k9sY1Hcukcn31PBhFVqFJq8","user":{"id":"909a8e82-5fbb-4127-a676-719c6d6e17e3","username":"sam","tokens":["directrun"],"linked_accounts":[{"id":"6a753830-9c57-4583-87e0-3c92a20a74b4","remote_source_id":"6ea611c7-e0c4-4853-9b7f-76e51ff46dc8","remote_user_name":"sam","remote_user_avatar_url":""}]}}}
-----------------------
//TODO01: ERR LINK?(not this, it's in back-soft-req)

//or: call gitea? (yes: call gitea(withParam:agolaCallBackUrl「/oauth2/callback」))

//or2: (back call self) (not api/oauth2/callback)
//agola http://www2.devcn.fun:8000/oauth2/callback
//step01: just giteaAuth->giteaUserBrowser_302?:oauth2/callback[getTokenFromGitea]-> redirect2UIPage->
//step02: 前端调取信息[code,state],入cookie?：userBrowser:api/oauth2/callback[valdate:重复调用到/oauth2/callback的方法[cresp,用于判断switch及authresp信息]？;switch:create,login,auth,regist -> ret:LoginUserResponse/xxResponse]

    user.go:
	oauth2Token, err := oauth2Source.RequestOauth2Token(h.webExposedURL+"/oauth2/callback", code)
	if err != nil {
		return nil, err
	}


====================
router.Handle("/api/oauth2/callback", oauth2callbackHandler).Methods("GET")
oauth2callbackHandler := api.NewOAuth2CallbackHandler(logger, g.ah)

oauth2.go:
---
ServeHTTP:
	code := query.Get("code")
	state := query.Get("state")

	cresp, err := h.ah.HandleOauth2Callback(ctx, code, state)

--------------------每次reg/login重生成authToken, 不是保存db的；
	oauth2Token, err := oauth2Source.RequestOauth2Token(h.webExposedURL+"/oauth2/callback", code)
	if err != nil {
		return nil, err
	}

	return h.HandleRemoteSourceAuthRequest(ctx, requestType, requestString, "", oauth2Token.AccessToken, oauth2Token.RefreshToken, oauth2Token.Expiry)





