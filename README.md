# rpi-pcspkr

pwm-beeper driver を利用し、Raspberry Pi で圧電ブザーを鳴らします。

# Installation

Raspberry Pi OS は、pwm-beeper driver が有効になっていません。

`CONFIG_INPUT_PWM_BEEPER` を有効にしてカーネル再構築するか、
カーネルソースから pwm-beeper.c だけ抜き出して、ソースツリー外でビルドしてインストールします。

ソースツリー外でモジュールビルドする場合の Makefile を examples/ に用意しています。

### ビルド&インストール

beep コマンドをインストールします。
```
sudo apt install beep
```

overlay と udev ルールをインストールします。
```
make
sudo make install
```

ブザーを接続するポートに合わせて /boot/firmware/config.txt に 下記のいずれか を記載します。
```
# GPIO12 (PWM0)
dtoverlay=pwm,pin=12,func=4
dtoverlay=rpi-pcspkr

# GPIO13 (PWM1)
dtoverlay=pwm,pin=13,func=4
dtoverlay=rpi-pcspkr,pwm1

# GPIO18 (PWM0)
dtoverlay=pwm,pin=18,func=2
dtoverlay=rpi-pcspkr

# GPIO19 (PWM1)
dtoverlay=pwm,pin=19,func=2
dtoverlay=rpi-pcspkr,pwm1
```

PWM0、PWM1を両方とも使用する場合は、pwm overlay の代わりに pwm-2chan overlay を使って、PWMポートを構成します。  
たとえば、ブザーに GPIO18(PWM0)、他の機能に GPIO13(PWM1) を使う場合は、下記の様にします。
```
dtoverlay=pwm-2chan,pin=18,func=2,pin2=13,func2=4
```

# Usage

beep コマンドで音が出るか確認します。
```
beep
```
パラメータ省略すると 440Hz でブザーが鳴ります。  
beep コマンドの使い方は MANページを確認してください。

