# MileTask for Edot Test

This apps is for Take the test. This apps is using SwiftUI and also using modularization. There will be 3 module in here

- MileTaskStorage
  
  This module is used for all the main task and managed Storage issue. Is kinda like UserDefaults, CoreData, Realm, and Etc. Or maybe can also using for remote data storage like Remote Config / Any other config.
  In this project all the storage service use the singleton pattern because I just want to share only one class that can be use for other candidate class. Oh ya, also in this Storage there is also shared service core
  for the Live Activity and also the Notification Manager Service.
  
- MileTaskDomain

  This module is used for all the data models, enum, and all about the shared data. Like Response from BE, Config, or maybe decode data from storage.

- MileTaskComponent

  This module is used for the shared component. Shared components means that like Color Scheme, Image, SwiftUI Extension, shared cell component, Fonts, and any other related to view.

This apps also using the TCA design pattern. Its because TCA is good for

✅ Complex apps with many interdependent features.<br />
✅ Teams that need maintainable, testable, and scalable code.<br />
✅ Long-term projects where predictability matters.

# Screenshot of page
- This page is on White Mode

![simulator_screenshot_1DEE689E-65B9-4C9F-A366-AF36E33FF368](https://github.com/user-attachments/assets/e7513fa4-1cce-4f81-bd5b-5240226e543c)

![simulator_screenshot_14690B4D-690E-4AC4-88D5-EA90DC6885DC](https://github.com/user-attachments/assets/d409cbb8-c015-4ed2-9f08-a9dc26e9bc72)

- This page is on Dark Mode

![simulator_screenshot_2CDE4C75-0B53-479B-BDB0-E84D255961D0](https://github.com/user-attachments/assets/166bbbc3-bce1-4a49-a876-66165ad3c549)

![simulator_screenshot_FDD41167-D43B-40F1-9B61-0AB7F7B81DE2](https://github.com/user-attachments/assets/c7e727cb-3074-47ad-afb0-8ef616d42b50)

- Notification Sample

![simulator_screenshot_0D185211-A6CD-4159-8E53-BB2A84EDC2EA](https://github.com/user-attachments/assets/5315f3c4-82d7-43f4-aade-e10b50a8f1c0)

- Live Activity Sample

<img width="1069" alt="Screenshot 2025-06-30 at 23 39 54" src="https://github.com/user-attachments/assets/1bf8836d-4d40-45d8-b39c-5e0887988616" />


# Unit Test

The unit test for this project is also using the TCA Pattern.

