add_remote:
  only add to sqlite;


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

====================
  //callback: (userBrowser)
  http://ag.ten.devcn.fun:81/api/oauth2/callback?code=l5eLqfLl_tN5R-aWJ4AOFlb0pPKIGRmIYBr1PvKOiaU%3D&state=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE1Nzg1MzEyNjUsInJlbW90ZV9zb3VyY2VfbmFtZSI6ImdpdGVhIiwicmVxdWVzdCI6IntcIlVzZXJOYW1lXCI6XCJzYW1cIixcIlJlbW90ZVNvdXJjZU5hbWVcIjpcImdpdGVhXCIsXCJVc2VyQWNjZXNzVG9rZW5cIjpcIlwiLFwiT2F1dGgyQWNjZXNzVG9rZW5cIjpcIlwiLFwiT2F1dGgyUmVmcmVzaFRva2VuXCI6XCJcIixcIk9hdXRoMkFjY2Vzc1Rva2VuRXhwaXJlc0F0XCI6XCIwMDAxLTAxLTAxVDAwOjAwOjAwWlwifSIsInJlcXVlc3RfdHlwZSI6InJlZ2lzdGVydXNlciJ9.kYT2m23G1x2T1iswOzkL1SD_z-mmHanjjJRnNCuSI9o

{
  "exp": 1578531265,
  "remote_source_name": "gitea",
  "request": "{\"UserName\":\"sam\",\"RemoteSourceName\":\"gitea\",\"UserAccessToken\":\"\",\"Oauth2AccessToken\":\"\",\"Oauth2RefreshToken\":\"\",\"Oauth2AccessTokenExpiresAt\":\"0001-01-01T00:00:00Z\"}",
  "request_type": "registeruser"
}

====================
oauth2callbackHandler := api.NewOAuth2CallbackHandler(logger, g.ah)

--------------------每次reg/login重生成authToken, 不是保存db的；
	oauth2Token, err := oauth2Source.RequestOauth2Token(h.webExposedURL+"/oauth2/callback", code)
	if err != nil {
		return nil, err
	}

	return h.HandleRemoteSourceAuthRequest(ctx, requestType, requestString, "", oauth2Token.AccessToken, oauth2Token.RefreshToken, oauth2Token.Expiry)





