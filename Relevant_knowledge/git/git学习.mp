# Git

## 1.常用liux命令

cd：改变目录

cd..：回退到上一个目录，直接cd进入默认目录

pwd：显示当前目录路径

ls(ll)：列出当前目录中所有文件

touch：新建一个文件，如touch index.js

rm：删除一个文件用法与touch差不多

mkdir：新建一个目录

rm -f：删除一个文件夹

mv：移动文件，例：mv index.html src，将index文件移到src

reset：重新初始化

clear：清屏

history：查看历史

help：帮助

exit：退出

## 2.配置

查看配置：git config -l

查看不同级别的配置文件：

- 查看系统配置

  git config --system --list

- 查看当前用户

  git config --global --list

用户名字与邮箱配置：

- git config --global user.name "sda"
- git config --global user.email "sda@qq.com"

## 3.流程

![1662041323233](1662041323233.png)

## 4.Git使用

### 1.项目创建及克隆

初始化项目（将项目变成git管理的项目）：git init

克隆远程仓库：git clone [url]

ps:url 的复制地点

### 2.git基本操作

查看文件状态：git status [filename] 

查看所有文件状态：git status

生成公钥：ssh-keygen -t rsa

1.创建一个文件，用git init将该文件git化

2.选择克隆或者新创

3.git add.                                           将所有文件存到暂存区

4.git commit -m  “消息内容”        提交暂存区内容到本地仓库 

### 3.忽略文件

![1662045623748](1662045623748.png)

### 4.远程仓库的使用

1.注册

2.设置公钥

​	生成公钥：ssh-keygen -t rsa

​	![公钥](公钥.png)



![公钥2](公钥2.png)



![公钥3](公钥3.png)

![公钥4](公钥4.png)

3.将公钥添加到码云或github中

4.创建仓库（已经注册了为以下步骤）

![仓库](仓库.png)

5.克隆连接本地

​		创建一个文件

​		然后打开git输入：![git](git.png)

```bash
#初始化项目（将项目变成git管理的项目）：
git init
#克隆远程仓库：
git clone [url]
```

6.复制要添加的文件到克隆的文件![Snipaste_2022-09-05_23-03-05](Snipaste_2022-09-05_23-03-05.png)

7.**git add .**将文件提供到暂存区

![idea中git的工作台](idea中git的工作台.png)

8.git commit 提交到本地仓库

![Snipaste_2022-09-05_23-05-21](Snipaste_2022-09-05_23-05-21.png)

便于commit

9.git push 提交到远程仓库

## 5.分支

```bash
# 列出所有本地分支
git branch
# 列出所有远程分支
git branch -r
# 新建一个分支但仍然停留在当前分支
git branch dev
# 新建一个分支，并切换到该分支
git checkout -b dev
# 合并指定分支到当前分支
git merge dev
# 删除分支
git brand -d dev
# 删除远程分支
git push origin --delete dev
git branch -dr dev
# 推送分支到远程仓库
git push origin dev
# 查看提交记录
git log
# 查看本地仓库
git ls-files
# 查看本地仓库[dir下]
git ls-files dir/
# 删除暂缓区内容
git rm --cached <file>
# 删除暂缓区文件夹下所有文件
git rm -r --cached dir/
# 删除本地分支
git branch -d localBranchName
# 删除远程分支
git push origin --delete remoteBranchName
```

