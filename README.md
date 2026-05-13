# mac-bg-recorder

Background screen recorder for macOS using ffmpeg.

It starts recording, saves PID, and lets you close Terminal. Later open Terminal again and run `./record-stop`.

## Install

```bash
cd /Users/vqns/develop/scripts
unzip ~/Downloads/mac-bg-recorder.zip
cd mac-bg-recorder
chmod +x *
./install.sh
```

## First setup

List devices:

```bash
./devices
```

Edit `config.env` and set:

```bash
SCREEN_DEVICE="1"
AUDIO_DEVICE="0"
```

The ffmpeg input becomes `SCREEN_DEVICE:AUDIO_DEVICE`, for example `1:0`.

## Start

```bash
./record
```

Now you can close Terminal.

## Stop and save

```bash
cd /Users/vqns/develop/scripts/mac-bg-recorder
./record-stop
```

## Status

```bash
./record-status
```

## Open recordings folder

```bash
./open-records
```

## Important macOS permissions

On first use macOS may ask for:

- Screen Recording permission for Terminal / iTerm
- Microphone permission for Terminal / iTerm

If recording fails, check:

```bash
./last-log
```

## System audio + microphone

macOS does not expose system audio as a normal recording input by default. For game audio + microphone together you need a virtual audio driver such as BlackHole and an Aggregate Device:

1. Install BlackHole 2ch:

```bash
brew install --cask blackhole-2ch
```

2. Reboot if macOS asks.
3. Open Audio MIDI Setup.
4. Create Multi-Output Device with:
   - MacBook Pro Speakers / headphones
   - BlackHole 2ch
5. Set this Multi-Output Device as system output.
6. Create Aggregate Device with:
   - MacBook Pro Microphone
   - BlackHole 2ch
7. Use that Aggregate Device as `AUDIO_DEVICE` in `config.env` after checking `./devices`.

Without BlackHole/Aggregate Device, you can usually record screen + microphone only.
