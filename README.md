﻿Chromium-Download-Manager
=====
A downloader based on batch and Aria2.

### Beta
本分支 Beta 为 Chromium-Download-Manager 项目的**测试**版本，可能存在未知问题，欢迎反馈。**源代码用记事本即可查阅。**

### Summary
* 下载 Chromium
* 配置 Chromium（为便携版）
* 创建快捷方式（以快捷方式或 BAT 启动，才是便携版）

### Feature
* 提供三种下载方式：
    * 直接下载（不使用代理）
    * 自定义服务器下载（IP 地址/域名）
    * 代理下载（流量经 HTTP/HTTPS 本地代理客户端）
* 多线程下载、断点续传、验证 SSL 证书（自定义下载除外），适应中国（对外）网络。
* 用户数据（不含缓存）保存在当前目录，系便携版本。

### Usage
* 首次使用/更换目录/更新程序，运行 **update.bat** ，按提示操作即可。
* **下载及配置完成后**，可运行 Chromium.bat 或 Chromium-PPAPI-FLASH.bat 启动便携版 Chromium。
* 因为字数限制，路径过长时，快捷方式**可能缺少**部分参数；这时，请运行 Chromium.bat 或 Chromium-PPAPI-FLASH.bat。
* Chromium.bat 为 **未内置** Flash 版本，Chromium-PPAPI-FLASH.bat 为**内置** Flash 版本。
* 启用 Enable NPAPI，即可启用系统安装的 Adobe Flash Player。chrome://flags/#enable-npapi

### Library
* 在 phuslu 的 chromium 项目基础上改进。
* 下载支持由 aria2 提供，aria2 目录内容为 aria2-1.18.8-win-32bit。
* 解压缩支持由 7-Zip 提供，7za_x86.exe 是 7-Zip 9.20。
* 创建快捷方式支持由 shortcut.exe 提供。

### Platform
Windows XP/2003/Vista/2008/7/2008 R2/8/8.1

### License
GNU General Public License/GNU GPL v2