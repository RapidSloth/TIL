# DS_Store 삭제 방법

- 현재 디렉토리 아래의 모든 .DS_Store 파일을 제거

```swift
find . -name .DS_Store -print0 | xargs -0 git rm -f --ignore-unmatch
```


- 앞으로도 영구적으로 업로드 막기

```swift
echo .DS_Store >> .gitignore
```

