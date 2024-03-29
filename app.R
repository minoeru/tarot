library(shiny)
library(fmsb)
library(shinyjs)
# library(rsconnect)

#csv読み込み
df <- read.csv("tallot.csv")
#csv各値を変数に
df_id <- df$id
df_a <- df$para_a
df_b <- df$para_b
df_c <- df$para_c
df_d <- df$para_d
df_e <- df$para_e
df_sentence <- as.character(df$sentence)
df_sentence2 <- as.character(df$sentence2)
df_sentence3 <- as.character(df$sentence3)
df_illustrator <- as.character(df$illustrator)

roma_number <- c( "0","I","II","III","IV","V","VI","VII","VIII","IX","X","XI","XII","XIII","XIV","XV","XVI","XVII","XVIII","XIX","XX","XXI","XXII")

#最大、最小データの準備
maxmin <- data.frame(
  para_a = c(100, 0),
  para_b = c(100, 0),
  para_c = c(100, 0),
  para_d = c(100, 0),
  para_e = c(100, 0)
)
#カード指定の変数
card_num <- 0
check_tmp <- 0
card_num2 <- 0

ui <- fluidPage(
  tags$head(tags$link(rel = "stylesheet", type = "text/css", href = "styles.css"),tags$script(src = "script.js")),
  tags$head(tags$link(rel = "stylesheet", type = "text/css", href = "https://fonts.googleapis.com/css?family=Noto+Sans+JP&display=swap")),
  
  # Shinyjsを使用できるようにする
  useShinyjs(),
  tabsetPanel(type = "tabs",id="tallot_tab",selected = "Start",
              tabPanel(title = "Start",value = "panel_1",
                       uiOutput("title_ui", align = "center"),
                       uiOutput("start_button_ui"),
                       uiOutput("slash_ui"),
                       uiOutput("gallery_button_ui"),
                       uiOutput("staff_button_ui")
                       # uiOutput("minigame_button_ui")
              ),
              tabPanel(title = "Game",value = "panel_2",
                       tags$div(class="game-container",
                                uiOutput("mob1"),
                                uiOutput("mob2"),
                                uiOutput("mob3"),
                                uiOutput("mob4"),
                                uiOutput("mob5"),
                                uiOutput("mob6"),
                                uiOutput("mob7"),
                                uiOutput("mob8"),
                                uiOutput("mob9"),
                                uiOutput("mob10"),
                                uiOutput("mob11"),
                                uiOutput("mob12"),
                                uiOutput("mob13"),
                                uiOutput("mainCard")
                       ),
                       uiOutput("put_button_ui",align = "center")
              ),
              tabPanel(title = "Result",value = "panel_3",
                       uiOutput("cardimage",align = "center"),
                       uiOutput("cardname",align = "center"),
                       uiOutput("slash_ui2"),
                       uiOutput("sentence",align = "center"),
                       tags$div(align="center",
                                plotOutput("radarPlot")
                       ),
                       uiOutput("illust",align = "center"),
                       uiOutput("tweet",align = "center"),
                       uiOutput("Back_to_start_button_ui",align = "center")
              ),
              tabPanel(title = "Mini Game",value = "panel_5",
                       fluidRow(
                         column(1,uiOutput("player1_point")),
                         column(10, uiOutput("player_turn")),
                         column(1,uiOutput("player2_point"))
                       ),
                       uiOutput("minigame_start_button_ui",align="center"),
                       fluidRow(
                         column(2,uiOutput("mini1")),
                         column(2,uiOutput("mini2")),
                         column(2,uiOutput("mini3")),
                         column(2,uiOutput("mini4")),
                         column(2,uiOutput("mini5")),
                         column(2,uiOutput("mini6"))
                       ),
                       fluidRow(
                         column(2,uiOutput("mini7")),
                         column(2,uiOutput("mini8")),
                         column(2,uiOutput("mini9")),
                         column(2,uiOutput("mini10")),
                         column(2,uiOutput("mini11")),
                         column(2,uiOutput("mini12"))
                       ),
                       fluidRow(
                         column(2,uiOutput("mini13")),
                         column(2,uiOutput("mini14")),
                         column(2,uiOutput("mini15")),
                         column(2,uiOutput("mini16")),
                         column(2,uiOutput("mini17")),
                         column(2,uiOutput("mini18"))
                       ),
                       fluidRow(
                         column(2,uiOutput("mini19")),
                         column(2,uiOutput("mini20")),
                         column(2,uiOutput("mini21")),
                         column(2,uiOutput("mini22")),
                         column(2,uiOutput("mini23")),
                         column(2,uiOutput("mini24"))
                       ),
                       uiOutput("Back_to_start_button_ui4",align="center")
              ),
              tabPanel(title = "Gallery",value = "panel_6",
                       uiOutput("gallery_ui", align = "center"),
                       tags$div(class="garraly-container",
                                uiOutput("gallery0"),
                                uiOutput("gallery200"),
                                uiOutput("gallery1"),
                                uiOutput("gallery2"),
                                uiOutput("gallery202"),
                                uiOutput("gallery3"),
                                uiOutput("gallery203"),
                                uiOutput("gallery4"),
                                uiOutput("gallery5"),
                                uiOutput("gallery6"),
                                uiOutput("gallery7"),
                                uiOutput("gallery8"),
                                uiOutput("gallery9"),
                                uiOutput("gallery10"),
                                uiOutput("gallery11"),
                                uiOutput("gallery12"),
                                uiOutput("gallery13"),
                                uiOutput("gallery213"),
                                uiOutput("gallery14"),
                                uiOutput("gallery15"),
                                uiOutput("gallery16"),
                                uiOutput("gallery17"),
                                uiOutput("gallery18"),
                                uiOutput("gallery19"),
                                uiOutput("gallery20"),
                                uiOutput("gallery220"),
                                uiOutput("gallery21"),
                                uiOutput("gallery1000")
                       ),
                       uiOutput("Back_to_start_button_ui2",align = "center")
              ),
              tabPanel(title = "Staff List",value="panel_4",
                       uiOutput("credit_ui", align = "center"),
                       h2("Illustrator", align = "center"),
                       h4("ロジ",align="center"),
                       h4("まつり", align = "center"),
                       h4("エディ", align = "center"),
                       h4("かずみ", align = "center"),
                       h4("サ^ｎ", align = "center"),
                       h4("ろろ", align = "center"),
                       h4("オダマキ", align = "center"),
                       h4("れしい", align = "center"),
                       h4("やまろ", align = "center"),
                       h4("fuchi", align = "center"),
                       h4("ゆーが", align = "center"),
                       h4("okanon", align = "center"),
                       h4("ここなつ ",align="center"),
                       h4("てぃらみー", align = "center"),
                       h4("ごぼぬん", align = "center"),
                       h4("藤汐", align = "center"),
                       h4("aozam", align = "center"),
                       h4("サカモト ", align = "center"),
                       h2("Designer", align = "center"),
                       h4("fuchi", align = "center"),
                       h4("okanon", align = "center"),
                       h2("Programmer", align = "center"),
                       h4("ミノエル", align = "center"),
                       h4("れしい", align = "center"),
                       h4("comame", align = "center"),
                       h4("fuchi", align = "center"),
                       h2("Tea lady(Master)", align = "center"),
                       h4("葵", align = "center"),
                       uiOutput("Back_to_start_button_ui3",align = "center")
              )
  )
)

server <- function(input, output,session) {
  
  ###タイトル的なやつ
  output$title_ui <- renderUI({
    tags$object(
      id = "title",
      class = "img",
      tags$img(src = "title.png",height = "100px",width = "400px")
    )
  })
  
  output$gallery_ui <- renderUI({
    tags$object(
      id = "gallery",
      class = "img",
      tags$img(src = "gallery_t.png",height = "100px",width = "400px")
    )
  })
  
  output$credit_ui <- renderUI({
    tags$object(
      id = "credit",
      class = "img",
      tags$img(src = "credit_t.png",height = "99px",width = "281px")
    )
  })
  
  #各種ボタン
  output$start_button_ui <- renderUI({
    tags$div(class = "btn-container start-btn-container",
             tags$button(
               id = "start_button",
               class = "btn action-button",
               onclick = "cartain()",
               onfocus = "this.blur();",
               "START READING"
             )
    )
  })
  
  output$gallery_button_ui <- renderUI({
    tags$div(class = "btn-container",
             tags$button(
               id = "gallery_button",
               class = "btn action-button",
               onclick = "cartain()",
               onfocus = "this.blur();",
               "GALLERY"
             )
    )
  })
  
  output$staff_button_ui <- renderUI({
    tags$div(class = "btn-container",
             tags$button(
               id = "staff_button",
               class = "btn action-button",
               onclick = "cartain()",
               onfocus = "this.blur();",
               "CREDIT"
             )
    )
  })
  
  output$put_button_ui <- renderUI({
    tags$div(class = "btn-container",
             tags$button(
               id = "put_button",
               class = "btn action-button",
               onclick = "shuffle()",
               onfocus = "this.blur();",
               "カードをめくる"
             )
    )
  })
  
  output$Back_to_start_button_ui <- renderUI({
    tags$div(class = "btn-container",
             tags$button(
               id = "Back_to_start_button",
               class = "btn action-button",
               onclick = "cartain()",
               onfocus = "this.blur();",
               "ホームに戻る"
             )
    )
  })
  
  output$Back_to_start_button_ui2 <- renderUI({
    tags$div(class = "btn-container",
             tags$button(
               id = "Back_to_start_button2",
               class = "btn action-button",
               onclick = "cartain()",
               onfocus = "this.blur();",
               "ホームに戻る"
             )
    )
  })
  
  output$Back_to_start_button_ui3 <- renderUI({
    tags$div(class = "btn-container",
             tags$button(
               id = "Back_to_start_button3",
               class = "btn action-button",
               onclick = "cartain()",
               onfocus = "this.blur();",
               "ホームに戻る"
             )
    )
  })
  
  
  output$minigame_button_ui <- renderUI({
    tags$div(class = "btn-container",
             tags$button(
               id = "minigame_button",
               class = "btn action-button",
               onfocus = "this.blur();",
               "MINIGAME"
             )
    )
  })
  
  #変な線
  output$slash_ui <- renderUI({
    tags$div(class = "btn-container",
             tags$div(class = "btn-slash"
             )
    )
  })
  
  #スタート画面に飛ばす
  updateTabsetPanel( session, "tallot_tab",selected = "panel_1")
  
  ##################  スタート画面   ########################
  #スタートボタンを押した際にゲーム画面に遷移
  observeEvent(input$start_button, {
    updateTabsetPanel( session, "tallot_tab",selected = "panel_2")
  })
  #スタッフボタンを押した際にスタッフ画面に遷移
  observeEvent(input$staff_button, {
    updateTabsetPanel( session, "tallot_tab",selected = "panel_4")
  })
  #ミニゲームボタンを押した際にミニゲーム画面に遷移
  observeEvent(input$minigame_button, {
    updateTabsetPanel( session, "tallot_tab",selected = "panel_5")
    makeMiniStart()
  })
  #ギャラリーボタンを押した際にミニゲーム画面に遷移
  observeEvent(input$gallery_button, {
    updateTabsetPanel( session, "tallot_tab",selected = "panel_6")
  })
  
  ##################  ゲーム画面   ########################
  
  #裏面カード生成
  lapply(1:13, function(x) {
    output[[paste0("mob",x)]] <- renderUI({makeCards(x)})
  })
  
  
  
  #カードをめくるボタンが 押された時の処理
  observeEvent(input$put_button, {
    #カードをめくるボタン消滅
    output$put_button_ui <- renderUI({})
    #乱数生成
    makeRan()
    #グラフにプロット
    delay(3000, output$mainCard <- renderUI({
      fortune_tmp <- card_num
      fortune_tmp2 <- card_num2
      fortune_check_tmp <- check_tmp
      makeChart(fortune_tmp,fortune_tmp2,fortune_check_tmp)
      if(fortune_check_tmp == 1){
        tags$div(class = "img-container",
                 tags$div(class = "reverse_card",
                          tags$object(
                            id = "object",
                            class = "img reverse_card",
                            tags$img(src = paste0("mtm_",fortune_tmp2,".png"),height = "175px",width = "100px")
                          )
                 )
        )
      }
      else{
        tags$div(class = "img-container",
                 tags$object(
                   id = "object",
                   class = "img",
                   tags$img(src = paste0("mtm_",fortune_tmp2,".png"),height = "175px",width = "100px")
                 )
        ) 
      }
    })
    )
    #bms後にページ遷移
    delay(5001, updateTabsetPanel( session, "tallot_tab",selected = "panel_3"))
    #cms後にカード消滅ボタン復活
    delay(5030,allDelete())
  })
  
  #カード消滅兼ボタン復活用関数
  allDelete <- function(){
    output$mainCard <- renderUI({})
    output$put_button_ui <- renderUI({
      tags$div(class = "btn-container",
               tags$button(
                 id = "put_button",
                 class = "btn action-button",
                 onclick ="shuffle()",
                 "カードをめくる"
               )
      )
    })
  }
  
  #カード選択用乱数生成関数
  makeRan <- function(){
    check_tmp <<- 0
    x <- floor(runif(1,0,22))
    dual <- sum( (df_id %% 100) - x == 0 )
    ran <- floor(runif(1,0,dual))
    card_num <<- x + ran * 100
    if(ran %% 2 == 1) {
      check_tmp <<- 1
    }
    card_num2 <<- x + floor(ran / 2) * 200
  }
  
  makeCards <- function(x){
    tags$div(class = "reverse-container",
             tags$object(
               id = "object",
               class = "img",
               tags$img(src = "mtm_1000.png",height = "175px",width = "100px")
             )
    )
  }
  
  ##################  結果画面   ########################
  #結果画面のレーダーチャートとその他を作る関数
  makeChart <- function(x,y,z){
    #描写データの準備
    dat <- data.frame(
      para_a = df_a[df$id == x],
      para_b = df_b[df$id == x],
      para_c = df_c[df$id == x],
      para_d = df_d[df$id == x],
      para_e = df_e[df$id == x]
    )
    dat <- rbind(maxmin, dat) #データの結合
    VLabel <- c("General","Love","Money","Personal","work") #ラベルの名前
    #レーダーチャート作成
    output$radarPlot <- renderPlot(
      {
        radarchart(dat, 
                   axistype = 0,#ラベル表示無し
                   seg = 5,#分割数
                   plty = 16,#線の種類(丸ぽち無し)
                   pcol="black",#線の色
                   plwd=2,　#ラインの太さ 
                   vlcex = 1,# ラベルの大きさ
                   pty=32,#データ点をプロットしない
                   centerzero = TRUE,#ゼロ真ん中
                   vlabels = VLabel,#ラベルの名前
                   pdensity=0,　#塗りつぶす（斜線の）程度
                   pangle=180,　#塗りつぶす斜線の傾き
                   pfcol=7,　#塗りつぶす色
                   cglcol="black",#軸の色
                   title = df_sentence[df$id == x]
        )
      },bg="transparent"
      # ,width=280
    )
    
    #画像生成
    output$cardimage <- renderUI({
      if(z == 1){
        tags$div(class = "reverse_card",
                 tags$object(
                   id = "object",
                   class = "img reverse_img",
                   tags$img(src = paste0("mt_",y,".png"),height = "350px",width = "200px")
                 )
        )
      }
      else{
        tags$object(
          id = "object",
          class = "img",
          tags$img(src = paste0("mt_",y,".png"),height = "350px",width = "200px")
        )
      }
    })
    
    output$slash_ui2 <- renderUI({
      tags$div(class = "btn-container",
               tags$div(class = "btn-slash"
               )
      )
    })
    
    output$cardname <- renderUI({ h2(df_sentence2[df$id == x]) })
    output$sentence <- renderUI({ h4(df_sentence3[df$id == x]) })
    output$illust <- renderUI({ h2(paste0("Illustration & Text:  ",df_illustrator[df$id == x])) })
    output$tweet <- renderUI({ 
      hoge_tweet <<- paste0("https://twitter.com/share?url=https://minoeru.shinyapps.io/tarot/&text=",df_sentence2[df$id == x] ,"%20%23mis_tarot%20")
      tags$div(class = "btn-container",
               tags$button(
                 id = "Tweet_button",
                 class = "btn action-button",
                 "結果をツイートする",
                 onclick = paste0( "window.open('", hoge_tweet ,"','_blank')" )
               )
      )
    })
  }
  #Backボタンが押された際にカードを裏返してStart画面へ
  observeEvent(input$Back_to_start_button, {
    updateTabsetPanel( session, "tallot_tab",selected = "panel_1")
  })
  
  ##################  ミニゲーム画面   ########################
  
  #カードを消す関数
  deleteCard <- function(x){output[[paste0("mini",x)]] <- renderUI({})}
  
  #全てのカードを消す関数
  deleteAllMini <- function(x) {
    lapply(1:24, function(x) deleteCard(x))
  }
  
  #スタート画面を生成する関数
  makeMiniStart <- function(){
    output$player1_point <- renderUI({})
    output$player2_point <- renderUI({})
    output$player_turn<- renderUI({})
    deleteAllMini()
    output$Back_to_start_button_ui4 <- renderUI({})
    output$minigame_start_button_ui  <- renderUI({
      tags$div(class = "btn-container",
               tags$button(
                 id = "minigame_start_button",
                 class = "btn action-button",
                 onfocus = "this.blur();",
                 "MINIGAME START"
               )
      )
    })
  }
  
  observeEvent(input$minigame_start_button, {
    reverseAllMini()
  })
  
  #カードを裏面で生成する関数
  makeUiMini <- function(x){
    text <- paste0("button_mini",x)
    tags$button(
      id = text,
      class = "action-button",
      tags$img(src = "mt_1000.png",height = "175px",width = "100px")
    )
  }
  
  #値を初期値に戻す関数
  resetPoint <- function(){
    #プレイヤーのフラグと各得点
    play_turn_flag <<- 1
    p_points <<- c(1:2) - c(1:2)
    turned_count <<- 0
    open_tmp <<- 0
    reverse_protect_mini <<- c(1:24)
    #UI作成
    output$player1_point <- renderUI({h1(p_points[1],align="center")})
    output$player2_point <- renderUI({h1(p_points[2],align="center")})
    output$player_turn <- renderUI({h1(paste0("プレイヤー",play_turn_flag,"のターン"),align = "center")})
    #対象の役生成
    moto_data <<- unique( floor( runif(10000,0,22) ) )#ランダムに0~21生成
    moto_data <<- append(moto_data[1:12],moto_data[1:12])#12個ずつ一組作る
    moto_data <<- moto_data[order(rnorm(length(moto_data)))]#ランダムに並べ替える
    print("-----------------------")
    print(moto_data[1:6])
    print(moto_data[7:12])
    print(moto_data[13:18])
    print(moto_data[19:24])
  }
  
  #カードを裏面に戻す関数
  returnCard <- function(x){output[[paste0("mini",x)]] <- renderUI({makeUiMini(x)})}
  
  #全てのカードを裏返す関数
  reverseAllMini <- function(x) {
    lapply(1:24, function(x) returnCard(x))
    resetPoint()
    output$minigame_start_button_ui  <- renderUI({})
    output$Back_to_start_button_ui4 <- renderUI({
      tags$div(class = "btn-container",
               tags$button(
                 id = "Back_to_start_button3",
                 class = "btn action-button",
                 onclick = "cartain()",
                 onfocus = "this.blur();",
                 "ホームに戻る"
               )
      )
    })
  }
  
  #カードを裏返す関数
  turnCardMini <- function(x){
    text <- paste0("button_mini",x)
    tags$button(
      id = text,
      class = "action-button",
      tags$img(src = paste0("mt_", moto_data[x] ,".png"),height = "175px",width = "100px")
    )
  }
  
  #カードが揃っているか確認する関数
  checkMini <- function(x){
    turned_count <<- turned_count + 1
    if(turned_count == 1){
      open_tmp <<- x
      reverse_protect_mini[open_tmp] <<- 0
    } else{
      reverse_protect_mini[open_tmp] <<- open_tmp
      if(moto_data[open_tmp] == moto_data[x]){
        p_points[play_turn_flag] <<- p_points[play_turn_flag] + 1
        output$player1_point <- renderUI({h1(p_points[1],align="center")})
        output$player2_point <- renderUI({h1(p_points[2],align="center")})
        #反転済みカードを押せなくする
        reverse_protect_mini[open_tmp] <<- 0
        reverse_protect_mini[x] <<- 0
      } else{
        #カードを裏返す
        delay(500, returnCard(open_tmp) )
        delay(500, returnCard(x))
        changeTurn()
      }
      if(p_points[1] + p_points[2] == 12){
        checkWinner()
      } 
      turned_count <<- 0
    }
  }
  
  #ターンチェンジを行う関数
  changeTurn <- function(){
    ifelse(play_turn_flag == 1,play_turn_flag<<- 2,play_turn_flag <<- 1)
    output$player_turn <- renderUI({h1( paste0("プレイヤー",play_turn_flag,"のターン"),align="center")})
  }
  #勝利者を決める関数
  checkWinner <- function(){
    if(p_points[1] > p_points[2]) output$player_turn <- renderUI({h1( paste0("プレイヤー1の勝利！"),align="center")})
    else if(p_points[1] < p_points[2]) output$player_turn <- renderUI({h1( paste0("プレイヤー2の勝利！"),align="center")})
    else output$player_turn <- renderUI({h1( paste0("引き分け"),align="center")})
  }
  
  #各カードの反転
  lapply(1:24, function(x){
    observeEvent(input[[paste0("button_mini",x)]],{
      if(reverse_protect_mini[x] == x){
        output[[paste0("mini",x)]] <- renderUI({turnCardMini(x)})
        checkMini(x)
      }
    })
  })
  
  #前処理
  reverseAllMini()
  
  ##################  ギャラリー画面   ########################
  
  makeGarraly2 <- function(x){output[[paste0("gallery",x)]] <- renderUI({makeGarraly(x)})}
  lapply(0:21, function(x) makeGarraly2(x))
  
  makeGarraly <- function(x){
    hoge_number <- x
    tags$div(class = "modal-hover",
             tags$button(
               type = "button",
               class="btn btn-primary",
               "data-toggle" = "modal",
               "data-target" = paste0("#modal",hoge_number),
               tags$img(src = paste0("mtm_",hoge_number,".png"),height = "175px",width = "100px")
             ),
             tags$div(
               class = "modal fade",
               id = paste0("modal",hoge_number),
               tabindex = "-1",
               role = "dialog",
               "aria-labelledby" = "label1",
               "aria-hidden" = "true",
               tags$div(
                 class = "modal-dialog modal-dialog-centered",
                 role = "document",
                 tags$div(
                   class = "modal-content",
                   tags$div(
                     class = "modal-header",
                     h5(class = "modal-title",id="label1",paste0( roma_number[ (hoge_number %% 100) + 1 ]," ",strsplit(df_sentence2[df$id == hoge_number],"\\(")[[1]][1]))
                   ),
                   tags$div(
                     class = "modal-body",
                     tags$img(src = paste0("mt_",hoge_number,".png"),height = "175px",width = "100px"),
                     h5(class = "modal-illust",paste0("Illustration by ",df_illustrator[df$id == hoge_number]))
                   )
                 )
               )
             )
    )
  }
  
  #エクストラ
  makeGarraly2(200)
  makeGarraly2(202)
  makeGarraly2(203)
  makeGarraly2(213)
  makeGarraly2(220)
  
  makeGarraly3 <- function(x){
    hoge_number <- x
    tags$div(
      tags$button(
        type = "button",
        class="btn btn-primary",
        "data-toggle" = "modal",
        "data-target" = paste0("#modal",hoge_number),
        tags$img(src = paste0("mt_",hoge_number,".png"),height = "175px",width = "100px")
      ),
      tags$div(
        class = "modal fade",
        id = paste0("modal",hoge_number),
        tabindex = "-1",
        role = "dialog",
        "aria-labelledby" = "label1",
        "aria-hidden" = "true",
        tags$div(
          class = "modal-dialog modal-dialog-centered",
          role = "document",
          tags$div(
            class = "modal-content",
            tags$div(
              class = "modal-header",
              h5(class = "modal-title",id="label1","裏面")
            ),
            tags$div(
              class = "modal-body",
              tags$img(src = paste0("mt_",hoge_number,".png"),height = "175px",width = "100px"),
              h5(class = "modal-illust",paste0("Illustration by oknon"))
            )
          )
        )
      )
    )
  }
  
  makeGarraly4 <- function(x){output[[paste0("gallery",x)]] <- renderUI({makeGarraly3(x)})}
  
  makeGarraly4(1000)
  
  #Backボタンが押された際にStart画面へ
  observeEvent(input$Back_to_start_button2, {
    updateTabsetPanel(session, "tallot_tab",selected = "panel_1")
  })
  
  ##################  スタッフ画面   ########################
  #Backボタンが押された際にStart画面へ
  observeEvent(input$Back_to_start_button3, {
    updateTabsetPanel(session, "tallot_tab",selected = "panel_1")
  })
}
shinyApp(ui = ui, server = server)