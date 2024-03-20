# 기본 
-  `colors` 파라미터 내부에 배열로 색깔 전달
- `startPoint`, `endPoint` 지정이 핵심
```swift
LinearGradient(colors: , startPoint: , endPoint: )
```



### 예시 - 전체배경에 적용
![image](https://github.com/RapidSloth/TIL/assets/144765545/67413123-db42-40e8-ad14-41715b8f8c5c)

- 얘도 하나의 View이므로 그냥 배치 가능
```swift
var body: some View {
	 LinearGradient(
		 colors: [Color("GreenLight"), Color("GreenMedium")],
		 startPoint: .top, 
		 endPoint: .bottom
	)
}
```

## Text

![image](https://github.com/RapidSloth/TIL/assets/144765545/1e352553-422f-40bc-84b5-e004c97b24fd)

```swift
Text("iOS")
	.font(.system(size: 180))
	.fontWeight(.black)
	.foregroundStyle(
		LinearGradient(
			colors: [.pink, .purple, .blue],
			startPoint: .topLeading,
			endPoint: .bottomTrailing
		)
	)
```

## Circle

![image](https://github.com/RapidSloth/TIL/assets/144765545/d7b65e14-73e0-4192-a3ed-4b4ff2c2c068)


```swift
Circle()
	.fill(
		LinearGradient(
			colors: [Color("IndigoMedium"), Color("ColorSalmonLight")],
			startPoint: .topLeading,
			endPoint: .bottomTrailing
		)
	)
	.frame(width: 256, height: 256)
```
