.class public Landroid/net/DhcpInfo;
.super Ljava/lang/Object;
.source "DhcpInfo.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Landroid/net/DhcpInfo;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public dns1:I

.field public dns2:I

.field public gateway:I

.field public ipAddress:I

.field public leaseDuration:I

.field public netmask:I

.field public serverAddress:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    new-instance v0, Landroid/net/DhcpInfo$1;

    invoke-direct {v0}, Landroid/net/DhcpInfo$1;-><init>()V

    sput-object v0, Landroid/net/DhcpInfo;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroid/net/DhcpInfo;)V
    .locals 1
    .param p1, "source"    # Landroid/net/DhcpInfo;

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_0

    iget v0, p1, Landroid/net/DhcpInfo;->ipAddress:I

    iput v0, p0, Landroid/net/DhcpInfo;->ipAddress:I

    iget v0, p1, Landroid/net/DhcpInfo;->gateway:I

    iput v0, p0, Landroid/net/DhcpInfo;->gateway:I

    iget v0, p1, Landroid/net/DhcpInfo;->netmask:I

    iput v0, p0, Landroid/net/DhcpInfo;->netmask:I

    iget v0, p1, Landroid/net/DhcpInfo;->dns1:I

    iput v0, p0, Landroid/net/DhcpInfo;->dns1:I

    iget v0, p1, Landroid/net/DhcpInfo;->dns2:I

    iput v0, p0, Landroid/net/DhcpInfo;->dns2:I

    iget v0, p1, Landroid/net/DhcpInfo;->serverAddress:I

    iput v0, p0, Landroid/net/DhcpInfo;->serverAddress:I

    iget v0, p1, Landroid/net/DhcpInfo;->leaseDuration:I

    iput v0, p0, Landroid/net/DhcpInfo;->leaseDuration:I

    :cond_0
    return-void
.end method

.method private static putAddress(Ljava/lang/StringBuffer;I)V
    .locals 1
    .param p0, "buf"    # Ljava/lang/StringBuffer;
    .param p1, "addr"    # I

    .prologue
    invoke-static {p1}, Landroid/net/NetworkUtils;->intToInetAddress(I)Ljava/net/InetAddress;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    const/4 v0, 0x0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .local v0, "str":Ljava/lang/StringBuffer;
    const-string v1, "ipaddr "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    iget v1, p0, Landroid/net/DhcpInfo;->ipAddress:I

    invoke-static {v0, v1}, Landroid/net/DhcpInfo;->putAddress(Ljava/lang/StringBuffer;I)V

    const-string v1, " gateway "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    iget v1, p0, Landroid/net/DhcpInfo;->gateway:I

    invoke-static {v0, v1}, Landroid/net/DhcpInfo;->putAddress(Ljava/lang/StringBuffer;I)V

    const-string v1, " netmask "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    iget v1, p0, Landroid/net/DhcpInfo;->netmask:I

    invoke-static {v0, v1}, Landroid/net/DhcpInfo;->putAddress(Ljava/lang/StringBuffer;I)V

    const-string v1, " dns1 "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    iget v1, p0, Landroid/net/DhcpInfo;->dns1:I

    invoke-static {v0, v1}, Landroid/net/DhcpInfo;->putAddress(Ljava/lang/StringBuffer;I)V

    const-string v1, " dns2 "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    iget v1, p0, Landroid/net/DhcpInfo;->dns2:I

    invoke-static {v0, v1}, Landroid/net/DhcpInfo;->putAddress(Ljava/lang/StringBuffer;I)V

    const-string v1, " DHCP server "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    iget v1, p0, Landroid/net/DhcpInfo;->serverAddress:I

    invoke-static {v0, v1}, Landroid/net/DhcpInfo;->putAddress(Ljava/lang/StringBuffer;I)V

    const-string v1, " lease "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget v2, p0, Landroid/net/DhcpInfo;->leaseDuration:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, " seconds"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    iget v0, p0, Landroid/net/DhcpInfo;->ipAddress:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    iget v0, p0, Landroid/net/DhcpInfo;->gateway:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    iget v0, p0, Landroid/net/DhcpInfo;->netmask:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    iget v0, p0, Landroid/net/DhcpInfo;->dns1:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    iget v0, p0, Landroid/net/DhcpInfo;->dns2:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    iget v0, p0, Landroid/net/DhcpInfo;->serverAddress:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    iget v0, p0, Landroid/net/DhcpInfo;->leaseDuration:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    return-void
.end method
