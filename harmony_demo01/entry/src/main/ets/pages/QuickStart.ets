@Component
export struct QuickStartPage {
  private arr: String[] = ['0', '1', '2', '3', '4', '5'];

  //...
  build() {
    Scroll() {
      Column() {
        Text('快速入门')
          .fontSize(35)
          .textAlign(TextAlign.Start)
          .fontWeight(FontWeight.Bold)
          .width('100%')
          .padding(12)
        SwiperExample()
        Row() {
          Text('赋能套件')
            .fontSize(20)
            .fontColor(0x666666)
            .fontWeight(FontWeight.Bold)
            .padding(12)

          Text('更多>')
            .fontSize(18)
            .fontWeight(FontWeight.Medium)
            .fontColor(0x666666)
            .padding(12)
        }
        .justifyContent(FlexAlign.SpaceBetween)
        .width('100%')

        FuNengTaoJian()
        Text('入门教程')
          .fontSize(35)
          .width('90%')
        // List({ space: 20, initialIndex: 0 }) {
        //   ForEach(this.arr, (item: number) => {
        //     ListItem() {
        //       Row() {
        //         Text('' + item)
        //           .width('80%').height(100).fontSize(16)
        //           .textAlign(TextAlign.Center)
        //         Image($r('app.media.app_icon'))
        //           .width('20%')
        //       }.width('100%')
        //
        //     }
        //     .borderRadius(10)
        //     .backgroundColor(0x007DFF)
        //   }, (item: string) => item)
        // }
        // .listDirection(Axis.Vertical) // 排列方向
        // .scrollBar(BarState.Off)
        // .friction(0.6)
        // .divider({ strokeWidth: 2, color: 0xFFFFFF, startMargin: 20, endMargin: 20 }) // 每行之间的分界线

        List({ space: 10, initialIndex: 0 }) {
          ForEach(this.arr, (item: string) => {
            ListItem() {
              Row() {
                Column() {
                  Text(item)
                    .fontSize(20)
                    .fontColor(0x666666)
                    .fontWeight(FontWeight.Bold)
                    .padding(10)
                  Text('说明文字说明文字说明文字说明文字说明文字说明文字说明文字说明文字')
                    .fontSize(18)
                    .fontWeight(FontWeight.Medium)
                    .fontColor(0x666666)
                    .padding(10)
                    .width('250')
                }
                .alignItems(HorizontalAlign.Start)

                Image($r('app.media.444'))
                  .width(80)
              }
              .width('100%')
              .justifyContent(FlexAlign.SpaceBetween)
            }
            .borderRadius(10)
            .backgroundColor(Color.White)

            // .width('100%')
          }, (item: string) => item)
        }
        .listDirection(Axis.Vertical) // 排列方向
        .scrollBar(BarState.Off)
        .friction(0.6)
        .divider({ strokeWidth: 2, color: 0xFFFFFF, startMargin: 20, endMargin: 20 }) // 每行之间的分界线
        .edgeEffect(EdgeEffect.Spring) // 边缘效果设置为Spring
        .onScrollIndex((firstIndex: number, lastIndex: number, centerIndex: number) => {
          console.info('first' + firstIndex)
          console.info('last' + lastIndex)
          console.info('center' + centerIndex)
        })
        .onScroll((scrollOffset: number, scrollState: ScrollState) => {
          console.info(`onScroll scrollState = ScrollState` + scrollState + `, scrollOffset = ` + scrollOffset)
        })
        .width('90%')

        //...
        // ForEach(this.totalTasks,(item: string) => {
        //   TodoItem({content: item})
        // },...)
      }
      .width('100%')

      // .height('100%')
    }
    .backgroundColor(Color.Grey)
  }
}


@Component
struct SwiperExample {
  data: Array<string> = [
    '111',
    '222',
    '333'
  ]
  private swiperController: SwiperController = new SwiperController()

  build() {
    Swiper(this.swiperController) {
      ForEach(this.data, (item: string) => {
        Image($r(`app.media.${item}`))
          .width('90%')
          .height(150)
      })
    }
    .cachedCount(2)
    .index(1)
    .autoPlay(true)
    .interval(4000)
    .loop(true)
    .duration(1000)
    .itemSpace(0)
    .indicator( // 设置圆点导航点样式
      new DotIndicator()
        .itemWidth(15)
        .itemHeight(15)
        .selectedItemWidth(15)
        .selectedItemHeight(15)
        .color(Color.Gray)
        .selectedColor(Color.Blue))
    .displayArrow({
      // 设置导航点箭头样式
      showBackground: true,
      isSidebarMiddle: true,
      backgroundSize: 24,
      backgroundColor: Color.White,
      arrowSize: 18,
      arrowColor: Color.Blue
    }, false)
    .curve(Curve.Linear)
    .onChange((index: number) => {
      console.info(index.toString())
    })
    .onGestureSwipe((index: number, extraInfo: SwiperAnimationEvent) => {
      console.info("index: " + index)
      console.info("current offset: " + extraInfo.currentOffset)
    })
    .onAnimationStart((index: number, targetIndex: number, extraInfo: SwiperAnimationEvent) => {
      console.info("index: " + index)
      console.info("targetIndex: " + targetIndex)
      console.info("current offset: " + extraInfo.currentOffset)
      console.info("target offset: " + extraInfo.targetOffset)
      console.info("velocity: " + extraInfo.velocity)
    })
    .onAnimationEnd((index: number, extraInfo: SwiperAnimationEvent) => {
      console.info("index: " + index)
      console.info("current offset: " + extraInfo.currentOffset)
    })

  }
}

@Component
struct FuNengTaoJian {
  private arr: String[] = ['0', '1', '2', '3', '4', '5'];

  build() {
    Grid() {
      ForEach(this.arr, (day: string) => {
        // Image($r('app.media.grid1'))
        GridItem() {
          Text(day)
            .fontSize(16)
            .fontColor(Color.White)
            .backgroundColor(0x007DFF)
            .width('45%')
            .height(120)
            .textAlign(TextAlign.Center)
        }
      }, (day: string) => JSON.stringify(day))
    }
    .rowsTemplate('1fr')
    .columnsGap(10)
    .rowsGap(10)
    .height(150)
    .width('100%')
    .padding(12)
  }
}