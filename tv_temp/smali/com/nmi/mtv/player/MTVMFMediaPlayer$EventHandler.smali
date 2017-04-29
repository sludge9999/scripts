.class Lcom/nmi/mtv/player/MTVMFMediaPlayer$EventHandler;
.super Landroid/os/Handler;
.source "MTVMFMediaPlayer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nmi/mtv/player/MTVMFMediaPlayer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "EventHandler"
.end annotation


# instance fields
.field private final player:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/nmi/mtv/player/MTVMFMediaPlayer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/nmi/mtv/player/MTVMFMediaPlayer;Landroid/os/Looper;)V
    .locals 1
    .param p1, "mp"    # Lcom/nmi/mtv/player/MTVMFMediaPlayer;
    .param p2, "looper"    # Landroid/os/Looper;

    .prologue
    .line 1799
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 1800
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/nmi/mtv/player/MTVMFMediaPlayer$EventHandler;->player:Ljava/lang/ref/WeakReference;

    .line 1798
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 7
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x5

    const/4 v4, 0x4

    const/4 v3, 0x0

    .line 1804
    iget-object v1, p0, Lcom/nmi/mtv/player/MTVMFMediaPlayer$EventHandler;->player:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/nmi/mtv/player/MTVMFMediaPlayer;

    .line 1805
    .local v0, "mp":Lcom/nmi/mtv/player/MTVMFMediaPlayer;
    if-nez v0, :cond_0

    .line 1806
    const-string/jumbo v1, "mtvmf_java"

    const-string/jumbo v2, "Main event handler is null"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1808
    :cond_0
    iget v1, p1, Landroid/os/Message;->what:I

    sparse-switch v1, :sswitch_data_0

    .line 2012
    const-string/jumbo v1, "mtvmf_java"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "UNKNOWN Event "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p1, Landroid/os/Message;->what:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1803
    :cond_1
    :goto_0
    return-void

    .line 1811
    :sswitch_0
    invoke-virtual {v0}, Lcom/nmi/mtv/player/MTVMFMediaPlayer;->getState()I

    move-result v1

    if-ne v4, v1, :cond_1

    .line 1812
    invoke-static {v0, v5}, Lcom/nmi/mtv/player/MTVMFMediaPlayer;->-wrap4(Lcom/nmi/mtv/player/MTVMFMediaPlayer;I)V

    .line 1813
    const-string/jumbo v1, "mtvmf_java"

    const-string/jumbo v2, "Listener get Message FIRST VIDEO FRAME"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 1819
    :sswitch_1
    invoke-virtual {v0}, Lcom/nmi/mtv/player/MTVMFMediaPlayer;->getState()I

    move-result v1

    if-ne v4, v1, :cond_1

    .line 1820
    invoke-static {v0, v5}, Lcom/nmi/mtv/player/MTVMFMediaPlayer;->-wrap4(Lcom/nmi/mtv/player/MTVMFMediaPlayer;I)V

    .line 1821
    const-string/jumbo v1, "mtvmf_java"

    const-string/jumbo v2, "Listener get Message FIRST AUDIO FRAME"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 1828
    :sswitch_2
    invoke-virtual {v0}, Lcom/nmi/mtv/player/MTVMFMediaPlayer;->getState()I

    move-result v1

    if-ne v1, v5, :cond_1

    .line 1829
    const/4 v1, 0x6

    invoke-static {v0, v1}, Lcom/nmi/mtv/player/MTVMFMediaPlayer;->-wrap4(Lcom/nmi/mtv/player/MTVMFMediaPlayer;I)V

    .line 1830
    const-string/jumbo v1, "mtvmf_java"

    const-string/jumbo v2, "Listener get Message LOW BUFFER"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 1847
    :sswitch_3
    invoke-static {v0, v4}, Lcom/nmi/mtv/player/MTVMFMediaPlayer;->-wrap4(Lcom/nmi/mtv/player/MTVMFMediaPlayer;I)V

    .line 1848
    const-string/jumbo v1, "mtvmf_java"

    const-string/jumbo v2, "Listener get Message BUFFER START"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 1856
    :sswitch_4
    const-string/jumbo v1, "mtvmf_java"

    const-string/jumbo v2, "Recording Started"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1857
    invoke-static {v0}, Lcom/nmi/mtv/player/MTVMFMediaPlayer;->-get3(Lcom/nmi/mtv/player/MTVMFMediaPlayer;)Lcom/nmi/mtv/player/MTVMFMediaPlayer$OnRecordingEventListener;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 1858
    invoke-static {v0}, Lcom/nmi/mtv/player/MTVMFMediaPlayer;->-get3(Lcom/nmi/mtv/player/MTVMFMediaPlayer;)Lcom/nmi/mtv/player/MTVMFMediaPlayer$OnRecordingEventListener;

    move-result-object v1

    invoke-interface {v1}, Lcom/nmi/mtv/player/MTVMFMediaPlayer$OnRecordingEventListener;->onRecordingStarted()V

    goto :goto_0

    .line 1863
    :sswitch_5
    const-string/jumbo v1, "mtvmf_java"

    const-string/jumbo v2, "Recording Stopped"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1864
    invoke-static {v0}, Lcom/nmi/mtv/player/MTVMFMediaPlayer;->-get3(Lcom/nmi/mtv/player/MTVMFMediaPlayer;)Lcom/nmi/mtv/player/MTVMFMediaPlayer$OnRecordingEventListener;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 1865
    invoke-static {v0}, Lcom/nmi/mtv/player/MTVMFMediaPlayer;->-get3(Lcom/nmi/mtv/player/MTVMFMediaPlayer;)Lcom/nmi/mtv/player/MTVMFMediaPlayer$OnRecordingEventListener;

    move-result-object v1

    invoke-interface {v1}, Lcom/nmi/mtv/player/MTVMFMediaPlayer$OnRecordingEventListener;->onRecordingStopped()V

    goto :goto_0

    .line 1870
    :sswitch_6
    const-string/jumbo v1, "mtvmf_java"

    const-string/jumbo v2, "Recording ERR"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1871
    invoke-static {v0}, Lcom/nmi/mtv/player/MTVMFMediaPlayer;->-get3(Lcom/nmi/mtv/player/MTVMFMediaPlayer;)Lcom/nmi/mtv/player/MTVMFMediaPlayer$OnRecordingEventListener;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 1872
    iget v1, p1, Landroid/os/Message;->arg1:I

    const/4 v2, 0x3

    if-eq v2, v1, :cond_1

    .line 1873
    invoke-static {v0}, Lcom/nmi/mtv/player/MTVMFMediaPlayer;->-get3(Lcom/nmi/mtv/player/MTVMFMediaPlayer;)Lcom/nmi/mtv/player/MTVMFMediaPlayer$OnRecordingEventListener;

    move-result-object v1

    iget v2, p1, Landroid/os/Message;->arg1:I

    iget v3, p1, Landroid/os/Message;->arg2:I

    invoke-interface {v1, v2, v3}, Lcom/nmi/mtv/player/MTVMFMediaPlayer$OnRecordingEventListener;->onRecordingError(II)V

    goto/16 :goto_0

    .line 1879
    :sswitch_7
    const-string/jumbo v1, "mtvmf_java"

    const-string/jumbo v2, "Capture Succeed"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 1885
    :sswitch_8
    const-string/jumbo v1, "mtvmf_java"

    const-string/jumbo v2, "Capture Failed"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 1891
    :sswitch_9
    const/4 v1, 0x2

    invoke-static {v0, v1}, Lcom/nmi/mtv/player/MTVMFMediaPlayer;->-wrap4(Lcom/nmi/mtv/player/MTVMFMediaPlayer;I)V

    .line 1892
    const-string/jumbo v1, "mtvmf_java"

    const-string/jumbo v2, "Media Player connected"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 1898
    :sswitch_a
    invoke-static {v0, v3}, Lcom/nmi/mtv/player/MTVMFMediaPlayer;->-wrap4(Lcom/nmi/mtv/player/MTVMFMediaPlayer;I)V

    .line 1899
    const-string/jumbo v1, "mtvmf_java"

    const-string/jumbo v2, "Media Player disconnected"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 1905
    :sswitch_b
    const/4 v1, 0x3

    invoke-static {v0, v1}, Lcom/nmi/mtv/player/MTVMFMediaPlayer;->-wrap4(Lcom/nmi/mtv/player/MTVMFMediaPlayer;I)V

    .line 1906
    const-string/jumbo v1, "mtvmf_java"

    const-string/jumbo v2, "Media Player started"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 1914
    :sswitch_c
    const/4 v1, 0x2

    invoke-static {v0, v1}, Lcom/nmi/mtv/player/MTVMFMediaPlayer;->-wrap4(Lcom/nmi/mtv/player/MTVMFMediaPlayer;I)V

    .line 1915
    const-string/jumbo v1, "mtvmf_java"

    const-string/jumbo v2, "Media Player stopped"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 1925
    :sswitch_d
    const-string/jumbo v1, "mtvmf_java"

    const-string/jumbo v2, "Cation Data Received"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 1930
    :sswitch_e
    const-string/jumbo v1, "mtvmf_java"

    const-string/jumbo v2, "Capture Data Received"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1932
    invoke-static {v0}, Lcom/nmi/mtv/player/MTVMFMediaPlayer;->-get2(Lcom/nmi/mtv/player/MTVMFMediaPlayer;)Lcom/nmi/mtv/player/MTVMFMediaPlayer$OnCaptureEventListener;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 1933
    invoke-static {v0}, Lcom/nmi/mtv/player/MTVMFMediaPlayer;->-get2(Lcom/nmi/mtv/player/MTVMFMediaPlayer;)Lcom/nmi/mtv/player/MTVMFMediaPlayer$OnCaptureEventListener;

    move-result-object v2

    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Landroid/graphics/Bitmap;

    invoke-interface {v2, v1}, Lcom/nmi/mtv/player/MTVMFMediaPlayer$OnCaptureEventListener;->onCaptureSucceeded(Landroid/graphics/Bitmap;)V

    goto/16 :goto_0

    .line 1935
    :cond_2
    const-string/jumbo v1, "mtvmf_java"

    const-string/jumbo v2, "Capture call back is null"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 1943
    :sswitch_f
    const-string/jumbo v1, "mtvmf_java"

    const-string/jumbo v2, "Video Size Received"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 1952
    :sswitch_10
    const-string/jumbo v1, "mtvmf_java"

    const-string/jumbo v2, "Replay Completed"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1954
    invoke-static {v0}, Lcom/nmi/mtv/player/MTVMFMediaPlayer;->-get4(Lcom/nmi/mtv/player/MTVMFMediaPlayer;)Lcom/nmi/mtv/player/MTVMFMediaPlayer$OnReplayEventListener;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 1955
    invoke-static {v0}, Lcom/nmi/mtv/player/MTVMFMediaPlayer;->-get4(Lcom/nmi/mtv/player/MTVMFMediaPlayer;)Lcom/nmi/mtv/player/MTVMFMediaPlayer$OnReplayEventListener;

    move-result-object v1

    invoke-static {v0}, Lcom/nmi/mtv/player/MTVMFMediaPlayer;->-get12(Lcom/nmi/mtv/player/MTVMFMediaPlayer;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/nmi/mtv/player/MTVMFMediaPlayer$OnReplayEventListener;->onReplayFileGenerated(Ljava/lang/String;)V

    .line 1956
    invoke-static {v0, v3}, Lcom/nmi/mtv/player/MTVMFMediaPlayer;->-set0(Lcom/nmi/mtv/player/MTVMFMediaPlayer;I)I

    goto/16 :goto_0

    .line 1962
    :sswitch_11
    const-string/jumbo v1, "mtvmf_java"

    const-string/jumbo v2, "Replay Failed"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1964
    invoke-static {v0}, Lcom/nmi/mtv/player/MTVMFMediaPlayer;->-get4(Lcom/nmi/mtv/player/MTVMFMediaPlayer;)Lcom/nmi/mtv/player/MTVMFMediaPlayer$OnReplayEventListener;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 1965
    invoke-static {v0}, Lcom/nmi/mtv/player/MTVMFMediaPlayer;->-get4(Lcom/nmi/mtv/player/MTVMFMediaPlayer;)Lcom/nmi/mtv/player/MTVMFMediaPlayer$OnReplayEventListener;

    move-result-object v1

    invoke-interface {v1}, Lcom/nmi/mtv/player/MTVMFMediaPlayer$OnReplayEventListener;->onReplayFailed()V

    .line 1966
    invoke-static {v0, v3}, Lcom/nmi/mtv/player/MTVMFMediaPlayer;->-set0(Lcom/nmi/mtv/player/MTVMFMediaPlayer;I)I

    goto/16 :goto_0

    .line 1972
    :sswitch_12
    invoke-static {v0}, Lcom/nmi/mtv/player/MTVMFMediaPlayer;->-get1(Lcom/nmi/mtv/player/MTVMFMediaPlayer;)Lcom/nmi/mtv/player/MTVMFMediaPlayer$OnBufferingUpdateListener;

    move-result-object v1

    if-eqz v1, :cond_3

    .line 1973
    invoke-static {v0}, Lcom/nmi/mtv/player/MTVMFMediaPlayer;->-get1(Lcom/nmi/mtv/player/MTVMFMediaPlayer;)Lcom/nmi/mtv/player/MTVMFMediaPlayer$OnBufferingUpdateListener;

    move-result-object v1

    iget v2, p1, Landroid/os/Message;->arg1:I

    invoke-interface {v1, v2}, Lcom/nmi/mtv/player/MTVMFMediaPlayer$OnBufferingUpdateListener;->onBufferingUpdate(I)V

    goto/16 :goto_0

    .line 1975
    :cond_3
    const-string/jumbo v1, "mtvmf_java"

    const-string/jumbo v2, "Buffer state call back is null"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 1981
    :sswitch_13
    invoke-static {v0}, Lcom/nmi/mtv/player/MTVMFMediaPlayer;->-get5(Lcom/nmi/mtv/player/MTVMFMediaPlayer;)Lcom/nmi/mtv/player/MTVMFMediaPlayer$OnServiceDieListener;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 1982
    invoke-static {v0}, Lcom/nmi/mtv/player/MTVMFMediaPlayer;->-get5(Lcom/nmi/mtv/player/MTVMFMediaPlayer;)Lcom/nmi/mtv/player/MTVMFMediaPlayer$OnServiceDieListener;

    move-result-object v1

    invoke-interface {v1}, Lcom/nmi/mtv/player/MTVMFMediaPlayer$OnServiceDieListener;->onServiceDie()V

    goto/16 :goto_0

    .line 1988
    :sswitch_14
    iget v1, p1, Landroid/os/Message;->arg1:I

    if-ne v1, v6, :cond_4

    .line 1989
    invoke-static {v0, v6}, Lcom/nmi/mtv/player/MTVMFMediaPlayer;->-set1(Lcom/nmi/mtv/player/MTVMFMediaPlayer;Z)Z

    .line 1990
    const-string/jumbo v1, "mtvmf_java"

    const-string/jumbo v2, "multi language enabled"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 1992
    :cond_4
    invoke-static {v0, v3}, Lcom/nmi/mtv/player/MTVMFMediaPlayer;->-set1(Lcom/nmi/mtv/player/MTVMFMediaPlayer;Z)Z

    .line 1993
    const-string/jumbo v1, "mtvmf_java"

    const-string/jumbo v2, "multi language disabled"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 1999
    :sswitch_15
    const-string/jumbo v1, "mtvmf_java"

    const-string/jumbo v2, "first video frame displayed"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2004
    invoke-static {v0}, Lcom/nmi/mtv/player/MTVMFMediaPlayer;->-get6(Lcom/nmi/mtv/player/MTVMFMediaPlayer;)Lcom/nmi/mtv/player/MTVMFMediaPlayer$OnVideoEventListener;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 2005
    invoke-static {v0}, Lcom/nmi/mtv/player/MTVMFMediaPlayer;->-get6(Lcom/nmi/mtv/player/MTVMFMediaPlayer;)Lcom/nmi/mtv/player/MTVMFMediaPlayer$OnVideoEventListener;

    move-result-object v1

    invoke-interface {v1}, Lcom/nmi/mtv/player/MTVMFMediaPlayer$OnVideoEventListener;->onFirstVideoDisplayed()V

    goto/16 :goto_0

    .line 1808
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x1 -> :sswitch_1
        0x2 -> :sswitch_2
        0x3 -> :sswitch_3
        0x4 -> :sswitch_4
        0x5 -> :sswitch_5
        0x6 -> :sswitch_6
        0x7 -> :sswitch_7
        0x8 -> :sswitch_8
        0x9 -> :sswitch_9
        0xa -> :sswitch_a
        0xb -> :sswitch_b
        0xc -> :sswitch_c
        0xd -> :sswitch_f
        0xe -> :sswitch_10
        0xf -> :sswitch_11
        0x10 -> :sswitch_13
        0x11 -> :sswitch_d
        0x12 -> :sswitch_e
        0x13 -> :sswitch_14
        0x14 -> :sswitch_15
        0xc8 -> :sswitch_12
    .end sparse-switch
.end method
