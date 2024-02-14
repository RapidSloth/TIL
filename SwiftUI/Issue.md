## 오류 

### 탭바 투명화

TabView 사용 시 하단의 탭바가 투명해지는 현상이 존재한다. 해당 현상이 발생하는 이유는 

1. iOS15로 넘어오면서 네비게이션바나 탭바가 있는 뷰에서 화면 전환이 일어나면 배경이 투명해지고 border line이 사라지도록 변경되었다.  (https://developer.apple.com/forums/thread/682420)
2. 탭바에 별도의 배경색을 지정했을 때 발생한다. (https://developer.apple.com/forums/thread/121799)



UIKit과 SwiftUI의 해결 방법이 다르다. 아래의 방법들은 각각 IOS 15 16 이하에서 작동하지 않으나, 곧 애플의 정책 상 iOS 17만 앱스토어에 업데이트가 가능하기 때문에 별도 서술하지 않겠다.



- UIKit

```swift
let appearance = UINavigationBarAppearance()
    appearance.configureWithOpaqueBackground()
    UINavigationBar.appearance().standardAppearance = appearance
    UINavigationBar.appearance().scrollEdgeAppearance = appearance
```



- SwiftUI

```swift
Group {

}
.toolbarBackground(.blue, for: .tabBar)
.toolbarBackground(.visible, for: .tabBar)
```

