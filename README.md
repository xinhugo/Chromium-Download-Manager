Chromium-Download-Manager
=====
A downloader based on batch and Aria2.

### Beta
本分支 Beta 为 Chromium-Download-Manager 项目的**测试**分支，可能存在未知问题，欢迎反馈。**源代码用记事本即可查阅。**

最新发行版：https://github.com/xinhugo/Chromium-Download-Manager/releases/latest


Chromium 自 Revision:332900 开始，移除了 ffmpegsumo.dll，使用 Google Chrome Canary 的 ffmpegsumo.dll 以支持 MP3 解码的方法，暂时失效。
目前最后一个支持上述方法的 Chromium 版本为 45.0.2423.0 (开发者内部版本) （32 位）Revision:332890。


### Summary
* 便携版 Chromium

### Feature
* 提供三种下载方式：
    * 直接下载（不使用代理）
    * 自定义服务器下载（IP 地址/域名）
    * 代理下载（流量经 HTTP/HTTPS 本地代理客户端）
* 多线程下载、断点续传、验证 SSL 证书（自定义下载除外），适应中国（对外）网络。
* 用户数据（不含缓存）保存在当前目录，系便携版本。
* 支持下载/配置指定版本
* 在线更新 FFmpeg （提取自自 Google Chrome Canary）
* 在线更新 PPAPI-FLASH （提取自自 Google Chrome Canary）

### Usage
* 首次使用/更换目录/更新程序，运行 **Update.bat** ，按提示操作即可。
* **下载及配置完成后**，可运行 快捷方式 或 Chromium.bat 启动浏览器。
* Chromium.lnk 为 **无内置** Flash 版本；Chromium-PPAPI-FLASH.lnk 为**内置** Flash 版本。
* 因为快捷方式字数限制，路径过长时，快捷方式**可能缺少**部分参数。这时，请运行 Chromium.bat。
* 启用 Enable NPAPI (chrome://flags/#enable-npapi)，即可启用**操作系统**安装的 Adobe Flash Player。

### Library
* 在 phuslu 的 chromium 项目基础上改进。
* 下载支持由 aria2 提供。
* 解压缩支持由 7-Zip 提供。
* 创建快捷方式支持由 shortcut.exe 提供。
* PPAPI-FLASH 提取自 Google Chrome。

### Platform
Windows XP/2003/Vista/2008/7/2008 R2/8/8.1

### License
GNU General Public License/GNU GPL v2