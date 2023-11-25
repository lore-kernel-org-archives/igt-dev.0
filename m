Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0E2010E03F
 for <igt-dev@lists.freedesktop.org>; Sat, 25 Nov 2023 16:30:32 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	swati2.sharma@intel.com
Date: Sat, 25 Nov 2023 21:50:11 +0530
Message-Id: <20231125162013.2421478-4-bhanuprakash.modem@intel.com>
In-Reply-To: <20231125162013.2421478-1-bhanuprakash.modem@intel.com>
References: <20231125162013.2421478-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 3/5] tests/kms/testplan: Optimize KMS testplan
 documentation
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Moving all common key:values to TEST level from SUBTEST will
minimize the maintenance effort.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/chamelium/kms_chamelium_audio.c  |  10 +-
 tests/chamelium/kms_chamelium_color.c  |  16 +-
 tests/chamelium/kms_chamelium_edid.c   |  22 +-
 tests/chamelium/kms_chamelium_frames.c |  33 +-
 tests/chamelium/kms_chamelium_hpd.c    |  69 +--
 tests/intel/kms_big_fb.c               |  33 +-
 tests/intel/kms_big_joiner.c           |  16 +-
 tests/intel/kms_busy.c                 |  27 +-
 tests/intel/kms_ccs.c                  |  15 +-
 tests/intel/kms_cdclk.c                |  16 +-
 tests/intel/kms_draw_crc.c             |  15 +-
 tests/intel/kms_dsc.c                  |   8 +-
 tests/intel/kms_fbcon_fbt.c            |  10 +-
 tests/intel/kms_flip_scaled_crc.c      |  70 +---
 tests/intel/kms_frontbuffer_tracking.c | 559 +------------------------
 tests/intel/kms_legacy_colorkey.c      |  12 +-
 tests/intel/kms_pipe_b_c_ivb.c         |  24 +-
 tests/intel/kms_pm_backlight.c         |  22 +-
 tests/intel/kms_pm_dc.c                |  29 +-
 tests/intel/kms_pm_lpsp.c              |  11 +-
 tests/intel/kms_pm_rpm.c               |   4 +
 tests/intel/kms_psr.c                  |  73 +---
 tests/intel/kms_psr2_sf.c              |  36 +-
 tests/intel/kms_psr2_su.c              |   9 +-
 tests/intel/kms_psr_stress_test.c      |  12 +-
 tests/kms_addfb_basic.c                |  96 +----
 tests/kms_async_flips.c                |  26 +-
 tests/kms_atomic.c                     |  32 +-
 tests/kms_atomic_interruptible.c       |  18 +-
 tests/kms_atomic_transition.c          |  30 +-
 tests/kms_bw.c                         |   8 +-
 tests/kms_color.c                      |  32 +-
 tests/kms_content_protection.c         |  29 +-
 tests/kms_cursor_crc.c                 |  18 +-
 tests/kms_cursor_edge_walk.c           |   9 +-
 tests/kms_cursor_legacy.c              |  68 +--
 tests/kms_display_modes.c              |   9 +-
 tests/kms_dither.c                     |  12 +-
 tests/kms_feature_discovery.c          |  21 +-
 tests/kms_flip.c                       |  78 +---
 tests/kms_force_connector_basic.c      |  18 +-
 tests/kms_getfb.c                      |  30 +-
 tests/kms_hdmi_inject.c                |   9 +-
 tests/kms_hdr.c                        |  32 +-
 tests/kms_invalid_mode.c               |   8 +-
 tests/kms_lease.c                      |  88 +---
 tests/kms_panel_fitting.c              |  12 +-
 tests/kms_pipe_crc_basic.c             |  37 +-
 tests/kms_plane.c                      |  21 +-
 tests/kms_plane_alpha_blend.c          |  20 +-
 tests/kms_plane_cursor.c               |  16 +-
 tests/kms_plane_lowres.c               |  11 +-
 tests/kms_plane_multiple.c             |  11 +-
 tests/kms_plane_scaling.c              |  84 +---
 tests/kms_prime.c                      |  15 +-
 tests/kms_prop_blob.c                  |  20 +-
 tests/kms_properties.c                 |  12 +-
 tests/kms_rmfb.c                       |  12 +-
 tests/kms_rotation_crc.c               |  41 +-
 tests/kms_scaling_modes.c              |   8 +-
 tests/kms_selftest.c                   |   8 +-
 tests/kms_sequence.c                   |  12 +-
 tests/kms_setmode.c                    |  27 +-
 tests/kms_tiled_display.c              |   9 +-
 tests/kms_universal_plane.c            |  19 +-
 tests/kms_vblank.c                     |  30 +-
 tests/kms_vrr.c                        |  22 +-
 tests/kms_writeback.c                  |  26 +-
 68 files changed, 255 insertions(+), 2040 deletions(-)

diff --git a/tests/chamelium/kms_chamelium_audio.c b/tests/chamelium/kms_chamelium_audio.c
index f86610861..cc2c23a76 100644
--- a/tests/chamelium/kms_chamelium_audio.c
+++ b/tests/chamelium/kms_chamelium_audio.c
@@ -28,6 +28,8 @@
  * TEST: kms chamelium audio
  * Category: Display
  * Description: Testing Audio with a Chamelium board
+ * Driver requirement: i915, xe
+ * Test category: functionality test
  */
 
 #include "igt_eld.h"
@@ -38,34 +40,26 @@
  * SUBTEST: dp-audio
  * Description: Playback various audio signals with various audio formats/rates,
  *              capture them and check they are correct
- * Driver requirement: i915, xe
  * Functionality: chamelium, dp_audio
  * Mega feature: Audio, DP
- * Test category: functionality test
  *
  * SUBTEST: hdmi-audio
  * Description: Playback various audio signals with various audio formats/rates,
  *              capture them and check they are correct
- * Driver requirement: i915, xe
  * Functionality: chamelium, hdmi_audio
  * Mega feature: Audio, HDMI
- * Test category: functionality test
  *
  * SUBTEST: dp-audio-edid
  * Description: Plug a connector with an EDID suitable for audio, check ALSA's
  *              EDID-Like Data reports the correct audio parameters
- * Driver requirement: i915, xe
  * Functionality: chamelium, dp_audio
  * Mega feature: Audio, DP
- * Test category: functionality test
  *
  * SUBTEST: hdmi-audio-edid
  * Description: Plug a connector with an EDID suitable for audio, check ALSA's
  *              EDID-Like Data reports the correct audio parameters
- * Driver requirement: i915, xe
  * Functionality: chamelium, hdmi_audio
  * Mega feature: Audio, HDMI
- * Test category: functionality test
  */
 
 /* Playback parameters control the audio signal we synthesize and send */
diff --git a/tests/chamelium/kms_chamelium_color.c b/tests/chamelium/kms_chamelium_color.c
index 6123e8a5f..e94e13e40 100644
--- a/tests/chamelium/kms_chamelium_color.c
+++ b/tests/chamelium/kms_chamelium_color.c
@@ -26,6 +26,10 @@
  * TEST: kms chamelium color
  * Category: Display
  * Description: Test Color Features at Pipe level using Chamelium to verify instead of CRC
+ * Driver requirement: i915, xe
+ * Functionality: chamelium, colorspace
+ * Mega feature: Color mgmt
+ * Test category: functionality test
  */
 
 #include "kms_color_helper.h"
@@ -33,24 +37,12 @@
 /**
  * SUBTEST: degamma
  * Description: Verify that degamma LUT transformation works correctly
- * Driver requirement: i915, xe
- * Functionality: chamelium, colorspace
- * Mega feature: Color mgmt
- * Test category: functionality test
  *
  * SUBTEST: gamma
  * Description: Verify that gamma LUT transformation works correctly
- * Driver requirement: i915, xe
- * Functionality: chamelium, colorspace
- * Mega feature: Color mgmt
- * Test category: functionality test
  *
  * SUBTEST: ctm-%s
  * Description: Check the color transformation %arg[1]
- * Driver requirement: i915, xe
- * Functionality: chamelium, colorspace
- * Mega feature: Color mgmt
- * Test category: functionality test
  *
  * arg[1]:
  *
diff --git a/tests/chamelium/kms_chamelium_edid.c b/tests/chamelium/kms_chamelium_edid.c
index f3f0b1e50..6550b7b74 100644
--- a/tests/chamelium/kms_chamelium_edid.c
+++ b/tests/chamelium/kms_chamelium_edid.c
@@ -28,6 +28,8 @@
  * TEST: kms chamelium edid
  * Category: Display
  * Description: Testing EDID with a Chamelium board
+ * Driver requirement: i915, xe
+ * Test category: functionality test
  */
 
 #include <fcntl.h>
@@ -51,22 +53,16 @@
 /**
  * SUBTEST: dp-edid-read
  * Description: Make sure the EDID exposed by KMS is the same as the screen's
- * Driver requirement: i915, xe
- * Test category: functionality test
  * Functionality: chamelium, dp_edid
  * Mega feature: DP
  *
  * SUBTEST: hdmi-edid-read
  * Description: Make sure the EDID exposed by KMS is the same as the screen's
- * Driver requirement: i915, xe
- * Test category: functionality test
  * Functionality: chamelium, hdmi_edid
  * Mega feature: HDMI
  *
  * SUBTEST: vga-edid-read
  * Description: Make sure the EDID exposed by KMS is the same as the screen's
- * Driver requirement: i915, xe
- * Test category: functionality test
  * Functionality: chamelium, vga_edid
  * Mega feature: VGA
  *
@@ -74,28 +70,22 @@
  * Description: Get an EDID with many modes of different configurations, set
  *              them on the screen and check the screen resolution matches the
  *              mode resolution.
- * Driver requirement: i915, xe
  * Functionality: chamelium, dp_edid
  * Mega feature: DP
- * Test category: functionality test
  *
  * SUBTEST: dp-mode-timings
  * Description: For each mode of the IGT base EDID, perform a modeset and check
  *              the mode detected by the Chamelium receiver matches the mode we
  *              set
- * Driver requirement: i915, xe
  * Functionality: chamelium, dp_edid
  * Mega feature: DP
- * Test category: functionality test
  *
  * SUBTEST: hdmi-mode-timings
  * Description: For each mode of the IGT base EDID, perform a modeset and check
  *              the mode detected by the Chamelium receiver matches the mode we
  *              set
- * Driver requirement: i915, xe
  * Functionality: chamelium, dp_edid
  * Mega feature: DP
- * Test category: functionality test
  */
 
 /**
@@ -103,19 +93,15 @@
  * Description: Stress test the DUT by testing multiple EDIDs, one right after
  *              the other, and ensure their validity by check the real screen
  *              resolution vs the advertised mode (%arg[1]) resolution.
- * Driver requirement: i915, xe
  * Functionality: chamelium, dp_edid
  * Mega feature: DP
- * Test category: functionality test
  *
  * SUBTEST: hdmi-edid-stress-resolution-%s
  * Description: Stress test the DUT by testing multiple EDIDs, one right after
  *              the other, and ensure their validity by check the real screen
  *              resolution vs the advertised mode (%arg[1]) resolution.
- * Driver requirement: i915, xe
  * Functionality: chamelium, hdmi_edid
  * Mega feature: HDMI
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -128,19 +114,15 @@
  * Description: Simulate a screen being unplugged and another screen being
  *              plugged during suspend, check that a uevent is sent and
  *              connector status is updated during %arg[1]
- * Driver requirement: i915, xe
  * Functionality: chamelium, dp_edid
  * Mega feature: DP
- * Test category: functionality test
  *
  * SUBTEST: hdmi-edid-change-during-%s
  * Description: Simulate a screen being unplugged and another screen being
  *              plugged during suspend, check that a uevent is sent and
  *              connector status is updated during %arg[1]
- * Driver requirement: i915, xe
  * Functionality: chamelium, dp_edid
  * Mega feature: DP
- * Test category: functionality test
  *
  * arg[1]:
  *
diff --git a/tests/chamelium/kms_chamelium_frames.c b/tests/chamelium/kms_chamelium_frames.c
index 490ab3fe9..c14245a71 100644
--- a/tests/chamelium/kms_chamelium_frames.c
+++ b/tests/chamelium/kms_chamelium_frames.c
@@ -28,6 +28,9 @@
  * TEST: kms chamelium frames
  * Category: Display
  * Description: Tests requiring a Chamelium board
+ * Driver requirement: i915, xe
+ * Functionality: chamelium, frame_integrity
+ * Test category: functionality test
  */
 
 #include "igt_eld.h"
@@ -38,26 +41,17 @@
  * SUBTEST: dp-crc-fast
  * Description: Pick the first mode of the IGT base EDID, display and capture
  * 		a few frames, then check captured frames are correct
- * Driver requirement: i915, xe
- * Functionality: chamelium, frame_integrity
  * Mega feature: DP
- * Test category: functionality test
  *
  * SUBTEST: hdmi-crc-fast
  * Description: Pick the first mode of the IGT base EDID, display and capture
  * 		a few frames, then check captured frames are correct
- * Driver requirement: i915, xe
- * Functionality: chamelium, frame_integrity
  * Mega feature: HDMI
- * Test category: functionality test
  *
  * SUBTEST: hdmi-%s-formats
  * Description: Pick the first mode of the IGT base EDID, display and capture a
  *              few frames, then check captured frames are correct
- * Driver requirement: i915, xe
- * Functionality: chamelium, frame_integrity
  * Mega feature: HDMI
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -69,26 +63,17 @@
  * SUBTEST: vga-frame-dump
  * Description: For each mode of the IGT base EDID, display and capture a few
  *              frames, then check captured frames are correct
- * Driver requirement: i915, xe
- * Functionality: chamelium, frame_integrity
  * Mega feature: VGA
- * Test category: functionality test
  *
  * SUBTEST: dp-crc-%s
  * Description: For each mode of the IGT base EDID, display and capture a %arg[1]
  *              frame(s), then check captured frame(s) are correct
- * Driver requirement: i915, xe
- * Functionality: chamelium, frame_integrity
  * Mega feature: DP
- * Test category: functionality test
  *
  * SUBTEST: hdmi-crc-%s
  * Description: For each mode of the IGT base EDID, display and capture a %arg[1]
  *              frame(s), then check captured frame(s) are correct
- * Driver requirement: i915, xe
- * Functionality: chamelium, frame_integrity
  * Mega feature: HDMI
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -101,35 +86,23 @@
  * Description: For each mode of the IGT base EDID, display and capture a few
  *              frames, then download the captured frames and compare them
  *              bit-by-bit to the sent ones
- * Driver requirement: i915, xe
- * Functionality: chamelium, frame_integrity
  * Mega feature: DP
- * Test category: functionality test
  *
  * SUBTEST: hdmi-frame-dump
  * Description: For each mode of the IGT base EDID, display and capture a few
  *              frames, then download the captured frames and compare them
  *              bit-by-bit to the sent ones
- * Driver requirement: i915, xe
- * Functionality: chamelium, frame_integrity
  * Mega feature: HDMI
- * Test category: functionality test
  *
  * SUBTEST: hdmi-aspect-ratio
  * Description: Pick a mode with a picture aspect-ratio, capture AVI InfoFrames
  *              and check they include the relevant fields
- * Driver requirement: i915, xe
- * Functionality: chamelium, frame_integrity
  * Mega feature: HDMI
- * Test category: functionality test
  *
  * SUBTEST: hdmi-%s-planes-random
  * Description: Setup a few overlay planes with random parameters, capture the
  *              frame and check it matches the expected output
- * Driver requirement: i915, xe
- * Functionality: chamelium, frame_integrity
  * Mega feature: HDMI
- * Test category: functionality test
  *
  * arg[1]:
  *
diff --git a/tests/chamelium/kms_chamelium_hpd.c b/tests/chamelium/kms_chamelium_hpd.c
index 360694c76..7e580e20e 100644
--- a/tests/chamelium/kms_chamelium_hpd.c
+++ b/tests/chamelium/kms_chamelium_hpd.c
@@ -28,6 +28,9 @@
  * TEST: kms chamelium hpd
  * Category: Display
  * Description: Testing HPD with a Chamelium board
+ * Driver requirement: i915, xe
+ * Functionality: chamelium, hotplug
+ * Test category: functionality test
  */
 
 #include "kms_chamelium_helper.h"
@@ -36,74 +39,47 @@
  * SUBTEST: dp-hpd-fast
  * Description: Check that we get uevents and updated connector status on
  * 		hotplug and unplug
- * Driver requirement: i915, xe
- * Functionality: chamelium, hotplug
  * Mega feature: DP
- * Test category: functionality test
  *
  * SUBTEST: hdmi-hpd-fast
  * Description: Check that we get uevents and updated connector status on
  * 		hotplug and unplug
- * Driver requirement: i915, xe
- * Functionality: chamelium, hotplug
  * Mega feature: HDMI
- * Test category: functionality test
  *
  * SUBTEST: vga-hpd-fast
  * Description: Check that we get uevents and updated connector status on
  * 		hotplug and unplug
- * Driver requirement: i915, xe
- * Functionality: chamelium, hotplug
  * Mega feature: VGA
- * Test category: functionality test
  *
  * SUBTEST: dp-hpd
  * Description: Check that we get uevents and updated connector status on
  *              hotplug and unplug
- * Driver requirement: i915, xe
- * Functionality: chamelium, hotplug
  * Mega feature: DP
- * Test category: functionality test
  *
  * SUBTEST: hdmi-hpd
  * Description: Check that we get uevents and updated connector status on
  *              hotplug and unplug
- * Driver requirement: i915, xe
- * Functionality: chamelium, hotplug
  * Mega feature: HDMI
- * Test category: functionality test
  *
  * SUBTEST: vga-hpd
  * Description: Check that we get uevents and updated connector status on
  *              hotplug and unplug
- * Driver requirement: i915, xe
- * Functionality: chamelium, hotplug
  * Mega feature: VGA
- * Test category: functionality test
  *
  * SUBTEST: dp-hpd-%s
  * Description: Check that we get uevents and updated connector status on
  *              hotplug and unplug
- * Driver requirement: i915, xe
- * Functionality: chamelium, hotplug
  * Mega feature: DP
- * Test category: functionality test
  *
  * SUBTEST: hdmi-hpd-%s
  * Description: Check that we get uevents and updated connector status on
  *              hotplug and unplug
- * Driver requirement: i915, xe
- * Functionality: chamelium, hotplug
  * Mega feature: HDMI
- * Test category: functionality test
  *
  * SUBTEST: vga-hpd-%s
  * Description: Check that we get uevents and updated connector status on
  *              hotplug and unplug
- * Driver requirement: i915, xe
- * Functionality: chamelium, hotplug
  * Mega feature: VGA
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -115,132 +91,93 @@
  * SUBTEST: dp-hpd-for-each-pipe
  * Description: Check that we get uevents and updated connector status on
  *              hotplug and unplug for each pipe with valid output
- * Driver requirement: i915, xe
- * Functionality: chamelium, hotplug
  * Mega feature: DP
- * Test category: functionality test
  *
  * SUBTEST: hdmi-hpd-for-each-pipe
  * Description: Check that we get uevents and updated connector status on
  *              hotplug and unplug for each pipe with valid output
- * Driver requirement: i915, xe
- * Functionality: chamelium, hotplug
  * Mega feature: HDMI
- * Test category: functionality test
  *
  * SUBTEST: vga-hpd-for-each-pipe
  * Description: Check that we get uevents and updated connector status on
  *              hotplug and unplug for each pipe with valid output
- * Driver requirement: i915, xe
- * Functionality: chamelium, hotplug
  * Mega feature: VGA
  * Test category: functionality test
  *
  * SUBTEST: dp-hpd-after-hibernate
  * Description: Toggle HPD during Hibernation, check that uevents are sent and
  *              connector status is updated
- * Driver requirement: i915, xe
  * Functionality: chamelium, hotplug, hibernation
  * Mega feature: DP
- * Test category: functionality test
  *
  * SUBTEST: hdmi-hpd-after-hibernate
  * Description: Toggle HPD during Hibernation, check that uevents are sent and
  *              connector status is updated
- * Driver requirement: i915, xe
  * Functionality: chamelium, hotplug, hibernation
  * Mega feature: HDMI
- * Test category: functionality test
  *
  * SUBTEST: vga-hpd-after-hibernate
  * Description: Toggle HPD during Hibernation, check that uevents are sent and
  *              connector status is updated
- * Driver requirement: i915, xe
  * Functionality: chamelium, hotplug, hibernation
  * Mega feature: VGA
- * Test category: functionality test
  *
  * SUBTEST: dp-hpd-after-suspend
  * Description: Toggle HPD during Suspend, check that uevents are sent and
  *              connector status is updated
- * Driver requirement: i915, xe
  * Functionality: chamelium, hotplug, suspend
  * Mega feature: DP
- * Test category: functionality test
  *
  * SUBTEST: hdmi-hpd-after-suspend
  * Description: Toggle HPD during Suspend, check that uevents are sent and
  *              connector status is updated
- * Driver requirement: i915, xe
  * Functionality: chamelium, hotplug, suspend
  * Mega feature: HDMI
- * Test category: functionality test
  *
  * SUBTEST: vga-hpd-after-suspend
  * Description: Toggle HPD during Suspend, check that uevents are sent and
  *              connector status is updated
- * Driver requirement: i915, xe
  * Functionality: chamelium, hotplug, suspend
  * Mega feature: VGA
- * Test category: functionality test
  *
  * SUBTEST: common-hpd-after-suspend
  * Description: Toggle HPD during suspend on all connectors, check that uevents
  * 		are sent and connector status is updated
- * Driver requirement: i915, xe
  * Functionality: chamelium, hotplug, suspend
  * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: common-hpd-after-hibernate
  * Description: Toggle HPD during suspend on all connectors, check that uevents
  *              are sent and connector status is updated
- * Driver requirement: i915, xe
  * Functionality: chamelium, hotplug, hibernation
  * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: vga-hpd-without-ddc
  * Description: Disable DDC on a VGA connector, check we still get a uevent on
  *              hotplug
- * Driver requirement: i915, xe
- * Functionality: chamelium, hotplug
  * Mega feature: VGA
- * Test category: functionality test
  *
  * SUBTEST: dp-hpd-storm
  * Description: Trigger a series of hotplugs in a very small timeframe to
  *              simulate abad cable, check the kernel falls back to polling
  *              to avoid a hotplug storm
- * Driver requirement: i915, xe
- * Functionality: chamelium, hotplug
  * Mega feature: DP
- * Test category: functionality test
  *
  * SUBTEST: hdmi-hpd-storm
  * Description: Trigger a series of hotplugs in a very small timeframe to
  *              simulate abad cable, check the kernel falls back to polling
  *              to avoid a hotplug storm
- * Driver requirement: i915, xe
- * Functionality: chamelium, hotplug
  * Mega feature: HDMI
- * Test category: functionality test
  *
  * SUBTEST: dp-hpd-storm-disable
  * Description: Disable HPD storm detection, trigger a storm and check the
  *              kernel doesn't detect one
- * Driver requirement: i915, xe
- * Functionality: chamelium, hotplug
  * Mega feature: DP
- * Test category: functionality test
  *
  * SUBTEST: hdmi-hpd-storm-disable
  * Description: Disable HPD storm detection, trigger a storm and check the
  *              kernel doesn't detect one
- * Driver requirement: i915, xe
- * Functionality: chamelium, hotplug
  * Mega feature: HDMI
- * Test category: functionality test
  */
 
 #define HPD_STORM_PULSE_INTERVAL_DP 100 /* ms */
diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
index cce7027e9..82aff532b 100644
--- a/tests/intel/kms_big_fb.c
+++ b/tests/intel/kms_big_fb.c
@@ -25,6 +25,9 @@
  * TEST: kms big fb
  * Category: Display
  * Description: Test big framebuffers
+ * Driver requirement: i915, xe
+ * Mega feature: General Display Features
+ * Test category: functionality test
  */
 
 #include "igt.h"
@@ -41,10 +44,7 @@
  * SUBTEST: linear-%dbpp-rotate-%d
  * Description: Sanity check if addfb ioctl works correctly for given combination
  *              of Linear modifier with %arg[1]-bpp & %arg[2]-rotation
- * Driver requirement: i915, xe
  * Functionality: big_fbs, kms_gem_interop, rotation
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1].values:       8, 16, 32, 64
  * arg[2].values:       0, 90, 180, 270
@@ -54,10 +54,7 @@
  * SUBTEST: %s-%dbpp-rotate-%d
  * Description: Sanity check if addfb ioctl works correctly for given combination
  *              of %arg[1] with %arg[2]-bpp & %arg[3]-rotation
- * Driver requirement: i915, xe
  * Functionality: big_fbs, kms_gem_interop, rotation, tiling
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -75,10 +72,7 @@
  * Description: Test maximum hardware supported stride length for given combination
  *              of linear modifier with max hardware stride length, %arg[1]-bpp,
  *              and %arg[2]-rotation
- * Driver requirement: i915, xe
  * Functionality: big_fbs, kms_gem_interop, rotation
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1].values:       32, 64
  * arg[2].values:       0, 180
@@ -89,10 +83,7 @@
  * Description: Test maximum hardware supported stride length for given combination
  *              of %arg[1] modifier with max hardware stride length, %arg[2]-bpp,
  *              and %arg[3]-rotation
- * Driver requirement: i915, xe
  * Functionality: big_fbs, kms_gem_interop, rotation, tiling
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -110,19 +101,13 @@
  * Description: Test maximum hardware supported stride length for given combination
  *              of %arg[1] modifier with max hardware stride length, %arg[2]-bpp,
  *              and %arg[3]-rotation with H-flip mode
- * Driver requirement: i915, xe
  * Functionality: big_fbs, kms_gem_interop, rotation, tiling
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: %s-max-hw-stride-%dbpp-rotate-%d-%s
  * Description: Test maximum hardware supported stride length for given combination
  *              of %arg[1] modifier with max hardware stride length, %arg[2]-bpp,
  *              and %arg[3]-rotation with %arg[4] mode
- * Driver requirement: i915, xe
  * Functionality: async_flips, big_fbs, kms_gem_interop, rotation, tiling
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -144,34 +129,22 @@
  * SUBTEST: linear-addfb
  * Description: Sanity check if addfb ioctl works correctly with Linear modifier
  *              for given size and strides of fb
- * Driver requirement: i915, xe
  * Functionality: big_fbs, kms_gem_interop
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: %s-addfb
  * Description: Sanity check if addfb ioctl works correctly with %arg[1] modifier
  *              for given size and strides of fb
- * Driver requirement: i915, xe
  * Functionality: big_fbs, kms_gem_interop, tiling
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: %s-addfb-size-overflow
  * Description: Sanity check if addfb ioctl fails correctly for (%arg[1]) modifier
  *              with small bo.
- * Driver requirement: i915, xe
  * Functionality: big_fbs, kms_gem_interop, tiling
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: %s-addfb-size-offset-overflow
  * Description: Sanity check if addfb ioctl fails correctly for (%arg[1]) modifier
  *              and offsets with small bo
- * Driver requirement: i915, xe
  * Functionality: big_fbs, kms_gem_interop, tiling
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
diff --git a/tests/intel/kms_big_joiner.c b/tests/intel/kms_big_joiner.c
index 3f2091723..c5f9f8db7 100644
--- a/tests/intel/kms_big_joiner.c
+++ b/tests/intel/kms_big_joiner.c
@@ -28,6 +28,10 @@
  * TEST: kms big joiner
  * Category: Display
  * Description: Test big joiner
+ * Driver requirement: i915, xe
+ * Functionality: 2p1p
+ * Mega feature: Bigjoiner
+ * Test category: functionality test
  */
 
 #include "igt.h"
@@ -36,24 +40,12 @@
  * SUBTEST: invalid-modeset
  * Description: Verify if the modeset on the adjoining pipe is rejected when
  *              the pipe is active with a big joiner modeset
- * Driver requirement: i915, xe
- * Functionality: 2p1p
- * Mega feature: Bigjoiner
- * Test category: functionality test
  *
  * SUBTEST: basic
  * Description: Verify the basic modeset on big joiner mode on all pipes
- * Driver requirement: i915, xe
- * Functionality: 2p1p
- * Mega feature: Bigjoiner
- * Test category: functionality test
  *
  * SUBTEST: 2x-modeset
  * Description: Verify simultaneous modeset on 2 big joiner outputs
- * Driver requirement: i915, xe
- * Functionality: 2p1p
- * Mega feature: Bigjoiner
- * Test category: functionality test
  */
 
 IGT_TEST_DESCRIPTION("Test big joiner");
diff --git a/tests/intel/kms_busy.c b/tests/intel/kms_busy.c
index 63d1bbf71..004d9ee6e 100644
--- a/tests/intel/kms_busy.c
+++ b/tests/intel/kms_busy.c
@@ -25,6 +25,10 @@
  * TEST: kms busy
  * Category: Display
  * Description: Basic check of KMS ABI with busy framebuffers.
+ * Driver requirement: i915
+ * Functionality: kms_core, hang
+ * Mega feature: General Display Features
+ * Test category: functionality test
  */
 
 #include <sys/poll.h>
@@ -37,38 +41,19 @@
 /**
  * SUBTEST: basic
  * Description: Test for basic check of KMS ABI with busy framebuffers.
- * Driver requirement: i915
  * Functionality: kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: basic-hang
  * Description: Test for basic check of KMS ABI with busy framebuffers.
- * Driver requirement: i915
- * Functionality: kms_core, hang
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: extended-pageflip-modeset-hang-oldfb
  * Description: Test for basic check of KMS ABI with busy framebuffers.
- * Driver requirement: i915
- * Functionality: kms_core, hang
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: extended-pageflip-hang-%s
  * Description: Test for basic check of KMS ABI with busy framebuffers.
- * Driver requirement: i915
- * Functionality: kms_core, hang
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: extended-modeset-hang-%s
  * Description: Test for basic check of KMS ABI with busy framebuffers.
- * Driver requirement: i915
- * Functionality: kms_core, hang
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -79,10 +64,6 @@
 /**
  * SUBTEST: extended-modeset-hang-%s
  * Description: Test for basic check of KMS ABI with busy framebuffers.
- * Driver requirement: i915
- * Functionality: kms_core, hang
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
index d1eb735fa..0a202d037 100644
--- a/tests/intel/kms_ccs.c
+++ b/tests/intel/kms_ccs.c
@@ -28,6 +28,10 @@
  * Description: Test render compression (RC), in which the main surface is
  *              complemented by a color control surface (CCS) that the display
  *              uses to interpret the compressed data.
+ * Driver requirement: i915, xe
+ * Functionality: ccs, tiling
+ * Mega feature: General Display Features
+ * Test category: functionality test
  */
 
 #include "igt.h"
@@ -39,10 +43,6 @@
 /**
  * SUBTEST: %s-%s-%s
  * Description: Test %arg[2] with given %arg[3] modifier
- * Driver requirement: i915, xe
- * Functionality: ccs, tiling
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -84,10 +84,6 @@
 /**
  * SUBTEST: %s-%s-%s
  * Description: Test %arg[2] with %arg[3] modifier
- * Driver requirement: i915, xe
- * Functionality: ccs, tiling
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -133,10 +129,7 @@
 /**
  * SUBTEST: %s-%s-%s
  * Description: Test %arg[2] with %arg[3] modifier
- * Driver requirement: i915, xe
  * Functionality: ccs, rotation, tiling
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c
index 97cb615c5..7baf7d98e 100644
--- a/tests/intel/kms_cdclk.c
+++ b/tests/intel/kms_cdclk.c
@@ -28,6 +28,10 @@
  * TEST: kms cdclk
  * Category: Display
  * Description: Test cdclk features : crawling and squashing
+ * Driver requirement: i915, xe
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
  */
 
 #include "igt.h"
@@ -36,24 +40,12 @@
  * SUBTEST: mode-transition-all-outputs
  * Description: Mode transition (low to high) test to validate cdclk frequency
  *              change by simultaneous modesets on all pipes with valid outputs.
- * Driver requirement: i915, xe
- * Functionality: kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: mode-transition
  * Description: Mode transition (low to high) test to validate cdclk frequency change.
- * Driver requirement: i915, xe
- * Functionality: kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: plane-scaling
  * Description: Plane scaling test to validate cdclk frequency change.
- * Driver requirement: i915, xe
- * Functionality: kms_core, plane, scaling
- * Mega feature: General Display Features
- * Test category: functionality test
  */
 
 IGT_TEST_DESCRIPTION("Test cdclk features : crawling and squashing");
diff --git a/tests/intel/kms_draw_crc.c b/tests/intel/kms_draw_crc.c
index b9d9cd6e4..e3d1c0ba9 100644
--- a/tests/intel/kms_draw_crc.c
+++ b/tests/intel/kms_draw_crc.c
@@ -26,6 +26,10 @@
  * TEST: kms draw crc
  * Category: Display
  * Description: Tests whether the igt_draw library actually works.
+ * Driver requirement: i915, xe
+ * Functionality: kms_core, tiling
+ * Mega feature: General Display Features
+ * Test category: functionality test
  */
 
 #include "i915/gem.h"
@@ -34,18 +38,10 @@
 /**
  * SUBTEST: fill-fb
  * Description: This subtest verifies CRC after filling fb with x-tiling or none.
- * Driver requirement: i915, xe
- * Functionality: kms_core, tiling
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: draw-method-%s
  * Description: Verify that igt draw library works for the %arg[1] method with
  *              different modifiers & DRM formats.
- * Driver requirement: i915, xe
- * Functionality: kms_core, tiling
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -59,9 +55,6 @@
  * Description: Verify that igt draw library works for the %arg[1] method with
  *              different modifiers & DRM formats.
  * Driver requirement: i915
- * Functionality: kms_core, tiling
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
index 0df3613b3..3433e0907 100644
--- a/tests/intel/kms_dsc.c
+++ b/tests/intel/kms_dsc.c
@@ -34,6 +34,10 @@
  * TEST: kms dsc
  * Category: Display
  * Description: Test to validate display stream compression
+ * Driver requirement: i915, xe
+ * Functionality: dsc
+ * Mega feature: VDSC
+ * Test category: functionality test
  */
 
 #include "kms_dsc_helper.h"
@@ -42,10 +46,6 @@
  * SUBTEST: dsc-%s
  * Description: Tests Display Stream Compression functionality if supported by a
  *              connector by forcing %arg[1] on all connectors that support it
- * Driver requirement: i915, xe
- * Functionality: dsc
- * Mega feature: VDSC
- * Test category: functionality test
  *
  * arg[1]:
  *
diff --git a/tests/intel/kms_fbcon_fbt.c b/tests/intel/kms_fbcon_fbt.c
index d437d70f6..e2617a79a 100644
--- a/tests/intel/kms_fbcon_fbt.c
+++ b/tests/intel/kms_fbcon_fbt.c
@@ -29,6 +29,8 @@
  * Category: Display
  * Description: Test the relationship between fbcon and the frontbuffer tracking
  *              infrastructure.
+ * Driver requirement: i915, xe
+ * Test category: functionality test
  */
 
 #include "igt.h"
@@ -43,34 +45,26 @@
  * SUBTEST: fbc
  * Description: Test the relationship between fbcon and the frontbuffer tracking
  *              infrastructure with fbc enabled.
- * Driver requirement: i915, xe
  * Functionality: fbc, fbcon, fbt
  * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbc-suspend
  * Description: Suspend test to validate  the relationship between fbcon and the
  *              frontbuffer tracking infrastructure with fbc enabled.
- * Driver requirement: i915, xe
  * Functionality: fbc, fbcon, fbt, suspend
  * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: psr
  * Description: Test the relationship between fbcon and the frontbuffer tracking
  *              infrastructure with psr enabled.
- * Driver requirement: i915, xe
  * Functionality: fbcon, fbt, psr
  * Mega feature: PSR
- * Test category: functionality test
  *
  * SUBTEST: psr-suspend
  * Description: Suspend test to validate the relationship between fbcon and the
  *              frontbuffer tracking infrastructure with psr enabled.
- * Driver requirement: i915, xe
  * Functionality: fbcon, fbt, psr, suspend
  * Mega feature: PSR
- * Test category: functionality test
  */
 
 IGT_TEST_DESCRIPTION("Test the relationship between fbcon and the frontbuffer "
diff --git a/tests/intel/kms_flip_scaled_crc.c b/tests/intel/kms_flip_scaled_crc.c
index 8f37299ea..7dc07bc83 100644
--- a/tests/intel/kms_flip_scaled_crc.c
+++ b/tests/intel/kms_flip_scaled_crc.c
@@ -26,6 +26,10 @@
  * TEST: kms flip scaled crc
  * Category: Display
  * Description: Test flipping between scaled/nonscaled framebuffers
+ * Driver requirement: i915, xe
+ * Functionality: ccs, scaling, tiling, vblank
+ * Mega feature: General Display Features
+ * Test category: functionality test
  */
 
 #include "igt.h"
@@ -34,114 +38,63 @@
  * SUBTEST: flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling
  * Description: Flip from 64bpp non scaled fb to 32bpp upscaled fb to stress CD
  *              clock programming
- * Driver requirement: i915, xe
- * Functionality: ccs, scaling, tiling, vblank
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling
  * Description: Flip from 64bpp non scaled fb to 32bpp downscaled fb to stress CD
  *              clock programming
- * Driver requirement: i915, xe
- * Functionality: ccs, scaling, tiling, vblank
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: flip-32bpp-linear-to-64bpp-linear-%s
  * Description: Flip from 32bpp non scaled fb to 64bpp %arg[1] fb to stress CD
  *              clock programming
- * Driver requirement: i915, xe
  * Functionality: scaling, vblank
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-%s
  * Description: Flip from 32bpp non scaled fb to 32bpp %arg[1] fb to stress CD
  *              clock programming
- * Driver requirement: i915, xe
- * Functionality: ccs, scaling, tiling, vblank
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: flip-32bpp-4tile-to-64bpp-4tile-%s
  * Description: Flip from 32bpp non scaled fb to 64bpp %arg[1] fb to stress CD
  *              clock programming
- * Driver requirement: i915, xe
  * Functionality: scaling, tiling, vblank
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: flip-32bpp-xtile-to-64bpp-xtile-%s
  * Description: Flip from 32bpp non scaled fb to 64bpp %arg[1] fb to stress CD
  *              clock programming
- * Driver requirement: i915, xe
  * Functionality: scaling, tiling, vblank
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: flip-32bpp-yftile-to-32bpp-yftileccs-%s
  * Description: Flip from 32bpp non scaled fb to 32bpp %arg[1] fb to stress CD
  *              clock programming
- * Driver requirement: i915, xe
- * Functionality: ccs, scaling, tiling, vblank
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: flip-32bpp-yftile-to-64bpp-yftile-%s
  * Description: Flip from 32bpp non scaled fb to 64bpp %arg[1] fb to stress CD
  *              clock programming
- * Driver requirement: i915, xe
  * Functionality: scaling, tiling, vblank
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: flip-32bpp-yftileccs-to-64bpp-yftile-%s
  * Description: Flip from 32bpp non scaled fb to 64bpp %arg[1] fb to stress CD
  *              clock programming
- * Driver requirement: i915, xe
- * Functionality: ccs, scaling, tiling, vblank
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: flip-32bpp-ytile-to-32bpp-ytileccs-%s
  * Description: Flip from 32bpp non scaled fb to 32bpp %arg[1] fb to stress CD
  *              clock programming
- * Driver requirement: i915, xe
- * Functionality: ccs, scaling, tiling, vblank
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-%s
  * Description: Flip from 32bpp non scaled fb to 32bpp %arg[1] fb to stress CD
  *              clock programming
- * Driver requirement: i915, xe
- * Functionality: ccs, scaling, tiling, vblank
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: flip-32bpp-ytile-to-64bpp-ytile-%s
  * Description: Flip from 32bpp non scaled fb to 64bpp %arg[1] fb to stress CD
  *              clock programming
- * Driver requirement: i915, xe
  * Functionality: scaling, tiling, vblank
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: flip-32bpp-ytileccs-to-64bpp-ytile-%s
  * Description: Flip from 32bpp non scaled fb to 64bpp %arg[1] fb to stress CD
  *              clock programming
- * Driver requirement: i915, xe
- * Functionality: ccs, scaling, tiling, vblank
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-%s
  * Description: Flip from 64bpp non scaled fb to 32bpp %arg[1] fb to stress CD
  *              clock programming
- * Driver requirement: i915, xe
- * Functionality: ccs, scaling, tiling, vblank
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -153,42 +106,27 @@
  * SUBTEST: flip-64bpp-4tile-to-%dbpp-4tile-%s
  * Description: Flip from 64bpp non scaled fb to %arg[1]bpp %arg[2] fb to stress
  *              CD clock programming
- * Driver requirement: i915, xe
  * Functionality: scaling, tiling, vblank
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: flip-64bpp-xtile-to-%dbpp-xtile-%s
  * Description: Flip from 64bpp non scaled fb to %arg[1]bpp %arg[2] fb to stress
  *              CD clock programming
- * Driver requirement: i915, xe
  * Functionality: scaling, tiling, vblank
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: flip-64bpp-yftile-to-%dbpp-yftile-%s
  * Description: Flip from 64bpp non scaled fb to %arg[1]bpp %arg[2] fb to stress
  *              CD clock programming
- * Driver requirement: i915, xe
  * Functionality: scaling, tiling, vblank
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: flip-64bpp-ytile-to-%dbpp-ytile-%s
  * Description: Flip from 64bpp non scaled fb to %arg[1]bpp %arg[2] fb to stress
  *              CD clock programming
- * Driver requirement: i915, xe
  * Functionality: scaling, tiling, vblank
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: flip-64bpp-linear-to-%dbpp-linear-%s
  * Description: Flip from 64bpp non scaled fb to %arg[1]bpp %arg[2] fb to stress
  *              CD clock programming
- * Driver requirement: i915, xe
  * Functionality: scaling, tiling, vblank
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1].values: 16, 32
  * arg[2]:
diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index 085adc5b1..abc44bf39 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -28,6 +28,9 @@
  * TEST: kms frontbuffer tracking
  * Category: Display
  * Description: Test the Kernel's frontbuffer tracking mechanism and its related features: FBC, PSR and DRRS
+ * Driver requirement: i915, xe
+ * Mega feature: General Display Features
+ * Test category: functionality test
  */
 
 #include <sys/types.h>
@@ -48,66 +51,39 @@
 /**
  * SUBTEST: basic
  * Description: Do some basic operations regardless of which features are enabled
- * Driver requirement: i915, xe
  * Functionality: fbt
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: plane-fbc-rte
  * Description: Sanity test to enable FBC on a plane.
- * Driver requirement: i915, xe
  * Functionality: fbc
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: drrs-%dp-rte
  * Description: Sanity test to enable DRRS with %arg[1] panels.
- * Driver requirement: i915, xe
  * Functionality: fbt, drrs
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbc-%dp-rte
  * Description: Sanity test to enable FBC with %arg[1] panels.
- * Driver requirement: i915, xe
  * Functionality: fbc, fbt
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: psr-%dp-rte
  * Description: Sanity test to enable PSR with %arg[1] panels.
- * Driver requirement: i915, xe
  * Functionality: fbt, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcdrrs-%dp-rte
  * Description: Sanity test to enable FBC & DRRS with %arg[1] panels.
- * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcpsr-%dp-rte
  * Description: Sanity test to enable FBC & PSR with %arg[1] panels.
- * Driver requirement: i915, xe
  * Functionality: fbc, fbt, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: psrdrrs-%dp-rte
  * Description: Sanity test to enable PSR & DRRS with %arg[1] panels.
- * Driver requirement: i915, xe
  * Functionality: fbt, drrs, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcpsrdrrs-%dp-rte
  * Description: Sanity test to enable FBC, PSR & DRRS with %arg[1] panels.
- * Driver requirement: i915, xe
  * Functionality: fbc, fbt, drrs, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1].values:   1, 2
  */
@@ -115,52 +91,31 @@
 /**
  * SUBTEST: drrs-1p-offscren-pri-%s-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915, xe
  * Functionality: drrs, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbc-1p-offscren-pri-%s-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915, xe
  * Functionality: fbc, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: psr-1p-offscren-pri-%s-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915, xe
  * Functionality: fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcdrrs-1p-offscren-pri-%s-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcpsr-1p-offscren-pri-%s-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915, xe
  * Functionality: fbc, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: psrdrrs-1p-offscren-pri-%s-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915, xe
  * Functionality: drrs, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcpsrdrrs-1p-offscren-pri-%s-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -179,50 +134,36 @@
  * Description: Draw a set of rectangles on the screen using the provided method
  * Driver requirement: i915
  * Functionality: drrs, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbc-1p-offscren-pri-%s-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  * Driver requirement: i915
  * Functionality: fbc, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: psr-1p-offscren-pri-%s-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  * Driver requirement: i915
  * Functionality: fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcdrrs-1p-offscren-pri-%s-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  * Driver requirement: i915
  * Functionality: drrs, fbc, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcpsr-1p-offscren-pri-%s-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  * Driver requirement: i915
  * Functionality: fbc, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: psrdrrs-1p-offscren-pri-%s-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  * Driver requirement: i915
  * Functionality: drrs, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcpsrdrrs-1p-offscren-pri-%s-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  * Driver requirement: i915
  * Functionality: drrs, fbc, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -241,50 +182,36 @@
  * Description: Draw a set of rectangles on the screen using the provided method
  * Driver requirement: i915
  * Functionality: drrs, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbc-%dp-primscrn-%s-indfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  * Driver requirement: i915
  * Functionality: fbc, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: psr-%dp-primscrn-%s-indfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  * Driver requirement: i915
  * Functionality: fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcdrrs-%dp-primscrn-%s-indfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  * Driver requirement: i915
  * Functionality: drrs, fbc, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcpsr-%dp-primscrn-%s-indfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  * Driver requirement: i915
  * Functionality: fbc, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: psrdrrs-%dp-primscrn-%s-indfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  * Driver requirement: i915
  * Functionality: drrs, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcpsrdrrs-%dp-primscrn-%s-indfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  * Driver requirement: i915
  * Functionality: drrs, fbc, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1].values:   1, 2
  *
@@ -304,52 +231,31 @@
 /**
  * SUBTEST: drrs-%dp-primscrn-%s-indfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915, xe
  * Functionality: drrs, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbc-%dp-primscrn-%s-indfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915, xe
  * Functionality: fbc, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: psr-%dp-primscrn-%s-indfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915, xe
  * Functionality: fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcdrrs-%dp-primscrn-%s-indfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcpsr-%dp-primscrn-%s-indfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915, xe
  * Functionality: fbc, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: psrdrrs-%dp-primscrn-%s-indfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915, xe
  * Functionality: drrs, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcpsrdrrs-%dp-primscrn-%s-indfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1].values:   1, 2
  *
@@ -369,52 +275,31 @@
 /**
  * SUBTEST: drrs-%dp-primscrn-pri-shrfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915, xe
  * Functionality: drrs, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbc-%dp-primscrn-pri-shrfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915, xe
  * Functionality: fbc, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: psr-%dp-primscrn-pri-shrfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915, xe
  * Functionality: fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcdrrs-%dp-primscrn-pri-shrfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcpsr-%dp-primscrn-pri-shrfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915, xe
  * Functionality: fbc, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: psrdrrs-%dp-primscrn-pri-shrfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915, xe
  * Functionality: drrs, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcpsrdrrs-%dp-primscrn-pri-shrfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1].values:   1, 2
  *
@@ -430,50 +315,36 @@
  * Description: Draw a set of rectangles on the screen using the provided method
  * Driver requirement: i915
  * Functionality: drrs, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbc-%dp-primscrn-pri-shrfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  * Driver requirement: i915
  * Functionality: fbc, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: psr-%dp-primscrn-pri-shrfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  * Driver requirement: i915
  * Functionality: fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcdrrs-%dp-primscrn-pri-shrfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  * Driver requirement: i915
  * Functionality: drrs, fbc, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcpsr-%dp-primscrn-pri-shrfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  * Driver requirement: i915
  * Functionality: fbc, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: psrdrrs-%dp-primscrn-pri-shrfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  * Driver requirement: i915
  * Functionality: drrs, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcpsrdrrs-%dp-primscrn-pri-shrfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  * Driver requirement: i915
  * Functionality: drrs, fbc, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1].values:   1, 2
  *
@@ -487,52 +358,31 @@
 /**
  * SUBTEST: drrs-2p-scndscrn-%s-indfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915, xe
  * Functionality: drrs, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbc-2p-scndscrn-%s-indfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915, xe
  * Functionality: fbc, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: psr-2p-scndscrn-%s-indfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915, xe
  * Functionality: fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcdrrs-2p-scndscrn-%s-indfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcpsr-2p-scndscrn-%s-indfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915, xe
  * Functionality: fbc, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: psrdrrs-2p-scndscrn-%s-indfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915, xe
  * Functionality: drrs, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcpsrdrrs-2p-scndscrn-%s-indfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -552,50 +402,36 @@
  * Description: Draw a set of rectangles on the screen using the provided method
  * Driver requirement: i915
  * Functionality: drrs, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbc-2p-scndscrn-%s-indfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  * Driver requirement: i915
  * Functionality: fbc, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: psr-2p-scndscrn-%s-indfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  * Driver requirement: i915
  * Functionality: fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcdrrs-2p-scndscrn-%s-indfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  * Driver requirement: i915
  * Functionality: drrs, fbc, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcpsr-2p-scndscrn-%s-indfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  * Driver requirement: i915
  * Functionality: fbc, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: psrdrrs-2p-scndscrn-%s-indfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  * Driver requirement: i915
  * Functionality: drrs, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcpsrdrrs-2p-scndscrn-%s-indfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  * Driver requirement: i915
  * Functionality: drrs, fbc, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -613,52 +449,31 @@
 /**
  * SUBTEST: drrs-2p-scndscrn-pri-shrfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915, xe
  * Functionality: drrs, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbc-2p-scndscrn-pri-shrfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915, xe
  * Functionality: fbc, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: psr-2p-scndscrn-pri-shrfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915, xe
  * Functionality: fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcdrrs-2p-scndscrn-pri-shrfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcpsr-2p-scndscrn-pri-shrfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915, xe
  * Functionality: fbc, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: psrdrrs-2p-scndscrn-pri-shrfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915, xe
  * Functionality: drrs, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcpsrdrrs-2p-scndscrn-pri-shrfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -672,50 +487,36 @@
  * Description: Draw a set of rectangles on the screen using the provided method
  * Driver requirement: i915
  * Functionality: drrs, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbc-2p-scndscrn-pri-shrfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  * Driver requirement: i915
  * Functionality: fbc, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: psr-2p-scndscrn-pri-shrfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  * Driver requirement: i915
  * Functionality: fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcdrrs-2p-scndscrn-pri-shrfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  * Driver requirement: i915
  * Functionality: drrs, fbc, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcpsr-2p-scndscrn-pri-shrfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  * Driver requirement: i915
  * Functionality: fbc, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: psrdrrs-2p-scndscrn-pri-shrfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  * Driver requirement: i915
  * Functionality: drrs, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcpsrdrrs-2p-scndscrn-pri-shrfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  * Driver requirement: i915
  * Functionality: drrs, fbc, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -727,52 +528,31 @@
 /**
  * SUBTEST: drrs-%dp-pri-indfb-multidraw
  * Description: Draw a set of rectangles on the screen using alternated drawing methods
- * Driver requirement: i915, xe
  * Functionality: drrs, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbc-%dp-pri-indfb-multidraw
  * Description: Draw a set of rectangles on the screen using alternated drawing methods
- * Driver requirement: i915, xe
  * Functionality: fbc, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: psr-%dp-pri-indfb-multidraw
  * Description: Draw a set of rectangles on the screen using alternated drawing methods
- * Driver requirement: i915, xe
  * Functionality: fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcdrrs-%dp-pri-indfb-multidraw
  * Description: Draw a set of rectangles on the screen using alternated drawing methods
- * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcpsr-%dp-pri-indfb-multidraw
  * Description: Draw a set of rectangles on the screen using alternated drawing methods
- * Driver requirement: i915, xe
  * Functionality: fbc, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: psrdrrs-%dp-pri-indfb-multidraw
  * Description: Draw a set of rectangles on the screen using alternated drawing methods
- * Driver requirement: i915, xe
  * Functionality: drrs, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcpsrdrrs-%dp-pri-indfb-multidraw
  * Description: Draw a set of rectangles on the screen using alternated drawing methods
- * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1].values:   1, 2
  */
@@ -780,52 +560,31 @@
 /**
  * SUBTEST: drrs-%s-draw-%s
  * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
- * Driver requirement: i915, xe
  * Functionality: drrs, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbc-%s-draw-%s
  * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
- * Driver requirement: i915, xe
  * Functionality: fbc, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: psr-%s-draw-%s
  * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
- * Driver requirement: i915, xe
  * Functionality: fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcdrrs-%s-draw-%s
  * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
- * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcpsr-%s-draw-%s
  * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
- * Driver requirement: i915, xe
  * Functionality: fbc, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: psrdrrs-%s-draw-%s
  * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
- * Driver requirement: i915, xe
  * Functionality: drrs, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcpsrdrrs-%s-draw-%s
  * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
- * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -844,50 +603,36 @@
  * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
  * Driver requirement: i915
  * Functionality: drrs, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbc-%s-draw-%s
  * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
  * Driver requirement: i915
  * Functionality: fbc, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: psr-%s-draw-%s
  * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
  * Driver requirement: i915
  * Functionality: fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcdrrs-%s-draw-%s
  * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
  * Driver requirement: i915
  * Functionality: drrs, fbc, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcpsr-%s-draw-%s
  * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
  * Driver requirement: i915
  * Functionality: fbc, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: psrdrrs-%s-draw-%s
  * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
  * Driver requirement: i915
  * Functionality: drrs, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcpsrdrrs-%s-draw-%s
  * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
  * Driver requirement: i915
  * Functionality: drrs, fbc, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -904,96 +649,57 @@
 /**
  * SUBTEST: drrs-slowdraw
  * Description: Sleep a little bit between drawing operations with DRRS
- * Driver requirement: i915, xe
  * Functionality: drrs, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: psr-slowdraw
  * Description: Sleep a little bit between drawing operations with PSR
- * Driver requirement: i915, xe
  * Functionality: fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcdrrs-slowdraw
  * Description: Sleep a little bit between drawing operations with FBC & DRRS
- * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcpsr-slowdraw
  * Description: Sleep a little bit between drawing operations with FBC & PSR
- * Driver requirement: i915, xe
  * Functionality: fbc, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: psrdrrs-slowdraw
  * Description: Sleep a little bit between drawing operations with PSR & DRRS
- * Driver requirement: i915, xe
  * Functionality: drrs, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcpsrdrrs-slowdraw
  * Description: Sleep a little bit between drawing operations with FBC, PSR & DRRS
- * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  */
 
 /**
  * SUBTEST: drrs-%dp-primscrn-%s-%sflip-blt
  * Description: Just exercise page flips with the patterns we have
- * Driver requirement: i915, xe
  * Functionality: drrs, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbc-%dp-primscrn-%s-%sflip-blt
  * Description: Just exercise page flips with the patterns we have
- * Driver requirement: i915, xe
  * Functionality: fbc, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: psr-%dp-primscrn-%s-%sflip-blt
  * Description: Just exercise page flips with the patterns we have
- * Driver requirement: i915, xe
  * Functionality: fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcdrrs-%dp-primscrn-%s-%sflip-blt
  * Description: Just exercise page flips with the patterns we have
- * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcpsr-%dp-primscrn-%s-%sflip-blt
  * Description: Just exercise page flips with the patterns we have
- * Driver requirement: i915, xe
  * Functionality: fbc, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: psrdrrs-%dp-primscrn-%s-%sflip-blt
  * Description: Just exercise page flips with the patterns we have
- * Driver requirement: i915, xe
  * Functionality: drrs, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcpsrdrrs-%dp-primscrn-%s-%sflip-blt
  * Description: Just exercise page flips with the patterns we have
- * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1].values:   1, 2
  *
@@ -1012,52 +718,31 @@
 /**
  * SUBTEST: drrs-2p-scndscrn-%s-%sflip-blt
  * Description: Just exercise page flips with the patterns we have
- * Driver requirement: i915, xe
  * Functionality: drrs, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbc-2p-scndscrn-%s-%sflip-blt
  * Description: Just exercise page flips with the patterns we have
- * Driver requirement: i915, xe
  * Functionality: fbc, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: psr-2p-scndscrn-%s-%sflip-blt
  * Description: Just exercise page flips with the patterns we have
- * Driver requirement: i915, xe
  * Functionality: fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcdrrs-2p-scndscrn-%s-%sflip-blt
  * Description: Just exercise page flips with the patterns we have
- * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcpsr-2p-scndscrn-%s-%sflip-blt
  * Description: Just exercise page flips with the patterns we have
- * Driver requirement: i915, xe
  * Functionality: fbc, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: psrdrrs-2p-scndscrn-%s-%sflip-blt
  * Description: Just exercise page flips with the patterns we have
- * Driver requirement: i915, xe
  * Functionality: drrs, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcpsrdrrs-2p-scndscrn-%s-%sflip-blt
  * Description: Just exercise page flips with the patterns we have
- * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -1074,31 +759,19 @@
 /**
  * SUBTEST: fbc-%dp-%s-fliptrack-mmap-gtt
  * Description: Check if the hardware tracking works after page flips
- * Driver requirement: i915, xe
  * Functionality: fbc, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcdrrs-%dp-%s-fliptrack-mmap-gtt
  * Description: Check if the hardware tracking works after page flips
- * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcpsr-%dp-%s-fliptrack-mmap-gtt
  * Description: Check if the hardware tracking works after page flips
- * Driver requirement: i915, xe
  * Functionality: fbc, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcpsrdrrs-%dp-%s-fliptrack-mmap-gtt
  * Description: Check if the hardware tracking works after page flips
- * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1].values:   1, 2
  *
@@ -1111,52 +784,31 @@
 /**
  * SUBTEST: drrs-%dp-primscrn-%s-indfb-move
  * Description: Just move the %arg[2] around
- * Driver requirement: i915, xe
  * Functionality: drrs, fbt
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbc-%dp-primscrn-%s-indfb-move
  * Description: Just move the %arg[2] around
- * Driver requirement: i915, xe
  * Functionality: fbc, fbt
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: psr-%dp-primscrn-%s-indfb-move
  * Description: Just move the %arg[2] around
- * Driver requirement: i915, xe
  * Functionality: fbt, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcdrrs-%dp-primscrn-%s-indfb-move
  * Description: Just move the %arg[2] around
- * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcpsr-%dp-primscrn-%s-indfb-move
  * Description: Just move the %arg[2] around
- * Driver requirement: i915, xe
  * Functionality: fbc, fbt, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: psrdrrs-%dp-primscrn-%s-indfb-move
  * Description: Just move the %arg[2] around
- * Driver requirement: i915, xe
  * Functionality: drrs, fbt, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcpsrdrrs-%dp-primscrn-%s-indfb-move
  * Description: Just move the %arg[2] around
- * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1].values:   1, 2
  *
@@ -1169,52 +821,31 @@
 /**
  * SUBTEST: drrs-2p-scndscrn-%s-indfb-move
  * Description: Just move the %arg[1] around
- * Driver requirement: i915, xe
  * Functionality: drrs, fbt
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbc-2p-scndscrn-%s-indfb-move
  * Description: Just move the %arg[1] around
- * Driver requirement: i915, xe
  * Functionality: fbc, fbt
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: psr-2p-scndscrn-%s-indfb-move
  * Description: Just move the %arg[1] around
- * Driver requirement: i915, xe
  * Functionality: fbt, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcdrrs-2p-scndscrn-%s-indfb-move
  * Description: Just move the %arg[1] around
- * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcpsr-2p-scndscrn-%s-indfb-move
  * Description: Just move the %arg[1] around
- * Driver requirement: i915, xe
  * Functionality: fbc, fbt, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: psrdrrs-2p-scndscrn-%s-indfb-move
  * Description: Just move the %arg[1] around
- * Driver requirement: i915, xe
  * Functionality: drrs, fbt, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcpsrdrrs-2p-scndscrn-%s-indfb-move
  * Description: Just move the %arg[1] around
- * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -1225,52 +856,31 @@
 /**
  * SUBTEST: drrs-%dp-primscrn-%s-indfb-onoff
  * Description: Just enable and disable the %arg[2] a few times
- * Driver requirement: i915, xe
  * Functionality: drrs, fbt
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbc-%dp-primscrn-%s-indfb-onoff
  * Description: Just enable and disable the %arg[2] a few times
- * Driver requirement: i915, xe
  * Functionality: fbc, fbt
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: psr-%dp-primscrn-%s-indfb-onoff
  * Description: Just enable and disable the %arg[2] a few times
- * Driver requirement: i915, xe
  * Functionality: fbt, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcdrrs-%dp-primscrn-%s-indfb-onoff
  * Description: Just enable and disable the %arg[2] a few times
- * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcpsr-%dp-primscrn-%s-indfb-onoff
  * Description: Just enable and disable the %arg[2] a few times
- * Driver requirement: i915, xe
  * Functionality: fbc, fbt, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: psrdrrs-%dp-primscrn-%s-indfb-onoff
  * Description: Just enable and disable the %arg[2] a few times
- * Driver requirement: i915, xe
  * Functionality: drrs, fbt, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcpsrdrrs-%dp-primscrn-%s-indfb-onoff
  * Description: Just enable and disable the %arg[2] a few times
- * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1].values:   1, 2
  *
@@ -1283,52 +893,31 @@
 /**
  * SUBTEST: drrs-2p-scndscrn-%s-indfb-onoff
  * Description: Just enable and disable the %arg[1] a few times
- * Driver requirement: i915, xe
  * Functionality: drrs, fbt
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbc-2p-scndscrn-%s-indfb-onoff
  * Description: Just enable and disable the %arg[1] a few times
- * Driver requirement: i915, xe
  * Functionality: fbc, fbt
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: psr-2p-scndscrn-%s-indfb-onoff
  * Description: Just enable and disable the %arg[1] a few times
- * Driver requirement: i915, xe
  * Functionality: fbt, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcdrrs-2p-scndscrn-%s-indfb-onoff
  * Description: Just enable and disable the %arg[1] a few times
- * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcpsr-2p-scndscrn-%s-indfb-onoff
  * Description: Just enable and disable the %arg[1] a few times
- * Driver requirement: i915, xe
  * Functionality: fbc, fbt, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: psrdrrs-2p-scndscrn-%s-indfb-onoff
  * Description: Just enable and disable the %arg[1] a few times
- * Driver requirement: i915, xe
  * Functionality: drrs, fbt, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcpsrdrrs-2p-scndscrn-%s-indfb-onoff
  * Description: Just enable and disable the %arg[1] a few times
- * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -1339,101 +928,59 @@
 /**
  * SUBTEST: drrs-%dp-primscrn-spr-indfb-fullscreen
  * Description: Put a fullscreen plane covering the whole screen
- * Driver requirement: i915, xe
  * Functionality: drrs, fbt
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbc-%dp-primscrn-spr-indfb-fullscreen
  * Description: Put a fullscreen plane covering the whole screen
- * Driver requirement: i915, xe
  * Functionality: fbc, fbt
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: psr-%dp-primscrn-spr-indfb-fullscreen
  * Description: Put a fullscreen plane covering the whole screen
- * Driver requirement: i915, xe
  * Functionality: fbt, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcdrrs-%dp-primscrn-spr-indfb-fullscreen
  * Description: Put a fullscreen plane covering the whole screen
- * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcpsr-%dp-primscrn-spr-indfb-fullscreen
  * Description: Put a fullscreen plane covering the whole screen
- * Driver requirement: i915, xe
  * Functionality: fbc, fbt, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: psrdrrs-%dp-primscrn-spr-indfb-fullscreen
  * Description: Put a fullscreen plane covering the whole screen
- * Driver requirement: i915, xe
  * Functionality: drrs, fbt, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcpsrdrrs-%dp-primscrn-spr-indfb-fullscreen
  * Description: Put a fullscreen plane covering the whole screen
- * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: drrs-2p-scndscrn-spr-indfb-fullscreen
  * Description: Put a fullscreen plane covering the whole screen
- * Driver requirement: i915, xe
  * Functionality: drrs, fbt
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbc-2p-scndscrn-spr-indfb-fullscreen
  * Description: Put a fullscreen plane covering the whole screen
- * Driver requirement: i915, xe
  * Functionality: fbc, fbt
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: psr-2p-scndscrn-spr-indfb-fullscreen
  * Description: Put a fullscreen plane covering the whole screen
- * Driver requirement: i915, xe
  * Functionality: fbt, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcdrrs-2p-scndscrn-spr-indfb-fullscreen
  * Description: Put a fullscreen plane covering the whole screen
- * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcpsr-2p-scndscrn-spr-indfb-fullscreen
  * Description: Put a fullscreen plane covering the whole screen
- * Driver requirement: i915, xe
  * Functionality: fbc, fbt, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: psrdrrs-2p-scndscrn-spr-indfb-fullscreen
  * Description: Put a fullscreen plane covering the whole screen
- * Driver requirement: i915, xe
  * Functionality: drrs, fbt, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcpsrdrrs-2p-scndscrn-spr-indfb-fullscreen
  * Description: Put a fullscreen plane covering the whole screen
- * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1].values:   1, 2
  */
@@ -1441,52 +988,31 @@
 /**
  * SUBTEST: drrs-%s-scaledprimary
  * Description: Try different primary plane scaling strategies
- * Driver requirement: i915, xe
  * Functionality: drrs, fbt, scaling
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbc-%s-scaledprimary
  * Description: Try different primary plane scaling strategies
- * Driver requirement: i915, xe
  * Functionality: fbc, fbt, scaling
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: psr-%s-scaledprimary
  * Description: Try different primary plane scaling strategies
- * Driver requirement: i915, xe
  * Functionality: fbt, psr, scaling
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcdrrs-%s-scaledprimary
  * Description: Try different primary plane scaling strategies
- * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt, scaling
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcpsr-%s-scaledprimary
  * Description: Try different primary plane scaling strategies
- * Driver requirement: i915, xe
  * Functionality: fbc, fbt, psr, scaling
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: psrdrrs-%s-scaledprimary
  * Description: Try different primary plane scaling strategies
- * Driver requirement: i915, xe
  * Functionality: drrs, fbt, psr, scaling
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcpsrdrrs-%s-scaledprimary
  * Description: Try different primary plane scaling strategies
- * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt, psr, scaling
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -1497,102 +1023,61 @@
 /**
  * SUBTEST: drrs-modesetfrombusy
  * Description: Modeset from a busy buffer to a non-busy buffer with DRRS
- * Driver requirement: i915, xe
  * Functionality: drrs, fbt, scaling
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbc-modesetfrombusy
  * Description: Modeset from a busy buffer to a non-busy buffer with FBC
- * Driver requirement: i915, xe
  * Functionality: fbc, fbt, scaling
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: psr-modesetfrombusy
  * Description: Modeset from a busy buffer to a non-busy buffer with PSR
- * Driver requirement: i915, xe
  * Functionality: fbt, psr, scaling
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcdrrs-modesetfrombusy
  * Description: Modeset from a busy buffer to a non-busy buffer with FBC & DRRS
- * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt, scaling
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcpsr-modesetfrombusy
  * Description: Modeset from a busy buffer to a non-busy buffer with FBC & PSR
- * Driver requirement: i915, xe
  * Functionality: fbc, fbt, psr, scaling
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: psrdrrs-modesetfrombusy
  * Description: Modeset from a busy buffer to a non-busy buffer with PSR & DRRS
- * Driver requirement: i915, xe
  * Functionality: drrs, fbt, psr, scaling
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcpsrdrrs-modesetfrombusy
  * Description: Modeset from a busy buffer to a non-busy buffer with FBC, PSR & DRRS
- * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt, psr, scaling
- * Mega feature: General Display Features
  */
 
 /**
  * SUBTEST: drrs-suspend
  * Description: Make sure suspend/resume keeps us on the same state of DRRS
- * Driver requirement: i915, xe
  * Functionality: drrs, fbt, suspend
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbc-suspend
  * Description: Make sure suspend/resume keeps us on the same state of FBC
- * Driver requirement: i915, xe
  * Functionality: fbc, fbt, suspend
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: psr-suspend
  * Description: Make sure suspend/resume keeps us on the same state of PSR
- * Driver requirement: i915, xe
  * Functionality: fbt, psr, suspend
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcdrrs-suspend
  * Description: Make sure suspend/resume keeps us on the same state of FBC & DRRS
- * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt, suspend
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcpsr-suspend
  * Description: Make sure suspend/resume keeps us on the same state of FBC & PSR
- * Driver requirement: i915, xe
  * Functionality: fbc, fbt, psr, suspend
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: psrdrrs-suspend
  * Description: Make sure suspend/resume keeps us on the same state of PSR & DRRS
- * Driver requirement: i915, xe
  * Functionality: drrs, fbt, psr, suspend
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcpsrdrrs-suspend
  * Description: Make sure suspend/resume keeps us on the same state of FBC, PSR & DRRS
- * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt, psr, suspend
- * Mega feature: General Display Features
- * Test category: functionality test
  */
 
 /**
@@ -1600,114 +1085,76 @@
  * Description: Test drawing as far from the fence start as possible
  * Driver requirement: i915
  * Functionality: drrs, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbc-farfromfence-mmap-gtt
  * Description: Test drawing as far from the fence start as possible
  * Driver requirement: i915
  * Functionality: fbc, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: psr-farfromfence-mmap-gtt
  * Description: Test drawing as far from the fence start as possible
  * Driver requirement: i915
  * Functionality: fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcdrrs-farfromfence-mmap-gtt
  * Description: Test drawing as far from the fence start as possible
  * Driver requirement: i915
  * Functionality: drrs, fbc, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcpsr-farfromfence-mmap-gtt
  * Description: Test drawing as far from the fence start as possible
  * Driver requirement: i915
  * Functionality: fbc, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: psrdrrs-farfromfence-mmap-gtt
  * Description: Test drawing as far from the fence start as possible
  * Driver requirement: i915
  * Functionality: drrs, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcpsrdrrs-farfromfence-mmap-gtt
  * Description: Test drawing as far from the fence start as possible
  * Driver requirement: i915
  * Functionality: drrs, fbc, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  */
 
 /**
  * SUBTEST: fbc-stridechange
  * Description: Change the frontbuffer stride by doing a modeset
- * Driver requirement: i915, xe
  * Functionality: fbc, fbt
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcdrrs-stridechange
  * Description: Change the frontbuffer stride by doing a modeset
- * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcpsr-stridechange
  * Description: Change the frontbuffer stride by doing a modeset
- * Driver requirement: i915, xe
  * Functionality: fbc, fbt, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcpsrdrrs-stridechange
  * Description: Change the frontbuffer stride by doing a modeset
- * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt, psr
- * Mega feature: General Display Features
- * Test category: functionality test
  */
 
 /**
  * SUBTEST: fbc-tiling-%s
  * Description: Test %arg[1] formats, if the tiling format supports FBC do the
  *              basic drawing test, else set the mode & test if FBC is disabled
- * Driver requirement: i915, xe
  * Functionality: fbc, fbt, tiling
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcdrrs-tiling-%s
  * Description: Test %arg[1] formats, if the tiling format supports FBC do the
  *              basic drawing test, else set the mode & test if FBC is disabled
- * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt, tiling
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcpsr-tiling-%s
  * Description: Test %arg[1] formats, if the tiling format supports FBC do the
  *              basic drawing test, else set the mode & test if FBC is disabled
- * Driver requirement: i915, xe
  * Functionality: fbc, fbt, psr, tiling
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fbcpsrdrrs-tiling-%s
  * Description: Test %arg[1] formats, if the tiling format supports FBC do the
  *              basic drawing test, else set the mode & test if FBC is disabled
- * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt, psr, tiling
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
diff --git a/tests/intel/kms_legacy_colorkey.c b/tests/intel/kms_legacy_colorkey.c
index 69539f558..27ec64051 100644
--- a/tests/intel/kms_legacy_colorkey.c
+++ b/tests/intel/kms_legacy_colorkey.c
@@ -25,6 +25,10 @@
  * TEST: kms legacy colorkey
  * Category: Display
  * Description: Test to check the legacy set colorkey ioctl on sprite planes.
+ * Driver requirement: i915
+ * Functionality: plane, xorg_xv
+ * Mega feature: General Display Features
+ * Test category: functionality test
  */
 
 #include "igt.h"
@@ -33,17 +37,9 @@
 /**
  * SUBTEST: basic
  * Description: Check that the legacy set colorkey ioctl only works on sprite planes.
- * Driver requirement: i915
- * Functionality: plane, xorg_xv
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: invalid-plane
  * Description: Check invalid plane id's, zero and outrange
- * Driver requirement: i915
- * Functionality: plane, xorg_xv
- * Mega feature: General Display Features
- * Test category: functionality test
  */
 
 IGT_TEST_DESCRIPTION("Check that the legacy set colorkey ioctl only works on sprite planes.");
diff --git a/tests/intel/kms_pipe_b_c_ivb.c b/tests/intel/kms_pipe_b_c_ivb.c
index c1a1e6610..73277e970 100644
--- a/tests/intel/kms_pipe_b_c_ivb.c
+++ b/tests/intel/kms_pipe_b_c_ivb.c
@@ -29,6 +29,10 @@
  * Category: Display
  * Description: Exercise the FDI lane bifurcation code for IVB in the kernel by
  *              setting different combinations of modes for pipes B and C.
+ * Driver requirement: i915
+ * Functionality: kms_core, obsolete
+ * Mega feature: General Display Features
+ * Test category: functionality test
  */
 
 #include "igt.h"
@@ -37,43 +41,23 @@
  * SUBTEST: disable-pipe-B-enable-pipe-C
  * Description: Tests pipe-B and pipe-C interactions in IVB by disabling pipe-B
  *              and then setting mode on pipe-C.
- * Driver requirement: i915
- * Functionality: kms_core, obsolete
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: enable-pipe-C-while-B-has-3-lanes
  * Description: Tests pipe-B and pipe-C interactions in IVB by enabling pipe-C
  *              while pipe-B has 3-lanes
- * Driver requirement: i915
- * Functionality: kms_core, obsolete
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: from-pipe-C-to-B-with-3-lanes
  * Description: Tests pipe-B and pipe-C interactions in IVB by enabling pipe-B
  *              with 3 lanes from pipe-C.
- * Driver requirement: i915
- * Functionality: kms_core, obsolete
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: pipe-B-double-modeset-then-modeset-pipe-C
  * Description: Tests pipe-B and pipe-C interactions in IVB by enabling two
  *              different modes on pipe-B and then a single mode on pipe-C.
- * Driver requirement: i915
- * Functionality: kms_core, obsolete
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: pipe-B-dpms-off-modeset-pipe-C
  * Description: Tests pipe-B and pipe-C interactions in IVB by enabling pipe-B
  *              with mode that requires 3 lanes and then enabling pipe-c with
  *              dpms off/on pipe-B.
- * Driver requirement: i915
- * Functionality: kms_core, obsolete
- * Mega feature: General Display Features
- * Test category: functionality test
  */
 
 IGT_TEST_DESCRIPTION(
diff --git a/tests/intel/kms_pm_backlight.c b/tests/intel/kms_pm_backlight.c
index 68f4dc3d1..5b4c397bb 100644
--- a/tests/intel/kms_pm_backlight.c
+++ b/tests/intel/kms_pm_backlight.c
@@ -29,6 +29,10 @@
  * TEST: kms pm backlight
  * Category: Display
  * Description: Basic backlight sysfs test
+ * Driver requirement: i915, xe
+ * Functionality: backlight
+ * Mega feature: Display Power
+ * Test category: functionality test
  */
 
 #include "igt.h"
@@ -46,38 +50,20 @@
 /**
  * SUBTEST: bad-brightness
  * Description: Test the bad brightness.
- * Driver requirement: i915, xe
- * Functionality: backlight
- * Mega feature: Display Power
- * Test category: functionality test
  *
  * SUBTEST: basic-brightness
  * Description: Test the basic brightness.
- * Driver requirement: i915, xe
- * Functionality: backlight
- * Mega feature: Display Power
- * Test category: functionality test
  *
  * SUBTEST: fade
  * Description: Test basic fade.
- * Driver requirement: i915, xe
- * Functionality: backlight
- * Mega feature: Display Power
- * Test category: functionality test
  *
  * SUBTEST: fade-with-dpms
  * Description: Test the fade with DPMS.
- * Driver requirement: i915, xe
  * Functionality: dpms, backlight
- * Mega feature: Display Power
- * Test category: functionality test
  *
  * SUBTEST: fade-with-suspend
  * Description: Test the fade with suspend.
- * Driver requirement: i915, xe
  * Functionality: backlight, suspend
- * Mega feature: Display Power
- * Test category: functionality test
  */
 
 struct context {
diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 1c33206fc..f11d6d29a 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -26,6 +26,10 @@
  * TEST: kms pm dc
  * Category: Display
  * Description: Tests to validate display power DC states.
+ * Driver requirement: i915, xe
+ * Functionality: dpms, pm_dc
+ * Mega feature: Display Power
+ * Test category: functionality test
  */
 
 #include <errno.h>
@@ -48,55 +52,30 @@
  * SUBTEST: dc3co-vpb-simulation
  * Description: Make sure that system enters DC3CO when PSR2 is active and system
  *              is in SLEEP state
- * Driver requirement: i915, xe
  * Functionality: dc3co, pm_dc, psr2
- * Mega feature: Display Power
- * Test category: functionality test
  *
  * SUBTEST: dc5-dpms
  * Description: Validate display engine entry to DC5 state while all connectors's
  *              DPMS property set to OFF
- * Driver requirement: i915, xe
- * Functionality: dpms, pm_dc
- * Mega feature: Display Power
- * Test category: functionality test
  *
  * SUBTEST: dc5-dpms-negative
  * Description: Validate negative scenario of DC5 display engine entry to DC5 state
  *              while all connectors's DPMS property set to ON
- * Driver requirement: i915, xe
- * Functionality: dpms, pm_dc
- * Mega feature: Display Power
- * Test category: functionality test
  *
  * SUBTEST: dc5-psr
  * Description: This test validates display engine entry to DC5 state while PSR is active
- * Driver requirement: i915, xe
  * Functionality: pm_dc, psr
- * Mega feature: Display Power
- * Test category: functionality test
  *
  * SUBTEST: dc6-dpms
  * Description: Validate display engine entry to DC6 state while all connectors's
  *              DPMS property set to OFF
- * Driver requirement: i915, xe
- * Functionality: dpms, pm_dc
- * Mega feature: Display Power
- * Test category: functionality test
  *
  * SUBTEST: dc6-psr
  * Description: This test validates display engine entry to DC6 state while PSR is active
- * Driver requirement: i915, xe
  * Functionality: pm_dc, psr
- * Mega feature: Display Power
- * Test category: functionality test
  *
  * SUBTEST: dc9-dpms
  * Description: This test validates display engine entry to DC9 state
- * Driver requirement: i915, xe
- * Functionality: dpms, pm_dc
- * Mega feature: Display Power
- * Test category: functionality test
  */
 
 /* DC State Flags */
diff --git a/tests/intel/kms_pm_lpsp.c b/tests/intel/kms_pm_lpsp.c
index 4ac99faf7..30158f673 100644
--- a/tests/intel/kms_pm_lpsp.c
+++ b/tests/intel/kms_pm_lpsp.c
@@ -26,8 +26,11 @@
 
 /**
  * TEST: kms pm lpsp
- * Description: These tests validates display Low Power Single Pipe configurations
  * Category: Display
+ * Description: These tests validates display Low Power Single Pipe configurations
+ * Functionality: pm_lpsp
+ * Mega feature: Display Power
+ * Test category: functionality test
  */
 
 #include "igt.h"
@@ -43,16 +46,10 @@
  * SUBTEST: kms-lpsp
  * Description: This test validates lpsp on all connected outputs on low power pipes
  * Driver requirement: i915, xe
- * Functionality: pm_lpsp
- * Mega feature: Display Power
- * Test category: functionality test
  *
  * SUBTEST: screens-disabled
  * Description: This test validates lpsp while all crtc are disabled
  * Driver requirement: i915
- * Functionality: pm_lpsp
- * Mega feature: Display Power
- * Test category: functionality test
  */
 
 #define MAX_SINK_LPSP_INFO_BUF_LEN	4096
diff --git a/tests/intel/kms_pm_rpm.c b/tests/intel/kms_pm_rpm.c
index 14f34d904..97c886a6e 100644
--- a/tests/intel/kms_pm_rpm.c
+++ b/tests/intel/kms_pm_rpm.c
@@ -76,9 +76,11 @@
  *
  * SUBTEST: fences
  * Description: Sanity test for drm fences.
+ * Driver requirement: i915
  *
  * SUBTEST: fences-dpms
  * Description: Sanity test for drm fences with dpms.
+ * Driver requirement: i915
  * Functionality: dpms, pm_rpm
  *
  * SUBTEST: i2c
@@ -121,9 +123,11 @@
  *
  * SUBTEST: pm-caching
  * Description: Test to change different cache levels & check for rpm
+ * Driver requirement: i915
  *
  * SUBTEST: pm-tiling
  * Description: Test to change different tiling methods & check for rpm
+ * Driver requirement: i915
  * Functionality: pm_rpm, tiling
  *
  * SUBTEST: system-suspend-modeset
diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c
index 1586d3bf0..b9e95fdfe 100644
--- a/tests/intel/kms_psr.c
+++ b/tests/intel/kms_psr.c
@@ -26,6 +26,9 @@
  * TEST: kms psr
  * Category: Display
  * Description: Tests behaviour of PSR & PSR2 & PR
+ * Driver requirement: i915, xe
+ * Mega feature: PSR
+ * Test category: functionality test
  */
 
 #include "igt.h"
@@ -41,18 +44,13 @@
 /**
  * SUBTEST: psr_basic
  * Description: Basic check for psr if it is detecting changes made in planes
- * Driver requirement: i915, xe
  * Functionality: psr
- * Mega feature: PSR
- * Test category: functionality test
  *
  * SUBTEST: psr_%s_%s
  * Description: Check if psr is detecting memory mapping, rendering and plane
  *              operations performed on %arg[1]
  * Driver requirement: i915
  * Functionality: kms_core, plane, psr
- * Mega feature: PSR
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -70,18 +68,12 @@
  * SUBTEST: psr_sprite_plane_move
  * Description: Check if psr is detecting memory mapping, rendering and plane
  *              operations performed on sprite planes
- * Driver requirement: i915, xe
  * Functionality: plane, psr
- * Mega feature: PSR
- * Test category: functionality test
  *
  * SUBTEST: psr_%s_%s
  * Description: Check if psr is detecting memory mapping, rendering and plane
  *              operations performed on %arg[1] planes
- * Driver requirement: i915, xe
  * Functionality: kms_core, plane, psr
- * Mega feature: PSR
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -99,10 +91,7 @@
  * SUBTEST: psr_primary_%s
  * Description: Check if psr is detecting memory mapping, rendering and plane
  *              operations performed on %arg[1] planes
- * Driver requirement: i915, xe
  * Functionality: kms_core, psr
- * Mega feature: PSR
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -114,63 +103,40 @@
  * SUBTEST: psr_dpms
  * Description: Check if psr is detecting changes when rendering operation is
  *              performed  with dpms enabled or disabled
- * Driver requirement: i915, xe
  * Functionality: dpms, psr
- * Mega feature: PSR
- * Test category: functionality test
  *
  * SUBTEST: psr_no_drrs
  * Description: Check if psr is detecting changes when drrs is disabled
- * Driver requirement: i915, xe
  * Functionality: drrs, psr
- * Mega feature: PSR
- * Test category: functionality test
  *
  * SUBTEST: psr_suspend
  * Description: Check if psr is detecting changes when plane operation
  *              is performed with suspend resume cycles
- * Driver requirement: i915, xe
  * Functionality: psr, suspend
- * Mega feature: PSR
- * Test category: functionality test
  *
  * SUBTEST: psr2_dpms
  * Description: Check if psr is detecting changes when rendering operation
  *              is performed  with dpms enabled or disabled
- * Driver requirement: i915, xe
  * Functionality: dpms, psr, psr2
- * Mega feature: PSR
- * Test category: functionality test
  *
  * SUBTEST: psr2_no_drrs
  * Description: Check if psr is detecting changes when drrs is disabled
- * Driver requirement: i915, xe
  * Functionality: drrs, psr, psr2
- * Mega feature: PSR
- * Test category: functionality test
  *
  * SUBTEST: psr2_suspend
  * Description: Check if psr is detecting changes when plane operation is
  *              performed with suspend resume cycles
- * Driver requirement: i915, xe
  * Functionality: psr, psr2, suspend
- * Mega feature: PSR
- * Test category: functionality test
  *
  * SUBTEST: psr2_basic
  * Description: Basic check for psr if it is detecting changes made in planes
- * Driver requirement: i915, xe
  * Functionality: psr, psr2
- * Mega feature: PSR
- * Test category: functionality test
  *
  * SUBTEST: psr2_%s_%s
  * Description: Check if psr2 is detecting memory mapping, rendering and plane
  *              operations performed on %arg[1] planes
  * Driver requirement: i915
  * Functionality: kms_core, plane, psr, psr2
- * Mega feature: PSR
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -188,18 +154,12 @@
  * SUBTEST: psr2_primary_page_flip
  * Description: Check if psr is detecting memory mapping, rendering and plane
  *              operations performed on primary planes
- * Driver requirement: i915, xe
  * Functionality: plane, psr, psr2
- * Mega feature: PSR
- * Test category: functionality test
  *
  * SUBTEST: psr2_primary_%s
  * Description: Check if psr is detecting memory mapping, rendering and plane
  *              operations performed on primary planes
- * Driver requirement: i915, xe
  * Functionality: kms_core, plane, psr, psr2
- * Mega feature: PSR
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -211,10 +171,7 @@
  * SUBTEST: psr2_%s_%s
  * Description: Check if psr is detecting memory mapping, rendering and plane
  *              operations performed on %arg[1] planes
- * Driver requirement: i915, xe
  * Functionality: kms_core, plane, psr, psr2
- * Mega feature: PSR
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -233,32 +190,24 @@
  * SUBTEST: pr_dpms
  * Description: Check if pr is detecting changes when rendering operation
  *              is performed with dpms enabled or disabled
- * Driver requirement: i915, xe
  * Functionality: dpms, pr
  * Mega feature: Panel Replay
- * Test category: functionality test
  *
  * SUBTEST: pr_no_drrs
  * Description: Check if pr is detecting changes when drrs is disabled
- * Driver requirement: i915, xe
  * Functionality: drrs, pr
  * Mega feature: Panel Replay
- * Test category: functionality test
  *
  * SUBTEST: pr_suspend
  * Description: Check if pr is detecting changes when plane operation is
  *              performed with suspend resume cycles
- * Driver requirement: i915, xe
  * Functionality: pr, suspend
  * Mega feature: Panel Replay
- * Test category: functionality test
  *
  * SUBTEST: pr_basic
  * Description: Basic check for pr if it is detecting changes made in planes
- * Driver requirement: i915, xe
  * Functionality: pr
  * Mega feature: Panel Replay
- * Test category: functionality test
  */
 
 /**
@@ -268,7 +217,6 @@
  * Driver requirement: i915
  * Functionality: kms_core, plane, pr
  * Mega feature: Panel Replay
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -286,18 +234,14 @@
  * SUBTEST: pr_primary_page_flip
  * Description: Check if pr is detecting memory mapping, rendering and plane
  *              operations performed on primary planes
- * Driver requirement: i915, xe
  * Functionality: plane, pr
  * Mega feature: Panel Replay
- * Test category: functionality test
  *
  * SUBTEST: pr_primary_%s
  * Description: Check if pr is detecting memory mapping, rendering and plane
  *              operations performed on primary planes
- * Driver requirement: i915, xe
  * Functionality: kms_core, plane, pr
  * Mega feature: Panel Replay
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -309,10 +253,8 @@
  * SUBTEST: pr_%s_%s
  * Description: Check if pr is detecting memory mapping, rendering and plane
  *              operations performed on %arg[1] planes
- * Driver requirement: i915, xe
  * Functionality: kms_core, plane, pr
  * Mega feature: Panel Replay
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -331,26 +273,17 @@
  * SUBTEST: psr_cursor_plane_move
  * Description: Check if psr is detecting the plane operations performed on
  *		cursor planes
- * Driver requirement: i915, xe
- * Test category: functionality test
  * Functionality: psr
- * Mega feature: PSR
  *
  * SUBTEST: psr_primary_page_flip
  * Description: Check if psr is detecting page-flipping operations performed
  *		on primary planes
- * Driver requirement: i915, xe
- * Test category: functionality test
  * Functionality: psr
- * Mega feature: PSR
  *
  * SUBTEST: psr_sprite_plane_onoff
  * Description: Check if psr is detecting the plane operations performed on
  *		sprite planes
- * Driver requirement: i915, xe
- * Test category: functionality test
  * Functionality: psr
- * Mega feature: PSR
  */
 
 enum operations {
diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
index a93d496e8..27faa93d9 100644
--- a/tests/intel/kms_psr2_sf.c
+++ b/tests/intel/kms_psr2_sf.c
@@ -27,6 +27,10 @@
  * Category: Display
  * Description: Tests to varify PSR2 selective fetch by sending multiple damaged
  *              areas
+ * Driver requirement: i915, xe
+ * Functionality: plane, psr2, selective_fetch
+ * Mega feature: PSR
+ * Test category: functionality test
  */
 
 #include "igt.h"
@@ -42,10 +46,6 @@
  * SUBTEST: %s-plane-move-continuous-%s
  * Description: Test that selective fetch works on moving %arg[1] plane %arg[2]
  *              visible area (no update)
- * Driver requirement: i915, xe
- * Functionality: plane, psr2, selective_fetch
- * Mega feature: PSR
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -62,53 +62,25 @@
 /**
  * SUBTEST: cursor-plane-update-sf
  * Description: Test that selective fetch works on cursor plane
- * Driver requirement: i915, xe
- * Functionality: cursor, psr2, selective_fetch
- * Mega feature: PSR
- * Test category: functionality test
  *
  * SUBTEST: overlay-plane-update-continuous-sf
  * Description: Test that selective fetch works on overlay plane
- * Driver requirement: i915, xe
- * Functionality: plane, psr2, selective_fetch
- * Mega feature: PSR
- * Test category: functionality test
  *
  * SUBTEST: overlay-plane-update-sf-dmg-area
  * Description: Test that selective fetch works on overlay plane
- * Driver requirement: i915, xe
- * Functionality: plane, psr2, selective_fetch
- * Mega feature: PSR
- * Test category: functionality test
  *
  * SUBTEST: overlay-primary-update-sf-dmg-area
  * Description: Test that selective fetch works on primary plane with blended
  *              overlay plane
- * Driver requirement: i915, xe
- * Functionality: plane, psr2, selective_fetch
- * Mega feature: PSR
- * Test category: functionality test
  *
  * SUBTEST: plane-move-sf-dmg-area
  * Description: Test that selective fetch works on moving overlay plane
- * Driver requirement: i915, xe
- * Functionality: plane, psr2, selective_fetch
- * Mega feature: PSR
- * Test category: functionality test
  *
  * SUBTEST: primary-plane-update-sf-dmg-area
  * Description: Test that selective fetch works on primary plane
- * Driver requirement: i915, xe
- * Functionality: plane, psr2, selective_fetch
- * Mega feature: PSR
- * Test category: functionality test
  *
  * SUBTEST: primary-plane-update-sf-dmg-area-big-fb
  * Description: Test that selective fetch works on primary plane with big fb
- * Driver requirement: i915, xe
- * Functionality: plane, psr2, selective_fetch
- * Mega feature: PSR
- * Test category: functionality test
  */
 
 IGT_TEST_DESCRIPTION("Tests to varify PSR2 selective fetch by sending multiple"
diff --git a/tests/intel/kms_psr2_su.c b/tests/intel/kms_psr2_su.c
index 56f35622e..96b4fd2b4 100644
--- a/tests/intel/kms_psr2_su.c
+++ b/tests/intel/kms_psr2_su.c
@@ -26,6 +26,9 @@
  * TEST: kms psr2 su
  * Category: Display
  * Description: Test PSR2 selective update
+ * Driver requirement: i915, xe
+ * Mega feature: PSR
+ * Test category: functionality test
  */
 
 #include "igt.h"
@@ -40,17 +43,11 @@
 /**
  * SUBTEST: frontbuffer-XRGB8888
  * Description: Test that selective update works when screen changes
- * Driver requirement: i915, xe
  * Functionality: fbt, psr2, selective_update
- * Mega feature: PSR
- * Test category: functionality test
  *
  * SUBTEST: page_flip-%s
  * Description: Test the selective update with %arg[1] when screen changes
- * Driver requirement: i915, xe
  * Functionality: pixel-format, psr2, selective_update
- * Mega feature: PSR
- * Test category: functionality test
  *
  * arg[1]:
  *
diff --git a/tests/intel/kms_psr_stress_test.c b/tests/intel/kms_psr_stress_test.c
index 21814f35b..28529b1f1 100644
--- a/tests/intel/kms_psr_stress_test.c
+++ b/tests/intel/kms_psr_stress_test.c
@@ -2,6 +2,10 @@
 /**
  * TEST: kms psr stress test
  * Category: Display
+ * Driver requirement: i915, xe
+ * Functionality: plane, psr
+ * Mega feature: PSR
+ * Test category: functionality test
  */
 
 #include "igt.h"
@@ -18,18 +22,10 @@
  * SUBTEST: flip-primary-invalidate-overlay
  * Description: Mix page flips in primary plane and frontbuffer writes to overlay
  *              plane and check for warnings, underruns or PSR state changes
- * Driver requirement: i915, xe
- * Functionality: plane, psr
- * Mega feature: PSR
- * Test category: functionality test
  *
  * SUBTEST: invalidate-primary-flip-overlay
  * Description: Mix frontbuffer writes to the primary plane and page flips in the
  *              overlay plane and check for warnings, underruns or PSR state changes
- * Driver requirement: i915, xe
- * Functionality: plane, psr
- * Mega feature: PSR
- * Test category: functionality test
  */
 
 #define INVALIDATES_PER_SEC 15
diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
index 844d8cd3e..337fef77e 100644
--- a/tests/kms_addfb_basic.c
+++ b/tests/kms_addfb_basic.c
@@ -29,6 +29,10 @@
  * TEST: kms addfb basic
  * Category: Display
  * Description: Sanity test for ioctls DRM_IOCTL_MODE_ADDFB2 & DRM_IOCTL_MODE_RMFB.
+ * Driver requirement: i915, xe
+ * Functionality: kms_gem_interop
+ * Mega feature: General Display Features
+ * Test category: functionality test
  */
 
 #include "igt.h"
@@ -53,39 +57,22 @@
 /**
  * SUBTEST: unused-%s
  * Description: Test that addfb2 call fails correctly for unused %arg[1]
- * Driver requirement: i915, xe
- * Test category: functionality test
- * Functionality: kms_gem_interop
- * Mega feature: General Display Features
  *
  * SUBTEST: unused-modifier
  * Description: Test that addfb2 call fails correctly for unused modifier
- * Driver requirement: i915, xe
- * Test category: functionality test
  * Functionality: kms_gem_interop, tiling
- * Mega feature: General Display Features
  *
  * SUBTEST: clobberred-modifier
  * Description: Check if addfb2 call works for clobbered modifier
  * Driver requirement: i915
  * Functionality: kms_gem_interop, tiling
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: invalid-smem-bo-on-discrete
  * Description: Check if addfb2 with a system memory gem object fails correctly
  *              if device requires local memory framebuffers
- * Driver requirement: i915, xe
- * Functionality: kms_gem_interop
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: legacy-format
  * Description: Check if addfb2 call works for legacy formats
- * Driver requirement: i915, xe
- * Functionality: kms_gem_interop
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -97,24 +84,12 @@
 /**
  * SUBTEST: no-handle
  * Description: Test that addfb2 call fails correctly without handle
- * Driver requirement: i915, xe
- * Test category: functionality test
- * Functionality: kms_gem_interop
- * Mega feature: General Display Features
  *
  * SUBTEST: basic
  * Description: Check if addfb2 call works with given handle
- * Driver requirement: i915, xe
- * Test category: functionality test
- * Functionality: kms_gem_interop
- * Mega feature: General Display Features
  *
  * SUBTEST: bad-pitch-%i
  * Description: bad-pitch-%arg[1]: Test that addfb2 call fails correctly for bad-pitches
- * Driver requirement: i915, xe
- * Test category: functionality test
- * Functionality: kms_gem_interop
- * Mega feature: General Display Features
  *
  * arg[1].values: 0, 32, 63, 128, 256, 999, 1024, 65536
  */
@@ -123,23 +98,17 @@
  * SUBTEST: basic-%s-tiled-legacy
  * Description: Check if addfb2 and rmfb call works for basic %arg[1] test
  * Driver requirement: i915
- * Test category: functionality test
  * Functionality: kms_gem_interop, tiling
- * Mega feature: General Display Features
  *
  * SUBTEST: framebuffer-vs-set-tiling
  * Description: Check if addfb2 call works for x and y tiling
  * Driver requirement: i915
- * Test category: functionality test
  * Functionality: kms_gem_interop, tiling
- * Mega feature: General Display Features
  *
  * SUBTEST: tile-pitch-mismatch
  * Description: Test that addfb2 call fails correctly for pitches mismatch
  * Driver requirement: i915
- * Test category: functionality test
  * Functionality: kms_gem_interop, tiling
- * Mega feature: General Display Features
  *
  * arg[1]:
  *
@@ -150,99 +119,57 @@
 /**
  * SUBTEST: size-max
  * Description: Check if addfb2 call works with max size of buffer object
- * Driver requirement: i915, xe
- * Test category: functionality test
- * Functionality: kms_gem_interop
- * Mega feature: General Display Features
  *
  * SUBTEST: too-wide
  * Description: Test that addfb2 call fails correctly with increased width of fb
- * Driver requirement: i915, xe
- * Test category: functionality test
- * Functionality: kms_gem_interop
- * Mega feature: General Display Features
  *
  * SUBTEST: too-high
  * Description: Test that addfb2 call fails correctly with increased height of fb
- * Driver requirement: i915, xe
- * Test category: functionality test
- * Functionality: kms_gem_interop
- * Mega feature: General Display Features
  *
  * SUBTEST: bo-too-small
  * Description: Test that addfb2 call fails correctly with small size of buffer object
- * Driver requirement: i915, xe
- * Test category: functionality test
- * Functionality: kms_gem_interop
- * Mega feature: General Display Features
  *
  * SUBTEST: small-bo
  * Description: Check if addfb2 call works for given height
- * Driver requirement: i915, xe
- * Test category: functionality test
- * Functionality: kms_gem_interop
- * Mega feature: General Display Features
  *
  * SUBTEST: bo-too-small-due-to-tiling
  * Description: Test that addfb2 call fails correctly with small buffer object
  *              after changing tile
- * Driver requirement: i915
- * Test category: functionality test
  * Functionality: kms_gem_interop, tiling
- * Mega feature: General Display Features
  */
 
 /**
  * SUBTEST: addfb25-modifier-no-flag
  * Description: Test that addfb2 call fails correctly for x-tiling with given modifier
- * Driver requirement: i915, xe
- * Test category: functionality test
  * Functionality: kms_gem_interop, tiling
- * Mega feature: General Display Features
  *
  * SUBTEST: addfb25-bad-modifier
  * Description: Test that addfb2 call fails correctly for irrelevant modifier
- * Driver requirement: i915, xe
- * Test category: functionality test
  * Functionality: kms_gem_interop, tiling
- * Mega feature: General Display Features
  *
  * SUBTEST: addfb25-x-tiled-mismatch-legacy
  * Description: Test that addfb2 call fails correctly for irrelevant x-tiling
  * Driver requirement: i915
- * Test category: functionality test
  * Functionality: kms_gem_interop, tiling
- * Mega feature: General Display Features
  *
  * SUBTEST: addfb25-x-tiled-legacy
  * Description: Check if addfb2 call works for x-tiling
- * Driver requirement: i915, xe
- * Test category: functionality test
  * Functionality: kms_gem_interop, tiling
- * Mega feature: General Display Features
  *
  * SUBTEST: addfb25-framebuffer-vs-set-tiling
  * Description: Check if addfb2 call works for relevant combination of tiling and fbs
  * Driver requirement: i915
- * Test category: functionality test
  * Functionality: kms_gem_interop, tiling
- * Mega feature: General Display Features
  */
 
 /**
  * SUBTEST: addfb25-y-tiled-%s
  * Description: Check if addfb2 call works for y-tiling %arg[1]
- * Driver requirement: i915, xe
  * Functionality: kms_gem_interop, tiling
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: addfb25-yf-tiled-legacy
  * Description: Check if addfb2 call works for yf-tiling
- * Driver requirement: i915, xe
  * Functionality: kms_gem_interop, tiling
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -253,19 +180,10 @@
 /**
  * SUBTEST: addfb25-4-tiled
  * Description: Check if addfb2 call works for tiling-4
- * Driver requirement: i915, xe
  * Functionality: kms_gem_interop, tiling
- * Mega feature: General Display Features
- * Test category: functionality test
- */
-
-/**
+ *
  * SUBTEST: invalid-%s-%s
  * Description: Test that %arg[1] ioctl call fails correctly for %arg[2] object
- * Driver requirement: i915, xe
- * Test category: functionality test
- * Functionality: kms_gem_interop
- * Mega feature: General Display Features
  *
  * arg[1]:
  *
@@ -281,10 +199,6 @@
 /**
  * SUBTEST: master-rmfb
  * Description: Check that only master can rmfb
- * Driver requirement: i915, xe
- * Functionality: kms_gem_interop
- * Mega feature: General Display Features
- * Test category: functionality test
  */
 
 static uint32_t gem_bo;
diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 82a8f5ef3..6fddad093 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -29,6 +29,10 @@
  * TEST: kms async flips
  * Category: Display
  * Description: Test asynchronous page flips.
+ * Driver requirement: i915, xe
+ * Functionality: async_flips, vblank
+ * Mega feature: General Display Features
+ * Test category: functionality test
  */
 
 #include "igt.h"
@@ -42,48 +46,26 @@
  * SUBTEST: alternate-sync-async-flip
  * Description: Verify the async flip functionality and the fps during async flips
  *              Alternate between sync and async flips
- * Driver requirement: i915, xe
- * Functionality: async_flips, vblank
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: async-flip-with-page-flip-events
  * Description: Verify the async flip functionality and the fps during async flips
  *              Wait for page flip events in between successive asynchronous flips
- * Driver requirement: i915, xe
- * Functionality: async_flips, vblank
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: test-time-stamp
  * Description: Verify the async flip functionality and the fps during async flips
  *              Verify that the async flip timestamp does not coincide with either
  *              previous or next vblank
- * Driver requirement: i915, xe
- * Functionality: async_flips, vblank
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: test-cursor
  * Description: Verify that the DRM_IOCTL_MODE_CURSOR passes after async flip
- * Driver requirement: i915, xe
  * Functionality: async_flips, cursor, vblank
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: crc
  * Description: Use CRC to verify async flip scans out the correct framebuffer
- * Driver requirement: i915, xe
  * Functionality: async_flips, crc, vblank
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: invalid-async-flip
  * Description: Negative case to verify if changes in fb are rejected from kernel as expected
- * Driver requirement: i915, xe
- * Functionality: async_flips, vblank
- * Mega feature: General Display Features
- * Test category: functionality test
  */
 
 #define CURSOR_POS 128
diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
index 9b69fc892..aa3af936a 100644
--- a/tests/kms_atomic.c
+++ b/tests/kms_atomic.c
@@ -31,6 +31,10 @@
  * TEST: kms atomic
  * Category: Display
  * Description: Test atomic modesetting API
+ * Driver requirement: i915, xe
+ * Functionality: kms_core, plane
+ * Mega feature: General Display Features
+ * Test category: functionality test
  */
 
 #include <unistd.h>
@@ -53,49 +57,27 @@
  * Description: Test abuse the atomic ioctl directly in order to test various
  *              invalid conditions which the libdrm wrapper won't allow us to
  *              create.
- * Driver requirement: i915, xe
  * Functionality: kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: atomic-plane-damage
  * Description: Simple test cases to use FB_DAMAGE_CLIPS plane property
- * Driver requirement: i915, xe
- * Functionality: kms_core, plane
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: test-only
  * Description: Test to ensure that DRM_MODE_ATOMIC_TEST_ONLY really only touches
  *              the free-standing state objects and nothing else.
- * Driver requirement: i915, xe
  * Functionality: kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: plane-primary-overlay-mutable-zpos
  * Description: Verify that the overlay plane can cover the primary one (and
  *              vice versa) by changing their zpos property.
- * Driver requirement: i915, xe
- * Functionality: kms_core, plane
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: plane-immutable-zpos
  * Description: Verify the reported zpos property of planes by making sure only
  *              higher zpos planes cover the lower zpos ones.
- * Driver requirement: i915, xe
- * Functionality: kms_core, plane
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: plane-%s-legacy
  * Description: Test for KMS atomic modesetting on %arg[1] and ensure coherency
  *              between legacy and atomic interfaces.
- * Driver requirement: i915, xe
- * Functionality: kms_core, plane
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -107,10 +89,6 @@
 /**
  * SUBTEST: %s-invalid-%s
  * Description: Test error handling when invalid %arg[1] %arg[2] are passed
- * Driver requirement: i915, xe
- * Functionality: kms_core, plane
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -123,8 +101,6 @@
  * @params-fence:     fence parameters
  */
 
-
-
 #ifndef DRM_CAP_CURSOR_WIDTH
 #define DRM_CAP_CURSOR_WIDTH 0x8
 #endif
diff --git a/tests/kms_atomic_interruptible.c b/tests/kms_atomic_interruptible.c
index 7419e0746..962c33f6f 100644
--- a/tests/kms_atomic_interruptible.c
+++ b/tests/kms_atomic_interruptible.c
@@ -25,6 +25,9 @@
  * TEST: kms atomic interruptible
  * Category: Display
  * Description: Tests that interrupt various atomic ioctls.
+ * Driver requirement: i915, xe
+ * Mega feature: General Display Features
+ * Test category: functionality test
  */
 
 #include <signal.h>
@@ -36,10 +39,7 @@
 /**
  * SUBTEST: %s-setmode
  * Description: Tests the interrupt properties of %arg[1] modeset
- * Driver requirement: i915, xe
  * Functionality: kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -50,31 +50,19 @@
 /**
  * SUBTEST: legacy-cursor
  * Description: Tests the interrupt properties for Cursor
- * Driver requirement: i915, xe
  * Functionality: cursor, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: legacy-dpms
  * Description: Tests the interrupt properties for DPMS
- * Driver requirement: i915, xe
  * Functionality: dpms, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: legacy-pageflip
  * Description: Tests the interrupt properties for page flip
- * Driver requirement: i915, xe
  * Functionality: kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: universal-setplane-%s
  * Description: Tests the interrupt properties for %arg[1]
- * Driver requirement: i915, xe
  * Functionality: kms_core, plane
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index b8053acf7..210986f55 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -24,6 +24,10 @@
 /**
  * TEST: kms atomic transition
  * Category: Display
+ * Driver requirement: i915, xe
+ * Functionality: plane, watermark
+ * Mega feature: General Display Features
+ * Test category: functionality test
  */
 
 #include "igt.h"
@@ -41,17 +45,10 @@
 /**
  * SUBTEST: plane-primary-toggle-with-vblank-wait
  * Description: Check toggling of primary plane with vblank
- * Driver requirement: i915, xe
  * Functionality: plane, vblank, watermark
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: plane-all-modeset-%s
  * Description: Modeset test for all plane combinations %arg[1]
- * Driver requirement: i915, xe
- * Functionality: plane, watermark
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -62,10 +59,7 @@
 /**
  * SUBTEST: plane-all-modeset-%s
  * Description: Modeset test for all plane combinations %arg[1]
- * Driver requirement: i915, xe
- * Functionality: plane, watermark
  * Mega feature: eDP
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -76,10 +70,6 @@
 /**
  * SUBTEST: plane-all-%s
  * Description: Transition test for all plane combinations %arg[1]
- * Driver requirement: i915, xe
- * Functionality: plane, watermark
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -92,18 +82,10 @@
 /**
  * SUBTEST: plane-toggle-modeset-transition
  * Description: Check toggling and modeset transition on plane
- * Driver requirement: i915, xe
- * Functionality: plane, watermark
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: plane-use-after-nonblocking-%s
  * Description: Transition test with non %arg[1] and make sure commit of disabled
  *              plane has to complete before atomic commit on that plane
- * Driver requirement: i915, xe
- * Functionality: plane, watermark
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -114,10 +96,6 @@
 /**
  * SUBTEST: modeset-%s
  * Description: Modeset transition tests for combinations of %arg[1]
- * Driver requirement: i915, xe
- * Functionality: plane, watermark
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
diff --git a/tests/kms_bw.c b/tests/kms_bw.c
index 0199b5675..ddea7f2ff 100644
--- a/tests/kms_bw.c
+++ b/tests/kms_bw.c
@@ -24,6 +24,10 @@
  * TEST: kms bw
  * Category: Display
  * Description: BW test with different resolutions
+ * Driver requirement: i915, xe
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
  */
 
 #include "drm_mode.h"
@@ -35,10 +39,6 @@
 /**
  * SUBTEST: linear-tiling-%d-displays-%s
  * Description: bw test with %arg[2]
- * Driver requirement: i915, xe
- * Functionality: kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1].values: 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
  *
diff --git a/tests/kms_color.c b/tests/kms_color.c
index 119dfc1f4..39752de81 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -26,6 +26,10 @@
  * TEST: kms color
  * Category: Display
  * Description: Test Color Features at Pipe level
+ * Driver requirement: i915, xe
+ * Functionality: colorspace
+ * Mega feature: Color mgmt
+ * Test category: functionality test
  */
 
 #include "kms_color_helper.h"
@@ -33,39 +37,19 @@
 /**
  * SUBTEST: degamma
  * Description: Verify that degamma LUT transformation works correctly
- * Driver requirement: i915, xe
- * Functionality: colorspace
- * Mega feature: Color mgmt
- * Test category: functionality test
  *
  * SUBTEST: gamma
  * Description: Verify that gamma LUT transformation works correctly
- * Driver requirement: i915, xe
- * Functionality: colorspace
- * Mega feature: Color mgmt
- * Test category: functionality test
  *
  * SUBTEST: legacy-gamma
  * Description: Verify that legacy gamma LUT transformation works correctly
- * Driver requirement: i915, xe
- * Functionality: colorspace
- * Mega feature: Color mgmt
- * Test category: functionality test
  *
  * SUBTEST: legacy-gamma-reset
  * Description: Verify that setting the legacy gamma LUT resets the gamma LUT
  *              set through GAMMA_LUT property
- * Driver requirement: i915, xe
- * Functionality: colorspace
- * Mega feature: Color mgmt
- * Test category: functionality test
  *
  * SUBTEST: ctm-%s
  * Description: Check the color transformation %arg[1]
- * Driver requirement: i915, xe
- * Functionality: colorspace
- * Mega feature: Color mgmt
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -83,17 +67,9 @@
 /**
  * SUBTEST: deep-color
  * Description: Verify that deep color works correctly
- * Driver requirement: i915, xe
- * Functionality: colorspace
- * Mega feature: Color mgmt
- * Test category: functionality test
  *
  * SUBTEST: invalid-%s-sizes
  * Description: Negative check for %arg[1] sizes
- * Driver requirement: i915, xe
- * Functionality: colorspace
- * Mega feature: Color mgmt
- * Test category: functionality test
  *
  * arg[1]:
  *
diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 988f370f9..6d472ee02 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -26,6 +26,10 @@
  * TEST: kms content protection
  * Category: Display
  * Description: Test content protection (HDCP)
+ * Driver requirement: i915, xe
+ * Functionality: hdcp1.4
+ * Mega feature: HDCP
+ * Test category: functionality test
  */
 
 #include <poll.h>
@@ -41,49 +45,27 @@
 /**
  * SUBTEST: lic
  * Description: Test for the integrity of link.
- * Driver requirement: i915, xe
- * Functionality: hdcp1.4
- * Mega feature: HDCP
- * Test category: functionality test
  *
  * SUBTEST: content-type-change
  * Description: Test the content type change when the content protection already
  *              enabled
- * Driver requirement: i915, xe
  * Functionality: hdcp1.4, hdcp2.2
- * Mega feature: HDCP
- * Test category: functionality test
  *
  * SUBTEST: mei-interface
  * Description: Test the teardown and rebuild of the interface between Intel
  *              and mei hdcp.
- * Driver requirement: i915, xe
  * Functionality: hdcp1.4, hdcp2.2
- * Mega feature: HDCP
- * Test category: functionality test
  *
  * SUBTEST: srm
  * Description: This test writes the facsimile SRM into the /lib/firmware/ and
  *              check the kernel parsing of it by invoking the hdcp authentication.
- * Driver requirement: i915, xe
- * Functionality: hdcp1.4
- * Mega feature: HDCP
- * Test category: functionality test
  *
  * SUBTEST: uevent
  * Description: Test to detect the HDCP status change when we are reading the
  *              uevent sent with the corresponding connector id and property id.
- * Driver requirement: i915, xe
- * Functionality: hdcp1.4
- * Mega feature: HDCP
- * Test category: functionality test
  *
  * SUBTEST: %s
  * Description: Test content protection with %arg[1]
- * Driver requirement: i915, xe
- * Functionality: hdcp1.4
- * Mega feature: HDCP
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -96,10 +78,7 @@
 /**
  * SUBTEST: dp-mst-%s
  * Description: Test Content protection %arg[1] over DP MST.
- * Driver requirement: i915, xe
  * Functionality: hdcp1.4, mst
- * Mega feature: HDCP
- * Test category: functionality test
  *
  * arg[1]:
  *
diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index 3d1c3bcd3..f747b919f 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -33,6 +33,10 @@
  *              compares it with the CRC value obtained when the cursor plane
  *              was disabled and its drawing is directly inserted on the PF by
  *              software.
+ * Driver requirement: i915, xe
+ * Functionality: cursor
+ * Mega feature: General Display Features
+ * Test category: functionality test
  */
 
 #include "igt.h"
@@ -45,24 +49,14 @@
 /**
  * SUBTEST: cursor-dpms
  * Description: Check random placement of a cursor with DPMS.
- * Driver requirement: i915, xe
  * Functionality: cursor, dpms
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: cursor-suspend
  * Description: Check random placement of a cursor with suspend.
- * Driver requirement: i915, xe
  * Functionality: cursor, suspend
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: cursor-%s
  * Description: %arg[1]
- * Driver requirement: i915, xe
- * Functionality: cursor
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -78,10 +72,6 @@
 /**
  * SUBTEST: cursor-%s-%s
  * Description: Check if a %arg[2] cursor is %arg[1].
- * Driver requirement: i915, xe
- * Functionality: cursor
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
diff --git a/tests/kms_cursor_edge_walk.c b/tests/kms_cursor_edge_walk.c
index d9d140409..54e9dc92f 100644
--- a/tests/kms_cursor_edge_walk.c
+++ b/tests/kms_cursor_edge_walk.c
@@ -25,8 +25,11 @@
 /**
  * TEST: kms cursor edge walk
  * Category: Display
- * Description: Exercise CHV pipe C cursor fail
  * Description: Test to check different cursor sizes by walking different edges of screen
+ * Driver requirement: i915, xe
+ * Functionality: cursor
+ * Mega feature: General Display Features
+ * Test category: functionality test
  */
 
 #include "igt.h"
@@ -39,10 +42,6 @@
 /**
  * SUBTEST: %s-%s
  * Description: Checking cursor size %arg[1] by walking %arg[2] of screen
- * Driver requirement: i915, xe
- * Functionality: cursor
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 2e2710ae4..0017659d4 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -26,6 +26,10 @@
  * TEST: kms cursor legacy
  * Category: Display
  * Description: Stress legacy cursor ioctl
+ * Driver requirement: i915, xe
+ * Functionality: cursor
+ * Mega feature: General Display Features
+ * Test category: functionality test
  */
 
 #include <sched.h>
@@ -42,10 +46,6 @@
  * Description: Test checks how many cursor updates we can fit between vblanks
  *              on single/all pipes with different modes, priority and number
  *              of processes
- * Driver requirement: i915, xe
- * Functionality: cursor
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -62,17 +62,9 @@
 /**
  * SUBTEST: basic-busy-flip-before-cursor-%s
  * Description: Cursor test with %arg[1] mode
- * Driver requirement: i915, xe
- * Test category: functionality test
- * Functionality: cursor
- * Mega feature: General Display Features
  *
  * SUBTEST: basic-busy-flip-before-cursor-varying-size
  * Description: Change the size of cursor b/w 64*64 to maxw x maxh.
- * Driver requirement: i915, xe
- * Functionality: cursor
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -83,17 +75,9 @@
 /**
  * SUBTEST: basic-flip-after-cursor-%s
  * Description: Cursor test with %arg[1]
- * Driver requirement: i915, xe
- * Test category: functionality test
- * Functionality: cursor
- * Mega feature: General Display Features
  *
  * SUBTEST: basic-flip-before-cursor-%s
  * Description: Cursor test with %arg[1]
- * Driver requirement: i915, xe
- * Test category: functionality test
- * Functionality: cursor
- * Mega feature: General Display Features
  *
  * arg[1]:
  *
@@ -110,10 +94,6 @@
  *		                     and full screen primary plane.\n"
  *		- toggle: which toggles cursor visibility and make sure cursor moves
  *		          between updates.
- * Driver requirement: i915, xe
- * Functionality: cursor
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -135,10 +115,6 @@
  *		                     and full screen primary plane.\n"
  *		- toggle: which toggles cursor visibility and make sure cursor moves
  *		          between updates.
- * Driver requirement: i915, xe
- * Functionality: cursor
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -151,26 +127,14 @@
  * SUBTEST: long-nonblocking-modeset-vs-cursor-atomic
  * Description: Test checks how many cursor updates we can fit between vblanks
  *              on all pipes with different modes, priority and number of processes
- * Driver requirement: i915, xe
- * Functionality: cursor
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: nonblocking-modeset-vs-cursor-atomic
  * Description: Test checks how many cursor updates we can fit between vblanks
  *              on all pipes with different modes, priority and number of processes
- * Driver requirement: i915, xe
- * Functionality: cursor
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: 2x-%s-%s
  * Description: This test executes flips on both CRTCs while running cursor
  *              updates in parallel
- * Driver requirement: i915, xe
- * Functionality: cursor
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -189,10 +153,6 @@
  * SUBTEST: 2x-%s-atomic
  * Description: This test executes flips on both CRTCs while running cursor
  *              updates in parallel
- * Driver requirement: i915, xe
- * Functionality: cursor
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -204,10 +164,6 @@
  * SUBTEST: %s-%s
  * Description: The essence of the basic test is that neither the cursor nor the
  *              nonblocking flip stall the application of the next
- * Driver requirement: i915, xe
- * Functionality: cursor
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -231,10 +187,6 @@
 /**
  * SUBTEST: 2x-%s-%s
  * Description: This test executes flips on both CRTCs while running cursor updates in parallel
- * Driver requirement: i915, xe
- * Functionality: cursor
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -252,17 +204,9 @@
 /**
  * SUBTEST: flip-vs-cursor-crc-%s
  * Description: this test perform a page flip followed by a cursor update
- * Driver requirement: i915, xe
- * Functionality: cursor
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: flip-vs-cursor-busy-crc-%s
  * Description: this test perform a busy bo update followed by a cursor update
- * Driver requirement: i915, xe
- * Functionality: cursor
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -274,10 +218,6 @@
  * SUBTEST: modeset-atomic-cursor-hotspot
  * Description: Test changes the cursor hotspot and checks that the property is
  *              updated accordignly
- * Driver requirement: i915, xe
- * Functionality: cursor
- * Mega feature: General Display Features
- * Test category: functionality test
  */
 
 #if defined(__x86_64__) || defined(__i386__)
diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
index a0a831724..1f0f811c8 100644
--- a/tests/kms_display_modes.c
+++ b/tests/kms_display_modes.c
@@ -28,6 +28,9 @@
  * TEST: kms display modes
  * Category: Display
  * Description: Test Display Modes
+ * Driver requirement: i915, xe
+ * Mega feature: General Display Features
+ * Test category: functionality test
  */
 
 #include "igt.h"
@@ -36,18 +39,12 @@
  * SUBTEST: extended-mode-basic
  * Description: Test for validating display extended mode with a pair of connected
  *              displays
- * Driver requirement: i915, xe
  * Functionality: kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: mst-extended-mode-negative
  * Description: Negative test for validating display extended mode with a pair
  *		of connected 2k-4k or 4k-4k displays.
- * Driver requirement: i915, xe
  * Functionality: kms_core, mst
- * Mega feature: General Display Features
- * Test category: functionality test
  */
 
 #define HDISPLAY_4K	3840
diff --git a/tests/kms_dither.c b/tests/kms_dither.c
index 5683fe5c5..af7b7f05c 100644
--- a/tests/kms_dither.c
+++ b/tests/kms_dither.c
@@ -29,6 +29,10 @@
  * TEST: kms dither
  * Category: Display
  * Description: Test Dithering block status
+ * Driver requirement: i915, xe
+ * Functionality: colorspace, kms_gem_interop
+ * Mega feature: General Display Features
+ * Test category: functionality test
  */
 
 #include "igt.h"
@@ -39,17 +43,9 @@
 /**
  * SUBTEST: fb-8bpc-vs-panel-6bpc
  * Description: Framebuffer BPC:8, Panel BPC:6, Expected Dither:Enable
- * Driver requirement: i915, xe
- * Functionality: colorspace, kms_gem_interop
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: fb-8bpc-vs-panel-8bpc
  * Description: Framebuffer BPC:8, Panel BPC:8, Expected Dither:Disable
- * Driver requirement: i915, xe
- * Functionality: colorspace, kms_gem_interop
- * Mega feature: General Display Features
- * Test category: functionality test
  */
 
 IGT_TEST_DESCRIPTION("Test Dithering block status");
diff --git a/tests/kms_feature_discovery.c b/tests/kms_feature_discovery.c
index 7aec4e78c..24c71ed22 100644
--- a/tests/kms_feature_discovery.c
+++ b/tests/kms_feature_discovery.c
@@ -28,6 +28,10 @@
  * Description: A metatest that checks for \"features\" presence.
  *		The subtests here should only skip or pass,
  *		anything else means we have a serious problem.
+ * Driver requirement: i915, xe
+ * Functionality: feature_discovery
+ * Mega feature: General Display Features
+ * Test category: functionality test
  */
 
 #include "igt.h"
@@ -42,45 +46,28 @@
 /**
  * SUBTEST: display
  * Description: Make sure that we have display support.
- * Driver requirement: i915, xe
- * Functionality: feature_discovery
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: display-%dx
  * Description: Make sure that we have display support with %arg[1]
  * 		outputs connected.
- * Driver requirement: i915, xe
- * Functionality: feature_discovery
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: chamelium
  * Description: Make sure that Chamelium is configured and reachable.
- * Driver requirement: i915, xe
  * Functionality: feature_discovery, chamelium
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: psr1
  * Description: Make sure that we have eDP panel with PSR1 support.
- * Driver requirement: i915, xe
  * Functionality: feature_discovery, psr1, eDP
  * Mega feature: PSR
- * Test category: functionality test
  *
  * SUBTEST: psr2
  * Description: Make sure that we have eDP panel with PSR2 support.
- * Driver requirement: i915, xe
  * Functionality: feature_discovery, psr2, eDP
  * Mega feature: PSR
- * Test category: functionality test
  *
  * SUBTEST: dp-mst
  * Description: Make sure that we have DP-MST configuration.
- * Driver requirement: i915, xe
  * Functionality: feature_discovery, mst
- * Mega feature: General Display Features
  * Test category: functionality test
  *
  * arg[1].values: 1, 2, 3, 4
diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index 9afb78757..3973ec862 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -25,6 +25,10 @@
  * TEST: kms flip
  * Category: Display
  * Description: Tests for validating modeset, dpms and pageflips
+ * Driver requirement: i915, xe
+ * Functionality: vblank
+ * Mega feature: General Display Features
+ * Test category: functionality test
  */
 
 #include "config.h"
@@ -59,16 +63,12 @@
  * Description: %arg[1] test to validate pageflips with available fences
  * Driver requirement: i915
  * Functionality: gtt, vblank
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: 2x-%s
  * Description: %arg[1] test to validate pageflips along with available fences
  *              on a pair of connected displays
  * Driver requirement: i915
  * Functionality: gtt, vblank
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -79,10 +79,7 @@
 /**
  * SUBTEST: dpms-off-%s
  * Description: %arg[1] test to validate pageflips by disabling other connectors usng dpms
- * Driver requirement: i915, xe
  * Functionality: dpms, vblank
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -93,10 +90,7 @@
 /**
  * SUBTEST: %s
  * Description: %arg[1] test to validate pageflips with large BO in size
- * Driver requirement: i915, xe
  * Functionality: kms_gem_interop, vblank
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -107,17 +101,11 @@
 /**
  * SUBTEST: %s
  * Description: Basic test to validate %arg[1]
- * Driver requirement: i915, xe
  * Functionality: hang, vblank
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: 2x-%s
  * Description: Test to validate %arg[1] on a pair of connected displays
- * Driver requirement: i915, xe
  * Functionality: hang, vblank
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -128,17 +116,9 @@
 /**
  * SUBTEST: %s
  * Description: Basic test to validate %arg[1]
- * Driver requirement: i915, xe
- * Functionality: vblank
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: 2x-%s
  * Description: Test to validate %arg[1] on a pair of connected displays
- * Driver requirement: i915, xe
- * Functionality: vblank
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -161,18 +141,12 @@
 /**
  * SUBTEST: %s
  * Description: %arg[1] test to validate pageflips with suspend cycle
- * Driver requirement: i915, xe
  * Functionality: suspend, vblank
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: 2x-%s
  * Description: %arg[1] test to validate pageflips with suspend cycle on a pair
  *              of connected displays
- * Driver requirement: i915, xe
  * Functionality: suspend, vblank
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -183,31 +157,17 @@
 /**
  * SUBTEST: %s
  * Description: Basic test to validate %arg[1]
- * Driver requirement: i915, xe
  * Functionality: dpms, vblank
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: 2x-%s
  * Description: Basic test to validate %arg[1] on a pair of connected displays
- * Driver requirement: i915, xe
  * Functionality: dpms, vblank
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: %s-interruptible
  * Description: Basic test to validate %arg[1]
- * Driver requirement: i915, xe
- * Functionality: vblank
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: 2x-%s-interruptible
  * Description: Basic test to validate %arg[1] on a pair of connected displays
- * Driver requirement: i915, xe
- * Functionality: vblank
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -222,17 +182,10 @@
  * SUBTEST: 2x-flip-vs-dpms
  * Description: Basic test to validate pageflip along with dpms on a pair of
  *              connected displays
- * Driver requirement: i915, xe
  * Functionality: dpms, vblank
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: 2x-%s
  * Description: Basic test to validate %arg[1] on a pair of connected displays
- * Driver requirement: i915, xe
- * Functionality: vblank
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -244,18 +197,10 @@
 /**
  * SUBTEST: %s-interruptible
  * Description: Basic test for validating modeset, dpms and pageflips
- * Driver requirement: i915, xe
- * Functionality: vblank
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: 2x-%s-interruptible
  * Description: Test for validating modeset, dpms and pageflips with a pair of
  *              connected displays
- * Driver requirement: i915, xe
- * Functionality: vblank
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -277,31 +222,16 @@
 /**
  * SUBTEST: basic-plain-flip
  * Description: Basic test for validating page flip
- * Driver requirement: i915, xe
- * Test category: functionality test
- * Functionality: vblank
- * Mega feature: General Display Features
  *
  * SUBTEST: nonblocking-read
  * Description: Tests that nonblocking reading fails correctly
- * Driver requirement: i915, xe
- * Functionality: vblank
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: basic-flip-vs-dpms
  * Description: Basic test to valide pageflip with dpms
- * Driver requirement: i915, xe
- * Test category: functionality test
  * Functionality: dpms, vblank
- * Mega feature: General Display Features
  *
  * SUBTEST: basic-flip-vs-%s
  * Description: Basic test to valide pageflip with %arg[1]
- * Driver requirement: i915, xe
- * Test category: functionality test
- * Functionality: vblank
- * Mega feature: General Display Features
  *
  * arg[1]:
  *
diff --git a/tests/kms_force_connector_basic.c b/tests/kms_force_connector_basic.c
index 55e6a7767..392a02f7e 100644
--- a/tests/kms_force_connector_basic.c
+++ b/tests/kms_force_connector_basic.c
@@ -26,6 +26,10 @@
  * TEST: kms force connector basic
  * Category: Display
  * Description: Check the debugfs force connector/edid features work correctly.
+ * Driver requirement: i915, xe
+ * Functionality: force_connector
+ * Mega feature: General Display Features
+ * Test category: functionality test
  */
 
 #include "igt.h"
@@ -35,29 +39,15 @@
  * Description: Test to detect forced load.
  * Driver requirement: i915
  * Functionality: force_connector, vga
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: force-connector-state
  * Description: Test to check the forced connector state
- * Driver requirement: i915, xe
- * Test category: functionality test
- * Functionality: force_connector
- * Mega feature: General Display Features
  *
  * SUBTEST: force-edid
  * Description: Test to check the values after forcing edid
- * Driver requirement: i915, xe
- * Test category: functionality test
- * Functionality: force_connector
- * Mega feature: General Display Features
  *
  * SUBTEST: prune-stale-modes
  * Description: Tests pruning of stale modes
- * Driver requirement: i915, xe
- * Test category: functionality test
- * Functionality: force_connector
- * Mega feature: General Display Features
  */
 
 IGT_TEST_DESCRIPTION("Check the debugfs force connector/edid features work"
diff --git a/tests/kms_getfb.c b/tests/kms_getfb.c
index b4a155e2d..e6b8dd873 100644
--- a/tests/kms_getfb.c
+++ b/tests/kms_getfb.c
@@ -31,6 +31,10 @@
  * TEST: kms getfb
  * Category: Display
  * Description: Tests GETFB and GETFB2 ioctls.
+ * Driver requirement: i915, xe
+ * Functionality: kms_gem_interop
+ * Mega feature: General Display Features
+ * Test category: functionality test
  */
 
 #include "igt.h"
@@ -54,10 +58,6 @@
 /**
  * SUBTEST: getfb-handle-%s
  * Description: Tests error handling %arg[1]
- * Driver requirement: i915, xe
- * Functionality: kms_gem_interop
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -71,18 +71,11 @@
  * SUBTEST: getfb-reject-ccs
  * Description: Tests error handling while requesting CCS buffers it should
  *              refuse because getfb supports returning a single buffer handle.
- * Driver requirement: i915, xe
  * Functionality: ccs, kms_gem_interop, tiling
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: getfb-%s-different-handles
  * Description: Tests error handling while requesting for two different handles
  *              from %arg[1].
- * Driver requirement: i915, xe
- * Functionality: kms_gem_interop
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -93,24 +86,13 @@
 /**
  * SUBTEST: getfb2-accept-ccs
  * Description: Tests outputs are correct when retrieving a CCS framebuffer.
- * Driver requirement: i915, xe
  * Functionality: ccs, kms_gem_interop, tiling
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: getfb2-into-addfb2
  * Description: Output check by passing the output of GETFB2 into ADDFB2.
- * Driver requirement: i915, xe
- * Functionality: kms_gem_interop
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: getfb2-handle-%s
  * Description: Tests error handling %arg[1].
- * Driver requirement: i915, xe
- * Functionality: kms_gem_interop
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -122,10 +104,6 @@
 /**
  * SUBTEST: %s-handle-protection
  * Description: Make sure %arg[1] return handles if caller is non-root or non-master.
- * Driver requirement: i915, xe
- * Functionality: kms_gem_interop
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
diff --git a/tests/kms_hdmi_inject.c b/tests/kms_hdmi_inject.c
index 3a279e2c9..9691f2818 100644
--- a/tests/kms_hdmi_inject.c
+++ b/tests/kms_hdmi_inject.c
@@ -28,6 +28,9 @@
  * Description: Test that in-kernel EDID parsing is producing expected results
  *              by forcing a HDMI connector with a known EDID and checking that
  *              the metadata exposed to user space matches.
+ * Driver requirement: i915, xe
+ * Mega feature: HDMI
+ * Test category: functionality test
  */
 
 #include "config.h"
@@ -43,18 +46,12 @@
  * SUBTEST: inject-4k
  * Description: Make sure that 4K modes exposed by DRM match the forced EDID and
  *              modesetting using it succeed.
- * Driver requirement: i915, xe
  * Functionality: force_connector, hdmi_edid
- * Mega feature: HDMI
- * Test category: functionality test
  *
  * SUBTEST: inject-audio
  * Description: Make sure that audio information exposed by ALSA match the forced
  *              EDID.
- * Driver requirement: i915, xe
  * Functionality: audio, force_connector
- * Mega feature: HDMI
- * Test category: functionality test
  */
 
 #define HDISPLAY_4K	3840
diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index 215f81892..4dd2eda37 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -24,6 +24,10 @@
  * TEST: kms hdr
  * Category: Display
  * Description: Test HDR metadata interfaces and bpc switch
+ * Driver requirement: i915, xe
+ * Functionality: colorspace, hdr
+ * Mega feature: HDR
+ * Test category: functionality test
  */
 
 #include "igt.h"
@@ -35,59 +39,31 @@
 /**
  * SUBTEST: bpc-switch
  * Description: Tests switching between different display output bpc modes
- * Driver requirement: i915, xe
- * Functionality: colorspace, hdr
- * Mega feature: HDR
- * Test category: functionality test
  *
  * SUBTEST: bpc-switch-dpms
  * Description: Tests switching between different display output bpc modes with dpms
- * Driver requirement: i915, xe
  * Functionality: colorspace, dpms, hdr
- * Mega feature: HDR
- * Test category: functionality test
  *
  * SUBTEST: bpc-switch-suspend
  * Description: Tests switching between different display output bpc modes with suspend
- * Driver requirement: i915, xe
  * Functionality: colorspace, hdr, suspend
- * Mega feature: HDR
- * Test category: functionality test
  *
  * SUBTEST: invalid-hdr
  * Description: Test to ensure HDR is not enabled on non-HDR panel
- * Driver requirement: i915, xe
- * Functionality: colorspace, hdr
- * Mega feature: HDR
- * Test category: functionality test
  *
  * SUBTEST: invalid-metadata-sizes
  * Description: Tests invalid HDR metadata sizes
- * Driver requirement: i915, xe
- * Functionality: colorspace, hdr
- * Mega feature: HDR
- * Test category: functionality test
  *
  * SUBTEST: static-toggle-dpms
  * Description: Tests static toggle with dpms
- * Driver requirement: i915, xe
  * Functionality: colorspace, dpms, hdr
- * Mega feature: HDR
- * Test category: functionality test
  *
  * SUBTEST: static-toggle-suspend
  * Description: Tests static toggle with suspend
- * Driver requirement: i915, xe
  * Functionality: colorspace, hdr, suspend
- * Mega feature: HDR
- * Test category: functionality test
  *
  * SUBTEST: static-%s
  * Description: Tests %arg[1].
- * Driver requirement: i915, xe
- * Functionality: colorspace, hdr
- * Mega feature: HDR
- * Test category: functionality test
  *
  * arg[1]:
  *
diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c
index 77cf4d609..4fd644594 100644
--- a/tests/kms_invalid_mode.c
+++ b/tests/kms_invalid_mode.c
@@ -27,6 +27,10 @@
  * Category: Display
  * Description: Make sure all modesets are rejected when the requested mode is
  *              invalid
+ * Driver requirement: i915, xe
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
  */
 
 #include "igt.h"
@@ -37,10 +41,6 @@
  * SUBTEST: %s
  * Description: Make sure all modesets are rejected when the requested mode
  *              (%arg[1]) is invalid
- * Driver requirement: i915, xe
- * Functionality: kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
diff --git a/tests/kms_lease.c b/tests/kms_lease.c
index 5c5a23fed..8ac58af38 100644
--- a/tests/kms_lease.c
+++ b/tests/kms_lease.c
@@ -25,6 +25,10 @@
  * TEST: kms lease
  * Category: Display
  * Description: Test of CreateLease.
+ * Driver requirement: i915, xe
+ * Functionality: lease
+ * Mega feature: General Display Features
+ * Test category: functionality test
  */
 
 #include "igt.h"
@@ -48,155 +52,71 @@
 /**
  * SUBTEST: atomic-implicit-crtc
  * Description: Negative test by using a different crtc with atomic ioctl
- * Driver requirement: i915, xe
- * Functionality: lease
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: cursor-implicit-plane
  * Description: Negative test by using a non-primary plane with setcursor ioctl
- * Driver requirement: i915, xe
- * Functionality: lease
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: empty-lease
  * Description: Check that creating an empty lease works
- * Driver requirement: i915, xe
- * Functionality: lease
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: implicit-plane-lease
  * Description: Tests the implicitly added planes.
- * Driver requirement: i915, xe
- * Functionality: lease
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: invalid-create-leases
  * Description: Tests error handling while creating invalid corner-cases for
  *              create-lease ioctl
- * Driver requirement: i915, xe
- * Functionality: lease
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: lease-uevent
  * Description: Tests all the uevent cases
- * Driver requirement: i915, xe
- * Functionality: lease
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: lease-again
  * Description: Tests leasing objects more than once
- * Driver requirement: i915, xe
- * Functionality: lease
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: lease-get
  * Description: Tests getting the required contents of a lease
- * Driver requirement: i915, xe
- * Functionality: lease
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: lease-invalid-connector
  * Description: Tests leasing an invalid connector
- * Driver requirement: i915, xe
- * Functionality: lease
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: lease-invalid-crtc
  * Description: Tests leasing an invalid crtc
- * Driver requirement: i915, xe
- * Functionality: lease
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: lease-invalid-plane
  * Description: Tests leasing an invalid plane
- * Driver requirement: i915, xe
- * Functionality: lease
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: lease-revoke
  * Description: Tests revocation of lease
- * Driver requirement: i915, xe
- * Functionality: lease
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: lease-unleased-connector
  * Description: Negative test by trying to use an unleased connector
- * Driver requirement: i915, xe
- * Functionality: lease
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: lease-unleased-crtc
  * Description: Negative test by trying to use an unleased crtc
- * Driver requirement: i915, xe
- * Functionality: lease
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: lessee-list
  * Description: Check if listed lease is same as created one
- * Driver requirement: i915, xe
- * Functionality: lease
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: master-vs-lease
  * Description: Tests the drop/set_master interactions.
- * Driver requirement: i915, xe
- * Functionality: lease
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: multimaster-lease
  * Description: Tests that the 2nd master can only create leases while being
  *              active master, and that leases on the first master don't prevent
  *              lease creation for the 2nd master.
- * Driver requirement: i915, xe
- * Functionality: lease
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: page-flip-implicit-plane
  * Description: Negative test by using a non-primary plane with the page flip ioctl
- * Driver requirement: i915, xe
- * Functionality: lease
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: possible-crtcs-filtering
  * Description: Tests that  possible_crtcs logically match between master and
  *              lease, and that the values are correctly renumbered on the lease
  *              side.
- * Driver requirement: i915, xe
- * Functionality: lease
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: setcrtc-implicit-plane
  * Description: Negative test by using a non-primary plane with the setcrtc ioctl
- * Driver requirement: i915, xe
- * Functionality: lease
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: simple-lease
  * Description: Check if create lease ioctl call works
- * Driver requirement: i915, xe
- * Functionality: lease
- * Mega feature: General Display Features
- * Test category: functionality test
  */
 
 IGT_TEST_DESCRIPTION("Test of CreateLease.");
diff --git a/tests/kms_panel_fitting.c b/tests/kms_panel_fitting.c
index af0c756ed..4b5d9d5ab 100644
--- a/tests/kms_panel_fitting.c
+++ b/tests/kms_panel_fitting.c
@@ -26,6 +26,10 @@
  * TEST: kms panel fitting
  * Category: Display
  * Description: Test display panel fitting
+ * Driver requirement: i915, xe
+ * Functionality: eDP, panel_fitting, scaling
+ * Mega feature: General Display Features
+ * Test category: functionality test
  */
 
 #include "igt.h"
@@ -36,17 +40,9 @@
 /**
  * SUBTEST: atomic-fastset
  * Description: Tests panel fitting usages with atomic fastset.
- * Driver requirement: i915, xe
- * Functionality: eDP, panel_fitting, scaling
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: legacy
  * Description: Tests panel fitting usages with legacy style commit.
- * Driver requirement: i915, xe
- * Functionality: eDP, panel_fitting, scaling
- * Mega feature: General Display Features
- * Test category: functionality test
  */
 
 IGT_TEST_DESCRIPTION("Test display panel fitting");
diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
index 4fed582b4..3c12d8098 100644
--- a/tests/kms_pipe_crc_basic.c
+++ b/tests/kms_pipe_crc_basic.c
@@ -26,6 +26,10 @@
  * TEST: kms pipe crc basic
  * Category: Display
  * Description: Tests behaviour of CRC
+ * Driver requirement: i915, xe
+ * Functionality: crc
+ * Mega feature: General Display Features
+ * Test category: functionality test
  */
 
 #include "igt.h"
@@ -39,61 +43,32 @@
 /**
  * SUBTEST: bad-source
  * Description: Tests error handling when the bad source is set.
- * Driver requirement: i915, xe
- * Functionality: crc
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: read-crc
  * Description: Test for pipe CRC reads
- * Driver requirement: i915, xe
- * Test category: functionality test
- * Functionality: crc
- * Mega feature: General Display Features
  *
  * SUBTEST: read-crc-frame-sequence
  * Description: Tests the pipe CRC read and ensure frame sequence
- * Driver requirement: i915, xe
- * Test category: functionality test
- * Functionality: crc
- * Mega feature: General Display Features
  *
  * SUBTEST: nonblocking-crc
  * Description: Test for O_NONBLOCK CRC reads
- * Driver requirement: i915, xe
- * Test category: functionality test
- * Functionality: crc
- * Mega feature: General Display Features
  *
  * SUBTEST: nonblocking-crc-frame-sequence
  * Description: Test for O_NONBLOCK CRC reads and ensure frame sequence
- * Driver requirement: i915, xe
- * Test category: functionality test
- * Functionality: crc
- * Mega feature: General Display Features
  *
  * SUBTEST: suspend-read-crc
  * Description: Suspend test for pipe CRC reads
- * Driver requirement: i915, xe
- * Test category: functionality test
  * Functionality: crc, suspend
- * Mega feature: General Display Features
  *
  * SUBTEST: hang-read-crc
  * Description: Hang test for pipe CRC read
- * Driver requirement: i915, xe
- * Test category: functionality test
  * Functionality: crc, hang
- * Mega feature: General Display Features
  */
 
 /**
  * SUBTEST: compare-crc-sanitycheck-%s
  * Description: Basic sanity check for CRC mismatches with %arg[1]
- * Driver requirement: i915, xe
- * Test category: functionality test
  * Functionality: crc, pixel_format
- * Mega feature: General Display Features
  *
  * arg[1]:
  *
@@ -105,10 +80,6 @@
  * SUBTEST: disable-crc-after-crtc
  * Description: Check that disabling CRCs on a CRTC after having disabled the
  *              CRTC does not cause issues.
- * Driver requirement: i915, xe
- * Functionality: crc
- * Mega feature: General Display Features
- * Test category: functionality test
  */
 
 static bool extended;
diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 29cf45974..e50a94578 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -28,6 +28,9 @@
  * TEST: kms plane
  * Category: Display
  * Description: Testes for KMS Plane
+ * Driver requirement: i915, xe
+ * Mega feature: General Display Features
+ * Test category: functionality test
  */
 
 #include "igt.h"
@@ -41,25 +44,16 @@
 /**
  * SUBTEST: planar-pixel-format-settings
  * Description: verify planar settings for pixel format are handled correctly
- * Driver requirement: i915, xe
  * Functionality: pixel_format, plane
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: plane-position-%s
  * Description: Verify plane position using two planes to create a %arg[1]
- * Driver requirement: i915, xe
  * Functionality: plane
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: plane-position-hole-dpms
  * Description: Verify plane position using two planes to create a partially
  *              covered screen and check for DPMS
- * Driver requirement: i915, xe
  * Functionality: dpms, plane
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -70,18 +64,12 @@
 /**
  * SUBTEST: plane-panning-%s
  * Description: Verify plane panning at %arg[1] using primary plane
- * Driver requirement: i915, xe
  * Functionality: plane
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: plane-panning-bottom-right-suspend
  * Description: Verify plane panning at bottom-right position with suspend using
  *              primary plane
- * Driver requirement: i915, xe
  * Functionality: plane, suspend
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -92,10 +80,7 @@
 /**
  * SUBTEST: pixel-%s
  * Description: verify the pixel formats for given plane and pipe
- * Driver requirement: i915, xe
  * Functionality: pixel_format, plane
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
index d37407150..eaec37661 100644
--- a/tests/kms_plane_alpha_blend.c
+++ b/tests/kms_plane_alpha_blend.c
@@ -28,6 +28,10 @@
  * TEST: kms plane alpha blend
  * Category: Display
  * Description: Test plane alpha and blending mode properties
+ * Driver requirement: i915, xe
+ * Functionality: plane
+ * Mega feature: General Display Features
+ * Test category: functionality test
  */
 
 #include "igt.h"
@@ -35,10 +39,6 @@
 /**
  * SUBTEST: alpha-%s
  * Description: Test to %arg[1]
- * Driver requirement: i915, xe
- * Functionality: plane
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -52,25 +52,13 @@
 /**
  * SUBTEST: coverage-vs-premult-vs-constant
  * Description: Tests pipe coverage blending properties.
- * Driver requirement: i915, xe
- * Functionality: plane
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: coverage-7efc
  * Description: Uses alpha values 0x7e and 0xfc to validate fg.alpha and
  *              plane_alpha are swappable on coverage blend mode.
- * Driver requirement: i915, xe
- * Functionality: plane
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: constant-alpha-%s
  * Description: Tests plane alpha and blending properties with %arg[1].
- * Driver requirement: i915, xe
- * Functionality: plane
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
index 55ddffe44..dd33d8129 100644
--- a/tests/kms_plane_cursor.c
+++ b/tests/kms_plane_cursor.c
@@ -24,6 +24,10 @@
  * TEST: kms plane cursor
  * Category: Display
  * Description: Tests cursor interactions with primary and overlay planes.
+ * Driver requirement: i915, xe
+ * Functionality: cursor, plane
+ * Mega feature: General Display Features
+ * Test category: functionality test
  */
 
 #include "igt.h"
@@ -31,25 +35,13 @@
 /**
  * SUBTEST: overlay
  * Description: Tests atomic cursor positioning on primary plane and overlay plane
- * Driver requirement: i915, xe
- * Functionality: cursor, plane
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: primary
  * Description: Tests atomic cursor positioning on primary plane
- * Driver requirement: i915, xe
- * Functionality: cursor, plane
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: viewport
  * Description: Tests atomic cursor positioning on primary plane and overlay plane
  *              with buffer larger than viewport used for display
- * Driver requirement: i915, xe
- * Functionality: cursor, plane
- * Mega feature: General Display Features
- * Test category: functionality test
  */
 
 /*
diff --git a/tests/kms_plane_lowres.c b/tests/kms_plane_lowres.c
index 13158bf99..ef85e8fb9 100644
--- a/tests/kms_plane_lowres.c
+++ b/tests/kms_plane_lowres.c
@@ -27,6 +27,10 @@
  * Category: Display
  * Description: Test atomic mode setting with a plane by switching between high
  *              and low resolutions
+ * Driver requirement: i915, xe
+ * Functionality: plane, tiling
+ * Mega feature: General Display Features
+ * Test category: functionality test
  */
 
 #include "igt.h"
@@ -41,18 +45,11 @@
  * SUBTEST: tiling-none
  * Description: Tests the visibility of the planes when switching between high
  *              and low resolution with Linear buffer (no tiling)
- * Driver requirement: i915, xe
  * Functionality: plane
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: tiling-%s
  * Description: Tests the visibility of the planes when switching between high
  *              and low resolution with %arg[1]
- * Driver requirement: i915, xe
- * Functionality: plane, tiling
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
index 6239e225a..6bffb1f68 100644
--- a/tests/kms_plane_multiple.c
+++ b/tests/kms_plane_multiple.c
@@ -26,6 +26,10 @@
  * TEST: kms plane multiple
  * Category: Display
  * Description: Test atomic mode setting with multiple planes.
+ * Driver requirement: i915, xe
+ * Functionality: plane, tiling
+ * Mega feature: General Display Features
+ * Test category: functionality test
  */
 
 #include "igt.h"
@@ -41,19 +45,12 @@
  * Description: Check that the kernel handles atomic updates of multiple planes
  *              correctly by changing their geometry and making sure the changes
  *              are reflected immediately after each commit.
- * Driver requirement: i915, xe
  * Functionality: plane
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: tiling-%s
  * Description: Check that the kernel handles atomic updates of multiple planes
  *              correctly by changing their geometry and making sure the changes
  *              are reflected immediately after each commit.
- * Driver requirement: i915, xe
- * Functionality: plane, tiling
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index e175c75d8..acb4a1da1 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -26,6 +26,10 @@
  * TEST: kms plane scaling
  * Category: Display
  * Description: Test display plane scaling
+ * Driver requirement: i915, xe
+ * Functionality: plane, scaling
+ * Mega feature: General Display Features
+ * Test category: functionality test
  */
 
 #include "igt.h"
@@ -35,24 +39,12 @@
 /**
  * SUBTEST: plane-scaler-unity-scaling-with-modifiers
  * Description: Tests scaling with modifiers, unity scaling.
- * Driver requirement: i915, xe
- * Functionality: plane, scaling
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: plane-scaler-with-clipping-clamping-modifiers
  * Description: Tests scaling with clipping and clamping, modifiers.
- * Driver requirement: i915, xe
- * Functionality: plane, scaling
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: plane-upscale-%s-with-modifiers
  * Description: Tests upscaling with modifiers %arg[1].
- * Driver requirement: i915, xe
- * Functionality: plane, scaling
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -63,10 +55,6 @@
 /**
  * SUBTEST: plane-downscale-factor-%s-with-modifiers
  * Description: Tests downscaling with modifiers for %arg[1] scaling factor.
- * Driver requirement: i915, xe
- * Functionality: plane, scaling
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -78,24 +66,12 @@
 /**
  * SUBTEST: plane-scaler-unity-scaling-with-rotation
  * Description: Tests scaling with rotation, unity scaling.
- * Driver requirement: i915, xe
- * Functionality: plane, scaling
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: plane-scaler-with-clipping-clamping-rotation
  * Description: Tests scaling with clipping and clamping, rotation.
- * Driver requirement: i915, xe
- * Functionality: plane, scaling
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: plane-upscale-%s-with-rotation
  * Description: Tests upscaling with rotation %arg[1].
- * Driver requirement: i915, xe
- * Functionality: plane, scaling
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -106,10 +82,6 @@
 /**
  * SUBTEST: plane-downscale-factor-%s-with-rotation
  * Description: Tests downscaling with rotation for %arg[1] scaling factor.
- * Driver requirement: i915, xe
- * Functionality: plane, scaling
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -121,24 +93,15 @@
 /**
  * SUBTEST: plane-scaler-unity-scaling-with-pixel-format
  * Description: Tests scaling with pixel formats, unity scaling.
- * Driver requirement: i915, xe
  * Functionality: pixel_formats, plane, scaling
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: plane-scaler-with-clipping-clamping-pixel-formats
  * Description: Tests scaling with clipping and clamping, pixel formats.
- * Driver requirement: i915, xe
  * Functionality: pixel_formats, plane, scaling
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: plane-upscale-%s-with-pixel-format
  * Description: Tests upscaling with pixel formats %arg[1].
- * Driver requirement: i915, xe
  * Functionality: pixel_formats, plane, scaling
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -149,10 +112,7 @@
 /**
  * SUBTEST: plane-downscale-factor-%s-with-pixel-format
  * Description: Tests downscaling with pixel formats for %arg[1] scaling factor.
- * Driver requirement: i915, xe
  * Functionality: pixel_formats, plane, scaling
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -164,10 +124,6 @@
 /**
  * SUBTEST: planes-downscale-factor-%s
  * Description: Tests downscaling of 2 planes for %arg[1] scaling factor.
- * Driver requirement: i915, xe
- * Functionality: plane, scaling
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -180,10 +136,6 @@
  * SUBTEST: planes-downscale-factor-%s-%s
  * Description: Tests downscaling (scaling factor %arg[1]) and upscaling (%arg[2])
  *              of 2 planes.
- * Driver requirement: i915, xe
- * Functionality: plane, scaling
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -201,17 +153,9 @@
 /**
  * SUBTEST: planes-scaler-unity-scaling
  * Description: Tests scaling of 2 planes, unity scaling.
- * Driver requirement: i915, xe
- * Functionality: plane, scaling
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: planes-upscale-%s
  * Description: Tests upscaling of 2 planes %arg[1].
- * Driver requirement: i915, xe
- * Functionality: plane, scaling
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -223,10 +167,6 @@
  * SUBTEST: planes-%s-downscale-factor-%s
  * Description: Tests scaling (%arg[1]) and downscaling (scaling factor %arg[2])
  *              of 2 planes.
- * Driver requirement: i915, xe
- * Functionality: plane, scaling
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -244,31 +184,15 @@
 /**
  * SUBTEST: invalid-num-scalers
  * Description: Negative test for number of scalers per pipe.
- * Driver requirement: i915, xe
- * Functionality: plane, scaling
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: 2x-scaler-multi-pipe
  * Description: Tests scaling with multi-pipe.
- * Driver requirement: i915, xe
- * Functionality: plane, scaling
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: invalid-parameters
  * Description: Test parameters which should not be accepted
- * Driver requirement: i915, xe
- * Functionality: plane, scaling
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: intel-max-src-size
  * Description: Test for validating max source size.
- * Driver requirement: i915, xe
- * Functionality: plane, scaling
- * Mega feature: General Display Features
- * Test category: functionality test
  */
 
 IGT_TEST_DESCRIPTION("Test display plane scaling");
diff --git a/tests/kms_prime.c b/tests/kms_prime.c
index 1e985fdc4..135c75168 100644
--- a/tests/kms_prime.c
+++ b/tests/kms_prime.c
@@ -25,6 +25,10 @@
  * TEST: kms prime
  * Category: Display
  * Description: Prime tests, focusing on KMS side
+ * Driver requirement: i915, xe
+ * Functionality: hybrid, kms_gem_interop
+ * Mega feature: General Display Features
+ * Test category: functionality test
  */
 
 #include "igt.h"
@@ -40,25 +44,14 @@
 /**
  * SUBTEST: D3hot
  * Description: Validate pci state of dGPU when dGPU is idle and  scanout is on iGPU
- * Driver requirement: i915, xe
- * Functionality: hybrid, kms_gem_interop
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: basic-modeset-hybrid
  * Description: Basic modeset on the one device when the other device is active
- * Driver requirement: i915, xe
- * Functionality: hybrid, kms_gem_interop
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: basic-crc-%s
  * Description: Make a dumb color buffer, export to another device and compare
  *              the CRCs with a buffer native to that device
- * Driver requirement: i915, xe
  * Functionality: crc, hybrid, kms_gem_interop
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
diff --git a/tests/kms_prop_blob.c b/tests/kms_prop_blob.c
index 199c673e3..7e7924618 100644
--- a/tests/kms_prop_blob.c
+++ b/tests/kms_prop_blob.c
@@ -29,6 +29,10 @@
  * TEST: kms prop blob
  * Category: Display
  * Description: Tests behaviour of mass-data 'blob' properties.
+ * Driver requirement: i915, xe
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
  */
 
 #include "igt.h"
@@ -40,17 +44,9 @@
 /**
  * SUBTEST: blob-multiple
  * Description: Test validates destroying multiple properties explicitly works as needed.
- * Driver requirement: i915, xe
- * Functionality: kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: blob-prop-%s
  * Description: Tests validates the %arg[1] of the properties created.
- * Driver requirement: i915, xe
- * Functionality: kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -62,17 +58,9 @@
 /**
  * SUBTEST: basic
  * Description: Test to ensure property support exists
- * Driver requirement: i915, xe
- * Test category: functionality test
- * Functionality: kms_core
- * Mega feature: General Display Features
  *
  * SUBTEST: invalid-%s-%s
  * Description: Tests error handling when invalid properties are %ar[1] with %arg[2].
- * Driver requirement: i915, xe
- * Functionality: kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index 33c4156bf..bd414f534 100644
--- a/tests/kms_properties.c
+++ b/tests/kms_properties.c
@@ -25,6 +25,10 @@
  * TEST: kms properties
  * Category: Display
  * Description: Test to validate the properties of all planes, crtc and connectors
+ * Driver requirement: i915, xe
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
  */
 
 #include "igt.h"
@@ -38,10 +42,6 @@
 /**
  * SUBTEST: %s-properties-%s
  * Description: Tests %arg[1] properties with %arg[2] commit
- * Driver requirement: i915, xe
- * Functionality: kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -60,10 +60,6 @@
  * SUBTEST: get_properties-sanity-%s
  * Description: Test validates the properties of all planes, crtc and connectors
  *              with %arg[1] commit
- * Driver requirement: i915, xe
- * Functionality: kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
diff --git a/tests/kms_rmfb.c b/tests/kms_rmfb.c
index c102c9583..39e8bbd55 100644
--- a/tests/kms_rmfb.c
+++ b/tests/kms_rmfb.c
@@ -26,6 +26,10 @@
  * Category: Display
  * Description: This tests rmfb and close-fd behavior. In these casesthe
  *              framebuffers should be removed from the crtc.
+ * Driver requirement: i915, xe
+ * Functionality: kms_gem_interop
+ * Mega feature: General Display Features
+ * Test category: functionality test
  */
 
 #include "igt.h"
@@ -40,18 +44,10 @@
  * SUBTEST: close-fd
  * Description: RMFB is supposed to free the framebuffers from any and all planes
  *              so test this and make sure it works with fd close and reopen.
- * Driver requirement: i915, xe
- * Functionality: kms_gem_interop
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: rmfb-ioctl
  * Description: RMFB is supposed to free the framebuffers from any and all planes
  *              so test this and make sure it works.
- * Driver requirement: i915, xe
- * Functionality: kms_gem_interop
- * Mega feature: General Display Features
- * Test category: functionality test
  */
 
 #ifndef DRM_CAP_CURSOR_WIDTH
diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index bb082af68..8d8c53b5f 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -26,6 +26,10 @@
  * TEST: kms rotation crc
  * Category: Display
  * Description: Tests different rotations with different planes & formats
+ * Driver requirement: i915, xe
+ * Functionality: plane, rotation
+ * Mega feature: General Display Features
+ * Test category: functionality test
  */
 
 #include "igt.h"
@@ -35,10 +39,6 @@
 /**
  * SUBTEST: %s-rotation-180
  * Description: Rotation test with 180 degree for %arg[1] planes
- * Driver requirement: i915, xe
- * Functionality: plane, rotation
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -50,10 +50,6 @@
 /**
  * SUBTEST: %s-rotation-%d
  * Description: Rotation test with %arg[2] degree for %arg[1] planes of gen9+
- * Driver requirement: i915, xe
- * Functionality: plane, rotation
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -66,33 +62,19 @@
 /**
  * SUBTEST: bad-pixel-format
  * Description: Checking unsupported pixel format for gen9+ with 90 degree of rotation
- * Driver requirement: i915, xe
- * Functionality: plane, rotation
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: bad-tiling
  * Description: Checking unsupported tiling for gen9+ with 90 degree of rotation
- * Driver requirement: i915, xe
  * Functionality: plane, rotation, tiling
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: exhaust-fences
  * Description: This test intends to check for fence leaks exhaustively
- * Driver requirement: i915
- * Functionality: plane, rotation
- * Mega feature: General Display Features
- * Test category: functionality test
  */
 
 /**
  * SUBTEST: primary-%s-tiled-reflect-x-%d
  * Description: Test for %arg[1] & %arg[2] degree rotation on primary plane
- * Driver requirement: i915, xe
  * Functionality: plane, rotation, tiling
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -107,10 +89,7 @@
 /**
  * SUBTEST: primary-%s-tiled-reflect-x-%d
  * Description: Test for %arg[1] & %arg[2] degree rotation on primary plane
- * Driver requirement: i915, xe
  * Functionality: plane, rotation, tiling
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -121,27 +100,15 @@
  *
  * SUBTEST: sprite-rotation-90-pos-100-0
  * Description: Rotation test with 90 degree for a plane of gen9+ with given position
- * Driver requirement: i915, xe
- * Functionality: plane, rotation
- * Mega feature: General Display Features
- * Test category: functionality test
  */
 
 /**
  * SUBTEST: multiplane-rotation
  * Description: Rotation test on both planes by making them fully visible
- * Driver requirement: i915, xe
- * Functionality: plane, rotation
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: multiplane-rotation-cropping-%s
  * Description: Rotation test on both planes by cropping left/%arg[1] corner of
  *              primary plane and right/%arg[1] corner of sprite plane
- * Driver requirement: i915, xe
- * Functionality: plane, rotation
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
diff --git a/tests/kms_scaling_modes.c b/tests/kms_scaling_modes.c
index 960e7d84b..add6e77c9 100644
--- a/tests/kms_scaling_modes.c
+++ b/tests/kms_scaling_modes.c
@@ -28,6 +28,10 @@
  * TEST: kms scaling modes
  * Category: Display
  * Description: Test display scaling modes
+ * Driver requirement: i915, xe
+ * Functionality: eDP, plane, scaling
+ * Mega feature: General Display Features
+ * Test category: functionality test
  */
 
 #include "igt.h"
@@ -35,10 +39,6 @@
 /**
  * SUBTEST: scaling-mode-%s
  * Description: Tests %arg[1] display scaling mode
- * Driver requirement: i915, xe
- * Functionality: eDP, plane, scaling
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
diff --git a/tests/kms_selftest.c b/tests/kms_selftest.c
index 30fc58d90..0ecb825db 100644
--- a/tests/kms_selftest.c
+++ b/tests/kms_selftest.c
@@ -25,6 +25,10 @@
  * TEST: kms selftest
  * Category: Display
  * Description: Basic sanity check of KMS selftests.
+ * Driver requirement: i915, xe
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
  */
 
 #include "igt.h"
@@ -33,10 +37,6 @@
 /**
  * SUBTEST: %s
  * Description: Basic sanity check of KMS selftest %arg[1].
- * Driver requirement: i915, xe
- * Functionality: kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
diff --git a/tests/kms_sequence.c b/tests/kms_sequence.c
index 7dbcca643..23867d1aa 100644
--- a/tests/kms_sequence.c
+++ b/tests/kms_sequence.c
@@ -26,6 +26,10 @@
  * TEST: kms sequence
  * Category: Display
  * Description: Test CrtcGetSequence and CrtcQueueSequence.
+ * Driver requirement: i915, xe
+ * Functionality: vblank
+ * Mega feature: General Display Features
+ * Test category: functionality test
  */
 
 #include "igt.h"
@@ -46,10 +50,6 @@
 /**
  * SUBTEST: get-%s
  * Description: This is a test of drmCrtcGetSequence with %arg[1]
- * Driver requirement: i915, xe
- * Functionality: vblank
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
@@ -62,10 +62,6 @@
 /**
  * SUBTEST: queue-%s
  * Description: This is a test of drmCrtcQueueSequence with %arg[1]
- * Driver requirement: i915, xe
- * Functionality: vblank
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index 7fd1667d7..490bfd3dd 100644
--- a/tests/kms_setmode.c
+++ b/tests/kms_setmode.c
@@ -26,6 +26,10 @@
  * Category: Display
  * Description: Tests the mode by iterating through all valid/invalid crtc/connector
  *              combinations
+ * Driver requirement: i915, xe
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
  */
 
 #include "config.h"
@@ -46,50 +50,27 @@
  * SUBTEST: basic
  * Description: Tests the vblank timing by iterating through all valid crtc/connector
  *              combinations
- * Driver requirement: i915, xe
  * Functionality: kms_core, vblank
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: basic-clone-single-crtc
  * Description: Test allows the use of a single CRTC for two connectors, such as VGA/HDMI,
  *		VGA/DP, and HDMI/HDMI
- * Driver requirement: i915, xe
- * Functionality: kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: clone-exclusive-crtc
  * Description: Tests the mode by cloning the exclusive crtc by iterating through
  *              all valid crtc/connector combinations
- * Driver requirement: i915, xe
- * Functionality: kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: invalid-clone-exclusive-crtc
  * Description: Test is allowed when a connector uses CRTC that is not compatible with the
  *		connector, for instance, DP/HDMI can be used on certain pipes only on older platforms
- * Driver requirement: i915, xe
- * Functionality: kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: invalid-clone-single-crtc
  * Description: Tests the mode by cloning the single crtc by iterating through all
  *              invalid crtc/connector combinations
- * Driver requirement: i915, xe
- * Functionality: kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: invalid-clone-single-crtc-stealing
  * Description: Tests the stealing mode by cloning the single crtc by iterating
  *              through all invalid crtc/connector combinations
- * Driver requirement: i915, xe
- * Functionality: kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  */
 
 #define MAX_CONNECTORS  10
diff --git a/tests/kms_tiled_display.c b/tests/kms_tiled_display.c
index a094f4df3..3ffd6a9a4 100644
--- a/tests/kms_tiled_display.c
+++ b/tests/kms_tiled_display.c
@@ -40,6 +40,9 @@
  * TEST: kms tiled display
  * Category: Display
  * Description: Test for Transcoder Port Sync for Display Port Tiled Displays
+ * Driver requirement: i915, xe
+ * Mega feature: General Display Features
+ * Test category: functionality test
  */
 
 #include "igt.h"
@@ -52,18 +55,12 @@
  * SUBTEST: basic-test-pattern
  * Description: Make sure the Tiled CRTCs are synchronized and we get page flips
  *              for all tiled CRTCs in one vblank (executes on real panel).
- * Driver requirement: i915, xe
  * Functionality: tiled_display
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: basic-test-pattern-with-chamelium
  * Description: Make sure the Tiled CRTCs are synchronized and we get page flips
  *              for all tiled CRTCs in one vblank (executes on chamelium).
- * Driver requirement: i915, xe
  * Functionality: chamelium, tiled_display
- * Mega feature: General Display Features
- * Test category: functionality test
  */
 
 IGT_TEST_DESCRIPTION("Test for genlocked CRTCs with tiled displays");
diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
index b79b3d3e3..6a39f93cc 100644
--- a/tests/kms_universal_plane.c
+++ b/tests/kms_universal_plane.c
@@ -25,6 +25,10 @@
  * TEST: kms universal plane
  * Category: Display
  * Description: Check pageflip & modeset on universal plane
+ * Driver requirement: i915, xe
+ * Functionality: plane
+ * Mega feature: General Display Features
+ * Test category: functionality test
  */
 
 #include "igt.h"
@@ -37,32 +41,17 @@
 /**
  * SUBTEST: cursor-fb-leak
  * Description: Check for cursor leaks after performing cursor operations
- * Driver requirement: i915, xe
  * Functionality: cursor, plane
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: disable-primary-vs-flip
  * Description: Check pageflips while primary plane is disabled before IOCTL or
  *              between IOCTL and pageflip execution
- * Driver requirement: i915, xe
- * Functionality: plane
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: universal-plane-pageflip-windowed
  * Description: Check if pageflip succeeds in windowed setting
- * Driver requirement: i915, xe
- * Functionality: plane
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: universal-plane-%s
  * Description: Check %arg[1]
- * Driver requirement: i915, xe
- * Functionality: plane
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
index 5994e682c..956ba483a 100644
--- a/tests/kms_vblank.c
+++ b/tests/kms_vblank.c
@@ -25,6 +25,9 @@
  * TEST: kms vblank
  * Category: Display
  * Description: Test speed of WaitVblank.
+ * Driver requirement: i915, xe
+ * Mega feature: General Display Features
+ * Test category: functionality test
  */
 
 #include "igt.h"
@@ -45,71 +48,44 @@
 /**
  * SUBTEST: crtc-id
  * Description: Check the vblank and flip events works with given crtc id
- * Driver requirement: i915, xe
  * Functionality: vblank
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: invalid
  * Description: Negative test for vblank request
- * Driver requirement: i915, xe
  * Functionality: vblank
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: ts-continuation-dpms-rpm
  * Description: Test TS continuty with DPMS & RPM while hanging by introducing
  *              NOHANG flag
- * Driver requirement: i915, xe
  * Functionality: dpms, hang, rpm, vblank
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: ts-continuation-dpms-suspend
  * Description: Test TS continuty with DPMS & Suspend while hanging by introducing
  *              NOHANG flag
- * Driver requirement: i915, xe
  * Functionality: dpms, hang, suspend, vblank
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: ts-continuation-suspend
  * Description: Test TS continuty with Suspend while hanging by introducing NOHANG
  *              flag
- * Driver requirement: i915, xe
  * Functionality: hang, suspend, vblank
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: ts-continuation-modeset-rpm
  * Description: Test TS continuty during Modeset with Suspend while hanging by
  *              introducing NOHANG flag
- * Driver requirement: i915, xe
  * Functionality: hang, rpm, vblank
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: accuracy-idle
  * Description: Test Accuracy of vblank events while hanging by introducing NOHANG
  *              flag
- * Driver requirement: i915, xe
  * Functionality: hang, vblank
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: %s
  * Description: Test %arg[1] while hanging by introducing NOHANG flag
- * Driver requirement: i915, xe
  * Functionality: hang, vblank
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: %s-hang
  * Description: Test %arg[1] with injected hang is working properly
- * Driver requirement: i915, xe
  * Functionality: hang, vblank
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * arg[1]:
  *
diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 23aebb0f2..13b347631 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -24,6 +24,10 @@
  * TEST: kms vrr
  * Category: Display
  * Description: Test to validate diffent features of VRR
+ * Driver requirement: i915, xe
+ * Functionality: adaptive_sync
+ * Mega feature: VRR
+ * Test category: functionality test
  */
 
 #include "igt.h"
@@ -35,40 +39,22 @@
  * SUBTEST: flip-basic
  * Description: Tests that VRR is enabled and that the difference between flip
  *              timestamps converges to the requested rate
- * Driver requirement: i915, xe
- * Functionality: adaptive_sync
- * Mega feature: VRR
- * Test category: functionality test
  *
  * SUBTEST: flip-dpms
  * Description: Tests with DPMS that VRR is enabled and that the difference
  *              between flip timestamps converges to the requested rate.
- * Driver requirement: i915, xe
  * Functionality: adaptive_sync, dpms
- * Mega feature: VRR
- * Test category: functionality test
  *
  * SUBTEST: flip-suspend
  * Description: Tests that VRR is enabled and that the difference between flip
  *              timestamps converges to the requested rate in a suspend test
- * Driver requirement: i915, xe
  * Functionality: adaptive_sync, suspend
- * Mega feature: VRR
- * Test category: functionality test
  *
  * SUBTEST: flipline
  * Description: Make sure that flips happen at flipline decision boundary.
- * Driver requirement: i915, xe
- * Functionality: adaptive_sync
- * Mega feature: VRR
- * Test category: functionality test
  *
  * SUBTEST: negative-basic
  * Description: Make sure that VRR should not be enabled on the Non-VRR panel.
- * Driver requirement: i915, xe
- * Functionality: adaptive_sync
- * Mega feature: VRR
- * Test category: functionality test
  */
 
 #define NSECS_PER_SEC (1000000000ull)
diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index 6b436b7ab..f95d71166 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -29,6 +29,10 @@
  *              connectors feature by checking if the target device support
  *              writeback; it validates bad and good combination, check color
  *              format, and check the output result by using CRC.
+ * Driver requirement: i915, xe
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
  */
 
 #include <errno.h>
@@ -45,45 +49,23 @@
 /**
  * SUBTEST: writeback-check-output-XRGB2101010
  * Description: Check XRGB2101010 writeback output with CRC validation
- * Functionality: kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: writeback-check-output
  * Description: Check writeback output with CRC validation
- * Driver requirement: i915, xe
- * Functionality: kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: writeback-fb-id-XRGB2101010
  * Description: Validate WRITEBACK_FB_ID with valid and invalid options
- * Functionality: kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: writeback-fb-id
  * Description: Validate WRITEBACK_FB_ID with valid and invalid options
- * Driver requirement: i915, xe
- * Functionality: kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: writeback-invalid-parameters
  * Description: Writeback has a couple of parameters linked together(output
  *              framebuffer and fence); this test goes throughthe combination
  *              of possible bad options
- * Driver requirement: i915, xe
- * Functionality: kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  *
  * SUBTEST: writeback-pixel-formats
  * Description: Check the writeback format
- * Driver requirement: i915, xe
- * Functionality: kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
  */
 
 IGT_TEST_DESCRIPTION(
-- 
2.40.0
