import { QuickStartPage } from './QuickStart';

@Entry
@Component
struct TabsExample {
  @State currentIndex: number = 0;
  private tabsController: TabsController = new TabsController();

  @Builder
  TabBuilder(title: string, targetIndex: number, selectedImg: Resource, normalImg: Resource) {
    Column() {
      Image(this.currentIndex === targetIndex ? selectedImg : normalImg)
        .size({ width: 25, height: 25 })
      Text(title)
        .fontColor(this.currentIndex === targetIndex ? '#1698CE' : '#6B6B6B')
    }
    .width('100%')
    .height(50)
    .justifyContent(FlexAlign.Center)
    .onClick(() => {
      this.currentIndex = targetIndex;
      this.tabsController.changeIndex(this.currentIndex);
    })
  }

  build() {
    Tabs({ barPosition: BarPosition.End, controller: this.tabsController }) {
      TabContent() {
        QuickStartPage()
      }
      .tabBar(this.TabBuilder('快速入门', 0, $r('app.media.startIcon'), $r('app.media.foreground')))

      TabContent() {
        Column().width('100%').height('100%').backgroundColor('#007DFF')
      }
      .tabBar(this.TabBuilder('课程学习', 1, $r('app.media.startIcon'), $r('app.media.foreground')))

      TabContent() {
        Column().width('100%').height('100%').backgroundColor('#00CB87')
      }
      .tabBar(this.TabBuilder('知识地图', 2, $r('app.media.startIcon'), $r('app.media.foreground')))
    }
    .barWidth('100%')
    .barHeight(50)
    .backgroundColor('#f2f3f5')
    .onChange((index: number) => {
      this.currentIndex = index;
    })
  }
}