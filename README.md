# FMX Fixes

FMX unofficial patch collection
===============================
This respository is patches by user,no any support and no warranty.
If you found any bug in Delphi/C++ Builder FMX Library and have fixed,please share it with us.We will make it more user known this.

For copyright reason,I can't provide source directly.So you need check out patches and run the merge.bat to generate final source code.
 
How it works
======================
1. Check out patch files
2. Run merge.bat in the patch dir(For example 10.2.2).This will create a folder named "Final" and source code will be merged in here.<br/>
[Note] Patch tool need administrator rights for patch file.You need grant the rights on execute the batch file.
2. Put merged files into your project directory.
3. Rebuild your project with fixed patch files.

About us
======================
We are chinese developers,we are working for QDAC open source project.Visit our website:https://www.qdac.cc for more information(Chinese only).

License
======================
It's free for all! If you want donate ,please visit http://blog.qdac.cc/?page_id=13 for more information.

Limitions
=====================
This source codes is fixed by me,but for copyright reason, you should have the origin source code.If you don't have origin source,please update your license.

FMX 非官方修正补丁
==================

1.不要指望此补丁包解决所有的问题，受限于水平和精力限制，不可能做特别全面的测试，所以不要对品控方面提过高要求。
2.出问题你可以报告给我们，大家一起修正。但不要指望我们会对你由此造成的损失负任何责任，我们负不起，也没钱赔您。
3.不要抱怨，有那时间还不如想想如何修改或规避问题或多陪陪身边人。

如何生成补丁文件
================
1.将官方的原始源码复制到一个目录，如 orign。
2.将修正后的源码复制到一个目录，如 fixed。
3.运行 diff -uN orign\文件名 fixed\文件名>patch文件名
4.将您的补丁文件发给我们，我们可以上传到 github 上，分享给大家

您也可以将修正的问题和修正后的源码发给我们，我们制作 patch 文件，并上传上去。当然,这也意味着您的Patch需要遵守
同样的协议。

如果应用补丁文件
================
1.从 https://github.com/chinawsb/fmxfixes 上检出或下载最新的补丁；
2.找到对应的 IDE 版本目录下的 merge.bat，然后双击，在请求管理员权限的地方，允许管理员权限。
3.找到生成的Final目录下的合并完的源码。

注意事项
========
1、合并的来源是您的官方源码，所以确保安装的 IDE Source 目录下有对应的源码并且没有手动修改过。
2、根据官方的要求，请不要直接发布合并后的源码到互联网。




