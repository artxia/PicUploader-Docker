# PicUploader-Docker

适合本地（群晖）安装，搭配uPic/PicGo使用
定期使用GitHub Actions自动打包上传docker hub

```
docker run -d --name picuploader \
  --restart=always \
  -e TZ="Asia/Shanghai" \
  -e USER=admin \
  -e PASSWD=admin \
  -v ~/docker/config/config-local.php:/var/www/PicUploader/config/config-local.php \
  -p 80:80 \
  artxia/picuploader-docker
```

### 原项目 [PicUploader](https://github.com/xiebruce/PicUploader)
