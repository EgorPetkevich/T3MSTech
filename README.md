# MusicPlayer Onboarding & Paywall

## Небольшой модуль приложения, включающий:
	•	3 экрана онбординга
	•	экран пейвола с переключателем плана (Month / Year)
	•	навигацию по архитектуре MVVM + Assembler + Router

## Архитектура

## Проект построен на связке:
	•	MVVM — разделение представления, логики и состояния
	•	Assembler — централизованная сборка модулей
	•	Router (@Observable) — управление навигацией через NavigationPath
  
## Router Example

```swift
@Observable
class Router {
    var path = NavigationPath()
    
    func pop() { path.removeLast() }
    func popToRoot() { path.removeLast(path.count) }
}
```
## Функциональность
	•	Онбординг (3 экрана): описание возможностей приложения.
	•	Пейвол: выбор подписки (Monthly / Yearly), UI-свитчер, кнопка покупки.
	•	Разделение логики между ViewModel, Router и сервисами.

