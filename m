Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF02710E03C
 for <igt-dev@lists.freedesktop.org>; Sat, 25 Nov 2023 16:30:29 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	swati2.sharma@intel.com
Date: Sat, 25 Nov 2023 21:50:09 +0530
Message-Id: <20231125162013.2421478-2-bhanuprakash.modem@intel.com>
In-Reply-To: <20231125162013.2421478-1-bhanuprakash.modem@intel.com>
References: <20231125162013.2421478-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 1/5] tests/kms/testplan: Move testplan
 documentation to beginning of the file
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

To maintain the uniformness, move testplan documentation
to beginning of the file.

Move TEST block to before the #includes, and SUBTEST block
to after the #includes.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/chamelium/kms_chamelium_audio.c  |   74 +-
 tests/chamelium/kms_chamelium_color.c  |   59 +-
 tests/chamelium/kms_chamelium_edid.c   |  199 +-
 tests/chamelium/kms_chamelium_frames.c |  208 +-
 tests/chamelium/kms_chamelium_hpd.c    |  425 +-
 tests/intel/kms_big_fb.c               |  320 +-
 tests/intel/kms_big_joiner.c           |   50 +-
 tests/intel/kms_busy.c                 |  108 +-
 tests/intel/kms_ccs.c                  |    1 +
 tests/intel/kms_cdclk.c                |   49 +-
 tests/intel/kms_dirtyfb.c              |   24 +-
 tests/intel/kms_draw_crc.c             |   81 +-
 tests/intel/kms_dsc.c                  |    1 +
 tests/intel/kms_fb_coherency.c         |   21 +-
 tests/intel/kms_fbcon_fbt.c            |   12 +-
 tests/intel/kms_fence_pin_leak.c       |   11 +-
 tests/intel/kms_flip_scaled_crc.c      |    1 +
 tests/intel/kms_flip_tiling.c          |   11 +-
 tests/intel/kms_frontbuffer_tracking.c | 7361 ++++++++++++------------
 tests/intel/kms_legacy_colorkey.c      |   10 +-
 tests/intel/kms_mmap_write_crc.c       |   13 +-
 tests/intel/kms_pipe_b_c_ivb.c         |    7 +-
 tests/intel/kms_pm_backlight.c         |   11 +-
 tests/intel/kms_pm_dc.c                |   10 +-
 tests/intel/kms_pm_lpsp.c              |   11 +-
 tests/intel/kms_psr.c                  |   68 +-
 tests/intel/kms_psr2_sf.c              |   13 +-
 tests/intel/kms_psr2_su.c              |   11 +-
 tests/intel/kms_psr_stress_test.c      |   10 +-
 tests/intel/kms_pwrite_crc.c           |   10 +-
 tests/kms_3d.c                         |    9 +-
 tests/kms_addfb_basic.c                |  411 +-
 tests/kms_async_flips.c                |  100 +-
 tests/kms_atomic.c                     |  176 +-
 tests/kms_atomic_interruptible.c       |  100 +-
 tests/kms_atomic_transition.c          |  179 +-
 tests/kms_bw.c                         |   11 +-
 tests/kms_color.c                      |  140 +-
 tests/kms_concurrent.c                 |    9 +-
 tests/kms_content_protection.c         |  141 +-
 tests/kms_cursor_crc.c                 |  141 +-
 tests/kms_cursor_edge_walk.c           |   13 +-
 tests/kms_cursor_legacy.c              |  493 +-
 tests/kms_display_modes.c              |   37 +-
 tests/kms_dither.c                     |   32 +-
 tests/kms_dp_aux_dev.c                 |   11 +-
 tests/kms_feature_discovery.c          |   22 +-
 tests/kms_flip.c                       |   93 +-
 tests/kms_flip_event_leak.c            |   10 +-
 tests/kms_force_connector_basic.c      |   62 +-
 tests/kms_getfb.c                      |  161 +-
 tests/kms_hdmi_inject.c                |   14 +-
 tests/kms_hdr.c                        |  127 +-
 tests/kms_invalid_mode.c               |    1 +
 tests/kms_multipipe_modeset.c          |    7 +-
 tests/kms_panel_fitting.c              |   11 +-
 tests/kms_pipe_crc_basic.c             |  149 +-
 tests/kms_plane.c                      |  131 +-
 tests/kms_plane_alpha_blend.c          |   94 +-
 tests/kms_plane_cursor.c               |    8 +-
 tests/kms_plane_lowres.c               |   50 +-
 tests/kms_plane_multiple.c             |   54 +-
 tests/kms_plane_scaling.c              |  476 +-
 tests/kms_prime.c                      |   11 +-
 tests/kms_prop_blob.c                  |   96 +-
 tests/kms_properties.c                 |   39 +-
 tests/kms_rmfb.c                       |   13 +-
 tests/kms_rotation_crc.c               |  237 +-
 tests/kms_scaling_modes.c              |    7 +-
 tests/kms_selftest.c                   |    9 +-
 tests/kms_sequence.c                   |   60 +-
 tests/kms_setmode.c                    |   13 +-
 tests/kms_sysfs_edid_timing.c          |   12 +-
 tests/kms_tiled_display.c              |    1 +
 tests/kms_tv_load_detect.c             |    7 +-
 tests/kms_universal_plane.c            |   14 +-
 tests/kms_vblank.c                     |   31 +-
 tests/kms_vrr.c                        |   11 +-
 tests/kms_writeback.c                  |   17 +-
 tests/testdisplay.c                    |   12 +-
 80 files changed, 6697 insertions(+), 6556 deletions(-)

diff --git a/tests/chamelium/kms_chamelium_audio.c b/tests/chamelium/kms_chamelium_audio.c
index 34ba0cb64..f86610861 100644
--- a/tests/chamelium/kms_chamelium_audio.c
+++ b/tests/chamelium/kms_chamelium_audio.c
@@ -24,14 +24,48 @@
  *    Lyude Paul <lyude@redhat.com>
  */
 
+/**
+ * TEST: kms chamelium audio
+ * Category: Display
+ * Description: Testing Audio with a Chamelium board
+ */
+
 #include "igt_eld.h"
 #include "igt_infoframe.h"
 #include "kms_chamelium_helper.h"
 
 /**
- * TEST: kms chamelium audio
- * Category: Display
- * Description: Testing Audio with a Chamelium board
+ * SUBTEST: dp-audio
+ * Description: Playback various audio signals with various audio formats/rates,
+ *              capture them and check they are correct
+ * Driver requirement: i915, xe
+ * Functionality: chamelium, dp_audio
+ * Mega feature: Audio, DP
+ * Test category: functionality test
+ *
+ * SUBTEST: hdmi-audio
+ * Description: Playback various audio signals with various audio formats/rates,
+ *              capture them and check they are correct
+ * Driver requirement: i915, xe
+ * Functionality: chamelium, hdmi_audio
+ * Mega feature: Audio, HDMI
+ * Test category: functionality test
+ *
+ * SUBTEST: dp-audio-edid
+ * Description: Plug a connector with an EDID suitable for audio, check ALSA's
+ *              EDID-Like Data reports the correct audio parameters
+ * Driver requirement: i915, xe
+ * Functionality: chamelium, dp_audio
+ * Mega feature: Audio, DP
+ * Test category: functionality test
+ *
+ * SUBTEST: hdmi-audio-edid
+ * Description: Plug a connector with an EDID suitable for audio, check ALSA's
+ *              EDID-Like Data reports the correct audio parameters
+ * Driver requirement: i915, xe
+ * Functionality: chamelium, hdmi_audio
+ * Mega feature: Audio, HDMI
+ * Test category: functionality test
  */
 
 /* Playback parameters control the audio signal we synthesize and send */
@@ -675,23 +709,6 @@ static bool check_audio_configuration(struct alsa *alsa,
 	return true;
 }
 
-/**
- * SUBTEST: dp-audio
- * Description: Playback various audio signals with various audio formats/rates,
- *              capture them and check they are correct
- * Functionality: chamelium, dp_audio
- * Mega feature: Audio, DP
- * Test category: functionality test
- * Driver requirement: i915, xe
- *
- * SUBTEST: hdmi-audio
- * Description: Playback various audio signals with various audio formats/rates,
- *              capture them and check they are correct
- * Functionality: chamelium, hdmi_audio
- * Mega feature: Audio, HDMI
- * Test category: functionality test
- * Driver requirement: i915, xe
- */
 static const char test_display_audio_desc[] =
 	"Playback various audio signals with various audio formats/rates, "
 	"capture them and check they are correct";
@@ -786,23 +803,6 @@ static void test_display_audio(chamelium_data_t *data,
 	free(alsa);
 }
 
-/**
- * SUBTEST: dp-audio-edid
- * Description: Plug a connector with an EDID suitable for audio, check ALSA's
- *              EDID-Like Data reports the correct audio parameters
- * Functionality: chamelium, dp_audio
- * Mega feature: Audio, DP
- * Test category: functionality test
- * Driver requirement: i915, xe
- *
- * SUBTEST: hdmi-audio-edid
- * Description: Plug a connector with an EDID suitable for audio, check ALSA's
- *              EDID-Like Data reports the correct audio parameters
- * Functionality: chamelium, hdmi_audio
- * Mega feature: Audio, HDMI
- * Test category: functionality test
- * Driver requirement: i915, xe
- */
 static const char test_display_audio_edid_desc[] =
 	"Plug a connector with an EDID suitable for audio, check ALSA's "
 	"EDID-Like Data reports the correct audio parameters";
diff --git a/tests/chamelium/kms_chamelium_color.c b/tests/chamelium/kms_chamelium_color.c
index 0a9788214..6123e8a5f 100644
--- a/tests/chamelium/kms_chamelium_color.c
+++ b/tests/chamelium/kms_chamelium_color.c
@@ -30,16 +30,43 @@
 
 #include "kms_color_helper.h"
 
-IGT_TEST_DESCRIPTION("Test Color Features at Pipe level using Chamelium to verify instead of CRC");
-
 /**
  * SUBTEST: degamma
  * Description: Verify that degamma LUT transformation works correctly
+ * Driver requirement: i915, xe
  * Functionality: chamelium, colorspace
  * Mega feature: Color mgmt
  * Test category: functionality test
+ *
+ * SUBTEST: gamma
+ * Description: Verify that gamma LUT transformation works correctly
  * Driver requirement: i915, xe
+ * Functionality: chamelium, colorspace
+ * Mega feature: Color mgmt
+ * Test category: functionality test
+ *
+ * SUBTEST: ctm-%s
+ * Description: Check the color transformation %arg[1]
+ * Driver requirement: i915, xe
+ * Functionality: chamelium, colorspace
+ * Mega feature: Color mgmt
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @0-25:            for 0.25 transparancy
+ * @0-50:            for 0.50 transparancy
+ * @0-75:            for 0.75 transparancy
+ * @blue-to-red:     from blue to red
+ * @green-to-red:    from green to red
+ * @limited-range:   with identity matrix
+ * @max:             for max transparancy
+ * @negative:        for negative transparancy
+ * @red-to-blue:     from red to blue
  */
+
+IGT_TEST_DESCRIPTION("Test Color Features at Pipe level using Chamelium to verify instead of CRC");
+
 /*
  * Draw 3 gradient rectangles in red, green and blue, with a maxed out
  * degamma LUT and verify we have the same frame dump as drawing solid color
@@ -129,14 +156,6 @@ static bool test_pipe_degamma(data_t *data,
 	return ret;
 }
 
-/**
- * SUBTEST: gamma
- * Description: Verify that gamma LUT transformation works correctly
- * Functionality: chamelium, colorspace
- * Mega feature: Color mgmt
- * Test category: functionality test
- * Driver requirement: i915, xe
- */
 /*
  * Draw 3 gradient rectangles in red, green and blue, with a maxed out
  * gamma LUT and verify we have the same frame dump as drawing solid
@@ -487,26 +506,6 @@ run_gamma_degamma_tests_for_pipe(data_t *data, enum pipe p,
 		igt_assert(test_t(data, data->primary, data->ports[port_idx]));
 }
 
-/**
- * SUBTEST: ctm-%s
- * Description: Check the color transformation %arg[1]
- * Functionality: chamelium, colorspace
- * Mega feature: Color mgmt
- * Test category: functionality test
- * Driver requirement: i915, xe
- *
- * arg[1]:
- *
- * @0-25:            for 0.25 transparancy
- * @0-50:            for 0.50 transparancy
- * @0-75:            for 0.75 transparancy
- * @blue-to-red:     from blue to red
- * @green-to-red:    from green to red
- * @limited-range:   with identity matrix
- * @max:             for max transparancy
- * @negative:        for negative transparancy
- * @red-to-blue:     from red to blue
- */
 static void
 run_ctm_tests_for_pipe(data_t *data, enum pipe p,
 		       color_t *expected_colors,
diff --git a/tests/chamelium/kms_chamelium_edid.c b/tests/chamelium/kms_chamelium_edid.c
index de8e51a04..f3f0b1e50 100644
--- a/tests/chamelium/kms_chamelium_edid.c
+++ b/tests/chamelium/kms_chamelium_edid.c
@@ -48,6 +48,106 @@
 #include "monitor_edids/hdmi_edids.h"
 #include "monitor_edids/monitor_edids_helper.h"
 
+/**
+ * SUBTEST: dp-edid-read
+ * Description: Make sure the EDID exposed by KMS is the same as the screen's
+ * Driver requirement: i915, xe
+ * Test category: functionality test
+ * Functionality: chamelium, dp_edid
+ * Mega feature: DP
+ *
+ * SUBTEST: hdmi-edid-read
+ * Description: Make sure the EDID exposed by KMS is the same as the screen's
+ * Driver requirement: i915, xe
+ * Test category: functionality test
+ * Functionality: chamelium, hdmi_edid
+ * Mega feature: HDMI
+ *
+ * SUBTEST: vga-edid-read
+ * Description: Make sure the EDID exposed by KMS is the same as the screen's
+ * Driver requirement: i915, xe
+ * Test category: functionality test
+ * Functionality: chamelium, vga_edid
+ * Mega feature: VGA
+ *
+ * SUBTEST: dp-edid-resolution-list
+ * Description: Get an EDID with many modes of different configurations, set
+ *              them on the screen and check the screen resolution matches the
+ *              mode resolution.
+ * Driver requirement: i915, xe
+ * Functionality: chamelium, dp_edid
+ * Mega feature: DP
+ * Test category: functionality test
+ *
+ * SUBTEST: dp-mode-timings
+ * Description: For each mode of the IGT base EDID, perform a modeset and check
+ *              the mode detected by the Chamelium receiver matches the mode we
+ *              set
+ * Driver requirement: i915, xe
+ * Functionality: chamelium, dp_edid
+ * Mega feature: DP
+ * Test category: functionality test
+ *
+ * SUBTEST: hdmi-mode-timings
+ * Description: For each mode of the IGT base EDID, perform a modeset and check
+ *              the mode detected by the Chamelium receiver matches the mode we
+ *              set
+ * Driver requirement: i915, xe
+ * Functionality: chamelium, dp_edid
+ * Mega feature: DP
+ * Test category: functionality test
+ */
+
+/**
+ * SUBTEST: dp-edid-stress-resolution-%s
+ * Description: Stress test the DUT by testing multiple EDIDs, one right after
+ *              the other, and ensure their validity by check the real screen
+ *              resolution vs the advertised mode (%arg[1]) resolution.
+ * Driver requirement: i915, xe
+ * Functionality: chamelium, dp_edid
+ * Mega feature: DP
+ * Test category: functionality test
+ *
+ * SUBTEST: hdmi-edid-stress-resolution-%s
+ * Description: Stress test the DUT by testing multiple EDIDs, one right after
+ *              the other, and ensure their validity by check the real screen
+ *              resolution vs the advertised mode (%arg[1]) resolution.
+ * Driver requirement: i915, xe
+ * Functionality: chamelium, hdmi_edid
+ * Mega feature: HDMI
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @4k:      4K
+ * @non-4k:  Non 4K
+ */
+
+/**
+ * SUBTEST: dp-edid-change-during-%s
+ * Description: Simulate a screen being unplugged and another screen being
+ *              plugged during suspend, check that a uevent is sent and
+ *              connector status is updated during %arg[1]
+ * Driver requirement: i915, xe
+ * Functionality: chamelium, dp_edid
+ * Mega feature: DP
+ * Test category: functionality test
+ *
+ * SUBTEST: hdmi-edid-change-during-%s
+ * Description: Simulate a screen being unplugged and another screen being
+ *              plugged during suspend, check that a uevent is sent and
+ *              connector status is updated during %arg[1]
+ * Driver requirement: i915, xe
+ * Functionality: chamelium, dp_edid
+ * Mega feature: DP
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @hibernate:    hibernation
+ * @suspend:      suspend
+ */
+
 #define MODE_CLOCK_ACCURACY 0.05 /* 5% */
 
 static void get_connectors_link_status_failed(chamelium_data_t *data,
@@ -145,28 +245,6 @@ static void check_mode(struct chamelium *chamelium, struct chamelium_port *port,
 	igt_assert(video_params.vsync_polarity == mode_vsync_polarity);
 }
 
-/**
- * SUBTEST: dp-edid-read
- * Description: Make sure the EDID exposed by KMS is the same as the screen's
- * Test category: functionality test
- * Functionality: chamelium, dp_edid
- * Mega feature: DP
- * Driver requirement: i915, xe
- *
- * SUBTEST: hdmi-edid-read
- * Description: Make sure the EDID exposed by KMS is the same as the screen's
- * Test category: functionality test
- * Functionality: chamelium, hdmi_edid
- * Mega feature: HDMI
- * Driver requirement: i915, xe
- *
- * SUBTEST: vga-edid-read
- * Description: Make sure the EDID exposed by KMS is the same as the screen's
- * Test category: functionality test
- * Functionality: chamelium, vga_edid
- * Mega feature: VGA
- * Driver requirement: i915, xe
- */
 static const char igt_custom_edid_type_read_desc[] =
 	"Make sure the EDID exposed by KMS is the same as the screen's";
 static void igt_custom_edid_type_read(chamelium_data_t *data,
@@ -206,30 +284,6 @@ static void igt_custom_edid_type_read(chamelium_data_t *data,
 	drmModeFreeConnector(connector);
 }
 
-/**
- * SUBTEST: dp-edid-stress-resolution-%s
- * Description: Stress test the DUT by testing multiple EDIDs, one right after
- *              the other, and ensure their validity by check the real screen
- *              resolution vs the advertised mode (%arg[1]) resolution.
- * Test category: functionality test
- * Functionality: chamelium, dp_edid
- * Mega feature: DP
- * Driver requirement: i915, xe
- *
- * SUBTEST: hdmi-edid-stress-resolution-%s
- * Description: Stress test the DUT by testing multiple EDIDs, one right after
- *              the other, and ensure their validity by check the real screen
- *              resolution vs the advertised mode (%arg[1]) resolution.
- * Test category: functionality test
- * Functionality: chamelium, hdmi_edid
- * Mega feature: HDMI
- * Driver requirement: i915, xe
- *
- * arg[1]:
- *
- * @4k:      4K
- * @non-4k:  Non 4K
- */
 static const char igt_edid_stress_resolution_desc[] =
 	"Stress test the DUT by testing multiple EDIDs, one right after the other, "
 	"and ensure their validity by check the real screen resolution vs the "
@@ -299,16 +353,6 @@ static void edid_stress_resolution(chamelium_data_t *data,
 			      data->ports, data->port_count);
 }
 
-/**
- * SUBTEST: dp-edid-resolution-list
- * Description: Get an EDID with many modes of different configurations, set
- *              them on the screen and check the screen resolution matches the
- *              mode resolution.
- * Test category: functionality test
- * Functionality: chamelium, dp_edid
- * Mega feature: DP
- * Driver requirement: i915, xe
- */
 static const char igt_edid_resolution_list_desc[] =
 	"Get an EDID with many modes of different configurations, set them on the screen and check the"
 	" screen resolution matches the mode resolution.";
@@ -372,30 +416,6 @@ static void edid_resolution_list(chamelium_data_t *data,
 	drmModeFreeConnector(connector);
 }
 
-/**
- * SUBTEST: dp-edid-change-during-%s
- * Description: Simulate a screen being unplugged and another screen being
- *              plugged during suspend, check that a uevent is sent and
- *              connector status is updated during %arg[1]
- * Test category: functionality test
- * Functionality: chamelium, dp_edid
- * Mega feature: DP
- * Driver requirement: i915, xe
- *
- * SUBTEST: hdmi-edid-change-during-%s
- * Description: Simulate a screen being unplugged and another screen being
- *              plugged during suspend, check that a uevent is sent and
- *              connector status is updated during %arg[1]
- * Test category: functionality test
- * Functionality: chamelium, dp_edid
- * Mega feature: DP
- * Driver requirement: i915, xe
- *
- * arg[1]:
- *
- * @hibernate:    hibernation
- * @suspend:      suspend
- */
 static const char test_suspend_resume_edid_change_desc[] =
 	"Simulate a screen being unplugged and another screen being plugged "
 	"during suspend, check that a uevent is sent and connector status is "
@@ -448,25 +468,6 @@ static void test_suspend_resume_edid_change(chamelium_data_t *data,
 			    link_status_failed[1][p]);
 }
 
-/**
- * SUBTEST: dp-mode-timings
- * Description: For each mode of the IGT base EDID, perform a modeset and check
- *              the mode detected by the Chamelium receiver matches the mode we
- *              set
- * Test category: functionality test
- * Functionality: chamelium, dp_edid
- * Mega feature: DP
- * Driver requirement: i915, xe
- *
- * SUBTEST: hdmi-mode-timings
- * Description: For each mode of the IGT base EDID, perform a modeset and check
- *              the mode detected by the Chamelium receiver matches the mode we
- *              set
- * Test category: functionality test
- * Functionality: chamelium, dp_edid
- * Mega feature: DP
- * Driver requirement: i915, xe
- */
 static const char test_mode_timings_desc[] =
 	"For each mode of the IGT base EDID, perform a modeset and check the "
 	"mode detected by the Chamelium receiver matches the mode we set";
diff --git a/tests/chamelium/kms_chamelium_frames.c b/tests/chamelium/kms_chamelium_frames.c
index a313cd433..490ab3fe9 100644
--- a/tests/chamelium/kms_chamelium_frames.c
+++ b/tests/chamelium/kms_chamelium_frames.c
@@ -29,10 +29,114 @@
  * Category: Display
  * Description: Tests requiring a Chamelium board
  */
+
 #include "igt_eld.h"
 #include "igt_infoframe.h"
 #include "kms_chamelium_helper.h"
 
+/**
+ * SUBTEST: dp-crc-fast
+ * Description: Pick the first mode of the IGT base EDID, display and capture
+ * 		a few frames, then check captured frames are correct
+ * Driver requirement: i915, xe
+ * Functionality: chamelium, frame_integrity
+ * Mega feature: DP
+ * Test category: functionality test
+ *
+ * SUBTEST: hdmi-crc-fast
+ * Description: Pick the first mode of the IGT base EDID, display and capture
+ * 		a few frames, then check captured frames are correct
+ * Driver requirement: i915, xe
+ * Functionality: chamelium, frame_integrity
+ * Mega feature: HDMI
+ * Test category: functionality test
+ *
+ * SUBTEST: hdmi-%s-formats
+ * Description: Pick the first mode of the IGT base EDID, display and capture a
+ *              few frames, then check captured frames are correct
+ * Driver requirement: i915, xe
+ * Functionality: chamelium, frame_integrity
+ * Mega feature: HDMI
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @crc-nonplanar:     CRC with non planar formats
+ * @cmp-planar:        Compare with planar formats
+ */
+
+/**
+ * SUBTEST: vga-frame-dump
+ * Description: For each mode of the IGT base EDID, display and capture a few
+ *              frames, then check captured frames are correct
+ * Driver requirement: i915, xe
+ * Functionality: chamelium, frame_integrity
+ * Mega feature: VGA
+ * Test category: functionality test
+ *
+ * SUBTEST: dp-crc-%s
+ * Description: For each mode of the IGT base EDID, display and capture a %arg[1]
+ *              frame(s), then check captured frame(s) are correct
+ * Driver requirement: i915, xe
+ * Functionality: chamelium, frame_integrity
+ * Mega feature: DP
+ * Test category: functionality test
+ *
+ * SUBTEST: hdmi-crc-%s
+ * Description: For each mode of the IGT base EDID, display and capture a %arg[1]
+ *              frame(s), then check captured frame(s) are correct
+ * Driver requirement: i915, xe
+ * Functionality: chamelium, frame_integrity
+ * Mega feature: HDMI
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @single:    single
+ * @multiple:  multiple
+ */
+
+/**
+ * SUBTEST: dp-frame-dump
+ * Description: For each mode of the IGT base EDID, display and capture a few
+ *              frames, then download the captured frames and compare them
+ *              bit-by-bit to the sent ones
+ * Driver requirement: i915, xe
+ * Functionality: chamelium, frame_integrity
+ * Mega feature: DP
+ * Test category: functionality test
+ *
+ * SUBTEST: hdmi-frame-dump
+ * Description: For each mode of the IGT base EDID, display and capture a few
+ *              frames, then download the captured frames and compare them
+ *              bit-by-bit to the sent ones
+ * Driver requirement: i915, xe
+ * Functionality: chamelium, frame_integrity
+ * Mega feature: HDMI
+ * Test category: functionality test
+ *
+ * SUBTEST: hdmi-aspect-ratio
+ * Description: Pick a mode with a picture aspect-ratio, capture AVI InfoFrames
+ *              and check they include the relevant fields
+ * Driver requirement: i915, xe
+ * Functionality: chamelium, frame_integrity
+ * Mega feature: HDMI
+ * Test category: functionality test
+ *
+ * SUBTEST: hdmi-%s-planes-random
+ * Description: Setup a few overlay planes with random parameters, capture the
+ *              frame and check it matches the expected output
+ * Driver requirement: i915, xe
+ * Functionality: chamelium, frame_integrity
+ * Mega feature: HDMI
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @crc:     CRC check
+ * @cmp:     Compare
+ */
+
 #define connector_dynamic_subtest(name__, type__)                   \
 	igt_subtest_with_dynamic(name__)                            \
 	for_each_port(p, port) if (chamelium_port_get_type(port) == \
@@ -539,38 +643,6 @@ static void prepare_randomized_plane(chamelium_data_t *data,
 	igt_remove_fb(data->drm_fd, &pattern_fb);
 }
 
-/**
- * SUBTEST: dp-crc-fast
- * Description: Pick the first mode of the IGT base EDID, display and capture
- * 		a few frames, then check captured frames are correct
- * Test category: functionality test
- * Functionality: chamelium, frame_integrity
- * Mega feature: DP
- * Driver requirement: i915, xe
- *
- * SUBTEST: hdmi-crc-fast
- * Description: Pick the first mode of the IGT base EDID, display and capture
- * 		a few frames, then check captured frames are correct
- * Test category: functionality test
- * Functionality: chamelium, frame_integrity
- * Mega feature: HDMI
- * Driver requirement: i915, xe
- */
-
-/**
- * SUBTEST: hdmi-%s-formats
- * Description: Pick the first mode of the IGT base EDID, display and capture a
- *              few frames, then check captured frames are correct
- * Test category: functionality test
- * Functionality: chamelium, frame_integrity
- * Mega feature: HDMI
- * Driver requirement: i915, xe
- *
- * arg[1]:
- *
- * @crc-nonplanar:     CRC with non planar formats
- * @cmp-planar:        Compare with planar formats
- */
 static const char test_display_one_mode_desc[] =
 	"Pick the first mode of the IGT base EDID, display and capture a few "
 	"frames, then check captured frames are correct";
@@ -607,36 +679,6 @@ static void test_display_one_mode(chamelium_data_t *data,
 	drmModeFreeConnector(connector);
 }
 
-/**
- * SUBTEST: vga-frame-dump
- * Description: For each mode of the IGT base EDID, display and capture a few
- *              frames, then check captured frames are correct
- * Test category: functionality test
- * Functionality: chamelium, frame_integrity
- * Mega feature: VGA
- * Driver requirement: i915, xe
- *
- * SUBTEST: dp-crc-%s
- * Description: For each mode of the IGT base EDID, display and capture a %arg[1]
- *              frame(s), then check captured frame(s) are correct
- * Test category: functionality test
- * Functionality: chamelium, frame_integrity
- * Mega feature: DP
- * Driver requirement: i915, xe
- *
- * SUBTEST: hdmi-crc-%s
- * Description: For each mode of the IGT base EDID, display and capture a %arg[1]
- *              frame(s), then check captured frame(s) are correct
- * Test category: functionality test
- * Functionality: chamelium, frame_integrity
- * Mega feature: HDMI
- * Driver requirement: i915, xe
- *
- * arg[1]:
- *
- * @single:    single
- * @multiple:  multiple
- */
 static const char test_display_all_modes_desc[] =
 	"For each mode of the IGT base EDID, display and capture a few "
 	"frames, then check captured frames are correct";
@@ -695,25 +737,6 @@ static void test_display_all_modes(chamelium_data_t *data,
 	} while (++i < count_modes);
 }
 
-/**
- * SUBTEST: dp-frame-dump
- * Description: For each mode of the IGT base EDID, display and capture a few
- *              frames, then download the captured frames and compare them
- *              bit-by-bit to the sent ones
- * Test category: functionality test
- * Functionality: chamelium, frame_integrity
- * Mega feature: DP
- * Driver requirement: i915, xe
- *
- * SUBTEST: hdmi-frame-dump
- * Description: For each mode of the IGT base EDID, display and capture a few
- *              frames, then download the captured frames and compare them
- *              bit-by-bit to the sent ones
- * Test category: functionality test
- * Functionality: chamelium, frame_integrity
- * Mega feature: HDMI
- * Driver requirement: i915, xe
- */
 static const char test_display_frame_dump_desc[] =
 	"For each mode of the IGT base EDID, display and capture a few "
 	"frames, then download the captured frames and compare them "
@@ -782,15 +805,6 @@ static void test_display_frame_dump(chamelium_data_t *data,
 	} while (++i < count_modes);
 }
 
-/**
- * SUBTEST: hdmi-aspect-ratio
- * Description: Pick a mode with a picture aspect-ratio, capture AVI InfoFrames
- *              and check they include the relevant fields
- * Test category: functionality test
- * Functionality: chamelium, frame_integrity
- * Mega feature: HDMI
- * Driver requirement: i915, xe
- */
 static const char test_display_aspect_ratio_desc[] =
 	"Pick a mode with a picture aspect-ratio, capture AVI InfoFrames and "
 	"check they include the relevant fields";
@@ -871,20 +885,6 @@ static void test_display_aspect_ratio(chamelium_data_t *data,
 	drmModeFreeConnector(connector);
 }
 
-/**
- * SUBTEST: hdmi-%s-planes-random
- * Description: Setup a few overlay planes with random parameters, capture the
- *              frame and check it matches the expected output
- * Test category: functionality test
- * Functionality: chamelium, frame_integrity
- * Mega feature: HDMI
- * Driver requirement: i915, xe
- *
- * arg[1]:
- *
- * @crc:     CRC check
- * @cmp:     Compare
- */
 static const char test_display_planes_random_desc[] =
 	"Setup a few overlay planes with random parameters, capture the frame "
 	"and check it matches the expected output";
diff --git a/tests/chamelium/kms_chamelium_hpd.c b/tests/chamelium/kms_chamelium_hpd.c
index f7a9422a9..360694c76 100644
--- a/tests/chamelium/kms_chamelium_hpd.c
+++ b/tests/chamelium/kms_chamelium_hpd.c
@@ -32,6 +32,217 @@
 
 #include "kms_chamelium_helper.h"
 
+/**
+ * SUBTEST: dp-hpd-fast
+ * Description: Check that we get uevents and updated connector status on
+ * 		hotplug and unplug
+ * Driver requirement: i915, xe
+ * Functionality: chamelium, hotplug
+ * Mega feature: DP
+ * Test category: functionality test
+ *
+ * SUBTEST: hdmi-hpd-fast
+ * Description: Check that we get uevents and updated connector status on
+ * 		hotplug and unplug
+ * Driver requirement: i915, xe
+ * Functionality: chamelium, hotplug
+ * Mega feature: HDMI
+ * Test category: functionality test
+ *
+ * SUBTEST: vga-hpd-fast
+ * Description: Check that we get uevents and updated connector status on
+ * 		hotplug and unplug
+ * Driver requirement: i915, xe
+ * Functionality: chamelium, hotplug
+ * Mega feature: VGA
+ * Test category: functionality test
+ *
+ * SUBTEST: dp-hpd
+ * Description: Check that we get uevents and updated connector status on
+ *              hotplug and unplug
+ * Driver requirement: i915, xe
+ * Functionality: chamelium, hotplug
+ * Mega feature: DP
+ * Test category: functionality test
+ *
+ * SUBTEST: hdmi-hpd
+ * Description: Check that we get uevents and updated connector status on
+ *              hotplug and unplug
+ * Driver requirement: i915, xe
+ * Functionality: chamelium, hotplug
+ * Mega feature: HDMI
+ * Test category: functionality test
+ *
+ * SUBTEST: vga-hpd
+ * Description: Check that we get uevents and updated connector status on
+ *              hotplug and unplug
+ * Driver requirement: i915, xe
+ * Functionality: chamelium, hotplug
+ * Mega feature: VGA
+ * Test category: functionality test
+ *
+ * SUBTEST: dp-hpd-%s
+ * Description: Check that we get uevents and updated connector status on
+ *              hotplug and unplug
+ * Driver requirement: i915, xe
+ * Functionality: chamelium, hotplug
+ * Mega feature: DP
+ * Test category: functionality test
+ *
+ * SUBTEST: hdmi-hpd-%s
+ * Description: Check that we get uevents and updated connector status on
+ *              hotplug and unplug
+ * Driver requirement: i915, xe
+ * Functionality: chamelium, hotplug
+ * Mega feature: HDMI
+ * Test category: functionality test
+ *
+ * SUBTEST: vga-hpd-%s
+ * Description: Check that we get uevents and updated connector status on
+ *              hotplug and unplug
+ * Driver requirement: i915, xe
+ * Functionality: chamelium, hotplug
+ * Mega feature: VGA
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @enable-disable-mode:     Toggle the mode
+ * @with-enabled-mode:       Enabling the mode
+ */
+
+/**
+ * SUBTEST: dp-hpd-for-each-pipe
+ * Description: Check that we get uevents and updated connector status on
+ *              hotplug and unplug for each pipe with valid output
+ * Driver requirement: i915, xe
+ * Functionality: chamelium, hotplug
+ * Mega feature: DP
+ * Test category: functionality test
+ *
+ * SUBTEST: hdmi-hpd-for-each-pipe
+ * Description: Check that we get uevents and updated connector status on
+ *              hotplug and unplug for each pipe with valid output
+ * Driver requirement: i915, xe
+ * Functionality: chamelium, hotplug
+ * Mega feature: HDMI
+ * Test category: functionality test
+ *
+ * SUBTEST: vga-hpd-for-each-pipe
+ * Description: Check that we get uevents and updated connector status on
+ *              hotplug and unplug for each pipe with valid output
+ * Driver requirement: i915, xe
+ * Functionality: chamelium, hotplug
+ * Mega feature: VGA
+ * Test category: functionality test
+ *
+ * SUBTEST: dp-hpd-after-hibernate
+ * Description: Toggle HPD during Hibernation, check that uevents are sent and
+ *              connector status is updated
+ * Driver requirement: i915, xe
+ * Functionality: chamelium, hotplug, hibernation
+ * Mega feature: DP
+ * Test category: functionality test
+ *
+ * SUBTEST: hdmi-hpd-after-hibernate
+ * Description: Toggle HPD during Hibernation, check that uevents are sent and
+ *              connector status is updated
+ * Driver requirement: i915, xe
+ * Functionality: chamelium, hotplug, hibernation
+ * Mega feature: HDMI
+ * Test category: functionality test
+ *
+ * SUBTEST: vga-hpd-after-hibernate
+ * Description: Toggle HPD during Hibernation, check that uevents are sent and
+ *              connector status is updated
+ * Driver requirement: i915, xe
+ * Functionality: chamelium, hotplug, hibernation
+ * Mega feature: VGA
+ * Test category: functionality test
+ *
+ * SUBTEST: dp-hpd-after-suspend
+ * Description: Toggle HPD during Suspend, check that uevents are sent and
+ *              connector status is updated
+ * Driver requirement: i915, xe
+ * Functionality: chamelium, hotplug, suspend
+ * Mega feature: DP
+ * Test category: functionality test
+ *
+ * SUBTEST: hdmi-hpd-after-suspend
+ * Description: Toggle HPD during Suspend, check that uevents are sent and
+ *              connector status is updated
+ * Driver requirement: i915, xe
+ * Functionality: chamelium, hotplug, suspend
+ * Mega feature: HDMI
+ * Test category: functionality test
+ *
+ * SUBTEST: vga-hpd-after-suspend
+ * Description: Toggle HPD during Suspend, check that uevents are sent and
+ *              connector status is updated
+ * Driver requirement: i915, xe
+ * Functionality: chamelium, hotplug, suspend
+ * Mega feature: VGA
+ * Test category: functionality test
+ *
+ * SUBTEST: common-hpd-after-suspend
+ * Description: Toggle HPD during suspend on all connectors, check that uevents
+ * 		are sent and connector status is updated
+ * Driver requirement: i915, xe
+ * Functionality: chamelium, hotplug, suspend
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: common-hpd-after-hibernate
+ * Description: Toggle HPD during suspend on all connectors, check that uevents
+ *              are sent and connector status is updated
+ * Driver requirement: i915, xe
+ * Functionality: chamelium, hotplug, hibernation
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: vga-hpd-without-ddc
+ * Description: Disable DDC on a VGA connector, check we still get a uevent on
+ *              hotplug
+ * Driver requirement: i915, xe
+ * Functionality: chamelium, hotplug
+ * Mega feature: VGA
+ * Test category: functionality test
+ *
+ * SUBTEST: dp-hpd-storm
+ * Description: Trigger a series of hotplugs in a very small timeframe to
+ *              simulate abad cable, check the kernel falls back to polling
+ *              to avoid a hotplug storm
+ * Driver requirement: i915, xe
+ * Functionality: chamelium, hotplug
+ * Mega feature: DP
+ * Test category: functionality test
+ *
+ * SUBTEST: hdmi-hpd-storm
+ * Description: Trigger a series of hotplugs in a very small timeframe to
+ *              simulate abad cable, check the kernel falls back to polling
+ *              to avoid a hotplug storm
+ * Driver requirement: i915, xe
+ * Functionality: chamelium, hotplug
+ * Mega feature: HDMI
+ * Test category: functionality test
+ *
+ * SUBTEST: dp-hpd-storm-disable
+ * Description: Disable HPD storm detection, trigger a storm and check the
+ *              kernel doesn't detect one
+ * Driver requirement: i915, xe
+ * Functionality: chamelium, hotplug
+ * Mega feature: DP
+ * Test category: functionality test
+ *
+ * SUBTEST: hdmi-hpd-storm-disable
+ * Description: Disable HPD storm detection, trigger a storm and check the
+ *              kernel doesn't detect one
+ * Driver requirement: i915, xe
+ * Functionality: chamelium, hotplug
+ * Mega feature: HDMI
+ * Test category: functionality test
+ */
+
 #define HPD_STORM_PULSE_INTERVAL_DP 100 /* ms */
 #define HPD_STORM_PULSE_INTERVAL_HDMI 200 /* ms */
 
@@ -110,84 +321,6 @@ static void try_suspend_resume_hpd(chamelium_data_t *data,
 	}
 }
 
-/**
- * SUBTEST: dp-hpd-fast
- * Description: Check that we get uevents and updated connector status on
- * 		hotplug and unplug
- * Test category: functionality test
- * Functionality: chamelium, hotplug
- * Mega feature: DP
- * Driver requirement: i915, xe
- *
- * SUBTEST: hdmi-hpd-fast
- * Description: Check that we get uevents and updated connector status on
- * 		hotplug and unplug
- * Test category: functionality test
- * Functionality: chamelium, hotplug
- * Mega feature: HDMI
- * Driver requirement: i915, xe
- *
- * SUBTEST: vga-hpd-fast
- * Description: Check that we get uevents and updated connector status on
- * 		hotplug and unplug
- * Test category: functionality test
- * Functionality: chamelium, hotplug
- * Mega feature: VGA
- * Driver requirement: i915, xe
- *
- * SUBTEST: dp-hpd
- * Description: Check that we get uevents and updated connector status on
- *              hotplug and unplug
- * Test category: functionality test
- * Functionality: chamelium, hotplug
- * Mega feature: DP
- * Driver requirement: i915, xe
- *
- * SUBTEST: hdmi-hpd
- * Description: Check that we get uevents and updated connector status on
- *              hotplug and unplug
- * Test category: functionality test
- * Functionality: chamelium, hotplug
- * Mega feature: HDMI
- * Driver requirement: i915, xe
- *
- * SUBTEST: vga-hpd
- * Description: Check that we get uevents and updated connector status on
- *              hotplug and unplug
- * Test category: functionality test
- * Functionality: chamelium, hotplug
- * Mega feature: VGA
- * Driver requirement: i915, xe
- *
- * SUBTEST: dp-hpd-%s
- * Description: Check that we get uevents and updated connector status on
- *              hotplug and unplug
- * Test category: functionality test
- * Functionality: chamelium, hotplug
- * Mega feature: DP
- * Driver requirement: i915, xe
- *
- * SUBTEST: hdmi-hpd-%s
- * Description: Check that we get uevents and updated connector status on
- *              hotplug and unplug
- * Test category: functionality test
- * Functionality: chamelium, hotplug
- * Mega feature: HDMI
- * Driver requirement: i915, xe
- *
- * SUBTEST: vga-hpd-%s
- * Description: Check that we get uevents and updated connector status on
- *              hotplug and unplug
- * Test category: functionality test
- * Functionality: chamelium, hotplug
- * Mega feature: VGA
- * Driver requirement: i915, xe
- *
- * arg[1]:
- *
- * @enable-disable-mode:     Toggle the mode
- * @with-enabled-mode:       Enabling the mode
- */
 static const char test_basic_hotplug_desc[] =
 	"Check that we get uevents and updated connector status on "
 	"hotplug and unplug";
@@ -254,31 +387,6 @@ static void test_hotplug(chamelium_data_t *data, struct chamelium_port *port,
 	igt_remove_fb(data->drm_fd, &fb);
 }
 
-/**
- * SUBTEST: dp-hpd-for-each-pipe
- * Description: Check that we get uevents and updated connector status on
- *              hotplug and unplug for each pipe with valid output
- * Test category: functionality test
- * Functionality: chamelium, hotplug
- * Mega feature: DP
- * Driver requirement: i915, xe
- *
- * SUBTEST: hdmi-hpd-for-each-pipe
- * Description: Check that we get uevents and updated connector status on
- *              hotplug and unplug for each pipe with valid output
- * Test category: functionality test
- * Functionality: chamelium, hotplug
- * Mega feature: HDMI
- * Driver requirement: i915, xe
- *
- * SUBTEST: vga-hpd-for-each-pipe
- * Description: Check that we get uevents and updated connector status on
- *              hotplug and unplug for each pipe with valid output
- * Test category: functionality test
- * Functionality: chamelium, hotplug
- * Mega feature: VGA
- * Driver requirement: i915, xe
- */
 static const char test_hotplug_for_each_pipe_desc[] =
 	"Check that we get uevents and updated connector status on "
 	"hotplug and unplug for each pipe with valid output";
@@ -324,55 +432,6 @@ static void test_hotplug_for_each_pipe(chamelium_data_t *data,
 	igt_hpd_storm_reset(data->drm_fd);
 }
 
-/**
- * SUBTEST: dp-hpd-after-hibernate
- * Description: Toggle HPD during Hibernation, check that uevents are sent and
- *              connector status is updated
- * Test category: functionality test
- * Functionality: chamelium, hotplug, hibernation
- * Mega feature: DP
- * Driver requirement: i915, xe
- *
- * SUBTEST: hdmi-hpd-after-hibernate
- * Description: Toggle HPD during Hibernation, check that uevents are sent and
- *              connector status is updated
- * Test category: functionality test
- * Functionality: chamelium, hotplug, hibernation
- * Mega feature: HDMI
- * Driver requirement: i915, xe
- *
- * SUBTEST: vga-hpd-after-hibernate
- * Description: Toggle HPD during Hibernation, check that uevents are sent and
- *              connector status is updated
- * Test category: functionality test
- * Functionality: chamelium, hotplug, hibernation
- * Mega feature: VGA
- * Driver requirement: i915, xe
- *
- * SUBTEST: dp-hpd-after-suspend
- * Description: Toggle HPD during Suspend, check that uevents are sent and
- *              connector status is updated
- * Test category: functionality test
- * Functionality: chamelium, hotplug, suspend
- * Mega feature: DP
- * Driver requirement: i915, xe
- *
- * SUBTEST: hdmi-hpd-after-suspend
- * Description: Toggle HPD during Suspend, check that uevents are sent and
- *              connector status is updated
- * Test category: functionality test
- * Functionality: chamelium, hotplug, suspend
- * Mega feature: HDMI
- * Driver requirement: i915, xe
- *
- * SUBTEST: vga-hpd-after-suspend
- * Description: Toggle HPD during Suspend, check that uevents are sent and
- *              connector status is updated
- * Test category: functionality test
- * Functionality: chamelium, hotplug, suspend
- * Mega feature: VGA
- * Driver requirement: i915, xe
- */
 static const char test_suspend_resume_hpd_desc[] =
 	"Toggle HPD during suspend, check that uevents are sent and connector "
 	"status is updated";
@@ -396,23 +455,6 @@ static void test_suspend_resume_hpd(chamelium_data_t *data,
 	igt_cleanup_uevents(mon);
 }
 
-/**
- * SUBTEST: common-hpd-after-suspend
- * Description: Toggle HPD during suspend on all connectors, check that uevents
- * 		are sent and connector status is updated
- * Test category: functionality test
- * Functionality: chamelium, hotplug, suspend
- * Mega feature: General Display Features
- * Driver requirement: i915, xe
- *
- * SUBTEST: common-hpd-after-hibernate
- * Description: Toggle HPD during suspend on all connectors, check that uevents
- *              are sent and connector status is updated
- * Test category: functionality test
- * Functionality: chamelium, hotplug, hibernation
- * Mega feature: General Display Features
- * Driver requirement: i915, xe
- */
 static const char test_suspend_resume_hpd_common_desc[] =
 	"Toggle HPD during suspend on all connectors, check that uevents are "
 	"sent and connector status is updated";
@@ -442,15 +484,6 @@ static void test_suspend_resume_hpd_common(chamelium_data_t *data,
 	igt_cleanup_uevents(mon);
 }
 
-/**
- * SUBTEST: vga-hpd-without-ddc
- * Description: Disable DDC on a VGA connector, check we still get a uevent on
- *              hotplug
- * Test category: functionality test
- * Functionality: chamelium, hotplug
- * Mega feature: VGA
- * Driver requirement: i915, xe
- */
 static const char test_hpd_without_ddc_desc[] =
 	"Disable DDC on a VGA connector, check we still get a uevent on hotplug";
 static void test_hpd_without_ddc(chamelium_data_t *data,
@@ -477,25 +510,6 @@ static void test_hpd_without_ddc(chamelium_data_t *data,
 	igt_cleanup_uevents(mon);
 }
 
-/**
- * SUBTEST: dp-hpd-storm
- * Description: Trigger a series of hotplugs in a very small timeframe to
- *              simulate abad cable, check the kernel falls back to polling
- *              to avoid a hotplug storm
- * Test category: functionality test
- * Functionality: chamelium, hotplug
- * Mega feature: DP
- * Driver requirement: i915, xe
- *
- * SUBTEST: hdmi-hpd-storm
- * Description: Trigger a series of hotplugs in a very small timeframe to
- *              simulate abad cable, check the kernel falls back to polling
- *              to avoid a hotplug storm
- * Test category: functionality test
- * Functionality: chamelium, hotplug
- * Mega feature: HDMI
- * Driver requirement: i915, xe
- */
 static const char test_hpd_storm_detect_desc[] =
 	"Trigger a series of hotplugs in a very small timeframe to simulate a"
 	"bad cable, check the kernel falls back to polling to avoid a hotplug "
@@ -530,23 +544,6 @@ static void test_hpd_storm_detect(chamelium_data_t *data,
 	igt_hpd_storm_reset(data->drm_fd);
 }
 
-/**
- * SUBTEST: dp-hpd-storm-disable
- * Description: Disable HPD storm detection, trigger a storm and check the
- *              kernel doesn't detect one
- * Test category: functionality test
- * Functionality: chamelium, hotplug
- * Mega feature: DP
- * Driver requirement: i915, xe
- *
- * SUBTEST: hdmi-hpd-storm-disable
- * Description: Disable HPD storm detection, trigger a storm and check the
- *              kernel doesn't detect one
- * Test category: functionality test
- * Functionality: chamelium, hotplug
- * Mega feature: HDMI
- * Driver requirement: i915, xe
- */
 static const char test_hpd_storm_disable_desc[] =
 	"Disable HPD storm detection, trigger a storm and check the kernel "
 	"doesn't detect one";
diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
index 035c936d9..2fb435ff4 100644
--- a/tests/intel/kms_big_fb.c
+++ b/tests/intel/kms_big_fb.c
@@ -37,6 +37,168 @@
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 
+/**
+ * SUBTEST: linear-%dbpp-rotate-%d
+ * Description: Sanity check if addfb ioctl works correctly for given combination
+ *              of Linear modifier with %arg[1]-bpp & %arg[2]-rotation
+ * Driver requirement: i915, xe
+ * Functionality: big_fbs, kms_gem_interop, rotation
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1].values:       8, 16, 32, 64
+ * arg[2].values:       0, 90, 180, 270
+ */
+
+/**
+ * SUBTEST: %s-%dbpp-rotate-%d
+ * Description: Sanity check if addfb ioctl works correctly for given combination
+ *              of %arg[1] with %arg[2]-bpp & %arg[3]-rotation
+ * Driver requirement: i915, xe
+ * Functionality: big_fbs, kms_gem_interop, rotation, tiling
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @4-tiled:            TILE-4 modifier
+ * @x-tiled:            TILE-X modifier
+ * @y-tiled:            TILE-Y modifier
+ * @yf-tiled:           TILE-YF modifier
+ *
+ * arg[2].values:       8, 16, 32, 64
+ * arg[3].values:       0, 90, 180, 270
+ */
+
+/**
+ * SUBTEST: linear-max-hw-stride-%dbpp-rotate-%d
+ * Description: Test maximum hardware supported stride length for given combination
+ *              of linear modifier with max hardware stride length, %arg[1]-bpp,
+ *              and %arg[2]-rotation
+ * Driver requirement: i915, xe
+ * Functionality: big_fbs, kms_gem_interop, rotation
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1].values:       32, 64
+ * arg[2].values:       0, 180
+ */
+
+/**
+ * SUBTEST: %s-max-hw-stride-%dbpp-rotate-%d
+ * Description: Test maximum hardware supported stride length for given combination
+ *              of %arg[1] modifier with max hardware stride length, %arg[2]-bpp,
+ *              and %arg[3]-rotation
+ * Driver requirement: i915, xe
+ * Functionality: big_fbs, kms_gem_interop, rotation, tiling
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @4-tiled:            TILE-4 modifier
+ * @x-tiled:            TILE-X modifier
+ * @y-tiled:            TILE-Y modifier
+ * @yf-tiled:           TILE-YF modifier
+ *
+ * arg[2].values:       32, 64
+ * arg[3].values:       0, 180
+ */
+
+/**
+ * SUBTEST: %s-max-hw-stride-%dbpp-rotate-%d-hflip
+ * Description: Test maximum hardware supported stride length for given combination
+ *              of %arg[1] modifier with max hardware stride length, %arg[2]-bpp,
+ *              and %arg[3]-rotation with H-flip mode
+ * Driver requirement: i915, xe
+ * Functionality: big_fbs, kms_gem_interop, rotation, tiling
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: %s-max-hw-stride-%dbpp-rotate-%d-%s
+ * Description: Test maximum hardware supported stride length for given combination
+ *              of %arg[1] modifier with max hardware stride length, %arg[2]-bpp,
+ *              and %arg[3]-rotation with %arg[4] mode
+ * Driver requirement: i915, xe
+ * Functionality: async_flips, big_fbs, kms_gem_interop, rotation, tiling
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @4-tiled:            TILE-4 modifier
+ * @x-tiled:            TILE-X modifier
+ * @y-tiled:            TILE-Y modifier
+ * @yf-tiled:           TILE-YF modifier
+ *
+ * arg[2].values:       32, 64
+ * arg[3].values:       0, 180
+ *
+ * arg[4]:
+ *
+ * @async-flip:         Async flip
+ * @hflip-async-flip:   Async & H-flip
+ */
+
+/**
+ * SUBTEST: %s-addfb-size-overflow
+ * Description: Sanity check if addfb ioctl fails correctly for (%arg[1]) modifier
+ *              with small bo.
+ * Driver requirement: i915, xe
+ * Functionality: big_fbs, kms_gem_interop, tiling
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @4-tiled:    TILE-4
+ * @x-tiled:    TILE-X
+ * @y-tiled:    TILE-Y
+ * @yf-tiled:   TILE-YF
+ */
+
+/**
+ * SUBTEST: %s-addfb-size-offset-overflow
+ * Description: Sanity check if addfb ioctl fails correctly for (%arg[1]) modifier
+ *              and offsets with small bo
+ * Driver requirement: i915, xe
+ * Functionality: big_fbs, kms_gem_interop, tiling
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @4-tiled:    TILE-4
+ * @x-tiled:    TILE-X
+ * @y-tiled:    TILE-Y
+ * @yf-tiled:   TILE-YF
+ */
+
+/**
+ * SUBTEST: linear-addfb
+ * Description: Sanity check if addfb ioctl works correctly with Linear modifier
+ *              for given size and strides of fb
+ * Driver requirement: i915, xe
+ * Functionality: big_fbs, kms_gem_interop
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: %s-addfb
+ * Description: Sanity check if addfb ioctl works correctly with %arg[1] modifier
+ *              for given size and strides of fb
+ * Driver requirement: i915, xe
+ * Functionality: big_fbs, kms_gem_interop, tiling
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @4-tiled:    TILE-4
+ * @x-tiled:    TILE-X
+ * @y-tiled:    TILE-Y
+ * @yf-tiled:   TILE-YF
+ */
+
 IGT_TEST_DESCRIPTION("Test big framebuffers");
 
 typedef struct {
@@ -588,108 +750,6 @@ max_hw_stride_async_flip_test(data_t *data)
 	return true;
 }
 
-/**
- * SUBTEST: linear-%dbpp-rotate-%d
- * Description: Sanity check if addfb ioctl works correctly for given combination
- *              of Linear modifier with %arg[1]-bpp & %arg[2]-rotation
- * Driver requirement: i915, xe
- * Functionality: big_fbs, kms_gem_interop, rotation
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1].values:       8, 16, 32, 64
- * arg[2].values:       0, 90, 180, 270
- */
-
-/**
- * SUBTEST: %s-%dbpp-rotate-%d
- * Description: Sanity check if addfb ioctl works correctly for given combination
- *              of %arg[1] with %arg[2]-bpp & %arg[3]-rotation
- * Driver requirement: i915, xe
- * Functionality: big_fbs, kms_gem_interop, rotation, tiling
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @4-tiled:            TILE-4 modifier
- * @x-tiled:            TILE-X modifier
- * @y-tiled:            TILE-Y modifier
- * @yf-tiled:           TILE-YF modifier
- *
- * arg[2].values:       8, 16, 32, 64
- * arg[3].values:       0, 90, 180, 270
- */
-
-/**
- * SUBTEST: linear-max-hw-stride-%dbpp-rotate-%d
- * Description: Test maximum hardware supported stride length for given combination
- *              of linear modifier with max hardware stride length, %arg[1]-bpp,
- *              and %arg[2]-rotation
- * Driver requirement: i915, xe
- * Functionality: big_fbs, kms_gem_interop, rotation
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1].values:       32, 64
- * arg[2].values:       0, 180
- */
-
-/**
- * SUBTEST: %s-max-hw-stride-%dbpp-rotate-%d
- * Description: Test maximum hardware supported stride length for given combination
- *              of %arg[1] modifier with max hardware stride length, %arg[2]-bpp,
- *              and %arg[3]-rotation
- * Driver requirement: i915, xe
- * Functionality: big_fbs, kms_gem_interop, rotation, tiling
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @4-tiled:            TILE-4 modifier
- * @x-tiled:            TILE-X modifier
- * @y-tiled:            TILE-Y modifier
- * @yf-tiled:           TILE-YF modifier
- *
- * arg[2].values:       32, 64
- * arg[3].values:       0, 180
- */
-
-/**
- * SUBTEST: %s-max-hw-stride-%dbpp-rotate-%d-hflip
- * Description: Test maximum hardware supported stride length for given combination
- *              of %arg[1] modifier with max hardware stride length, %arg[2]-bpp,
- *              and %arg[3]-rotation with H-flip mode
- * Driver requirement: i915, xe
- * Functionality: big_fbs, kms_gem_interop, rotation, tiling
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: %s-max-hw-stride-%dbpp-rotate-%d-%s
- * Description: Test maximum hardware supported stride length for given combination
- *              of %arg[1] modifier with max hardware stride length, %arg[2]-bpp,
- *              and %arg[3]-rotation with %arg[4] mode
- * Driver requirement: i915, xe
- * Functionality: async_flips, big_fbs, kms_gem_interop, rotation, tiling
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @4-tiled:            TILE-4 modifier
- * @x-tiled:            TILE-X modifier
- * @y-tiled:            TILE-Y modifier
- * @yf-tiled:           TILE-YF modifier
- *
- * arg[2].values:       32, 64
- * arg[3].values:       0, 180
- *
- * arg[4]:
- *
- * @async-flip:         Async flip
- * @hflip-async-flip:   Async & H-flip
- */
 static void test_scanout(data_t *data)
 {
 	igt_output_t *output;
@@ -735,22 +795,6 @@ static void test_scanout(data_t *data)
 	igt_skip("unsupported configuration\n");
 }
 
-/**
- * SUBTEST: %s-addfb-size-overflow
- * Description: Sanity check if addfb ioctl fails correctly for (%arg[1]) modifier
- *              with small bo.
- * Driver requirement: i915, xe
- * Functionality: big_fbs, kms_gem_interop, tiling
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @4-tiled:    TILE-4
- * @x-tiled:    TILE-X
- * @y-tiled:    TILE-Y
- * @yf-tiled:   TILE-YF
- */
 static void
 test_size_overflow(data_t *data)
 {
@@ -795,22 +839,6 @@ test_size_overflow(data_t *data)
 	gem_close(data->drm_fd, bo);
 }
 
-/**
- * SUBTEST: %s-addfb-size-offset-overflow
- * Description: Sanity check if addfb ioctl fails correctly for (%arg[1]) modifier
- *              and offsets with small bo
- * Driver requirement: i915, xe
- * Functionality: big_fbs, kms_gem_interop, tiling
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @4-tiled:    TILE-4
- * @x-tiled:    TILE-X
- * @y-tiled:    TILE-Y
- * @yf-tiled:   TILE-YF
- */
 static void
 test_size_offset_overflow(data_t *data)
 {
@@ -869,30 +897,6 @@ static int rmfb(int fd, uint32_t id)
 	return err;
 }
 
-/**
- * SUBTEST: linear-addfb
- * Description: Sanity check if addfb ioctl works correctly with Linear modifier
- *              for given size and strides of fb
- * Driver requirement: i915, xe
- * Functionality: big_fbs, kms_gem_interop
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: %s-addfb
- * Description: Sanity check if addfb ioctl works correctly with %arg[1] modifier
- *              for given size and strides of fb
- * Driver requirement: i915, xe
- * Functionality: big_fbs, kms_gem_interop, tiling
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @4-tiled:    TILE-4
- * @x-tiled:    TILE-X
- * @y-tiled:    TILE-Y
- * @yf-tiled:   TILE-YF
- */
 static void
 test_addfb(data_t *data)
 {
diff --git a/tests/intel/kms_big_joiner.c b/tests/intel/kms_big_joiner.c
index 3b6dc530b..3f2091723 100644
--- a/tests/intel/kms_big_joiner.c
+++ b/tests/intel/kms_big_joiner.c
@@ -29,8 +29,33 @@
  * Category: Display
  * Description: Test big joiner
  */
+
 #include "igt.h"
 
+/**
+ * SUBTEST: invalid-modeset
+ * Description: Verify if the modeset on the adjoining pipe is rejected when
+ *              the pipe is active with a big joiner modeset
+ * Driver requirement: i915, xe
+ * Functionality: 2p1p
+ * Mega feature: Bigjoiner
+ * Test category: functionality test
+ *
+ * SUBTEST: basic
+ * Description: Verify the basic modeset on big joiner mode on all pipes
+ * Driver requirement: i915, xe
+ * Functionality: 2p1p
+ * Mega feature: Bigjoiner
+ * Test category: functionality test
+ *
+ * SUBTEST: 2x-modeset
+ * Description: Verify simultaneous modeset on 2 big joiner outputs
+ * Driver requirement: i915, xe
+ * Functionality: 2p1p
+ * Mega feature: Bigjoiner
+ * Test category: functionality test
+ */
+
 IGT_TEST_DESCRIPTION("Test big joiner");
 
 struct bigjoiner_output {
@@ -50,15 +75,6 @@ typedef struct {
 
 static int max_dotclock;
 
-/**
- * SUBTEST: invalid-modeset
- * Description: Verify if the modeset on the adjoining pipe is rejected when
- *              the pipe is active with a big joiner modeset
- * Driver requirement: i915, xe
- * Functionality: 2p1p
- * Mega feature: Bigjoiner
- * Test category: functionality test
- */
 static void test_invalid_modeset(data_t *data)
 {
 	igt_output_t *output;
@@ -99,14 +115,6 @@ static void test_invalid_modeset(data_t *data)
 	igt_assert_lt(ret, 0);
 }
 
-/**
- * SUBTEST: basic
- * Description: Verify the basic modeset on big joiner mode on all pipes
- * Driver requirement: i915, xe
- * Functionality: 2p1p
- * Mega feature: Bigjoiner
- * Test category: functionality test
- */
 static void test_basic_modeset(data_t *data)
 {
 	drmModeModeInfo *mode;
@@ -143,14 +151,6 @@ static void test_basic_modeset(data_t *data)
 	igt_display_commit2(display, COMMIT_ATOMIC);
 }
 
-/**
- * SUBTEST: 2x-modeset
- * Description: Verify simultaneous modeset on 2 big joiner outputs
- * Driver requirement: i915, xe
- * Functionality: 2p1p
- * Mega feature: Bigjoiner
- * Test category: functionality test
- */
 static void test_dual_display(data_t *data)
 {
 	drmModeModeInfo *mode;
diff --git a/tests/intel/kms_busy.c b/tests/intel/kms_busy.c
index fe450160f..c65d71b19 100644
--- a/tests/intel/kms_busy.c
+++ b/tests/intel/kms_busy.c
@@ -26,6 +26,7 @@
  * Category: Display
  * Description: Basic check of KMS ABI with busy framebuffers.
  */
+
 #include <sys/poll.h>
 #include <signal.h>
 #include <time.h>
@@ -33,6 +34,61 @@
 #include "i915/gem.h"
 #include "igt.h"
 
+/**
+ * SUBTEST: basic
+ * Description: Test for basic check of KMS ABI with busy framebuffers.
+ * Driver requirement: i915
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: basic-hang
+ * Description: Test for basic check of KMS ABI with busy framebuffers.
+ * Driver requirement: i915
+ * Functionality: kms_core, hang
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ */
+
+/**
+ * SUBTEST: extended-modeset-hang-%s
+ * Description: Test for basic check of KMS ABI with busy framebuffers.
+ * Driver requirement: i915
+ * Functionality: kms_core, hang
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @newfb:                New framebuffer
+ * @oldfb:                Old framebuffer
+ * @newfb-with-reset:     New framebuffer with reset
+ * @oldfb-with-reset:     Old framebuffer with reset
+ */
+
+/**
+ * SUBTEST: extended-pageflip-hang-%s
+ * Description: Test for basic check of KMS ABI with busy framebuffers.
+ * Driver requirement: i915
+ * Functionality: kms_core, hang
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @newfb:     New framebuffer
+ * @oldfb:     Old framebuffer
+ */
+
+/**
+ * SUBTEST: extended-pageflip-modeset-hang-oldfb
+ * Description: Test for basic check of KMS ABI with busy framebuffers.
+ * Driver requirement: i915
+ * Functionality: kms_core, hang
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ */
+
 IGT_TEST_DESCRIPTION("Basic check of KMS ABI with busy framebuffers.");
 
 static bool all_pipes = false;
@@ -136,21 +192,6 @@ static void flip_to_fb(igt_display_t *dpy, int pipe,
 	put_ahnd(ahnd);
 }
 
-/**
- * SUBTEST: basic
- * Description: Test for basic check of KMS ABI with busy framebuffers.
- * Driver requirement: i915
- * Functionality: kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: basic-hang
- * Description: Test for basic check of KMS ABI with busy framebuffers.
- * Driver requirement: i915
- * Functionality: kms_core, hang
- * Mega feature: General Display Features
- * Test category: functionality test
- */
 static void test_flip(igt_display_t *dpy, int pipe,
 		      igt_output_t *output, bool modeset)
 {
@@ -243,35 +284,6 @@ static void test_atomic_commit_hang(igt_display_t *dpy, igt_plane_t *primary,
 	put_ahnd(ahnd);
 }
 
-/**
- * SUBTEST: extended-modeset-hang-%s
- * Description: Test for basic check of KMS ABI with busy framebuffers.
- * Driver requirement: i915
- * Functionality: kms_core, hang
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @newfb:                New framebuffer
- * @oldfb:                Old framebuffer
- * @newfb-with-reset:     New framebuffer with reset
- * @oldfb-with-reset:     Old framebuffer with reset
- */
-
-/**
- * SUBTEST: extended-pageflip-hang-%s
- * Description: Test for basic check of KMS ABI with busy framebuffers.
- * Driver requirement: i915
- * Functionality: kms_core, hang
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @newfb:     New framebuffer
- * @oldfb:     Old framebuffer
- */
 static void test_hang(igt_display_t *dpy,
 		      enum pipe pipe, igt_output_t *output,
 		      bool modeset, bool hang_newfb)
@@ -319,14 +331,6 @@ static void test_hang(igt_display_t *dpy,
 	igt_remove_fb(dpy->drm_fd, &fb[0]);
 }
 
-/**
- * SUBTEST: extended-pageflip-modeset-hang-oldfb
- * Description: Test for basic check of KMS ABI with busy framebuffers.
- * Driver requirement: i915
- * Functionality: kms_core, hang
- * Mega feature: General Display Features
- * Test category: functionality test
- */
 static void
 test_pageflip_modeset_hang(igt_display_t *dpy,
 			   igt_output_t *output, enum pipe pipe)
diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
index f21a53082..d1eb735fa 100644
--- a/tests/intel/kms_ccs.c
+++ b/tests/intel/kms_ccs.c
@@ -29,6 +29,7 @@
  *              complemented by a color control surface (CCS) that the display
  *              uses to interpret the compressed data.
  */
+
 #include "igt.h"
 
 #include "i915/gem_create.h"
diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c
index 74bb254b9..97cb615c5 100644
--- a/tests/intel/kms_cdclk.c
+++ b/tests/intel/kms_cdclk.c
@@ -29,8 +29,33 @@
  * Category: Display
  * Description: Test cdclk features : crawling and squashing
  */
+
 #include "igt.h"
 
+/**
+ * SUBTEST: mode-transition-all-outputs
+ * Description: Mode transition (low to high) test to validate cdclk frequency
+ *              change by simultaneous modesets on all pipes with valid outputs.
+ * Driver requirement: i915, xe
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: mode-transition
+ * Description: Mode transition (low to high) test to validate cdclk frequency change.
+ * Driver requirement: i915, xe
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: plane-scaling
+ * Description: Plane scaling test to validate cdclk frequency change.
+ * Driver requirement: i915, xe
+ * Functionality: kms_core, plane, scaling
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ */
+
 IGT_TEST_DESCRIPTION("Test cdclk features : crawling and squashing");
 
 #define HDISPLAY_4K	3840
@@ -253,15 +278,6 @@ static void test_mode_transition(data_t *data, enum pipe pipe, igt_output_t *out
 	igt_remove_fb(display->drm_fd, &fb);
 }
 
-/**
- * SUBTEST: mode-transition-all-outputs
- * Description: Mode transition (low to high) test to validate cdclk frequency
- *              change by simultaneous modesets on all pipes with valid outputs.
- * Driver requirement: i915, xe
- * Functionality: kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
- */
 static void test_mode_transition_on_all_outputs(data_t *data)
 {
 	igt_display_t *display = &data->display;
@@ -358,21 +374,6 @@ static void test_mode_transition_on_all_outputs(data_t *data)
 	igt_remove_fb(data->drm_fd, &fb);
 }
 
-/**
- * SUBTEST: mode-transition
- * Description: Mode transition (low to high) test to validate cdclk frequency change.
- * Driver requirement: i915, xe
- * Functionality: kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: plane-scaling
- * Description: Plane scaling test to validate cdclk frequency change.
- * Driver requirement: i915, xe
- * Functionality: kms_core, plane, scaling
- * Mega feature: General Display Features
- * Test category: functionality test
- */
 static void run_cdclk_test(data_t *data, uint32_t flags)
 {
 	igt_display_t *display = &data->display;
diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
index a6424dd8f..3318f8128 100644
--- a/tests/intel/kms_dirtyfb.c
+++ b/tests/intel/kms_dirtyfb.c
@@ -3,6 +3,16 @@
  * Copyright © 2023 Intel Corporation
  */
 
+/**
+ * TEST: kms dirtyfb
+ * Category: Display
+ * Description: Test DIRTYFB ioctl functionality.
+ * Driver requirement: i915, xe
+ * Functionality: dirtyfb
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ */
+
 #include <sys/types.h>
 
 #include "igt.h"
@@ -13,18 +23,7 @@
 
 #include "xe/xe_query.h"
 
-IGT_TEST_DESCRIPTION("Test the DIRTYFB ioctl is working properly with "
-		     "its related features: FBC, PSR and DRRS");
-
 /**
- * TEST: kms dirtyfb
- * Category: Display
- * Description: Test DIRTYFB ioctl functionality.
- * Driver requirement: i915, xe
- * Functionality: dirtyfb
- * Mega feature: General Display Features
- * Test category: functionality test
- *
  * SUBTEST: default-dirtyfb-ioctl
  * Description: Test DIRTYFB ioctl is working properly using GPU
  *              frontbuffer rendering with features like FBC, PSR
@@ -42,6 +41,9 @@ IGT_TEST_DESCRIPTION("Test the DIRTYFB ioctl is working properly with "
  * @psr:     psr1
  */
 
+IGT_TEST_DESCRIPTION("Test the DIRTYFB ioctl is working properly with "
+		     "its related features: FBC, PSR and DRRS");
+
 #ifndef PAGE_ALIGN
 #ifndef PAGE_SIZE
 #define PAGE_SIZE 4096
diff --git a/tests/intel/kms_draw_crc.c b/tests/intel/kms_draw_crc.c
index 4bde8fa59..7cd4c3ff1 100644
--- a/tests/intel/kms_draw_crc.c
+++ b/tests/intel/kms_draw_crc.c
@@ -27,9 +27,51 @@
  * Category: Display
  * Description: Tests whether the igt_draw library actually works.
  */
+
 #include "i915/gem.h"
 #include "igt.h"
 
+/**
+ * SUBTEST: draw-method-%s
+ * Description: Verify that igt draw library works for the %arg[1] method with
+ *              different modifiers & DRM formats.
+ * Driver requirement: i915, xe
+ * Functionality: kms_core, tiling
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @blt:          Blitter
+ * @mmap-wc:      MMAP-WC
+ * @render:       Render
+ */
+
+/**
+ * SUBTEST: draw-method-%s
+ * Description: Verify that igt draw library works for the %arg[1] method with
+ *              different modifiers & DRM formats.
+ * Driver requirement: i915
+ * Functionality: kms_core, tiling
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @mmap-cpu:     MMAP-CPU
+ * @mmap-gtt:     MMAP-GTT
+ * @pwrite:       PWRITE
+ */
+
+/**
+ * SUBTEST: fill-fb
+ * Description: This subtest verifies CRC after filling fb with x-tiling or none.
+ * Driver requirement: i915, xe
+ * Functionality: kms_core, tiling
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ */
+
 #define MAX_CONNECTORS 32
 
 int drm_fd;
@@ -143,37 +185,6 @@ static void get_method_crc(enum igt_draw_method method, uint32_t drm_format,
 	igt_remove_fb(drm_fd, &fb);
 }
 
-/**
- * SUBTEST: draw-method-%s
- * Description: Verify that igt draw library works for the %arg[1] method with
- *              different modifiers & DRM formats.
- * Driver requirement: i915, xe
- * Functionality: kms_core, tiling
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @blt:          Blitter
- * @mmap-wc:      MMAP-WC
- * @render:       Render
- */
-
-/**
- * SUBTEST: draw-method-%s
- * Description: Verify that igt draw library works for the %arg[1] method with
- *              different modifiers & DRM formats.
- * Driver requirement: i915
- * Functionality: kms_core, tiling
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @mmap-cpu:     MMAP-CPU
- * @mmap-gtt:     MMAP-GTT
- * @pwrite:       PWRITE
- */
 static void draw_method_subtest(enum igt_draw_method method,
 				uint32_t format_index, uint64_t modifier)
 {
@@ -213,14 +224,6 @@ static void get_fill_crc(uint64_t modifier, igt_crc_t *crc)
 	igt_remove_fb(drm_fd, &fb);
 }
 
-/**
- * SUBTEST: fill-fb
- * Description: This subtest verifies CRC after filling fb with x-tiling or none.
- * Driver requirement: i915, xe
- * Functionality: kms_core, tiling
- * Mega feature: General Display Features
- * Test category: functionality test
- */
 static void fill_fb_subtest(void)
 {
 	int rc;
diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
index 183944ef7..0df3613b3 100644
--- a/tests/intel/kms_dsc.c
+++ b/tests/intel/kms_dsc.c
@@ -35,6 +35,7 @@
  * Category: Display
  * Description: Test to validate display stream compression
  */
+
 #include "kms_dsc_helper.h"
 
 /**
diff --git a/tests/intel/kms_fb_coherency.c b/tests/intel/kms_fb_coherency.c
index cd6b5da4b..c05bd0508 100644
--- a/tests/intel/kms_fb_coherency.c
+++ b/tests/intel/kms_fb_coherency.c
@@ -18,6 +18,17 @@
 #include "igt.h"
 #include "xe/xe_ioctl.h"
 
+/**
+ * SUBTEST: memset-crc
+ * Description: Use display controller CRC hardware to validate (non)coherency
+ *		of memset operations on future scanout buffer objects
+ *		mmapped with different mmap methods and different caching modes.
+ * Mega feature: General Display Features
+ * Functionality: kms_core
+ * Driver requirement: i915, xe
+ * Test category: functionality test
+ */
+
 typedef struct {
 	int drm_fd;
 	igt_display_t display;
@@ -243,16 +254,6 @@ igt_main
 		select_valid_pipe_output_combo(&data);
 	}
 
-	/**
-	 * SUBTEST: memset-crc
-	 * Description: Use display controller CRC hardware to validate (non)coherency
-	 *		of memset operations on future scanout buffer objects
-	 *		mmapped with different mmap methods and different caching modes.
-	 * Mega feature: General Display Features
-	 * Functionality: kms_core
-	 * Driver requirement: i915, xe
-	 * Test category: functionality test
-	 */
 	igt_subtest_with_dynamic("memset-crc") {
 		if (igt_draw_supports_method(data.drm_fd, IGT_DRAW_MMAP_GTT)) {
 			igt_dynamic("mmap-gtt")
diff --git a/tests/intel/kms_fbcon_fbt.c b/tests/intel/kms_fbcon_fbt.c
index 4078309d9..d437d70f6 100644
--- a/tests/intel/kms_fbcon_fbt.c
+++ b/tests/intel/kms_fbcon_fbt.c
@@ -24,6 +24,13 @@
  *
  */
 
+/**
+ * TEST: kms fbcon fbt
+ * Category: Display
+ * Description: Test the relationship between fbcon and the frontbuffer tracking
+ *              infrastructure.
+ */
+
 #include "igt.h"
 #include "igt_device.h"
 #include "igt_psr.h"
@@ -33,11 +40,6 @@
 #include <fcntl.h>
 
 /**
- * TEST: kms fbcon fbt
- * Category: Display
- * Description: Test the relationship between fbcon and the frontbuffer tracking
- *              infrastructure.
- *
  * SUBTEST: fbc
  * Description: Test the relationship between fbcon and the frontbuffer tracking
  *              infrastructure with fbc enabled.
diff --git a/tests/intel/kms_fence_pin_leak.c b/tests/intel/kms_fence_pin_leak.c
index 47808800f..24e7b011c 100644
--- a/tests/intel/kms_fence_pin_leak.c
+++ b/tests/intel/kms_fence_pin_leak.c
@@ -22,6 +22,12 @@
  *
  */
 
+/**
+ * TEST: kms fence pin leak
+ * Category: Display
+ * Description: Exercises full ppgtt fence pin_count leak in the kernel.
+ */
+
 #include <errno.h>
 #include <limits.h>
 #include <stdbool.h>
@@ -30,11 +36,8 @@
 
 #include "i915/gem.h"
 #include "igt.h"
+
 /**
- * TEST: kms fence pin leak
- * Category: Display
- * Description: Exercises full ppgtt fence pin_count leak in the kernel.
- *
  * SUBTEST:
  * Description: Along with the modeset, validate fence pin_count leakage.
  * Driver requirement: i915
diff --git a/tests/intel/kms_flip_scaled_crc.c b/tests/intel/kms_flip_scaled_crc.c
index d3489c478..8f37299ea 100644
--- a/tests/intel/kms_flip_scaled_crc.c
+++ b/tests/intel/kms_flip_scaled_crc.c
@@ -27,6 +27,7 @@
  * Category: Display
  * Description: Test flipping between scaled/nonscaled framebuffers
  */
+
 #include "igt.h"
 
 /**
diff --git a/tests/intel/kms_flip_tiling.c b/tests/intel/kms_flip_tiling.c
index a6c6514a6..3bf02564e 100644
--- a/tests/intel/kms_flip_tiling.c
+++ b/tests/intel/kms_flip_tiling.c
@@ -24,17 +24,20 @@
  *   Ander Conselvan de Oliveira <ander.conselvan.de.oliveira@intel.com>
  */
 
+/**
+ * TEST: kms flip tiling
+ * Category: Display
+ * Description: Test page flips and tiling scenarios
+ */
+
 #include <errno.h>
 #include <stdbool.h>
 #include <stdio.h>
 #include <string.h>
 
 #include "igt.h"
+
 /**
- * TEST: kms flip tiling
- * Category: Display
- * Description: Test page flips and tiling scenarios
- *
  * SUBTEST: flip-change-tiling
  * Description: Check pageflip between modifiers
  * Driver requirement: i915, xe
diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index 213069947..085adc5b1 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -29,6 +29,7 @@
  * Category: Display
  * Description: Test the Kernel's frontbuffer tracking mechanism and its related features: FBC, PSR and DRRS
  */
+
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <fcntl.h>
@@ -45,3785 +46,4170 @@
 #include "igt_psr.h"
 
 /**
+ * SUBTEST: basic
+ * Description: Do some basic operations regardless of which features are enabled
+ * Driver requirement: i915, xe
+ * Functionality: fbt
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
  * SUBTEST: plane-fbc-rte
  * Description: Sanity test to enable FBC on a plane.
  * Driver requirement: i915, xe
  * Functionality: fbc
  * Mega feature: General Display Features
  * Test category: functionality test
+ *
+ * SUBTEST: drrs-%dp-rte
+ * Description: Sanity test to enable DRRS with %arg[1] panels.
+ * Driver requirement: i915, xe
+ * Functionality: fbt, drrs
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbc-%dp-rte
+ * Description: Sanity test to enable FBC with %arg[1] panels.
+ * Driver requirement: i915, xe
+ * Functionality: fbc, fbt
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: psr-%dp-rte
+ * Description: Sanity test to enable PSR with %arg[1] panels.
+ * Driver requirement: i915, xe
+ * Functionality: fbt, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcdrrs-%dp-rte
+ * Description: Sanity test to enable FBC & DRRS with %arg[1] panels.
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbc, fbt
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcpsr-%dp-rte
+ * Description: Sanity test to enable FBC & PSR with %arg[1] panels.
+ * Driver requirement: i915, xe
+ * Functionality: fbc, fbt, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: psrdrrs-%dp-rte
+ * Description: Sanity test to enable PSR & DRRS with %arg[1] panels.
+ * Driver requirement: i915, xe
+ * Functionality: fbt, drrs, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcpsrdrrs-%dp-rte
+ * Description: Sanity test to enable FBC, PSR & DRRS with %arg[1] panels.
+ * Driver requirement: i915, xe
+ * Functionality: fbc, fbt, drrs, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1].values:   1, 2
  */
 
-#define TIME SLOW_QUICK(1000, 10000)
-
-IGT_TEST_DESCRIPTION("Test the Kernel's frontbuffer tracking mechanism and "
-		     "its related features: FBC, PSR and DRRS");
-
-/*
- * One of the aspects of this test is that, for every subtest, we try different
- * combinations of the parameters defined by the struct below. Because of this,
- * a single addition of a new parameter or subtest function can lead to hundreds
- * of new subtests.
+/**
+ * SUBTEST: drrs-1p-offscren-pri-%s-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbt, kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
  *
- * In order to reduce the number combinations we cut the cases that don't make
- * sense, such as writing on the secondary screen when there is only a single
- * pipe, or flipping when the target is the offscreen buffer. We also hide some
- * combinations that are somewhat redundant and don't add much value to the
- * test. For example, since we already do the offscreen testing with a single
- * pipe enabled, there's no much value in doing it again with dual pipes. If you
- * still want to try these redundant tests, you need to use the --show-hidden
- * option.
+ * SUBTEST: fbc-1p-offscren-pri-%s-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915, xe
+ * Functionality: fbc, fbt, kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
  *
- * The most important hidden thing is the FEATURE_NONE set of tests. Whenever
- * you get a failure on any test, it is important to check whether the same test
- * fails with FEATURE_NONE - replace the feature name for "nop". If the nop test
- * also fails, then it's likely the problem will be on the IGT side instead of
- * the Kernel side. We don't expose this set of tests by default because (i)
- * they take a long time to test; and (ii) if the feature tests work, then it's
- * very likely that the nop tests will also work.
+ * SUBTEST: psr-1p-offscren-pri-%s-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915, xe
+ * Functionality: fbt, kms_core, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcdrrs-1p-offscren-pri-%s-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbc, fbt, kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcpsr-1p-offscren-pri-%s-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915, xe
+ * Functionality: fbc, fbt, kms_core, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: psrdrrs-1p-offscren-pri-%s-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbt, kms_core, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcpsrdrrs-1p-offscren-pri-%s-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbc, fbt, kms_core, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @indfb:          Individual fb
+ * @shrfb:          Shared fb
+ *
+ * arg[2]:
+ *
+ * @blt:            Blitter
+ * @mmap-wc:        MMAP-WC
+ * @render:         Render
  */
-struct test_mode {
-	/* Are we going to enable just one monitor, or are we going to setup a
-	 * dual screen environment for the test? */
-	enum {
-		PIPE_SINGLE = 0,
-		PIPE_DUAL,
-		PIPE_COUNT,
-	} pipes;
-
-	/* The primary screen is the one that's supposed to have the "feature"
-	 * enabled on, but we have the option to draw on the secondary screen or
-	 * on some offscreen buffer. We also only theck the CRC of the primary
-	 * screen. */
-	enum {
-		SCREEN_PRIM = 0,
-		SCREEN_SCND,
-		SCREEN_OFFSCREEN,
-		SCREEN_COUNT,
-	} screen;
-
-	/* When we draw, we can draw directly on the primary plane, on the
-	 * cursor or on the sprite plane. */
-	enum {
-		PLANE_PRI = 0,
-		PLANE_CUR,
-		PLANE_SPR,
-		PLANE_COUNT,
-	} plane;
-
-	/* We can organize the screens in a way that each screen has its own
-	 * framebuffer, or in a way that all screens point to the same
-	 * framebuffer, but on different places. This includes the offscreen
-	 * screen. */
-	enum {
-		FBS_INDIVIDUAL = 0,
-		FBS_SHARED,
-		FBS_COUNT,
-	} fbs;
 
-	/* Which features are we going to test now? This is a mask!
-	 * FEATURE_DEFAULT is a special value which instruct the test to just
-	 * keep what's already enabled by default in the Kernel. */
-	enum {
-		FEATURE_NONE  = 0,
-		FEATURE_FBC   = 1,
-		FEATURE_PSR   = 2,
-		FEATURE_DRRS  = 4,
-		FEATURE_COUNT = 8,
-		FEATURE_DEFAULT = 8,
-	} feature;
+/**
+ * SUBTEST: drrs-1p-offscren-pri-%s-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915
+ * Functionality: drrs, fbt, kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbc-1p-offscren-pri-%s-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915
+ * Functionality: fbc, fbt, kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: psr-1p-offscren-pri-%s-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915
+ * Functionality: fbt, kms_core, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcdrrs-1p-offscren-pri-%s-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915
+ * Functionality: drrs, fbc, fbt, kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcpsr-1p-offscren-pri-%s-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915
+ * Functionality: fbc, fbt, kms_core, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: psrdrrs-1p-offscren-pri-%s-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915
+ * Functionality: drrs, fbt, kms_core, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcpsrdrrs-1p-offscren-pri-%s-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915
+ * Functionality: drrs, fbc, fbt, kms_core, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @indfb:          Individual fb
+ * @shrfb:          Shared fb
+ *
+ * arg[2]:
+ *
+ * @mmap-cpu:       MMAP-CPU
+ * @mmap-gtt:       MMAP-GTT
+ * @pwrite:         PWRITE
+ */
 
-	/* Possible pixel formats. We just use FORMAT_DEFAULT for most tests and
-	 * only test a few things on the other formats. */
-	enum pixel_format {
-		FORMAT_RGB888 = 0,
-		FORMAT_RGB565,
-		FORMAT_RGB101010,
-		FORMAT_COUNT,
-		FORMAT_DEFAULT = FORMAT_RGB888,
-	} format;
-
-	/* There are multiple APIs where we can do the equivalent of a page flip
-	 * and they exercise slightly different codepaths inside the Kernel. */
-	enum flip_type {
-		FLIP_PAGEFLIP,
-		FLIP_MODESET,
-		FLIP_PLANES,
-		FLIP_COUNT,
-	} flip;
-
-	enum tiling_type {
-		TILING_LINEAR = 0,
-		TILING_X,
-		TILING_Y,
-		TILING_4,
-		TILING_COUNT,
-		TILING_DEFAULT = TILING_X,
-	} tiling;
-
-	enum igt_draw_method method;
-};
-
-enum color {
-	COLOR_RED,
-	COLOR_GREEN,
-	COLOR_BLUE,
-	COLOR_MAGENTA,
-	COLOR_CYAN,
-	COLOR_SCND_BG,
-	COLOR_PRIM_BG = COLOR_BLUE,
-	COLOR_OFFSCREEN_BG = COLOR_SCND_BG,
-};
-
-struct rect {
-	int x;
-	int y;
-	int w;
-	int h;
-	uint32_t color;
-};
-
-struct {
-	int fd;
-	int debugfs;
-	igt_display_t display;
-
-	struct buf_ops *bops;
-} drm;
-
-struct {
-	bool can_test;
-
-	bool supports_last_action;
-
-	struct timespec last_action;
-} fbc = {
-	.can_test = false,
-	.supports_last_action = false,
-};
-
-struct {
-	bool can_test;
-} psr = {
-	.can_test = false,
-};
-
-#define MAX_DRRS_STATUS_BUF_LEN 256
-
-struct {
-	bool can_test;
-} drrs = {
-	.can_test = false,
-};
-
-igt_pipe_crc_t *pipe_crc;
-igt_crc_t *wanted_crc;
-struct {
-	bool initialized;
-	igt_crc_t crc;
-} blue_crcs[FORMAT_COUNT];
-
-/* The goal of this structure is to easily allow us to deal with cases where we
- * have a big framebuffer and the CRTC is just displaying a subregion of this
- * big FB. */
-struct fb_region {
-	igt_plane_t *plane;
-	struct igt_fb *fb;
-	int x;
-	int y;
-	int w;
-	int h;
-};
-
-struct draw_pattern_info {
-	bool frames_stack;
-	int n_rects;
-	struct rect (*get_rect)(struct fb_region *fb, int r);
-
-	bool initialized[FORMAT_COUNT];
-	igt_crc_t *crcs[FORMAT_COUNT];
-};
-
-/* Draw big rectangles on the screen. */
-struct draw_pattern_info pattern1;
-/* 64x64 rectangles at x:0,y:0, just so we can draw on the cursor and sprite. */
-struct draw_pattern_info pattern2;
-/* 64x64 rectangles at different positions, same color, for the move test. */
-struct draw_pattern_info pattern3;
-/* Just a fullscreen green square. */
-struct draw_pattern_info pattern4;
-
-/* Command line parameters. */
-struct {
-	bool check_status;
-	bool check_crc;
-	bool fbc_check_compression;
-	bool fbc_check_last_action;
-	bool no_edp;
-	bool small_modes;
-	bool show_hidden;
-	int step;
-	int only_pipes;
-	int shared_fb_x_offset;
-	int shared_fb_y_offset;
-	enum tiling_type tiling;
-} opt = {
-	.check_status = true,
-	.check_crc = true,
-	.fbc_check_compression = true,
-	.fbc_check_last_action = true,
-	.no_edp = false,
-	.small_modes = false,
-	.show_hidden= false,
-	.step = 0,
-	.only_pipes = PIPE_COUNT,
-	.shared_fb_x_offset = 248,
-	.shared_fb_y_offset = 500,
-	.tiling = TILING_DEFAULT,
-};
-
-struct modeset_params {
-	enum pipe pipe;
-	igt_output_t *output;
-	drmModeModeInfo mode;
-
-	struct fb_region primary;
-	struct fb_region cursor;
-	struct fb_region sprite;
-};
-
-struct modeset_params prim_mode_params;
-struct modeset_params scnd_mode_params;
-
-struct fb_region offscreen_fb;
-struct screen_fbs {
-	bool initialized;
-
-	struct igt_fb prim_pri;
-	struct igt_fb prim_cur;
-	struct igt_fb prim_spr;
-
-	struct igt_fb scnd_pri;
-	struct igt_fb scnd_cur;
-	struct igt_fb scnd_spr;
-
-	struct igt_fb offscreen;
-	struct igt_fb big;
-} fbs[FORMAT_COUNT];
-
-struct {
-	pthread_t thread;
-	bool stop;
-
-	uint32_t handle;
-	uint32_t size;
-	uint32_t stride;
-	int width;
-	int height;
-	uint32_t color;
-	int bpp;
-	uint32_t tiling;
-} busy_thread = {
-	.stop = true,
-};
-
-static drmModeModeInfo *get_connector_smallest_mode(igt_output_t *output)
-{
-	drmModeConnector *c = output->config.connector;
-	const drmModeModeInfo *smallest = NULL;
-	int i;
-
-	if (c->connector_type == DRM_MODE_CONNECTOR_eDP)
-		return igt_std_1024_mode_get(igt_output_preferred_vrefresh(output));
-
-	for (i = 0; i < c->count_modes; i++) {
-		const drmModeModeInfo *mode = &c->modes[i];
-
-		if (!smallest ||
-		    mode->hdisplay * mode->vdisplay <
-		    smallest->hdisplay * smallest->vdisplay)
-			smallest = mode;
-	}
-
-	if (smallest)
-		return igt_memdup(smallest, sizeof(*smallest));
-	else
-		return igt_std_1024_mode_get(60);
-}
-
-static drmModeModeInfo *connector_get_mode(igt_output_t *output)
-{
-	/* On HSW the CRC WA is so awful that it makes you think everything is
-	  * bugged. */
-	if (IS_HASWELL(intel_get_drm_devid(drm.fd)) &&
-	    output->config.connector->connector_type == DRM_MODE_CONNECTOR_eDP)
-		return igt_std_1024_mode_get(igt_output_preferred_vrefresh(output));
-
-	if (opt.small_modes)
-		return get_connector_smallest_mode(output);
-	else
-		return igt_memdup(&output->config.default_mode,
-				  sizeof(output->config.default_mode));
-}
-
-static void init_mode_params(struct modeset_params *params,
-			     igt_output_t *output, enum pipe pipe)
-{
-	drmModeModeInfo *mode;
-
-	igt_output_override_mode(output, NULL);
-	mode = connector_get_mode(output);
-
-	params->pipe = pipe;
-	params->output = output;
-	params->mode = *mode;
-
-	params->primary.plane = igt_pipe_get_plane_type(&drm.display.pipes[pipe], DRM_PLANE_TYPE_PRIMARY);
-	params->primary.fb = NULL;
-	params->primary.x = 0;
-	params->primary.y = 0;
-	params->primary.w = mode->hdisplay;
-	params->primary.h = mode->vdisplay;
-
-	params->cursor.plane = igt_pipe_get_plane_type(&drm.display.pipes[pipe], DRM_PLANE_TYPE_CURSOR);
-	params->cursor.fb = NULL;
-	params->cursor.x = 0;
-	params->cursor.y = 0;
-	params->cursor.w = 64;
-	params->cursor.h = 64;
-
-	params->sprite.plane = igt_pipe_get_plane_type(&drm.display.pipes[pipe], DRM_PLANE_TYPE_OVERLAY);
-	igt_require(params->sprite.plane);
-	params->sprite.fb = NULL;
-	params->sprite.x = 0;
-	params->sprite.y = 0;
-	params->sprite.w = 64;
-	params->sprite.h = 64;
-
-	free(mode);
-}
-
-static bool find_connector(bool edp_only, bool pipe_a,
-			   igt_output_t *forbidden_output,
-			   enum pipe forbidden_pipe,
-			   igt_output_t **ret_output,
-			   enum pipe *ret_pipe)
-{
-	igt_output_t *output;
-	enum pipe pipe;
-
-	for_each_pipe_with_valid_output(&drm.display, pipe, output) {
-		drmModeConnectorPtr c = output->config.connector;
-
-		if (edp_only && c->connector_type != DRM_MODE_CONNECTOR_eDP)
-			continue;
-
-		if (pipe_a && pipe != PIPE_A)
-			continue;
-
-		if (output == forbidden_output || pipe == forbidden_pipe) {
-			igt_output_set_pipe(output, pipe);
-			igt_output_override_mode(output, connector_get_mode(output));
-
-			continue;
-		}
-
-		if (c->connector_type == DRM_MODE_CONNECTOR_eDP && opt.no_edp)
-			continue;
-
-		igt_output_set_pipe(output, pipe);
-		igt_output_override_mode(output, connector_get_mode(output));
-		if (intel_pipe_output_combo_valid(&drm.display)) {
-			*ret_output = output;
-			*ret_pipe = pipe;
-			return true;
-		}
-	}
-
-	return false;
-}
-
-static bool init_modeset_cached_params(void)
-{
-	igt_output_t *prim_output = NULL, *scnd_output = NULL;
-	enum pipe prim_pipe, scnd_pipe;
-
-	/*
-	 * We have this problem where PSR is only present on eDP monitors and
-	 * FBC is only present on pipe A for some platforms. So we search first
-	 * for the ideal case of eDP supporting pipe A, and try the less optimal
-	 * configs later, sacrificing  one of the features.
-	 * TODO: refactor the code in a way that allows us to have different
-	 * sets of prim/scnd structs for different features.
-	 */
-	find_connector(true, true, NULL, PIPE_NONE, &prim_output, &prim_pipe);
-	if (!prim_output)
-		find_connector(true, false, NULL, PIPE_NONE, &prim_output, &prim_pipe);
-	if (!prim_output)
-		find_connector(false, true, NULL, PIPE_NONE, &prim_output, &prim_pipe);
-	if (!prim_output)
-		find_connector(false, false, NULL, PIPE_NONE, &prim_output, &prim_pipe);
-
-	if (!prim_output)
-		return false;
-
-	find_connector(false, false, prim_output, prim_pipe,
-		       &scnd_output, &scnd_pipe);
-
-	init_mode_params(&prim_mode_params, prim_output, prim_pipe);
-
-	if (!scnd_output) {
-		scnd_mode_params.pipe = PIPE_NONE;
-		scnd_mode_params.output = NULL;
-		return true;
-	}
-
-	init_mode_params(&scnd_mode_params, scnd_output, scnd_pipe);
-	return true;
-}
-
-static uint64_t tiling_to_modifier(enum tiling_type tiling)
-{
-	switch (tiling) {
-	case TILING_LINEAR:
-		return DRM_FORMAT_MOD_LINEAR;
-	case TILING_X:
-		return I915_FORMAT_MOD_X_TILED;
-	case TILING_Y:
-		return I915_FORMAT_MOD_Y_TILED;
-	case TILING_4:
-		return I915_FORMAT_MOD_4_TILED;
-	default:
-		igt_assert(false);
-	}
-}
-
-static void create_fb(enum pixel_format pformat, int width, int height,
-		      enum tiling_type tiling, int plane, struct igt_fb *fb)
-{
-	uint32_t format;
-	uint64_t size, modifier;
-	unsigned int stride;
-
-	switch (pformat) {
-	case FORMAT_RGB888:
-		if (plane == PLANE_CUR)
-			format = DRM_FORMAT_ARGB8888;
-		else
-			format = DRM_FORMAT_XRGB8888;
-		break;
-	case FORMAT_RGB565:
-		/* Only the primary plane supports 16bpp! */
-		if (plane == PLANE_PRI)
-			format = DRM_FORMAT_RGB565;
-		else if (plane == PLANE_CUR)
-			format = DRM_FORMAT_ARGB8888;
-		else
-			format = DRM_FORMAT_XRGB8888;
-		break;
-	case FORMAT_RGB101010:
-		if (plane == PLANE_PRI)
-			format = DRM_FORMAT_XRGB2101010;
-		else if (plane == PLANE_CUR)
-			format = DRM_FORMAT_ARGB8888;
-		else
-			format = DRM_FORMAT_XRGB8888;
-		break;
-	default:
-		igt_assert(false);
-	}
-
-	modifier = tiling_to_modifier(tiling);
-
-	igt_warn_on(plane == PLANE_CUR && tiling != TILING_LINEAR);
-
-	igt_calc_fb_size(drm.fd, width, height, format, modifier, &size,
-			 &stride);
-
-	igt_create_fb_with_bo_size(drm.fd, width, height, format, modifier,
-				   IGT_COLOR_YCBCR_BT709,
-				   IGT_COLOR_YCBCR_LIMITED_RANGE,
-				   fb, size, stride);
-}
-
-static uint32_t pick_color(struct igt_fb *fb, enum color ecolor)
-{
-	uint32_t color, r, g, b, b2, a;
-	bool alpha = false;
-
-	switch (fb->drm_format) {
-	case DRM_FORMAT_RGB565:
-		a =  0x0;
-		r =  0x1F << 11;
-		g =  0x3F << 5;
-		b =  0x1F;
-		b2 = 0x10;
-		break;
-	case DRM_FORMAT_ARGB8888:
-		alpha = true;
-	case DRM_FORMAT_XRGB8888:
-		a =  0xFF << 24;
-		r =  0xFF << 16;
-		g =  0xFF << 8;
-		b =  0xFF;
-		b2 = 0x80;
-		break;
-	case DRM_FORMAT_ARGB2101010:
-		alpha = true;
-	case DRM_FORMAT_XRGB2101010:
-		a = 0x3 << 30;
-		r = 0x3FF << 20;
-		g = 0x3FF << 10;
-		b = 0x3FF;
-		b2 = 0x200;
-		break;
-	default:
-		igt_assert(false);
-	}
-
-	switch (ecolor) {
-	case COLOR_RED:
-		color = r;
-		break;
-	case COLOR_GREEN:
-		color = g;
-		break;
-	case COLOR_BLUE:
-		color = b;
-		break;
-	case COLOR_MAGENTA:
-		color = r | b;
-		break;
-	case COLOR_CYAN:
-		color = g | b;
-		break;
-	case COLOR_SCND_BG:
-		color = b2;
-		break;
-	default:
-		igt_assert(false);
-	}
-
-	if (alpha)
-		color |= a;
+/**
+ * SUBTEST: drrs-%dp-primscrn-%s-indfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915
+ * Functionality: drrs, fbt, kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbc-%dp-primscrn-%s-indfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915
+ * Functionality: fbc, fbt, kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: psr-%dp-primscrn-%s-indfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915
+ * Functionality: fbt, kms_core, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcdrrs-%dp-primscrn-%s-indfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915
+ * Functionality: drrs, fbc, fbt, kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcpsr-%dp-primscrn-%s-indfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915
+ * Functionality: fbc, fbt, kms_core, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: psrdrrs-%dp-primscrn-%s-indfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915
+ * Functionality: drrs, fbt, kms_core, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcpsrdrrs-%dp-primscrn-%s-indfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915
+ * Functionality: drrs, fbc, fbt, kms_core, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1].values:   1, 2
+ *
+ * arg[2]:
+ *
+ * @cur:            Cursor plane
+ * @pri:            Primary plane
+ * @spr:            Sprite plane
+ *
+ * arg[3]:
+ *
+ * @mmap-cpu:       MMAP-CPU
+ * @mmap-gtt:       MMAP-GTT
+ * @pwrite:         PWRITE
+ */
 
-	return color;
-}
+/**
+ * SUBTEST: drrs-%dp-primscrn-%s-indfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbt, kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbc-%dp-primscrn-%s-indfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915, xe
+ * Functionality: fbc, fbt, kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: psr-%dp-primscrn-%s-indfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915, xe
+ * Functionality: fbt, kms_core, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcdrrs-%dp-primscrn-%s-indfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbc, fbt, kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcpsr-%dp-primscrn-%s-indfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915, xe
+ * Functionality: fbc, fbt, kms_core, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: psrdrrs-%dp-primscrn-%s-indfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbt, kms_core, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcpsrdrrs-%dp-primscrn-%s-indfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbc, fbt, kms_core, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1].values:   1, 2
+ *
+ * arg[2]:
+ *
+ * @cur:            Cursor plane
+ * @pri:            Primary plane
+ * @spr:            Sprite plane
+ *
+ * arg[3]:
+ *
+ * @blt:            Blitter
+ * @mmap-wc:        MMAP-WC
+ * @render:         Render
+ */
 
-static void fill_fb(struct igt_fb *fb, enum color ecolor)
-{
-	igt_draw_fill_fb(drm.fd, fb, pick_color(fb, ecolor));
-}
+/**
+ * SUBTEST: drrs-%dp-primscrn-pri-shrfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbt, kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbc-%dp-primscrn-pri-shrfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915, xe
+ * Functionality: fbc, fbt, kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: psr-%dp-primscrn-pri-shrfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915, xe
+ * Functionality: fbt, kms_core, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcdrrs-%dp-primscrn-pri-shrfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbc, fbt, kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcpsr-%dp-primscrn-pri-shrfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915, xe
+ * Functionality: fbc, fbt, kms_core, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: psrdrrs-%dp-primscrn-pri-shrfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbt, kms_core, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcpsrdrrs-%dp-primscrn-pri-shrfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbc, fbt, kms_core, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1].values:   1, 2
+ *
+ * arg[2]:
+ *
+ * @blt:            Blitter
+ * @mmap-wc:        MMAP-WC
+ * @render:         Render
+ */
 
-/*
- * This is how the prim, scnd and offscreen FBs should be positioned inside the
- * shared FB. The prim buffer starts at the X and Y offsets defined by
- * opt.shared_fb_{x,y}_offset, then scnd starts at the same X pixel offset,
- * right after prim ends on the Y axis, then the offscreen fb starts after scnd
- * ends. Just like the picture:
+/**
+ * SUBTEST: drrs-%dp-primscrn-pri-shrfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915
+ * Functionality: drrs, fbt, kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbc-%dp-primscrn-pri-shrfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915
+ * Functionality: fbc, fbt, kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: psr-%dp-primscrn-pri-shrfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915
+ * Functionality: fbt, kms_core, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcdrrs-%dp-primscrn-pri-shrfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915
+ * Functionality: drrs, fbc, fbt, kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcpsr-%dp-primscrn-pri-shrfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915
+ * Functionality: fbc, fbt, kms_core, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: psrdrrs-%dp-primscrn-pri-shrfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915
+ * Functionality: drrs, fbt, kms_core, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
  *
- * +-------------------------+
- * | shared fb               |
- * |   +------------------+  |
- * |   | prim             |  |
- * |   |                  |  |
- * |   |                  |  |
- * |   |                  |  |
- * |   +------------------+--+
- * |   | scnd                |
- * |   |                     |
- * |   |                     |
- * |   +---------------+-----+
- * |   | offscreen     |     |
- * |   |               |     |
- * |   |               |     |
- * +---+---------------+-----+
+ * SUBTEST: fbcpsrdrrs-%dp-primscrn-pri-shrfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915
+ * Functionality: drrs, fbc, fbt, kms_core, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
  *
- * We do it vertically instead of the more common horizontal case in order to
- * avoid super huge strides not supported by FBC.
+ * arg[1].values:   1, 2
+ *
+ * arg[2]:
+ *
+ * @mmap-cpu:       MMAP-CPU
+ * @mmap-gtt:       MMAP-GTT
+ * @pwrite:         PWRITE
  */
-static void create_shared_fb(enum pixel_format format, enum tiling_type tiling)
-{
-	int prim_w, prim_h, scnd_w, scnd_h, offs_w, offs_h, big_w, big_h;
-	struct screen_fbs *s = &fbs[format];
-
-	prim_w = prim_mode_params.mode.hdisplay;
-	prim_h = prim_mode_params.mode.vdisplay;
-
-	if (scnd_mode_params.output) {
-		scnd_w = scnd_mode_params.mode.hdisplay;
-		scnd_h = scnd_mode_params.mode.vdisplay;
-	} else {
-		scnd_w = 0;
-		scnd_h = 0;
-	}
-	offs_w = offscreen_fb.w;
-	offs_h = offscreen_fb.h;
-
-	big_w = prim_w;
-	if (scnd_w > big_w)
-		big_w = scnd_w;
-	if (offs_w > big_w)
-		big_w = offs_w;
-	big_w += opt.shared_fb_x_offset;
-
-	big_h = prim_h + scnd_h + offs_h + opt.shared_fb_y_offset;
-
-	create_fb(format, big_w, big_h, tiling, PLANE_PRI, &s->big);
-}
-
-static void destroy_fbs(enum pixel_format format)
-{
-	struct screen_fbs *s = &fbs[format];
-
-	if (!s->initialized)
-		return;
-
-	if (scnd_mode_params.output) {
-		igt_remove_fb(drm.fd, &s->scnd_pri);
-		igt_remove_fb(drm.fd, &s->scnd_cur);
-		igt_remove_fb(drm.fd, &s->scnd_spr);
-	}
-	igt_remove_fb(drm.fd, &s->prim_pri);
-	igt_remove_fb(drm.fd, &s->prim_cur);
-	igt_remove_fb(drm.fd, &s->prim_spr);
-	igt_remove_fb(drm.fd, &s->offscreen);
-	igt_remove_fb(drm.fd, &s->big);
-}
-
-static void create_fbs(enum pixel_format format, enum tiling_type tiling)
-{
-	struct screen_fbs *s = &fbs[format];
-
-	if (s->initialized)
-		destroy_fbs(format);
-
-	s->initialized = true;
-
-	create_fb(format, prim_mode_params.mode.hdisplay,
-		  prim_mode_params.mode.vdisplay, tiling, PLANE_PRI,
-		  &s->prim_pri);
-	create_fb(format, prim_mode_params.cursor.w,
-		  prim_mode_params.cursor.h, DRM_FORMAT_MOD_LINEAR,
-		  PLANE_CUR, &s->prim_cur);
-	create_fb(format, prim_mode_params.sprite.w,
-		  prim_mode_params.sprite.h, tiling, PLANE_SPR, &s->prim_spr);
-
-	create_fb(format, offscreen_fb.w, offscreen_fb.h, tiling, PLANE_PRI,
-		  &s->offscreen);
-
-	create_shared_fb(format, tiling);
-
-	if (!scnd_mode_params.output)
-		return;
-
-	create_fb(format, scnd_mode_params.mode.hdisplay,
-		  scnd_mode_params.mode.vdisplay, tiling, PLANE_PRI,
-		  &s->scnd_pri);
-	create_fb(format, scnd_mode_params.cursor.w, scnd_mode_params.cursor.h,
-		  DRM_FORMAT_MOD_LINEAR, PLANE_CUR, &s->scnd_cur);
-	create_fb(format, scnd_mode_params.sprite.w, scnd_mode_params.sprite.h,
-		  tiling, PLANE_SPR, &s->scnd_spr);
-}
-
-static void __set_prim_plane_for_params(struct modeset_params *params)
-{
-	igt_plane_set_fb(params->primary.plane, params->primary.fb);
-	igt_plane_set_position(params->primary.plane, 0, 0);
-	igt_plane_set_size(params->primary.plane, params->mode.hdisplay, params->mode.vdisplay);
-	igt_fb_set_position(params->primary.fb, params->primary.plane,
-			    params->primary.x, params->primary.y);
-	igt_fb_set_size(params->primary.fb, params->primary.plane,
-			params->mode.hdisplay, params->mode.vdisplay);
-}
-
-static void __set_mode_for_params(struct modeset_params *params)
-{
-	igt_output_override_mode(params->output, &params->mode);
-	igt_output_set_pipe(params->output, params->pipe);
-
-	__set_prim_plane_for_params(params);
-}
-
-static void set_mode_for_params(struct modeset_params *params)
-{
-	__set_mode_for_params(params);
-	igt_display_commit(&drm.display);
-}
 
-static void __debugfs_read_crtc(const char *param, char *buf, int len)
-{
-	int dir;
-	enum pipe pipe;
+/**
+ * SUBTEST: drrs-2p-scndscrn-%s-indfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbt, kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbc-2p-scndscrn-%s-indfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915, xe
+ * Functionality: fbc, fbt, kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: psr-2p-scndscrn-%s-indfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915, xe
+ * Functionality: fbt, kms_core, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcdrrs-2p-scndscrn-%s-indfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbc, fbt, kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcpsr-2p-scndscrn-%s-indfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915, xe
+ * Functionality: fbc, fbt, kms_core, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: psrdrrs-2p-scndscrn-%s-indfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbt, kms_core, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcpsrdrrs-2p-scndscrn-%s-indfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbc, fbt, kms_core, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @cur:            Cursor plane
+ * @pri:            Primary plane
+ * @spr:            Sprite plane
+ *
+ * arg[2]:
+ *
+ * @blt:            Blitter
+ * @mmap-wc:        MMAP-WC
+ * @render:         Render
+ */
 
-	pipe = prim_mode_params.pipe;
-	dir = igt_debugfs_pipe_dir(drm.fd, pipe, O_DIRECTORY);
-	igt_require_fd(dir);
-	igt_debugfs_simple_read(dir, param, buf, len);
-	close(dir);
-}
+/**
+ * SUBTEST: drrs-2p-scndscrn-%s-indfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915
+ * Functionality: drrs, fbt, kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbc-2p-scndscrn-%s-indfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915
+ * Functionality: fbc, fbt, kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: psr-2p-scndscrn-%s-indfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915
+ * Functionality: fbt, kms_core, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcdrrs-2p-scndscrn-%s-indfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915
+ * Functionality: drrs, fbc, fbt, kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcpsr-2p-scndscrn-%s-indfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915
+ * Functionality: fbc, fbt, kms_core, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: psrdrrs-2p-scndscrn-%s-indfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915
+ * Functionality: drrs, fbt, kms_core, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcpsrdrrs-2p-scndscrn-%s-indfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915
+ * Functionality: drrs, fbc, fbt, kms_core, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @cur:            Cursor plane
+ * @pri:            Primary plane
+ * @spr:            Sprite plane
+ *
+ * arg[2]:
+ *
+ * @mmap-cpu:       MMAP-CPU
+ * @mmap-gtt:       MMAP-GTT
+ * @pwrite:         PWRITE
+ */
 
-#define debugfs_read_crtc(p, arr) __debugfs_read_crtc(p, arr, sizeof(arr))
-#define debugfs_write_crtc(p, arr) __debugfs_write_crtc(p, arr, sizeof(arr))
-#define debugfs_read_connector(p, arr) __debugfs_read_connector(p, arr, sizeof(arr))
+/**
+ * SUBTEST: drrs-2p-scndscrn-pri-shrfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbt, kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbc-2p-scndscrn-pri-shrfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915, xe
+ * Functionality: fbc, fbt, kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: psr-2p-scndscrn-pri-shrfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915, xe
+ * Functionality: fbt, kms_core, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcdrrs-2p-scndscrn-pri-shrfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbc, fbt, kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcpsr-2p-scndscrn-pri-shrfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915, xe
+ * Functionality: fbc, fbt, kms_core, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: psrdrrs-2p-scndscrn-pri-shrfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbt, kms_core, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcpsrdrrs-2p-scndscrn-pri-shrfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbc, fbt, kms_core, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @blt:            Blitter
+ * @mmap-wc:        MMAP-WC
+ * @render:         Render
+ */
 
-static bool is_drrs_high(void)
-{
-	char buf[MAX_DRRS_STATUS_BUF_LEN];
+/**
+ * SUBTEST: drrs-2p-scndscrn-pri-shrfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915
+ * Functionality: drrs, fbt, kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbc-2p-scndscrn-pri-shrfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915
+ * Functionality: fbc, fbt, kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: psr-2p-scndscrn-pri-shrfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915
+ * Functionality: fbt, kms_core, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcdrrs-2p-scndscrn-pri-shrfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915
+ * Functionality: drrs, fbc, fbt, kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcpsr-2p-scndscrn-pri-shrfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915
+ * Functionality: fbc, fbt, kms_core, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: psrdrrs-2p-scndscrn-pri-shrfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915
+ * Functionality: drrs, fbt, kms_core, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcpsrdrrs-2p-scndscrn-pri-shrfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915
+ * Functionality: drrs, fbc, fbt, kms_core, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @mmap-cpu:       MMAP-CPU
+ * @mmap-gtt:       MMAP-GTT
+ * @pwrite:         PWRITE
+ */
 
-	debugfs_read_crtc("i915_drrs_status", buf);
-	return strstr(buf, "DRRS refresh rate: high");
-}
+/**
+ * SUBTEST: drrs-%dp-pri-indfb-multidraw
+ * Description: Draw a set of rectangles on the screen using alternated drawing methods
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbt, kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbc-%dp-pri-indfb-multidraw
+ * Description: Draw a set of rectangles on the screen using alternated drawing methods
+ * Driver requirement: i915, xe
+ * Functionality: fbc, fbt, kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: psr-%dp-pri-indfb-multidraw
+ * Description: Draw a set of rectangles on the screen using alternated drawing methods
+ * Driver requirement: i915, xe
+ * Functionality: fbt, kms_core, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcdrrs-%dp-pri-indfb-multidraw
+ * Description: Draw a set of rectangles on the screen using alternated drawing methods
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbc, fbt, kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcpsr-%dp-pri-indfb-multidraw
+ * Description: Draw a set of rectangles on the screen using alternated drawing methods
+ * Driver requirement: i915, xe
+ * Functionality: fbc, fbt, kms_core, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: psrdrrs-%dp-pri-indfb-multidraw
+ * Description: Draw a set of rectangles on the screen using alternated drawing methods
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbt, kms_core, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcpsrdrrs-%dp-pri-indfb-multidraw
+ * Description: Draw a set of rectangles on the screen using alternated drawing methods
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbc, fbt, kms_core, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1].values:   1, 2
+ */
 
-static bool is_drrs_low(void)
-{
-	char buf[MAX_DRRS_STATUS_BUF_LEN];
+/**
+ * SUBTEST: drrs-%s-draw-%s
+ * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbt, kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbc-%s-draw-%s
+ * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
+ * Driver requirement: i915, xe
+ * Functionality: fbc, fbt, kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: psr-%s-draw-%s
+ * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
+ * Driver requirement: i915, xe
+ * Functionality: fbt, kms_core, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcdrrs-%s-draw-%s
+ * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbc, fbt, kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcpsr-%s-draw-%s
+ * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
+ * Driver requirement: i915, xe
+ * Functionality: fbc, fbt, kms_core, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: psrdrrs-%s-draw-%s
+ * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbt, kms_core, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcpsrdrrs-%s-draw-%s
+ * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbc, fbt, kms_core, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @rgb101010:      FORMAT_RGB101010
+ * @rgb565:         FORMAT_RGB565
+ *
+ * arg[2]:
+ *
+ * @blt:            Blitter
+ * @mmap-wc:        MMAP-WC
+ * @render:         Render
+ */
 
-	debugfs_read_crtc("i915_drrs_status", buf);
-	return strstr(buf, "DRRS refresh rate: low");
-}
+/**
+ * SUBTEST: drrs-%s-draw-%s
+ * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
+ * Driver requirement: i915
+ * Functionality: drrs, fbt, kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbc-%s-draw-%s
+ * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
+ * Driver requirement: i915
+ * Functionality: fbc, fbt, kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: psr-%s-draw-%s
+ * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
+ * Driver requirement: i915
+ * Functionality: fbt, kms_core, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcdrrs-%s-draw-%s
+ * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
+ * Driver requirement: i915
+ * Functionality: drrs, fbc, fbt, kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcpsr-%s-draw-%s
+ * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
+ * Driver requirement: i915
+ * Functionality: fbc, fbt, kms_core, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: psrdrrs-%s-draw-%s
+ * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
+ * Driver requirement: i915
+ * Functionality: drrs, fbt, kms_core, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcpsrdrrs-%s-draw-%s
+ * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
+ * Driver requirement: i915
+ * Functionality: drrs, fbc, fbt, kms_core, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @rgb101010:      FORMAT_RGB101010
+ * @rgb565:         FORMAT_RGB565
+ *
+ * arg[2]:
+ *
+ * @mmap-cpu:       MMAP-CPU
+ * @mmap-gtt:       MMAP-GTT
+ * @pwrite:         PWRITE
+ */
 
-static void drrs_print_status(void)
-{
-	char buf[MAX_DRRS_STATUS_BUF_LEN];
+/**
+ * SUBTEST: drrs-slowdraw
+ * Description: Sleep a little bit between drawing operations with DRRS
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbt, kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: psr-slowdraw
+ * Description: Sleep a little bit between drawing operations with PSR
+ * Driver requirement: i915, xe
+ * Functionality: fbt, kms_core, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcdrrs-slowdraw
+ * Description: Sleep a little bit between drawing operations with FBC & DRRS
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbc, fbt, kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcpsr-slowdraw
+ * Description: Sleep a little bit between drawing operations with FBC & PSR
+ * Driver requirement: i915, xe
+ * Functionality: fbc, fbt, kms_core, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: psrdrrs-slowdraw
+ * Description: Sleep a little bit between drawing operations with PSR & DRRS
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbt, kms_core, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcpsrdrrs-slowdraw
+ * Description: Sleep a little bit between drawing operations with FBC, PSR & DRRS
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbc, fbt, kms_core, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ */
 
-	debugfs_read_crtc("i915_drrs_status", buf);
-	igt_info("DRRS STATUS :\n%s\n", buf);
-}
+/**
+ * SUBTEST: drrs-%dp-primscrn-%s-%sflip-blt
+ * Description: Just exercise page flips with the patterns we have
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbt, kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbc-%dp-primscrn-%s-%sflip-blt
+ * Description: Just exercise page flips with the patterns we have
+ * Driver requirement: i915, xe
+ * Functionality: fbc, fbt, kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: psr-%dp-primscrn-%s-%sflip-blt
+ * Description: Just exercise page flips with the patterns we have
+ * Driver requirement: i915, xe
+ * Functionality: fbt, kms_core, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcdrrs-%dp-primscrn-%s-%sflip-blt
+ * Description: Just exercise page flips with the patterns we have
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbc, fbt, kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcpsr-%dp-primscrn-%s-%sflip-blt
+ * Description: Just exercise page flips with the patterns we have
+ * Driver requirement: i915, xe
+ * Functionality: fbc, fbt, kms_core, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: psrdrrs-%dp-primscrn-%s-%sflip-blt
+ * Description: Just exercise page flips with the patterns we have
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbt, kms_core, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcpsrdrrs-%dp-primscrn-%s-%sflip-blt
+ * Description: Just exercise page flips with the patterns we have
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbc, fbt, kms_core, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1].values:   1, 2
+ *
+ * arg[2]:
+ *
+ * @indfb:          Individual fb
+ * @shrfb:          Shared fb
+ *
+ * arg[3]:
+ *
+ * @ms:             Modeset
+ * @pg:             Page flip
+ * @pl:             Plane change
+ */
 
-static struct timespec fbc_get_last_action(void)
-{
-	struct timespec ret = { 0, 0 };
-	char buf[128];
-	char *action;
-	ssize_t n_read;
+/**
+ * SUBTEST: drrs-2p-scndscrn-%s-%sflip-blt
+ * Description: Just exercise page flips with the patterns we have
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbt, kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbc-2p-scndscrn-%s-%sflip-blt
+ * Description: Just exercise page flips with the patterns we have
+ * Driver requirement: i915, xe
+ * Functionality: fbc, fbt, kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: psr-2p-scndscrn-%s-%sflip-blt
+ * Description: Just exercise page flips with the patterns we have
+ * Driver requirement: i915, xe
+ * Functionality: fbt, kms_core, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcdrrs-2p-scndscrn-%s-%sflip-blt
+ * Description: Just exercise page flips with the patterns we have
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbc, fbt, kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcpsr-2p-scndscrn-%s-%sflip-blt
+ * Description: Just exercise page flips with the patterns we have
+ * Driver requirement: i915, xe
+ * Functionality: fbc, fbt, kms_core, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: psrdrrs-2p-scndscrn-%s-%sflip-blt
+ * Description: Just exercise page flips with the patterns we have
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbt, kms_core, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcpsrdrrs-2p-scndscrn-%s-%sflip-blt
+ * Description: Just exercise page flips with the patterns we have
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbc, fbt, kms_core, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @indfb:          Individual fb
+ * @shrfb:          Shared fb
+ *
+ * arg[2]:
+ *
+ * @ms:             Modeset
+ * @pg:             Page flip
+ * @pl:             Plane change
+ */
 
+/**
+ * SUBTEST: fbc-%dp-%s-fliptrack-mmap-gtt
+ * Description: Check if the hardware tracking works after page flips
+ * Driver requirement: i915, xe
+ * Functionality: fbc, fbt, kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcdrrs-%dp-%s-fliptrack-mmap-gtt
+ * Description: Check if the hardware tracking works after page flips
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbc, fbt, kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcpsr-%dp-%s-fliptrack-mmap-gtt
+ * Description: Check if the hardware tracking works after page flips
+ * Driver requirement: i915, xe
+ * Functionality: fbc, fbt, kms_core, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcpsrdrrs-%dp-%s-fliptrack-mmap-gtt
+ * Description: Check if the hardware tracking works after page flips
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbc, fbt, kms_core, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1].values:   1, 2
+ *
+ * arg[2]:
+ *
+ * @indfb:          Individual fb
+ * @shrfb:          Shared fb
+ */
 
-	debugfs_read_crtc("i915_fbc_status", buf);
-	action = strstr(buf, "\nLast action:");
-	igt_assert(action);
+/**
+ * SUBTEST: drrs-%dp-primscrn-%s-indfb-move
+ * Description: Just move the %arg[2] around
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbt
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbc-%dp-primscrn-%s-indfb-move
+ * Description: Just move the %arg[2] around
+ * Driver requirement: i915, xe
+ * Functionality: fbc, fbt
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: psr-%dp-primscrn-%s-indfb-move
+ * Description: Just move the %arg[2] around
+ * Driver requirement: i915, xe
+ * Functionality: fbt, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcdrrs-%dp-primscrn-%s-indfb-move
+ * Description: Just move the %arg[2] around
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbc, fbt
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcpsr-%dp-primscrn-%s-indfb-move
+ * Description: Just move the %arg[2] around
+ * Driver requirement: i915, xe
+ * Functionality: fbc, fbt, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: psrdrrs-%dp-primscrn-%s-indfb-move
+ * Description: Just move the %arg[2] around
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbt, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcpsrdrrs-%dp-primscrn-%s-indfb-move
+ * Description: Just move the %arg[2] around
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbc, fbt, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1].values:   1, 2
+ *
+ * arg[2]:
+ *
+ * @spr:            Sprite plane
+ * @cur:            Cursor plane
+ */
 
-	n_read = sscanf(action, "Last action: %ld.%ld",
-			&ret.tv_sec, &ret.tv_nsec);
-	igt_assert(n_read == 2);
+/**
+ * SUBTEST: drrs-2p-scndscrn-%s-indfb-move
+ * Description: Just move the %arg[1] around
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbt
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbc-2p-scndscrn-%s-indfb-move
+ * Description: Just move the %arg[1] around
+ * Driver requirement: i915, xe
+ * Functionality: fbc, fbt
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: psr-2p-scndscrn-%s-indfb-move
+ * Description: Just move the %arg[1] around
+ * Driver requirement: i915, xe
+ * Functionality: fbt, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcdrrs-2p-scndscrn-%s-indfb-move
+ * Description: Just move the %arg[1] around
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbc, fbt
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcpsr-2p-scndscrn-%s-indfb-move
+ * Description: Just move the %arg[1] around
+ * Driver requirement: i915, xe
+ * Functionality: fbc, fbt, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: psrdrrs-2p-scndscrn-%s-indfb-move
+ * Description: Just move the %arg[1] around
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbt, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcpsrdrrs-2p-scndscrn-%s-indfb-move
+ * Description: Just move the %arg[1] around
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbc, fbt, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @spr:            Sprite plane
+ * @cur:            Cursor plane
+ */
 
-	return ret;
-}
+/**
+ * SUBTEST: drrs-%dp-primscrn-%s-indfb-onoff
+ * Description: Just enable and disable the %arg[2] a few times
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbt
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbc-%dp-primscrn-%s-indfb-onoff
+ * Description: Just enable and disable the %arg[2] a few times
+ * Driver requirement: i915, xe
+ * Functionality: fbc, fbt
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: psr-%dp-primscrn-%s-indfb-onoff
+ * Description: Just enable and disable the %arg[2] a few times
+ * Driver requirement: i915, xe
+ * Functionality: fbt, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcdrrs-%dp-primscrn-%s-indfb-onoff
+ * Description: Just enable and disable the %arg[2] a few times
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbc, fbt
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcpsr-%dp-primscrn-%s-indfb-onoff
+ * Description: Just enable and disable the %arg[2] a few times
+ * Driver requirement: i915, xe
+ * Functionality: fbc, fbt, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: psrdrrs-%dp-primscrn-%s-indfb-onoff
+ * Description: Just enable and disable the %arg[2] a few times
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbt, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcpsrdrrs-%dp-primscrn-%s-indfb-onoff
+ * Description: Just enable and disable the %arg[2] a few times
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbc, fbt, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1].values:   1, 2
+ *
+ * arg[2]:
+ *
+ * @spr:            Sprite plane
+ * @cur:            Cursor plane
+ */
 
-static bool fbc_last_action_changed(void)
-{
-	struct timespec t_new, t_old;
+/**
+ * SUBTEST: drrs-2p-scndscrn-%s-indfb-onoff
+ * Description: Just enable and disable the %arg[1] a few times
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbt
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbc-2p-scndscrn-%s-indfb-onoff
+ * Description: Just enable and disable the %arg[1] a few times
+ * Driver requirement: i915, xe
+ * Functionality: fbc, fbt
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: psr-2p-scndscrn-%s-indfb-onoff
+ * Description: Just enable and disable the %arg[1] a few times
+ * Driver requirement: i915, xe
+ * Functionality: fbt, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcdrrs-2p-scndscrn-%s-indfb-onoff
+ * Description: Just enable and disable the %arg[1] a few times
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbc, fbt
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcpsr-2p-scndscrn-%s-indfb-onoff
+ * Description: Just enable and disable the %arg[1] a few times
+ * Driver requirement: i915, xe
+ * Functionality: fbc, fbt, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: psrdrrs-2p-scndscrn-%s-indfb-onoff
+ * Description: Just enable and disable the %arg[1] a few times
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbt, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcpsrdrrs-2p-scndscrn-%s-indfb-onoff
+ * Description: Just enable and disable the %arg[1] a few times
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbc, fbt, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @spr:            Sprite plane
+ * @cur:            Cursor plane
+ */
 
-	t_old = fbc.last_action;
-	t_new = fbc_get_last_action();
+/**
+ * SUBTEST: drrs-%dp-primscrn-spr-indfb-fullscreen
+ * Description: Put a fullscreen plane covering the whole screen
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbt
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbc-%dp-primscrn-spr-indfb-fullscreen
+ * Description: Put a fullscreen plane covering the whole screen
+ * Driver requirement: i915, xe
+ * Functionality: fbc, fbt
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: psr-%dp-primscrn-spr-indfb-fullscreen
+ * Description: Put a fullscreen plane covering the whole screen
+ * Driver requirement: i915, xe
+ * Functionality: fbt, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcdrrs-%dp-primscrn-spr-indfb-fullscreen
+ * Description: Put a fullscreen plane covering the whole screen
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbc, fbt
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcpsr-%dp-primscrn-spr-indfb-fullscreen
+ * Description: Put a fullscreen plane covering the whole screen
+ * Driver requirement: i915, xe
+ * Functionality: fbc, fbt, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: psrdrrs-%dp-primscrn-spr-indfb-fullscreen
+ * Description: Put a fullscreen plane covering the whole screen
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbt, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcpsrdrrs-%dp-primscrn-spr-indfb-fullscreen
+ * Description: Put a fullscreen plane covering the whole screen
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbc, fbt, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: drrs-2p-scndscrn-spr-indfb-fullscreen
+ * Description: Put a fullscreen plane covering the whole screen
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbt
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbc-2p-scndscrn-spr-indfb-fullscreen
+ * Description: Put a fullscreen plane covering the whole screen
+ * Driver requirement: i915, xe
+ * Functionality: fbc, fbt
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: psr-2p-scndscrn-spr-indfb-fullscreen
+ * Description: Put a fullscreen plane covering the whole screen
+ * Driver requirement: i915, xe
+ * Functionality: fbt, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcdrrs-2p-scndscrn-spr-indfb-fullscreen
+ * Description: Put a fullscreen plane covering the whole screen
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbc, fbt
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcpsr-2p-scndscrn-spr-indfb-fullscreen
+ * Description: Put a fullscreen plane covering the whole screen
+ * Driver requirement: i915, xe
+ * Functionality: fbc, fbt, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: psrdrrs-2p-scndscrn-spr-indfb-fullscreen
+ * Description: Put a fullscreen plane covering the whole screen
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbt, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcpsrdrrs-2p-scndscrn-spr-indfb-fullscreen
+ * Description: Put a fullscreen plane covering the whole screen
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbc, fbt, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1].values:   1, 2
+ */
 
-	fbc.last_action = t_new;
+/**
+ * SUBTEST: drrs-%s-scaledprimary
+ * Description: Try different primary plane scaling strategies
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbt, scaling
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbc-%s-scaledprimary
+ * Description: Try different primary plane scaling strategies
+ * Driver requirement: i915, xe
+ * Functionality: fbc, fbt, scaling
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: psr-%s-scaledprimary
+ * Description: Try different primary plane scaling strategies
+ * Driver requirement: i915, xe
+ * Functionality: fbt, psr, scaling
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcdrrs-%s-scaledprimary
+ * Description: Try different primary plane scaling strategies
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbc, fbt, scaling
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcpsr-%s-scaledprimary
+ * Description: Try different primary plane scaling strategies
+ * Driver requirement: i915, xe
+ * Functionality: fbc, fbt, psr, scaling
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: psrdrrs-%s-scaledprimary
+ * Description: Try different primary plane scaling strategies
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbt, psr, scaling
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcpsrdrrs-%s-scaledprimary
+ * Description: Try different primary plane scaling strategies
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbc, fbt, psr, scaling
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @indfb:          Individual fb
+ * @shrfb:          Shared fb
+ */
 
-#if 0
-	igt_info("old: %ld.%ld\n", t_old.tv_sec, t_old.tv_nsec);
-	igt_info("new: %ld.%ld\n", t_new.tv_sec, t_new.tv_nsec);
-#endif
+/**
+ * SUBTEST: drrs-modesetfrombusy
+ * Description: Modeset from a busy buffer to a non-busy buffer with DRRS
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbt, scaling
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbc-modesetfrombusy
+ * Description: Modeset from a busy buffer to a non-busy buffer with FBC
+ * Driver requirement: i915, xe
+ * Functionality: fbc, fbt, scaling
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: psr-modesetfrombusy
+ * Description: Modeset from a busy buffer to a non-busy buffer with PSR
+ * Driver requirement: i915, xe
+ * Functionality: fbt, psr, scaling
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcdrrs-modesetfrombusy
+ * Description: Modeset from a busy buffer to a non-busy buffer with FBC & DRRS
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbc, fbt, scaling
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcpsr-modesetfrombusy
+ * Description: Modeset from a busy buffer to a non-busy buffer with FBC & PSR
+ * Driver requirement: i915, xe
+ * Functionality: fbc, fbt, psr, scaling
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: psrdrrs-modesetfrombusy
+ * Description: Modeset from a busy buffer to a non-busy buffer with PSR & DRRS
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbt, psr, scaling
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcpsrdrrs-modesetfrombusy
+ * Description: Modeset from a busy buffer to a non-busy buffer with FBC, PSR & DRRS
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbc, fbt, psr, scaling
+ * Mega feature: General Display Features
+ */
 
-	return t_old.tv_sec != t_new.tv_sec ||
-	       t_old.tv_nsec != t_new.tv_nsec;
-}
+/**
+ * SUBTEST: drrs-suspend
+ * Description: Make sure suspend/resume keeps us on the same state of DRRS
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbt, suspend
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbc-suspend
+ * Description: Make sure suspend/resume keeps us on the same state of FBC
+ * Driver requirement: i915, xe
+ * Functionality: fbc, fbt, suspend
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: psr-suspend
+ * Description: Make sure suspend/resume keeps us on the same state of PSR
+ * Driver requirement: i915, xe
+ * Functionality: fbt, psr, suspend
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcdrrs-suspend
+ * Description: Make sure suspend/resume keeps us on the same state of FBC & DRRS
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbc, fbt, suspend
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcpsr-suspend
+ * Description: Make sure suspend/resume keeps us on the same state of FBC & PSR
+ * Driver requirement: i915, xe
+ * Functionality: fbc, fbt, psr, suspend
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: psrdrrs-suspend
+ * Description: Make sure suspend/resume keeps us on the same state of PSR & DRRS
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbt, psr, suspend
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcpsrdrrs-suspend
+ * Description: Make sure suspend/resume keeps us on the same state of FBC, PSR & DRRS
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbc, fbt, psr, suspend
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ */
 
-static void fbc_update_last_action(void)
-{
-	if (!fbc.supports_last_action)
-		return;
+/**
+ * SUBTEST: drrs-farfromfence-mmap-gtt
+ * Description: Test drawing as far from the fence start as possible
+ * Driver requirement: i915
+ * Functionality: drrs, fbt, kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbc-farfromfence-mmap-gtt
+ * Description: Test drawing as far from the fence start as possible
+ * Driver requirement: i915
+ * Functionality: fbc, fbt, kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: psr-farfromfence-mmap-gtt
+ * Description: Test drawing as far from the fence start as possible
+ * Driver requirement: i915
+ * Functionality: fbt, kms_core, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcdrrs-farfromfence-mmap-gtt
+ * Description: Test drawing as far from the fence start as possible
+ * Driver requirement: i915
+ * Functionality: drrs, fbc, fbt, kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcpsr-farfromfence-mmap-gtt
+ * Description: Test drawing as far from the fence start as possible
+ * Driver requirement: i915
+ * Functionality: fbc, fbt, kms_core, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: psrdrrs-farfromfence-mmap-gtt
+ * Description: Test drawing as far from the fence start as possible
+ * Driver requirement: i915
+ * Functionality: drrs, fbt, kms_core, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcpsrdrrs-farfromfence-mmap-gtt
+ * Description: Test drawing as far from the fence start as possible
+ * Driver requirement: i915
+ * Functionality: drrs, fbc, fbt, kms_core, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ */
 
-	fbc.last_action = fbc_get_last_action();
+/**
+ * SUBTEST: fbc-stridechange
+ * Description: Change the frontbuffer stride by doing a modeset
+ * Driver requirement: i915, xe
+ * Functionality: fbc, fbt
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcdrrs-stridechange
+ * Description: Change the frontbuffer stride by doing a modeset
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbc, fbt
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcpsr-stridechange
+ * Description: Change the frontbuffer stride by doing a modeset
+ * Driver requirement: i915, xe
+ * Functionality: fbc, fbt, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcpsrdrrs-stridechange
+ * Description: Change the frontbuffer stride by doing a modeset
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbc, fbt, psr
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ */
 
-#if 0
-	igt_info("Last action: %ld.%ld\n",
-		 fbc.last_action.tv_sec, fbc.last_action.tv_nsec);
-#endif
-}
+/**
+ * SUBTEST: fbc-tiling-%s
+ * Description: Test %arg[1] formats, if the tiling format supports FBC do the
+ *              basic drawing test, else set the mode & test if FBC is disabled
+ * Driver requirement: i915, xe
+ * Functionality: fbc, fbt, tiling
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcdrrs-tiling-%s
+ * Description: Test %arg[1] formats, if the tiling format supports FBC do the
+ *              basic drawing test, else set the mode & test if FBC is disabled
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbc, fbt, tiling
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcpsr-tiling-%s
+ * Description: Test %arg[1] formats, if the tiling format supports FBC do the
+ *              basic drawing test, else set the mode & test if FBC is disabled
+ * Driver requirement: i915, xe
+ * Functionality: fbc, fbt, psr, tiling
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fbcpsrdrrs-tiling-%s
+ * Description: Test %arg[1] formats, if the tiling format supports FBC do the
+ *              basic drawing test, else set the mode & test if FBC is disabled
+ * Driver requirement: i915, xe
+ * Functionality: drrs, fbc, fbt, psr, tiling
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @4:              4 tiling
+ * @linear:         Linear tiling
+ * @y:              Y tiling
+ */
 
-static void fbc_setup_last_action(void)
-{
-	ssize_t n_read;
-	char buf[128];
-	char *action;
+#define TIME SLOW_QUICK(1000, 10000)
 
+IGT_TEST_DESCRIPTION("Test the Kernel's frontbuffer tracking mechanism and "
+		     "its related features: FBC, PSR and DRRS");
 
-	debugfs_read_crtc("i915_fbc_status", buf);
-	action = strstr(buf, "\nLast action:");
-	if (!action) {
-		igt_info("FBC last action not supported\n");
-		return;
-	}
+/*
+ * One of the aspects of this test is that, for every subtest, we try different
+ * combinations of the parameters defined by the struct below. Because of this,
+ * a single addition of a new parameter or subtest function can lead to hundreds
+ * of new subtests.
+ *
+ * In order to reduce the number combinations we cut the cases that don't make
+ * sense, such as writing on the secondary screen when there is only a single
+ * pipe, or flipping when the target is the offscreen buffer. We also hide some
+ * combinations that are somewhat redundant and don't add much value to the
+ * test. For example, since we already do the offscreen testing with a single
+ * pipe enabled, there's no much value in doing it again with dual pipes. If you
+ * still want to try these redundant tests, you need to use the --show-hidden
+ * option.
+ *
+ * The most important hidden thing is the FEATURE_NONE set of tests. Whenever
+ * you get a failure on any test, it is important to check whether the same test
+ * fails with FEATURE_NONE - replace the feature name for "nop". If the nop test
+ * also fails, then it's likely the problem will be on the IGT side instead of
+ * the Kernel side. We don't expose this set of tests by default because (i)
+ * they take a long time to test; and (ii) if the feature tests work, then it's
+ * very likely that the nop tests will also work.
+ */
+struct test_mode {
+	/* Are we going to enable just one monitor, or are we going to setup a
+	 * dual screen environment for the test? */
+	enum {
+		PIPE_SINGLE = 0,
+		PIPE_DUAL,
+		PIPE_COUNT,
+	} pipes;
 
-	fbc.supports_last_action = true;
+	/* The primary screen is the one that's supposed to have the "feature"
+	 * enabled on, but we have the option to draw on the secondary screen or
+	 * on some offscreen buffer. We also only theck the CRC of the primary
+	 * screen. */
+	enum {
+		SCREEN_PRIM = 0,
+		SCREEN_SCND,
+		SCREEN_OFFSCREEN,
+		SCREEN_COUNT,
+	} screen;
 
-	n_read = sscanf(action, "Last action: %ld.%ld",
-			&fbc.last_action.tv_sec, &fbc.last_action.tv_nsec);
-	igt_assert(n_read == 2);
-}
+	/* When we draw, we can draw directly on the primary plane, on the
+	 * cursor or on the sprite plane. */
+	enum {
+		PLANE_PRI = 0,
+		PLANE_CUR,
+		PLANE_SPR,
+		PLANE_COUNT,
+	} plane;
 
-static bool fbc_is_compressing(void)
-{
-	char buf[128];
+	/* We can organize the screens in a way that each screen has its own
+	 * framebuffer, or in a way that all screens point to the same
+	 * framebuffer, but on different places. This includes the offscreen
+	 * screen. */
+	enum {
+		FBS_INDIVIDUAL = 0,
+		FBS_SHARED,
+		FBS_COUNT,
+	} fbs;
 
-	debugfs_read_crtc("i915_fbc_status", buf);
-	return strstr(buf, "\nCompressing: yes\n") != NULL;
-}
+	/* Which features are we going to test now? This is a mask!
+	 * FEATURE_DEFAULT is a special value which instruct the test to just
+	 * keep what's already enabled by default in the Kernel. */
+	enum {
+		FEATURE_NONE  = 0,
+		FEATURE_FBC   = 1,
+		FEATURE_PSR   = 2,
+		FEATURE_DRRS  = 4,
+		FEATURE_COUNT = 8,
+		FEATURE_DEFAULT = 8,
+	} feature;
 
-static bool fbc_wait_for_compression(void)
-{
-	return igt_wait(fbc_is_compressing(), 2000, 1);
-}
+	/* Possible pixel formats. We just use FORMAT_DEFAULT for most tests and
+	 * only test a few things on the other formats. */
+	enum pixel_format {
+		FORMAT_RGB888 = 0,
+		FORMAT_RGB565,
+		FORMAT_RGB101010,
+		FORMAT_COUNT,
+		FORMAT_DEFAULT = FORMAT_RGB888,
+	} format;
 
-static bool fbc_not_enough_stolen(void)
-{
-	char buf[128];
+	/* There are multiple APIs where we can do the equivalent of a page flip
+	 * and they exercise slightly different codepaths inside the Kernel. */
+	enum flip_type {
+		FLIP_PAGEFLIP,
+		FLIP_MODESET,
+		FLIP_PLANES,
+		FLIP_COUNT,
+	} flip;
 
-	debugfs_read_crtc("i915_fbc_status", buf);
-	return strstr(buf, "FBC disabled: not enough stolen memory\n");
-}
+	enum tiling_type {
+		TILING_LINEAR = 0,
+		TILING_X,
+		TILING_Y,
+		TILING_4,
+		TILING_COUNT,
+		TILING_DEFAULT = TILING_X,
+	} tiling;
 
-static bool fbc_stride_not_supported(void)
-{
-	char buf[128];
+	enum igt_draw_method method;
+};
 
-	debugfs_read_crtc("i915_fbc_status", buf);
-	return strstr(buf, "FBC disabled: framebuffer stride not supported\n");
-}
+enum color {
+	COLOR_RED,
+	COLOR_GREEN,
+	COLOR_BLUE,
+	COLOR_MAGENTA,
+	COLOR_CYAN,
+	COLOR_SCND_BG,
+	COLOR_PRIM_BG = COLOR_BLUE,
+	COLOR_OFFSCREEN_BG = COLOR_SCND_BG,
+};
 
-static bool fbc_mode_too_large(void)
-{
-	char buf[128];
+struct rect {
+	int x;
+	int y;
+	int w;
+	int h;
+	uint32_t color;
+};
 
-	debugfs_read_crtc("i915_fbc_status", buf);
-	return strstr(buf, "FBC disabled: mode too large for compression\n");
-}
+struct {
+	int fd;
+	int debugfs;
+	igt_display_t display;
 
-static bool fbc_enable_per_plane(int plane_index, enum pipe pipe)
-{
-	char buf[PATH_MAX];
-	char buf_plane[128];
+	struct buf_ops *bops;
+} drm;
 
-	sprintf(buf_plane, "%d%s", plane_index, kmstest_pipe_name(pipe));
+struct {
+	bool can_test;
 
-	debugfs_read_crtc("i915_fbc_status", buf);
-	return strstr(strstr(buf, "*"), buf_plane);
-}
+	bool supports_last_action;
 
-static bool drrs_wait_until_rr_switch_to_low(void)
-{
-	return igt_wait(is_drrs_low(), 5000, 1);
-}
+	struct timespec last_action;
+} fbc = {
+	.can_test = false,
+	.supports_last_action = false,
+};
 
-static struct rect pat1_get_rect(struct fb_region *fb, int r)
-{
-	struct rect rect;
+struct {
+	bool can_test;
+} psr = {
+	.can_test = false,
+};
 
-	switch (r) {
-	case 0:
-		rect.x = 0;
-		rect.y = 0;
-		rect.w = fb->w / 8;
-		rect.h = fb->h / 8;
-		rect.color = pick_color(fb->fb, COLOR_GREEN);
-		break;
-	case 1:
-		rect.x = fb->w / 8 * 4;
-		rect.y = fb->h / 8 * 4;
-		rect.w = fb->w / 8 * 2;
-		rect.h = fb->h / 8 * 2;
-		rect.color = pick_color(fb->fb, COLOR_RED);
-		break;
-	case 2:
-		rect.x = fb->w / 16 + 1;
-		rect.y = fb->h / 16 + 1;
-		rect.w = fb->w / 8 + 1;
-		rect.h = fb->h / 8 + 1;
-		rect.color = pick_color(fb->fb, COLOR_MAGENTA);
-		break;
-	case 3:
-		rect.x = fb->w - 1;
-		rect.y = fb->h - 1;
-		rect.w = 1;
-		rect.h = 1;
-		rect.color = pick_color(fb->fb, COLOR_CYAN);
-		break;
-	default:
-		igt_assert(false);
-	}
+#define MAX_DRRS_STATUS_BUF_LEN 256
 
-	return rect;
-}
+struct {
+	bool can_test;
+} drrs = {
+	.can_test = false,
+};
 
-static struct rect pat2_get_rect(struct fb_region *fb, int r)
-{
-	struct rect rect;
+igt_pipe_crc_t *pipe_crc;
+igt_crc_t *wanted_crc;
+struct {
+	bool initialized;
+	igt_crc_t crc;
+} blue_crcs[FORMAT_COUNT];
 
-	rect.x = 0;
-	rect.y = 0;
-	rect.w = 64;
-	rect.h = 64;
+/* The goal of this structure is to easily allow us to deal with cases where we
+ * have a big framebuffer and the CRTC is just displaying a subregion of this
+ * big FB. */
+struct fb_region {
+	igt_plane_t *plane;
+	struct igt_fb *fb;
+	int x;
+	int y;
+	int w;
+	int h;
+};
 
-	switch (r) {
-	case 0:
-		rect.color = pick_color(fb->fb, COLOR_GREEN);
-		break;
-	case 1:
-		rect.x = 31;
-		rect.y = 31;
-		rect.w = 31;
-		rect.h = 31;
-		rect.color = pick_color(fb->fb, COLOR_RED);
-		break;
-	case 2:
-		rect.x = 16;
-		rect.y = 16;
-		rect.w = 32;
-		rect.h = 32;
-		rect.color = pick_color(fb->fb, COLOR_MAGENTA);
-		break;
-	case 3:
-		rect.color = pick_color(fb->fb, COLOR_CYAN);
-		break;
-	default:
-		igt_assert(false);
-	}
+struct draw_pattern_info {
+	bool frames_stack;
+	int n_rects;
+	struct rect (*get_rect)(struct fb_region *fb, int r);
 
-	return rect;
-}
+	bool initialized[FORMAT_COUNT];
+	igt_crc_t *crcs[FORMAT_COUNT];
+};
 
-static struct rect pat3_get_rect(struct fb_region *fb, int r)
-{
-	struct rect rect;
+/* Draw big rectangles on the screen. */
+struct draw_pattern_info pattern1;
+/* 64x64 rectangles at x:0,y:0, just so we can draw on the cursor and sprite. */
+struct draw_pattern_info pattern2;
+/* 64x64 rectangles at different positions, same color, for the move test. */
+struct draw_pattern_info pattern3;
+/* Just a fullscreen green square. */
+struct draw_pattern_info pattern4;
 
-	rect.w = 64;
-	rect.h = 64;
-	rect.color = pick_color(fb->fb, COLOR_GREEN);
+/* Command line parameters. */
+struct {
+	bool check_status;
+	bool check_crc;
+	bool fbc_check_compression;
+	bool fbc_check_last_action;
+	bool no_edp;
+	bool small_modes;
+	bool show_hidden;
+	int step;
+	int only_pipes;
+	int shared_fb_x_offset;
+	int shared_fb_y_offset;
+	enum tiling_type tiling;
+} opt = {
+	.check_status = true,
+	.check_crc = true,
+	.fbc_check_compression = true,
+	.fbc_check_last_action = true,
+	.no_edp = false,
+	.small_modes = false,
+	.show_hidden= false,
+	.step = 0,
+	.only_pipes = PIPE_COUNT,
+	.shared_fb_x_offset = 248,
+	.shared_fb_y_offset = 500,
+	.tiling = TILING_DEFAULT,
+};
 
-	switch (r) {
-	case 0:
-		rect.x = 0;
-		rect.y = 0;
-		break;
-	case 1:
-		rect.x = 64;
-		rect.y = 64;
-		break;
-	case 2:
-		rect.x = 1;
-		rect.y = 1;
-		break;
-	case 3:
-		rect.x = fb->w - 64;
-		rect.y = fb->h - 64;
-		break;
-	case 4:
-		rect.x = fb->w / 2 - 32;
-		rect.y = fb->h / 2 - 32;
-		break;
-	default:
-		igt_assert(false);
-	}
+struct modeset_params {
+	enum pipe pipe;
+	igt_output_t *output;
+	drmModeModeInfo mode;
 
-	return rect;
-}
+	struct fb_region primary;
+	struct fb_region cursor;
+	struct fb_region sprite;
+};
 
-static struct rect pat4_get_rect(struct fb_region *fb, int r)
-{
-	struct rect rect;
+struct modeset_params prim_mode_params;
+struct modeset_params scnd_mode_params;
 
-	igt_assert_eq(r, 0);
+struct fb_region offscreen_fb;
+struct screen_fbs {
+	bool initialized;
 
-	rect.x = 0;
-	rect.y = 0;
-	rect.w = fb->w;
-	rect.h = fb->h;
-	rect.color = pick_color(fb->fb, COLOR_GREEN);
+	struct igt_fb prim_pri;
+	struct igt_fb prim_cur;
+	struct igt_fb prim_spr;
 
-	return rect;
-}
+	struct igt_fb scnd_pri;
+	struct igt_fb scnd_cur;
+	struct igt_fb scnd_spr;
 
-static void fb_dirty_ioctl(struct fb_region *fb, struct rect *rect)
-{
-	int rc;
-	drmModeClip clip = {
-		.x1 = rect->x,
-		.x2 = rect->x + rect->w,
-		.y1 = rect->y,
-		.y2 = rect->y + rect->h,
-	};
+	struct igt_fb offscreen;
+	struct igt_fb big;
+} fbs[FORMAT_COUNT];
 
-	rc = drmModeDirtyFB(drm.fd, fb->fb->fb_id, &clip, 1);
+struct {
+	pthread_t thread;
+	bool stop;
 
-	igt_assert(rc == 0 || rc == -ENOSYS);
-}
+	uint32_t handle;
+	uint32_t size;
+	uint32_t stride;
+	int width;
+	int height;
+	uint32_t color;
+	int bpp;
+	uint32_t tiling;
+} busy_thread = {
+	.stop = true,
+};
 
-static void draw_rect(struct draw_pattern_info *pattern, struct fb_region *fb,
-		      enum igt_draw_method method, int r)
+static drmModeModeInfo *get_connector_smallest_mode(igt_output_t *output)
 {
-	struct rect rect = pattern->get_rect(fb, r);
+	drmModeConnector *c = output->config.connector;
+	const drmModeModeInfo *smallest = NULL;
+	int i;
 
-	igt_draw_rect_fb(drm.fd, drm.bops, 0, fb->fb, method,
-			 fb->x + rect.x, fb->y + rect.y,
-			 rect.w, rect.h, rect.color);
+	if (c->connector_type == DRM_MODE_CONNECTOR_eDP)
+		return igt_std_1024_mode_get(igt_output_preferred_vrefresh(output));
 
-	fb_dirty_ioctl(fb, &rect);
-}
+	for (i = 0; i < c->count_modes; i++) {
+		const drmModeModeInfo *mode = &c->modes[i];
 
-static void draw_rect_igt_fb(struct draw_pattern_info *pattern,
-			     struct igt_fb *fb, enum igt_draw_method method,
-			     int r)
-{
-	struct fb_region region = {
-		.fb = fb,
-		.x = 0,
-		.y = 0,
-		.w = fb->width,
-		.h = fb->height,
-	};
+		if (!smallest ||
+		    mode->hdisplay * mode->vdisplay <
+		    smallest->hdisplay * smallest->vdisplay)
+			smallest = mode;
+	}
 
-	draw_rect(pattern, &region, method, r);
+	if (smallest)
+		return igt_memdup(smallest, sizeof(*smallest));
+	else
+		return igt_std_1024_mode_get(60);
 }
 
-static void fill_fb_region(struct fb_region *region,
-			   enum igt_draw_method method,
-			   enum color ecolor)
+static drmModeModeInfo *connector_get_mode(igt_output_t *output)
 {
-	uint32_t color = pick_color(region->fb, ecolor);
+	/* On HSW the CRC WA is so awful that it makes you think everything is
+	  * bugged. */
+	if (IS_HASWELL(intel_get_drm_devid(drm.fd)) &&
+	    output->config.connector->connector_type == DRM_MODE_CONNECTOR_eDP)
+		return igt_std_1024_mode_get(igt_output_preferred_vrefresh(output));
 
-	igt_draw_rect_fb(drm.fd, drm.bops, 0, region->fb, method,
-			 region->x, region->y, region->w, region->h,
-			 color);
+	if (opt.small_modes)
+		return get_connector_smallest_mode(output);
+	else
+		return igt_memdup(&output->config.default_mode,
+				  sizeof(output->config.default_mode));
 }
 
-static void _fb_dirty_ioctl(struct fb_region *region)
+static void init_mode_params(struct modeset_params *params,
+			     igt_output_t *output, enum pipe pipe)
 {
-	struct rect rect;
-
-	rect.x = region->x;
-	rect.y = region->y;
-	rect.w = region->w;
-	rect.h = region->h;
-	fb_dirty_ioctl(region, &rect);
-}
+	drmModeModeInfo *mode;
 
-static void unset_all_crtcs(void)
-{
-	igt_display_reset(&drm.display);
-	igt_display_commit(&drm.display);
-}
+	igt_output_override_mode(output, NULL);
+	mode = connector_get_mode(output);
 
-static bool disable_features(const struct test_mode *t)
-{
-	if (t->feature == FEATURE_DEFAULT)
-		return false;
+	params->pipe = pipe;
+	params->output = output;
+	params->mode = *mode;
 
-	intel_fbc_disable(drm.fd);
-	intel_drrs_disable(drm.fd, prim_mode_params.pipe);
+	params->primary.plane = igt_pipe_get_plane_type(&drm.display.pipes[pipe], DRM_PLANE_TYPE_PRIMARY);
+	params->primary.fb = NULL;
+	params->primary.x = 0;
+	params->primary.y = 0;
+	params->primary.w = mode->hdisplay;
+	params->primary.h = mode->vdisplay;
 
-	return psr.can_test ? psr_disable(drm.fd, drm.debugfs) : false;
-}
+	params->cursor.plane = igt_pipe_get_plane_type(&drm.display.pipes[pipe], DRM_PLANE_TYPE_CURSOR);
+	params->cursor.fb = NULL;
+	params->cursor.x = 0;
+	params->cursor.y = 0;
+	params->cursor.w = 64;
+	params->cursor.h = 64;
 
-static void *busy_thread_func(void *data)
-{
-	while (!busy_thread.stop)
-		igt_draw_rect(drm.fd, drm.bops, 0, busy_thread.handle,
-			      busy_thread.size, busy_thread.stride,
-			      busy_thread.tiling, IGT_DRAW_BLT, 0, 0,
-			      busy_thread.width, busy_thread.height,
-			      busy_thread.color, busy_thread.bpp);
+	params->sprite.plane = igt_pipe_get_plane_type(&drm.display.pipes[pipe], DRM_PLANE_TYPE_OVERLAY);
+	igt_require(params->sprite.plane);
+	params->sprite.fb = NULL;
+	params->sprite.x = 0;
+	params->sprite.y = 0;
+	params->sprite.w = 64;
+	params->sprite.h = 64;
 
-	pthread_exit(0);
+	free(mode);
 }
 
-static void start_busy_thread(struct igt_fb *fb)
+static bool find_connector(bool edp_only, bool pipe_a,
+			   igt_output_t *forbidden_output,
+			   enum pipe forbidden_pipe,
+			   igt_output_t **ret_output,
+			   enum pipe *ret_pipe)
 {
-	int rc;
+	igt_output_t *output;
+	enum pipe pipe;
 
-	igt_assert(busy_thread.stop == true);
-	busy_thread.stop = false;
-	busy_thread.handle = fb->gem_handle;
-	busy_thread.size = fb->size;
-	busy_thread.stride = fb->strides[0];
-	busy_thread.width = fb->width;
-	busy_thread.height = fb->height;
-	busy_thread.color = pick_color(fb, COLOR_PRIM_BG);
-	busy_thread.bpp = igt_drm_format_to_bpp(fb->drm_format);
-	busy_thread.tiling = igt_fb_mod_to_tiling(fb->modifier);
+	for_each_pipe_with_valid_output(&drm.display, pipe, output) {
+		drmModeConnectorPtr c = output->config.connector;
 
-	rc = pthread_create(&busy_thread.thread, NULL, busy_thread_func, NULL);
-	igt_assert_eq(rc, 0);
-}
+		if (edp_only && c->connector_type != DRM_MODE_CONNECTOR_eDP)
+			continue;
 
-static void stop_busy_thread(void)
-{
-	if (!busy_thread.stop) {
-		busy_thread.stop = true;
-		igt_assert(pthread_join(busy_thread.thread, NULL) == 0);
-	}
-}
+		if (pipe_a && pipe != PIPE_A)
+			continue;
 
-static void print_crc(const char *str, igt_crc_t *crc)
-{
-	char *pipe_str;
+		if (output == forbidden_output || pipe == forbidden_pipe) {
+			igt_output_set_pipe(output, pipe);
+			igt_output_override_mode(output, connector_get_mode(output));
 
-	pipe_str = igt_crc_to_string(crc);
+			continue;
+		}
 
-	igt_debug("%s pipe:[%s]\n", str, pipe_str);
+		if (c->connector_type == DRM_MODE_CONNECTOR_eDP && opt.no_edp)
+			continue;
 
-	free(pipe_str);
-}
+		igt_output_set_pipe(output, pipe);
+		igt_output_override_mode(output, connector_get_mode(output));
+		if (intel_pipe_output_combo_valid(&drm.display)) {
+			*ret_output = output;
+			*ret_pipe = pipe;
+			return true;
+		}
+	}
 
-static void collect_crc(igt_crc_t *crc)
-{
-	igt_pipe_crc_collect_crc(pipe_crc, crc);
+	return false;
 }
 
-static void init_blue_crc(enum pixel_format format, enum tiling_type tiling)
+static bool init_modeset_cached_params(void)
 {
-	struct igt_fb blue;
-
-	if (blue_crcs[format].initialized)
-		return;
-
-	create_fb(format, prim_mode_params.mode.hdisplay,
-		  prim_mode_params.mode.vdisplay, tiling, PLANE_PRI,
-		  &blue);
-
-	fill_fb(&blue, COLOR_PRIM_BG);
-
-	igt_output_set_pipe(prim_mode_params.output, prim_mode_params.pipe);
-	igt_output_override_mode(prim_mode_params.output, &prim_mode_params.mode);
-	igt_plane_set_fb(prim_mode_params.primary.plane, &blue);
-	igt_display_commit(&drm.display);
+	igt_output_t *prim_output = NULL, *scnd_output = NULL;
+	enum pipe prim_pipe, scnd_pipe;
 
-	if (!pipe_crc) {
-		pipe_crc = igt_pipe_crc_new(drm.fd, prim_mode_params.pipe,
-					    IGT_PIPE_CRC_SOURCE_AUTO);
-		igt_assert(pipe_crc);
-	}
+	/*
+	 * We have this problem where PSR is only present on eDP monitors and
+	 * FBC is only present on pipe A for some platforms. So we search first
+	 * for the ideal case of eDP supporting pipe A, and try the less optimal
+	 * configs later, sacrificing  one of the features.
+	 * TODO: refactor the code in a way that allows us to have different
+	 * sets of prim/scnd structs for different features.
+	 */
+	find_connector(true, true, NULL, PIPE_NONE, &prim_output, &prim_pipe);
+	if (!prim_output)
+		find_connector(true, false, NULL, PIPE_NONE, &prim_output, &prim_pipe);
+	if (!prim_output)
+		find_connector(false, true, NULL, PIPE_NONE, &prim_output, &prim_pipe);
+	if (!prim_output)
+		find_connector(false, false, NULL, PIPE_NONE, &prim_output, &prim_pipe);
 
-	collect_crc(&blue_crcs[format].crc);
+	if (!prim_output)
+		return false;
 
-	print_crc("Blue CRC:  ", &blue_crcs[format].crc);
+	find_connector(false, false, prim_output, prim_pipe,
+		       &scnd_output, &scnd_pipe);
 
-	igt_display_reset(&drm.display);
+	init_mode_params(&prim_mode_params, prim_output, prim_pipe);
 
-	igt_remove_fb(drm.fd, &blue);
+	if (!scnd_output) {
+		scnd_mode_params.pipe = PIPE_NONE;
+		scnd_mode_params.output = NULL;
+		return true;
+	}
 
-	blue_crcs[format].initialized = true;
+	init_mode_params(&scnd_mode_params, scnd_output, scnd_pipe);
+	return true;
 }
 
-static void init_crcs(enum pixel_format format, enum tiling_type tiling,
-		      struct draw_pattern_info *pattern)
+static uint64_t tiling_to_modifier(enum tiling_type tiling)
 {
-	int r, r_;
-	struct igt_fb tmp_fbs[pattern->n_rects];
-
-	if (pattern->initialized[format])
-		return;
-
-	pattern->crcs[format] = calloc(pattern->n_rects,
-				       sizeof(*(pattern->crcs[format])));
-
-	for (r = 0; r < pattern->n_rects; r++)
-		create_fb(format, prim_mode_params.mode.hdisplay,
-			  prim_mode_params.mode.vdisplay, tiling,
-			  PLANE_PRI, &tmp_fbs[r]);
-
-	for (r = 0; r < pattern->n_rects; r++)
-		fill_fb(&tmp_fbs[r], COLOR_PRIM_BG);
-
-	if (pattern->frames_stack) {
-		for (r = 0; r < pattern->n_rects; r++)
-			for (r_ = 0; r_ <= r; r_++)
-				draw_rect_igt_fb(pattern, &tmp_fbs[r],
-						 igt_draw_supports_method(drm.fd, IGT_DRAW_PWRITE) ?
-						 IGT_DRAW_PWRITE : IGT_DRAW_BLT,
-						 r_);
-	} else {
-		for (r = 0; r < pattern->n_rects; r++)
-			draw_rect_igt_fb(pattern, &tmp_fbs[r], igt_draw_supports_method(drm.fd, IGT_DRAW_PWRITE) ?
-					 IGT_DRAW_PWRITE : IGT_DRAW_BLT, r);
+	switch (tiling) {
+	case TILING_LINEAR:
+		return DRM_FORMAT_MOD_LINEAR;
+	case TILING_X:
+		return I915_FORMAT_MOD_X_TILED;
+	case TILING_Y:
+		return I915_FORMAT_MOD_Y_TILED;
+	case TILING_4:
+		return I915_FORMAT_MOD_4_TILED;
+	default:
+		igt_assert(false);
 	}
+}
 
-	igt_output_set_pipe(prim_mode_params.output, prim_mode_params.pipe);
-	igt_output_override_mode(prim_mode_params.output, &prim_mode_params.mode);
-	for (r = 0; r < pattern->n_rects; r++) {
-		igt_plane_set_fb(prim_mode_params.primary.plane, &tmp_fbs[r]);
-		igt_display_commit(&drm.display);
+static void create_fb(enum pixel_format pformat, int width, int height,
+		      enum tiling_type tiling, int plane, struct igt_fb *fb)
+{
+	uint32_t format;
+	uint64_t size, modifier;
+	unsigned int stride;
 
-		collect_crc(&pattern->crcs[format][r]);
+	switch (pformat) {
+	case FORMAT_RGB888:
+		if (plane == PLANE_CUR)
+			format = DRM_FORMAT_ARGB8888;
+		else
+			format = DRM_FORMAT_XRGB8888;
+		break;
+	case FORMAT_RGB565:
+		/* Only the primary plane supports 16bpp! */
+		if (plane == PLANE_PRI)
+			format = DRM_FORMAT_RGB565;
+		else if (plane == PLANE_CUR)
+			format = DRM_FORMAT_ARGB8888;
+		else
+			format = DRM_FORMAT_XRGB8888;
+		break;
+	case FORMAT_RGB101010:
+		if (plane == PLANE_PRI)
+			format = DRM_FORMAT_XRGB2101010;
+		else if (plane == PLANE_CUR)
+			format = DRM_FORMAT_ARGB8888;
+		else
+			format = DRM_FORMAT_XRGB8888;
+		break;
+	default:
+		igt_assert(false);
 	}
 
-	for (r = 0; r < pattern->n_rects; r++) {
-		igt_debug("Rect %d CRC:", r);
-		print_crc("", &pattern->crcs[format][r]);
-	}
+	modifier = tiling_to_modifier(tiling);
 
-	igt_display_reset(&drm.display);
+	igt_warn_on(plane == PLANE_CUR && tiling != TILING_LINEAR);
 
-	for (r = 0; r < pattern->n_rects; r++)
-		igt_remove_fb(drm.fd, &tmp_fbs[r]);
+	igt_calc_fb_size(drm.fd, width, height, format, modifier, &size,
+			 &stride);
 
-	pattern->initialized[format] = true;
+	igt_create_fb_with_bo_size(drm.fd, width, height, format, modifier,
+				   IGT_COLOR_YCBCR_BT709,
+				   IGT_COLOR_YCBCR_LIMITED_RANGE,
+				   fb, size, stride);
 }
 
-static void setup_drm(void)
+static uint32_t pick_color(struct igt_fb *fb, enum color ecolor)
 {
-	drm.fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
-	drm.debugfs = igt_debugfs_dir(drm.fd);
+	uint32_t color, r, g, b, b2, a;
+	bool alpha = false;
 
-	kmstest_set_vt_graphics_mode();
-	igt_display_require(&drm.display, drm.fd);
+	switch (fb->drm_format) {
+	case DRM_FORMAT_RGB565:
+		a =  0x0;
+		r =  0x1F << 11;
+		g =  0x3F << 5;
+		b =  0x1F;
+		b2 = 0x10;
+		break;
+	case DRM_FORMAT_ARGB8888:
+		alpha = true;
+	case DRM_FORMAT_XRGB8888:
+		a =  0xFF << 24;
+		r =  0xFF << 16;
+		g =  0xFF << 8;
+		b =  0xFF;
+		b2 = 0x80;
+		break;
+	case DRM_FORMAT_ARGB2101010:
+		alpha = true;
+	case DRM_FORMAT_XRGB2101010:
+		a = 0x3 << 30;
+		r = 0x3FF << 20;
+		g = 0x3FF << 10;
+		b = 0x3FF;
+		b2 = 0x200;
+		break;
+	default:
+		igt_assert(false);
+	}
 
-	drm.bops = buf_ops_create(drm.fd);
-}
+	switch (ecolor) {
+	case COLOR_RED:
+		color = r;
+		break;
+	case COLOR_GREEN:
+		color = g;
+		break;
+	case COLOR_BLUE:
+		color = b;
+		break;
+	case COLOR_MAGENTA:
+		color = r | b;
+		break;
+	case COLOR_CYAN:
+		color = g | b;
+		break;
+	case COLOR_SCND_BG:
+		color = b2;
+		break;
+	default:
+		igt_assert(false);
+	}
 
-static void teardown_drm(void)
-{
-	buf_ops_destroy(drm.bops);
-	igt_display_fini(&drm.display);
-	drm_close_driver(drm.fd);
-}
+	if (alpha)
+		color |= a;
 
-static void setup_modeset(void)
-{
-	igt_require(init_modeset_cached_params());
-	offscreen_fb.fb = NULL;
-	offscreen_fb.w = 1024;
-	offscreen_fb.h = 1024;
-	create_fbs(FORMAT_DEFAULT, opt.tiling);
+	return color;
 }
 
-static void teardown_modeset(void)
+static void fill_fb(struct igt_fb *fb, enum color ecolor)
 {
-	enum pixel_format f;
-
-	for (f = 0; f < FORMAT_COUNT; f++)
-		destroy_fbs(f);
+	igt_draw_fill_fb(drm.fd, fb, pick_color(fb, ecolor));
 }
 
-static void setup_crcs(void)
+/*
+ * This is how the prim, scnd and offscreen FBs should be positioned inside the
+ * shared FB. The prim buffer starts at the X and Y offsets defined by
+ * opt.shared_fb_{x,y}_offset, then scnd starts at the same X pixel offset,
+ * right after prim ends on the Y axis, then the offscreen fb starts after scnd
+ * ends. Just like the picture:
+ *
+ * +-------------------------+
+ * | shared fb               |
+ * |   +------------------+  |
+ * |   | prim             |  |
+ * |   |                  |  |
+ * |   |                  |  |
+ * |   |                  |  |
+ * |   +------------------+--+
+ * |   | scnd                |
+ * |   |                     |
+ * |   |                     |
+ * |   +---------------+-----+
+ * |   | offscreen     |     |
+ * |   |               |     |
+ * |   |               |     |
+ * +---+---------------+-----+
+ *
+ * We do it vertically instead of the more common horizontal case in order to
+ * avoid super huge strides not supported by FBC.
+ */
+static void create_shared_fb(enum pixel_format format, enum tiling_type tiling)
 {
-	enum pixel_format f;
-
-	for (f = 0; f < FORMAT_COUNT; f++)
-		blue_crcs[f].initialized = false;
+	int prim_w, prim_h, scnd_w, scnd_h, offs_w, offs_h, big_w, big_h;
+	struct screen_fbs *s = &fbs[format];
 
-	pattern1.frames_stack = true;
-	pattern1.n_rects = 4;
-	pattern1.get_rect = pat1_get_rect;
-	for (f = 0; f < FORMAT_COUNT; f++) {
-		pattern1.initialized[f] = false;
-		pattern1.crcs[f] = NULL;
-	}
+	prim_w = prim_mode_params.mode.hdisplay;
+	prim_h = prim_mode_params.mode.vdisplay;
 
-	pattern2.frames_stack = true;
-	pattern2.n_rects = 4;
-	pattern2.get_rect = pat2_get_rect;
-	for (f = 0; f < FORMAT_COUNT; f++) {
-		pattern2.initialized[f] = false;
-		pattern2.crcs[f] = NULL;
+	if (scnd_mode_params.output) {
+		scnd_w = scnd_mode_params.mode.hdisplay;
+		scnd_h = scnd_mode_params.mode.vdisplay;
+	} else {
+		scnd_w = 0;
+		scnd_h = 0;
 	}
+	offs_w = offscreen_fb.w;
+	offs_h = offscreen_fb.h;
 
-	pattern3.frames_stack = false;
-	pattern3.n_rects = 5;
-	pattern3.get_rect = pat3_get_rect;
-	for (f = 0; f < FORMAT_COUNT; f++) {
-		pattern3.initialized[f] = false;
-		pattern3.crcs[f] = NULL;
-	}
+	big_w = prim_w;
+	if (scnd_w > big_w)
+		big_w = scnd_w;
+	if (offs_w > big_w)
+		big_w = offs_w;
+	big_w += opt.shared_fb_x_offset;
 
-	pattern4.frames_stack = false;
-	pattern4.n_rects = 1;
-	pattern4.get_rect = pat4_get_rect;
-	for (f = 0; f < FORMAT_COUNT; f++) {
-		pattern4.initialized[f] = false;
-		pattern4.crcs[f] = NULL;
-	}
+	big_h = prim_h + scnd_h + offs_h + opt.shared_fb_y_offset;
+
+	create_fb(format, big_w, big_h, tiling, PLANE_PRI, &s->big);
 }
 
-static void teardown_crcs(void)
+static void destroy_fbs(enum pixel_format format)
 {
-	enum pixel_format f;
+	struct screen_fbs *s = &fbs[format];
 
-	for (f = 0; f < FORMAT_COUNT; f++) {
-		if (pattern1.crcs[f])
-			free(pattern1.crcs[f]);
-		if (pattern2.crcs[f])
-			free(pattern2.crcs[f]);
-		if (pattern3.crcs[f])
-			free(pattern3.crcs[f]);
-		if (pattern4.crcs[f])
-			free(pattern4.crcs[f]);
-	}
+	if (!s->initialized)
+		return;
 
-	igt_pipe_crc_free(pipe_crc);
+	if (scnd_mode_params.output) {
+		igt_remove_fb(drm.fd, &s->scnd_pri);
+		igt_remove_fb(drm.fd, &s->scnd_cur);
+		igt_remove_fb(drm.fd, &s->scnd_spr);
+	}
+	igt_remove_fb(drm.fd, &s->prim_pri);
+	igt_remove_fb(drm.fd, &s->prim_cur);
+	igt_remove_fb(drm.fd, &s->prim_spr);
+	igt_remove_fb(drm.fd, &s->offscreen);
+	igt_remove_fb(drm.fd, &s->big);
 }
 
-static void setup_fbc(void)
+static void create_fbs(enum pixel_format format, enum tiling_type tiling)
 {
-	if (!intel_fbc_supported_on_chipset(drm.fd, prim_mode_params.pipe)) {
-		igt_info("Can't test FBC: not supported on this chipset\n");
-		return;
-	}
+	struct screen_fbs *s = &fbs[format];
 
-	fbc.can_test = true;
+	if (s->initialized)
+		destroy_fbs(format);
 
-	fbc_setup_last_action();
-}
+	s->initialized = true;
 
-static void teardown_fbc(void)
-{
-}
+	create_fb(format, prim_mode_params.mode.hdisplay,
+		  prim_mode_params.mode.vdisplay, tiling, PLANE_PRI,
+		  &s->prim_pri);
+	create_fb(format, prim_mode_params.cursor.w,
+		  prim_mode_params.cursor.h, DRM_FORMAT_MOD_LINEAR,
+		  PLANE_CUR, &s->prim_cur);
+	create_fb(format, prim_mode_params.sprite.w,
+		  prim_mode_params.sprite.h, tiling, PLANE_SPR, &s->prim_spr);
 
-static void setup_psr(void)
-{
-	if (prim_mode_params.output->config.connector->connector_type !=
-	    DRM_MODE_CONNECTOR_eDP) {
-		igt_info("Can't test PSR: no usable eDP screen.\n");
-		return;
-	}
+	create_fb(format, offscreen_fb.w, offscreen_fb.h, tiling, PLANE_PRI,
+		  &s->offscreen);
 
-	if (!psr_sink_support(drm.fd, drm.debugfs, PSR_MODE_1, NULL)) {
-		igt_info("Can't test PSR: not supported by sink.\n");
+	create_shared_fb(format, tiling);
+
+	if (!scnd_mode_params.output)
 		return;
-	}
-	psr.can_test = true;
+
+	create_fb(format, scnd_mode_params.mode.hdisplay,
+		  scnd_mode_params.mode.vdisplay, tiling, PLANE_PRI,
+		  &s->scnd_pri);
+	create_fb(format, scnd_mode_params.cursor.w, scnd_mode_params.cursor.h,
+		  DRM_FORMAT_MOD_LINEAR, PLANE_CUR, &s->scnd_cur);
+	create_fb(format, scnd_mode_params.sprite.w, scnd_mode_params.sprite.h,
+		  tiling, PLANE_SPR, &s->scnd_spr);
 }
 
-static void teardown_psr(void)
+static void __set_prim_plane_for_params(struct modeset_params *params)
 {
+	igt_plane_set_fb(params->primary.plane, params->primary.fb);
+	igt_plane_set_position(params->primary.plane, 0, 0);
+	igt_plane_set_size(params->primary.plane, params->mode.hdisplay, params->mode.vdisplay);
+	igt_fb_set_position(params->primary.fb, params->primary.plane,
+			    params->primary.x, params->primary.y);
+	igt_fb_set_size(params->primary.fb, params->primary.plane,
+			params->mode.hdisplay, params->mode.vdisplay);
 }
 
-static void setup_drrs(void)
+static void __set_mode_for_params(struct modeset_params *params)
 {
-	if (!intel_output_has_drrs(drm.fd, prim_mode_params.output)) {
-		igt_info("Can't test DRRS: no usable screen.\n");
-		return;
-	}
-
-	if (!intel_is_drrs_supported(drm.fd, prim_mode_params.pipe)) {
-		igt_info("Can't test DRRS: Not supported.\n");
-		return;
-	}
+	igt_output_override_mode(params->output, &params->mode);
+	igt_output_set_pipe(params->output, params->pipe);
 
-	drrs.can_test = true;
+	__set_prim_plane_for_params(params);
 }
 
-static void setup_environment(void)
+static void set_mode_for_params(struct modeset_params *params)
 {
-	setup_drm();
-	setup_modeset();
+	__set_mode_for_params(params);
+	igt_display_commit(&drm.display);
+}
 
-	setup_fbc();
-	setup_psr();
-	setup_drrs();
+static void __debugfs_read_crtc(const char *param, char *buf, int len)
+{
+	int dir;
+	enum pipe pipe;
 
-	setup_crcs();
+	pipe = prim_mode_params.pipe;
+	dir = igt_debugfs_pipe_dir(drm.fd, pipe, O_DIRECTORY);
+	igt_require_fd(dir);
+	igt_debugfs_simple_read(dir, param, buf, len);
+	close(dir);
 }
 
-static void teardown_environment(void)
+#define debugfs_read_crtc(p, arr) __debugfs_read_crtc(p, arr, sizeof(arr))
+#define debugfs_write_crtc(p, arr) __debugfs_write_crtc(p, arr, sizeof(arr))
+#define debugfs_read_connector(p, arr) __debugfs_read_connector(p, arr, sizeof(arr))
+
+static bool is_drrs_high(void)
 {
-	stop_busy_thread();
+	char buf[MAX_DRRS_STATUS_BUF_LEN];
 
-	teardown_crcs();
-	teardown_psr();
-	teardown_fbc();
-	teardown_modeset();
-	teardown_drm();
+	debugfs_read_crtc("i915_drrs_status", buf);
+	return strstr(buf, "DRRS refresh rate: high");
 }
 
-static void wait_user(int step, const char *msg)
+static bool is_drrs_low(void)
 {
-	if (opt.step < step)
-		return;
+	char buf[MAX_DRRS_STATUS_BUF_LEN];
 
-	igt_info("%s Press enter...\n", msg);
-	while (getchar() != '\n')
-		;
+	debugfs_read_crtc("i915_drrs_status", buf);
+	return strstr(buf, "DRRS refresh rate: low");
 }
 
-static struct modeset_params *pick_params(const struct test_mode *t)
+static void drrs_print_status(void)
 {
-	switch (t->screen) {
-	case SCREEN_PRIM:
-		return &prim_mode_params;
-	case SCREEN_SCND:
-		return &scnd_mode_params;
-	case SCREEN_OFFSCREEN:
-		return NULL;
-	default:
-		igt_assert(false);
-	}
+	char buf[MAX_DRRS_STATUS_BUF_LEN];
+
+	debugfs_read_crtc("i915_drrs_status", buf);
+	igt_info("DRRS STATUS :\n%s\n", buf);
 }
 
-static struct fb_region *pick_target(const struct test_mode *t,
-				     struct modeset_params *params)
+static struct timespec fbc_get_last_action(void)
 {
-	if (!params)
-		return &offscreen_fb;
+	struct timespec ret = { 0, 0 };
+	char buf[128];
+	char *action;
+	ssize_t n_read;
 
-	switch (t->plane) {
-	case PLANE_PRI:
-		return &params->primary;
-	case PLANE_CUR:
-		return &params->cursor;
-	case PLANE_SPR:
-		return &params->sprite;
-	default:
-		igt_assert(false);
-	}
+
+	debugfs_read_crtc("i915_fbc_status", buf);
+	action = strstr(buf, "\nLast action:");
+	igt_assert(action);
+
+	n_read = sscanf(action, "Last action: %ld.%ld",
+			&ret.tv_sec, &ret.tv_nsec);
+	igt_assert(n_read == 2);
+
+	return ret;
 }
 
-static void do_flush(const struct test_mode *t)
+static bool fbc_last_action_changed(void)
 {
-	struct modeset_params *params = pick_params(t);
-	struct fb_region *target = pick_target(t, params);
+	struct timespec t_new, t_old;
 
-	if (is_i915_device(drm.fd))
-		gem_set_domain(drm.fd, target->fb->gem_handle, I915_GEM_DOMAIN_GTT, 0);
-}
+	t_old = fbc.last_action;
+	t_new = fbc_get_last_action();
 
-#define DONT_ASSERT_CRC			(1 << 0)
-#define DONT_ASSERT_FEATURE_STATUS	(1 << 1)
-#define DONT_ASSERT_FBC_STATUS		(1 << 12)
+	fbc.last_action = t_new;
 
-#define FBC_ASSERT_FLAGS		(0xF << 2)
-#define ASSERT_FBC_ENABLED		(1 << 2)
-#define ASSERT_FBC_DISABLED		(1 << 3)
-#define ASSERT_LAST_ACTION_CHANGED	(1 << 4)
-#define ASSERT_NO_ACTION_CHANGE		(1 << 5)
+#if 0
+	igt_info("old: %ld.%ld\n", t_old.tv_sec, t_old.tv_nsec);
+	igt_info("new: %ld.%ld\n", t_new.tv_sec, t_new.tv_nsec);
+#endif
 
-#define PSR_ASSERT_FLAGS		(3 << 6)
-#define ASSERT_PSR_ENABLED		(1 << 6)
-#define ASSERT_PSR_DISABLED		(1 << 7)
+	return t_old.tv_sec != t_new.tv_sec ||
+	       t_old.tv_nsec != t_new.tv_nsec;
+}
 
-#define DRRS_ASSERT_FLAGS		(7 << 8)
-#define ASSERT_DRRS_HIGH		(1 << 8)
-#define ASSERT_DRRS_LOW			(1 << 9)
-#define ASSERT_DRRS_INACTIVE		(1 << 10)
+static void fbc_update_last_action(void)
+{
+	if (!fbc.supports_last_action)
+		return;
+
+	fbc.last_action = fbc_get_last_action();
 
-#define ASSERT_NO_IDLE_GPU		(1 << 11)
+#if 0
+	igt_info("Last action: %ld.%ld\n",
+		 fbc.last_action.tv_sec, fbc.last_action.tv_nsec);
+#endif
+}
 
-static int adjust_assertion_flags(const struct test_mode *t, int flags)
+static void fbc_setup_last_action(void)
 {
-	if (!(flags & DONT_ASSERT_FEATURE_STATUS)) {
-		if (!(flags & ASSERT_FBC_DISABLED))
-			flags |= ASSERT_FBC_ENABLED;
-		if (!(flags & ASSERT_PSR_DISABLED))
-			flags |= ASSERT_PSR_ENABLED;
-		if (!((flags & ASSERT_DRRS_LOW) ||
-		    (flags & ASSERT_DRRS_INACTIVE)))
-			flags |= ASSERT_DRRS_HIGH;
+	ssize_t n_read;
+	char buf[128];
+	char *action;
+
+
+	debugfs_read_crtc("i915_fbc_status", buf);
+	action = strstr(buf, "\nLast action:");
+	if (!action) {
+		igt_info("FBC last action not supported\n");
+		return;
 	}
 
-	if ((t->feature & FEATURE_FBC) == 0 || (flags & DONT_ASSERT_FBC_STATUS))
-		flags &= ~FBC_ASSERT_FLAGS;
-	if ((t->feature & FEATURE_PSR) == 0)
-		flags &= ~PSR_ASSERT_FLAGS;
-	if ((t->feature & FEATURE_DRRS) == 0)
-		flags &= ~DRRS_ASSERT_FLAGS;
+	fbc.supports_last_action = true;
 
-	return flags;
+	n_read = sscanf(action, "Last action: %ld.%ld",
+			&fbc.last_action.tv_sec, &fbc.last_action.tv_nsec);
+	igt_assert(n_read == 2);
 }
 
-static void do_crc_assertions(int flags)
+static bool fbc_is_compressing(void)
 {
-	igt_crc_t crc;
-
-	if (!opt.check_crc || (flags & DONT_ASSERT_CRC))
-		return;
+	char buf[128];
 
-	collect_crc(&crc);
-	print_crc("Calculated CRC:", &crc);
+	debugfs_read_crtc("i915_fbc_status", buf);
+	return strstr(buf, "\nCompressing: yes\n") != NULL;
+}
 
-	igt_assert(wanted_crc);
-	igt_assert_crc_equal(&crc, wanted_crc);
+static bool fbc_wait_for_compression(void)
+{
+	return igt_wait(fbc_is_compressing(), 2000, 1);
 }
 
-static void do_status_assertions(int flags)
+static bool fbc_not_enough_stolen(void)
 {
-	if (!opt.check_status) {
-		/* Make sure we settle before continuing. */
-		sleep(1);
-		return;
-	}
+	char buf[128];
 
-	if (flags & ASSERT_DRRS_HIGH) {
-		if (!is_drrs_high()) {
-			drrs_print_status();
-			igt_assert_f(false, "DRRS HIGH\n");
-		}
-	} else if (flags & ASSERT_DRRS_LOW) {
-		if (!drrs_wait_until_rr_switch_to_low()) {
-			drrs_print_status();
-			igt_assert_f(false, "DRRS LOW\n");
-		}
-	} else if (flags & ASSERT_DRRS_INACTIVE) {
-		if (!intel_is_drrs_inactive(drm.fd, prim_mode_params.pipe)) {
-			drrs_print_status();
-			igt_assert_f(false, "DRRS INACTIVE\n");
-		}
-	}
+	debugfs_read_crtc("i915_fbc_status", buf);
+	return strstr(buf, "FBC disabled: not enough stolen memory\n");
+}
 
-	if (flags & ASSERT_FBC_ENABLED) {
-		igt_require(!fbc_not_enough_stolen());
-		igt_require(!fbc_stride_not_supported());
-		igt_require(!fbc_mode_too_large());
-		if (!intel_fbc_wait_until_enabled(drm.fd, prim_mode_params.pipe)) {
-			igt_assert_f(intel_fbc_is_enabled(drm.fd,
-						    prim_mode_params.pipe,
-						    IGT_LOG_WARN),
-				     "FBC disabled\n");
-		}
+static bool fbc_stride_not_supported(void)
+{
+	char buf[128];
 
-		if (opt.fbc_check_compression)
-			igt_assert(fbc_wait_for_compression());
-	} else if (flags & ASSERT_FBC_DISABLED) {
-		igt_assert(!intel_fbc_wait_until_enabled(drm.fd,
-						   prim_mode_params.pipe));
-	}
+	debugfs_read_crtc("i915_fbc_status", buf);
+	return strstr(buf, "FBC disabled: framebuffer stride not supported\n");
+}
 
-	if (flags & ASSERT_PSR_ENABLED)
-		igt_assert_f(psr_wait_entry(drm.debugfs, PSR_MODE_1, NULL),
-			     "PSR still disabled\n");
-	else if (flags & ASSERT_PSR_DISABLED)
-		igt_assert_f(psr_wait_update(drm.debugfs, PSR_MODE_1, NULL),
-			     "PSR still enabled\n");
+static bool fbc_mode_too_large(void)
+{
+	char buf[128];
+
+	debugfs_read_crtc("i915_fbc_status", buf);
+	return strstr(buf, "FBC disabled: mode too large for compression\n");
 }
 
-static void __do_assertions(const struct test_mode *t, int flags,
-			    int line)
+static bool fbc_enable_per_plane(int plane_index, enum pipe pipe)
 {
-	flags = adjust_assertion_flags(t, flags);
+	char buf[PATH_MAX];
+	char buf_plane[128];
 
-	/* Make sure any submitted rendering is now idle. */
-	if (!(flags & ASSERT_NO_IDLE_GPU))
-		gem_quiescent_gpu(drm.fd);
+	sprintf(buf_plane, "%d%s", plane_index, kmstest_pipe_name(pipe));
 
-	igt_debug("checking asserts in line %i\n", line);
+	debugfs_read_crtc("i915_fbc_status", buf);
+	return strstr(strstr(buf, "*"), buf_plane);
+}
 
-	wait_user(2, "Paused before assertions.");
+static bool drrs_wait_until_rr_switch_to_low(void)
+{
+	return igt_wait(is_drrs_low(), 5000, 1);
+}
 
-	/* Check the CRC to make sure the drawing operations work
-	 * immediately, independently of the features being enabled. */
-	do_crc_assertions(flags);
+static struct rect pat1_get_rect(struct fb_region *fb, int r)
+{
+	struct rect rect;
 
-	/* Now we can flush things to make the test faster. */
-	do_flush(t);
+	switch (r) {
+	case 0:
+		rect.x = 0;
+		rect.y = 0;
+		rect.w = fb->w / 8;
+		rect.h = fb->h / 8;
+		rect.color = pick_color(fb->fb, COLOR_GREEN);
+		break;
+	case 1:
+		rect.x = fb->w / 8 * 4;
+		rect.y = fb->h / 8 * 4;
+		rect.w = fb->w / 8 * 2;
+		rect.h = fb->h / 8 * 2;
+		rect.color = pick_color(fb->fb, COLOR_RED);
+		break;
+	case 2:
+		rect.x = fb->w / 16 + 1;
+		rect.y = fb->h / 16 + 1;
+		rect.w = fb->w / 8 + 1;
+		rect.h = fb->h / 8 + 1;
+		rect.color = pick_color(fb->fb, COLOR_MAGENTA);
+		break;
+	case 3:
+		rect.x = fb->w - 1;
+		rect.y = fb->h - 1;
+		rect.w = 1;
+		rect.h = 1;
+		rect.color = pick_color(fb->fb, COLOR_CYAN);
+		break;
+	default:
+		igt_assert(false);
+	}
 
-	do_status_assertions(flags);
+	return rect;
+}
 
-	/* Check CRC again to make sure the compressed screen is ok,
-	 * except if we're not drawing on the primary screen. On this
-	 * case, the first check should be enough and a new CRC check
-	 * would only delay the test suite while adding no value to the
-	 * test suite. */
-	if (t->screen == SCREEN_PRIM)
-		do_crc_assertions(flags);
+static struct rect pat2_get_rect(struct fb_region *fb, int r)
+{
+	struct rect rect;
 
-	if (fbc.supports_last_action && opt.fbc_check_last_action) {
-		if (flags & ASSERT_LAST_ACTION_CHANGED)
-			igt_assert(fbc_last_action_changed());
-		else if (flags & ASSERT_NO_ACTION_CHANGE)
-			igt_assert(!fbc_last_action_changed());
+	rect.x = 0;
+	rect.y = 0;
+	rect.w = 64;
+	rect.h = 64;
+
+	switch (r) {
+	case 0:
+		rect.color = pick_color(fb->fb, COLOR_GREEN);
+		break;
+	case 1:
+		rect.x = 31;
+		rect.y = 31;
+		rect.w = 31;
+		rect.h = 31;
+		rect.color = pick_color(fb->fb, COLOR_RED);
+		break;
+	case 2:
+		rect.x = 16;
+		rect.y = 16;
+		rect.w = 32;
+		rect.h = 32;
+		rect.color = pick_color(fb->fb, COLOR_MAGENTA);
+		break;
+	case 3:
+		rect.color = pick_color(fb->fb, COLOR_CYAN);
+		break;
+	default:
+		igt_assert(false);
 	}
 
-	wait_user(1, "Paused after assertions.");
+	return rect;
 }
 
-#define do_assertions(__flags) __do_assertions(t, (__flags), __LINE__)
-
-static void enable_prim_screen_and_wait(const struct test_mode *t)
+static struct rect pat3_get_rect(struct fb_region *fb, int r)
 {
-	fill_fb_region(&prim_mode_params.primary, t->method, COLOR_PRIM_BG);
-	set_mode_for_params(&prim_mode_params);
+	struct rect rect;
 
-	wanted_crc = &blue_crcs[t->format].crc;
-	fbc_update_last_action();
+	rect.w = 64;
+	rect.h = 64;
+	rect.color = pick_color(fb->fb, COLOR_GREEN);
+
+	switch (r) {
+	case 0:
+		rect.x = 0;
+		rect.y = 0;
+		break;
+	case 1:
+		rect.x = 64;
+		rect.y = 64;
+		break;
+	case 2:
+		rect.x = 1;
+		rect.y = 1;
+		break;
+	case 3:
+		rect.x = fb->w - 64;
+		rect.y = fb->h - 64;
+		break;
+	case 4:
+		rect.x = fb->w / 2 - 32;
+		rect.y = fb->h / 2 - 32;
+		break;
+	default:
+		igt_assert(false);
+	}
 
-	do_assertions(ASSERT_NO_ACTION_CHANGE);
+	return rect;
 }
 
-static void update_modeset_cached_params(enum igt_draw_method method)
+static struct rect pat4_get_rect(struct fb_region *fb, int r)
 {
-	bool found = false;
-
-	igt_output_set_pipe(prim_mode_params.output, prim_mode_params.pipe);
-	igt_output_set_pipe(scnd_mode_params.output, scnd_mode_params.pipe);
-
-	found = igt_override_all_active_output_modes_to_fit_bw(&drm.display);
-	igt_require_f(found, "No valid mode combo found.\n");
-
-	prim_mode_params.mode = *igt_output_get_mode(prim_mode_params.output);
-	prim_mode_params.primary.w = prim_mode_params.mode.hdisplay;
-	prim_mode_params.primary.h = prim_mode_params.mode.vdisplay;
+	struct rect rect;
 
-	scnd_mode_params.mode = *igt_output_get_mode(scnd_mode_params.output);
-	scnd_mode_params.primary.w = scnd_mode_params.mode.hdisplay;
-	scnd_mode_params.primary.h = scnd_mode_params.mode.vdisplay;
+	igt_assert_eq(r, 0);
 
-	fill_fb_region(&prim_mode_params.primary, method, COLOR_PRIM_BG);
-	fill_fb_region(&scnd_mode_params.primary, method, COLOR_SCND_BG);
+	rect.x = 0;
+	rect.y = 0;
+	rect.w = fb->w;
+	rect.h = fb->h;
+	rect.color = pick_color(fb->fb, COLOR_GREEN);
 
-	__set_mode_for_params(&prim_mode_params);
-	__set_mode_for_params(&scnd_mode_params);
+	return rect;
 }
 
-static void enable_both_screens_and_wait(const struct test_mode *t)
+static void fb_dirty_ioctl(struct fb_region *fb, struct rect *rect)
 {
-	int ret;
-
-	fill_fb_region(&prim_mode_params.primary, t->method, COLOR_PRIM_BG);
-	fill_fb_region(&scnd_mode_params.primary, t->method, COLOR_SCND_BG);
-
-	__set_mode_for_params(&prim_mode_params);
-	__set_mode_for_params(&scnd_mode_params);
+	int rc;
+	drmModeClip clip = {
+		.x1 = rect->x,
+		.x2 = rect->x + rect->w,
+		.y1 = rect->y,
+		.y2 = rect->y + rect->h,
+	};
 
-	if (drm.display.is_atomic)
-		ret = igt_display_try_commit_atomic(&drm.display,
-				DRM_MODE_ATOMIC_TEST_ONLY |
-				DRM_MODE_ATOMIC_ALLOW_MODESET,
-				NULL);
-	else
-		ret = igt_display_try_commit2(&drm.display, COMMIT_LEGACY);
+	rc = drmModeDirtyFB(drm.fd, fb->fb->fb_id, &clip, 1);
 
-	if (ret)
-		update_modeset_cached_params(t->method);
+	igt_assert(rc == 0 || rc == -ENOSYS);
+}
 
-	igt_display_commit2(&drm.display, drm.display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
+static void draw_rect(struct draw_pattern_info *pattern, struct fb_region *fb,
+		      enum igt_draw_method method, int r)
+{
+	struct rect rect = pattern->get_rect(fb, r);
 
-	wanted_crc = &blue_crcs[t->format].crc;
-	fbc_update_last_action();
+	igt_draw_rect_fb(drm.fd, drm.bops, 0, fb->fb, method,
+			 fb->x + rect.x, fb->y + rect.y,
+			 rect.w, rect.h, rect.color);
 
-	do_assertions(ASSERT_NO_ACTION_CHANGE);
+	fb_dirty_ioctl(fb, &rect);
 }
 
-static void set_region_for_test(const struct test_mode *t,
-				struct fb_region *reg)
+static void draw_rect_igt_fb(struct draw_pattern_info *pattern,
+			     struct igt_fb *fb, enum igt_draw_method method,
+			     int r)
 {
-	fill_fb_region(reg, t->method, COLOR_PRIM_BG);
-
-	igt_plane_set_fb(reg->plane, reg->fb);
-	igt_plane_set_position(reg->plane, 0, 0);
-	igt_plane_set_size(reg->plane, reg->w, reg->h);
-	igt_fb_set_size(reg->fb, reg->plane, reg->w, reg->h);
+	struct fb_region region = {
+		.fb = fb,
+		.x = 0,
+		.y = 0,
+		.w = fb->width,
+		.h = fb->height,
+	};
 
-	igt_display_commit(&drm.display);
-	do_assertions(ASSERT_NO_ACTION_CHANGE);
+	draw_rect(pattern, &region, method, r);
 }
 
-static void set_plane_for_test_fbc(const struct test_mode *t, igt_plane_t *plane)
+static void fill_fb_region(struct fb_region *region,
+			   enum igt_draw_method method,
+			   enum color ecolor)
 {
-	struct igt_fb fb;
-	uint32_t color;
-
-	igt_info("Testing fbc on plane %i%s\n", plane->index + 1, kmstest_pipe_name(prim_mode_params.pipe));
+	uint32_t color = pick_color(region->fb, ecolor);
 
-	create_fb(t->format, prim_mode_params.mode.hdisplay, prim_mode_params.mode.vdisplay, t->tiling, t->plane, &fb);
-	color = pick_color(&fb, COLOR_PRIM_BG);
-	igt_draw_rect_fb(drm.fd, drm.bops, 0, &fb, t->method,
-			 0, 0, fb.width, fb.height,
+	igt_draw_rect_fb(drm.fd, drm.bops, 0, region->fb, method,
+			 region->x, region->y, region->w, region->h,
 			 color);
+}
 
-	igt_plane_set_fb(plane, &fb);
-	igt_plane_set_position(plane, 0, 0);
-	igt_plane_set_size(plane, prim_mode_params.mode.hdisplay, prim_mode_params.mode.vdisplay);
-	igt_fb_set_size(&fb, plane, prim_mode_params.mode.hdisplay, prim_mode_params.mode.vdisplay);
-	igt_display_commit_atomic(&drm.display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
-
-	fbc_update_last_action();
-	do_assertions(ASSERT_FBC_ENABLED | ASSERT_NO_ACTION_CHANGE);
-	igt_assert_f(fbc_enable_per_plane(plane->index + 1, prim_mode_params.pipe), "FBC disabled\n");
+static void _fb_dirty_ioctl(struct fb_region *region)
+{
+	struct rect rect;
 
-	igt_remove_fb(drm.fd, &fb);
-	igt_plane_set_fb(plane, NULL);
-	igt_display_commit2(&drm.display, COMMIT_ATOMIC);
+	rect.x = region->x;
+	rect.y = region->y;
+	rect.w = region->w;
+	rect.h = region->h;
+	fb_dirty_ioctl(region, &rect);
 }
 
-static bool enable_features_for_test(const struct test_mode *t)
+static void unset_all_crtcs(void)
 {
-	bool ret = false;
+	igt_display_reset(&drm.display);
+	igt_display_commit(&drm.display);
+}
 
+static bool disable_features(const struct test_mode *t)
+{
 	if (t->feature == FEATURE_DEFAULT)
 		return false;
 
-	if (t->feature & FEATURE_FBC)
-		intel_fbc_enable(drm.fd);
-	if (t->feature & FEATURE_PSR)
-		ret = psr_enable(drm.fd, drm.debugfs, PSR_MODE_1);
-	if (t->feature & FEATURE_DRRS)
-		intel_drrs_enable(drm.fd, prim_mode_params.pipe);
+	intel_fbc_disable(drm.fd);
+	intel_drrs_disable(drm.fd, prim_mode_params.pipe);
 
-	return ret;
+	return psr.can_test ? psr_disable(drm.fd, drm.debugfs) : false;
 }
 
-static void check_test_requirements(const struct test_mode *t)
+static void *busy_thread_func(void *data)
 {
-	int ver;
-
-	if (t->pipes == PIPE_DUAL)
-		igt_require_f(scnd_mode_params.output,
-			    "Can't test dual pipes with the current outputs\n");
-
-	if (t->feature & FEATURE_FBC)
-		igt_require_f(fbc.can_test,
-			      "Can't test FBC with this chipset\n");
-
-	if (t->feature & FEATURE_PSR) {
-		igt_require_f(psr.can_test,
-			      "Can't test PSR with the current outputs\n");
-	}
-
-	if (t->feature & FEATURE_DRRS)
-		igt_require_f(drrs.can_test,
-			      "Can't test DRRS with the current outputs\n");
-
-	/*
-	 * In kernel, When PSR is enabled, DRRS will be disabled. So If a test
-	 * case needs DRRS + PSR enabled, that will be skipped.
-	 */
-	igt_require_f(!((t->feature & FEATURE_PSR) &&
-		      (t->feature & FEATURE_DRRS)),
-		      "Can't test PSR and DRRS together\n");
-
-	if (opt.only_pipes != PIPE_COUNT)
-		igt_require(t->pipes == opt.only_pipes);
-
-	/* Kernel disables fbc for display versions 12 and 13 if psr is enabled. */
-	ver = intel_display_ver(intel_get_drm_devid(drm.fd));
-	if (ver >= 12 && ver <= 13)
-		igt_require_f(!((t->feature & FEATURE_PSR) &&
-				(t->feature & FEATURE_FBC)),
-			      "Can't test PSR and FBC together\n");
+	while (!busy_thread.stop)
+		igt_draw_rect(drm.fd, drm.bops, 0, busy_thread.handle,
+			      busy_thread.size, busy_thread.stride,
+			      busy_thread.tiling, IGT_DRAW_BLT, 0, 0,
+			      busy_thread.width, busy_thread.height,
+			      busy_thread.color, busy_thread.bpp);
 
+	pthread_exit(0);
 }
 
-static void set_crtc_fbs(const struct test_mode *t)
+static void start_busy_thread(struct igt_fb *fb)
 {
-	struct screen_fbs *s = &fbs[t->format];
+	int rc;
 
-	create_fbs(t->format, t->tiling);
+	igt_assert(busy_thread.stop == true);
+	busy_thread.stop = false;
+	busy_thread.handle = fb->gem_handle;
+	busy_thread.size = fb->size;
+	busy_thread.stride = fb->strides[0];
+	busy_thread.width = fb->width;
+	busy_thread.height = fb->height;
+	busy_thread.color = pick_color(fb, COLOR_PRIM_BG);
+	busy_thread.bpp = igt_drm_format_to_bpp(fb->drm_format);
+	busy_thread.tiling = igt_fb_mod_to_tiling(fb->modifier);
 
-	switch (t->fbs) {
-	case FBS_INDIVIDUAL:
-		prim_mode_params.primary.fb = &s->prim_pri;
-		scnd_mode_params.primary.fb = &s->scnd_pri;
-		offscreen_fb.fb = &s->offscreen;
+	rc = pthread_create(&busy_thread.thread, NULL, busy_thread_func, NULL);
+	igt_assert_eq(rc, 0);
+}
 
-		prim_mode_params.primary.x = 0;
-		scnd_mode_params.primary.x = 0;
-		offscreen_fb.x = 0;
+static void stop_busy_thread(void)
+{
+	if (!busy_thread.stop) {
+		busy_thread.stop = true;
+		igt_assert(pthread_join(busy_thread.thread, NULL) == 0);
+	}
+}
 
-		prim_mode_params.primary.y = 0;
-		scnd_mode_params.primary.y = 0;
-		offscreen_fb.y = 0;
-		break;
-	case FBS_SHARED:
-		/* Please see the comment at the top of create_shared_fb(). */
-		prim_mode_params.primary.fb = &s->big;
-		scnd_mode_params.primary.fb = &s->big;
-		offscreen_fb.fb = &s->big;
+static void print_crc(const char *str, igt_crc_t *crc)
+{
+	char *pipe_str;
 
-		prim_mode_params.primary.x = opt.shared_fb_x_offset;
-		scnd_mode_params.primary.x = opt.shared_fb_x_offset;
-		offscreen_fb.x = opt.shared_fb_x_offset;
+	pipe_str = igt_crc_to_string(crc);
 
-		prim_mode_params.primary.y = opt.shared_fb_y_offset;
-		scnd_mode_params.primary.y = prim_mode_params.primary.y +
-					prim_mode_params.primary.h;
-		offscreen_fb.y = scnd_mode_params.primary.y + scnd_mode_params.primary.h;
-		break;
-	default:
-		igt_assert(false);
-	}
+	igt_debug("%s pipe:[%s]\n", str, pipe_str);
 
-	prim_mode_params.cursor.fb = &s->prim_cur;
-	prim_mode_params.sprite.fb = &s->prim_spr;
-	scnd_mode_params.cursor.fb = &s->scnd_cur;
-	scnd_mode_params.sprite.fb = &s->scnd_spr;
+	free(pipe_str);
 }
 
-static void prepare_subtest_data(const struct test_mode *t,
-				 struct draw_pattern_info *pattern)
+static void collect_crc(igt_crc_t *crc)
 {
-	bool need_modeset;
+	igt_pipe_crc_collect_crc(pipe_crc, crc);
+}
 
-	check_test_requirements(t);
+static void init_blue_crc(enum pixel_format format, enum tiling_type tiling)
+{
+	struct igt_fb blue;
 
-	stop_busy_thread();
+	if (blue_crcs[format].initialized)
+		return;
 
-	need_modeset = disable_features(t);
-	set_crtc_fbs(t);
+	create_fb(format, prim_mode_params.mode.hdisplay,
+		  prim_mode_params.mode.vdisplay, tiling, PLANE_PRI,
+		  &blue);
 
-	if (t->screen == SCREEN_OFFSCREEN)
-		fill_fb_region(&offscreen_fb, t->method, COLOR_OFFSCREEN_BG);
+	fill_fb(&blue, COLOR_PRIM_BG);
 
-	igt_display_reset(&drm.display);
-	if (need_modeset)
-		igt_display_commit(&drm.display);
+	igt_output_set_pipe(prim_mode_params.output, prim_mode_params.pipe);
+	igt_output_override_mode(prim_mode_params.output, &prim_mode_params.mode);
+	igt_plane_set_fb(prim_mode_params.primary.plane, &blue);
+	igt_display_commit(&drm.display);
 
-	init_blue_crc(t->format, t->tiling);
-	if (pattern)
-		init_crcs(t->format, t->tiling, pattern);
+	if (!pipe_crc) {
+		pipe_crc = igt_pipe_crc_new(drm.fd, prim_mode_params.pipe,
+					    IGT_PIPE_CRC_SOURCE_AUTO);
+		igt_assert(pipe_crc);
+	}
 
-	need_modeset = enable_features_for_test(t);
-	if (need_modeset)
-		igt_display_commit(&drm.display);
-}
+	collect_crc(&blue_crcs[format].crc);
 
-static void prepare_subtest_screens(const struct test_mode *t)
-{
-	if (t->pipes == PIPE_DUAL)
-		enable_both_screens_and_wait(t);
-	else
-		enable_prim_screen_and_wait(t);
+	print_crc("Blue CRC:  ", &blue_crcs[format].crc);
 
-	if (t->screen == SCREEN_PRIM) {
-		if (t->plane == PLANE_CUR)
-			set_region_for_test(t, &prim_mode_params.cursor);
-		if (t->plane == PLANE_SPR)
-			set_region_for_test(t, &prim_mode_params.sprite);
-	}
+	igt_display_reset(&drm.display);
 
-	if (t->pipes == PIPE_DUAL && t->screen == SCREEN_SCND) {
-		if (t->plane == PLANE_CUR)
-			set_region_for_test(t, &scnd_mode_params.cursor);
-		if (t->plane == PLANE_SPR)
-			set_region_for_test(t, &scnd_mode_params.sprite);
-	}
-}
+	igt_remove_fb(drm.fd, &blue);
 
-static void prepare_subtest(const struct test_mode *t,
-			    struct draw_pattern_info *pattern)
-{
-	prepare_subtest_data(t, pattern);
-	prepare_subtest_screens(t);
+	blue_crcs[format].initialized = true;
 }
 
-/**
- * SUBTEST: drrs-%dp-rte
- * Description: Sanity test to enable DRRS with %arg[1] panels.
- * Driver requirement: i915, xe
- * Functionality: fbt, drrs
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbc-%dp-rte
- * Description: Sanity test to enable FBC with %arg[1] panels.
- * Driver requirement: i915, xe
- * Functionality: fbc, fbt
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: psr-%dp-rte
- * Description: Sanity test to enable PSR with %arg[1] panels.
- * Driver requirement: i915, xe
- * Functionality: fbt, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcdrrs-%dp-rte
- * Description: Sanity test to enable FBC & DRRS with %arg[1] panels.
- * Driver requirement: i915, xe
- * Functionality: drrs, fbc, fbt
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcpsr-%dp-rte
- * Description: Sanity test to enable FBC & PSR with %arg[1] panels.
- * Driver requirement: i915, xe
- * Functionality: fbc, fbt, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: psrdrrs-%dp-rte
- * Description: Sanity test to enable PSR & DRRS with %arg[1] panels.
- * Driver requirement: i915, xe
- * Functionality: fbt, drrs, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcpsrdrrs-%dp-rte
- * Description: Sanity test to enable FBC, PSR & DRRS with %arg[1] panels.
- * Driver requirement: i915, xe
- * Functionality: fbc, fbt, drrs, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1].values:   1, 2
- */
-
-/*
- * rte - the basic sanity test
- *
- * METHOD
- *   Just disable all screens, assert everything is disabled, then enable all
- *   screens - including primary, cursor and sprite planes - and assert that
- *   the tested feature is enabled.
- *
- * EXPECTED RESULTS
- *   Blue screens and t->feature enabled.
- *
- * FAILURES
- *   A failure here means that every other subtest will probably fail too. It
- *   probably means that the Kernel is just not enabling the feature we want.
- */
-static void rte_subtest(const struct test_mode *t)
+static void init_crcs(enum pixel_format format, enum tiling_type tiling,
+		      struct draw_pattern_info *pattern)
 {
-	prepare_subtest_data(t, NULL);
+	int r, r_;
+	struct igt_fb tmp_fbs[pattern->n_rects];
 
-	unset_all_crtcs();
-	do_assertions(ASSERT_FBC_DISABLED | ASSERT_PSR_DISABLED |
-		      DONT_ASSERT_CRC | ASSERT_DRRS_INACTIVE);
+	if (pattern->initialized[format])
+		return;
 
-	if (t->pipes == PIPE_SINGLE)
-		enable_prim_screen_and_wait(t);
-	else
-		enable_both_screens_and_wait(t);
+	pattern->crcs[format] = calloc(pattern->n_rects,
+				       sizeof(*(pattern->crcs[format])));
 
-	set_region_for_test(t, &prim_mode_params.cursor);
-	set_region_for_test(t, &prim_mode_params.sprite);
+	for (r = 0; r < pattern->n_rects; r++)
+		create_fb(format, prim_mode_params.mode.hdisplay,
+			  prim_mode_params.mode.vdisplay, tiling,
+			  PLANE_PRI, &tmp_fbs[r]);
 
-	if (t->pipes == PIPE_DUAL) {
-		set_region_for_test(t, &scnd_mode_params.cursor);
-		set_region_for_test(t, &scnd_mode_params.sprite);
+	for (r = 0; r < pattern->n_rects; r++)
+		fill_fb(&tmp_fbs[r], COLOR_PRIM_BG);
+
+	if (pattern->frames_stack) {
+		for (r = 0; r < pattern->n_rects; r++)
+			for (r_ = 0; r_ <= r; r_++)
+				draw_rect_igt_fb(pattern, &tmp_fbs[r],
+						 igt_draw_supports_method(drm.fd, IGT_DRAW_PWRITE) ?
+						 IGT_DRAW_PWRITE : IGT_DRAW_BLT,
+						 r_);
+	} else {
+		for (r = 0; r < pattern->n_rects; r++)
+			draw_rect_igt_fb(pattern, &tmp_fbs[r], igt_draw_supports_method(drm.fd, IGT_DRAW_PWRITE) ?
+					 IGT_DRAW_PWRITE : IGT_DRAW_BLT, r);
 	}
-}
 
-static bool is_valid_plane(igt_plane_t *plane)
-{
-	int index = plane->index;
+	igt_output_set_pipe(prim_mode_params.output, prim_mode_params.pipe);
+	igt_output_override_mode(prim_mode_params.output, &prim_mode_params.mode);
+	for (r = 0; r < pattern->n_rects; r++) {
+		igt_plane_set_fb(prim_mode_params.primary.plane, &tmp_fbs[r]);
+		igt_display_commit(&drm.display);
 
-	if (plane->type == DRM_PLANE_TYPE_CURSOR)
-		return false;
-	/*
-	 * Execute test only on first three planes
-	 */
-	return ((index >= 0) && (index < 3));
-}
+		collect_crc(&pattern->crcs[format][r]);
+	}
 
-/**
- * plane-fbc-rte - the basic sanity test
- *
- * METHOD
- *   Just disable primary screen, assert everything is disabled, then enable single
- *   screens and single plane one by one  and assert that the tested fbc is enabled
- *   for the particular plane.
- *
- * EXPECTED RESULTS
- *   Blue screens and t->feature enabled.
- *
- * FAILURES
- *   A failure here means that fbc is not getting enabled for requested plane. It means
- *   kernel is not able to enable fbc on the requested plane.
- */
+	for (r = 0; r < pattern->n_rects; r++) {
+		igt_debug("Rect %d CRC:", r);
+		print_crc("", &pattern->crcs[format][r]);
+	}
 
-static void plane_fbc_rte_subtest(const struct test_mode *t)
-{
-	int ver;
-	igt_plane_t *plane;
+	igt_display_reset(&drm.display);
 
-	ver = intel_display_ver(intel_get_drm_devid(drm.fd));
-	igt_require_f((ver >= 20), "Can't test fbc for each plane\n");
+	for (r = 0; r < pattern->n_rects; r++)
+		igt_remove_fb(drm.fd, &tmp_fbs[r]);
 
-	prepare_subtest_data(t, NULL);
-	unset_all_crtcs();
-	do_assertions(ASSERT_FBC_DISABLED | DONT_ASSERT_CRC);
+	pattern->initialized[format] = true;
+}
 
-	igt_output_override_mode(prim_mode_params.output, &prim_mode_params.mode);
-	igt_output_set_pipe(prim_mode_params.output, prim_mode_params.pipe);
+static void setup_drm(void)
+{
+	drm.fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
+	drm.debugfs = igt_debugfs_dir(drm.fd);
 
-	wanted_crc = &blue_crcs[t->format].crc;
+	kmstest_set_vt_graphics_mode();
+	igt_display_require(&drm.display, drm.fd);
 
-	for_each_plane_on_pipe(&drm.display, prim_mode_params.pipe, plane) {
-		if (!is_valid_plane(plane))
-			continue;
+	drm.bops = buf_ops_create(drm.fd);
+}
 
-		set_plane_for_test_fbc(t, plane);
-	}
+static void teardown_drm(void)
+{
+	buf_ops_destroy(drm.bops);
+	igt_display_fini(&drm.display);
+	drm_close_driver(drm.fd);
+}
 
-	igt_display_reset(&drm.display);
+static void setup_modeset(void)
+{
+	igt_require(init_modeset_cached_params());
+	offscreen_fb.fb = NULL;
+	offscreen_fb.w = 1024;
+	offscreen_fb.h = 1024;
+	create_fbs(FORMAT_DEFAULT, opt.tiling);
 }
 
-static void update_wanted_crc(const struct test_mode *t, igt_crc_t *crc)
+static void teardown_modeset(void)
 {
-	if (t->screen == SCREEN_PRIM)
-		wanted_crc = crc;
+	enum pixel_format f;
+
+	for (f = 0; f < FORMAT_COUNT; f++)
+		destroy_fbs(f);
 }
 
-static bool op_disables_psr(const struct test_mode *t,
-			    enum igt_draw_method method)
+static void setup_crcs(void)
 {
-	if (method != IGT_DRAW_MMAP_GTT)
-		return false;
-	if (t->screen == SCREEN_PRIM)
-		return true;
-	/* On FBS_SHARED, even if the target is not the PSR screen
-	 * (SCREEN_PRIM), all primary planes share the same frontbuffer, so a
-	 * write to the second screen primary plane - or offscreen plane - will
-	 * touch the framebuffer that's also used by the primary screen. */
-	if (t->fbs == FBS_SHARED && t->plane == PLANE_PRI)
-		return true;
+	enum pixel_format f;
 
-	return false;
-}
+	for (f = 0; f < FORMAT_COUNT; f++)
+		blue_crcs[f].initialized = false;
 
-/**
- * SUBTEST: drrs-1p-offscren-pri-%s-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915, xe
- * Functionality: drrs, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbc-1p-offscren-pri-%s-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915, xe
- * Functionality: fbc, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: psr-1p-offscren-pri-%s-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915, xe
- * Functionality: fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcdrrs-1p-offscren-pri-%s-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915, xe
- * Functionality: drrs, fbc, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcpsr-1p-offscren-pri-%s-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915, xe
- * Functionality: fbc, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: psrdrrs-1p-offscren-pri-%s-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915, xe
- * Functionality: drrs, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcpsrdrrs-1p-offscren-pri-%s-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915, xe
- * Functionality: drrs, fbc, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @indfb:          Individual fb
- * @shrfb:          Shared fb
- *
- * arg[2]:
- *
- * @blt:            Blitter
- * @mmap-wc:        MMAP-WC
- * @render:         Render
- */
+	pattern1.frames_stack = true;
+	pattern1.n_rects = 4;
+	pattern1.get_rect = pat1_get_rect;
+	for (f = 0; f < FORMAT_COUNT; f++) {
+		pattern1.initialized[f] = false;
+		pattern1.crcs[f] = NULL;
+	}
 
-/**
- * SUBTEST: drrs-1p-offscren-pri-%s-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- * Functionality: drrs, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbc-1p-offscren-pri-%s-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- * Functionality: fbc, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: psr-1p-offscren-pri-%s-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- * Functionality: fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcdrrs-1p-offscren-pri-%s-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- * Functionality: drrs, fbc, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcpsr-1p-offscren-pri-%s-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- * Functionality: fbc, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: psrdrrs-1p-offscren-pri-%s-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- * Functionality: drrs, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcpsrdrrs-1p-offscren-pri-%s-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- * Functionality: drrs, fbc, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @indfb:          Individual fb
- * @shrfb:          Shared fb
- *
- * arg[2]:
- *
- * @mmap-cpu:       MMAP-CPU
- * @mmap-gtt:       MMAP-GTT
- * @pwrite:         PWRITE
- */
+	pattern2.frames_stack = true;
+	pattern2.n_rects = 4;
+	pattern2.get_rect = pat2_get_rect;
+	for (f = 0; f < FORMAT_COUNT; f++) {
+		pattern2.initialized[f] = false;
+		pattern2.crcs[f] = NULL;
+	}
 
-/**
- * SUBTEST: drrs-%dp-primscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- * Functionality: drrs, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbc-%dp-primscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- * Functionality: fbc, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: psr-%dp-primscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- * Functionality: fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcdrrs-%dp-primscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- * Functionality: drrs, fbc, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcpsr-%dp-primscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- * Functionality: fbc, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: psrdrrs-%dp-primscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- * Functionality: drrs, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcpsrdrrs-%dp-primscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- * Functionality: drrs, fbc, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1].values:   1, 2
- *
- * arg[2]:
- *
- * @cur:            Cursor plane
- * @pri:            Primary plane
- * @spr:            Sprite plane
- *
- * arg[3]:
- *
- * @mmap-cpu:       MMAP-CPU
- * @mmap-gtt:       MMAP-GTT
- * @pwrite:         PWRITE
- */
+	pattern3.frames_stack = false;
+	pattern3.n_rects = 5;
+	pattern3.get_rect = pat3_get_rect;
+	for (f = 0; f < FORMAT_COUNT; f++) {
+		pattern3.initialized[f] = false;
+		pattern3.crcs[f] = NULL;
+	}
+
+	pattern4.frames_stack = false;
+	pattern4.n_rects = 1;
+	pattern4.get_rect = pat4_get_rect;
+	for (f = 0; f < FORMAT_COUNT; f++) {
+		pattern4.initialized[f] = false;
+		pattern4.crcs[f] = NULL;
+	}
+}
+
+static void teardown_crcs(void)
+{
+	enum pixel_format f;
+
+	for (f = 0; f < FORMAT_COUNT; f++) {
+		if (pattern1.crcs[f])
+			free(pattern1.crcs[f]);
+		if (pattern2.crcs[f])
+			free(pattern2.crcs[f]);
+		if (pattern3.crcs[f])
+			free(pattern3.crcs[f]);
+		if (pattern4.crcs[f])
+			free(pattern4.crcs[f]);
+	}
 
-/**
- * SUBTEST: drrs-%dp-primscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915, xe
- * Functionality: drrs, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbc-%dp-primscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915, xe
- * Functionality: fbc, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: psr-%dp-primscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915, xe
- * Functionality: fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcdrrs-%dp-primscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915, xe
- * Functionality: drrs, fbc, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcpsr-%dp-primscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915, xe
- * Functionality: fbc, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: psrdrrs-%dp-primscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915, xe
- * Functionality: drrs, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcpsrdrrs-%dp-primscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915, xe
- * Functionality: drrs, fbc, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1].values:   1, 2
- *
- * arg[2]:
- *
- * @cur:            Cursor plane
- * @pri:            Primary plane
- * @spr:            Sprite plane
- *
- * arg[3]:
- *
- * @blt:            Blitter
- * @mmap-wc:        MMAP-WC
- * @render:         Render
- */
+	igt_pipe_crc_free(pipe_crc);
+}
 
-/**
- * SUBTEST: drrs-%dp-primscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915, xe
- * Functionality: drrs, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbc-%dp-primscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915, xe
- * Functionality: fbc, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: psr-%dp-primscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915, xe
- * Functionality: fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcdrrs-%dp-primscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915, xe
- * Functionality: drrs, fbc, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcpsr-%dp-primscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915, xe
- * Functionality: fbc, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: psrdrrs-%dp-primscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915, xe
- * Functionality: drrs, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcpsrdrrs-%dp-primscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915, xe
- * Functionality: drrs, fbc, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1].values:   1, 2
- *
- * arg[2]:
- *
- * @blt:            Blitter
- * @mmap-wc:        MMAP-WC
- * @render:         Render
- */
+static void setup_fbc(void)
+{
+	if (!intel_fbc_supported_on_chipset(drm.fd, prim_mode_params.pipe)) {
+		igt_info("Can't test FBC: not supported on this chipset\n");
+		return;
+	}
 
-/**
- * SUBTEST: drrs-%dp-primscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- * Functionality: drrs, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbc-%dp-primscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- * Functionality: fbc, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: psr-%dp-primscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- * Functionality: fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcdrrs-%dp-primscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- * Functionality: drrs, fbc, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcpsr-%dp-primscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- * Functionality: fbc, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: psrdrrs-%dp-primscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- * Functionality: drrs, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcpsrdrrs-%dp-primscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- * Functionality: drrs, fbc, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1].values:   1, 2
- *
- * arg[2]:
- *
- * @mmap-cpu:       MMAP-CPU
- * @mmap-gtt:       MMAP-GTT
- * @pwrite:         PWRITE
- */
+	fbc.can_test = true;
 
-/**
- * SUBTEST: drrs-2p-scndscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915, xe
- * Functionality: drrs, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbc-2p-scndscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915, xe
- * Functionality: fbc, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: psr-2p-scndscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915, xe
- * Functionality: fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcdrrs-2p-scndscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915, xe
- * Functionality: drrs, fbc, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcpsr-2p-scndscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915, xe
- * Functionality: fbc, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: psrdrrs-2p-scndscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915, xe
- * Functionality: drrs, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcpsrdrrs-2p-scndscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915, xe
- * Functionality: drrs, fbc, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @cur:            Cursor plane
- * @pri:            Primary plane
- * @spr:            Sprite plane
- *
- * arg[2]:
- *
- * @blt:            Blitter
- * @mmap-wc:        MMAP-WC
- * @render:         Render
- */
+	fbc_setup_last_action();
+}
 
-/**
- * SUBTEST: drrs-2p-scndscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- * Functionality: drrs, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbc-2p-scndscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- * Functionality: fbc, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: psr-2p-scndscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- * Functionality: fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcdrrs-2p-scndscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- * Functionality: drrs, fbc, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcpsr-2p-scndscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- * Functionality: fbc, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: psrdrrs-2p-scndscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- * Functionality: drrs, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcpsrdrrs-2p-scndscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- * Functionality: drrs, fbc, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @cur:            Cursor plane
- * @pri:            Primary plane
- * @spr:            Sprite plane
- *
- * arg[2]:
- *
- * @mmap-cpu:       MMAP-CPU
- * @mmap-gtt:       MMAP-GTT
- * @pwrite:         PWRITE
- */
+static void teardown_fbc(void)
+{
+}
 
-/**
- * SUBTEST: drrs-2p-scndscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915, xe
- * Functionality: drrs, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbc-2p-scndscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915, xe
- * Functionality: fbc, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: psr-2p-scndscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915, xe
- * Functionality: fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcdrrs-2p-scndscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915, xe
- * Functionality: drrs, fbc, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcpsr-2p-scndscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915, xe
- * Functionality: fbc, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: psrdrrs-2p-scndscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915, xe
- * Functionality: drrs, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcpsrdrrs-2p-scndscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915, xe
- * Functionality: drrs, fbc, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @blt:            Blitter
- * @mmap-wc:        MMAP-WC
- * @render:         Render
- */
+static void setup_psr(void)
+{
+	if (prim_mode_params.output->config.connector->connector_type !=
+	    DRM_MODE_CONNECTOR_eDP) {
+		igt_info("Can't test PSR: no usable eDP screen.\n");
+		return;
+	}
 
-/**
- * SUBTEST: drrs-2p-scndscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- * Functionality: drrs, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbc-2p-scndscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- * Functionality: fbc, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: psr-2p-scndscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- * Functionality: fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcdrrs-2p-scndscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- * Functionality: drrs, fbc, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcpsr-2p-scndscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- * Functionality: fbc, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: psrdrrs-2p-scndscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- * Functionality: drrs, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcpsrdrrs-2p-scndscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- * Functionality: drrs, fbc, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @mmap-cpu:       MMAP-CPU
- * @mmap-gtt:       MMAP-GTT
- * @pwrite:         PWRITE
- */
+	if (!psr_sink_support(drm.fd, drm.debugfs, PSR_MODE_1, NULL)) {
+		igt_info("Can't test PSR: not supported by sink.\n");
+		return;
+	}
+	psr.can_test = true;
+}
 
-/*
- * draw - draw a set of rectangles on the screen using the provided method
- *
- * METHOD
- *   Just set the screens as appropriate and then start drawing a series of
- *   rectangles on the target screen. The important guy here is the drawing
- *   method used.
- *
- * EXPECTED RESULTS
- *   The feature either stays enabled or gets reenabled after the oprations. You
- *   will also see the rectangles on the target screen.
- *
- * FAILURES
- *   A failure here indicates a problem somewhere between the Kernel's
- *   frontbuffer tracking infrastructure or the feature itself. You need to pay
- *   attention to which drawing method is being used.
- */
-static void draw_subtest(const struct test_mode *t)
+static void teardown_psr(void)
 {
-	int r;
-	int assertions = 0;
-	struct draw_pattern_info *pattern;
-	struct modeset_params *params = pick_params(t);
-	struct fb_region *target;
+}
+
+static void setup_drrs(void)
+{
+	if (!intel_output_has_drrs(drm.fd, prim_mode_params.output)) {
+		igt_info("Can't test DRRS: no usable screen.\n");
+		return;
+	}
+
+	if (!intel_is_drrs_supported(drm.fd, prim_mode_params.pipe)) {
+		igt_info("Can't test DRRS: Not supported.\n");
+		return;
+	}
+
+	drrs.can_test = true;
+}
+
+static void setup_environment(void)
+{
+	setup_drm();
+	setup_modeset();
+
+	setup_fbc();
+	setup_psr();
+	setup_drrs();
+
+	setup_crcs();
+}
+
+static void teardown_environment(void)
+{
+	stop_busy_thread();
+
+	teardown_crcs();
+	teardown_psr();
+	teardown_fbc();
+	teardown_modeset();
+	teardown_drm();
+}
+
+static void wait_user(int step, const char *msg)
+{
+	if (opt.step < step)
+		return;
+
+	igt_info("%s Press enter...\n", msg);
+	while (getchar() != '\n')
+		;
+}
 
+static struct modeset_params *pick_params(const struct test_mode *t)
+{
 	switch (t->screen) {
 	case SCREEN_PRIM:
-		if (t->method != IGT_DRAW_MMAP_GTT && t->plane == PLANE_PRI)
-			assertions |= ASSERT_LAST_ACTION_CHANGED;
-		else
-			assertions |= ASSERT_NO_ACTION_CHANGE;
-		break;
+		return &prim_mode_params;
 	case SCREEN_SCND:
+		return &scnd_mode_params;
 	case SCREEN_OFFSCREEN:
-		assertions |= ASSERT_NO_ACTION_CHANGE;
-		break;
+		return NULL;
 	default:
 		igt_assert(false);
 	}
+}
+
+static struct fb_region *pick_target(const struct test_mode *t,
+				     struct modeset_params *params)
+{
+	if (!params)
+		return &offscreen_fb;
 
 	switch (t->plane) {
 	case PLANE_PRI:
-		pattern = &pattern1;
-		break;
+		return &params->primary;
 	case PLANE_CUR:
+		return &params->cursor;
 	case PLANE_SPR:
-		pattern = &pattern2;
-		break;
+		return &params->sprite;
 	default:
 		igt_assert(false);
 	}
+}
 
-	if (op_disables_psr(t, t->method))
-		assertions |= ASSERT_PSR_DISABLED;
+static void do_flush(const struct test_mode *t)
+{
+	struct modeset_params *params = pick_params(t);
+	struct fb_region *target = pick_target(t, params);
 
-	/*
-	 * On FBS_INDIVIDUAL, write to offscreen plane will not touch the
-	 * current frambuffer. Hence assert for DRRS_LOW.
-	 */
-	if ((t->fbs == FBS_INDIVIDUAL) && (t->screen == SCREEN_OFFSCREEN))
-		assertions |= ASSERT_DRRS_LOW;
+	if (is_i915_device(drm.fd))
+		gem_set_domain(drm.fd, target->fb->gem_handle, I915_GEM_DOMAIN_GTT, 0);
+}
 
-	prepare_subtest(t, pattern);
-	target = pick_target(t, params);
+#define DONT_ASSERT_CRC			(1 << 0)
+#define DONT_ASSERT_FEATURE_STATUS	(1 << 1)
+#define DONT_ASSERT_FBC_STATUS		(1 << 12)
 
-	for (r = 0; r < pattern->n_rects; r++) {
-		igt_debug("Drawing rect %d\n", r);
-		draw_rect(pattern, target, t->method, r);
-		update_wanted_crc(t, &pattern->crcs[t->format][r]);
-		do_assertions(assertions);
+#define FBC_ASSERT_FLAGS		(0xF << 2)
+#define ASSERT_FBC_ENABLED		(1 << 2)
+#define ASSERT_FBC_DISABLED		(1 << 3)
+#define ASSERT_LAST_ACTION_CHANGED	(1 << 4)
+#define ASSERT_NO_ACTION_CHANGE		(1 << 5)
+
+#define PSR_ASSERT_FLAGS		(3 << 6)
+#define ASSERT_PSR_ENABLED		(1 << 6)
+#define ASSERT_PSR_DISABLED		(1 << 7)
+
+#define DRRS_ASSERT_FLAGS		(7 << 8)
+#define ASSERT_DRRS_HIGH		(1 << 8)
+#define ASSERT_DRRS_LOW			(1 << 9)
+#define ASSERT_DRRS_INACTIVE		(1 << 10)
+
+#define ASSERT_NO_IDLE_GPU		(1 << 11)
+
+static int adjust_assertion_flags(const struct test_mode *t, int flags)
+{
+	if (!(flags & DONT_ASSERT_FEATURE_STATUS)) {
+		if (!(flags & ASSERT_FBC_DISABLED))
+			flags |= ASSERT_FBC_ENABLED;
+		if (!(flags & ASSERT_PSR_DISABLED))
+			flags |= ASSERT_PSR_ENABLED;
+		if (!((flags & ASSERT_DRRS_LOW) ||
+		    (flags & ASSERT_DRRS_INACTIVE)))
+			flags |= ASSERT_DRRS_HIGH;
 	}
+
+	if ((t->feature & FEATURE_FBC) == 0 || (flags & DONT_ASSERT_FBC_STATUS))
+		flags &= ~FBC_ASSERT_FLAGS;
+	if ((t->feature & FEATURE_PSR) == 0)
+		flags &= ~PSR_ASSERT_FLAGS;
+	if ((t->feature & FEATURE_DRRS) == 0)
+		flags &= ~DRRS_ASSERT_FLAGS;
+
+	return flags;
 }
 
-/**
- * SUBTEST: drrs-%dp-pri-indfb-multidraw
- * Description: Draw a set of rectangles on the screen using alternated drawing methods
- * Driver requirement: i915, xe
- * Functionality: drrs, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbc-%dp-pri-indfb-multidraw
- * Description: Draw a set of rectangles on the screen using alternated drawing methods
- * Driver requirement: i915, xe
- * Functionality: fbc, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: psr-%dp-pri-indfb-multidraw
- * Description: Draw a set of rectangles on the screen using alternated drawing methods
- * Driver requirement: i915, xe
- * Functionality: fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcdrrs-%dp-pri-indfb-multidraw
- * Description: Draw a set of rectangles on the screen using alternated drawing methods
- * Driver requirement: i915, xe
- * Functionality: drrs, fbc, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcpsr-%dp-pri-indfb-multidraw
- * Description: Draw a set of rectangles on the screen using alternated drawing methods
- * Driver requirement: i915, xe
- * Functionality: fbc, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: psrdrrs-%dp-pri-indfb-multidraw
- * Description: Draw a set of rectangles on the screen using alternated drawing methods
- * Driver requirement: i915, xe
- * Functionality: drrs, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcpsrdrrs-%dp-pri-indfb-multidraw
- * Description: Draw a set of rectangles on the screen using alternated drawing methods
- * Driver requirement: i915, xe
- * Functionality: drrs, fbc, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1].values:   1, 2
- */
+static void do_crc_assertions(int flags)
+{
+	igt_crc_t crc;
+
+	if (!opt.check_crc || (flags & DONT_ASSERT_CRC))
+		return;
+
+	collect_crc(&crc);
+	print_crc("Calculated CRC:", &crc);
+
+	igt_assert(wanted_crc);
+	igt_assert_crc_equal(&crc, wanted_crc);
+}
+
+static void do_status_assertions(int flags)
+{
+	if (!opt.check_status) {
+		/* Make sure we settle before continuing. */
+		sleep(1);
+		return;
+	}
+
+	if (flags & ASSERT_DRRS_HIGH) {
+		if (!is_drrs_high()) {
+			drrs_print_status();
+			igt_assert_f(false, "DRRS HIGH\n");
+		}
+	} else if (flags & ASSERT_DRRS_LOW) {
+		if (!drrs_wait_until_rr_switch_to_low()) {
+			drrs_print_status();
+			igt_assert_f(false, "DRRS LOW\n");
+		}
+	} else if (flags & ASSERT_DRRS_INACTIVE) {
+		if (!intel_is_drrs_inactive(drm.fd, prim_mode_params.pipe)) {
+			drrs_print_status();
+			igt_assert_f(false, "DRRS INACTIVE\n");
+		}
+	}
+
+	if (flags & ASSERT_FBC_ENABLED) {
+		igt_require(!fbc_not_enough_stolen());
+		igt_require(!fbc_stride_not_supported());
+		igt_require(!fbc_mode_too_large());
+		if (!intel_fbc_wait_until_enabled(drm.fd, prim_mode_params.pipe)) {
+			igt_assert_f(intel_fbc_is_enabled(drm.fd,
+						    prim_mode_params.pipe,
+						    IGT_LOG_WARN),
+				     "FBC disabled\n");
+		}
+
+		if (opt.fbc_check_compression)
+			igt_assert(fbc_wait_for_compression());
+	} else if (flags & ASSERT_FBC_DISABLED) {
+		igt_assert(!intel_fbc_wait_until_enabled(drm.fd,
+						   prim_mode_params.pipe));
+	}
+
+	if (flags & ASSERT_PSR_ENABLED)
+		igt_assert_f(psr_wait_entry(drm.debugfs, PSR_MODE_1, NULL),
+			     "PSR still disabled\n");
+	else if (flags & ASSERT_PSR_DISABLED)
+		igt_assert_f(psr_wait_update(drm.debugfs, PSR_MODE_1, NULL),
+			     "PSR still enabled\n");
+}
+
+static void __do_assertions(const struct test_mode *t, int flags,
+			    int line)
+{
+	flags = adjust_assertion_flags(t, flags);
+
+	/* Make sure any submitted rendering is now idle. */
+	if (!(flags & ASSERT_NO_IDLE_GPU))
+		gem_quiescent_gpu(drm.fd);
+
+	igt_debug("checking asserts in line %i\n", line);
+
+	wait_user(2, "Paused before assertions.");
+
+	/* Check the CRC to make sure the drawing operations work
+	 * immediately, independently of the features being enabled. */
+	do_crc_assertions(flags);
+
+	/* Now we can flush things to make the test faster. */
+	do_flush(t);
+
+	do_status_assertions(flags);
+
+	/* Check CRC again to make sure the compressed screen is ok,
+	 * except if we're not drawing on the primary screen. On this
+	 * case, the first check should be enough and a new CRC check
+	 * would only delay the test suite while adding no value to the
+	 * test suite. */
+	if (t->screen == SCREEN_PRIM)
+		do_crc_assertions(flags);
+
+	if (fbc.supports_last_action && opt.fbc_check_last_action) {
+		if (flags & ASSERT_LAST_ACTION_CHANGED)
+			igt_assert(fbc_last_action_changed());
+		else if (flags & ASSERT_NO_ACTION_CHANGE)
+			igt_assert(!fbc_last_action_changed());
+	}
+
+	wait_user(1, "Paused after assertions.");
+}
+
+#define do_assertions(__flags) __do_assertions(t, (__flags), __LINE__)
+
+static void enable_prim_screen_and_wait(const struct test_mode *t)
+{
+	fill_fb_region(&prim_mode_params.primary, t->method, COLOR_PRIM_BG);
+	set_mode_for_params(&prim_mode_params);
 
-/*
- * multidraw - draw a set of rectangles on the screen using alternated drawing
- *             methods
- *
- * METHOD
- *   This is just like the draw subtest, but now we keep alternating between two
- *   drawing methods. Each time we run multidraw_subtest we will test all the
- *   possible pairs of drawing methods.
- *
- * EXPECTED RESULTS
- *   The same as the draw subtest.
- *
- * FAILURES
- *   If you get a failure here, first you need to check whether you also get
- *   failures on the individual draw subtests. If yes, then go fix every single
- *   draw subtest first. If all the draw subtests pass but this one fails, then
- *   you have to study how one drawing method is stopping the other from
- *   properly working.
- */
-static void multidraw_subtest(const struct test_mode *t)
+	wanted_crc = &blue_crcs[t->format].crc;
+	fbc_update_last_action();
+
+	do_assertions(ASSERT_NO_ACTION_CHANGE);
+}
+
+static void update_modeset_cached_params(enum igt_draw_method method)
 {
-	int r;
-	int assertions = 0;
-	struct draw_pattern_info *pattern;
-	struct modeset_params *params = pick_params(t);
-	struct fb_region *target;
-	enum igt_draw_method m1, m2, used_method;
-	bool wc_used = false;
+	bool found = false;
 
-	switch (t->plane) {
-	case PLANE_PRI:
-		pattern = &pattern1;
-		break;
-	case PLANE_CUR:
-	case PLANE_SPR:
-		pattern = &pattern2;
-		break;
-	default:
-		igt_assert(false);
-	}
+	igt_output_set_pipe(prim_mode_params.output, prim_mode_params.pipe);
+	igt_output_set_pipe(scnd_mode_params.output, scnd_mode_params.pipe);
 
-	prepare_subtest(t, pattern);
-	target = pick_target(t, params);
+	found = igt_override_all_active_output_modes_to_fit_bw(&drm.display);
+	igt_require_f(found, "No valid mode combo found.\n");
 
-	for (m1 = 0; m1 < IGT_DRAW_METHOD_COUNT; m1++) {
-		for (m2 = m1 + 1; m2 < IGT_DRAW_METHOD_COUNT; m2++) {
+	prim_mode_params.mode = *igt_output_get_mode(prim_mode_params.output);
+	prim_mode_params.primary.w = prim_mode_params.mode.hdisplay;
+	prim_mode_params.primary.h = prim_mode_params.mode.vdisplay;
 
-			igt_debug("Methods %s and %s\n",
-				  igt_draw_get_method_name(m1),
-				  igt_draw_get_method_name(m2));
+	scnd_mode_params.mode = *igt_output_get_mode(scnd_mode_params.output);
+	scnd_mode_params.primary.w = scnd_mode_params.mode.hdisplay;
+	scnd_mode_params.primary.h = scnd_mode_params.mode.vdisplay;
 
-			if (!igt_draw_supports_method(drm.fd, m1) ||
-			    !igt_draw_supports_method(drm.fd, m2))
-				continue;
+	fill_fb_region(&prim_mode_params.primary, method, COLOR_PRIM_BG);
+	fill_fb_region(&scnd_mode_params.primary, method, COLOR_SCND_BG);
 
-			for (r = 0; r < pattern->n_rects; r++) {
-				used_method = (r % 2 == 0) ? m1 : m2;
+	__set_mode_for_params(&prim_mode_params);
+	__set_mode_for_params(&scnd_mode_params);
+}
 
-				igt_debug("Used method %s\n",
-					igt_draw_get_method_name(used_method));
+static void enable_both_screens_and_wait(const struct test_mode *t)
+{
+	int ret;
 
-				draw_rect(pattern, target, used_method, r);
+	fill_fb_region(&prim_mode_params.primary, t->method, COLOR_PRIM_BG);
+	fill_fb_region(&scnd_mode_params.primary, t->method, COLOR_SCND_BG);
 
-				if (used_method == IGT_DRAW_MMAP_WC ||
-				    used_method == IGT_DRAW_MMAP_GTT)
-					wc_used = true;
+	__set_mode_for_params(&prim_mode_params);
+	__set_mode_for_params(&scnd_mode_params);
 
-				update_wanted_crc(t,
-						  &pattern->crcs[t->format][r]);
+	if (drm.display.is_atomic)
+		ret = igt_display_try_commit_atomic(&drm.display,
+				DRM_MODE_ATOMIC_TEST_ONLY |
+				DRM_MODE_ATOMIC_ALLOW_MODESET,
+				NULL);
+	else
+		ret = igt_display_try_commit2(&drm.display, COMMIT_LEGACY);
 
-				assertions = used_method != IGT_DRAW_MMAP_GTT ?
-					     ASSERT_LAST_ACTION_CHANGED :
-					     ASSERT_NO_ACTION_CHANGE;
-				if (op_disables_psr(t, used_method) &&
-				    !wc_used)
-					assertions |= ASSERT_PSR_DISABLED;
+	if (ret)
+		update_modeset_cached_params(t->method);
 
-				do_assertions(assertions);
-			}
+	igt_display_commit2(&drm.display, drm.display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
-			fill_fb_region(target, m2, COLOR_PRIM_BG);
-			_fb_dirty_ioctl(target);
+	wanted_crc = &blue_crcs[t->format].crc;
+	fbc_update_last_action();
 
-			update_wanted_crc(t, &blue_crcs[t->format].crc);
-			do_assertions(ASSERT_NO_ACTION_CHANGE);
-		}
-	}
+	do_assertions(ASSERT_NO_ACTION_CHANGE);
 }
 
-static bool format_is_valid(int feature_flags,
-			    enum pixel_format format)
+static void set_region_for_test(const struct test_mode *t,
+				struct fb_region *reg)
 {
-	int devid = intel_get_drm_devid(drm.fd);
+	fill_fb_region(reg, t->method, COLOR_PRIM_BG);
 
-	if (!(feature_flags & FEATURE_FBC))
-		return true;
+	igt_plane_set_fb(reg->plane, reg->fb);
+	igt_plane_set_position(reg->plane, 0, 0);
+	igt_plane_set_size(reg->plane, reg->w, reg->h);
+	igt_fb_set_size(reg->fb, reg->plane, reg->w, reg->h);
 
-	switch (format) {
-	case FORMAT_RGB888:
-		return true;
-	case FORMAT_RGB565:
-		if (IS_GEN2(devid) || IS_G4X(devid))
-			return false;
-		return true;
-	case FORMAT_RGB101010:
-		return false;
-	default:
-		igt_assert(false);
-	}
+	igt_display_commit(&drm.display);
+	do_assertions(ASSERT_NO_ACTION_CHANGE);
 }
 
-/*
- * badformat - test pixel formats that are not supported by at least one feature
- *
- * METHOD
- *   We just do a modeset on a buffer with the given pixel format and check the
- *   status of the relevant features.
- *
- * EXPECTED RESULTS
- *   No assertion failures :)
- *
- * FAILURES
- *   If you get a feature enabled/disabled assertion failure, then you should
- *   probably check the Kernel code for the feature that checks the pixel
- *   formats. If you get a CRC assertion failure, then you should use the
- *   appropriate command line arguments that will allow you to look at the
- *   screen, then judge what to do based on what you see.
- */
-static void badformat_subtest(const struct test_mode *t)
+static void set_plane_for_test_fbc(const struct test_mode *t, igt_plane_t *plane)
 {
-	bool fbc_valid = format_is_valid(FEATURE_FBC, t->format);
-	bool psr_valid = format_is_valid(FEATURE_PSR, t->format);
-	int assertions = ASSERT_NO_ACTION_CHANGE;
+	struct igt_fb fb;
+	uint32_t color;
 
-	prepare_subtest_data(t, NULL);
+	igt_info("Testing fbc on plane %i%s\n", plane->index + 1, kmstest_pipe_name(prim_mode_params.pipe));
 
-	fill_fb_region(&prim_mode_params.primary, t->method, COLOR_PRIM_BG);
-	set_mode_for_params(&prim_mode_params);
+	create_fb(t->format, prim_mode_params.mode.hdisplay, prim_mode_params.mode.vdisplay, t->tiling, t->plane, &fb);
+	color = pick_color(&fb, COLOR_PRIM_BG);
+	igt_draw_rect_fb(drm.fd, drm.bops, 0, &fb, t->method,
+			 0, 0, fb.width, fb.height,
+			 color);
 
-	wanted_crc = &blue_crcs[t->format].crc;
+	igt_plane_set_fb(plane, &fb);
+	igt_plane_set_position(plane, 0, 0);
+	igt_plane_set_size(plane, prim_mode_params.mode.hdisplay, prim_mode_params.mode.vdisplay);
+	igt_fb_set_size(&fb, plane, prim_mode_params.mode.hdisplay, prim_mode_params.mode.vdisplay);
+	igt_display_commit_atomic(&drm.display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 
-	if (!fbc_valid)
-		assertions |= ASSERT_FBC_DISABLED;
-	if (!psr_valid)
-		assertions |= ASSERT_PSR_DISABLED;
-	do_assertions(assertions);
-}
+	fbc_update_last_action();
+	do_assertions(ASSERT_FBC_ENABLED | ASSERT_NO_ACTION_CHANGE);
+	igt_assert_f(fbc_enable_per_plane(plane->index + 1, prim_mode_params.pipe), "FBC disabled\n");
 
-/**
- * SUBTEST: drrs-%s-draw-%s
- * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
- * Driver requirement: i915, xe
- * Functionality: drrs, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbc-%s-draw-%s
- * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
- * Driver requirement: i915, xe
- * Functionality: fbc, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: psr-%s-draw-%s
- * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
- * Driver requirement: i915, xe
- * Functionality: fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcdrrs-%s-draw-%s
- * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
- * Driver requirement: i915, xe
- * Functionality: drrs, fbc, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcpsr-%s-draw-%s
- * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
- * Driver requirement: i915, xe
- * Functionality: fbc, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: psrdrrs-%s-draw-%s
- * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
- * Driver requirement: i915, xe
- * Functionality: drrs, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcpsrdrrs-%s-draw-%s
- * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
- * Driver requirement: i915, xe
- * Functionality: drrs, fbc, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @rgb101010:      FORMAT_RGB101010
- * @rgb565:         FORMAT_RGB565
- *
- * arg[2]:
- *
- * @blt:            Blitter
- * @mmap-wc:        MMAP-WC
- * @render:         Render
- */
+	igt_remove_fb(drm.fd, &fb);
+	igt_plane_set_fb(plane, NULL);
+	igt_display_commit2(&drm.display, COMMIT_ATOMIC);
+}
 
-/**
- * SUBTEST: drrs-%s-draw-%s
- * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
- * Driver requirement: i915
- * Functionality: drrs, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbc-%s-draw-%s
- * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
- * Driver requirement: i915
- * Functionality: fbc, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: psr-%s-draw-%s
- * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
- * Driver requirement: i915
- * Functionality: fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcdrrs-%s-draw-%s
- * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
- * Driver requirement: i915
- * Functionality: drrs, fbc, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcpsr-%s-draw-%s
- * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
- * Driver requirement: i915
- * Functionality: fbc, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: psrdrrs-%s-draw-%s
- * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
- * Driver requirement: i915
- * Functionality: drrs, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcpsrdrrs-%s-draw-%s
- * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
- * Driver requirement: i915
- * Functionality: drrs, fbc, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @rgb101010:      FORMAT_RGB101010
- * @rgb565:         FORMAT_RGB565
- *
- * arg[2]:
- *
- * @mmap-cpu:       MMAP-CPU
- * @mmap-gtt:       MMAP-GTT
- * @pwrite:         PWRITE
- */
+static bool enable_features_for_test(const struct test_mode *t)
+{
+	bool ret = false;
 
-/*
- * format_draw - test pixel formats that are not FORMAT_DEFAULT
- *
- * METHOD
- *   The real subtest to be executed depends on whether the pixel format is
- *   supported by the features being tested or not. Check the documentation of
- *   each subtest.
- *
- * EXPECTED RESULTS
- *   See the documentation for each subtest.
- *
- * FAILURES
- *   See the documentation for each subtest.
- */
-static void format_draw_subtest(const struct test_mode *t)
+	if (t->feature == FEATURE_DEFAULT)
+		return false;
+
+	if (t->feature & FEATURE_FBC)
+		intel_fbc_enable(drm.fd);
+	if (t->feature & FEATURE_PSR)
+		ret = psr_enable(drm.fd, drm.debugfs, PSR_MODE_1);
+	if (t->feature & FEATURE_DRRS)
+		intel_drrs_enable(drm.fd, prim_mode_params.pipe);
+
+	return ret;
+}
+
+static void check_test_requirements(const struct test_mode *t)
 {
-	if (format_is_valid(t->feature, t->format))
-		draw_subtest(t);
-	else
-		badformat_subtest(t);
+	int ver;
+
+	if (t->pipes == PIPE_DUAL)
+		igt_require_f(scnd_mode_params.output,
+			    "Can't test dual pipes with the current outputs\n");
+
+	if (t->feature & FEATURE_FBC)
+		igt_require_f(fbc.can_test,
+			      "Can't test FBC with this chipset\n");
+
+	if (t->feature & FEATURE_PSR) {
+		igt_require_f(psr.can_test,
+			      "Can't test PSR with the current outputs\n");
+	}
+
+	if (t->feature & FEATURE_DRRS)
+		igt_require_f(drrs.can_test,
+			      "Can't test DRRS with the current outputs\n");
+
+	/*
+	 * In kernel, When PSR is enabled, DRRS will be disabled. So If a test
+	 * case needs DRRS + PSR enabled, that will be skipped.
+	 */
+	igt_require_f(!((t->feature & FEATURE_PSR) &&
+		      (t->feature & FEATURE_DRRS)),
+		      "Can't test PSR and DRRS together\n");
+
+	if (opt.only_pipes != PIPE_COUNT)
+		igt_require(t->pipes == opt.only_pipes);
+
+	/* Kernel disables fbc for display versions 12 and 13 if psr is enabled. */
+	ver = intel_display_ver(intel_get_drm_devid(drm.fd));
+	if (ver >= 12 && ver <= 13)
+		igt_require_f(!((t->feature & FEATURE_PSR) &&
+				(t->feature & FEATURE_FBC)),
+			      "Can't test PSR and FBC together\n");
+
 }
 
-static bool tiling_is_valid(int feature_flags, enum tiling_type tiling)
+static void set_crtc_fbs(const struct test_mode *t)
 {
-	int devid = intel_get_drm_devid(drm.fd);
+	struct screen_fbs *s = &fbs[t->format];
 
-	if (!(feature_flags & FEATURE_FBC))
-		return true;
+	create_fbs(t->format, t->tiling);
 
-	switch (tiling) {
-	case TILING_LINEAR:
-		return AT_LEAST_GEN(devid, 9);
-	case TILING_X:
-	case TILING_Y:
-		return true;
-	case TILING_4:
-		return AT_LEAST_GEN(devid, 12);
+	switch (t->fbs) {
+	case FBS_INDIVIDUAL:
+		prim_mode_params.primary.fb = &s->prim_pri;
+		scnd_mode_params.primary.fb = &s->scnd_pri;
+		offscreen_fb.fb = &s->offscreen;
+
+		prim_mode_params.primary.x = 0;
+		scnd_mode_params.primary.x = 0;
+		offscreen_fb.x = 0;
+
+		prim_mode_params.primary.y = 0;
+		scnd_mode_params.primary.y = 0;
+		offscreen_fb.y = 0;
+		break;
+	case FBS_SHARED:
+		/* Please see the comment at the top of create_shared_fb(). */
+		prim_mode_params.primary.fb = &s->big;
+		scnd_mode_params.primary.fb = &s->big;
+		offscreen_fb.fb = &s->big;
+
+		prim_mode_params.primary.x = opt.shared_fb_x_offset;
+		scnd_mode_params.primary.x = opt.shared_fb_x_offset;
+		offscreen_fb.x = opt.shared_fb_x_offset;
+
+		prim_mode_params.primary.y = opt.shared_fb_y_offset;
+		scnd_mode_params.primary.y = prim_mode_params.primary.y +
+					prim_mode_params.primary.h;
+		offscreen_fb.y = scnd_mode_params.primary.y + scnd_mode_params.primary.h;
+		break;
 	default:
 		igt_assert(false);
-		return false;
 	}
-}
 
-/**
- * SUBTEST: drrs-slowdraw
- * Description: Sleep a little bit between drawing operations with DRRS
- * Driver requirement: i915, xe
- * Functionality: drrs, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: psr-slowdraw
- * Description: Sleep a little bit between drawing operations with PSR
- * Driver requirement: i915, xe
- * Functionality: fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcdrrs-slowdraw
- * Description: Sleep a little bit between drawing operations with FBC & DRRS
- * Driver requirement: i915, xe
- * Functionality: drrs, fbc, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcpsr-slowdraw
- * Description: Sleep a little bit between drawing operations with FBC & PSR
- * Driver requirement: i915, xe
- * Functionality: fbc, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: psrdrrs-slowdraw
- * Description: Sleep a little bit between drawing operations with PSR & DRRS
- * Driver requirement: i915, xe
- * Functionality: drrs, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcpsrdrrs-slowdraw
- * Description: Sleep a little bit between drawing operations with FBC, PSR & DRRS
- * Driver requirement: i915, xe
- * Functionality: drrs, fbc, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- */
+	prim_mode_params.cursor.fb = &s->prim_cur;
+	prim_mode_params.sprite.fb = &s->prim_spr;
+	scnd_mode_params.cursor.fb = &s->scnd_cur;
+	scnd_mode_params.sprite.fb = &s->scnd_spr;
+}
 
-/*
- * slow_draw - sleep a little bit between drawing operations
- *
- * METHOD
- *   This test is basically the same as the draw subtest, except that we sleep a
- *   little bit after each drawing operation. The goal is to detect problems
- *   that can happen in case a drawing operation is done while the machine is in
- *   some deep sleep states.
- *
- * EXPECTED RESULTS
- *   The pattern appears on the screen as expected.
- *
- * FAILURES
- *   I've seen this happen in a SKL machine and still haven't investigated it.
- *   My guess would be that preventing deep sleep states fixes the problem.
- */
-static void slow_draw_subtest(const struct test_mode *t)
+static void prepare_subtest_data(const struct test_mode *t,
+				 struct draw_pattern_info *pattern)
 {
-	int r;
-	struct draw_pattern_info *pattern = &pattern1;
-	struct modeset_params *params = pick_params(t);
-	struct fb_region *target;
+	bool need_modeset;
+
+	check_test_requirements(t);
+
+	stop_busy_thread();
 
-	prepare_subtest(t, pattern);
-	sleep(2);
-	target = pick_target(t, params);
+	need_modeset = disable_features(t);
+	set_crtc_fbs(t);
 
-	for (r = 0; r < pattern->n_rects; r++) {
-		sleep(2);
-		draw_rect(pattern, target, t->method, r);
-		sleep(2);
+	if (t->screen == SCREEN_OFFSCREEN)
+		fill_fb_region(&offscreen_fb, t->method, COLOR_OFFSCREEN_BG);
 
-		update_wanted_crc(t, &pattern->crcs[t->format][r]);
+	igt_display_reset(&drm.display);
+	if (need_modeset)
+		igt_display_commit(&drm.display);
 
-		if (t->feature & FEATURE_DRRS)
-			do_assertions(ASSERT_DRRS_LOW);
-		else
-			do_assertions(0);
-	}
-}
+	init_blue_crc(t->format, t->tiling);
+	if (pattern)
+		init_crcs(t->format, t->tiling, pattern);
 
-static void flip_handler(int fd, unsigned int sequence, unsigned int tv_sec,
-			 unsigned int tv_usec, void *data)
-{
-	igt_debug("Flip event received.\n");
+	need_modeset = enable_features_for_test(t);
+	if (need_modeset)
+		igt_display_commit(&drm.display);
 }
 
-static void wait_flip_event(void)
+static void prepare_subtest_screens(const struct test_mode *t)
 {
-	int rc;
-	drmEventContext evctx;
-	struct pollfd pfd;
-
-	evctx.version = 2;
-	evctx.vblank_handler = NULL;
-	evctx.page_flip_handler = flip_handler;
+	if (t->pipes == PIPE_DUAL)
+		enable_both_screens_and_wait(t);
+	else
+		enable_prim_screen_and_wait(t);
 
-	pfd.fd = drm.fd;
-	pfd.events = POLLIN;
-	pfd.revents = 0;
+	if (t->screen == SCREEN_PRIM) {
+		if (t->plane == PLANE_CUR)
+			set_region_for_test(t, &prim_mode_params.cursor);
+		if (t->plane == PLANE_SPR)
+			set_region_for_test(t, &prim_mode_params.sprite);
+	}
 
-	rc = poll(&pfd, 1, TIME);
-	switch (rc) {
-	case 0:
-		igt_assert_f(false, "Poll timeout\n");
-		break;
-	case 1:
-		rc = drmHandleEvent(drm.fd, &evctx);
-		igt_assert_eq(rc, 0);
-		break;
-	default:
-		igt_assert_f(false, "Unexpected poll rc %d\n", rc);
-		break;
+	if (t->pipes == PIPE_DUAL && t->screen == SCREEN_SCND) {
+		if (t->plane == PLANE_CUR)
+			set_region_for_test(t, &scnd_mode_params.cursor);
+		if (t->plane == PLANE_SPR)
+			set_region_for_test(t, &scnd_mode_params.sprite);
 	}
 }
 
-static void set_prim_plane_for_params(struct modeset_params *params)
+static void prepare_subtest(const struct test_mode *t,
+			    struct draw_pattern_info *pattern)
 {
-	__set_prim_plane_for_params(params);
-	igt_display_commit2(&drm.display, COMMIT_UNIVERSAL);
+	prepare_subtest_data(t, pattern);
+	prepare_subtest_screens(t);
 }
 
-static void page_flip_for_params(struct modeset_params *params,
-				 enum flip_type type)
+/*
+ * rte - the basic sanity test
+ *
+ * METHOD
+ *   Just disable all screens, assert everything is disabled, then enable all
+ *   screens - including primary, cursor and sprite planes - and assert that
+ *   the tested feature is enabled.
+ *
+ * EXPECTED RESULTS
+ *   Blue screens and t->feature enabled.
+ *
+ * FAILURES
+ *   A failure here means that every other subtest will probably fail too. It
+ *   probably means that the Kernel is just not enabling the feature we want.
+ */
+static void rte_subtest(const struct test_mode *t)
 {
-	int rc;
+	prepare_subtest_data(t, NULL);
 
-	switch (type) {
-	case FLIP_PAGEFLIP:
-		rc = drmModePageFlip(drm.fd, drm.display.pipes[params->pipe].crtc_id,
-				     params->primary.fb->fb_id,
-				     DRM_MODE_PAGE_FLIP_EVENT, NULL);
-		igt_assert_eq(rc, 0);
-		wait_flip_event();
-		break;
-	case FLIP_MODESET:
-		set_mode_for_params(params);
-		break;
-	case FLIP_PLANES:
-		set_prim_plane_for_params(params);
-		break;
-	default:
-		igt_assert(false);
+	unset_all_crtcs();
+	do_assertions(ASSERT_FBC_DISABLED | ASSERT_PSR_DISABLED |
+		      DONT_ASSERT_CRC | ASSERT_DRRS_INACTIVE);
+
+	if (t->pipes == PIPE_SINGLE)
+		enable_prim_screen_and_wait(t);
+	else
+		enable_both_screens_and_wait(t);
+
+	set_region_for_test(t, &prim_mode_params.cursor);
+	set_region_for_test(t, &prim_mode_params.sprite);
+
+	if (t->pipes == PIPE_DUAL) {
+		set_region_for_test(t, &scnd_mode_params.cursor);
+		set_region_for_test(t, &scnd_mode_params.sprite);
 	}
 }
 
-/**
- * SUBTEST: drrs-%dp-primscrn-%s-%sflip-blt
- * Description: Just exercise page flips with the patterns we have
- * Driver requirement: i915, xe
- * Functionality: drrs, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbc-%dp-primscrn-%s-%sflip-blt
- * Description: Just exercise page flips with the patterns we have
- * Driver requirement: i915, xe
- * Functionality: fbc, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: psr-%dp-primscrn-%s-%sflip-blt
- * Description: Just exercise page flips with the patterns we have
- * Driver requirement: i915, xe
- * Functionality: fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcdrrs-%dp-primscrn-%s-%sflip-blt
- * Description: Just exercise page flips with the patterns we have
- * Driver requirement: i915, xe
- * Functionality: drrs, fbc, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcpsr-%dp-primscrn-%s-%sflip-blt
- * Description: Just exercise page flips with the patterns we have
- * Driver requirement: i915, xe
- * Functionality: fbc, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: psrdrrs-%dp-primscrn-%s-%sflip-blt
- * Description: Just exercise page flips with the patterns we have
- * Driver requirement: i915, xe
- * Functionality: drrs, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcpsrdrrs-%dp-primscrn-%s-%sflip-blt
- * Description: Just exercise page flips with the patterns we have
- * Driver requirement: i915, xe
- * Functionality: drrs, fbc, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1].values:   1, 2
- *
- * arg[2]:
- *
- * @indfb:          Individual fb
- * @shrfb:          Shared fb
- *
- * arg[3]:
- *
- * @ms:             Modeset
- * @pg:             Page flip
- * @pl:             Plane change
- */
+static bool is_valid_plane(igt_plane_t *plane)
+{
+	int index = plane->index;
+
+	if (plane->type == DRM_PLANE_TYPE_CURSOR)
+		return false;
+	/*
+	 * Execute test only on first three planes
+	 */
+	return ((index >= 0) && (index < 3));
+}
 
 /**
- * SUBTEST: drrs-2p-scndscrn-%s-%sflip-blt
- * Description: Just exercise page flips with the patterns we have
- * Driver requirement: i915, xe
- * Functionality: drrs, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbc-2p-scndscrn-%s-%sflip-blt
- * Description: Just exercise page flips with the patterns we have
- * Driver requirement: i915, xe
- * Functionality: fbc, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: psr-2p-scndscrn-%s-%sflip-blt
- * Description: Just exercise page flips with the patterns we have
- * Driver requirement: i915, xe
- * Functionality: fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcdrrs-2p-scndscrn-%s-%sflip-blt
- * Description: Just exercise page flips with the patterns we have
- * Driver requirement: i915, xe
- * Functionality: drrs, fbc, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcpsr-2p-scndscrn-%s-%sflip-blt
- * Description: Just exercise page flips with the patterns we have
- * Driver requirement: i915, xe
- * Functionality: fbc, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: psrdrrs-2p-scndscrn-%s-%sflip-blt
- * Description: Just exercise page flips with the patterns we have
- * Driver requirement: i915, xe
- * Functionality: drrs, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcpsrdrrs-2p-scndscrn-%s-%sflip-blt
- * Description: Just exercise page flips with the patterns we have
- * Driver requirement: i915, xe
- * Functionality: drrs, fbc, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @indfb:          Individual fb
- * @shrfb:          Shared fb
+ * plane-fbc-rte - the basic sanity test
  *
- * arg[2]:
+ * METHOD
+ *   Just disable primary screen, assert everything is disabled, then enable single
+ *   screens and single plane one by one  and assert that the tested fbc is enabled
+ *   for the particular plane.
  *
- * @ms:             Modeset
- * @pg:             Page flip
- * @pl:             Plane change
+ * EXPECTED RESULTS
+ *   Blue screens and t->feature enabled.
+ *
+ * FAILURES
+ *   A failure here means that fbc is not getting enabled for requested plane. It means
+ *   kernel is not able to enable fbc on the requested plane.
  */
 
+static void plane_fbc_rte_subtest(const struct test_mode *t)
+{
+	int ver;
+	igt_plane_t *plane;
+
+	ver = intel_display_ver(intel_get_drm_devid(drm.fd));
+	igt_require_f((ver >= 20), "Can't test fbc for each plane\n");
+
+	prepare_subtest_data(t, NULL);
+	unset_all_crtcs();
+	do_assertions(ASSERT_FBC_DISABLED | DONT_ASSERT_CRC);
+
+	igt_output_override_mode(prim_mode_params.output, &prim_mode_params.mode);
+	igt_output_set_pipe(prim_mode_params.output, prim_mode_params.pipe);
+
+	wanted_crc = &blue_crcs[t->format].crc;
+
+	for_each_plane_on_pipe(&drm.display, prim_mode_params.pipe, plane) {
+		if (!is_valid_plane(plane))
+			continue;
+
+		set_plane_for_test_fbc(t, plane);
+	}
+
+	igt_display_reset(&drm.display);
+}
+
+static void update_wanted_crc(const struct test_mode *t, igt_crc_t *crc)
+{
+	if (t->screen == SCREEN_PRIM)
+		wanted_crc = crc;
+}
+
+static bool op_disables_psr(const struct test_mode *t,
+			    enum igt_draw_method method)
+{
+	if (method != IGT_DRAW_MMAP_GTT)
+		return false;
+	if (t->screen == SCREEN_PRIM)
+		return true;
+	/* On FBS_SHARED, even if the target is not the PSR screen
+	 * (SCREEN_PRIM), all primary planes share the same frontbuffer, so a
+	 * write to the second screen primary plane - or offscreen plane - will
+	 * touch the framebuffer that's also used by the primary screen. */
+	if (t->fbs == FBS_SHARED && t->plane == PLANE_PRI)
+		return true;
+
+	return false;
+}
+
 /*
- * flip - just exercise page flips with the patterns we have
+ * draw - draw a set of rectangles on the screen using the provided method
  *
  * METHOD
- *   We draw the pattern on a backbuffer using the provided method, then we
- *   flip, making this the frontbuffer. We can flip both using the dedicated
- *   pageflip IOCTL or the modeset IOCTL.
+ *   Just set the screens as appropriate and then start drawing a series of
+ *   rectangles on the target screen. The important guy here is the drawing
+ *   method used.
  *
  * EXPECTED RESULTS
- *   Everything works as expected, screen contents are properly updated.
+ *   The feature either stays enabled or gets reenabled after the oprations. You
+ *   will also see the rectangles on the target screen.
  *
  * FAILURES
- *   On a failure here you need to go directly to the Kernel's flip code and see
- *   how it interacts with the feature being tested.
+ *   A failure here indicates a problem somewhere between the Kernel's
+ *   frontbuffer tracking infrastructure or the feature itself. You need to pay
+ *   attention to which drawing method is being used.
  */
-static void flip_subtest(const struct test_mode *t)
+static void draw_subtest(const struct test_mode *t)
 {
 	int r;
 	int assertions = 0;
-	struct igt_fb fb2, *orig_fb;
+	struct draw_pattern_info *pattern;
 	struct modeset_params *params = pick_params(t);
-	struct draw_pattern_info *pattern = &pattern1;
-	enum color bg_color;
+	struct fb_region *target;
 
 	switch (t->screen) {
 	case SCREEN_PRIM:
-		assertions |= ASSERT_LAST_ACTION_CHANGED;
-		bg_color = COLOR_PRIM_BG;
+		if (t->method != IGT_DRAW_MMAP_GTT && t->plane == PLANE_PRI)
+			assertions |= ASSERT_LAST_ACTION_CHANGED;
+		else
+			assertions |= ASSERT_NO_ACTION_CHANGE;
 		break;
 	case SCREEN_SCND:
+	case SCREEN_OFFSCREEN:
 		assertions |= ASSERT_NO_ACTION_CHANGE;
-		bg_color = COLOR_SCND_BG;
 		break;
 	default:
 		igt_assert(false);
 	}
 
-	prepare_subtest(t, pattern);
+	switch (t->plane) {
+	case PLANE_PRI:
+		pattern = &pattern1;
+		break;
+	case PLANE_CUR:
+	case PLANE_SPR:
+		pattern = &pattern2;
+		break;
+	default:
+		igt_assert(false);
+	}
 
-	create_fb(t->format, params->primary.fb->width, params->primary.fb->height,
-		  t->tiling, t->plane, &fb2);
-	fill_fb(&fb2, bg_color);
-	orig_fb = params->primary.fb;
+	if (op_disables_psr(t, t->method))
+		assertions |= ASSERT_PSR_DISABLED;
+
+	/*
+	 * On FBS_INDIVIDUAL, write to offscreen plane will not touch the
+	 * current frambuffer. Hence assert for DRRS_LOW.
+	 */
+	if ((t->fbs == FBS_INDIVIDUAL) && (t->screen == SCREEN_OFFSCREEN))
+		assertions |= ASSERT_DRRS_LOW;
+
+	prepare_subtest(t, pattern);
+	target = pick_target(t, params);
 
 	for (r = 0; r < pattern->n_rects; r++) {
-		params->primary.fb = (r % 2 == 0) ? &fb2 : orig_fb;
+		igt_debug("Drawing rect %d\n", r);
+		draw_rect(pattern, target, t->method, r);
+		update_wanted_crc(t, &pattern->crcs[t->format][r]);
+		do_assertions(assertions);
+	}
+}
+
+/*
+ * multidraw - draw a set of rectangles on the screen using alternated drawing
+ *             methods
+ *
+ * METHOD
+ *   This is just like the draw subtest, but now we keep alternating between two
+ *   drawing methods. Each time we run multidraw_subtest we will test all the
+ *   possible pairs of drawing methods.
+ *
+ * EXPECTED RESULTS
+ *   The same as the draw subtest.
+ *
+ * FAILURES
+ *   If you get a failure here, first you need to check whether you also get
+ *   failures on the individual draw subtests. If yes, then go fix every single
+ *   draw subtest first. If all the draw subtests pass but this one fails, then
+ *   you have to study how one drawing method is stopping the other from
+ *   properly working.
+ */
+static void multidraw_subtest(const struct test_mode *t)
+{
+	int r;
+	int assertions = 0;
+	struct draw_pattern_info *pattern;
+	struct modeset_params *params = pick_params(t);
+	struct fb_region *target;
+	enum igt_draw_method m1, m2, used_method;
+	bool wc_used = false;
+
+	switch (t->plane) {
+	case PLANE_PRI:
+		pattern = &pattern1;
+		break;
+	case PLANE_CUR:
+	case PLANE_SPR:
+		pattern = &pattern2;
+		break;
+	default:
+		igt_assert(false);
+	}
+
+	prepare_subtest(t, pattern);
+	target = pick_target(t, params);
+
+	for (m1 = 0; m1 < IGT_DRAW_METHOD_COUNT; m1++) {
+		for (m2 = m1 + 1; m2 < IGT_DRAW_METHOD_COUNT; m2++) {
+
+			igt_debug("Methods %s and %s\n",
+				  igt_draw_get_method_name(m1),
+				  igt_draw_get_method_name(m2));
+
+			if (!igt_draw_supports_method(drm.fd, m1) ||
+			    !igt_draw_supports_method(drm.fd, m2))
+				continue;
+
+			for (r = 0; r < pattern->n_rects; r++) {
+				used_method = (r % 2 == 0) ? m1 : m2;
+
+				igt_debug("Used method %s\n",
+					igt_draw_get_method_name(used_method));
+
+				draw_rect(pattern, target, used_method, r);
+
+				if (used_method == IGT_DRAW_MMAP_WC ||
+				    used_method == IGT_DRAW_MMAP_GTT)
+					wc_used = true;
+
+				update_wanted_crc(t,
+						  &pattern->crcs[t->format][r]);
+
+				assertions = used_method != IGT_DRAW_MMAP_GTT ?
+					     ASSERT_LAST_ACTION_CHANGED :
+					     ASSERT_NO_ACTION_CHANGE;
+				if (op_disables_psr(t, used_method) &&
+				    !wc_used)
+					assertions |= ASSERT_PSR_DISABLED;
+
+				do_assertions(assertions);
+			}
+
+			fill_fb_region(target, m2, COLOR_PRIM_BG);
+			_fb_dirty_ioctl(target);
+
+			update_wanted_crc(t, &blue_crcs[t->format].crc);
+			do_assertions(ASSERT_NO_ACTION_CHANGE);
+		}
+	}
+}
+
+static bool format_is_valid(int feature_flags,
+			    enum pixel_format format)
+{
+	int devid = intel_get_drm_devid(drm.fd);
+
+	if (!(feature_flags & FEATURE_FBC))
+		return true;
+
+	switch (format) {
+	case FORMAT_RGB888:
+		return true;
+	case FORMAT_RGB565:
+		if (IS_GEN2(devid) || IS_G4X(devid))
+			return false;
+		return true;
+	case FORMAT_RGB101010:
+		return false;
+	default:
+		igt_assert(false);
+	}
+}
+
+/*
+ * badformat - test pixel formats that are not supported by at least one feature
+ *
+ * METHOD
+ *   We just do a modeset on a buffer with the given pixel format and check the
+ *   status of the relevant features.
+ *
+ * EXPECTED RESULTS
+ *   No assertion failures :)
+ *
+ * FAILURES
+ *   If you get a feature enabled/disabled assertion failure, then you should
+ *   probably check the Kernel code for the feature that checks the pixel
+ *   formats. If you get a CRC assertion failure, then you should use the
+ *   appropriate command line arguments that will allow you to look at the
+ *   screen, then judge what to do based on what you see.
+ */
+static void badformat_subtest(const struct test_mode *t)
+{
+	bool fbc_valid = format_is_valid(FEATURE_FBC, t->format);
+	bool psr_valid = format_is_valid(FEATURE_PSR, t->format);
+	int assertions = ASSERT_NO_ACTION_CHANGE;
 
-		if (r != 0)
-			draw_rect(pattern, &params->primary, t->method, r - 1);
-		draw_rect(pattern, &params->primary, t->method, r);
-		update_wanted_crc(t, &pattern->crcs[t->format][r]);
+	prepare_subtest_data(t, NULL);
 
-		page_flip_for_params(params, t->flip);
+	fill_fb_region(&prim_mode_params.primary, t->method, COLOR_PRIM_BG);
+	set_mode_for_params(&prim_mode_params);
 
-		do_assertions(assertions);
-	}
+	wanted_crc = &blue_crcs[t->format].crc;
 
-	igt_remove_fb(drm.fd, &fb2);
+	if (!fbc_valid)
+		assertions |= ASSERT_FBC_DISABLED;
+	if (!psr_valid)
+		assertions |= ASSERT_PSR_DISABLED;
+	do_assertions(assertions);
 }
 
-/**
- * SUBTEST: fbc-%dp-%s-fliptrack-mmap-gtt
- * Description: Check if the hardware tracking works after page flips
- * Driver requirement: i915, xe
- * Functionality: fbc, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcdrrs-%dp-%s-fliptrack-mmap-gtt
- * Description: Check if the hardware tracking works after page flips
- * Driver requirement: i915, xe
- * Functionality: drrs, fbc, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcpsr-%dp-%s-fliptrack-mmap-gtt
- * Description: Check if the hardware tracking works after page flips
- * Driver requirement: i915, xe
- * Functionality: fbc, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcpsrdrrs-%dp-%s-fliptrack-mmap-gtt
- * Description: Check if the hardware tracking works after page flips
- * Driver requirement: i915, xe
- * Functionality: drrs, fbc, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
+/*
+ * format_draw - test pixel formats that are not FORMAT_DEFAULT
  *
- * arg[1].values:   1, 2
+ * METHOD
+ *   The real subtest to be executed depends on whether the pixel format is
+ *   supported by the features being tested or not. Check the documentation of
+ *   each subtest.
  *
- * arg[2]:
+ * EXPECTED RESULTS
+ *   See the documentation for each subtest.
  *
- * @indfb:          Individual fb
- * @shrfb:          Shared fb
+ * FAILURES
+ *   See the documentation for each subtest.
  */
+static void format_draw_subtest(const struct test_mode *t)
+{
+	if (format_is_valid(t->feature, t->format))
+		draw_subtest(t);
+	else
+		badformat_subtest(t);
+}
+
+static bool tiling_is_valid(int feature_flags, enum tiling_type tiling)
+{
+	int devid = intel_get_drm_devid(drm.fd);
+
+	if (!(feature_flags & FEATURE_FBC))
+		return true;
+
+	switch (tiling) {
+	case TILING_LINEAR:
+		return AT_LEAST_GEN(devid, 9);
+	case TILING_X:
+	case TILING_Y:
+		return true;
+	case TILING_4:
+		return AT_LEAST_GEN(devid, 12);
+	default:
+		igt_assert(false);
+		return false;
+	}
+}
 
 /*
- * fliptrack - check if the hardware tracking works after page flips
+ * slow_draw - sleep a little bit between drawing operations
  *
  * METHOD
- *   Flip to a new buffer, then draw on it using MMAP_GTT and check the CRC to
- *   make sure the hardware tracking detected the write.
+ *   This test is basically the same as the draw subtest, except that we sleep a
+ *   little bit after each drawing operation. The goal is to detect problems
+ *   that can happen in case a drawing operation is done while the machine is in
+ *   some deep sleep states.
  *
  * EXPECTED RESULTS
- *   Everything works as expected, screen contents are properly updated.
+ *   The pattern appears on the screen as expected.
  *
  * FAILURES
- *   First you need to check if the draw and flip subtests pass. Only after both
- *   are passing this test can be useful. If we're failing only on this subtest,
- *   then maybe we are not properly updating the hardware tracking registers
- *   during the flip operations.
+ *   I've seen this happen in a SKL machine and still haven't investigated it.
+ *   My guess would be that preventing deep sleep states fixes the problem.
  */
-static void fliptrack_subtest(const struct test_mode *t, enum flip_type type)
+static void slow_draw_subtest(const struct test_mode *t)
 {
 	int r;
-	struct igt_fb fb2, *orig_fb;
-	struct modeset_params *params = pick_params(t);
 	struct draw_pattern_info *pattern = &pattern1;
+	struct modeset_params *params = pick_params(t);
+	struct fb_region *target;
 
 	prepare_subtest(t, pattern);
-
-	create_fb(t->format, params->primary.fb->width, params->primary.fb->height,
-		  t->tiling, t->plane, &fb2);
-	fill_fb(&fb2, COLOR_PRIM_BG);
-	orig_fb = params->primary.fb;
+	sleep(2);
+	target = pick_target(t, params);
 
 	for (r = 0; r < pattern->n_rects; r++) {
-		params->primary.fb = (r % 2 == 0) ? &fb2 : orig_fb;
-
-		if (r != 0)
-			draw_rect(pattern, &params->primary, t->method, r - 1);
-
-		page_flip_for_params(params, type);
-		do_assertions(0);
+		sleep(2);
+		draw_rect(pattern, target, t->method, r);
+		sleep(2);
 
-		draw_rect(pattern, &params->primary, t->method, r);
 		update_wanted_crc(t, &pattern->crcs[t->format][r]);
 
-		do_assertions(ASSERT_PSR_DISABLED);
+		if (t->feature & FEATURE_DRRS)
+			do_assertions(ASSERT_DRRS_LOW);
+		else
+			do_assertions(0);
+	}
+}
+
+static void flip_handler(int fd, unsigned int sequence, unsigned int tv_sec,
+			 unsigned int tv_usec, void *data)
+{
+	igt_debug("Flip event received.\n");
+}
+
+static void wait_flip_event(void)
+{
+	int rc;
+	drmEventContext evctx;
+	struct pollfd pfd;
+
+	evctx.version = 2;
+	evctx.vblank_handler = NULL;
+	evctx.page_flip_handler = flip_handler;
+
+	pfd.fd = drm.fd;
+	pfd.events = POLLIN;
+	pfd.revents = 0;
+
+	rc = poll(&pfd, 1, TIME);
+	switch (rc) {
+	case 0:
+		igt_assert_f(false, "Poll timeout\n");
+		break;
+	case 1:
+		rc = drmHandleEvent(drm.fd, &evctx);
+		igt_assert_eq(rc, 0);
+		break;
+	default:
+		igt_assert_f(false, "Unexpected poll rc %d\n", rc);
+		break;
+	}
+}
+
+static void set_prim_plane_for_params(struct modeset_params *params)
+{
+	__set_prim_plane_for_params(params);
+	igt_display_commit2(&drm.display, COMMIT_UNIVERSAL);
+}
+
+static void page_flip_for_params(struct modeset_params *params,
+				 enum flip_type type)
+{
+	int rc;
+
+	switch (type) {
+	case FLIP_PAGEFLIP:
+		rc = drmModePageFlip(drm.fd, drm.display.pipes[params->pipe].crtc_id,
+				     params->primary.fb->fb_id,
+				     DRM_MODE_PAGE_FLIP_EVENT, NULL);
+		igt_assert_eq(rc, 0);
+		wait_flip_event();
+		break;
+	case FLIP_MODESET:
+		set_mode_for_params(params);
+		break;
+	case FLIP_PLANES:
+		set_prim_plane_for_params(params);
+		break;
+	default:
+		igt_assert(false);
 	}
-
-	igt_remove_fb(drm.fd, &fb2);
 }
 
-/**
- * SUBTEST: drrs-%dp-primscrn-%s-indfb-move
- * Description: Just move the %arg[2] around
- * Driver requirement: i915, xe
- * Functionality: drrs, fbt
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbc-%dp-primscrn-%s-indfb-move
- * Description: Just move the %arg[2] around
- * Driver requirement: i915, xe
- * Functionality: fbc, fbt
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: psr-%dp-primscrn-%s-indfb-move
- * Description: Just move the %arg[2] around
- * Driver requirement: i915, xe
- * Functionality: fbt, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcdrrs-%dp-primscrn-%s-indfb-move
- * Description: Just move the %arg[2] around
- * Driver requirement: i915, xe
- * Functionality: drrs, fbc, fbt
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcpsr-%dp-primscrn-%s-indfb-move
- * Description: Just move the %arg[2] around
- * Driver requirement: i915, xe
- * Functionality: fbc, fbt, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: psrdrrs-%dp-primscrn-%s-indfb-move
- * Description: Just move the %arg[2] around
- * Driver requirement: i915, xe
- * Functionality: drrs, fbt, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcpsrdrrs-%dp-primscrn-%s-indfb-move
- * Description: Just move the %arg[2] around
- * Driver requirement: i915, xe
- * Functionality: drrs, fbc, fbt, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1].values:   1, 2
- *
- * arg[2]:
- *
- * @spr:            Sprite plane
- * @cur:            Cursor plane
- */
-
-/**
- * SUBTEST: drrs-2p-scndscrn-%s-indfb-move
- * Description: Just move the %arg[1] around
- * Driver requirement: i915, xe
- * Functionality: drrs, fbt
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbc-2p-scndscrn-%s-indfb-move
- * Description: Just move the %arg[1] around
- * Driver requirement: i915, xe
- * Functionality: fbc, fbt
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: psr-2p-scndscrn-%s-indfb-move
- * Description: Just move the %arg[1] around
- * Driver requirement: i915, xe
- * Functionality: fbt, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcdrrs-2p-scndscrn-%s-indfb-move
- * Description: Just move the %arg[1] around
- * Driver requirement: i915, xe
- * Functionality: drrs, fbc, fbt
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcpsr-2p-scndscrn-%s-indfb-move
- * Description: Just move the %arg[1] around
- * Driver requirement: i915, xe
- * Functionality: fbc, fbt, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: psrdrrs-2p-scndscrn-%s-indfb-move
- * Description: Just move the %arg[1] around
- * Driver requirement: i915, xe
- * Functionality: drrs, fbt, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcpsrdrrs-2p-scndscrn-%s-indfb-move
- * Description: Just move the %arg[1] around
- * Driver requirement: i915, xe
- * Functionality: drrs, fbc, fbt, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @spr:            Sprite plane
- * @cur:            Cursor plane
- */
-
 /*
- * move - just move the sprite or cursor around
+ * flip - just exercise page flips with the patterns we have
  *
  * METHOD
- *   Move the surface around, following the defined pattern.
+ *   We draw the pattern on a backbuffer using the provided method, then we
+ *   flip, making this the frontbuffer. We can flip both using the dedicated
+ *   pageflip IOCTL or the modeset IOCTL.
  *
  * EXPECTED RESULTS
- *   The move operations are properly detected by the Kernel, and the screen is
- *   properly updated every time.
+ *   Everything works as expected, screen contents are properly updated.
  *
  * FAILURES
- *   If you get a failure here, check how the Kernel is enabling or disabling
- *   your feature when it moves the planes around.
+ *   On a failure here you need to go directly to the Kernel's flip code and see
+ *   how it interacts with the feature being tested.
  */
-static void move_subtest(const struct test_mode *t)
+static void flip_subtest(const struct test_mode *t)
 {
 	int r;
-	int assertions = ASSERT_NO_ACTION_CHANGE;
+	int assertions = 0;
+	struct igt_fb fb2, *orig_fb;
 	struct modeset_params *params = pick_params(t);
-	struct draw_pattern_info *pattern = &pattern3;
-	struct fb_region *reg = pick_target(t, params);
-	bool repeat = false;
-
-	prepare_subtest(t, pattern);
+	struct draw_pattern_info *pattern = &pattern1;
+	enum color bg_color;
 
-	/* Just paint the right color since we start at 0x0. */
-	draw_rect(pattern, reg, t->method, 0);
-	update_wanted_crc(t, &pattern->crcs[t->format][0]);
+	switch (t->screen) {
+	case SCREEN_PRIM:
+		assertions |= ASSERT_LAST_ACTION_CHANGED;
+		bg_color = COLOR_PRIM_BG;
+		break;
+	case SCREEN_SCND:
+		assertions |= ASSERT_NO_ACTION_CHANGE;
+		bg_color = COLOR_SCND_BG;
+		break;
+	default:
+		igt_assert(false);
+	}
 
-	do_assertions(assertions);
+	prepare_subtest(t, pattern);
 
-	for (r = 1; r < pattern->n_rects; r++) {
-		struct rect rect = pattern->get_rect(&params->primary, r);
+	create_fb(t->format, params->primary.fb->width, params->primary.fb->height,
+		  t->tiling, t->plane, &fb2);
+	fill_fb(&fb2, bg_color);
+	orig_fb = params->primary.fb;
 
-		igt_plane_set_fb(reg->plane, reg->fb);
-		igt_plane_set_position(reg->plane, rect.x, rect.y);
-		igt_plane_set_size(reg->plane, rect.w, rect.h);
-		igt_fb_set_size(reg->fb, reg->plane, rect.w, rect.h);
-		igt_display_commit2(&drm.display, COMMIT_UNIVERSAL);
+	for (r = 0; r < pattern->n_rects; r++) {
+		params->primary.fb = (r % 2 == 0) ? &fb2 : orig_fb;
 
+		if (r != 0)
+			draw_rect(pattern, &params->primary, t->method, r - 1);
+		draw_rect(pattern, &params->primary, t->method, r);
 		update_wanted_crc(t, &pattern->crcs[t->format][r]);
 
-		do_assertions(assertions);
+		page_flip_for_params(params, t->flip);
 
-		/* "Move" the last rect to the same position just to make sure
-		 * this works too. */
-		if (r+1 == pattern->n_rects && !repeat) {
-			repeat = true;
-			r--;
-		}
+		do_assertions(assertions);
 	}
+
+	igt_remove_fb(drm.fd, &fb2);
 }
 
-/**
- * SUBTEST: drrs-%dp-primscrn-%s-indfb-onoff
- * Description: Just enable and disable the %arg[2] a few times
- * Driver requirement: i915, xe
- * Functionality: drrs, fbt
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbc-%dp-primscrn-%s-indfb-onoff
- * Description: Just enable and disable the %arg[2] a few times
- * Driver requirement: i915, xe
- * Functionality: fbc, fbt
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: psr-%dp-primscrn-%s-indfb-onoff
- * Description: Just enable and disable the %arg[2] a few times
- * Driver requirement: i915, xe
- * Functionality: fbt, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcdrrs-%dp-primscrn-%s-indfb-onoff
- * Description: Just enable and disable the %arg[2] a few times
- * Driver requirement: i915, xe
- * Functionality: drrs, fbc, fbt
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcpsr-%dp-primscrn-%s-indfb-onoff
- * Description: Just enable and disable the %arg[2] a few times
- * Driver requirement: i915, xe
- * Functionality: fbc, fbt, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: psrdrrs-%dp-primscrn-%s-indfb-onoff
- * Description: Just enable and disable the %arg[2] a few times
- * Driver requirement: i915, xe
- * Functionality: drrs, fbt, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcpsrdrrs-%dp-primscrn-%s-indfb-onoff
- * Description: Just enable and disable the %arg[2] a few times
- * Driver requirement: i915, xe
- * Functionality: drrs, fbc, fbt, psr
- * Mega feature: General Display Features
- * Test category: functionality test
+/*
+ * fliptrack - check if the hardware tracking works after page flips
  *
- * arg[1].values:   1, 2
+ * METHOD
+ *   Flip to a new buffer, then draw on it using MMAP_GTT and check the CRC to
+ *   make sure the hardware tracking detected the write.
  *
- * arg[2]:
+ * EXPECTED RESULTS
+ *   Everything works as expected, screen contents are properly updated.
  *
- * @spr:            Sprite plane
- * @cur:            Cursor plane
+ * FAILURES
+ *   First you need to check if the draw and flip subtests pass. Only after both
+ *   are passing this test can be useful. If we're failing only on this subtest,
+ *   then maybe we are not properly updating the hardware tracking registers
+ *   during the flip operations.
  */
+static void fliptrack_subtest(const struct test_mode *t, enum flip_type type)
+{
+	int r;
+	struct igt_fb fb2, *orig_fb;
+	struct modeset_params *params = pick_params(t);
+	struct draw_pattern_info *pattern = &pattern1;
 
-/**
- * SUBTEST: drrs-2p-scndscrn-%s-indfb-onoff
- * Description: Just enable and disable the %arg[1] a few times
- * Driver requirement: i915, xe
- * Functionality: drrs, fbt
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbc-2p-scndscrn-%s-indfb-onoff
- * Description: Just enable and disable the %arg[1] a few times
- * Driver requirement: i915, xe
- * Functionality: fbc, fbt
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: psr-2p-scndscrn-%s-indfb-onoff
- * Description: Just enable and disable the %arg[1] a few times
- * Driver requirement: i915, xe
- * Functionality: fbt, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcdrrs-2p-scndscrn-%s-indfb-onoff
- * Description: Just enable and disable the %arg[1] a few times
- * Driver requirement: i915, xe
- * Functionality: drrs, fbc, fbt
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcpsr-2p-scndscrn-%s-indfb-onoff
- * Description: Just enable and disable the %arg[1] a few times
- * Driver requirement: i915, xe
- * Functionality: fbc, fbt, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: psrdrrs-2p-scndscrn-%s-indfb-onoff
- * Description: Just enable and disable the %arg[1] a few times
- * Driver requirement: i915, xe
- * Functionality: drrs, fbt, psr
- * Mega feature: General Display Features
- * Test category: functionality test
+	prepare_subtest(t, pattern);
+
+	create_fb(t->format, params->primary.fb->width, params->primary.fb->height,
+		  t->tiling, t->plane, &fb2);
+	fill_fb(&fb2, COLOR_PRIM_BG);
+	orig_fb = params->primary.fb;
+
+	for (r = 0; r < pattern->n_rects; r++) {
+		params->primary.fb = (r % 2 == 0) ? &fb2 : orig_fb;
+
+		if (r != 0)
+			draw_rect(pattern, &params->primary, t->method, r - 1);
+
+		page_flip_for_params(params, type);
+		do_assertions(0);
+
+		draw_rect(pattern, &params->primary, t->method, r);
+		update_wanted_crc(t, &pattern->crcs[t->format][r]);
+
+		do_assertions(ASSERT_PSR_DISABLED);
+	}
+
+	igt_remove_fb(drm.fd, &fb2);
+}
+
+/*
+ * move - just move the sprite or cursor around
  *
- * SUBTEST: fbcpsrdrrs-2p-scndscrn-%s-indfb-onoff
- * Description: Just enable and disable the %arg[1] a few times
- * Driver requirement: i915, xe
- * Functionality: drrs, fbc, fbt, psr
- * Mega feature: General Display Features
- * Test category: functionality test
+ * METHOD
+ *   Move the surface around, following the defined pattern.
  *
- * arg[1]:
+ * EXPECTED RESULTS
+ *   The move operations are properly detected by the Kernel, and the screen is
+ *   properly updated every time.
  *
- * @spr:            Sprite plane
- * @cur:            Cursor plane
+ * FAILURES
+ *   If you get a failure here, check how the Kernel is enabling or disabling
+ *   your feature when it moves the planes around.
  */
+static void move_subtest(const struct test_mode *t)
+{
+	int r;
+	int assertions = ASSERT_NO_ACTION_CHANGE;
+	struct modeset_params *params = pick_params(t);
+	struct draw_pattern_info *pattern = &pattern3;
+	struct fb_region *reg = pick_target(t, params);
+	bool repeat = false;
+
+	prepare_subtest(t, pattern);
+
+	/* Just paint the right color since we start at 0x0. */
+	draw_rect(pattern, reg, t->method, 0);
+	update_wanted_crc(t, &pattern->crcs[t->format][0]);
+
+	do_assertions(assertions);
+
+	for (r = 1; r < pattern->n_rects; r++) {
+		struct rect rect = pattern->get_rect(&params->primary, r);
+
+		igt_plane_set_fb(reg->plane, reg->fb);
+		igt_plane_set_position(reg->plane, rect.x, rect.y);
+		igt_plane_set_size(reg->plane, rect.w, rect.h);
+		igt_fb_set_size(reg->fb, reg->plane, rect.w, rect.h);
+		igt_display_commit2(&drm.display, COMMIT_UNIVERSAL);
+
+		update_wanted_crc(t, &pattern->crcs[t->format][r]);
+
+		do_assertions(assertions);
+
+		/* "Move" the last rect to the same position just to make sure
+		 * this works too. */
+		if (r+1 == pattern->n_rects && !repeat) {
+			repeat = true;
+			r--;
+		}
+	}
+}
 
 /*
  * onoff - just enable and disable the sprite or cursor plane a few times
@@ -3884,108 +4270,6 @@ static bool prim_plane_disabled(void)
 	return !prim_mode_params.primary.plane->values[IGT_PLANE_FB_ID];
 }
 
-/**
- * SUBTEST: drrs-%dp-primscrn-spr-indfb-fullscreen
- * Description: Put a fullscreen plane covering the whole screen
- * Driver requirement: i915, xe
- * Functionality: drrs, fbt
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbc-%dp-primscrn-spr-indfb-fullscreen
- * Description: Put a fullscreen plane covering the whole screen
- * Driver requirement: i915, xe
- * Functionality: fbc, fbt
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: psr-%dp-primscrn-spr-indfb-fullscreen
- * Description: Put a fullscreen plane covering the whole screen
- * Driver requirement: i915, xe
- * Functionality: fbt, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcdrrs-%dp-primscrn-spr-indfb-fullscreen
- * Description: Put a fullscreen plane covering the whole screen
- * Driver requirement: i915, xe
- * Functionality: drrs, fbc, fbt
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcpsr-%dp-primscrn-spr-indfb-fullscreen
- * Description: Put a fullscreen plane covering the whole screen
- * Driver requirement: i915, xe
- * Functionality: fbc, fbt, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: psrdrrs-%dp-primscrn-spr-indfb-fullscreen
- * Description: Put a fullscreen plane covering the whole screen
- * Driver requirement: i915, xe
- * Functionality: drrs, fbt, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcpsrdrrs-%dp-primscrn-spr-indfb-fullscreen
- * Description: Put a fullscreen plane covering the whole screen
- * Driver requirement: i915, xe
- * Functionality: drrs, fbc, fbt, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: drrs-2p-scndscrn-spr-indfb-fullscreen
- * Description: Put a fullscreen plane covering the whole screen
- * Driver requirement: i915, xe
- * Functionality: drrs, fbt
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbc-2p-scndscrn-spr-indfb-fullscreen
- * Description: Put a fullscreen plane covering the whole screen
- * Driver requirement: i915, xe
- * Functionality: fbc, fbt
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: psr-2p-scndscrn-spr-indfb-fullscreen
- * Description: Put a fullscreen plane covering the whole screen
- * Driver requirement: i915, xe
- * Functionality: fbt, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcdrrs-2p-scndscrn-spr-indfb-fullscreen
- * Description: Put a fullscreen plane covering the whole screen
- * Driver requirement: i915, xe
- * Functionality: drrs, fbc, fbt
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcpsr-2p-scndscrn-spr-indfb-fullscreen
- * Description: Put a fullscreen plane covering the whole screen
- * Driver requirement: i915, xe
- * Functionality: fbc, fbt, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: psrdrrs-2p-scndscrn-spr-indfb-fullscreen
- * Description: Put a fullscreen plane covering the whole screen
- * Driver requirement: i915, xe
- * Functionality: drrs, fbt, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcpsrdrrs-2p-scndscrn-spr-indfb-fullscreen
- * Description: Put a fullscreen plane covering the whole screen
- * Driver requirement: i915, xe
- * Functionality: drrs, fbc, fbt, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1].values:   1, 2
- */
-
 /*
  * fullscreen_plane - put a fullscreen plane covering the whole screen
  *
@@ -4021,87 +4305,31 @@ static void fullscreen_plane_subtest(const struct test_mode *t)
 	igt_display_commit(&drm.display);
 	update_wanted_crc(t, &pattern->crcs[t->format][0]);
 
-	switch (t->screen) {
-	case SCREEN_PRIM:
-		assertions = ASSERT_LAST_ACTION_CHANGED;
-
-		if (prim_plane_disabled())
-			assertions |= ASSERT_FBC_DISABLED;
-		break;
-	case SCREEN_SCND:
-		assertions = ASSERT_NO_ACTION_CHANGE;
-		break;
-	default:
-		igt_assert(false);
-	}
-	do_assertions(assertions);
-
-	igt_plane_set_fb(params->sprite.plane, NULL);
-	igt_display_commit(&drm.display);
-
-	if (t->screen == SCREEN_PRIM)
-		assertions = ASSERT_LAST_ACTION_CHANGED;
-	update_wanted_crc(t, &blue_crcs[t->format].crc);
-	do_assertions(assertions);
-
-	igt_remove_fb(drm.fd, &fullscreen_fb);
-}
-
-/**
- * SUBTEST: drrs-%s-scaledprimary
- * Description: Try different primary plane scaling strategies
- * Driver requirement: i915, xe
- * Functionality: drrs, fbt, scaling
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbc-%s-scaledprimary
- * Description: Try different primary plane scaling strategies
- * Driver requirement: i915, xe
- * Functionality: fbc, fbt, scaling
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: psr-%s-scaledprimary
- * Description: Try different primary plane scaling strategies
- * Driver requirement: i915, xe
- * Functionality: fbt, psr, scaling
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcdrrs-%s-scaledprimary
- * Description: Try different primary plane scaling strategies
- * Driver requirement: i915, xe
- * Functionality: drrs, fbc, fbt, scaling
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcpsr-%s-scaledprimary
- * Description: Try different primary plane scaling strategies
- * Driver requirement: i915, xe
- * Functionality: fbc, fbt, psr, scaling
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: psrdrrs-%s-scaledprimary
- * Description: Try different primary plane scaling strategies
- * Driver requirement: i915, xe
- * Functionality: drrs, fbt, psr, scaling
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcpsrdrrs-%s-scaledprimary
- * Description: Try different primary plane scaling strategies
- * Driver requirement: i915, xe
- * Functionality: drrs, fbc, fbt, psr, scaling
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @indfb:          Individual fb
- * @shrfb:          Shared fb
- */
+	switch (t->screen) {
+	case SCREEN_PRIM:
+		assertions = ASSERT_LAST_ACTION_CHANGED;
+
+		if (prim_plane_disabled())
+			assertions |= ASSERT_FBC_DISABLED;
+		break;
+	case SCREEN_SCND:
+		assertions = ASSERT_NO_ACTION_CHANGE;
+		break;
+	default:
+		igt_assert(false);
+	}
+	do_assertions(assertions);
+
+	igt_plane_set_fb(params->sprite.plane, NULL);
+	igt_display_commit(&drm.display);
+
+	if (t->screen == SCREEN_PRIM)
+		assertions = ASSERT_LAST_ACTION_CHANGED;
+	update_wanted_crc(t, &blue_crcs[t->format].crc);
+	do_assertions(assertions);
+
+	igt_remove_fb(drm.fd, &fullscreen_fb);
+}
 
 /*
  * scaledprimary - try different primary plane scaling strategies
@@ -4209,56 +4437,6 @@ static void scaledprimary_subtest(const struct test_mode *t)
 	igt_remove_fb(drm.fd, &new_fb);
 }
 
-/**
- * SUBTEST: drrs-modesetfrombusy
- * Description: Modeset from a busy buffer to a non-busy buffer with DRRS
- * Driver requirement: i915, xe
- * Functionality: drrs, fbt, scaling
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbc-modesetfrombusy
- * Description: Modeset from a busy buffer to a non-busy buffer with FBC
- * Driver requirement: i915, xe
- * Functionality: fbc, fbt, scaling
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: psr-modesetfrombusy
- * Description: Modeset from a busy buffer to a non-busy buffer with PSR
- * Driver requirement: i915, xe
- * Functionality: fbt, psr, scaling
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcdrrs-modesetfrombusy
- * Description: Modeset from a busy buffer to a non-busy buffer with FBC & DRRS
- * Driver requirement: i915, xe
- * Functionality: drrs, fbc, fbt, scaling
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcpsr-modesetfrombusy
- * Description: Modeset from a busy buffer to a non-busy buffer with FBC & PSR
- * Driver requirement: i915, xe
- * Functionality: fbc, fbt, psr, scaling
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: psrdrrs-modesetfrombusy
- * Description: Modeset from a busy buffer to a non-busy buffer with PSR & DRRS
- * Driver requirement: i915, xe
- * Functionality: drrs, fbt, psr, scaling
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcpsrdrrs-modesetfrombusy
- * Description: Modeset from a busy buffer to a non-busy buffer with FBC, PSR & DRRS
- * Driver requirement: i915, xe
- * Functionality: drrs, fbc, fbt, psr, scaling
- * Mega feature: General Display Features
- */
-
 /**
  * modesetfrombusy - modeset from a busy buffer to a non-busy buffer
  *
@@ -4302,57 +4480,6 @@ static void modesetfrombusy_subtest(const struct test_mode *t)
 	igt_remove_fb(drm.fd, &fb2);
 }
 
-/**
- * SUBTEST: drrs-suspend
- * Description: Make sure suspend/resume keeps us on the same state of DRRS
- * Driver requirement: i915, xe
- * Functionality: drrs, fbt, suspend
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbc-suspend
- * Description: Make sure suspend/resume keeps us on the same state of FBC
- * Driver requirement: i915, xe
- * Functionality: fbc, fbt, suspend
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: psr-suspend
- * Description: Make sure suspend/resume keeps us on the same state of PSR
- * Driver requirement: i915, xe
- * Functionality: fbt, psr, suspend
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcdrrs-suspend
- * Description: Make sure suspend/resume keeps us on the same state of FBC & DRRS
- * Driver requirement: i915, xe
- * Functionality: drrs, fbc, fbt, suspend
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcpsr-suspend
- * Description: Make sure suspend/resume keeps us on the same state of FBC & PSR
- * Driver requirement: i915, xe
- * Functionality: fbc, fbt, psr, suspend
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: psrdrrs-suspend
- * Description: Make sure suspend/resume keeps us on the same state of PSR & DRRS
- * Driver requirement: i915, xe
- * Functionality: drrs, fbt, psr, suspend
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcpsrdrrs-suspend
- * Description: Make sure suspend/resume keeps us on the same state of FBC, PSR & DRRS
- * Driver requirement: i915, xe
- * Functionality: drrs, fbc, fbt, psr, suspend
- * Mega feature: General Display Features
- * Test category: functionality test
- */
-
 /**
  * suspend - make sure suspend/resume keeps us on the same state
  *
@@ -4385,57 +4512,6 @@ static void suspend_subtest(const struct test_mode *t)
 	do_assertions(0);
 }
 
-/**
- * SUBTEST: drrs-farfromfence-mmap-gtt
- * Description: Test drawing as far from the fence start as possible
- * Driver requirement: i915
- * Functionality: drrs, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbc-farfromfence-mmap-gtt
- * Description: Test drawing as far from the fence start as possible
- * Driver requirement: i915
- * Functionality: fbc, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: psr-farfromfence-mmap-gtt
- * Description: Test drawing as far from the fence start as possible
- * Driver requirement: i915
- * Functionality: fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcdrrs-farfromfence-mmap-gtt
- * Description: Test drawing as far from the fence start as possible
- * Driver requirement: i915
- * Functionality: drrs, fbc, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcpsr-farfromfence-mmap-gtt
- * Description: Test drawing as far from the fence start as possible
- * Driver requirement: i915
- * Functionality: fbc, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: psrdrrs-farfromfence-mmap-gtt
- * Description: Test drawing as far from the fence start as possible
- * Driver requirement: i915
- * Functionality: drrs, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcpsrdrrs-farfromfence-mmap-gtt
- * Description: Test drawing as far from the fence start as possible
- * Driver requirement: i915
- * Functionality: drrs, fbc, fbt, kms_core, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- */
-
 /**
  * farfromfence - test drawing as far from the fence start as possible
  *
@@ -4509,36 +4585,6 @@ static void farfromfence_subtest(const struct test_mode *t)
 	igt_remove_fb(drm.fd, &tall_fb);
 }
 
-/**
- * SUBTEST: fbc-stridechange
- * Description: Change the frontbuffer stride by doing a modeset
- * Driver requirement: i915, xe
- * Functionality: fbc, fbt
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcdrrs-stridechange
- * Description: Change the frontbuffer stride by doing a modeset
- * Driver requirement: i915, xe
- * Functionality: drrs, fbc, fbt
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcpsr-stridechange
- * Description: Change the frontbuffer stride by doing a modeset
- * Driver requirement: i915, xe
- * Functionality: fbc, fbt, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcpsrdrrs-stridechange
- * Description: Change the frontbuffer stride by doing a modeset
- * Driver requirement: i915, xe
- * Functionality: drrs, fbc, fbt, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- */
-
 /**
  * stridechange - change the frontbuffer stride by doing a modeset
  *
@@ -4603,46 +4649,6 @@ static void stridechange_subtest(const struct test_mode *t)
 	do_assertions(rc ? 0 : DONT_ASSERT_FBC_STATUS);
 }
 
-/**
- * SUBTEST: fbc-tiling-%s
- * Description: Test %arg[1] formats, if the tiling format supports FBC do the
- *              basic drawing test, else set the mode & test if FBC is disabled
- * Driver requirement: i915, xe
- * Functionality: fbc, fbt, tiling
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcdrrs-tiling-%s
- * Description: Test %arg[1] formats, if the tiling format supports FBC do the
- *              basic drawing test, else set the mode & test if FBC is disabled
- * Driver requirement: i915, xe
- * Functionality: drrs, fbc, fbt, tiling
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcpsr-tiling-%s
- * Description: Test %arg[1] formats, if the tiling format supports FBC do the
- *              basic drawing test, else set the mode & test if FBC is disabled
- * Driver requirement: i915, xe
- * Functionality: fbc, fbt, psr, tiling
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcpsrdrrs-tiling-%s
- * Description: Test %arg[1] formats, if the tiling format supports FBC do the
- *              basic drawing test, else set the mode & test if FBC is disabled
- * Driver requirement: i915, xe
- * Functionality: drrs, fbc, fbt, psr, tiling
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @4:              4 tiling
- * @linear:         Linear tiling
- * @y:              Y tiling
- */
-
 /**
  * tiling_disable_fbc_subtest - Check if tiling is unsupported by FBC
  *
@@ -4692,15 +4698,6 @@ static void tiling_disable_fbc_subtest(const struct test_mode *t)
 	igt_remove_fb(drm.fd, &new_fb);
 }
 
-/**
- * SUBTEST: basic
- * Description: Do some basic operations regardless of which features are enabled
- * Driver requirement: i915, xe
- * Functionality: fbt
- * Mega feature: General Display Features
- * Test category: functionality test
- */
-
 /*
  * basic - do some basic operations regardless of which features are enabled
  *
diff --git a/tests/intel/kms_legacy_colorkey.c b/tests/intel/kms_legacy_colorkey.c
index 877a6799a..69539f558 100644
--- a/tests/intel/kms_legacy_colorkey.c
+++ b/tests/intel/kms_legacy_colorkey.c
@@ -21,14 +21,16 @@
  * IN THE SOFTWARE.
  */
 
-#include "igt.h"
-#include <errno.h>
-
 /**
  * TEST: kms legacy colorkey
  * Category: Display
  * Description: Test to check the legacy set colorkey ioctl on sprite planes.
- *
+ */
+
+#include "igt.h"
+#include <errno.h>
+
+/**
  * SUBTEST: basic
  * Description: Check that the legacy set colorkey ioctl only works on sprite planes.
  * Driver requirement: i915
diff --git a/tests/intel/kms_mmap_write_crc.c b/tests/intel/kms_mmap_write_crc.c
index c8ff39ef0..59a838fe4 100644
--- a/tests/intel/kms_mmap_write_crc.c
+++ b/tests/intel/kms_mmap_write_crc.c
@@ -24,6 +24,13 @@
  *    Tiago Vignatti <tiago.vignatti at intel.com>
  */
 
+/**
+ * TEST: kms mmap write crc
+ * Category: Display
+ * Description: Use the display CRC support to validate mmap write to an already
+ *              uncached future scanout buffer.
+ */
+
 #include <errno.h>
 #include <limits.h>
 #include <stdbool.h>
@@ -37,12 +44,8 @@
 #include "intel_chipset.h"
 #include "ioctl_wrappers.h"
 #include "igt_aux.h"
+
 /**
- * TEST: kms mmap write crc
- * Category: Display
- * Description: Use the display CRC support to validate mmap write to an already
- *              uncached future scanout buffer.
- *
  * SUBTEST: main
  * Description: Tests that caching mode has become UC/WT and flushed using mmap write
  * Driver requirement: i915, xe
diff --git a/tests/intel/kms_pipe_b_c_ivb.c b/tests/intel/kms_pipe_b_c_ivb.c
index 386f3003a..c1a1e6610 100644
--- a/tests/intel/kms_pipe_b_c_ivb.c
+++ b/tests/intel/kms_pipe_b_c_ivb.c
@@ -24,13 +24,16 @@
  *   Ander Conselvan de Oliveira <ander.conselvan.de.oliveira@intel.com>
  */
 
-#include "igt.h"
 /**
  * TEST: kms pipe b c ivb
  * Category: Display
  * Description: Exercise the FDI lane bifurcation code for IVB in the kernel by
  *              setting different combinations of modes for pipes B and C.
- *
+ */
+
+#include "igt.h"
+
+/**
  * SUBTEST: disable-pipe-B-enable-pipe-C
  * Description: Tests pipe-B and pipe-C interactions in IVB by disabling pipe-B
  *              and then setting mode on pipe-C.
diff --git a/tests/intel/kms_pm_backlight.c b/tests/intel/kms_pm_backlight.c
index f6e7db0b2..68f4dc3d1 100644
--- a/tests/intel/kms_pm_backlight.c
+++ b/tests/intel/kms_pm_backlight.c
@@ -25,6 +25,12 @@
  *
  */
 
+/**
+ * TEST: kms pm backlight
+ * Category: Display
+ * Description: Basic backlight sysfs test
+ */
+
 #include "igt.h"
 #include <limits.h>
 #include <sys/types.h>
@@ -36,11 +42,8 @@
 #include <time.h>
 #include "igt_device.h"
 #include "igt_device_scan.h"
+
 /**
- * TEST: kms pm backlight
- * Category: Display
- * Description: Basic backlight sysfs test
- *
  * SUBTEST: bad-brightness
  * Description: Test the bad brightness.
  * Driver requirement: i915, xe
diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index a3c7c4018..1c33206fc 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -22,6 +22,12 @@
  *
  */
 
+/**
+ * TEST: kms pm dc
+ * Category: Display
+ * Description: Tests to validate display power DC states.
+ */
+
 #include <errno.h>
 #include <fcntl.h>
 #include <stdbool.h>
@@ -39,10 +45,6 @@
 #include "xe/xe_query.h"
 
 /**
- * TEST: kms pm dc
- * Category: Display
- * Description: Tests to validate display power DC states.
- *
  * SUBTEST: dc3co-vpb-simulation
  * Description: Make sure that system enters DC3CO when PSR2 is active and system
  *              is in SLEEP state
diff --git a/tests/intel/kms_pm_lpsp.c b/tests/intel/kms_pm_lpsp.c
index a85e4e795..4ac99faf7 100644
--- a/tests/intel/kms_pm_lpsp.c
+++ b/tests/intel/kms_pm_lpsp.c
@@ -24,6 +24,12 @@
  *
  */
 
+/**
+ * TEST: kms pm lpsp
+ * Description: These tests validates display Low Power Single Pipe configurations
+ * Category: Display
+ */
+
 #include "igt.h"
 #include "igt_kmod.h"
 #include "igt_pm.h"
@@ -32,11 +38,8 @@
 #include <sys/stat.h>
 #include <fcntl.h>
 #include <unistd.h>
+
 /**
- * TEST: kms pm lpsp
- * Description: These tests validates display Low Power Single Pipe configurations
- * Category: Display
- *
  * SUBTEST: kms-lpsp
  * Description: This test validates lpsp on all connected outputs on low power pipes
  * Driver requirement: i915, xe
diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c
index afd74eaff..1586d3bf0 100644
--- a/tests/intel/kms_psr.c
+++ b/tests/intel/kms_psr.c
@@ -237,18 +237,14 @@
  * Functionality: dpms, pr
  * Mega feature: Panel Replay
  * Test category: functionality test
- */
-
-/**
+ *
  * SUBTEST: pr_no_drrs
  * Description: Check if pr is detecting changes when drrs is disabled
  * Driver requirement: i915, xe
  * Functionality: drrs, pr
  * Mega feature: Panel Replay
  * Test category: functionality test
- */
-
-/**
+ *
  * SUBTEST: pr_suspend
  * Description: Check if pr is detecting changes when plane operation is
  *              performed with suspend resume cycles
@@ -256,9 +252,7 @@
  * Functionality: pr, suspend
  * Mega feature: Panel Replay
  * Test category: functionality test
- */
-
-/**
+ *
  * SUBTEST: pr_basic
  * Description: Basic check for pr if it is detecting changes made in planes
  * Driver requirement: i915, xe
@@ -296,9 +290,7 @@
  * Functionality: plane, pr
  * Mega feature: Panel Replay
  * Test category: functionality test
- */
-
-/**
+ *
  * SUBTEST: pr_primary_%s
  * Description: Check if pr is detecting memory mapping, rendering and plane
  *              operations performed on primary planes
@@ -335,6 +327,32 @@
  * @plane_move:         Move plane position
  */
 
+/**
+ * SUBTEST: psr_cursor_plane_move
+ * Description: Check if psr is detecting the plane operations performed on
+ *		cursor planes
+ * Driver requirement: i915, xe
+ * Test category: functionality test
+ * Functionality: psr
+ * Mega feature: PSR
+ *
+ * SUBTEST: psr_primary_page_flip
+ * Description: Check if psr is detecting page-flipping operations performed
+ *		on primary planes
+ * Driver requirement: i915, xe
+ * Test category: functionality test
+ * Functionality: psr
+ * Mega feature: PSR
+ *
+ * SUBTEST: psr_sprite_plane_onoff
+ * Description: Check if psr is detecting the plane operations performed on
+ *		sprite planes
+ * Driver requirement: i915, xe
+ * Test category: functionality test
+ * Functionality: psr
+ * Mega feature: PSR
+ */
+
 enum operations {
 	PAGE_FLIP,
 	MMAP_GTT,
@@ -576,32 +594,6 @@ static void fb_dirty_fb_ioctl(data_t *data, struct igt_fb *fb)
 	igt_assert(ret == 0 || ret == -ENOSYS);
 }
 
-/**
- * SUBTEST: psr_cursor_plane_move
- * Description: Check if psr is detecting the plane operations performed on
- *		cursor planes
- * Driver requirement: i915, xe
- * Test category: functionality test
- * Functionality: psr
- * Mega feature: PSR
- *
- * SUBTEST: psr_primary_page_flip
- * Description: Check if psr is detecting page-flipping operations performed
- *		on primary planes
- * Driver requirement: i915, xe
- * Test category: functionality test
- * Functionality: psr
- * Mega feature: PSR
- *
- * SUBTEST: psr_sprite_plane_onoff
- * Description: Check if psr is detecting the plane operations performed on
- *		sprite planes
- * Driver requirement: i915, xe
- * Test category: functionality test
- * Functionality: psr
- * Mega feature: PSR
- */
-
 static void run_test(data_t *data)
 {
 	uint32_t handle = data->fb_white.gem_handle;
diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
index a597c8701..a93d496e8 100644
--- a/tests/intel/kms_psr2_sf.c
+++ b/tests/intel/kms_psr2_sf.c
@@ -22,6 +22,13 @@
  *
  */
 
+/**
+ * TEST: kms psr2 sf
+ * Category: Display
+ * Description: Tests to varify PSR2 selective fetch by sending multiple damaged
+ *              areas
+ */
+
 #include "igt.h"
 #include "igt_sysfs.h"
 #include "igt_psr.h"
@@ -30,12 +37,8 @@
 #include <stdbool.h>
 #include <stdio.h>
 #include <string.h>
+
 /**
- * TEST: kms psr2 sf
- * Category: Display
- * Description: Tests to varify PSR2 selective fetch by sending multiple damaged
- *              areas
- *
  * SUBTEST: %s-plane-move-continuous-%s
  * Description: Test that selective fetch works on moving %arg[1] plane %arg[2]
  *              visible area (no update)
diff --git a/tests/intel/kms_psr2_su.c b/tests/intel/kms_psr2_su.c
index 1969c6fa7..56f35622e 100644
--- a/tests/intel/kms_psr2_su.c
+++ b/tests/intel/kms_psr2_su.c
@@ -22,6 +22,12 @@
  *
  */
 
+/**
+ * TEST: kms psr2 su
+ * Category: Display
+ * Description: Test PSR2 selective update
+ */
+
 #include "igt.h"
 #include "igt_sysfs.h"
 #include "igt_psr.h"
@@ -30,11 +36,8 @@
 #include <stdio.h>
 #include <string.h>
 #include <sys/timerfd.h>
+
 /**
- * TEST: kms psr2 su
- * Category: Display
- * Description: Test PSR2 selective update
- *
  * SUBTEST: frontbuffer-XRGB8888
  * Description: Test that selective update works when screen changes
  * Driver requirement: i915, xe
diff --git a/tests/intel/kms_psr_stress_test.c b/tests/intel/kms_psr_stress_test.c
index 6a3d2918c..21814f35b 100644
--- a/tests/intel/kms_psr_stress_test.c
+++ b/tests/intel/kms_psr_stress_test.c
@@ -1,3 +1,9 @@
+
+/**
+ * TEST: kms psr stress test
+ * Category: Display
+ */
+
 #include "igt.h"
 #include "igt_sysfs.h"
 #include "igt_psr.h"
@@ -7,10 +13,8 @@
 #include <stdio.h>
 #include <string.h>
 #include <sys/timerfd.h>
+
 /**
- * TEST: kms psr stress test
- * Category: Display
- *
  * SUBTEST: flip-primary-invalidate-overlay
  * Description: Mix page flips in primary plane and frontbuffer writes to overlay
  *              plane and check for warnings, underruns or PSR state changes
diff --git a/tests/intel/kms_pwrite_crc.c b/tests/intel/kms_pwrite_crc.c
index ee6b4f3e4..12add5da6 100644
--- a/tests/intel/kms_pwrite_crc.c
+++ b/tests/intel/kms_pwrite_crc.c
@@ -22,6 +22,12 @@
  *
  */
 
+/**
+ * TEST: kms pwrite crc
+ * Category: Display
+ * Description: Test to validate pwrite buffer using the display CRC
+ */
+
 #include "igt.h"
 #include <errno.h>
 #include <limits.h>
@@ -30,10 +36,6 @@
 #include <string.h>
 
 /**
- * TEST: kms pwrite crc
- * Category: Display
- * Description: Test to validate pwrite buffer using the display CRC
- *
  * SUBTEST:
  * Description: Use the display CRC support to validate pwrite to an already
  *              uncached future scanout buffer.
diff --git a/tests/kms_3d.c b/tests/kms_3d.c
index fa73d0cc6..ad6c45e9b 100644
--- a/tests/kms_3d.c
+++ b/tests/kms_3d.c
@@ -22,13 +22,16 @@
  *
  */
 
-#include "igt.h"
-#include "xe/xe_query.h"
 /**
  * TEST: kms 3d
  * Category: Display
  * Description: Tests 3D mode setting.
- *
+ */
+
+#include "igt.h"
+#include "xe/xe_query.h"
+
+/**
  * SUBTEST:
  * Description: Tests 3D mode setting.
  * Driver requirement: i915, xe
diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
index 426277422..844d8cd3e 100644
--- a/tests/kms_addfb_basic.c
+++ b/tests/kms_addfb_basic.c
@@ -50,22 +50,6 @@
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 
-static uint32_t gem_bo;
-static uint32_t gem_bo_small;
-static igt_display_t display;
-
-static int legacy_addfb(int fd, struct drm_mode_fb_cmd *arg)
-{
-	int err;
-
-	err = 0;
-	if (igt_ioctl(fd, DRM_IOCTL_MODE_ADDFB, arg))
-		err = -errno;
-
-	errno = 0;
-	return err;
-}
-
 /**
  * SUBTEST: unused-%s
  * Description: Test that addfb2 call fails correctly for unused %arg[1]
@@ -109,6 +93,216 @@ static int legacy_addfb(int fd, struct drm_mode_fb_cmd *arg)
  * @pitches:      Pitches
  * @offsets:      Offsets
  */
+
+/**
+ * SUBTEST: no-handle
+ * Description: Test that addfb2 call fails correctly without handle
+ * Driver requirement: i915, xe
+ * Test category: functionality test
+ * Functionality: kms_gem_interop
+ * Mega feature: General Display Features
+ *
+ * SUBTEST: basic
+ * Description: Check if addfb2 call works with given handle
+ * Driver requirement: i915, xe
+ * Test category: functionality test
+ * Functionality: kms_gem_interop
+ * Mega feature: General Display Features
+ *
+ * SUBTEST: bad-pitch-%i
+ * Description: bad-pitch-%arg[1]: Test that addfb2 call fails correctly for bad-pitches
+ * Driver requirement: i915, xe
+ * Test category: functionality test
+ * Functionality: kms_gem_interop
+ * Mega feature: General Display Features
+ *
+ * arg[1].values: 0, 32, 63, 128, 256, 999, 1024, 65536
+ */
+
+/**
+ * SUBTEST: basic-%s-tiled-legacy
+ * Description: Check if addfb2 and rmfb call works for basic %arg[1] test
+ * Driver requirement: i915
+ * Test category: functionality test
+ * Functionality: kms_gem_interop, tiling
+ * Mega feature: General Display Features
+ *
+ * SUBTEST: framebuffer-vs-set-tiling
+ * Description: Check if addfb2 call works for x and y tiling
+ * Driver requirement: i915
+ * Test category: functionality test
+ * Functionality: kms_gem_interop, tiling
+ * Mega feature: General Display Features
+ *
+ * SUBTEST: tile-pitch-mismatch
+ * Description: Test that addfb2 call fails correctly for pitches mismatch
+ * Driver requirement: i915
+ * Test category: functionality test
+ * Functionality: kms_gem_interop, tiling
+ * Mega feature: General Display Features
+ *
+ * arg[1]:
+ *
+ * @x:        x-tiling
+ * @y:        y-tiling
+ */
+
+/**
+ * SUBTEST: size-max
+ * Description: Check if addfb2 call works with max size of buffer object
+ * Driver requirement: i915, xe
+ * Test category: functionality test
+ * Functionality: kms_gem_interop
+ * Mega feature: General Display Features
+ *
+ * SUBTEST: too-wide
+ * Description: Test that addfb2 call fails correctly with increased width of fb
+ * Driver requirement: i915, xe
+ * Test category: functionality test
+ * Functionality: kms_gem_interop
+ * Mega feature: General Display Features
+ *
+ * SUBTEST: too-high
+ * Description: Test that addfb2 call fails correctly with increased height of fb
+ * Driver requirement: i915, xe
+ * Test category: functionality test
+ * Functionality: kms_gem_interop
+ * Mega feature: General Display Features
+ *
+ * SUBTEST: bo-too-small
+ * Description: Test that addfb2 call fails correctly with small size of buffer object
+ * Driver requirement: i915, xe
+ * Test category: functionality test
+ * Functionality: kms_gem_interop
+ * Mega feature: General Display Features
+ *
+ * SUBTEST: small-bo
+ * Description: Check if addfb2 call works for given height
+ * Driver requirement: i915, xe
+ * Test category: functionality test
+ * Functionality: kms_gem_interop
+ * Mega feature: General Display Features
+ *
+ * SUBTEST: bo-too-small-due-to-tiling
+ * Description: Test that addfb2 call fails correctly with small buffer object
+ *              after changing tile
+ * Driver requirement: i915
+ * Test category: functionality test
+ * Functionality: kms_gem_interop, tiling
+ * Mega feature: General Display Features
+ */
+
+/**
+ * SUBTEST: addfb25-modifier-no-flag
+ * Description: Test that addfb2 call fails correctly for x-tiling with given modifier
+ * Driver requirement: i915, xe
+ * Test category: functionality test
+ * Functionality: kms_gem_interop, tiling
+ * Mega feature: General Display Features
+ *
+ * SUBTEST: addfb25-bad-modifier
+ * Description: Test that addfb2 call fails correctly for irrelevant modifier
+ * Driver requirement: i915, xe
+ * Test category: functionality test
+ * Functionality: kms_gem_interop, tiling
+ * Mega feature: General Display Features
+ *
+ * SUBTEST: addfb25-x-tiled-mismatch-legacy
+ * Description: Test that addfb2 call fails correctly for irrelevant x-tiling
+ * Driver requirement: i915
+ * Test category: functionality test
+ * Functionality: kms_gem_interop, tiling
+ * Mega feature: General Display Features
+ *
+ * SUBTEST: addfb25-x-tiled-legacy
+ * Description: Check if addfb2 call works for x-tiling
+ * Driver requirement: i915, xe
+ * Test category: functionality test
+ * Functionality: kms_gem_interop, tiling
+ * Mega feature: General Display Features
+ *
+ * SUBTEST: addfb25-framebuffer-vs-set-tiling
+ * Description: Check if addfb2 call works for relevant combination of tiling and fbs
+ * Driver requirement: i915
+ * Test category: functionality test
+ * Functionality: kms_gem_interop, tiling
+ * Mega feature: General Display Features
+ */
+
+/**
+ * SUBTEST: addfb25-y-tiled-%s
+ * Description: Check if addfb2 call works for y-tiling %arg[1]
+ * Driver requirement: i915, xe
+ * Functionality: kms_gem_interop, tiling
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: addfb25-yf-tiled-legacy
+ * Description: Check if addfb2 call works for yf-tiling
+ * Driver requirement: i915, xe
+ * Functionality: kms_gem_interop, tiling
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @legacy:               with default size
+ * @small-legacy:         with given size & modifier
+ */
+
+/**
+ * SUBTEST: addfb25-4-tiled
+ * Description: Check if addfb2 call works for tiling-4
+ * Driver requirement: i915, xe
+ * Functionality: kms_gem_interop, tiling
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ */
+
+/**
+ * SUBTEST: invalid-%s-%s
+ * Description: Test that %arg[1] ioctl call fails correctly for %arg[2] object
+ * Driver requirement: i915, xe
+ * Test category: functionality test
+ * Functionality: kms_gem_interop
+ * Mega feature: General Display Features
+ *
+ * arg[1]:
+ *
+ * @get:           get-properties
+ * @set:           set-properties
+ *
+ * arg[2]:
+ *
+ * @prop:          fb mode
+ * @prop-any:      invalid
+ */
+
+/**
+ * SUBTEST: master-rmfb
+ * Description: Check that only master can rmfb
+ * Driver requirement: i915, xe
+ * Functionality: kms_gem_interop
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ */
+
+static uint32_t gem_bo;
+static uint32_t gem_bo_small;
+static igt_display_t display;
+
+static int legacy_addfb(int fd, struct drm_mode_fb_cmd *arg)
+{
+	int err;
+
+	err = 0;
+	if (igt_ioctl(fd, DRM_IOCTL_MODE_ADDFB, arg))
+		err = -errno;
+
+	errno = 0;
+	return err;
+}
+
 static void invalid_tests(int fd)
 {
 	struct drm_mode_fb_cmd2 f = {};
@@ -322,30 +516,6 @@ static void invalid_tests(int fd)
 	}
 }
 
-/**
- * SUBTEST: no-handle
- * Description: Test that addfb2 call fails correctly without handle
- * Driver requirement: i915, xe
- * Test category: functionality test
- * Functionality: kms_gem_interop
- * Mega feature: General Display Features
- *
- * SUBTEST: basic
- * Description: Check if addfb2 call works with given handle
- * Driver requirement: i915, xe
- * Test category: functionality test
- * Functionality: kms_gem_interop
- * Mega feature: General Display Features
- *
- * SUBTEST: bad-pitch-%i
- * Description: bad-pitch-%arg[1]: Test that addfb2 call fails correctly for bad-pitches
- * Driver requirement: i915, xe
- * Test category: functionality test
- * Functionality: kms_gem_interop
- * Mega feature: General Display Features
- *
- * arg[1].values: 0, 32, 63, 128, 256, 999, 1024, 65536
- */
 static void pitch_tests(int fd)
 {
 	struct drm_mode_fb_cmd2 f = {};
@@ -393,33 +563,6 @@ static void pitch_tests(int fd)
 		gem_close(fd, gem_bo);
 }
 
-/**
- * SUBTEST: basic-%s-tiled-legacy
- * Description: Check if addfb2 and rmfb call works for basic %arg[1] test
- * Driver requirement: i915
- * Test category: functionality test
- * Functionality: kms_gem_interop, tiling
- * Mega feature: General Display Features
- *
- * SUBTEST: framebuffer-vs-set-tiling
- * Description: Check if addfb2 call works for x and y tiling
- * Driver requirement: i915
- * Test category: functionality test
- * Functionality: kms_gem_interop, tiling
- * Mega feature: General Display Features
- *
- * SUBTEST: tile-pitch-mismatch
- * Description: Test that addfb2 call fails correctly for pitches mismatch
- * Driver requirement: i915
- * Test category: functionality test
- * Functionality: kms_gem_interop, tiling
- * Mega feature: General Display Features
- *
- * arg[1]:
- *
- * @x:        x-tiling
- * @y:        y-tiling
- */
 static void tiling_tests(int fd)
 {
 	struct drm_mode_fb_cmd2 f = {};
@@ -504,50 +647,6 @@ static void tiling_tests(int fd)
 	}
 }
 
-/**
- * SUBTEST: size-max
- * Description: Check if addfb2 call works with max size of buffer object
- * Driver requirement: i915, xe
- * Test category: functionality test
- * Functionality: kms_gem_interop
- * Mega feature: General Display Features
- *
- * SUBTEST: too-wide
- * Description: Test that addfb2 call fails correctly with increased width of fb
- * Driver requirement: i915, xe
- * Test category: functionality test
- * Functionality: kms_gem_interop
- * Mega feature: General Display Features
- *
- * SUBTEST: too-high
- * Description: Test that addfb2 call fails correctly with increased height of fb
- * Driver requirement: i915, xe
- * Test category: functionality test
- * Functionality: kms_gem_interop
- * Mega feature: General Display Features
- *
- * SUBTEST: bo-too-small
- * Description: Test that addfb2 call fails correctly with small size of buffer object
- * Driver requirement: i915, xe
- * Test category: functionality test
- * Functionality: kms_gem_interop
- * Mega feature: General Display Features
- *
- * SUBTEST: small-bo
- * Description: Check if addfb2 call works for given height
- * Driver requirement: i915, xe
- * Test category: functionality test
- * Functionality: kms_gem_interop
- * Mega feature: General Display Features
- *
- * SUBTEST: bo-too-small-due-to-tiling
- * Description: Test that addfb2 call fails correctly with small buffer object
- *              after changing tile
- * Driver requirement: i915
- * Test category: functionality test
- * Functionality: kms_gem_interop, tiling
- * Mega feature: General Display Features
- */
 static void size_tests(int fd)
 {
 	struct drm_mode_fb_cmd2 f = {};
@@ -663,42 +762,6 @@ static void size_tests(int fd)
 	}
 }
 
-/**
- * SUBTEST: addfb25-modifier-no-flag
- * Description: Test that addfb2 call fails correctly for x-tiling with given modifier
- * Driver requirement: i915, xe
- * Test category: functionality test
- * Functionality: kms_gem_interop, tiling
- * Mega feature: General Display Features
- *
- * SUBTEST: addfb25-bad-modifier
- * Description: Test that addfb2 call fails correctly for irrelevant modifier
- * Driver requirement: i915, xe
- * Test category: functionality test
- * Functionality: kms_gem_interop, tiling
- * Mega feature: General Display Features
- *
- * SUBTEST: addfb25-x-tiled-mismatch-legacy
- * Description: Test that addfb2 call fails correctly for irrelevant x-tiling
- * Driver requirement: i915
- * Test category: functionality test
- * Functionality: kms_gem_interop, tiling
- * Mega feature: General Display Features
- *
- * SUBTEST: addfb25-x-tiled-legacy
- * Description: Check if addfb2 call works for x-tiling
- * Driver requirement: i915, xe
- * Test category: functionality test
- * Functionality: kms_gem_interop, tiling
- * Mega feature: General Display Features
- *
- * SUBTEST: addfb25-framebuffer-vs-set-tiling
- * Description: Check if addfb2 call works for relevant combination of tiling and fbs
- * Driver requirement: i915
- * Test category: functionality test
- * Functionality: kms_gem_interop, tiling
- * Mega feature: General Display Features
- */
 static void addfb25_tests(int fd)
 {
 	struct drm_mode_fb_cmd2 f = {};
@@ -785,26 +848,6 @@ static int addfb_expected_ret(igt_display_t *disp, struct drm_mode_fb_cmd2 *f)
 					  f->modifier[0]) ? 0 : -1;
 }
 
-/**
- * SUBTEST: addfb25-y-tiled-%s
- * Description: Check if addfb2 call works for y-tiling %arg[1]
- * Driver requirement: i915, xe
- * Functionality: kms_gem_interop, tiling
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: addfb25-yf-tiled-legacy
- * Description: Check if addfb2 call works for yf-tiling
- * Driver requirement: i915, xe
- * Functionality: kms_gem_interop, tiling
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @legacy:               with default size
- * @small-legacy:         with given size & modifier
- */
 static void addfb25_ytile(int fd)
 {
 	struct drm_mode_fb_cmd2 f = {};
@@ -871,14 +914,6 @@ static void addfb25_ytile(int fd)
 	}
 }
 
-/**
- * SUBTEST: addfb25-4-tiled
- * Description: Check if addfb2 call works for tiling-4
- * Driver requirement: i915, xe
- * Functionality: kms_gem_interop, tiling
- * Mega feature: General Display Features
- * Test category: functionality test
- */
 static void addfb25_4tile(int fd)
 {
 	struct drm_mode_fb_cmd2 f = {};
@@ -917,24 +952,6 @@ static void addfb25_4tile(int fd)
 		gem_close(fd, gem_bo);
 }
 
-/**
- * SUBTEST: invalid-%s-%s
- * Description: Test that %arg[1] ioctl call fails correctly for %arg[2] object
- * Driver requirement: i915, xe
- * Test category: functionality test
- * Functionality: kms_gem_interop
- * Mega feature: General Display Features
- *
- * arg[1]:
- *
- * @get:           get-properties
- * @set:           set-properties
- *
- * arg[2]:
- *
- * @prop:          fb mode
- * @prop-any:      invalid
- */
 static void prop_tests(int fd)
 {
 	struct drm_mode_fb_cmd2 f = {};
@@ -1000,14 +1017,6 @@ static void prop_tests(int fd)
 	}
 }
 
-/**
- * SUBTEST: master-rmfb
- * Description: Check that only master can rmfb
- * Driver requirement: i915, xe
- * Functionality: kms_gem_interop
- * Mega feature: General Display Features
- * Test category: functionality test
- */
 static void master_tests(int fd)
 {
 	struct drm_mode_fb_cmd2 f = {};
diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index f29c46645..82a8f5ef3 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -30,6 +30,7 @@
  * Category: Display
  * Description: Test asynchronous page flips.
  */
+
 #include "igt.h"
 #include "igt_aux.h"
 #include "igt_psr.h"
@@ -37,6 +38,54 @@
 #include <sys/time.h>
 #include <poll.h>
 
+/**
+ * SUBTEST: alternate-sync-async-flip
+ * Description: Verify the async flip functionality and the fps during async flips
+ *              Alternate between sync and async flips
+ * Driver requirement: i915, xe
+ * Functionality: async_flips, vblank
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: async-flip-with-page-flip-events
+ * Description: Verify the async flip functionality and the fps during async flips
+ *              Wait for page flip events in between successive asynchronous flips
+ * Driver requirement: i915, xe
+ * Functionality: async_flips, vblank
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: test-time-stamp
+ * Description: Verify the async flip functionality and the fps during async flips
+ *              Verify that the async flip timestamp does not coincide with either
+ *              previous or next vblank
+ * Driver requirement: i915, xe
+ * Functionality: async_flips, vblank
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: test-cursor
+ * Description: Verify that the DRM_IOCTL_MODE_CURSOR passes after async flip
+ * Driver requirement: i915, xe
+ * Functionality: async_flips, cursor, vblank
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: crc
+ * Description: Use CRC to verify async flip scans out the correct framebuffer
+ * Driver requirement: i915, xe
+ * Functionality: async_flips, crc, vblank
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: invalid-async-flip
+ * Description: Negative case to verify if changes in fb are rejected from kernel as expected
+ * Driver requirement: i915, xe
+ * Functionality: async_flips, vblank
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ */
+
 #define CURSOR_POS 128
 
 /*
@@ -203,23 +252,6 @@ static void test_init_fbs(data_t *data)
 	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 }
 
-/**
- * SUBTEST: alternate-sync-async-flip
- * Description: Verify the async flip functionality and the fps during async flips
- *              Alternate between sync and async flips
- * Driver requirement: i915, xe
- * Functionality: async_flips, vblank
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: async-flip-with-page-flip-events
- * Description: Verify the async flip functionality and the fps during async flips
- *              Wait for page flip events in between successive asynchronous flips
- * Driver requirement: i915, xe
- * Functionality: async_flips, vblank
- * Mega feature: General Display Features
- * Test category: functionality test
- */
 static void test_async_flip(data_t *data)
 {
 	int ret, frame;
@@ -315,16 +347,6 @@ static void wait_for_vblank(data_t *data, unsigned long *vbl_time, unsigned int
 	*seq = wait_vbl.reply.sequence;
 }
 
-/**
- * SUBTEST: test-time-stamp
- * Description: Verify the async flip functionality and the fps during async flips
- *              Verify that the async flip timestamp does not coincide with either
- *              previous or next vblank
- * Driver requirement: i915, xe
- * Functionality: async_flips, vblank
- * Mega feature: General Display Features
- * Test category: functionality test
- */
 static void test_timestamp(data_t *data)
 {
 	int flags = DRM_MODE_PAGE_FLIP_ASYNC | DRM_MODE_PAGE_FLIP_EVENT;
@@ -369,14 +391,6 @@ static void test_timestamp(data_t *data)
 		     "Async flip time stamp is expected to be in between 2 vblank time stamps\n");
 }
 
-/**
- * SUBTEST: test-cursor
- * Description: Verify that the DRM_IOCTL_MODE_CURSOR passes after async flip
- * Driver requirement: i915, xe
- * Functionality: async_flips, cursor, vblank
- * Mega feature: General Display Features
- * Test category: functionality test
- */
 static void test_cursor(data_t *data)
 {
 	int flags = DRM_MODE_PAGE_FLIP_ASYNC | DRM_MODE_PAGE_FLIP_EVENT;
@@ -529,14 +543,6 @@ static unsigned int clock_ms(void)
 	return ts.tv_sec * 1000 + ts.tv_nsec / 1000000;
 }
 
-/**
- * SUBTEST: crc
- * Description: Use CRC to verify async flip scans out the correct framebuffer
- * Driver requirement: i915, xe
- * Functionality: async_flips, crc, vblank
- * Mega feature: General Display Features
- * Test category: functionality test
- */
 static void test_crc(data_t *data)
 {
 	unsigned int frame = 0;
@@ -599,14 +605,6 @@ static void test_crc(data_t *data)
 	igt_assert_lt(data->frame_count * 2, data->flip_count);
 }
 
-/**
- * SUBTEST: invalid-async-flip
- * Description: Negative case to verify if changes in fb are rejected from kernel as expected
- * Driver requirement: i915, xe
- * Functionality: async_flips, vblank
- * Mega feature: General Display Features
- * Test category: functionality test
- */
 static void run_test(data_t *data, void (*test)(data_t *))
 {
 	igt_display_t *display = &data->display;
diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
index a47539e48..28af27f22 100644
--- a/tests/kms_atomic.c
+++ b/tests/kms_atomic.c
@@ -48,6 +48,94 @@
 #include "igt_aux.h"
 #include "sw_sync.h"
 
+/**
+ * SUBTEST: plane-primary-overlay-mutable-zpos
+ * Description: Verify that the overlay plane can cover the primary one (and
+ *              vice versa) by changing their zpos property.
+ * Driver requirement: i915, xe
+ * Functionality: kms_core, plane
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: plane-immutable-zpos
+ * Description: Verify the reported zpos property of planes by making sure only
+ *              higher zpos planes cover the lower zpos ones.
+ * Driver requirement: i915, xe
+ * Functionality: kms_core, plane
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: plane-%s-legacy
+ * Description: Test for KMS atomic modesetting on %arg[1] and ensure coherency
+ *              between legacy and atomic interfaces.
+ * Driver requirement: i915, xe
+ * Functionality: kms_core, plane
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @cursor:         Cursor plane
+ * @overlay:        Overlay plane
+ * @primary:        Primary plane
+ */
+
+/**
+ * SUBTEST: test-only
+ * Description: Test to ensure that DRM_MODE_ATOMIC_TEST_ONLY really only touches
+ *              the free-standing state objects and nothing else.
+ * Driver requirement: i915, xe
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ */
+
+/**
+ * SUBTEST: plane-invalid-%s
+ * Description: Test error handling when invalid %arg[1] are passed
+ * Driver requirement: i915, xe
+ * Functionality: kms_core, plane
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @params:           plane parameters
+ * @params-fence:     plane fence parameters
+ */
+
+/**
+ * SUBTEST: crtc-invalid-%s
+ * Description: Test error handling when invalid %arg[1] are passed
+ * Driver requirement: i915, xe
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @params:           crtc parameters
+ * @params-fence:     crtc fence parameters
+ */
+
+/**
+ * SUBTEST: atomic-invalid-params
+ * Description: Test abuse the atomic ioctl directly in order to test various
+ *              invalid conditions which the libdrm wrapper won't allow us to
+ *              create.
+ * Driver requirement: i915, xe
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: atomic-plane-damage
+ * Description: Simple test cases to use FB_DAMAGE_CLIPS plane property
+ * Driver requirement: i915, xe
+ * Functionality: kms_core, plane
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ */
+
 #ifndef DRM_CAP_CURSOR_WIDTH
 #define DRM_CAP_CURSOR_WIDTH 0x8
 #endif
@@ -302,15 +390,6 @@ static uint32_t plane_get_igt_format(igt_plane_t *plane)
 	return 0;
 }
 
-/**
- * SUBTEST: plane-primary-overlay-mutable-zpos
- * Description: Verify that the overlay plane can cover the primary one (and
- *              vice versa) by changing their zpos property.
- * Driver requirement: i915, xe
- * Functionality: kms_core, plane
- * Mega feature: General Display Features
- * Test category: functionality test
- */
 static void
 plane_primary_overlay_mutable_zpos(data_t *data, igt_output_t *output, igt_plane_t *overlay,
 				   uint32_t format_primary, uint32_t format_overlay)
@@ -392,15 +471,6 @@ plane_primary_overlay_mutable_zpos(data_t *data, igt_output_t *output, igt_plane
 	igt_assert_eq_u64(igt_plane_get_prop(overlay, IGT_PLANE_ZPOS), 1);
 }
 
-/**
- * SUBTEST: plane-immutable-zpos
- * Description: Verify the reported zpos property of planes by making sure only
- *              higher zpos planes cover the lower zpos ones.
- * Driver requirement: i915, xe
- * Functionality: kms_core, plane
- * Mega feature: General Display Features
- * Test category: functionality test
- */
 static void
 plane_immutable_zpos(data_t *data, igt_output_t *output, enum pipe pipe, int n_planes)
 {
@@ -530,21 +600,6 @@ plane_immutable_zpos(data_t *data, igt_output_t *output, enum pipe pipe, int n_p
 	igt_remove_fb(data->drm_fd, &fb_upper);
 }
 
-/**
- * SUBTEST: plane-%s-legacy
- * Description: Test for KMS atomic modesetting on %arg[1] and ensure coherency
- *              between legacy and atomic interfaces.
- * Driver requirement: i915, xe
- * Functionality: kms_core, plane
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @cursor:         Cursor plane
- * @overlay:        Overlay plane
- * @primary:        Primary plane
- */
 static void plane_overlay(data_t *data, igt_output_t *output, igt_plane_t *plane,
 			  uint32_t format)
 {
@@ -631,16 +686,6 @@ static void plane_primary(data_t *data)
 	plane_commit(data->primary, COMMIT_UNIVERSAL, ATOMIC_RELAX_NONE);
 }
 
-/**
- * SUBTEST: test-only
- * Description: Test to ensure that DRM_MODE_ATOMIC_TEST_ONLY really only touches
- *              the free-standing state objects and nothing else.
- * Driver requirement: i915, xe
- * Functionality: kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
- */
-
 /*
  * Test to ensure that DRM_MODE_ATOMIC_TEST_ONLY really only touches the
  * free-standing state objects and nothing else.
@@ -749,19 +794,6 @@ static void plane_cursor(data_t *data, igt_output_t *output, igt_plane_t *cursor
 	plane_commit(cursor, COMMIT_LEGACY, ATOMIC_RELAX_NONE);
 }
 
-/**
- * SUBTEST: plane-invalid-%s
- * Description: Test error handling when invalid %arg[1] are passed
- * Driver requirement: i915, xe
- * Functionality: kms_core, plane
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @params:           plane parameters
- * @params-fence:     plane fence parameters
- */
 static void plane_invalid_params(data_t *data, igt_output_t *output)
 {
 	struct igt_fb fb2;
@@ -846,19 +878,6 @@ static void plane_invalid_params_fence(data_t *data, igt_output_t *output)
 	close(timeline);
 }
 
-/**
- * SUBTEST: crtc-invalid-%s
- * Description: Test error handling when invalid %arg[1] are passed
- * Driver requirement: i915, xe
- * Functionality: kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @params:           crtc parameters
- * @params-fence:     crtc fence parameters
- */
 static void crtc_invalid_params(data_t *data, igt_output_t *output)
 {
 	uint64_t old_mode_id = data->pipe->values[IGT_CRTC_MODE_ID];
@@ -999,17 +1018,6 @@ static void crtc_invalid_params_fence(data_t *data, igt_output_t *output)
 	igt_assert(data->pipe->out_fence_fd != -1);
 }
 
-/**
- * SUBTEST: atomic-invalid-params
- * Description: Test abuse the atomic ioctl directly in order to test various
- *              invalid conditions which the libdrm wrapper won't allow us to
- *              create.
- * Driver requirement: i915, xe
- * Functionality: kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
- */
-
 /*
  * Abuse the atomic ioctl directly in order to test various invalid conditions,
  * which the libdrm wrapper won't allow us to create.
@@ -1148,14 +1156,6 @@ static void atomic_invalid_params(data_t *data, igt_output_t *output)
 	do_ioctl_err(data->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, EFAULT);
 }
 
-/**
- * SUBTEST: atomic-plane-damage
- * Description: Simple test cases to use FB_DAMAGE_CLIPS plane property
- * Driver requirement: i915, xe
- * Functionality: kms_core, plane
- * Mega feature: General Display Features
- * Test category: functionality test
- */
 static void atomic_plane_damage(data_t *data)
 {
 	struct drm_mode_rect damage[2];
diff --git a/tests/kms_atomic_interruptible.c b/tests/kms_atomic_interruptible.c
index c86db7149..7419e0746 100644
--- a/tests/kms_atomic_interruptible.c
+++ b/tests/kms_atomic_interruptible.c
@@ -26,59 +26,13 @@
  * Category: Display
  * Description: Tests that interrupt various atomic ioctls.
  */
+
 #include <signal.h>
 
 #include "igt.h"
 #include "drmtest.h"
 #include "sw_sync.h"
 
-IGT_TEST_DESCRIPTION("Tests that interrupt various atomic ioctls.");
-
-enum plane_test_type
-{
-	test_legacy_modeset,
-	test_atomic_modeset,
-	test_legacy_dpms,
-	test_setplane,
-	test_setcursor,
-	test_pageflip
-};
-
-static int block_plane(igt_display_t *display, igt_output_t *output, enum plane_test_type test_type, igt_plane_t *plane)
-{
-	int timeline = sw_sync_timeline_create();
-
-	igt_fork(child, 1) {
-		/* Ignore the signal helper, we need to block indefinitely on the fence. */
-		signal(SIGCONT, SIG_IGN);
-
-		if (test_type == test_legacy_modeset || test_type == test_atomic_modeset) {
-			igt_output_set_pipe(output, PIPE_NONE);
-		}
-		igt_plane_set_fence_fd(plane, sw_sync_timeline_create_fence(timeline, 1));
-
-		igt_display_commit2(display, COMMIT_ATOMIC);
-	}
-
-	return timeline;
-}
-
-static void unblock(int block)
-{
-	sw_sync_timeline_inc(block, 1);
-	close(block);
-}
-
-static void ev_page_flip(int fd, unsigned seq, unsigned tv_sec, unsigned tv_usec, void *user_data)
-{
-	igt_debug("Retrieved vblank seq: %u on unk\n", seq);
-}
-
-static drmEventContext drm_events = {
-	.version = 2,
-	.page_flip_handler = ev_page_flip
-};
-
 /**
  * SUBTEST: %s-setmode
  * Description: Tests the interrupt properties of %arg[1] modeset
@@ -114,9 +68,7 @@ static drmEventContext drm_events = {
  * Functionality: kms_core
  * Mega feature: General Display Features
  * Test category: functionality test
- */
-
-/**
+ *
  * SUBTEST: universal-setplane-%s
  * Description: Tests the interrupt properties for %arg[1]
  * Driver requirement: i915, xe
@@ -129,6 +81,54 @@ static drmEventContext drm_events = {
  * @cursor:         Cursor plane
  * @primary:        Primary plane
  */
+
+IGT_TEST_DESCRIPTION("Tests that interrupt various atomic ioctls.");
+
+enum plane_test_type
+{
+	test_legacy_modeset,
+	test_atomic_modeset,
+	test_legacy_dpms,
+	test_setplane,
+	test_setcursor,
+	test_pageflip
+};
+
+static int block_plane(igt_display_t *display, igt_output_t *output, enum plane_test_type test_type, igt_plane_t *plane)
+{
+	int timeline = sw_sync_timeline_create();
+
+	igt_fork(child, 1) {
+		/* Ignore the signal helper, we need to block indefinitely on the fence. */
+		signal(SIGCONT, SIG_IGN);
+
+		if (test_type == test_legacy_modeset || test_type == test_atomic_modeset) {
+			igt_output_set_pipe(output, PIPE_NONE);
+		}
+		igt_plane_set_fence_fd(plane, sw_sync_timeline_create_fence(timeline, 1));
+
+		igt_display_commit2(display, COMMIT_ATOMIC);
+	}
+
+	return timeline;
+}
+
+static void unblock(int block)
+{
+	sw_sync_timeline_inc(block, 1);
+	close(block);
+}
+
+static void ev_page_flip(int fd, unsigned seq, unsigned tv_sec, unsigned tv_usec, void *user_data)
+{
+	igt_debug("Retrieved vblank seq: %u on unk\n", seq);
+}
+
+static drmEventContext drm_events = {
+	.version = 2,
+	.page_flip_handler = ev_page_flip
+};
+
 static void run_plane_test(igt_display_t *display, enum pipe pipe, igt_output_t *output,
 			   enum plane_test_type test_type, unsigned plane_type)
 {
diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index 1ec96ce5e..b8053acf7 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -25,6 +25,7 @@
  * TEST: kms atomic transition
  * Category: Display
  */
+
 #include "igt.h"
 #include "igt_rand.h"
 #include "drmtest.h"
@@ -37,6 +38,95 @@
 #include <time.h>
 #include <poll.h>
 
+/**
+ * SUBTEST: plane-primary-toggle-with-vblank-wait
+ * Description: Check toggling of primary plane with vblank
+ * Driver requirement: i915, xe
+ * Functionality: plane, vblank, watermark
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: plane-all-modeset-%s
+ * Description: Modeset test for all plane combinations %arg[1]
+ * Driver requirement: i915, xe
+ * Functionality: plane, watermark
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @transition:                           default
+ * @transition-fencing:                   with fencing commit
+ */
+
+/**
+ * SUBTEST: plane-all-modeset-%s
+ * Description: Modeset test for all plane combinations %arg[1]
+ * Driver requirement: i915, xe
+ * Functionality: plane, watermark
+ * Mega feature: eDP
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @transition-fencing-internal-panels:   on internal panels with fencing commit
+ * @transition-internal-panels:           on internal panels
+ */
+
+/**
+ * SUBTEST: plane-all-%s
+ * Description: Transition test for all plane combinations %arg[1]
+ * Driver requirement: i915, xe
+ * Functionality: plane, watermark
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @transition:                           default
+ * @transition-fencing:                   with fencing commit
+ * @transition-nonblocking:               with non-blocking commit
+ * @transition-nonblocking-fencing:       with non-blocking & fencing commit
+ */
+
+/**
+ * SUBTEST: plane-toggle-modeset-transition
+ * Description: Check toggling and modeset transition on plane
+ * Driver requirement: i915, xe
+ * Functionality: plane, watermark
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: plane-use-after-nonblocking-%s
+ * Description: Transition test with non %arg[1] and make sure commit of disabled
+ *              plane has to complete before atomic commit on that plane
+ * Driver requirement: i915, xe
+ * Functionality: plane, watermark
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @unbind:           blocking commit
+ * @unbind-fencing:   blocking commit with fencing
+ */
+
+/**
+ * SUBTEST: modeset-%s
+ * Description: Modeset transition tests for combinations of %arg[1]
+ * Driver requirement: i915, xe
+ * Functionality: plane, watermark
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @transition:                     crtc enabled
+ * @transition-fencing:             crtc enabled with fencing commit
+ * @transition-nonblocking:         crtc enabled with nonblocking commit
+ * @transition-nonblocking-fencing: crtc enabled with nonblocking & fencing commit
+ */
+
 #ifndef DRM_CAP_CURSOR_WIDTH
 #define DRM_CAP_CURSOR_WIDTH 0x8
 #endif
@@ -62,14 +152,6 @@ int *timeline;
 pthread_t *thread;
 int *seqno;
 
-/**
- * SUBTEST: plane-primary-toggle-with-vblank-wait
- * Description: Check toggling of primary plane with vblank
- * Driver requirement: i915, xe
- * Functionality: plane, vblank, watermark
- * Mega feature: General Display Features
- * Test category: functionality test
- */
 static void
 run_primary_test(data_t *data, enum pipe pipe, igt_output_t *output)
 {
@@ -482,72 +564,6 @@ static void wait_for_transition(data_t *data, enum pipe pipe, bool nonblocking,
 	}
 }
 
-/**
- * SUBTEST: plane-all-modeset-%s
- * Description: Modeset test for all plane combinations %arg[1]
- * Driver requirement: i915, xe
- * Functionality: plane, watermark
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @transition:                           default
- * @transition-fencing:                   with fencing commit
- */
-
-/**
- * SUBTEST: plane-all-modeset-%s
- * Description: Modeset test for all plane combinations %arg[1]
- * Driver requirement: i915, xe
- * Functionality: plane, watermark
- * Mega feature: eDP
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @transition-fencing-internal-panels:   on internal panels with fencing commit
- * @transition-internal-panels:           on internal panels
- */
-
-/**
- * SUBTEST: plane-all-%s
- * Description: Transition test for all plane combinations %arg[1]
- * Driver requirement: i915, xe
- * Functionality: plane, watermark
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @transition:                           default
- * @transition-fencing:                   with fencing commit
- * @transition-nonblocking:               with non-blocking commit
- * @transition-nonblocking-fencing:       with non-blocking & fencing commit
- */
-
-/**
- * SUBTEST: plane-toggle-modeset-transition
- * Description: Check toggling and modeset transition on plane
- * Driver requirement: i915, xe
- * Functionality: plane, watermark
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: plane-use-after-nonblocking-%s
- * Description: Transition test with non %arg[1] and make sure commit of disabled
- *              plane has to complete before atomic commit on that plane
- * Driver requirement: i915, xe
- * Functionality: plane, watermark
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @unbind:           blocking commit
- * @unbind-fencing:   blocking commit with fencing
- */
-
 /*
  * 1. Set primary plane to a known fb.
  * 2. Make sure getcrtc returns the correct fb id.
@@ -1041,21 +1057,6 @@ retry:
 	}
 }
 
-/**
- * SUBTEST: modeset-%s
- * Description: Modeset transition tests for combinations of %arg[1]
- * Driver requirement: i915, xe
- * Functionality: plane, watermark
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @transition:                     crtc enabled
- * @transition-fencing:             crtc enabled with fencing commit
- * @transition-nonblocking:         crtc enabled with nonblocking commit
- * @transition-nonblocking-fencing: crtc enabled with nonblocking & fencing commit
- */
 static void run_modeset_transition(data_t *data, int requested_outputs, bool nonblocking, bool fencing)
 {
 	igt_output_t *outputs[IGT_MAX_PIPES] = {};
diff --git a/tests/kms_bw.c b/tests/kms_bw.c
index 896114a3a..0199b5675 100644
--- a/tests/kms_bw.c
+++ b/tests/kms_bw.c
@@ -20,16 +20,19 @@
  * OTHER DEALINGS IN THE SOFTWARE.
  */
 
+/**
+ * TEST: kms bw
+ * Category: Display
+ * Description: BW test with different resolutions
+ */
+
 #include "drm_mode.h"
 #include "igt.h"
 #include "drm.h"
 #include <stdio.h>
 #include <xf86drmMode.h>
+
 /**
- * TEST: kms bw
- * Category: Display
- * Description: BW test with different resolutions
- *
  * SUBTEST: linear-tiling-%d-displays-%s
  * Description: bw test with %arg[2]
  * Driver requirement: i915, xe
diff --git a/tests/kms_color.c b/tests/kms_color.c
index f59feabd4..119dfc1f4 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -27,9 +27,8 @@
  * Category: Display
  * Description: Test Color Features at Pipe level
  */
-#include "kms_color_helper.h"
 
-IGT_TEST_DESCRIPTION("Test Color Features at Pipe level");
+#include "kms_color_helper.h"
 
 /**
  * SUBTEST: degamma
@@ -38,7 +37,73 @@ IGT_TEST_DESCRIPTION("Test Color Features at Pipe level");
  * Functionality: colorspace
  * Mega feature: Color mgmt
  * Test category: functionality test
+ *
+ * SUBTEST: gamma
+ * Description: Verify that gamma LUT transformation works correctly
+ * Driver requirement: i915, xe
+ * Functionality: colorspace
+ * Mega feature: Color mgmt
+ * Test category: functionality test
+ *
+ * SUBTEST: legacy-gamma
+ * Description: Verify that legacy gamma LUT transformation works correctly
+ * Driver requirement: i915, xe
+ * Functionality: colorspace
+ * Mega feature: Color mgmt
+ * Test category: functionality test
+ *
+ * SUBTEST: legacy-gamma-reset
+ * Description: Verify that setting the legacy gamma LUT resets the gamma LUT
+ *              set through GAMMA_LUT property
+ * Driver requirement: i915, xe
+ * Functionality: colorspace
+ * Mega feature: Color mgmt
+ * Test category: functionality test
+ *
+ * SUBTEST: ctm-%s
+ * Description: Check the color transformation %arg[1]
+ * Driver requirement: i915, xe
+ * Functionality: colorspace
+ * Mega feature: Color mgmt
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @0-25:           for 0.25 transparency
+ * @0-50:           for 0.50 transparency
+ * @0-75:           for 0.75 transparency
+ * @blue-to-red:    from blue to red
+ * @green-to-red:   from green to red
+ * @max:            for maximum transparency
+ * @negative:       for negative transparency
+ * @red-to-blue:    from red to blue
+ * @signed:         for correct signed handling
+ */
+
+/**
+ * SUBTEST: deep-color
+ * Description: Verify that deep color works correctly
+ * Driver requirement: i915, xe
+ * Functionality: colorspace
+ * Mega feature: Color mgmt
+ * Test category: functionality test
+ *
+ * SUBTEST: invalid-%s-sizes
+ * Description: Negative check for %arg[1] sizes
+ * Driver requirement: i915, xe
+ * Functionality: colorspace
+ * Mega feature: Color mgmt
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @ctm-matrix:         Color transformation matrix
+ * @degamma-lut:        Degamma LUT
+ * @gamma-lut:          Gamma LUT
  */
+
+IGT_TEST_DESCRIPTION("Test Color Features at Pipe level");
+
 static bool test_pipe_degamma(data_t *data,
 			      igt_plane_t *primary)
 {
@@ -127,15 +192,6 @@ static bool test_pipe_degamma(data_t *data,
 	return ret;
 }
 
-/**
- * SUBTEST: gamma
- * Description: Verify that gamma LUT transformation works correctly
- * Driver requirement: i915, xe
- * Functionality: colorspace
- * Mega feature: Color mgmt
- * Test category: functionality test
- */
-
 /*
  * Draw 3 gradient rectangles in red, green and blue, with a maxed out gamma
  * LUT and verify we have the same CRC as drawing solid color rectangles.
@@ -224,15 +280,6 @@ static bool test_pipe_gamma(data_t *data,
 	return ret;
 }
 
-/**
- * SUBTEST: legacy-gamma
- * Description: Verify that legacy gamma LUT transformation works correctly
- * Driver requirement: i915, xe
- * Functionality: colorspace
- * Mega feature: Color mgmt
- * Test category: functionality test
- */
-
 /*
  * Draw 3 gradient rectangles in red, green and blue, with a maxed out legacy
  * gamma LUT and verify we have the same CRC as drawing solid color rectangles
@@ -345,16 +392,6 @@ static bool test_pipe_legacy_gamma(data_t *data,
 	return ret;
 }
 
-/**
- * SUBTEST: legacy-gamma-reset
- * Description: Verify that setting the legacy gamma LUT resets the gamma LUT
- *              set through GAMMA_LUT property
- * Driver requirement: i915, xe
- * Functionality: colorspace
- * Mega feature: Color mgmt
- * Test category: functionality test
- */
-
 /*
  * Verify that setting the legacy gamma LUT resets the gamma LUT set
  * through the GAMMA_LUT property.
@@ -489,27 +526,6 @@ end:
 	return ret;
 }
 
-/**
- * SUBTEST: ctm-%s
- * Description: Check the color transformation %arg[1]
- * Driver requirement: i915, xe
- * Functionality: colorspace
- * Mega feature: Color mgmt
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @0-25:           for 0.25 transparency
- * @0-50:           for 0.50 transparency
- * @0-75:           for 0.75 transparency
- * @blue-to-red:    from blue to red
- * @green-to-red:   from green to red
- * @max:            for maximum transparency
- * @negative:       for negative transparency
- * @red-to-blue:    from red to blue
- * @signed:         for correct signed handling
- */
-
 /*
  * Draw 3 rectangles using before colors with the ctm matrix apply and verify
  * the CRC is equal to using after colors with an identify ctm matrix.
@@ -869,14 +885,6 @@ out:
 	test_cleanup(data);
 }
 
-/**
- * SUBTEST: deep-color
- * Description: Verify that deep color works correctly
- * Driver requirement: i915, xe
- * Functionality: colorspace
- * Mega feature: Color mgmt
- * Test category: functionality test
- */
 static void
 run_deep_color_tests_for_pipe(data_t *data, enum pipe p)
 {
@@ -978,20 +986,6 @@ run_deep_color_tests_for_pipe(data_t *data, enum pipe p)
 	test_cleanup(data);
 }
 
-/**
- * SUBTEST: invalid-%s-sizes
- * Description: Negative check for %arg[1] sizes
- * Driver requirement: i915, xe
- * Functionality: colorspace
- * Mega feature: Color mgmt
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @ctm-matrix:         Color transformation matrix
- * @degamma-lut:        Degamma LUT
- * @gamma-lut:          Gamma LUT
- */
 static void
 run_invalid_tests_for_pipe(data_t *data)
 {
diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
index d1a83d14e..ce0261287 100644
--- a/tests/kms_concurrent.c
+++ b/tests/kms_concurrent.c
@@ -22,14 +22,17 @@
  *
  */
 
-#include "igt.h"
-#include "drmtest.h"
 /**
  * TEST: kms concurrent
  * Category: Display
  * Description: Test atomic mode setting concurrently with multiple planes and
  *              screen resolution
- *
+ */
+
+#include "igt.h"
+#include "drmtest.h"
+
+/**
  * SUBTEST: multi-plane-atomic-lowres
  * Description: Test atomic mode setting concurrently with multiple planes and
  *              screen resolution.
diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 9a0583d96..988f370f9 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -27,6 +27,7 @@
  * Category: Display
  * Description: Test content protection (HDCP)
  */
+
 #include <poll.h>
 #include <fcntl.h>
 #include <sys/epoll.h>
@@ -37,6 +38,77 @@
 #include "igt_kms.h"
 #include "igt_kmod.h"
 
+/**
+ * SUBTEST: lic
+ * Description: Test for the integrity of link.
+ * Driver requirement: i915, xe
+ * Functionality: hdcp1.4
+ * Mega feature: HDCP
+ * Test category: functionality test
+ *
+ * SUBTEST: content-type-change
+ * Description: Test the content type change when the content protection already
+ *              enabled
+ * Driver requirement: i915, xe
+ * Functionality: hdcp1.4, hdcp2.2
+ * Mega feature: HDCP
+ * Test category: functionality test
+ *
+ * SUBTEST: mei-interface
+ * Description: Test the teardown and rebuild of the interface between Intel
+ *              and mei hdcp.
+ * Driver requirement: i915, xe
+ * Functionality: hdcp1.4, hdcp2.2
+ * Mega feature: HDCP
+ * Test category: functionality test
+ *
+ * SUBTEST: srm
+ * Description: This test writes the facsimile SRM into the /lib/firmware/ and
+ *              check the kernel parsing of it by invoking the hdcp authentication.
+ * Driver requirement: i915, xe
+ * Functionality: hdcp1.4
+ * Mega feature: HDCP
+ * Test category: functionality test
+ *
+ * SUBTEST: uevent
+ * Description: Test to detect the HDCP status change when we are reading the
+ *              uevent sent with the corresponding connector id and property id.
+ * Driver requirement: i915, xe
+ * Functionality: hdcp1.4
+ * Mega feature: HDCP
+ * Test category: functionality test
+ *
+ * SUBTEST: %s
+ * Description: Test content protection with %arg[1]
+ * Driver requirement: i915, xe
+ * Functionality: hdcp1.4
+ * Mega feature: HDCP
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @atomic:         atomic modesetting
+ * @atomic-dpms:    DPMS ON/OFF during atomic modesetting.
+ * @legacy:         legacy style commit
+ * @type1:          content type 1 that can be handled only through HDCP2.2.
+ */
+
+/**
+ * SUBTEST: dp-mst-%s
+ * Description: Test Content protection %arg[1] over DP MST.
+ * Driver requirement: i915, xe
+ * Functionality: hdcp1.4, mst
+ * Mega feature: HDCP
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @lic-type-0:   Type 0 with LIC
+ * @lic-type-1:   Type 1 with LIC.
+ * @type-0:       Type 0
+ * @type-1:       Type 1
+ */
+
 IGT_TEST_DESCRIPTION("Test content protection (HDCP)");
 
 struct data {
@@ -490,60 +562,6 @@ test_fini(igt_output_t *output, enum igt_commit_style s)
 	igt_display_commit2(&data.display, s);
 }
 
-/**
- * SUBTEST: lic
- * Description: Test for the integrity of link.
- * Driver requirement: i915, xe
- * Functionality: hdcp1.4
- * Mega feature: HDCP
- * Test category: functionality test
- *
- * SUBTEST: content-type-change
- * Description: Test the content type change when the content protection already
- *              enabled
- * Driver requirement: i915, xe
- * Functionality: hdcp1.4, hdcp2.2
- * Mega feature: HDCP
- * Test category: functionality test
- *
- * SUBTEST: mei-interface
- * Description: Test the teardown and rebuild of the interface between Intel
- *              and mei hdcp.
- * Driver requirement: i915, xe
- * Functionality: hdcp1.4, hdcp2.2
- * Mega feature: HDCP
- * Test category: functionality test
- *
- * SUBTEST: srm
- * Description: This test writes the facsimile SRM into the /lib/firmware/ and
- *              check the kernel parsing of it by invoking the hdcp authentication.
- * Driver requirement: i915, xe
- * Functionality: hdcp1.4
- * Mega feature: HDCP
- * Test category: functionality test
- *
- * SUBTEST: uevent
- * Description: Test to detect the HDCP status change when we are reading the
- *              uevent sent with the corresponding connector id and property id.
- * Driver requirement: i915, xe
- * Functionality: hdcp1.4
- * Mega feature: HDCP
- * Test category: functionality test
- *
- * SUBTEST: %s
- * Description: Test content protection with %arg[1]
- * Driver requirement: i915, xe
- * Functionality: hdcp1.4
- * Mega feature: HDCP
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @atomic:         atomic modesetting
- * @atomic-dpms:    DPMS ON/OFF during atomic modesetting.
- * @legacy:         legacy style commit
- * @type1:          content type 1 that can be handled only through HDCP2.2.
- */
 static void
 test_content_protection(enum igt_commit_style s, int content_type)
 {
@@ -631,21 +649,6 @@ static void test_cp_lic_on_mst(igt_output_t *mst_outputs[], int valid_outputs, b
 	}
 }
 
-/**
- * SUBTEST: dp-mst-%s
- * Description: Test Content protection %arg[1] over DP MST.
- * Driver requirement: i915, xe
- * Functionality: hdcp1.4, mst
- * Mega feature: HDCP
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @lic-type-0:   Type 0 with LIC
- * @lic-type-1:   Type 1 with LIC.
- * @type-0:       Type 0
- * @type-1:       Type 1
- */
 static void
 test_content_protection_mst(int content_type)
 {
diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index d2f10356b..3d1c3bcd3 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -22,13 +22,6 @@
  *
  */
 
-#include "igt.h"
-#include <errno.h>
-#include <limits.h>
-#include <stdbool.h>
-#include <stdio.h>
-#include <string.h>
-
 /**
  * TEST: kms cursor crc
  * Category: Display
@@ -42,6 +35,77 @@
  *              software.
  */
 
+#include "igt.h"
+#include <errno.h>
+#include <limits.h>
+#include <stdbool.h>
+#include <stdio.h>
+#include <string.h>
+
+/**
+ * SUBTEST: cursor-dpms
+ * Description: Check random placement of a cursor with DPMS.
+ * Driver requirement: i915, xe
+ * Functionality: cursor, dpms
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: cursor-suspend
+ * Description: Check random placement of a cursor with suspend.
+ * Driver requirement: i915, xe
+ * Functionality: cursor, suspend
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: cursor-%s
+ * Description: %arg[1]
+ * Driver requirement: i915, xe
+ * Functionality: cursor
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @alpha-opaque:       Validates the composition of a fully opaque cursor plane,
+ *                      i.e., alpha channel equal to 1.0.
+ * @alpha-transparent:  Validates the composition of a fully transparent cursor
+ *                      plane, i.e., alpha channel equal to 0.0.
+ * @size-change:        Create a maximum size cursor, then change the size in
+ *                      flight to smaller ones to see that the size is applied
+ *                      correctly.
+ */
+
+/**
+ * SUBTEST: cursor-%s-%s
+ * Description: Check if a %arg[2] cursor is %arg[1].
+ * Driver requirement: i915, xe
+ * Functionality: cursor
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @offscreen:             well-positioned outside the screen
+ * @onscreen:              well-positioned inside the screen
+ * @random:                randomly placed
+ * @rapid-movement:        rapidly udates for movements
+ * @sliding:               smooth for horizontal, vertical & diagonal movements
+ *
+ * arg[2]:
+ *
+ * @128x128:               128x128 size
+ * @128x42:                128x42 size
+ * @256x256:               256x256 size
+ * @256x85:                256x85 size
+ * @32x10:                 32x10 size
+ * @32x32:                 32x32 size
+ * @512x170:               512x170 size
+ * @512x512:               512x512 size
+ * @64x21:                 64x21 size
+ * @64x64:                 64x64 size
+ * @max-size:              Max supported size
+ */
+
 IGT_TEST_DESCRIPTION(
    "Use the display CRC support to validate cursor plane functionality. "
    "The test will position the cursor plane either fully onscreen, "
@@ -667,38 +731,6 @@ static bool require_cursor_size(data_t *data, int w, int h)
 	return !!ret;
 }
 
-/**
- * SUBTEST: cursor-dpms
- * Description: Check random placement of a cursor with DPMS.
- * Driver requirement: i915, xe
- * Functionality: cursor, dpms
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: cursor-suspend
- * Description: Check random placement of a cursor with suspend.
- * Driver requirement: i915, xe
- * Functionality: cursor, suspend
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: cursor-%s
- * Description: %arg[1]
- * Driver requirement: i915, xe
- * Functionality: cursor
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @alpha-opaque:       Validates the composition of a fully opaque cursor plane,
- *                      i.e., alpha channel equal to 1.0.
- * @alpha-transparent:  Validates the composition of a fully transparent cursor
- *                      plane, i.e., alpha channel equal to 0.0.
- * @size-change:        Create a maximum size cursor, then change the size in
- *                      flight to smaller ones to see that the size is applied
- *                      correctly.
- */
 static void run_test(data_t *data, void (*testfunc)(data_t *), int cursor_w, int cursor_h)
 {
 	prepare_crtc(data, cursor_w, cursor_h);
@@ -795,37 +827,6 @@ static bool execution_constraint(enum pipe pipe)
 	return false;
 }
 
-
-/**
- * SUBTEST: cursor-%s-%s
- * Description: Check if a %arg[2] cursor is %arg[1].
- * Driver requirement: i915, xe
- * Functionality: cursor
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @offscreen:             well-positioned outside the screen
- * @onscreen:              well-positioned inside the screen
- * @random:                randomly placed
- * @rapid-movement:        rapidly udates for movements
- * @sliding:               smooth for horizontal, vertical & diagonal movements
- *
- * arg[2]:
- *
- * @128x128:               128x128 size
- * @128x42:                128x42 size
- * @256x256:               256x256 size
- * @256x85:                256x85 size
- * @32x10:                 32x10 size
- * @32x32:                 32x32 size
- * @512x170:               512x170 size
- * @512x512:               512x512 size
- * @64x21:                 64x21 size
- * @64x64:                 64x64 size
- * @max-size:              Max supported size
- */
 static void run_size_tests(data_t *data, int w, int h)
 {
 	enum pipe pipe;
diff --git a/tests/kms_cursor_edge_walk.c b/tests/kms_cursor_edge_walk.c
index e284fc4d8..d9d140409 100644
--- a/tests/kms_cursor_edge_walk.c
+++ b/tests/kms_cursor_edge_walk.c
@@ -22,18 +22,21 @@
  *
  */
 
+/**
+ * TEST: kms cursor edge walk
+ * Category: Display
+ * Description: Exercise CHV pipe C cursor fail
+ * Description: Test to check different cursor sizes by walking different edges of screen
+ */
+
 #include "igt.h"
 #include <errno.h>
 #include <limits.h>
 #include <stdbool.h>
 #include <stdio.h>
 #include <string.h>
+
 /**
- * TEST: kms cursor edge walk
- * Category: Display
- * Description: Exercise CHV pipe C cursor fail
- * Description: Test to check different cursor sizes by walking different edges of screen
- *
  * SUBTEST: %s-%s
  * Description: Checking cursor size %arg[1] by walking %arg[2] of screen
  * Driver requirement: i915, xe
diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index d0d752e5e..6a4955ef1 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -37,6 +37,256 @@
 #include "igt_rand.h"
 #include "igt_stats.h"
 
+/**
+ * SUBTEST: %s-%s
+ * Description: Test checks how many cursor updates we can fit between vblanks
+ *              on single/all pipes with different modes, priority and number
+ *              of processes
+ * Driver requirement: i915, xe
+ * Functionality: cursor
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @single:      Single
+ * @torture:     Torture
+ * @forked:      Forked
+ *
+ * arg[2]:
+ *
+ * @bo:          BO
+ * @move:        Move
+ */
+
+/**
+ * SUBTEST: basic-busy-flip-before-cursor-%s
+ * Description: Cursor test with %arg[1] mode
+ * Driver requirement: i915, xe
+ * Test category: functionality test
+ * Functionality: cursor
+ * Mega feature: General Display Features
+ *
+ * SUBTEST: basic-busy-flip-before-cursor-varying-size
+ * Description: Change the size of cursor b/w 64*64 to maxw x maxh.
+ * Driver requirement: i915, xe
+ * Functionality: cursor
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @atomic:	atomic
+ * @legacy:	legacy
+ */
+
+/**
+ * SUBTEST: basic-flip-after-cursor-%s
+ * Description: Cursor test with %arg[1]
+ * Driver requirement: i915, xe
+ * Test category: functionality test
+ * Functionality: cursor
+ * Mega feature: General Display Features
+ *
+ * SUBTEST: basic-flip-before-cursor-%s
+ * Description: Cursor test with %arg[1]
+ * Driver requirement: i915, xe
+ * Test category: functionality test
+ * Functionality: cursor
+ * Mega feature: General Display Features
+ *
+ * arg[1]:
+ *
+ * @atomic:        atomic mode
+ * @legacy:        legacy mode
+ * @varying-size:  varying size
+ */
+
+/**
+ * SUBTEST: %s-flip-before-cursor-%s
+ * Description: Adds variety of tests:
+ *		- varying-size: change the size of cursor b/w 64*64 to maxw x maxh.\n
+ *		- atomic-transition: alternates between a full screen sprite plane
+ *		                     and full screen primary plane.\n"
+ *		- toggle: which toggles cursor visibility and make sure cursor moves
+ *		          between updates.
+ * Driver requirement: i915, xe
+ * Functionality: cursor
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @short:
+ * @short-busy:
+ *
+ * arg[2]:
+ *
+ * @atomic-transitions:
+ * @atomic-transitions-varying-size:
+ * @toggle:
+ */
+
+/**
+ * SUBTEST: short-flip-after-cursor-%s
+ * Description: Adds variety of tests:
+ *		- varying-size: change the size of cursor b/w 64*64 to maxw x maxh.\n
+ *		- atomic-transition: alternates between a full screen sprite plane
+ *		                     and full screen primary plane.\n"
+ *		- toggle: which toggles cursor visibility and make sure cursor moves
+ *		          between updates.
+ * Driver requirement: i915, xe
+ * Functionality: cursor
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @atomic-transitions:
+ * @atomic-transitions-varying-size:
+ * @toggle:
+ */
+
+/**
+ * SUBTEST: long-nonblocking-modeset-vs-cursor-atomic
+ * Description: Test checks how many cursor updates we can fit between vblanks
+ *              on all pipes with different modes, priority and number of processes
+ * Driver requirement: i915, xe
+ * Functionality: cursor
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: nonblocking-modeset-vs-cursor-atomic
+ * Description: Test checks how many cursor updates we can fit between vblanks
+ *              on all pipes with different modes, priority and number of processes
+ * Driver requirement: i915, xe
+ * Functionality: cursor
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: 2x-%s-%s
+ * Description: This test executes flips on both CRTCs while running cursor
+ *              updates in parallel
+ * Driver requirement: i915, xe
+ * Functionality: cursor
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @flip-vs-cursor:
+ * @flip-vs-cursor:
+ * @long-flip-vs-cursor:
+ * @long-flip-vs-cursor:
+ *
+ * arg[2]:
+ *
+ * @atomic:
+ * @legacy:
+ */
+
+/**
+ * SUBTEST: 2x-%s-atomic
+ * Description: This test executes flips on both CRTCs while running cursor
+ *              updates in parallel
+ * Driver requirement: i915, xe
+ * Functionality: cursor
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @long-nonblocking-modeset-vs-cursor:
+ * @nonblocking-modeset-vs-cursor:
+ */
+
+/**
+ * SUBTEST: %s-%s
+ * Description: The essence of the basic test is that neither the cursor nor the
+ *              nonblocking flip stall the application of the next
+ * Driver requirement: i915, xe
+ * Functionality: cursor
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @cursor-vs-flip:
+ * @cursorA-vs-flipA:
+ * @cursorA-vs-flipB:
+ * @cursorB-vs-flipA:
+ * @cursorB-vs-flipB:
+ * @flip-vs-cursor:
+ *
+ * arg[2]:
+ *
+ * @atomic:
+ * @atomic-transitions:
+ * @atomic-transitions-varying-size:
+ * @legacy:
+ * @toggle:
+ * @varying-size:
+ */
+
+/**
+ * SUBTEST: 2x-%s-%s
+ * Description: This test executes flips on both CRTCs while running cursor updates in parallel
+ * Driver requirement: i915, xe
+ * Functionality: cursor
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @cursor-vs-flip:
+ * @cursor-vs-flip:
+ * @long-cursor-vs-flip:
+ * @long-cursor-vs-flip:
+ *
+ * arg[2]:
+ *
+ * @atomic:
+ * @legacy:
+ */
+
+/**
+ * SUBTEST: flip-vs-cursor-crc-%s
+ * Description: this test perform a page flip followed by a cursor update
+ * Driver requirement: i915, xe
+ * Functionality: cursor
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @atomic:
+ * @legacy:
+ */
+
+/**
+ * SUBTEST: flip-vs-cursor-busy-crc-%s
+ * Description: this test perform a busy bo update followed by a cursor update
+ * Driver requirement: i915, xe
+ * Functionality: cursor
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @atomic:
+ * @legacy:
+ */
+
+/**
+ * SUBTEST: modeset-atomic-cursor-hotspot
+ * Description: Test changes the cursor hotspot and checks that the property is
+ *              updated accordignly
+ * Driver requirement: i915, xe
+ * Functionality: cursor
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ */
+
 #if defined(__x86_64__) || defined(__i386__)
 #define cpu_relax()	__builtin_ia32_pause()
 #else
@@ -78,27 +328,6 @@ static void override_output_modes(igt_display_t *display,
 	igt_output_set_pipe(output2, PIPE_NONE);
 }
 
-/**
- * SUBTEST: %s-%s
- * Description: Test checks how many cursor updates we can fit between vblanks
- *              on single/all pipes with different modes, priority and number
- *              of processes
- * Driver requirement: i915, xe
- * Functionality: cursor
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @single:      Single
- * @torture:     Torture
- * @forked:      Forked
- *
- * arg[2]:
- *
- * @bo:          BO
- * @move:        Move
- */
 static void stress(igt_display_t *display,
 		   enum pipe pipe, int num_children, unsigned mode,
 		   int timeout)
@@ -569,93 +798,6 @@ enum basic_flip_cursor {
 
 #define BASIC_BUSY 0x1
 
-/**
- * SUBTEST: basic-busy-flip-before-cursor-%s
- * Description: Cursor test with %arg[1] mode
- * Driver requirement: i915, xe
- * Test category: functionality test
- * Functionality: cursor
- * Mega feature: General Display Features
- *
- * SUBTEST: basic-busy-flip-before-cursor-varying-size
- * Description: Change the size of cursor b/w 64*64 to maxw x maxh.
- * Driver requirement: i915, xe
- * Functionality: cursor
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @atomic:	atomic
- * @legacy:	legacy
- */
-
-/**
- * SUBTEST: basic-flip-after-cursor-%s
- * Description: Cursor test with %arg[1]
- * Driver requirement: i915, xe
- * Test category: functionality test
- * Functionality: cursor
- * Mega feature: General Display Features
- *
- * SUBTEST: basic-flip-before-cursor-%s
- * Description: Cursor test with %arg[1]
- * Driver requirement: i915, xe
- * Test category: functionality test
- * Functionality: cursor
- * Mega feature: General Display Features
- *
- * arg[1]:
- *
- * @atomic:        atomic mode
- * @legacy:        legacy mode
- * @varying-size:  varying size
- */
-
-/**
- * SUBTEST: %s-flip-before-cursor-%s
- * Description: Adds variety of tests:
- *		- varying-size: change the size of cursor b/w 64*64 to maxw x maxh.\n
- *		- atomic-transition: alternates between a full screen sprite plane
- *		                     and full screen primary plane.\n"
- *		- toggle: which toggles cursor visibility and make sure cursor moves
- *		          between updates.
- * Driver requirement: i915, xe
- * Functionality: cursor
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @short:
- * @short-busy:
- *
- * arg[2]:
- *
- * @atomic-transitions:
- * @atomic-transitions-varying-size:
- * @toggle:
- */
-
-/**
- * SUBTEST: short-flip-after-cursor-%s
- * Description: Adds variety of tests:
- *		- varying-size: change the size of cursor b/w 64*64 to maxw x maxh.\n
- *		- atomic-transition: alternates between a full screen sprite plane
- *		                     and full screen primary plane.\n"
- *		- toggle: which toggles cursor visibility and make sure cursor moves
- *		          between updates.
- * Driver requirement: i915, xe
- * Functionality: cursor
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @atomic-transitions:
- * @atomic-transitions-varying-size:
- * @toggle:
- */
 static void basic_flip_cursor(igt_display_t *display,
 			      enum flip_test mode,
 			      enum basic_flip_cursor order,
@@ -977,23 +1119,6 @@ static void flip_vs_cursor(igt_display_t *display, enum flip_test mode, int nloo
 		igt_remove_fb(display->drm_fd, &cursor_fb2);
 }
 
-/**
- * SUBTEST: long-nonblocking-modeset-vs-cursor-atomic
- * Description: Test checks how many cursor updates we can fit between vblanks
- *              on all pipes with different modes, priority and number of processes
- * Driver requirement: i915, xe
- * Functionality: cursor
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: nonblocking-modeset-vs-cursor-atomic
- * Description: Test checks how many cursor updates we can fit between vblanks
- *              on all pipes with different modes, priority and number of processes
- * Driver requirement: i915, xe
- * Functionality: cursor
- * Mega feature: General Display Features
- * Test category: functionality test
- */
 static void nonblocking_modeset_vs_cursor(igt_display_t *display, int loops)
 {
 	struct igt_fb fb_info, cursor_fb;
@@ -1093,42 +1218,6 @@ static void wait_for_modeset(igt_display_t *display, unsigned flags, int timeout
 	igt_reset_timeout();
 }
 
-/**
- * SUBTEST: 2x-%s-%s
- * Description: This test executes flips on both CRTCs while running cursor
- *              updates in parallel
- * Driver requirement: i915, xe
- * Functionality: cursor
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @flip-vs-cursor:
- * @flip-vs-cursor:
- * @long-flip-vs-cursor:
- * @long-flip-vs-cursor:
- *
- * arg[2]:
- *
- * @atomic:
- * @legacy:
- */
-
-/**
- * SUBTEST: 2x-%s-atomic
- * Description: This test executes flips on both CRTCs while running cursor
- *              updates in parallel
- * Driver requirement: i915, xe
- * Functionality: cursor
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @long-nonblocking-modeset-vs-cursor:
- * @nonblocking-modeset-vs-cursor:
- */
 static void two_screens_flip_vs_cursor(igt_display_t *display, int nloops, bool modeset, bool atomic)
 {
 	struct drm_mode_cursor arg1[2], arg2[2];
@@ -1316,33 +1405,6 @@ done:
 	munmap((void *)shared, PAGE_SIZE);
 }
 
-/**
- * SUBTEST: %s-%s
- * Description: The essence of the basic test is that neither the cursor nor the
- *              nonblocking flip stall the application of the next
- * Driver requirement: i915, xe
- * Functionality: cursor
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @cursor-vs-flip:
- * @cursorA-vs-flipA:
- * @cursorA-vs-flipB:
- * @cursorB-vs-flipA:
- * @cursorB-vs-flipB:
- * @flip-vs-cursor:
- *
- * arg[2]:
- *
- * @atomic:
- * @atomic-transitions:
- * @atomic-transitions-varying-size:
- * @legacy:
- * @toggle:
- * @varying-size:
- */
 static void cursor_vs_flip(igt_display_t *display, enum flip_test mode, int nloops)
 {
 	struct drm_mode_cursor arg[2];
@@ -1455,26 +1517,6 @@ static void cursor_vs_flip(igt_display_t *display, enum flip_test mode, int nloo
 		igt_remove_fb(display->drm_fd, &cursor_fb2);
 }
 
-/**
- * SUBTEST: 2x-%s-%s
- * Description: This test executes flips on both CRTCs while running cursor updates in parallel
- * Driver requirement: i915, xe
- * Functionality: cursor
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @cursor-vs-flip:
- * @cursor-vs-flip:
- * @long-cursor-vs-flip:
- * @long-cursor-vs-flip:
- *
- * arg[2]:
- *
- * @atomic:
- * @legacy:
- */
 static void two_screens_cursor_vs_flip(igt_display_t *display, int nloops, bool atomic)
 {
 	struct drm_mode_cursor arg[2][2];
@@ -1603,19 +1645,6 @@ static void two_screens_cursor_vs_flip(igt_display_t *display, int nloops, bool
 	munmap((void *)shared, PAGE_SIZE);
 }
 
-/**
- * SUBTEST: flip-vs-cursor-crc-%s
- * Description: this test perform a page flip followed by a cursor update
- * Driver requirement: i915, xe
- * Functionality: cursor
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @atomic:
- * @legacy:
- */
 static void flip_vs_cursor_crc(igt_display_t *display, bool atomic)
 {
 	struct drm_mode_cursor arg[2];
@@ -1688,19 +1717,6 @@ static void flip_vs_cursor_crc(igt_display_t *display, bool atomic)
 	igt_remove_fb(display->drm_fd, &cursor_fb);
 }
 
-/**
- * SUBTEST: flip-vs-cursor-busy-crc-%s
- * Description: this test perform a busy bo update followed by a cursor update
- * Driver requirement: i915, xe
- * Functionality: cursor
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @atomic:
- * @legacy:
- */
 static void flip_vs_cursor_busy_crc(igt_display_t *display, bool atomic)
 {
 	struct drm_mode_cursor arg[2];
@@ -1813,15 +1829,6 @@ static void flip_vs_cursor_busy_crc(igt_display_t *display, bool atomic)
 	put_ahnd(ahnd);
 }
 
-/**
- * SUBTEST: modeset-atomic-cursor-hotspot
- * Description: Test changes the cursor hotspot and checks that the property is
- *              updated accordignly
- * Driver requirement: i915, xe
- * Functionality: cursor
- * Mega feature: General Display Features
- * Test category: functionality test
- */
 static void modeset_atomic_cursor_hotspot(igt_display_t *display)
 {
 	struct igt_fb cursor_fb;
diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
index aff2a93bc..a0a831724 100644
--- a/tests/kms_display_modes.c
+++ b/tests/kms_display_modes.c
@@ -29,8 +29,27 @@
  * Category: Display
  * Description: Test Display Modes
  */
+
 #include "igt.h"
 
+/**
+ * SUBTEST: extended-mode-basic
+ * Description: Test for validating display extended mode with a pair of connected
+ *              displays
+ * Driver requirement: i915, xe
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: mst-extended-mode-negative
+ * Description: Negative test for validating display extended mode with a pair
+ *		of connected 2k-4k or 4k-4k displays.
+ * Driver requirement: i915, xe
+ * Functionality: kms_core, mst
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ */
+
 #define HDISPLAY_4K	3840
 #define VDISPLAY_4K	2160
 
@@ -205,15 +224,6 @@ static void run_extendedmode_basic(data_t *data,
 	for_each_connected_output_local((display), (output)) \
 		for_each_if (igt_pipe_connector_valid((pipe), (output)))
 
-/**
- * SUBTEST: extended-mode-basic
- * Description: Test for validating display extended mode with a pair of connected
- *              displays
- * Driver requirement: i915, xe
- * Functionality: kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
- */
 static void run_extendedmode_test(data_t *data) {
 	enum pipe pipe1, pipe2;
 	igt_output_t *output1, *output2;
@@ -259,15 +269,6 @@ static void run_extendedmode_test(data_t *data) {
 	}
 }
 
-/**
- * SUBTEST: mst-extended-mode-negative
- * Description: Negative test for validating display extended mode with a pair
- *		of connected 2k-4k or 4k-4k displays.
- * Driver requirement: i915, xe
- * Functionality: kms_core, mst
- * Mega feature: General Display Features
- * Test category: functionality test
- */
 static void run_extendedmode_negative(data_t *data, int pipe1, int pipe2)
 {
 	struct igt_fb fbs[2];
diff --git a/tests/kms_dither.c b/tests/kms_dither.c
index 3387a3b10..5683fe5c5 100644
--- a/tests/kms_dither.c
+++ b/tests/kms_dither.c
@@ -30,11 +30,28 @@
  * Category: Display
  * Description: Test Dithering block status
  */
+
 #include "igt.h"
 #include <fcntl.h>
 #include <termios.h>
 #include <unistd.h>
 
+/**
+ * SUBTEST: fb-8bpc-vs-panel-6bpc
+ * Description: Framebuffer BPC:8, Panel BPC:6, Expected Dither:Enable
+ * Driver requirement: i915, xe
+ * Functionality: colorspace, kms_gem_interop
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: fb-8bpc-vs-panel-8bpc
+ * Description: Framebuffer BPC:8, Panel BPC:8, Expected Dither:Disable
+ * Driver requirement: i915, xe
+ * Functionality: colorspace, kms_gem_interop
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ */
+
 IGT_TEST_DESCRIPTION("Test Dithering block status");
 
 /* Connector BPC */
@@ -186,21 +203,6 @@ static bool is_supported(igt_output_t *output)
 		igt_output_get_prop(output, IGT_CONNECTOR_MAX_BPC);
 }
 
-/**
- * SUBTEST: fb-8bpc-vs-panel-6bpc
- * Description: Framebuffer BPC:8, Panel BPC:6, Expected Dither:Enable
- * Driver requirement: i915, xe
- * Functionality: colorspace, kms_gem_interop
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fb-8bpc-vs-panel-8bpc
- * Description: Framebuffer BPC:8, Panel BPC:8, Expected Dither:Disable
- * Driver requirement: i915, xe
- * Functionality: colorspace, kms_gem_interop
- * Mega feature: General Display Features
- * Test category: functionality test
- */
 static void
 run_dither_test(data_t *data, int fb_bpc, int fb_format, int output_bpc)
 {
diff --git a/tests/kms_dp_aux_dev.c b/tests/kms_dp_aux_dev.c
index e6a67e22e..597d4c2ef 100644
--- a/tests/kms_dp_aux_dev.c
+++ b/tests/kms_dp_aux_dev.c
@@ -22,6 +22,12 @@
  *
  */
 
+/**
+ * TEST: kms dp aux dev
+ * Category: Display
+ * Description: Test that /dev/drm_dp_aux reads work
+ */
+
 #include "config.h"
 
 #include <sys/types.h>
@@ -31,11 +37,8 @@
 
 #include "igt.h"
 #include "igt_kms.h"
+
 /**
- * TEST: kms dp aux dev
- * Category: Display
- * Description: Test that /dev/drm_dp_aux reads work
- *
  * SUBTEST:
  * Description: Test that /dev/drm_dp_aux reads work
  * Driver requirement: i915, xe
diff --git a/tests/kms_feature_discovery.c b/tests/kms_feature_discovery.c
index 1baa93f5f..7aec4e78c 100644
--- a/tests/kms_feature_discovery.c
+++ b/tests/kms_feature_discovery.c
@@ -28,7 +28,18 @@
  * Description: A metatest that checks for \"features\" presence.
  *		The subtests here should only skip or pass,
  *		anything else means we have a serious problem.
- *
+ */
+
+#include "igt.h"
+#ifdef HAVE_CHAMELIUM
+#include "igt_chamelium.h"
+#endif
+#include "igt_kms.h"
+#include "igt_psr.h"
+#include "igt_sysfs.h"
+#include "igt_types.h"
+
+/**
  * SUBTEST: display
  * Description: Make sure that we have display support.
  * Driver requirement: i915, xe
@@ -75,15 +86,6 @@
  * arg[1].values: 1, 2, 3, 4
  */
 
-#include "igt.h"
-#ifdef HAVE_CHAMELIUM
-#include "igt_chamelium.h"
-#endif
-#include "igt_kms.h"
-#include "igt_psr.h"
-#include "igt_sysfs.h"
-#include "igt_types.h"
-
 static igt_display_t display;
 
 IGT_TEST_DESCRIPTION("A metatest that checks for \"features\" presence. "
diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index c427f22e6..798103682 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -42,6 +42,18 @@
 #include <sys/time.h>
 #include <sys/ioctl.h>
 
+#ifdef HAVE_LINUX_KD_H
+#include <linux/kd.h>
+#elif HAVE_SYS_KD_H
+#include <sys/kd.h>
+#endif
+#include <time.h>
+#include <pthread.h>
+
+#include "i915/gem_create.h"
+#include "igt_stats.h"
+#include "xe/xe_query.h"
+
 /**
  * SUBTEST: 2x-flip-vs-fences
  * Description: Test to validate pageflips along with avialable fences on a pair
@@ -280,17 +292,40 @@
  * @modeset-vs-vblank-race:       modeset and check for vblank
  */
 
-#ifdef HAVE_LINUX_KD_H
-#include <linux/kd.h>
-#elif HAVE_SYS_KD_H
-#include <sys/kd.h>
-#endif
-#include <time.h>
-#include <pthread.h>
-
-#include "i915/gem_create.h"
-#include "igt_stats.h"
-#include "xe/xe_query.h"
+/**
+ * SUBTEST: basic-flip-vs-dpms
+ * Description: Basic test to valide pageflip with dpms
+ * Driver requirement: i915, xe
+ * Test category: functionality test
+ * Functionality: dpms, vblank
+ * Mega feature: General Display Features
+ *
+ * SUBTEST: basic-flip-vs-%s
+ * Description: Basic test to valide pageflip with %arg[1]
+ * Driver requirement: i915, xe
+ * Test category: functionality test
+ * Functionality: vblank
+ * Mega feature: General Display Features
+ *
+ * arg[1]:
+ *
+ * @modeset:      modeset
+ * @wf_vblank:    wait for vblank
+ *
+ * SUBTEST: basic-plain-flip
+ * Description: Basic test for validating page flip
+ * Driver requirement: i915, xe
+ * Test category: functionality test
+ * Functionality: vblank
+ * Mega feature: General Display Features
+ *
+ * SUBTEST: nonblocking-read
+ * Description: Tests that nonblocking reading fails correctly
+ * Driver requirement: i915, xe
+ * Functionality: vblank
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ */
 
 #define TEST_DPMS		(1 << 0)
 
@@ -1811,34 +1846,6 @@ test:
 		__run_test_on_crtc_set(o, crtc_idxs, crtc_count, duration_ms);
 }
 
-/**
- * SUBTEST: basic-flip-vs-dpms
- * Description: Basic test to valide pageflip with dpms
- * Driver requirement: i915, xe
- * Test category: functionality test
- * Functionality: dpms, vblank
- * Mega feature: General Display Features
- *
- * SUBTEST: basic-flip-vs-%s
- * Description: Basic test to valide pageflip with %arg[1]
- * Driver requirement: i915, xe
- * Test category: functionality test
- * Functionality: vblank
- * Mega feature: General Display Features
- *
- * arg[1]:
- *
- * @modeset:      modeset
- * @wf_vblank:    wait for vblank
- *
- * SUBTEST: basic-plain-flip
- * Description: Basic test for validating page flip
- * Driver requirement: i915, xe
- * Test category: functionality test
- * Functionality: vblank
- * Mega feature: General Display Features
- */
-
 static void run_test(int duration, int flags)
 {
 	struct test_output o;
@@ -2023,14 +2030,6 @@ static void kms_flip_exit_handler(int sig)
 		kmstest_set_connector_dpms(drm_fd, last_connector, DRM_MODE_DPMS_ON);
 }
 
-/**
- * SUBTEST: nonblocking-read
- * Description: Tests that nonblocking reading fails correctly
- * Driver requirement: i915, xe
- * Functionality: vblank
- * Mega feature: General Display Features
- * Test category: functionality test
- */
 static void test_nonblocking_read(int in)
 {
 	char buffer[1024];
diff --git a/tests/kms_flip_event_leak.c b/tests/kms_flip_event_leak.c
index f526a0ca9..a668b1da3 100644
--- a/tests/kms_flip_event_leak.c
+++ b/tests/kms_flip_event_leak.c
@@ -22,6 +22,12 @@
  *
  */
 
+/**
+ * TEST: kms flip event leak
+ * Category: Display
+ * Description: Test to validate flip event leak
+ */
+
 #include "igt.h"
 #include <errno.h>
 #include <stdbool.h>
@@ -32,10 +38,6 @@
 #include "xe/xe_query.h"
 
 /**
- * TEST: kms flip event leak
- * Category: Display
- * Description: Test to validate flip event leak
- *
  * SUBTEST: basic
  * Description: This test tries to provoke the kernel into leaking a pending
  *              page flip event when the fd is closed before the flip has
diff --git a/tests/kms_force_connector_basic.c b/tests/kms_force_connector_basic.c
index e3b9034db..55e6a7767 100644
--- a/tests/kms_force_connector_basic.c
+++ b/tests/kms_force_connector_basic.c
@@ -30,6 +30,36 @@
 
 #include "igt.h"
 
+/**
+ * SUBTEST: force-load-detect
+ * Description: Test to detect forced load.
+ * Driver requirement: i915
+ * Functionality: force_connector, vga
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: force-connector-state
+ * Description: Test to check the forced connector state
+ * Driver requirement: i915, xe
+ * Test category: functionality test
+ * Functionality: force_connector
+ * Mega feature: General Display Features
+ *
+ * SUBTEST: force-edid
+ * Description: Test to check the values after forcing edid
+ * Driver requirement: i915, xe
+ * Test category: functionality test
+ * Functionality: force_connector
+ * Mega feature: General Display Features
+ *
+ * SUBTEST: prune-stale-modes
+ * Description: Tests pruning of stale modes
+ * Driver requirement: i915, xe
+ * Test category: functionality test
+ * Functionality: force_connector
+ * Mega feature: General Display Features
+ */
+
 IGT_TEST_DESCRIPTION("Check the debugfs force connector/edid features work"
 		     " correctly.");
 
@@ -69,14 +99,6 @@ static void reset_connectors(void)
 	drm_close_driver(drm_fd);
 }
 
-/**
- * SUBTEST: force-load-detect
- * Description: Test to detect forced load.
- * Driver requirement: i915
- * Functionality: force_connector, vga
- * Mega feature: General Display Features
- * Test category: functionality test
- */
 static void force_load_detect(int drm_fd, drmModeConnectorPtr connector, drmModeRes *res)
 {
 	int i, j, w = 64, h = 64;
@@ -165,14 +187,6 @@ static void force_load_detect(int drm_fd, drmModeConnectorPtr connector, drmMode
 	}
 }
 
-/**
- * SUBTEST: force-connector-state
- * Description: Test to check the forced connector state
- * Driver requirement: i915, xe
- * Test category: functionality test
- * Functionality: force_connector
- * Mega feature: General Display Features
- */
 static void force_connector_state(int drm_fd, drmModeConnectorPtr connector)
 {
 	igt_display_t display;
@@ -212,14 +226,6 @@ static void force_connector_state(int drm_fd, drmModeConnectorPtr connector)
 	igt_display_fini(&display);
 }
 
-/**
- * SUBTEST: force-edid
- * Description: Test to check the values after forcing edid
- * Driver requirement: i915, xe
- * Test category: functionality test
- * Functionality: force_connector
- * Mega feature: General Display Features
- */
 static void force_edid(int drm_fd, drmModeConnectorPtr connector)
 {
 	drmModeConnector *temp;
@@ -261,14 +267,6 @@ static void force_edid(int drm_fd, drmModeConnectorPtr connector)
 
 }
 
-/**
- * SUBTEST: prune-stale-modes
- * Description: Tests pruning of stale modes
- * Driver requirement: i915, xe
- * Test category: functionality test
- * Functionality: force_connector
- * Mega feature: General Display Features
- */
 static void prune_stale_modes(int drm_fd, drmModeConnectorPtr connector)
 {
 	int i;
diff --git a/tests/kms_getfb.c b/tests/kms_getfb.c
index 059f66d99..b4a155e2d 100644
--- a/tests/kms_getfb.c
+++ b/tests/kms_getfb.c
@@ -32,6 +32,7 @@
  * Category: Display
  * Description: Tests GETFB and GETFB2 ioctls.
  */
+
 #include "igt.h"
 #include <unistd.h>
 #include <stdlib.h>
@@ -50,6 +51,88 @@
 #include "xe/xe_query.h"
 #include "xe/xe_ioctl.h"
 
+/**
+ * SUBTEST: getfb-handle-%s
+ * Description: Tests error handling %arg[1]
+ * Driver requirement: i915, xe
+ * Functionality: kms_gem_interop
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @closed:       when passing a handle that has been closed.
+ * @not-fb:       when passing an invalid handle.
+ * @valid:        when passing an valid handle.
+ * @zero:         for a zero'd input.
+ */
+
+/**
+ * SUBTEST: getfb-reject-ccs
+ * Description: Tests error handling while requesting CCS buffers it should
+ *              refuse because getfb supports returning a single buffer handle.
+ * Driver requirement: i915, xe
+ * Functionality: ccs, kms_gem_interop, tiling
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: getfb-%s-different-handles
+ * Description: Tests error handling while requesting for two different handles
+ *              from %arg[1].
+ * Driver requirement: i915, xe
+ * Functionality: kms_gem_interop
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @addfb:           same fd
+ * @repeated:        different fd
+ */
+
+/**
+ * SUBTEST: getfb2-accept-ccs
+ * Description: Tests outputs are correct when retrieving a CCS framebuffer.
+ * Driver requirement: i915, xe
+ * Functionality: ccs, kms_gem_interop, tiling
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: getfb2-into-addfb2
+ * Description: Output check by passing the output of GETFB2 into ADDFB2.
+ * Driver requirement: i915, xe
+ * Functionality: kms_gem_interop
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: getfb2-handle-%s
+ * Description: Tests error handling %arg[1].
+ * Driver requirement: i915, xe
+ * Functionality: kms_gem_interop
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @closed:                  when passing a handle that has been closed
+ * @not-fb:                  when passing an invalid handle
+ * @zero:                    for a zero'd input
+ */
+
+/**
+ * SUBTEST: %s-handle-protection
+ * Description: Make sure %arg[1] return handles if caller is non-root or non-master.
+ * Driver requirement: i915, xe
+ * Functionality: kms_gem_interop
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @getfb:      GETFB ioctl
+ * @getfb2:     GETFB2 ioctl
+ */
+
 IGT_TEST_DESCRIPTION("Tests GETFB and GETFB2 ioctls.");
 
 static bool has_getfb_iface(int fd)
@@ -178,21 +261,6 @@ static uint32_t get_any_prop_id(int fd)
 	return 0;
 }
 
-/**
- * SUBTEST: getfb-handle-%s
- * Description: Tests error handling %arg[1]
- * Driver requirement: i915, xe
- * Functionality: kms_gem_interop
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @closed:       when passing a handle that has been closed.
- * @not-fb:       when passing an invalid handle.
- * @valid:        when passing an valid handle.
- * @zero:         for a zero'd input.
- */
 static void test_handle_input(int fd)
 {
 	struct drm_mode_fb_cmd2 add = {};
@@ -248,28 +316,6 @@ static void test_handle_input(int fd)
 		gem_close(fd, add.handles[0]);
 }
 
-/**
- * SUBTEST: getfb-reject-ccs
- * Description: Tests error handling while requesting CCS buffers it should
- *              refuse because getfb supports returning a single buffer handle.
- * Driver requirement: i915, xe
- * Functionality: ccs, kms_gem_interop, tiling
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: getfb-%s-different-handles
- * Description: Tests error handling while requesting for two different handles
- *              from %arg[1].
- * Driver requirement: i915, xe
- * Functionality: kms_gem_interop
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @addfb:           same fd
- * @repeated:        different fd
- */
 static void test_duplicate_handles(int fd)
 {
 	struct drm_mode_fb_cmd2 add = {};
@@ -335,34 +381,6 @@ static void test_duplicate_handles(int fd)
 	}
 }
 
-/**
- * SUBTEST: getfb2-accept-ccs
- * Description: Tests outputs are correct when retrieving a CCS framebuffer.
- * Driver requirement: i915, xe
- * Functionality: ccs, kms_gem_interop, tiling
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: getfb2-into-addfb2
- * Description: Output check by passing the output of GETFB2 into ADDFB2.
- * Driver requirement: i915, xe
- * Functionality: kms_gem_interop
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: getfb2-handle-%s
- * Description: Tests error handling %arg[1].
- * Driver requirement: i915, xe
- * Functionality: kms_gem_interop
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @closed:                  when passing a handle that has been closed
- * @not-fb:                  when passing an invalid handle
- * @zero:                    for a zero'd input
- */
 static void test_getfb2(int fd)
 {
 	struct drm_mode_fb_cmd2 add_basic = {};
@@ -471,19 +489,6 @@ static void test_getfb2(int fd)
 	}
 }
 
-/**
- * SUBTEST: %s-handle-protection
- * Description: Make sure %arg[1] return handles if caller is non-root or non-master.
- * Driver requirement: i915, xe
- * Functionality: kms_gem_interop
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @getfb:      GETFB ioctl
- * @getfb2:     GETFB2 ioctl
- */
 static void test_handle_protection(void) {
 	int non_master_fd;
 	struct drm_mode_fb_cmd2 non_master_add = {};
diff --git a/tests/kms_hdmi_inject.c b/tests/kms_hdmi_inject.c
index 61f62fa7c..3a279e2c9 100644
--- a/tests/kms_hdmi_inject.c
+++ b/tests/kms_hdmi_inject.c
@@ -22,6 +22,14 @@
  *
  */
 
+/**
+ * TEST: kms hdmi inject
+ * Category: Display
+ * Description: Test that in-kernel EDID parsing is producing expected results
+ *              by forcing a HDMI connector with a known EDID and checking that
+ *              the metadata exposed to user space matches.
+ */
+
 #include "config.h"
 
 #include <dirent.h>
@@ -32,12 +40,6 @@
 #include "xe/xe_query.h"
 
 /**
- * TEST: kms hdmi inject
- * Category: Display
- * Description: Test that in-kernel EDID parsing is producing expected results
- *              by forcing a HDMI connector with a known EDID and checking that
- *              the metadata exposed to user space matches.
- *
  * SUBTEST: inject-4k
  * Description: Make sure that 4K modes exposed by DRM match the forced EDID and
  *              modesetting using it succeed.
diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index ed98a0c26..215f81892 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -25,12 +25,76 @@
  * Category: Display
  * Description: Test HDR metadata interfaces and bpc switch
  */
+
 #include "igt.h"
 #include <fcntl.h>
 #include <termios.h>
 #include <unistd.h>
 #include "igt_edid.h"
 
+/**
+ * SUBTEST: bpc-switch
+ * Description: Tests switching between different display output bpc modes
+ * Driver requirement: i915, xe
+ * Functionality: colorspace, hdr
+ * Mega feature: HDR
+ * Test category: functionality test
+ *
+ * SUBTEST: bpc-switch-dpms
+ * Description: Tests switching between different display output bpc modes with dpms
+ * Driver requirement: i915, xe
+ * Functionality: colorspace, dpms, hdr
+ * Mega feature: HDR
+ * Test category: functionality test
+ *
+ * SUBTEST: bpc-switch-suspend
+ * Description: Tests switching between different display output bpc modes with suspend
+ * Driver requirement: i915, xe
+ * Functionality: colorspace, hdr, suspend
+ * Mega feature: HDR
+ * Test category: functionality test
+ *
+ * SUBTEST: invalid-hdr
+ * Description: Test to ensure HDR is not enabled on non-HDR panel
+ * Driver requirement: i915, xe
+ * Functionality: colorspace, hdr
+ * Mega feature: HDR
+ * Test category: functionality test
+ *
+ * SUBTEST: invalid-metadata-sizes
+ * Description: Tests invalid HDR metadata sizes
+ * Driver requirement: i915, xe
+ * Functionality: colorspace, hdr
+ * Mega feature: HDR
+ * Test category: functionality test
+ *
+ * SUBTEST: static-toggle-dpms
+ * Description: Tests static toggle with dpms
+ * Driver requirement: i915, xe
+ * Functionality: colorspace, dpms, hdr
+ * Mega feature: HDR
+ * Test category: functionality test
+ *
+ * SUBTEST: static-toggle-suspend
+ * Description: Tests static toggle with suspend
+ * Driver requirement: i915, xe
+ * Functionality: colorspace, hdr, suspend
+ * Mega feature: HDR
+ * Test category: functionality test
+ *
+ * SUBTEST: static-%s
+ * Description: Tests %arg[1].
+ * Driver requirement: i915, xe
+ * Functionality: colorspace, hdr
+ * Mega feature: HDR
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @swap:                    swapping static HDR metadata
+ * @toggle:                  entering and exiting HDR mode
+ */
+
 IGT_TEST_DESCRIPTION("Test HDR metadata interfaces and bpc switch");
 
 /* HDR EDID parsing. */
@@ -213,28 +277,6 @@ static bool has_max_bpc(igt_output_t *output)
 	       igt_output_get_prop(output, IGT_CONNECTOR_MAX_BPC);
 }
 
-/**
- * SUBTEST: bpc-switch
- * Description: Tests switching between different display output bpc modes
- * Driver requirement: i915, xe
- * Functionality: colorspace, hdr
- * Mega feature: HDR
- * Test category: functionality test
- *
- * SUBTEST: bpc-switch-dpms
- * Description: Tests switching between different display output bpc modes with dpms
- * Driver requirement: i915, xe
- * Functionality: colorspace, dpms, hdr
- * Mega feature: HDR
- * Test category: functionality test
- *
- * SUBTEST: bpc-switch-suspend
- * Description: Tests switching between different display output bpc modes with suspend
- * Driver requirement: i915, xe
- * Functionality: colorspace, hdr, suspend
- * Mega feature: HDR
- * Test category: functionality test
- */
 static void test_bpc_switch(data_t *data, uint32_t flags)
 {
 	igt_display_t *display = &data->display;
@@ -588,47 +630,6 @@ static bool has_hdr(igt_output_t *output)
 	return igt_output_has_prop(output, IGT_CONNECTOR_HDR_OUTPUT_METADATA);
 }
 
-/**
- * SUBTEST: invalid-hdr
- * Description: Test to ensure HDR is not enabled on non-HDR panel
- * Driver requirement: i915, xe
- * Functionality: colorspace, hdr
- * Mega feature: HDR
- * Test category: functionality test
- *
- * SUBTEST: invalid-metadata-sizes
- * Description: Tests invalid HDR metadata sizes
- * Driver requirement: i915, xe
- * Functionality: colorspace, hdr
- * Mega feature: HDR
- * Test category: functionality test
- *
- * SUBTEST: static-toggle-dpms
- * Description: Tests static toggle with dpms
- * Driver requirement: i915, xe
- * Functionality: colorspace, dpms, hdr
- * Mega feature: HDR
- * Test category: functionality test
- *
- * SUBTEST: static-toggle-suspend
- * Description: Tests static toggle with suspend
- * Driver requirement: i915, xe
- * Functionality: colorspace, hdr, suspend
- * Mega feature: HDR
- * Test category: functionality test
- *
- * SUBTEST: static-%s
- * Description: Tests %arg[1].
- * Driver requirement: i915, xe
- * Functionality: colorspace, hdr
- * Mega feature: HDR
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @swap:                    swapping static HDR metadata
- * @toggle:                  entering and exiting HDR mode
- */
 static void test_hdr(data_t *data, uint32_t flags)
 {
 	igt_display_t *display = &data->display;
diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c
index 55b7fea8f..77cf4d609 100644
--- a/tests/kms_invalid_mode.c
+++ b/tests/kms_invalid_mode.c
@@ -28,6 +28,7 @@
  * Description: Make sure all modesets are rejected when the requested mode is
  *              invalid
  */
+
 #include "igt.h"
 #include <limits.h>
 #include <stdbool.h>
diff --git a/tests/kms_multipipe_modeset.c b/tests/kms_multipipe_modeset.c
index a968a3513..e67392668 100644
--- a/tests/kms_multipipe_modeset.c
+++ b/tests/kms_multipipe_modeset.c
@@ -24,12 +24,15 @@
  *  Karthik B S <karthik.b.s@intel.com>
  */
 
-#include "igt.h"
 /**
  * TEST: kms multipipe modeset
  * Category: Display
  * Description: Test simultaneous modeset on all the supported pipes
- *
+ */
+
+#include "igt.h"
+
+/**
  * SUBTEST: basic-max-pipe-crc-check
  * Description: Verify if simultaneous modesets on all the supported pipes is
  *              successful. Validate using CRC verification
diff --git a/tests/kms_panel_fitting.c b/tests/kms_panel_fitting.c
index a583e1435..af0c756ed 100644
--- a/tests/kms_panel_fitting.c
+++ b/tests/kms_panel_fitting.c
@@ -22,15 +22,18 @@
  *
  */
 
+/**
+ * TEST: kms panel fitting
+ * Category: Display
+ * Description: Test display panel fitting
+ */
+
 #include "igt.h"
 #include <limits.h>
 #include <math.h>
 #include <sys/stat.h>
+
 /**
- * TEST: kms panel fitting
- * Category: Display
- * Description: Test display panel fitting
- *
  * SUBTEST: atomic-fastset
  * Description: Tests panel fitting usages with atomic fastset.
  * Driver requirement: i915, xe
diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
index 94252415b..4fed582b4 100644
--- a/tests/kms_pipe_crc_basic.c
+++ b/tests/kms_pipe_crc_basic.c
@@ -36,6 +36,81 @@
 #include <string.h>
 #include <fcntl.h>
 
+/**
+ * SUBTEST: bad-source
+ * Description: Tests error handling when the bad source is set.
+ * Driver requirement: i915, xe
+ * Functionality: crc
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: read-crc
+ * Description: Test for pipe CRC reads
+ * Driver requirement: i915, xe
+ * Test category: functionality test
+ * Functionality: crc
+ * Mega feature: General Display Features
+ *
+ * SUBTEST: read-crc-frame-sequence
+ * Description: Tests the pipe CRC read and ensure frame sequence
+ * Driver requirement: i915, xe
+ * Test category: functionality test
+ * Functionality: crc
+ * Mega feature: General Display Features
+ *
+ * SUBTEST: nonblocking-crc
+ * Description: Test for O_NONBLOCK CRC reads
+ * Driver requirement: i915, xe
+ * Test category: functionality test
+ * Functionality: crc
+ * Mega feature: General Display Features
+ *
+ * SUBTEST: nonblocking-crc-frame-sequence
+ * Description: Test for O_NONBLOCK CRC reads and ensure frame sequence
+ * Driver requirement: i915, xe
+ * Test category: functionality test
+ * Functionality: crc
+ * Mega feature: General Display Features
+ *
+ * SUBTEST: suspend-read-crc
+ * Description: Suspend test for pipe CRC reads
+ * Driver requirement: i915, xe
+ * Test category: functionality test
+ * Functionality: crc, suspend
+ * Mega feature: General Display Features
+ *
+ * SUBTEST: hang-read-crc
+ * Description: Hang test for pipe CRC read
+ * Driver requirement: i915, xe
+ * Test category: functionality test
+ * Functionality: crc, hang
+ * Mega feature: General Display Features
+ */
+
+/**
+ * SUBTEST: compare-crc-sanitycheck-%s
+ * Description: Basic sanity check for CRC mismatches with %arg[1]
+ * Driver requirement: i915, xe
+ * Test category: functionality test
+ * Functionality: crc, pixel_format
+ * Mega feature: General Display Features
+ *
+ * arg[1]:
+ *
+ * @xr24:	XR24 format
+ * @nv12:	NV12 format
+ */
+
+/**
+ * SUBTEST: disable-crc-after-crtc
+ * Description: Check that disabling CRCs on a CRTC after having disabled the
+ *              CRTC does not cause issues.
+ * Driver requirement: i915, xe
+ * Functionality: crc
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ */
+
 static bool extended;
 static enum pipe active_pipes[IGT_MAX_PIPES];
 static uint32_t last_pipe;
@@ -65,14 +140,6 @@ static bool simulation_constraint(enum pipe pipe)
 	return false;
 }
 
-/**
- * SUBTEST: bad-source
- * Description: Tests error handling when the bad source is set.
- * Driver requirement: i915, xe
- * Functionality: crc
- * Mega feature: General Display Features
- * Test category: functionality test
- */
 static void test_bad_source(data_t *data)
 {
 	errno = 0;
@@ -94,49 +161,6 @@ enum {
 	TEST_HANG = 1 << 3,
 };
 
-/**
- * SUBTEST: read-crc
- * Description: Test for pipe CRC reads
- * Driver requirement: i915, xe
- * Test category: functionality test
- * Functionality: crc
- * Mega feature: General Display Features
- *
- * SUBTEST: read-crc-frame-sequence
- * Description: Tests the pipe CRC read and ensure frame sequence
- * Driver requirement: i915, xe
- * Test category: functionality test
- * Functionality: crc
- * Mega feature: General Display Features
- *
- * SUBTEST: nonblocking-crc
- * Description: Test for O_NONBLOCK CRC reads
- * Driver requirement: i915, xe
- * Test category: functionality test
- * Functionality: crc
- * Mega feature: General Display Features
- *
- * SUBTEST: nonblocking-crc-frame-sequence
- * Description: Test for O_NONBLOCK CRC reads and ensure frame sequence
- * Driver requirement: i915, xe
- * Test category: functionality test
- * Functionality: crc
- * Mega feature: General Display Features
- *
- * SUBTEST: suspend-read-crc
- * Description: Suspend test for pipe CRC reads
- * Driver requirement: i915, xe
- * Test category: functionality test
- * Functionality: crc, suspend
- * Mega feature: General Display Features
- *
- * SUBTEST: hang-read-crc
- * Description: Hang test for pipe CRC read
- * Driver requirement: i915, xe
- * Test category: functionality test
- * Functionality: crc, hang
- * Mega feature: General Display Features
- */
 static void test_read_crc(data_t *data, enum pipe pipe,
 			  igt_output_t *output, unsigned flags)
 {
@@ -234,20 +258,6 @@ static void test_read_crc(data_t *data, enum pipe pipe,
 	igt_display_commit(display);
 }
 
-/**
- * SUBTEST: compare-crc-sanitycheck-%s
- * Description: Basic sanity check for CRC mismatches with %arg[1]
- * Driver requirement: i915, xe
- * Test category: functionality test
- * Functionality: crc, pixel_format
- * Mega feature: General Display Features
- *
- * arg[1]:
- *
- * @xr24:	XR24 format
- * @nv12:	NV12 format
- */
-
 /*
  * CRC-sanity test, to make sure there would be no CRC mismatches
  *
@@ -313,15 +323,6 @@ static void test_compare_crc(data_t *data, enum pipe pipe, igt_output_t *output,
 	igt_remove_fb(data->drm_fd, &fb1);
 }
 
-/**
- * SUBTEST: disable-crc-after-crtc
- * Description: Check that disabling CRCs on a CRTC after having disabled the
- *              CRTC does not cause issues.
- * Driver requirement: i915, xe
- * Functionality: crc
- * Mega feature: General Display Features
- * Test category: functionality test
- */
 static void test_disable_crc_after_crtc(data_t *data, enum pipe pipe,
 					igt_output_t *output)
 {
diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index c561bf6ba..17550e168 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -29,6 +29,7 @@
  * Category: Display
  * Description: Testes for KMS Plane
  */
+
 #include "igt.h"
 #include "igt_vec.h"
 #include <errno.h>
@@ -37,6 +38,73 @@
 #include <string.h>
 #include "xe/xe_query.h"
 
+/**
+ * SUBTEST: plane-position-%s
+ * Description: Verify plane position using two planes to create a %arg[1]
+ * Driver requirement: i915, xe
+ * Functionality: plane
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: plane-position-hole-dpms
+ * Description: Verify plane position using two planes to create a partially
+ *              covered screen and check for DPMS
+ * Driver requirement: i915, xe
+ * Functionality: dpms, plane
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @covered:           fully covered screen
+ * @hole:              partially covered screen
+ */
+
+/**
+ * SUBTEST: plane-panning-%s
+ * Description: Verify plane panning at %arg[1] using primary plane
+ * Driver requirement: i915, xe
+ * Functionality: plane
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: plane-panning-bottom-right-suspend
+ * Description: Verify plane panning at bottom-right position with suspend using
+ *              primary plane
+ * Driver requirement: i915, xe
+ * Functionality: plane, suspend
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @bottom-right:               bottom-right position
+ * @top-left:                   top-left position
+ */
+
+/**
+ * SUBTEST: pixel-%s
+ * Description: verify the pixel formats for given plane and pipe
+ * Driver requirement: i915, xe
+ * Functionality: pixel_format, plane
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @format:
+ * @format-source-clamping:          with source clamping
+ */
+
+/**
+ * SUBTEST: planar-pixel-format-settings
+ * Description: verify planar settings for pixel format are handled correctly
+ * Driver requirement: i915, xe
+ * Functionality: pixel_format, plane
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ */
+
 /*
  * Throw away enough lsbs in pixel formats tests
  * to get a match despite some differences between
@@ -287,27 +355,6 @@ test_plane_position_with_output(data_t *data,
 	igt_remove_fb(data->drm_fd, &sprite_fb);
 }
 
-/**
- * SUBTEST: plane-position-%s
- * Description: Verify plane position using two planes to create a %arg[1]
- * Driver requirement: i915, xe
- * Functionality: plane
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: plane-position-hole-dpms
- * Description: Verify plane position using two planes to create a partially
- *              covered screen and check for DPMS
- * Driver requirement: i915, xe
- * Functionality: dpms, plane
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @covered:           fully covered screen
- * @hole:              partially covered screen
- */
 static void
 test_plane_position(data_t *data, enum pipe pipe)
 {
@@ -416,27 +463,6 @@ test_plane_panning_with_output(data_t *data,
 	igt_remove_fb(data->drm_fd, &primary_fb);
 }
 
-/**
- * SUBTEST: plane-panning-%s
- * Description: Verify plane panning at %arg[1] using primary plane
- * Driver requirement: i915, xe
- * Functionality: plane
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: plane-panning-bottom-right-suspend
- * Description: Verify plane panning at bottom-right position with suspend using
- *              primary plane
- * Driver requirement: i915, xe
- * Functionality: plane, suspend
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @bottom-right:               bottom-right position
- * @top-left:                   top-left position
- */
 static void
 test_plane_panning(data_t *data, enum pipe pipe)
 {
@@ -1162,19 +1188,6 @@ static bool skip_plane(data_t *data, igt_plane_t *plane)
 	return index != 0 && index != 3 && index != 5;
 }
 
-/**
- * SUBTEST: pixel-%s
- * Description: verify the pixel formats for given plane and pipe
- * Driver requirement: i915, xe
- * Functionality: pixel_format, plane
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @format:
- * @format-source-clamping:          with source clamping
- */
 static void
 test_pixel_formats(data_t *data, enum pipe pipe)
 {
@@ -1231,14 +1244,6 @@ test_pixel_formats(data_t *data, enum pipe pipe)
 	igt_assert_f(result, "At least one CRC mismatch happened\n");
 }
 
-/**
- * SUBTEST: planar-pixel-format-settings
- * Description: verify planar settings for pixel format are handled correctly
- * Driver requirement: i915, xe
- * Functionality: pixel_format, plane
- * Mega feature: General Display Features
- * Test category: functionality test
- */
 static void test_planar_settings(data_t *data)
 {
 	enum pipe pipe = PIPE_A;
diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
index f023fae74..d37407150 100644
--- a/tests/kms_plane_alpha_blend.c
+++ b/tests/kms_plane_alpha_blend.c
@@ -29,8 +29,56 @@
  * Category: Display
  * Description: Test plane alpha and blending mode properties
  */
+
 #include "igt.h"
 
+/**
+ * SUBTEST: alpha-%s
+ * Description: Test to %arg[1]
+ * Driver requirement: i915, xe
+ * Functionality: plane
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @7efc:                validate alpha values 0x7e and 0xfc are swappable on
+ *                       pre-multiplied blend mode.
+ * @basic:               basic plane alpha properties.
+ * @opaque-fb:           alpha properties with opaque fb.
+ * @transparent-fb:      alpha property with transparent fb.
+ */
+
+/**
+ * SUBTEST: coverage-vs-premult-vs-constant
+ * Description: Tests pipe coverage blending properties.
+ * Driver requirement: i915, xe
+ * Functionality: plane
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: coverage-7efc
+ * Description: Uses alpha values 0x7e and 0xfc to validate fg.alpha and
+ *              plane_alpha are swappable on coverage blend mode.
+ * Driver requirement: i915, xe
+ * Functionality: plane
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: constant-alpha-%s
+ * Description: Tests plane alpha and blending properties with %arg[1].
+ * Driver requirement: i915, xe
+ * Functionality: plane
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @max:            maximum alpha value
+ * @mid:            medium  alpha value
+ * @min:            minimum alpha value
+ */
+
 IGT_TEST_DESCRIPTION("Test plane alpha and blending mode properties");
 
 static bool extended;
@@ -482,52 +530,6 @@ static void coverage_premult_constant(data_t *data, enum pipe pipe, igt_plane_t
 	igt_pipe_crc_stop(data->pipe_crc);
 }
 
-/**
- * SUBTEST: alpha-%s
- * Description: Test to %arg[1]
- * Driver requirement: i915, xe
- * Functionality: plane
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @7efc:                validate alpha values 0x7e and 0xfc are swappable on
- *                       pre-multiplied blend mode.
- * @basic:               basic plane alpha properties.
- * @opaque-fb:           alpha properties with opaque fb.
- * @transparent-fb:      alpha property with transparent fb.
- */
-
-/**
- * SUBTEST: coverage-vs-premult-vs-constant
- * Description: Tests pipe coverage blending properties.
- * Driver requirement: i915, xe
- * Functionality: plane
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: coverage-7efc
- * Description: Uses alpha values 0x7e and 0xfc to validate fg.alpha and
- *              plane_alpha are swappable on coverage blend mode.
- * Driver requirement: i915, xe
- * Functionality: plane
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: constant-alpha-%s
- * Description: Tests plane alpha and blending properties with %arg[1].
- * Driver requirement: i915, xe
- * Functionality: plane
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @max:            maximum alpha value
- * @mid:            medium  alpha value
- * @min:            minimum alpha value
- */
 static void run_test_on_pipe_planes(data_t *data, enum pipe pipe, igt_output_t *output,
 				    bool blend, bool must_multiply,
 				    void(*test)(data_t *, enum pipe, igt_plane_t *))
diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
index bc89414d8..55ddffe44 100644
--- a/tests/kms_plane_cursor.c
+++ b/tests/kms_plane_cursor.c
@@ -20,13 +20,15 @@
  * OTHER DEALINGS IN THE SOFTWARE.
  */
 
-#include "igt.h"
-
 /**
  * TEST: kms plane cursor
  * Category: Display
  * Description: Tests cursor interactions with primary and overlay planes.
- *
+ */
+
+#include "igt.h"
+
+/**
  * SUBTEST: overlay
  * Description: Tests atomic cursor positioning on primary plane and overlay plane
  * Driver requirement: i915, xe
diff --git a/tests/kms_plane_lowres.c b/tests/kms_plane_lowres.c
index 3bb92cdd9..13158bf99 100644
--- a/tests/kms_plane_lowres.c
+++ b/tests/kms_plane_lowres.c
@@ -28,6 +28,7 @@
  * Description: Test atomic mode setting with a plane by switching between high
  *              and low resolutions
  */
+
 #include "igt.h"
 #include "drmtest.h"
 #include <errno.h>
@@ -36,6 +37,31 @@
 #include <string.h>
 #include <time.h>
 
+/**
+ * SUBTEST: tiling-none
+ * Description: Tests the visibility of the planes when switching between high
+ *              and low resolution with Linear buffer (no tiling)
+ * Driver requirement: i915, xe
+ * Functionality: plane
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: tiling-%s
+ * Description: Tests the visibility of the planes when switching between high
+ *              and low resolution with %arg[1]
+ * Driver requirement: i915, xe
+ * Functionality: plane, tiling
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @4:           4-tiling
+ * @x:           x-tiling
+ * @y:           y-tiling
+ * @yf:          yf-tiling
+ */
+
 IGT_TEST_DESCRIPTION("Test atomic mode setting with a plane by switching between high and low resolutions");
 
 #define SDR_PLANE_BASE 3
@@ -267,30 +293,6 @@ static void test_cleanup(data_t *data)
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 }
 
-/**
- * SUBTEST: tiling-none
- * Description: Tests the visibility of the planes when switching between high
- *              and low resolution with Linear buffer (no tiling)
- * Driver requirement: i915, xe
- * Functionality: plane
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: tiling-%s
- * Description: Tests the visibility of the planes when switching between high
- *              and low resolution with %arg[1]
- * Driver requirement: i915, xe
- * Functionality: plane, tiling
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @4:           4-tiling
- * @x:           x-tiling
- * @y:           y-tiling
- * @yf:          yf-tiling
- */
 static void run_test(data_t *data, uint64_t modifier)
 {
 	enum pipe pipe;
diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
index 28791560f..6239e225a 100644
--- a/tests/kms_plane_multiple.c
+++ b/tests/kms_plane_multiple.c
@@ -27,6 +27,7 @@
  * Category: Display
  * Description: Test atomic mode setting with multiple planes.
  */
+
 #include "igt.h"
 #include "drmtest.h"
 #include <errno.h>
@@ -35,6 +36,33 @@
 #include <string.h>
 #include <time.h>
 
+/**
+ * SUBTEST: tiling-none
+ * Description: Check that the kernel handles atomic updates of multiple planes
+ *              correctly by changing their geometry and making sure the changes
+ *              are reflected immediately after each commit.
+ * Driver requirement: i915, xe
+ * Functionality: plane
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: tiling-%s
+ * Description: Check that the kernel handles atomic updates of multiple planes
+ *              correctly by changing their geometry and making sure the changes
+ *              are reflected immediately after each commit.
+ * Driver requirement: i915, xe
+ * Functionality: plane, tiling
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @4:           4-tiling
+ * @x:           x-tiling
+ * @y:           y-tiling
+ * @yf:          yf-tiling
+ */
+
 IGT_TEST_DESCRIPTION("Test atomic mode setting with multiple planes.");
 
 #define SIZE_PLANE      256
@@ -378,32 +406,6 @@ test_plane_position(data_t *data, enum pipe pipe, igt_output_t *output, uint64_t
 					n_planes, modifier);
 }
 
-/**
- * SUBTEST: tiling-none
- * Description: Check that the kernel handles atomic updates of multiple planes
- *              correctly by changing their geometry and making sure the changes
- *              are reflected immediately after each commit.
- * Driver requirement: i915, xe
- * Functionality: plane
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: tiling-%s
- * Description: Check that the kernel handles atomic updates of multiple planes
- *              correctly by changing their geometry and making sure the changes
- *              are reflected immediately after each commit.
- * Driver requirement: i915, xe
- * Functionality: plane, tiling
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @4:           4-tiling
- * @x:           x-tiling
- * @y:           y-tiling
- * @yf:          yf-tiling
- */
 static void run_test(data_t *data, uint64_t modifier)
 {
 	enum pipe pipe;
diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 67da91b1e..e175c75d8 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -27,10 +27,250 @@
  * Category: Display
  * Description: Test display plane scaling
  */
+
 #include "igt.h"
 #include "igt_vec.h"
 #include <math.h>
 
+/**
+ * SUBTEST: plane-scaler-unity-scaling-with-modifiers
+ * Description: Tests scaling with modifiers, unity scaling.
+ * Driver requirement: i915, xe
+ * Functionality: plane, scaling
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: plane-scaler-with-clipping-clamping-modifiers
+ * Description: Tests scaling with clipping and clamping, modifiers.
+ * Driver requirement: i915, xe
+ * Functionality: plane, scaling
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: plane-upscale-%s-with-modifiers
+ * Description: Tests upscaling with modifiers %arg[1].
+ * Driver requirement: i915, xe
+ * Functionality: plane, scaling
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @20x20:          from 20x20 fb
+ * @factor-0-25:    for 0.25 scaling factor
+ */
+
+/**
+ * SUBTEST: plane-downscale-factor-%s-with-modifiers
+ * Description: Tests downscaling with modifiers for %arg[1] scaling factor.
+ * Driver requirement: i915, xe
+ * Functionality: plane, scaling
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @0-25:   0.25
+ * @0-5:    0.5
+ * @0-75:   0.75
+ */
+
+/**
+ * SUBTEST: plane-scaler-unity-scaling-with-rotation
+ * Description: Tests scaling with rotation, unity scaling.
+ * Driver requirement: i915, xe
+ * Functionality: plane, scaling
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: plane-scaler-with-clipping-clamping-rotation
+ * Description: Tests scaling with clipping and clamping, rotation.
+ * Driver requirement: i915, xe
+ * Functionality: plane, scaling
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: plane-upscale-%s-with-rotation
+ * Description: Tests upscaling with rotation %arg[1].
+ * Driver requirement: i915, xe
+ * Functionality: plane, scaling
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @20x20:          from 20x20 fb
+ * @factor-0-25:    for 0.25 scaling factor
+ */
+
+/**
+ * SUBTEST: plane-downscale-factor-%s-with-rotation
+ * Description: Tests downscaling with rotation for %arg[1] scaling factor.
+ * Driver requirement: i915, xe
+ * Functionality: plane, scaling
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @0-25:   0.25
+ * @0-5:    0.5
+ * @0-75:   0.75
+ */
+
+/**
+ * SUBTEST: plane-scaler-unity-scaling-with-pixel-format
+ * Description: Tests scaling with pixel formats, unity scaling.
+ * Driver requirement: i915, xe
+ * Functionality: pixel_formats, plane, scaling
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: plane-scaler-with-clipping-clamping-pixel-formats
+ * Description: Tests scaling with clipping and clamping, pixel formats.
+ * Driver requirement: i915, xe
+ * Functionality: pixel_formats, plane, scaling
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: plane-upscale-%s-with-pixel-format
+ * Description: Tests upscaling with pixel formats %arg[1].
+ * Driver requirement: i915, xe
+ * Functionality: pixel_formats, plane, scaling
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @20x20:          from 20x20 fb
+ * @factor-0-25:    for 0.25 scaling factor
+ */
+
+/**
+ * SUBTEST: plane-downscale-factor-%s-with-pixel-format
+ * Description: Tests downscaling with pixel formats for %arg[1] scaling factor.
+ * Driver requirement: i915, xe
+ * Functionality: pixel_formats, plane, scaling
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @0-25:   0.25
+ * @0-5:    0.5
+ * @0-75:   0.75
+ */
+
+/**
+ * SUBTEST: planes-downscale-factor-%s
+ * Description: Tests downscaling of 2 planes for %arg[1] scaling factor.
+ * Driver requirement: i915, xe
+ * Functionality: plane, scaling
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @0-25:  0.25
+ * @0-5:   0.5
+ * @0-75:  0.75
+ */
+
+/**
+ * SUBTEST: planes-downscale-factor-%s-%s
+ * Description: Tests downscaling (scaling factor %arg[1]) and upscaling (%arg[2])
+ *              of 2 planes.
+ * Driver requirement: i915, xe
+ * Functionality: plane, scaling
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @0-25:  0.25
+ * @0-5:   0.5
+ * @0-75:  0.75
+ *
+ * arg[2]:
+ *
+ * @upscale-20x20:           upscale 20x20
+ * @upscale-factor-0-25:     scaling factor 0.25
+ * @unity-scaling:           Unity
+ */
+
+/**
+ * SUBTEST: planes-scaler-unity-scaling
+ * Description: Tests scaling of 2 planes, unity scaling.
+ * Driver requirement: i915, xe
+ * Functionality: plane, scaling
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: planes-upscale-%s
+ * Description: Tests upscaling of 2 planes %arg[1].
+ * Driver requirement: i915, xe
+ * Functionality: plane, scaling
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @20x20:          from 20x20 fb
+ * @factor-0-25:    for 0.25 scaling factor
+ */
+
+/**
+ * SUBTEST: planes-%s-downscale-factor-%s
+ * Description: Tests scaling (%arg[1]) and downscaling (scaling factor %arg[2])
+ *              of 2 planes.
+ * Driver requirement: i915, xe
+ * Functionality: plane, scaling
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @unity-scaling:           Unity
+ * @upscale-factor-0-25:     scaling factor 0.25
+ * @upscale-20x20:           upscale 20x20
+ *
+ * arg[2]:
+ *
+ * @0-25:  0.25
+ * @0-5:   0.5
+ * @0-75:  0.75
+ */
+
+/**
+ * SUBTEST: invalid-num-scalers
+ * Description: Negative test for number of scalers per pipe.
+ * Driver requirement: i915, xe
+ * Functionality: plane, scaling
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: 2x-scaler-multi-pipe
+ * Description: Tests scaling with multi-pipe.
+ * Driver requirement: i915, xe
+ * Functionality: plane, scaling
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: invalid-parameters
+ * Description: Test parameters which should not be accepted
+ * Driver requirement: i915, xe
+ * Functionality: plane, scaling
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: intel-max-src-size
+ * Description: Test for validating max source size.
+ * Driver requirement: i915, xe
+ * Functionality: plane, scaling
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ */
+
 IGT_TEST_DESCRIPTION("Test display plane scaling");
 
 enum scaler_combo_test_type {
@@ -529,48 +769,6 @@ static const uint64_t modifiers[] = {
 	I915_FORMAT_MOD_4_TILED
 };
 
-/**
- * SUBTEST: plane-scaler-unity-scaling-with-modifiers
- * Description: Tests scaling with modifiers, unity scaling.
- * Driver requirement: i915, xe
- * Functionality: plane, scaling
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: plane-scaler-with-clipping-clamping-modifiers
- * Description: Tests scaling with clipping and clamping, modifiers.
- * Driver requirement: i915, xe
- * Functionality: plane, scaling
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: plane-upscale-%s-with-modifiers
- * Description: Tests upscaling with modifiers %arg[1].
- * Driver requirement: i915, xe
- * Functionality: plane, scaling
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @20x20:          from 20x20 fb
- * @factor-0-25:    for 0.25 scaling factor
- */
-
-/**
- * SUBTEST: plane-downscale-factor-%s-with-modifiers
- * Description: Tests downscaling with modifiers for %arg[1] scaling factor.
- * Driver requirement: i915, xe
- * Functionality: plane, scaling
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @0-25:   0.25
- * @0-5:    0.5
- * @0-75:   0.75
- */
 static void test_scaler_with_modifier_pipe(data_t *d,
 					   int width, int height,
 					   bool is_upscale,
@@ -603,48 +801,6 @@ static void test_scaler_with_modifier_pipe(data_t *d,
 	}
 }
 
-/**
- * SUBTEST: plane-scaler-unity-scaling-with-rotation
- * Description: Tests scaling with rotation, unity scaling.
- * Driver requirement: i915, xe
- * Functionality: plane, scaling
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: plane-scaler-with-clipping-clamping-rotation
- * Description: Tests scaling with clipping and clamping, rotation.
- * Driver requirement: i915, xe
- * Functionality: plane, scaling
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: plane-upscale-%s-with-rotation
- * Description: Tests upscaling with rotation %arg[1].
- * Driver requirement: i915, xe
- * Functionality: plane, scaling
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @20x20:          from 20x20 fb
- * @factor-0-25:    for 0.25 scaling factor
- */
-
-/**
- * SUBTEST: plane-downscale-factor-%s-with-rotation
- * Description: Tests downscaling with rotation for %arg[1] scaling factor.
- * Driver requirement: i915, xe
- * Functionality: plane, scaling
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @0-25:   0.25
- * @0-5:    0.5
- * @0-75:   0.75
- */
 static void test_scaler_with_rotation_pipe(data_t *d,
 					   int width, int height,
 					   bool is_upscale,
@@ -678,48 +834,6 @@ static void test_scaler_with_rotation_pipe(data_t *d,
 	}
 }
 
-/**
- * SUBTEST: plane-scaler-unity-scaling-with-pixel-format
- * Description: Tests scaling with pixel formats, unity scaling.
- * Driver requirement: i915, xe
- * Functionality: pixel_formats, plane, scaling
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: plane-scaler-with-clipping-clamping-pixel-formats
- * Description: Tests scaling with clipping and clamping, pixel formats.
- * Driver requirement: i915, xe
- * Functionality: pixel_formats, plane, scaling
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: plane-upscale-%s-with-pixel-format
- * Description: Tests upscaling with pixel formats %arg[1].
- * Driver requirement: i915, xe
- * Functionality: pixel_formats, plane, scaling
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @20x20:          from 20x20 fb
- * @factor-0-25:    for 0.25 scaling factor
- */
-
-/**
- * SUBTEST: plane-downscale-factor-%s-with-pixel-format
- * Description: Tests downscaling with pixel formats for %arg[1] scaling factor.
- * Driver requirement: i915, xe
- * Functionality: pixel_formats, plane, scaling
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @0-25:   0.25
- * @0-5:    0.5
- * @0-75:   0.75
- */
 static void test_scaler_with_pixel_format_pipe(data_t *d, int width, int height, bool is_upscale,
 					       enum pipe pipe, igt_output_t *output)
 {
@@ -855,83 +969,6 @@ static void setup_fb(int fd, int width, int height, struct igt_fb *fb)
 		      fb);
 }
 
-/**
- * SUBTEST: planes-downscale-factor-%s
- * Description: Tests downscaling of 2 planes for %arg[1] scaling factor.
- * Driver requirement: i915, xe
- * Functionality: plane, scaling
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @0-25:  0.25
- * @0-5:   0.5
- * @0-75:  0.75
- */
-/**
- * SUBTEST: planes-downscale-factor-%s-%s
- * Description: Tests downscaling (scaling factor %arg[1]) and upscaling (%arg[2])
- *              of 2 planes.
- * Driver requirement: i915, xe
- * Functionality: plane, scaling
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @0-25:  0.25
- * @0-5:   0.5
- * @0-75:  0.75
- *
- * arg[2]:
- *
- * @upscale-20x20:           upscale 20x20
- * @upscale-factor-0-25:     scaling factor 0.25
- * @unity-scaling:           Unity
- */
-/**
- * SUBTEST: planes-scaler-unity-scaling
- * Description: Tests scaling of 2 planes, unity scaling.
- * Driver requirement: i915, xe
- * Functionality: plane, scaling
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: planes-upscale-%s
- * Description: Tests upscaling of 2 planes %arg[1].
- * Driver requirement: i915, xe
- * Functionality: plane, scaling
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @20x20:          from 20x20 fb
- * @factor-0-25:    for 0.25 scaling factor
- */
-/**
- * SUBTEST: planes-%s-downscale-factor-%s
- * Description: Tests scaling (%arg[1]) and downscaling (scaling factor %arg[2])
- *              of 2 planes.
- * Driver requirement: i915, xe
- * Functionality: plane, scaling
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @unity-scaling:           Unity
- * @upscale-factor-0-25:     scaling factor 0.25
- * @upscale-20x20:           upscale 20x20
- *
- * arg[2]:
- *
- * @0-25:  0.25
- * @0-5:   0.5
- * @0-75:  0.75
- */
-
 static void
 test_planes_scaling_combo(data_t *d, int w1, int h1, int w2, int h2,
 			  enum pipe pipe, igt_output_t *output,
@@ -990,14 +1027,6 @@ test_planes_scaling_combo(data_t *d, int w1, int h1, int w2, int h2,
 	cleanup_fbs(d);
 }
 
-/**
- * SUBTEST: invalid-num-scalers
- * Description: Negative test for number of scalers per pipe.
- * Driver requirement: i915, xe
- * Functionality: plane, scaling
- * Mega feature: General Display Features
- * Test category: functionality test
- */
 static void
 test_invalid_num_scalers(data_t *d, enum pipe pipe, igt_output_t *output)
 {
@@ -1063,14 +1092,6 @@ test_invalid_num_scalers(data_t *d, enum pipe pipe, igt_output_t *output)
 	cleanup_fbs(d);
 }
 
-/**
- * SUBTEST: 2x-scaler-multi-pipe
- * Description: Tests scaling with multi-pipe.
- * Driver requirement: i915, xe
- * Functionality: plane, scaling
- * Mega feature: General Display Features
- * Test category: functionality test
- */
 static void test_scaler_with_multi_pipe_plane(data_t *d)
 {
 	igt_display_t *display = &d->display;
@@ -1158,14 +1179,6 @@ static void test_scaler_with_multi_pipe_plane(data_t *d)
 	igt_assert_eq(ret1 && ret2, 0);
 }
 
-/**
- * SUBTEST: invalid-parameters
- * Description: Test parameters which should not be accepted
- * Driver requirement: i915, xe
- * Functionality: plane, scaling
- * Mega feature: General Display Features
- * Test category: functionality test
- */
 static void invalid_parameter_tests(data_t *d)
 {
 	enum pipe pipe = PIPE_A;
@@ -1248,15 +1261,6 @@ static drmModeModeInfo *find_mode(data_t *data, igt_output_t *output, const uint
 	return mode;
 }
 
-/**
- * SUBTEST: intel-max-src-size
- * Description: Test for validating max source size.
- * Driver requirement: i915, xe
- * Functionality: plane, scaling
- * Mega feature: General Display Features
- * Test category: functionality test
- */
-
 /*
  *	Max source/destination width/height for intel driver.
  *	These numbers are coming from
diff --git a/tests/kms_prime.c b/tests/kms_prime.c
index b06365cbc..1e985fdc4 100644
--- a/tests/kms_prime.c
+++ b/tests/kms_prime.c
@@ -21,6 +21,12 @@
  * IN THE SOFTWARE.
  */
 
+/**
+ * TEST: kms prime
+ * Category: Display
+ * Description: Prime tests, focusing on KMS side
+ */
+
 #include "igt.h"
 #include "igt_device.h"
 #include "igt_debugfs.h"
@@ -30,11 +36,8 @@
 #include <sys/ioctl.h>
 #include <sys/poll.h>
 #include <time.h>
+
 /**
- * TEST: kms prime
- * Category: Display
- * Description: Prime tests, focusing on KMS side
- *
  * SUBTEST: D3hot
  * Description: Validate pci state of dGPU when dGPU is idle and  scanout is on iGPU
  * Driver requirement: i915, xe
diff --git a/tests/kms_prop_blob.c b/tests/kms_prop_blob.c
index c92525227..199c673e3 100644
--- a/tests/kms_prop_blob.c
+++ b/tests/kms_prop_blob.c
@@ -30,12 +30,61 @@
  * Category: Display
  * Description: Tests behaviour of mass-data 'blob' properties.
  */
+
 #include "igt.h"
 #include <errno.h>
 #include <stdbool.h>
 #include <stdio.h>
 #include <string.h>
 
+/**
+ * SUBTEST: blob-multiple
+ * Description: Test validates destroying multiple properties explicitly works as needed.
+ * Driver requirement: i915, xe
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: blob-prop-%s
+ * Description: Tests validates the %arg[1] of the properties created.
+ * Driver requirement: i915, xe
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @core:        validity
+ * @lifetime:    lifetime
+ * @validate:    blob size
+ */
+
+/**
+ * SUBTEST: basic
+ * Description: Test to ensure property support exists
+ * Driver requirement: i915, xe
+ * Test category: functionality test
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ *
+ * SUBTEST: invalid-%s-%s
+ * Description: Tests error handling when invalid properties are %ar[1] with %arg[2].
+ * Driver requirement: i915, xe
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @get:            fetched
+ * @set:            set
+ *
+ * arg[2]:
+ *
+ * @prop:           blob object type
+ * @prop-any:       object of any type
+ */
+
 IGT_TEST_DESCRIPTION("Tests behaviour of mass-data 'blob' properties.");
 
 static const struct drm_mode_modeinfo test_mode_valid = {
@@ -123,27 +172,6 @@ destroy_prop(int fd, uint32_t prop_id)
 	return 0;
 }
 
-/**
- * SUBTEST: blob-multiple
- * Description: Test validates destroying multiple properties explicitly works as needed.
- * Driver requirement: i915, xe
- * Functionality: kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: blob-prop-%s
- * Description: Tests validates the %arg[1] of the properties created.
- * Driver requirement: i915, xe
- * Functionality: kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @core:        validity
- * @lifetime:    lifetime
- * @validate:    blob size
- */
 static void
 test_validate(int fd)
 {
@@ -264,14 +292,6 @@ test_core(int fd)
 	igt_assert_eq(validate_prop(fd, 0), ENOENT);
 }
 
-/**
- * SUBTEST: basic
- * Description: Test to ensure property support exists
- * Driver requirement: i915, xe
- * Test category: functionality test
- * Functionality: kms_core
- * Mega feature: General Display Features
- */
 static void
 test_basic(int fd)
 {
@@ -282,24 +302,6 @@ test_basic(int fd)
 	igt_assert_eq(destroy_prop(fd, prop_id), 0);
 }
 
-/**
- * SUBTEST: invalid-%s-%s
- * Description: Tests error handling when invalid properties are %ar[1] with %arg[2].
- * Driver requirement: i915, xe
- * Functionality: kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @get:            fetched
- * @set:            set
- *
- * arg[2]:
- *
- * @prop:           blob object type
- * @prop-any:       object of any type
- */
 static void prop_tests(int fd)
 {
 	struct drm_mode_obj_get_properties get_props = {};
diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index 1a58717e1..33c4156bf 100644
--- a/tests/kms_properties.c
+++ b/tests/kms_properties.c
@@ -21,6 +21,12 @@
  * IN THE SOFTWARE.
  */
 
+/**
+ * TEST: kms properties
+ * Category: Display
+ * Description: Test to validate the properties of all planes, crtc and connectors
+ */
+
 #include "igt.h"
 #include "drmtest.h"
 #include <errno.h>
@@ -28,11 +34,8 @@
 #include <stdio.h>
 #include <string.h>
 #include <time.h>
+
 /**
- * TEST: kms properties
- * Category: Display
- * Description: Test to validate the properties of all planes, crtc and connectors
- *
  * SUBTEST: %s-properties-%s
  * Description: Tests %arg[1] properties with %arg[2] commit
  * Driver requirement: i915, xe
@@ -53,6 +56,20 @@
  * @legacy:          legacy
  */
 
+/**
+ * SUBTEST: get_properties-sanity-%s
+ * Description: Test validates the properties of all planes, crtc and connectors
+ *              with %arg[1] commit
+ * Driver requirement: i915, xe
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @atomic:          atomic
+ * @non-atomic:      legacy
+ */
 
 struct additional_test {
 	const char *name;
@@ -712,20 +729,6 @@ static void expect_no_props(int fd, uint32_t obj_type, uint32_t obj_id)
 	igt_assert_neq(drmIoctl(fd, DRM_IOCTL_MODE_OBJ_GETPROPERTIES, &properties), 0);
 }
 
-/**
- * SUBTEST: get_properties-sanity-%s
- * Description: Test validates the properties of all planes, crtc and connectors
- *              with %arg[1] commit
- * Driver requirement: i915, xe
- * Functionality: kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @atomic:          atomic
- * @non-atomic:      legacy
- */
 static void get_prop_sanity(igt_display_t *display, bool atomic)
 {
 	int fd = display->drm_fd;
diff --git a/tests/kms_rmfb.c b/tests/kms_rmfb.c
index 5281370f0..c102c9583 100644
--- a/tests/kms_rmfb.c
+++ b/tests/kms_rmfb.c
@@ -21,6 +21,13 @@
  * IN THE SOFTWARE.
  */
 
+/**
+ * TEST: kms rmfb
+ * Category: Display
+ * Description: This tests rmfb and close-fd behavior. In these casesthe
+ *              framebuffers should be removed from the crtc.
+ */
+
 #include "igt.h"
 #include "drmtest.h"
 #include <errno.h>
@@ -28,12 +35,8 @@
 #include <stdio.h>
 #include <string.h>
 #include <time.h>
+
 /**
- * TEST: kms rmfb
- * Category: Display
- * Description: This tests rmfb and close-fd behavior. In these casesthe
- *              framebuffers should be removed from the crtc.
- *
  * SUBTEST: close-fd
  * Description: RMFB is supposed to free the framebuffers from any and all planes
  *              so test this and make sure it works with fd close and reopen.
diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index 864ab7b03..b2e877a4b 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -27,10 +27,130 @@
  * Category: Display
  * Description: Tests different rotations with different planes & formats
  */
+
 #include "igt.h"
 #include "igt_vec.h"
 #include <math.h>
 
+/**
+ * SUBTEST: %s-rotation-180
+ * Description: Rotation test with 180 degree for %arg[1] planes
+ * Driver requirement: i915, xe
+ * Functionality: plane, rotation
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @primary:    primary
+ * @sprite:     sprite
+ * @cursor:     cursor
+ */
+
+/**
+ * SUBTEST: %s-rotation-%d
+ * Description: Rotation test with %arg[2] degree for %arg[1] planes of gen9+
+ * Driver requirement: i915, xe
+ * Functionality: plane, rotation
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @primary:    primary
+ * @sprite:     sprite
+ *
+ * arg[2].values: 90, 270
+ */
+
+/**
+ * SUBTEST: bad-pixel-format
+ * Description: Checking unsupported pixel format for gen9+ with 90 degree of rotation
+ * Driver requirement: i915, xe
+ * Functionality: plane, rotation
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: bad-tiling
+ * Description: Checking unsupported tiling for gen9+ with 90 degree of rotation
+ * Driver requirement: i915, xe
+ * Functionality: plane, rotation, tiling
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ */
+
+/**
+ * SUBTEST: primary-%s-tiled-reflect-x-%d
+ * Description: Test for %arg[1] & %arg[2] degree rotation on primary plane
+ * Driver requirement: i915, xe
+ * Functionality: plane, rotation, tiling
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @4:      4 tiling
+ * @x:      x tiling
+ * @y:      y tiling
+ * @yf:     yf tiling
+ *
+ * arg[2].values: 0, 180
+ */
+
+/**
+ * SUBTEST: primary-%s-tiled-reflect-x-%d
+ * Description: Test for %arg[1] & %arg[2] degree rotation on primary plane
+ * Driver requirement: i915, xe
+ * Functionality: plane, rotation, tiling
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @y:      y tiling
+ * @yf:     yf tiling
+ *
+ * arg[2].values: 90, 270
+ *
+ * SUBTEST: sprite-rotation-90-pos-100-0
+ * Description: Rotation test with 90 degree for a plane of gen9+ with given position
+ * Driver requirement: i915, xe
+ * Functionality: plane, rotation
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ */
+
+/**
+ * SUBTEST: multiplane-rotation
+ * Description: Rotation test on both planes by making them fully visible
+ * Driver requirement: i915, xe
+ * Functionality: plane, rotation
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: multiplane-rotation-cropping-%s
+ * Description: Rotation test on both planes by cropping left/%arg[1] corner of
+ *              primary plane and right/%arg[1] corner of sprite plane
+ * Driver requirement: i915, xe
+ * Functionality: plane, rotation
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @bottom:   bottom
+ * @top:      top
+ */
+
+/**
+ * SUBTEST: exhaust-fences
+ * Description: This test intends to check for fence leaks exhaustively
+ * Driver requirement: i915
+ * Functionality: plane, rotation
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ */
+
 #define MAX_FENCES 32
 #define MAXMULTIPLANESAMOUNT 2
 #define TEST_MAX_WIDTH 640
@@ -479,93 +599,6 @@ static bool test_format(data_t *data,
 	return true;
 }
 
-/**
- * SUBTEST: %s-rotation-180
- * Description: Rotation test with 180 degree for %arg[1] planes
- * Driver requirement: i915, xe
- * Functionality: plane, rotation
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @primary:    primary
- * @sprite:     sprite
- * @cursor:     cursor
- */
-
-/**
- * SUBTEST: %s-rotation-%d
- * Description: Rotation test with %arg[2] degree for %arg[1] planes of gen9+
- * Driver requirement: i915, xe
- * Functionality: plane, rotation
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @primary:    primary
- * @sprite:     sprite
- *
- * arg[2].values: 90, 270
- */
-
-/**
- * SUBTEST: bad-pixel-format
- * Description: Checking unsupported pixel format for gen9+ with 90 degree of rotation
- * Driver requirement: i915, xe
- * Functionality: plane, rotation
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: bad-tiling
- * Description: Checking unsupported tiling for gen9+ with 90 degree of rotation
- * Driver requirement: i915, xe
- * Functionality: plane, rotation, tiling
- * Mega feature: General Display Features
- * Test category: functionality test
- */
-
-/**
- * SUBTEST: primary-%s-tiled-reflect-x-%d
- * Description: Test for %arg[1] & %arg[2] degree rotation on primary plane
- * Driver requirement: i915, xe
- * Functionality: plane, rotation, tiling
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @4:      4 tiling
- * @x:      x tiling
- * @y:      y tiling
- * @yf:     yf tiling
- *
- * arg[2].values: 0, 180
- */
-
-/**
- * SUBTEST: primary-%s-tiled-reflect-x-%d
- * Description: Test for %arg[1] & %arg[2] degree rotation on primary plane
- * Driver requirement: i915, xe
- * Functionality: plane, rotation, tiling
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @y:      y tiling
- * @yf:     yf tiling
- *
- * arg[2].values: 90, 270
- *
- * SUBTEST: sprite-rotation-90-pos-100-0
- * Description: Rotation test with 90 degree for a plane of gen9+ with given position
- * Driver requirement: i915, xe
- * Functionality: plane, rotation
- * Mega feature: General Display Features
- * Test category: functionality test
- */
 static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_format)
 {
 	igt_display_t *display = &data->display;
@@ -885,28 +918,6 @@ static bool reusecrcfromlastround(planeinfos p[2], int lastroundp1format,
 	return true;
 }
 
-/**
- * SUBTEST: multiplane-rotation
- * Description: Rotation test on both planes by making them fully visible
- * Driver requirement: i915, xe
- * Functionality: plane, rotation
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: multiplane-rotation-cropping-%s
- * Description: Rotation test on both planes by cropping left/%arg[1] corner of
- *              primary plane and right/%arg[1] corner of sprite plane
- * Driver requirement: i915, xe
- * Functionality: plane, rotation
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @bottom:   bottom
- * @top:      top
- */
-
 /*
  * Here is pipe parameter which is now used only for first pipe.
  * It is left here if this test ever was wanted to be run on
@@ -1104,14 +1115,6 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
 	igt_require_f(found, "No valid pipe/output combo found.\n");
 }
 
-/**
- * SUBTEST: exhaust-fences
- * Description: This test intends to check for fence leaks exhaustively
- * Driver requirement: i915
- * Functionality: plane, rotation
- * Mega feature: General Display Features
- * Test category: functionality test
- */
 static void test_plane_rotation_exhaust_fences(data_t *data,
 					       enum pipe pipe,
 					       igt_output_t *output,
diff --git a/tests/kms_scaling_modes.c b/tests/kms_scaling_modes.c
index eb10f7386..960e7d84b 100644
--- a/tests/kms_scaling_modes.c
+++ b/tests/kms_scaling_modes.c
@@ -24,12 +24,15 @@
  *     Swati Sharma <swati2.sharma@intel.com>
  */
 
-#include "igt.h"
 /**
  * TEST: kms scaling modes
  * Category: Display
  * Description: Test display scaling modes
- *
+ */
+
+#include "igt.h"
+
+/**
  * SUBTEST: scaling-mode-%s
  * Description: Tests %arg[1] display scaling mode
  * Driver requirement: i915, xe
diff --git a/tests/kms_selftest.c b/tests/kms_selftest.c
index 6618dbe50..30fc58d90 100644
--- a/tests/kms_selftest.c
+++ b/tests/kms_selftest.c
@@ -21,13 +21,16 @@
  * IN THE SOFTWARE.
  */
 
-#include "igt.h"
-#include "igt_kmod.h"
 /**
  * TEST: kms selftest
  * Category: Display
  * Description: Basic sanity check of KMS selftests.
- *
+ */
+
+#include "igt.h"
+#include "igt_kmod.h"
+
+/**
  * SUBTEST: %s
  * Description: Basic sanity check of KMS selftest %arg[1].
  * Driver requirement: i915, xe
diff --git a/tests/kms_sequence.c b/tests/kms_sequence.c
index 011733bc8..7dbcca643 100644
--- a/tests/kms_sequence.c
+++ b/tests/kms_sequence.c
@@ -27,6 +27,7 @@
  * Category: Display
  * Description: Test CrtcGetSequence and CrtcQueueSequence.
  */
+
 #include "igt.h"
 #include <stdlib.h>
 #include <stdio.h>
@@ -42,6 +43,36 @@
 
 #include <drm.h>
 
+/**
+ * SUBTEST: get-%s
+ * Description: This is a test of drmCrtcGetSequence with %arg[1]
+ * Driver requirement: i915, xe
+ * Functionality: vblank
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @busy:         busy
+ * @forked:       forked bo
+ * @forked-busy:  forked bo & busy
+ * @idle:         idle
+ */
+
+/**
+ * SUBTEST: queue-%s
+ * Description: This is a test of drmCrtcQueueSequence with %arg[1]
+ * Driver requirement: i915, xe
+ * Functionality: vblank
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @busy:         busy
+ * @idle:         idle
+ */
+
 IGT_TEST_DESCRIPTION("Test CrtcGetSequence and CrtcQueueSequence.");
 
 typedef struct {
@@ -136,35 +167,6 @@ static int crtc_queue_sequence(int fd, struct drm_crtc_queue_sequence *cqs)
 	return err;
 }
 
-/**
- * SUBTEST: get-%s
- * Description: This is a test of drmCrtcGetSequence with %arg[1]
- * Driver requirement: i915, xe
- * Functionality: vblank
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @busy:         busy
- * @forked:       forked bo
- * @forked-busy:  forked bo & busy
- * @idle:         idle
- */
-
-/**
- * SUBTEST: queue-%s
- * Description: This is a test of drmCrtcQueueSequence with %arg[1]
- * Driver requirement: i915, xe
- * Functionality: vblank
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @busy:         busy
- * @idle:         idle
- */
 static void run_test(data_t *data, int fd, void (*testfunc)(data_t *, int, int))
 {
 	int nchildren =
diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index d66ee97c8..7fd1667d7 100644
--- a/tests/kms_setmode.c
+++ b/tests/kms_setmode.c
@@ -20,6 +20,14 @@
  * Authors:
  *    Imre Deak <imre.deak@intel.com>
  */
+
+/**
+ * TEST: kms setmode
+ * Category: Display
+ * Description: Tests the mode by iterating through all valid/invalid crtc/connector
+ *              combinations
+ */
+
 #include "config.h"
 
 #include "igt.h"
@@ -35,11 +43,6 @@
 #include "xe/xe_query.h"
 
 /**
- * TEST: kms setmode
- * Category: Display
- * Description: Tests the mode by iterating through all valid/invalid crtc/connector
- *              combinations
- *
  * SUBTEST: basic
  * Description: Tests the vblank timing by iterating through all valid crtc/connector
  *              combinations
diff --git a/tests/kms_sysfs_edid_timing.c b/tests/kms_sysfs_edid_timing.c
index ee47a024e..b36f383e5 100644
--- a/tests/kms_sysfs_edid_timing.c
+++ b/tests/kms_sysfs_edid_timing.c
@@ -20,16 +20,20 @@
  * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
  * IN THE SOFTWARE.
  */
+
+/**
+ * TEST: kms sysfs edid timing
+ * Category: Display
+ * Description: Test to check the time it takes to reprobe each connector.
+ */
+
 #include "igt.h"
 
 #include <dirent.h>
 #include <fcntl.h>
 #include <sys/stat.h>
+
 /**
- * TEST: kms sysfs edid timing
- * Category: Display
- * Description: Test to check the time it takes to reprobe each connector.
- *
  * SUBTEST:
  * Description: This test checks the time it takes to reprobe each connector and
  *              fails if either the time it takes for one reprobe is too long or
diff --git a/tests/kms_tiled_display.c b/tests/kms_tiled_display.c
index bb29a4ca7..a094f4df3 100644
--- a/tests/kms_tiled_display.c
+++ b/tests/kms_tiled_display.c
@@ -41,6 +41,7 @@
  * Category: Display
  * Description: Test for Transcoder Port Sync for Display Port Tiled Displays
  */
+
 #include "igt.h"
 #include "poll.h"
 #include "drm_mode.h"
diff --git a/tests/kms_tv_load_detect.c b/tests/kms_tv_load_detect.c
index 67dbb242e..13394f2c6 100644
--- a/tests/kms_tv_load_detect.c
+++ b/tests/kms_tv_load_detect.c
@@ -22,12 +22,15 @@
  *
  */
 
-#include "igt.h"
 /**
  * TEST: kms tv load detect
  * Category: Display
  * Description: Test to check tv load detection.
- *
+ */
+
+#include "igt.h"
+
+/**
  * SUBTEST: load-detect
  * Description: Check tv load detection works correctly.
  * Driver requirement: i915, xe
diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
index 7178bebc0..b79b3d3e3 100644
--- a/tests/kms_universal_plane.c
+++ b/tests/kms_universal_plane.c
@@ -21,6 +21,12 @@
  * IN THE SOFTWARE.
  */
 
+/**
+ * TEST: kms universal plane
+ * Category: Display
+ * Description: Check pageflip & modeset on universal plane
+ */
+
 #include "igt.h"
 #include <errno.h>
 #include <stdbool.h>
@@ -29,10 +35,6 @@
 #include <fcntl.h>
 
 /**
- * TEST: kms universal plane
- * Category: Display
- * Description: Check pageflip & modeset on universal plane
- *
  * SUBTEST: cursor-fb-leak
  * Description: Check for cursor leaks after performing cursor operations
  * Driver requirement: i915, xe
@@ -54,9 +56,7 @@
  * Functionality: plane
  * Mega feature: General Display Features
  * Test category: functionality test
- */
-
-/**
+ *
  * SUBTEST: universal-plane-%s
  * Description: Check %arg[1]
  * Driver requirement: i915, xe
diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
index 549a959ad..5994e682c 100644
--- a/tests/kms_vblank.c
+++ b/tests/kms_vblank.c
@@ -21,6 +21,12 @@
  * IN THE SOFTWARE.
  */
 
+/**
+ * TEST: kms vblank
+ * Category: Display
+ * Description: Test speed of WaitVblank.
+ */
+
 #include "igt.h"
 #include <stdlib.h>
 #include <stdio.h>
@@ -35,11 +41,8 @@
 #include <sys/wait.h>
 
 #include <drm.h>
+
 /**
- * TEST: kms vblank
- * Category: Display
- * Description: Test speed of WaitVblank.
- *
  * SUBTEST: crtc-id
  * Description: Check the vblank and flip events works with given crtc id
  * Driver requirement: i915, xe
@@ -53,9 +56,7 @@
  * Functionality: vblank
  * Mega feature: General Display Features
  * Test category: functionality test
- */
-
-/**
+ *
  * SUBTEST: ts-continuation-dpms-rpm
  * Description: Test TS continuty with DPMS & RPM while hanging by introducing
  *              NOHANG flag
@@ -63,9 +64,7 @@
  * Functionality: dpms, hang, rpm, vblank
  * Mega feature: General Display Features
  * Test category: functionality test
- */
-
-/**
+ *
  * SUBTEST: ts-continuation-dpms-suspend
  * Description: Test TS continuty with DPMS & Suspend while hanging by introducing
  *              NOHANG flag
@@ -73,9 +72,7 @@
  * Functionality: dpms, hang, suspend, vblank
  * Mega feature: General Display Features
  * Test category: functionality test
- */
-
-/**
+ *
  * SUBTEST: ts-continuation-suspend
  * Description: Test TS continuty with Suspend while hanging by introducing NOHANG
  *              flag
@@ -83,9 +80,7 @@
  * Functionality: hang, suspend, vblank
  * Mega feature: General Display Features
  * Test category: functionality test
- */
-
-/**
+ *
  * SUBTEST: ts-continuation-modeset-rpm
  * Description: Test TS continuty during Modeset with Suspend while hanging by
  *              introducing NOHANG flag
@@ -93,9 +88,7 @@
  * Functionality: hang, rpm, vblank
  * Mega feature: General Display Features
  * Test category: functionality test
- */
-
-/**
+ *
  * SUBTEST: accuracy-idle
  * Description: Test Accuracy of vblank events while hanging by introducing NOHANG
  *              flag
diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index f26adbccf..23aebb0f2 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -20,15 +20,18 @@
  * OTHER DEALINGS IN THE SOFTWARE.
  */
 
+/**
+ * TEST: kms vrr
+ * Category: Display
+ * Description: Test to validate diffent features of VRR
+ */
+
 #include "igt.h"
 #include "sw_sync.h"
 #include <fcntl.h>
 #include <signal.h>
+
 /**
- * TEST: kms vrr
- * Category: Display
- * Description: Test to validate diffent features of VRR
- *
  * SUBTEST: flip-basic
  * Description: Tests that VRR is enabled and that the difference between flip
  *              timestamps converges to the requested rate
diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index 25b49eccd..6b436b7ab 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -22,6 +22,15 @@
  *
  */
 
+/**
+ * TEST: kms writeback
+ * Category: Display
+ * Description: This test validates the expected behavior of the writeback
+ *              connectors feature by checking if the target device support
+ *              writeback; it validates bad and good combination, check color
+ *              format, and check the output result by using CRC.
+ */
+
 #include <errno.h>
 #include <stdbool.h>
 #include <stdio.h>
@@ -32,14 +41,8 @@
 #include "igt_core.h"
 #include "igt_fb.h"
 #include "sw_sync.h"
+
 /**
- * TEST: kms writeback
- * Category: Display
- * Description: This test validates the expected behavior of the writeback
- *              connectors feature by checking if the target device support
- *              writeback; it validates bad and good combination, check color
- *              format, and check the output result by using CRC.
- *
  * SUBTEST: writeback-check-output-XRGB2101010
  * Description: Check XRGB2101010 writeback output with CRC validation
  * Functionality: kms_core
diff --git a/tests/testdisplay.c b/tests/testdisplay.c
index 42218210f..109ed496a 100644
--- a/tests/testdisplay.c
+++ b/tests/testdisplay.c
@@ -45,6 +45,13 @@
  *  - DP commands (e.g. poweroff)
  * - verify outputs against VBT/physical connectors
  */
+
+/**
+ * TEST: testdisplay
+ * Category: Display
+ * Description: Tests basic display functionality.
+ */
+
 #include "config.h"
 
 #include "igt.h"
@@ -70,10 +77,6 @@
 #include <signal.h>
 
 /**
- * TEST: testdisplay
- * Category: Display
- * Description: Tests basic display functionality.
- *
  * SUBTEST:
  * Description: This test is intended for testing of display functionality like
  *              modeset, clone modes, test patterns & pixel generators etc..
@@ -82,6 +85,7 @@
  * Mega feature: General Display Features
  * Test category: functionality test
  */
+
 IGT_TEST_DESCRIPTION("Tests basic display functionality.");
 
 enum {
-- 
2.40.0
