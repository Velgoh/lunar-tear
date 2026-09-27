# Lunar Tear // Violence District QTE Auto-Skillcheck

**Lunar Tear** is a lightweight, ultra-low latency automated QTE (Quick-Time Event) skillcheck macro for *Violence District* (Roblox). It utilizes multi-monitor screen capture and DirectInput hardware simulation to hit skill checks cleanly and consistently.

---

## Features

* **Sub-Millisecond Frame Capture**: High-speed multi-monitor screen capture powered by MSS with interactive desktop attachment for minimal latency (<1ms).
* **Hardware DirectInput Actuation**: Simulates physical Spacebar presses via DirectInput scancode `0x39` for anti-cheat-safe input handling.
* **Polar Coordinate Detection**: High-contrast radial scanning isolates the circular QTE ring, tracks the rotating needle, and detects the white success zone.
* **Passive Hotkeys**: Seamlessly pause or resume with **F1**, or exit cleanly with **F2** using non-blocking asynchronous key polling.
* **Fine-Tuning Configuration**: Adjust trigger delays, lead angles, needle contrast sensitivity, and resolution offsets via `config.json`.
* **Zero Bloat & Silent Operation**: Runs completely in the background without intrusive audio beeps or unnecessary dependencies.

---

## Quick Start

### 1. Requirements
* Windows 10 / 11 (64-bit)
* Python 3.10 or higher

### 2. Installation
1. Clone the repository or download the latest release bundle from [Releases](https://github.com/Velgoh/lunar-tear/releases):
   ```bash
   git clone https://github.com/Velgoh/lunar-tear.git
   cd lunar-tear
   ```

2. Install the required Python packages:
   ```bash
   pip install -r requirements.txt
   ```

3. Launch the macro:
   ```bash
   run_macro.bat
   ```
   *(or run `python qte_macro.py` directly from your terminal)*

---

## Controls & Hotkeys

| Hotkey | Function | Description |
| :--- | :--- | :--- |
| **F1** | **Toggle Active / Pause** | Enables or pauses automatic skillcheck detection. |
| **F2** | **Exit** | Gracefully releases screen capture resources and shuts down the macro. |

---

## Configuration (`config.json`)

All operational parameters can be customized in `config.json`:

```json
{
    "resolution": null,
    "center_override": null,
    "top_bar_offset": 36,
    "crop_size": 300,
    "hit_position": "start",
    "lead_degrees": 0.0,
    "offset_degrees": 0.0,
    "latency_ms": 0.0,
    "min_needle_score": 35.0,
    "hold_duration_ms": 35,
    "debounce_seconds": 0.08,
    "poll_interval_ms": 1,
    "trigger_delay_ms": 0,
    "toggle_key": "F1",
    "exit_key": "F2",
    "status_interval_ms": 250
}
```

### Parameter Reference

* **`hit_position`**: Target point within the white success patch.
  * `"start"` *(default)*: Triggers right as the needle enters the success zone.
  * `"center"`: Triggers at the geometric center of the success patch.
* **`offset_degrees`**: Angular offset calibration (positive values delay trigger, negative advance it).
* **`lead_degrees`**: Pre-trigger lead angle compensation for high needle rotational speeds.
* **`min_needle_score`**: Minimum contrast difference required to identify the needle (default `35.0`).
* **`hold_duration_ms`**: Duration to hold down the Spacebar keystroke in milliseconds (default `35`).
* **`debounce_seconds`**: Cooldown interval after a skillcheck is triggered to prevent duplicate inputs.
* **`crop_size`**: Bounding box size (in pixels) centered on the screen to capture the QTE ring.
* **`toggle_key` / `exit_key`**: Keybinds for toggling active state and exiting the script.

---

*Glory to mankind.*

