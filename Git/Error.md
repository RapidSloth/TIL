# git 에러

## remote: Invalid username or password.

1. 깃허브에서 토큰 발급
2. 터미널에서 origin 제거 후, 다시 추가
```
git remote remove origin

git remote add origin https://닉네임:토큰@github.com/repository 경로
```

