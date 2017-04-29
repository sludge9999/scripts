.class public Lcom/nmi/mtv/player/MediaFrameHandler;
.super Ljava/lang/Object;
.source "MediaFrameHandler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/nmi/mtv/player/MediaFrameHandler$OnMediaInformationUpdated;
    }
.end annotation


# instance fields
.field private audioChannel:I

.field private audioCodec:Lcom/nmi/mtv/player/AudioDecoder;

.field private audioConfigBlock:[B

.field private audioRender:Lcom/nmi/mtv/player/AudioRender;

.field private audioSamplerate:I

.field private disableAudio:Z

.field private disableVideo:Z

.field isFirstVideoDisplayed:Z

.field private mLeftVolume:F

.field mListener:Lcom/nmi/mtv/player/MediaFrameHandler$OnMediaInformationUpdated;

.field private mRightVolume:F

.field private mSelectedLanguage:I

.field mSurface:Landroid/view/Surface;

.field private pcmChannel:I

.field private pcmSamplerate:I

.field surfaceTemporaryDisabled:Z

.field private videoCodec:Lcom/nmi/mtv/player/VideoDecoder;

.field private videoHeight:I

.field private videoRender:Lcom/nmi/mtv/player/VideoRender;

.field private videoSliceHeight:I

.field private videoStride:I

.field private videoWidth:I


# direct methods
.method static synthetic -get0(Lcom/nmi/mtv/player/MediaFrameHandler;)Lcom/nmi/mtv/player/AudioRender;
    .locals 1

    iget-object v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->audioRender:Lcom/nmi/mtv/player/AudioRender;

    return-object v0
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput-boolean v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->disableAudio:Z

    .line 31
    iput-boolean v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->disableVideo:Z

    .line 39
    invoke-direct {p0}, Lcom/nmi/mtv/player/MediaFrameHandler;->initMediaInformation()V

    .line 38
    return-void
.end method

.method private doReleaseVideo()I
    .locals 4

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 287
    const-string/jumbo v0, "media frame handler"

    const-string/jumbo v1, "release decoder"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 288
    iget-object v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->videoCodec:Lcom/nmi/mtv/player/VideoDecoder;

    if-eqz v0, :cond_1

    .line 289
    iget-object v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->videoCodec:Lcom/nmi/mtv/player/VideoDecoder;

    invoke-virtual {v0}, Lcom/nmi/mtv/player/VideoDecoder;->close()I

    .line 290
    iput-object v2, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->videoCodec:Lcom/nmi/mtv/player/VideoDecoder;

    .line 297
    :goto_0
    iget-object v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->videoRender:Lcom/nmi/mtv/player/VideoRender;

    if-eqz v0, :cond_0

    .line 298
    iget-object v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->videoRender:Lcom/nmi/mtv/player/VideoRender;

    invoke-virtual {v0}, Lcom/nmi/mtv/player/VideoRender;->close()V

    .line 299
    iput-object v2, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->videoRender:Lcom/nmi/mtv/player/VideoRender;

    .line 302
    :cond_0
    iput-boolean v3, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->surfaceTemporaryDisabled:Z

    .line 304
    return v3

    .line 292
    :cond_1
    iget-object v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->mListener:Lcom/nmi/mtv/player/MediaFrameHandler$OnMediaInformationUpdated;

    if-eqz v0, :cond_2

    .line 293
    iget-object v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->mListener:Lcom/nmi/mtv/player/MediaFrameHandler$OnMediaInformationUpdated;

    invoke-interface {v0}, Lcom/nmi/mtv/player/MediaFrameHandler$OnMediaInformationUpdated;->onVideoDecoderStopDone()V

    .line 294
    :cond_2
    const-string/jumbo v0, "media frame handler"

    const-string/jumbo v1, "decoder already released"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private initAudioInformation()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 44
    iput v1, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->audioSamplerate:I

    .line 45
    iput v1, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->audioChannel:I

    .line 46
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->audioConfigBlock:[B

    .line 48
    iput v1, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->pcmSamplerate:I

    .line 49
    iput v1, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->pcmChannel:I

    .line 50
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lcom/nmi/mtv/player/MediaFrameHandler;->selectChannel(I)Z

    .line 42
    return-void
.end method

.method private initMediaInformation()V
    .locals 0

    .prologue
    .line 63
    invoke-direct {p0}, Lcom/nmi/mtv/player/MediaFrameHandler;->initAudioInformation()V

    .line 64
    invoke-direct {p0}, Lcom/nmi/mtv/player/MediaFrameHandler;->initVideoinformation()V

    .line 62
    return-void
.end method

.method private initVideoinformation()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 55
    iput v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->videoWidth:I

    .line 56
    iput v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->videoHeight:I

    .line 57
    iput v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->videoStride:I

    .line 58
    iput v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->videoSliceHeight:I

    .line 59
    iput-boolean v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->surfaceTemporaryDisabled:Z

    .line 53
    return-void
.end method

.method private prepareAudioCodec([BII)I
    .locals 4
    .param p1, "obj"    # [B
    .param p2, "samplerate"    # I
    .param p3, "channel"    # I

    .prologue
    const/4 v3, 0x0

    .line 104
    iget-boolean v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->disableAudio:Z

    if-eqz v0, :cond_1

    .line 105
    iget-object v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->mListener:Lcom/nmi/mtv/player/MediaFrameHandler$OnMediaInformationUpdated;

    if-eqz v0, :cond_0

    .line 106
    iget-object v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->mListener:Lcom/nmi/mtv/player/MediaFrameHandler$OnMediaInformationUpdated;

    invoke-interface {v0}, Lcom/nmi/mtv/player/MediaFrameHandler$OnMediaInformationUpdated;->onAudioDecoderSetupDone()V

    .line 107
    :cond_0
    return v3

    .line 110
    :cond_1
    const-string/jumbo v0, "media frame handler"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "preparing audio decoder with samplerate: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " channel: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 112
    invoke-static {}, Lcom/nmi/mtv/player/AudioRender;->getAudioRender()Lcom/nmi/mtv/player/AudioRender;

    move-result-object v0

    iput-object v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->audioRender:Lcom/nmi/mtv/player/AudioRender;

    .line 114
    invoke-static {}, Lcom/nmi/mtv/player/AudioDecoder;->getAudioDecoder()Lcom/nmi/mtv/player/AudioDecoder;

    move-result-object v0

    iput-object v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->audioCodec:Lcom/nmi/mtv/player/AudioDecoder;

    .line 116
    iget-object v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->audioCodec:Lcom/nmi/mtv/player/AudioDecoder;

    invoke-virtual {v0}, Lcom/nmi/mtv/player/AudioDecoder;->open()I

    .line 118
    iget-object v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->audioCodec:Lcom/nmi/mtv/player/AudioDecoder;

    new-instance v1, Lcom/nmi/mtv/player/MediaFrameHandler$1;

    invoke-direct {v1, p0}, Lcom/nmi/mtv/player/MediaFrameHandler$1;-><init>(Lcom/nmi/mtv/player/MediaFrameHandler;)V

    invoke-virtual {v0, v1}, Lcom/nmi/mtv/player/AudioDecoder;->setOnAudioConfigUpdatedListener(Lcom/nmi/mtv/player/AudioDecoder$OnAudioConfigUpdatedListener;)V

    .line 149
    iget-object v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->audioCodec:Lcom/nmi/mtv/player/AudioDecoder;

    invoke-virtual {v0, p1, p2, p3}, Lcom/nmi/mtv/player/AudioDecoder;->setAudioConfiguration([BII)I

    .line 151
    return v3
.end method

.method private prepareVideoCodec(IIII)I
    .locals 7
    .param p1, "stride"    # I
    .param p2, "sliceHeight"    # I
    .param p3, "width"    # I
    .param p4, "height"    # I

    .prologue
    const/4 v6, 0x0

    .line 218
    iget-boolean v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->disableVideo:Z

    if-eqz v0, :cond_1

    .line 219
    iget-object v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->mListener:Lcom/nmi/mtv/player/MediaFrameHandler$OnMediaInformationUpdated;

    if-eqz v0, :cond_0

    .line 220
    iget-object v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->mListener:Lcom/nmi/mtv/player/MediaFrameHandler$OnMediaInformationUpdated;

    invoke-interface {v0}, Lcom/nmi/mtv/player/MediaFrameHandler$OnMediaInformationUpdated;->onVideoDecoderSetupDone()V

    .line 222
    :cond_0
    return v6

    .line 225
    :cond_1
    const-string/jumbo v0, "media frame handler"

    const-string/jumbo v1, "prepare video decoder"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 227
    new-instance v0, Lcom/nmi/mtv/player/VideoRender;

    invoke-direct {v0}, Lcom/nmi/mtv/player/VideoRender;-><init>()V

    iput-object v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->videoRender:Lcom/nmi/mtv/player/VideoRender;

    .line 229
    invoke-static {}, Lcom/nmi/mtv/player/VideoDecoder;->getVideoDecoder()Lcom/nmi/mtv/player/VideoDecoder;

    move-result-object v0

    iput-object v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->videoCodec:Lcom/nmi/mtv/player/VideoDecoder;

    .line 231
    iget-object v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->videoCodec:Lcom/nmi/mtv/player/VideoDecoder;

    invoke-virtual {v0}, Lcom/nmi/mtv/player/VideoDecoder;->open()I

    .line 233
    iget-object v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->videoCodec:Lcom/nmi/mtv/player/VideoDecoder;

    new-instance v1, Lcom/nmi/mtv/player/MediaFrameHandler$2;

    invoke-direct {v1, p0}, Lcom/nmi/mtv/player/MediaFrameHandler$2;-><init>(Lcom/nmi/mtv/player/MediaFrameHandler;)V

    invoke-virtual {v0, v1}, Lcom/nmi/mtv/player/VideoDecoder;->setOnVideoConfigUpdatedListener(Lcom/nmi/mtv/player/VideoDecoder$OnVideoDecoderEventListener;)V

    .line 267
    iget-object v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->videoCodec:Lcom/nmi/mtv/player/VideoDecoder;

    iget-object v5, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->mSurface:Landroid/view/Surface;

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/nmi/mtv/player/VideoDecoder;->setVideoConfiguration(IIIILandroid/view/Surface;)I

    .line 270
    return v6
.end method

.method private selectAudioChannelWithLanguage(I)V
    .locals 2
    .param p1, "type"    # I

    .prologue
    .line 369
    iget-object v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->audioRender:Lcom/nmi/mtv/player/AudioRender;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->audioRender:Lcom/nmi/mtv/player/AudioRender;

    invoke-virtual {v0}, Lcom/nmi/mtv/player/AudioRender;->isStarted()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 370
    packed-switch p1, :pswitch_data_0

    .line 368
    :goto_0
    return-void

    .line 372
    :pswitch_0
    iget-object v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->audioRender:Lcom/nmi/mtv/player/AudioRender;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/nmi/mtv/player/AudioRender;->setChannelOutMode(I)I

    goto :goto_0

    .line 375
    :pswitch_1
    iget-object v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->audioRender:Lcom/nmi/mtv/player/AudioRender;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/nmi/mtv/player/AudioRender;->setChannelOutMode(I)I

    goto :goto_0

    .line 378
    :pswitch_2
    iget-object v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->audioRender:Lcom/nmi/mtv/player/AudioRender;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/nmi/mtv/player/AudioRender;->setChannelOutMode(I)I

    goto :goto_0

    .line 382
    :cond_0
    const-string/jumbo v0, "media frame handler"

    const-string/jumbo v1, "select audio channel failed, wrong state"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 370
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method


# virtual methods
.method public decodeAACFrame([BI)V
    .locals 4
    .param p1, "frame"    # [B
    .param p2, "timestamp"    # I

    .prologue
    .line 179
    iget-boolean v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->disableAudio:Z

    if-eqz v0, :cond_0

    .line 180
    iget-object v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->mListener:Lcom/nmi/mtv/player/MediaFrameHandler$OnMediaInformationUpdated;

    if-eqz v0, :cond_0

    .line 181
    iget-object v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->mListener:Lcom/nmi/mtv/player/MediaFrameHandler$OnMediaInformationUpdated;

    int-to-long v2, p2

    invoke-interface {v0, v2, v3}, Lcom/nmi/mtv/player/MediaFrameHandler$OnMediaInformationUpdated;->onAudioFramePlayed(J)V

    .line 185
    :cond_0
    iget-object v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->audioCodec:Lcom/nmi/mtv/player/AudioDecoder;

    if-eqz v0, :cond_1

    .line 186
    iget-object v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->audioCodec:Lcom/nmi/mtv/player/AudioDecoder;

    array-length v1, p1

    int-to-long v2, p2

    invoke-virtual {v0, p1, v1, v2, v3}, Lcom/nmi/mtv/player/AudioDecoder;->pushData([BIJ)I

    .line 177
    :cond_1
    return-void
.end method

.method public decodeAVCFrame([BI)I
    .locals 4
    .param p1, "frame"    # [B
    .param p2, "timestamp"    # I

    .prologue
    .line 279
    iget-object v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->videoCodec:Lcom/nmi/mtv/player/VideoDecoder;

    if-eqz v0, :cond_0

    if-eqz p1, :cond_0

    .line 280
    iget-object v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->videoCodec:Lcom/nmi/mtv/player/VideoDecoder;

    array-length v1, p1

    int-to-long v2, p2

    invoke-virtual {v0, p1, v1, v2, v3}, Lcom/nmi/mtv/player/VideoDecoder;->pushData([BIJ)I

    move-result v0

    return v0

    .line 282
    :cond_0
    const/4 v0, -0x1

    return v0
.end method

.method public deliverDecodedVideoFrame(IIJ)V
    .locals 3
    .param p1, "idx"    # I
    .param p2, "size"    # I
    .param p3, "ts"    # J

    .prologue
    .line 352
    iget-object v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->videoRender:Lcom/nmi/mtv/player/VideoRender;

    if-eqz v0, :cond_0

    .line 353
    iget-object v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->videoRender:Lcom/nmi/mtv/player/VideoRender;

    long-to-int v1, p3

    invoke-virtual {v0, p1, p2, v1}, Lcom/nmi/mtv/player/VideoRender;->feedVideo(III)V

    .line 351
    :cond_0
    return-void
.end method

.method public disableSurface()V
    .locals 2

    .prologue
    .line 323
    const-string/jumbo v0, "media frame handler"

    const-string/jumbo v1, "disabling surface"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 324
    iget-object v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->videoCodec:Lcom/nmi/mtv/player/VideoDecoder;

    if-eqz v0, :cond_0

    .line 326
    iget-object v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->videoCodec:Lcom/nmi/mtv/player/VideoDecoder;

    invoke-virtual {v0}, Lcom/nmi/mtv/player/VideoDecoder;->disableSurface()V

    .line 327
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->surfaceTemporaryDisabled:Z

    .line 322
    :cond_0
    return-void
.end method

.method public prepare()I
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 68
    iput-boolean v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->isFirstVideoDisplayed:Z

    .line 69
    return v0
.end method

.method public prepareAudio()V
    .locals 3

    .prologue
    .line 93
    const-string/jumbo v0, "media frame handler"

    const-string/jumbo v1, "prepare audio decoder"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 94
    iget v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->audioSamplerate:I

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->audioChannel:I

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->audioConfigBlock:[B

    if-eqz v0, :cond_0

    .line 95
    iget-object v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->audioConfigBlock:[B

    iget v1, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->audioSamplerate:I

    iget v2, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->audioChannel:I

    invoke-direct {p0, v0, v1, v2}, Lcom/nmi/mtv/player/MediaFrameHandler;->prepareAudioCodec([BII)I

    .line 91
    :goto_0
    return-void

    .line 97
    :cond_0
    iget-object v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->mListener:Lcom/nmi/mtv/player/MediaFrameHandler$OnMediaInformationUpdated;

    if-eqz v0, :cond_1

    .line 98
    iget-object v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->mListener:Lcom/nmi/mtv/player/MediaFrameHandler$OnMediaInformationUpdated;

    invoke-interface {v0}, Lcom/nmi/mtv/player/MediaFrameHandler$OnMediaInformationUpdated;->onAudioDecoderSetupDone()V

    .line 99
    :cond_1
    const-string/jumbo v0, "media frame handler"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "audio Config error Samplerate : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->audioSamplerate:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "   ch: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->audioChannel:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public prepareAudioRender(II)V
    .locals 3
    .param p1, "samplerate"    # I
    .param p2, "channel"    # I

    .prologue
    .line 388
    iget-object v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->audioRender:Lcom/nmi/mtv/player/AudioRender;

    if-eqz v0, :cond_2

    iget v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->pcmChannel:I

    if-ne v0, p2, :cond_0

    iget v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->pcmSamplerate:I

    if-eq v0, p1, :cond_3

    .line 389
    :cond_0
    :goto_0
    iput p2, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->pcmChannel:I

    .line 390
    iput p1, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->pcmSamplerate:I

    .line 392
    iget-object v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->audioRender:Lcom/nmi/mtv/player/AudioRender;

    if-eqz v0, :cond_2

    .line 393
    iget-object v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->audioRender:Lcom/nmi/mtv/player/AudioRender;

    invoke-virtual {v0}, Lcom/nmi/mtv/player/AudioRender;->isStarted()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 394
    iget-object v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->audioRender:Lcom/nmi/mtv/player/AudioRender;

    invoke-virtual {v0}, Lcom/nmi/mtv/player/AudioRender;->release()V

    .line 396
    :cond_1
    iget-object v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->audioRender:Lcom/nmi/mtv/player/AudioRender;

    invoke-virtual {v0, p1, p2}, Lcom/nmi/mtv/player/AudioRender;->prepare(II)I

    .line 397
    iget-object v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->audioRender:Lcom/nmi/mtv/player/AudioRender;

    iget v1, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->mLeftVolume:F

    iget v2, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->mRightVolume:F

    invoke-virtual {v0, v1, v2}, Lcom/nmi/mtv/player/AudioRender;->setVolume(FF)I

    .line 398
    iget v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->mSelectedLanguage:I

    invoke-direct {p0, v0}, Lcom/nmi/mtv/player/MediaFrameHandler;->selectAudioChannelWithLanguage(I)V

    .line 386
    :cond_2
    return-void

    .line 388
    :cond_3
    iget-object v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->audioRender:Lcom/nmi/mtv/player/AudioRender;

    invoke-virtual {v0}, Lcom/nmi/mtv/player/AudioRender;->isStarted()Z

    move-result v0

    if-nez v0, :cond_2

    goto :goto_0
.end method

.method public prepareVideo()V
    .locals 4

    .prologue
    const/4 v1, 0x0

    .line 206
    iget v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->videoStride:I

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->videoSliceHeight:I

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->videoWidth:I

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->videoHeight:I

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->videoCodec:Lcom/nmi/mtv/player/VideoDecoder;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->mSurface:Landroid/view/Surface;

    if-eqz v0, :cond_0

    .line 207
    iget v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->videoStride:I

    iget v1, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->videoSliceHeight:I

    iget v2, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->videoWidth:I

    iget v3, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->videoHeight:I

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/nmi/mtv/player/MediaFrameHandler;->prepareVideoCodec(IIII)I

    .line 205
    :goto_0
    return-void

    .line 209
    :cond_0
    iget-object v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->mListener:Lcom/nmi/mtv/player/MediaFrameHandler$OnMediaInformationUpdated;

    if-eqz v0, :cond_1

    .line 210
    iget-object v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->mListener:Lcom/nmi/mtv/player/MediaFrameHandler$OnMediaInformationUpdated;

    invoke-interface {v0}, Lcom/nmi/mtv/player/MediaFrameHandler$OnMediaInformationUpdated;->onVideoDecoderSetupDone()V

    .line 212
    :cond_1
    iput-boolean v1, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->isFirstVideoDisplayed:Z

    .line 213
    const-string/jumbo v0, "media frame handler"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "video Config error stride: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->videoStride:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " slice height: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->videoSliceHeight:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " width: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->videoWidth:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " height: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->videoHeight:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public release()I
    .locals 1

    .prologue
    .line 73
    invoke-direct {p0}, Lcom/nmi/mtv/player/MediaFrameHandler;->initMediaInformation()V

    .line 74
    const/4 v0, 0x0

    return v0
.end method

.method public releaseAudio()I
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 155
    invoke-direct {p0}, Lcom/nmi/mtv/player/MediaFrameHandler;->initAudioInformation()V

    .line 157
    const-string/jumbo v0, "media frame handler"

    const-string/jumbo v1, "release audio"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 160
    iget-object v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->audioCodec:Lcom/nmi/mtv/player/AudioDecoder;

    if-eqz v0, :cond_2

    .line 161
    iget-object v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->audioCodec:Lcom/nmi/mtv/player/AudioDecoder;

    invoke-virtual {v0}, Lcom/nmi/mtv/player/AudioDecoder;->close()I

    .line 162
    iput-object v2, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->audioCodec:Lcom/nmi/mtv/player/AudioDecoder;

    .line 163
    const-string/jumbo v0, "media frame handler"

    const-string/jumbo v1, "reqest release audio codedc"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 169
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->audioRender:Lcom/nmi/mtv/player/AudioRender;

    if-eqz v0, :cond_1

    .line 170
    iget-object v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->audioRender:Lcom/nmi/mtv/player/AudioRender;

    invoke-virtual {v0}, Lcom/nmi/mtv/player/AudioRender;->release()V

    .line 171
    iput-object v2, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->audioRender:Lcom/nmi/mtv/player/AudioRender;

    .line 174
    :cond_1
    const/4 v0, 0x0

    return v0

    .line 165
    :cond_2
    iget-object v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->mListener:Lcom/nmi/mtv/player/MediaFrameHandler$OnMediaInformationUpdated;

    if-eqz v0, :cond_0

    .line 166
    iget-object v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->mListener:Lcom/nmi/mtv/player/MediaFrameHandler$OnMediaInformationUpdated;

    invoke-interface {v0}, Lcom/nmi/mtv/player/MediaFrameHandler$OnMediaInformationUpdated;->onAudioDecoderStopDone()V

    goto :goto_0
.end method

.method public releaseVideo()I
    .locals 1

    .prologue
    .line 274
    invoke-direct {p0}, Lcom/nmi/mtv/player/MediaFrameHandler;->initVideoinformation()V

    .line 275
    invoke-direct {p0}, Lcom/nmi/mtv/player/MediaFrameHandler;->doReleaseVideo()I

    move-result v0

    return v0
.end method

.method public releaseVideoBuffers()V
    .locals 2

    .prologue
    .line 317
    const-string/jumbo v0, "media frame handler"

    const-string/jumbo v1, "release video output buffers"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 318
    iget-object v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->videoCodec:Lcom/nmi/mtv/player/VideoDecoder;

    if-eqz v0, :cond_0

    .line 319
    iget-object v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->videoCodec:Lcom/nmi/mtv/player/VideoDecoder;

    invoke-virtual {v0}, Lcom/nmi/mtv/player/VideoDecoder;->releaseAllBuffer()V

    .line 316
    :cond_0
    return-void
.end method

.method public restartVideoDec()V
    .locals 2

    .prologue
    .line 332
    const-string/jumbo v0, "media frame handler"

    const-string/jumbo v1, "restart video decoder"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 333
    invoke-direct {p0}, Lcom/nmi/mtv/player/MediaFrameHandler;->doReleaseVideo()I

    .line 334
    invoke-virtual {p0}, Lcom/nmi/mtv/player/MediaFrameHandler;->prepareVideo()V

    .line 331
    return-void
.end method

.method public selectChannel(I)Z
    .locals 1
    .param p1, "type"    # I

    .prologue
    .line 407
    iput p1, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->mSelectedLanguage:I

    .line 409
    invoke-direct {p0, p1}, Lcom/nmi/mtv/player/MediaFrameHandler;->selectAudioChannelWithLanguage(I)V

    .line 410
    const/4 v0, 0x1

    return v0
.end method

.method public setAACConfigBlock([BI)V
    .locals 0
    .param p1, "obj"    # [B
    .param p2, "i"    # I

    .prologue
    .line 83
    iput-object p1, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->audioConfigBlock:[B

    .line 82
    return-void
.end method

.method public setAudioConfig(II)V
    .locals 0
    .param p1, "samplerate"    # I
    .param p2, "channel"    # I

    .prologue
    .line 87
    iput p2, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->audioChannel:I

    .line 88
    iput p1, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->audioSamplerate:I

    .line 86
    return-void
.end method

.method public setMediaInformationListener(Lcom/nmi/mtv/player/MediaFrameHandler$OnMediaInformationUpdated;)V
    .locals 0
    .param p1, "listener"    # Lcom/nmi/mtv/player/MediaFrameHandler$OnMediaInformationUpdated;

    .prologue
    .line 450
    iput-object p1, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->mListener:Lcom/nmi/mtv/player/MediaFrameHandler$OnMediaInformationUpdated;

    .line 449
    return-void
.end method

.method public setSurface(Landroid/view/Surface;)V
    .locals 3
    .param p1, "surface"    # Landroid/view/Surface;

    .prologue
    .line 338
    iput-object p1, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->mSurface:Landroid/view/Surface;

    .line 339
    const-string/jumbo v0, "media frame handler"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "set surface("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 341
    if-eqz p1, :cond_0

    .line 342
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->surfaceTemporaryDisabled:Z

    .line 343
    const-string/jumbo v0, "media frame handler"

    const-string/jumbo v1, "surface is set try restart"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 344
    invoke-virtual {p0}, Lcom/nmi/mtv/player/MediaFrameHandler;->restartVideoDec()V

    .line 337
    :cond_0
    return-void
.end method

.method public setVideoPlaneSize(II)V
    .locals 0
    .param p1, "stride"    # I
    .param p2, "sliceHeight"    # I

    .prologue
    .line 194
    iput p1, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->videoStride:I

    .line 195
    iput p2, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->videoSliceHeight:I

    .line 193
    return-void
.end method

.method public setVideoResolution(II)V
    .locals 0
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    .line 200
    iput p1, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->videoWidth:I

    .line 201
    iput p2, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->videoHeight:I

    .line 199
    return-void
.end method

.method public setVolume(FF)V
    .locals 1
    .param p1, "left"    # F
    .param p2, "right"    # F

    .prologue
    .line 416
    iput p1, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->mLeftVolume:F

    .line 417
    iput p2, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->mRightVolume:F

    .line 418
    iget-object v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->audioRender:Lcom/nmi/mtv/player/AudioRender;

    if-eqz v0, :cond_0

    .line 419
    iget-object v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->audioRender:Lcom/nmi/mtv/player/AudioRender;

    invoke-virtual {v0, p1, p2}, Lcom/nmi/mtv/player/AudioRender;->setVolume(FF)I

    .line 415
    :cond_0
    return-void
.end method

.method public supplyYUVIndex(IJZ)V
    .locals 2
    .param p1, "idx"    # I
    .param p2, "ts"    # J
    .param p4, "draw"    # Z

    .prologue
    .line 359
    iget-object v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->videoCodec:Lcom/nmi/mtv/player/VideoDecoder;

    if-eqz v0, :cond_0

    .line 360
    iget-object v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->videoCodec:Lcom/nmi/mtv/player/VideoDecoder;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/nmi/mtv/player/VideoDecoder;->releaseBuffer(IJZ)V

    .line 361
    iget-boolean v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->isFirstVideoDisplayed:Z

    if-nez v0, :cond_0

    .line 362
    iget-object v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->mListener:Lcom/nmi/mtv/player/MediaFrameHandler$OnMediaInformationUpdated;

    invoke-interface {v0}, Lcom/nmi/mtv/player/MediaFrameHandler$OnMediaInformationUpdated;->onFirstVideoDisplayed()V

    .line 363
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->isFirstVideoDisplayed:Z

    .line 358
    :cond_0
    return-void
.end method

.method public surfaceCreated()V
    .locals 4

    .prologue
    .line 308
    const-string/jumbo v0, "media frame handler"

    const-string/jumbo v1, "surface created"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 309
    iget-object v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->videoCodec:Lcom/nmi/mtv/player/VideoDecoder;

    if-nez v0, :cond_0

    .line 310
    iget v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->videoStride:I

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->videoSliceHeight:I

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->videoWidth:I

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->videoHeight:I

    if-eqz v0, :cond_0

    .line 311
    iget v0, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->videoStride:I

    iget v1, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->videoSliceHeight:I

    iget v2, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->videoWidth:I

    iget v3, p0, Lcom/nmi/mtv/player/MediaFrameHandler;->videoHeight:I

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/nmi/mtv/player/MediaFrameHandler;->prepareVideoCodec(IIII)I

    .line 307
    :cond_0
    return-void
.end method
