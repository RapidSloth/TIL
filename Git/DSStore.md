# DS_Store 삭제 방법

- 현재 디렉토리 아래의 모든 .DS_Store 파일을 제거

```
find . -name .DS_Store -print0 | xargs -0 git rm -f --ignore-unmatch
```


- 영구적으로 업로드 막기

```
echo .DS_Store >> .gitignore
```

- 전체 적용
```
git add .
git commit -m ""
git push origin main
```

