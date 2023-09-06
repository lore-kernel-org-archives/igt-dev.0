Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB53110E6DF
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Sep 2023 18:10:09 +0000 (UTC)
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  6 Sep 2023 20:07:23 +0200
Message-ID: <20230906181001.498395-6-mauro.chehab@linux.intel.com>
In-Reply-To: <20230906181001.498395-1-mauro.chehab@linux.intel.com>
References: <20230906181001.498395-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 5/6] tests: Intel KMS: drop Run type field
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: tomasz.mistat@intel.com, jari.tahvanainen@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mauro Carvalho Chehab <mchehab@kernel.org>

Currently, the information should be on both places, but that
makes harder to maintain. In practice, only the testlists are
updated for intel-ci.

So, drop the explicit field data from the source files,
relying on intel-ci testlists and main blacklist.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/chamelium/kms_chamelium_audio.c  |   4 -
 tests/chamelium/kms_chamelium_color.c  |   3 -
 tests/chamelium/kms_chamelium_edid.c   |  10 --
 tests/chamelium/kms_chamelium_frames.c |  10 --
 tests/chamelium/kms_chamelium_hpd.c    |  25 ---
 tests/intel/kms_big_fb.c               |  12 --
 tests/intel/kms_big_joiner.c           |   3 -
 tests/intel/kms_busy.c                 |   5 -
 tests/intel/kms_ccs.c                  |   3 -
 tests/intel/kms_cdclk.c                |   3 -
 tests/intel/kms_draw_crc.c             |   3 -
 tests/intel/kms_dsc.c                  |   1 -
 tests/intel/kms_fb_coherency.c         |   1 -
 tests/intel/kms_fbcon_fbt.c            |   4 -
 tests/intel/kms_fence_pin_leak.c       |   1 -
 tests/intel/kms_flip_scaled_crc.c      |  19 ---
 tests/intel/kms_flip_tiling.c          |   1 -
 tests/intel/kms_frontbuffer_tracking.c | 206 -------------------------
 tests/intel/kms_legacy_colorkey.c      |   2 -
 tests/intel/kms_mmap_write_crc.c       |   1 -
 tests/intel/kms_pipe_b_c_ivb.c         |   5 -
 tests/intel/kms_psr.c                  |  19 ---
 tests/intel/kms_psr2_sf.c              |   8 -
 tests/intel/kms_psr2_su.c              |   2 -
 tests/intel/kms_psr_stress_test.c      |   2 -
 tests/intel/kms_pwrite_crc.c           |   1 -
 tests/kms_3d.c                         |   1 -
 tests/kms_addfb_basic.c                |  27 ----
 tests/kms_async_flips.c                |   6 -
 tests/kms_atomic.c                     |   8 -
 tests/kms_atomic_interruptible.c       |   5 -
 tests/kms_atomic_transition.c          |   7 -
 tests/kms_bw.c                         |   1 -
 tests/kms_color.c                      |   7 -
 tests/kms_concurrent.c                 |   1 -
 tests/kms_content_protection.c         |   7 -
 tests/kms_cursor_crc.c                 |   4 -
 tests/kms_cursor_edge_walk.c           |   1 -
 tests/kms_cursor_legacy.c              |  16 --
 tests/kms_display_modes.c              |   2 -
 tests/kms_dither.c                     |   2 -
 tests/kms_dp_aux_dev.c                 |   1 -
 tests/kms_flip.c                       |  26 ----
 tests/kms_flip_event_leak.c            |   1 -
 tests/kms_force_connector_basic.c      |   4 -
 tests/kms_getfb.c                      |   7 -
 tests/kms_hdmi_inject.c                |   2 -
 tests/kms_hdr.c                        |   8 -
 tests/kms_invalid_mode.c               |   1 -
 tests/kms_lease.c                      |  21 ---
 tests/kms_multipipe_modeset.c          |   1 -
 tests/kms_panel_fitting.c              |   2 -
 tests/kms_pipe_crc_basic.c             |   9 --
 tests/kms_plane.c                      |   6 -
 tests/kms_plane_alpha_blend.c          |   4 -
 tests/kms_plane_cursor.c               |   3 -
 tests/kms_plane_lowres.c               |   2 -
 tests/kms_plane_multiple.c             |   2 -
 tests/kms_plane_scaling.c              |  21 ---
 tests/kms_prime.c                      |   3 -
 tests/kms_prop_blob.c                  |   4 -
 tests/kms_properties.c                 |   2 -
 tests/kms_rmfb.c                       |   2 -
 tests/kms_rotation_crc.c               |  10 --
 tests/kms_scaling_modes.c              |   1 -
 tests/kms_selftest.c                   |   1 -
 tests/kms_sequence.c                   |   2 -
 tests/kms_setmode.c                    |   6 -
 tests/kms_sysfs_edid_timing.c          |   1 -
 tests/kms_tiled_display.c              |   2 -
 tests/kms_tv_load_detect.c             |   1 -
 tests/kms_universal_plane.c            |   4 -
 tests/kms_vblank.c                     |   9 --
 tests/kms_vrr.c                        |   5 -
 tests/kms_writeback.c                  |   4 -
 tests/testdisplay.c                    |   1 -
 76 files changed, 628 deletions(-)

diff --git a/tests/chamelium/kms_chamelium_audio.c b/tests/chamelium/kms_chamelium_audio.c
index 3dc33c9c9de7..34ba0cb64370 100644
--- a/tests/chamelium/kms_chamelium_audio.c
+++ b/tests/chamelium/kms_chamelium_audio.c
@@ -681,7 +681,6 @@ static bool check_audio_configuration(struct alsa *alsa,
  *              capture them and check they are correct
  * Functionality: chamelium, dp_audio
  * Mega feature: Audio, DP
- * Run type: FULL
  * Test category: functionality test
  * Driver requirement: i915, xe
  *
@@ -690,7 +689,6 @@ static bool check_audio_configuration(struct alsa *alsa,
  *              capture them and check they are correct
  * Functionality: chamelium, hdmi_audio
  * Mega feature: Audio, HDMI
- * Run type: FULL
  * Test category: functionality test
  * Driver requirement: i915, xe
  */
@@ -794,7 +792,6 @@ static void test_display_audio(chamelium_data_t *data,
  *              EDID-Like Data reports the correct audio parameters
  * Functionality: chamelium, dp_audio
  * Mega feature: Audio, DP
- * Run type: FULL
  * Test category: functionality test
  * Driver requirement: i915, xe
  *
@@ -803,7 +800,6 @@ static void test_display_audio(chamelium_data_t *data,
  *              EDID-Like Data reports the correct audio parameters
  * Functionality: chamelium, hdmi_audio
  * Mega feature: Audio, HDMI
- * Run type: FULL
  * Test category: functionality test
  * Driver requirement: i915, xe
  */
diff --git a/tests/chamelium/kms_chamelium_color.c b/tests/chamelium/kms_chamelium_color.c
index 125de9915d94..0a9788214a06 100644
--- a/tests/chamelium/kms_chamelium_color.c
+++ b/tests/chamelium/kms_chamelium_color.c
@@ -37,7 +37,6 @@ IGT_TEST_DESCRIPTION("Test Color Features at Pipe level using Chamelium to verif
  * Description: Verify that degamma LUT transformation works correctly
  * Functionality: chamelium, colorspace
  * Mega feature: Color mgmt
- * Run type: FULL
  * Test category: functionality test
  * Driver requirement: i915, xe
  */
@@ -135,7 +134,6 @@ static bool test_pipe_degamma(data_t *data,
  * Description: Verify that gamma LUT transformation works correctly
  * Functionality: chamelium, colorspace
  * Mega feature: Color mgmt
- * Run type: FULL
  * Test category: functionality test
  * Driver requirement: i915, xe
  */
@@ -494,7 +492,6 @@ run_gamma_degamma_tests_for_pipe(data_t *data, enum pipe p,
  * Description: Check the color transformation %arg[1]
  * Functionality: chamelium, colorspace
  * Mega feature: Color mgmt
- * Run type: FULL
  * Test category: functionality test
  * Driver requirement: i915, xe
  *
diff --git a/tests/chamelium/kms_chamelium_edid.c b/tests/chamelium/kms_chamelium_edid.c
index 8e730c8189b8..de8e51a04e3c 100644
--- a/tests/chamelium/kms_chamelium_edid.c
+++ b/tests/chamelium/kms_chamelium_edid.c
@@ -149,7 +149,6 @@ static void check_mode(struct chamelium *chamelium, struct chamelium_port *port,
  * SUBTEST: dp-edid-read
  * Description: Make sure the EDID exposed by KMS is the same as the screen's
  * Test category: functionality test
- * Run type: BAT
  * Functionality: chamelium, dp_edid
  * Mega feature: DP
  * Driver requirement: i915, xe
@@ -157,7 +156,6 @@ static void check_mode(struct chamelium *chamelium, struct chamelium_port *port,
  * SUBTEST: hdmi-edid-read
  * Description: Make sure the EDID exposed by KMS is the same as the screen's
  * Test category: functionality test
- * Run type: BAT
  * Functionality: chamelium, hdmi_edid
  * Mega feature: HDMI
  * Driver requirement: i915, xe
@@ -165,7 +163,6 @@ static void check_mode(struct chamelium *chamelium, struct chamelium_port *port,
  * SUBTEST: vga-edid-read
  * Description: Make sure the EDID exposed by KMS is the same as the screen's
  * Test category: functionality test
- * Run type: BAT
  * Functionality: chamelium, vga_edid
  * Mega feature: VGA
  * Driver requirement: i915, xe
@@ -215,7 +212,6 @@ static void igt_custom_edid_type_read(chamelium_data_t *data,
  *              the other, and ensure their validity by check the real screen
  *              resolution vs the advertised mode (%arg[1]) resolution.
  * Test category: functionality test
- * Run type: FULL
  * Functionality: chamelium, dp_edid
  * Mega feature: DP
  * Driver requirement: i915, xe
@@ -225,7 +221,6 @@ static void igt_custom_edid_type_read(chamelium_data_t *data,
  *              the other, and ensure their validity by check the real screen
  *              resolution vs the advertised mode (%arg[1]) resolution.
  * Test category: functionality test
- * Run type: FULL
  * Functionality: chamelium, hdmi_edid
  * Mega feature: HDMI
  * Driver requirement: i915, xe
@@ -310,7 +305,6 @@ static void edid_stress_resolution(chamelium_data_t *data,
  *              them on the screen and check the screen resolution matches the
  *              mode resolution.
  * Test category: functionality test
- * Run type: FULL
  * Functionality: chamelium, dp_edid
  * Mega feature: DP
  * Driver requirement: i915, xe
@@ -384,7 +378,6 @@ static void edid_resolution_list(chamelium_data_t *data,
  *              plugged during suspend, check that a uevent is sent and
  *              connector status is updated during %arg[1]
  * Test category: functionality test
- * Run type: FULL
  * Functionality: chamelium, dp_edid
  * Mega feature: DP
  * Driver requirement: i915, xe
@@ -394,7 +387,6 @@ static void edid_resolution_list(chamelium_data_t *data,
  *              plugged during suspend, check that a uevent is sent and
  *              connector status is updated during %arg[1]
  * Test category: functionality test
- * Run type: FULL
  * Functionality: chamelium, dp_edid
  * Mega feature: DP
  * Driver requirement: i915, xe
@@ -462,7 +454,6 @@ static void test_suspend_resume_edid_change(chamelium_data_t *data,
  *              the mode detected by the Chamelium receiver matches the mode we
  *              set
  * Test category: functionality test
- * Run type: FULL
  * Functionality: chamelium, dp_edid
  * Mega feature: DP
  * Driver requirement: i915, xe
@@ -472,7 +463,6 @@ static void test_suspend_resume_edid_change(chamelium_data_t *data,
  *              the mode detected by the Chamelium receiver matches the mode we
  *              set
  * Test category: functionality test
- * Run type: FULL
  * Functionality: chamelium, dp_edid
  * Mega feature: DP
  * Driver requirement: i915, xe
diff --git a/tests/chamelium/kms_chamelium_frames.c b/tests/chamelium/kms_chamelium_frames.c
index 20e108c2175e..a313cd4336dc 100644
--- a/tests/chamelium/kms_chamelium_frames.c
+++ b/tests/chamelium/kms_chamelium_frames.c
@@ -544,7 +544,6 @@ static void prepare_randomized_plane(chamelium_data_t *data,
  * Description: Pick the first mode of the IGT base EDID, display and capture
  * 		a few frames, then check captured frames are correct
  * Test category: functionality test
- * Run type: BAT
  * Functionality: chamelium, frame_integrity
  * Mega feature: DP
  * Driver requirement: i915, xe
@@ -553,7 +552,6 @@ static void prepare_randomized_plane(chamelium_data_t *data,
  * Description: Pick the first mode of the IGT base EDID, display and capture
  * 		a few frames, then check captured frames are correct
  * Test category: functionality test
- * Run type: BAT
  * Functionality: chamelium, frame_integrity
  * Mega feature: HDMI
  * Driver requirement: i915, xe
@@ -564,7 +562,6 @@ static void prepare_randomized_plane(chamelium_data_t *data,
  * Description: Pick the first mode of the IGT base EDID, display and capture a
  *              few frames, then check captured frames are correct
  * Test category: functionality test
- * Run type: FULL
  * Functionality: chamelium, frame_integrity
  * Mega feature: HDMI
  * Driver requirement: i915, xe
@@ -615,7 +612,6 @@ static void test_display_one_mode(chamelium_data_t *data,
  * Description: For each mode of the IGT base EDID, display and capture a few
  *              frames, then check captured frames are correct
  * Test category: functionality test
- * Run type: FULL
  * Functionality: chamelium, frame_integrity
  * Mega feature: VGA
  * Driver requirement: i915, xe
@@ -624,7 +620,6 @@ static void test_display_one_mode(chamelium_data_t *data,
  * Description: For each mode of the IGT base EDID, display and capture a %arg[1]
  *              frame(s), then check captured frame(s) are correct
  * Test category: functionality test
- * Run type: FULL
  * Functionality: chamelium, frame_integrity
  * Mega feature: DP
  * Driver requirement: i915, xe
@@ -633,7 +628,6 @@ static void test_display_one_mode(chamelium_data_t *data,
  * Description: For each mode of the IGT base EDID, display and capture a %arg[1]
  *              frame(s), then check captured frame(s) are correct
  * Test category: functionality test
- * Run type: FULL
  * Functionality: chamelium, frame_integrity
  * Mega feature: HDMI
  * Driver requirement: i915, xe
@@ -707,7 +701,6 @@ static void test_display_all_modes(chamelium_data_t *data,
  *              frames, then download the captured frames and compare them
  *              bit-by-bit to the sent ones
  * Test category: functionality test
- * Run type: FULL
  * Functionality: chamelium, frame_integrity
  * Mega feature: DP
  * Driver requirement: i915, xe
@@ -717,7 +710,6 @@ static void test_display_all_modes(chamelium_data_t *data,
  *              frames, then download the captured frames and compare them
  *              bit-by-bit to the sent ones
  * Test category: functionality test
- * Run type: BAT
  * Functionality: chamelium, frame_integrity
  * Mega feature: HDMI
  * Driver requirement: i915, xe
@@ -795,7 +787,6 @@ static void test_display_frame_dump(chamelium_data_t *data,
  * Description: Pick a mode with a picture aspect-ratio, capture AVI InfoFrames
  *              and check they include the relevant fields
  * Test category: functionality test
- * Run type: BAT
  * Functionality: chamelium, frame_integrity
  * Mega feature: HDMI
  * Driver requirement: i915, xe
@@ -885,7 +876,6 @@ static void test_display_aspect_ratio(chamelium_data_t *data,
  * Description: Setup a few overlay planes with random parameters, capture the
  *              frame and check it matches the expected output
  * Test category: functionality test
- * Run type: FULL
  * Functionality: chamelium, frame_integrity
  * Mega feature: HDMI
  * Driver requirement: i915, xe
diff --git a/tests/chamelium/kms_chamelium_hpd.c b/tests/chamelium/kms_chamelium_hpd.c
index 1599c0a6250f..f7a9422a990d 100644
--- a/tests/chamelium/kms_chamelium_hpd.c
+++ b/tests/chamelium/kms_chamelium_hpd.c
@@ -115,7 +115,6 @@ static void try_suspend_resume_hpd(chamelium_data_t *data,
  * Description: Check that we get uevents and updated connector status on
  * 		hotplug and unplug
  * Test category: functionality test
- * Run type: BAT, FULL
  * Functionality: chamelium, hotplug
  * Mega feature: DP
  * Driver requirement: i915, xe
@@ -124,7 +123,6 @@ static void try_suspend_resume_hpd(chamelium_data_t *data,
  * Description: Check that we get uevents and updated connector status on
  * 		hotplug and unplug
  * Test category: functionality test
- * Run type: BAT, FULL
  * Functionality: chamelium, hotplug
  * Mega feature: HDMI
  * Driver requirement: i915, xe
@@ -133,7 +131,6 @@ static void try_suspend_resume_hpd(chamelium_data_t *data,
  * Description: Check that we get uevents and updated connector status on
  * 		hotplug and unplug
  * Test category: functionality test
- * Run type: BAT, FULL
  * Functionality: chamelium, hotplug
  * Mega feature: VGA
  * Driver requirement: i915, xe
@@ -142,7 +139,6 @@ static void try_suspend_resume_hpd(chamelium_data_t *data,
  * Description: Check that we get uevents and updated connector status on
  *              hotplug and unplug
  * Test category: functionality test
- * Run type: FULL
  * Functionality: chamelium, hotplug
  * Mega feature: DP
  * Driver requirement: i915, xe
@@ -151,7 +147,6 @@ static void try_suspend_resume_hpd(chamelium_data_t *data,
  * Description: Check that we get uevents and updated connector status on
  *              hotplug and unplug
  * Test category: functionality test
- * Run type: FULL
  * Functionality: chamelium, hotplug
  * Mega feature: HDMI
  * Driver requirement: i915, xe
@@ -160,7 +155,6 @@ static void try_suspend_resume_hpd(chamelium_data_t *data,
  * Description: Check that we get uevents and updated connector status on
  *              hotplug and unplug
  * Test category: functionality test
- * Run type: FULL
  * Functionality: chamelium, hotplug
  * Mega feature: VGA
  * Driver requirement: i915, xe
@@ -169,7 +163,6 @@ static void try_suspend_resume_hpd(chamelium_data_t *data,
  * Description: Check that we get uevents and updated connector status on
  *              hotplug and unplug
  * Test category: functionality test
- * Run type: FULL
  * Functionality: chamelium, hotplug
  * Mega feature: DP
  * Driver requirement: i915, xe
@@ -178,7 +171,6 @@ static void try_suspend_resume_hpd(chamelium_data_t *data,
  * Description: Check that we get uevents and updated connector status on
  *              hotplug and unplug
  * Test category: functionality test
- * Run type: FULL
  * Functionality: chamelium, hotplug
  * Mega feature: HDMI
  * Driver requirement: i915, xe
@@ -187,7 +179,6 @@ static void try_suspend_resume_hpd(chamelium_data_t *data,
  * Description: Check that we get uevents and updated connector status on
  *              hotplug and unplug
  * Test category: functionality test
- * Run type: FULL
  * Functionality: chamelium, hotplug
  * Mega feature: VGA
  * Driver requirement: i915, xe
@@ -268,7 +259,6 @@ static void test_hotplug(chamelium_data_t *data, struct chamelium_port *port,
  * Description: Check that we get uevents and updated connector status on
  *              hotplug and unplug for each pipe with valid output
  * Test category: functionality test
- * Run type: FULL
  * Functionality: chamelium, hotplug
  * Mega feature: DP
  * Driver requirement: i915, xe
@@ -277,7 +267,6 @@ static void test_hotplug(chamelium_data_t *data, struct chamelium_port *port,
  * Description: Check that we get uevents and updated connector status on
  *              hotplug and unplug for each pipe with valid output
  * Test category: functionality test
- * Run type: FULL
  * Functionality: chamelium, hotplug
  * Mega feature: HDMI
  * Driver requirement: i915, xe
@@ -286,7 +275,6 @@ static void test_hotplug(chamelium_data_t *data, struct chamelium_port *port,
  * Description: Check that we get uevents and updated connector status on
  *              hotplug and unplug for each pipe with valid output
  * Test category: functionality test
- * Run type: FULL
  * Functionality: chamelium, hotplug
  * Mega feature: VGA
  * Driver requirement: i915, xe
@@ -341,7 +329,6 @@ static void test_hotplug_for_each_pipe(chamelium_data_t *data,
  * Description: Toggle HPD during Hibernation, check that uevents are sent and
  *              connector status is updated
  * Test category: functionality test
- * Run type: FULL
  * Functionality: chamelium, hotplug, hibernation
  * Mega feature: DP
  * Driver requirement: i915, xe
@@ -350,7 +337,6 @@ static void test_hotplug_for_each_pipe(chamelium_data_t *data,
  * Description: Toggle HPD during Hibernation, check that uevents are sent and
  *              connector status is updated
  * Test category: functionality test
- * Run type: FULL
  * Functionality: chamelium, hotplug, hibernation
  * Mega feature: HDMI
  * Driver requirement: i915, xe
@@ -359,7 +345,6 @@ static void test_hotplug_for_each_pipe(chamelium_data_t *data,
  * Description: Toggle HPD during Hibernation, check that uevents are sent and
  *              connector status is updated
  * Test category: functionality test
- * Run type: FULL
  * Functionality: chamelium, hotplug, hibernation
  * Mega feature: VGA
  * Driver requirement: i915, xe
@@ -368,7 +353,6 @@ static void test_hotplug_for_each_pipe(chamelium_data_t *data,
  * Description: Toggle HPD during Suspend, check that uevents are sent and
  *              connector status is updated
  * Test category: functionality test
- * Run type: FULL
  * Functionality: chamelium, hotplug, suspend
  * Mega feature: DP
  * Driver requirement: i915, xe
@@ -377,7 +361,6 @@ static void test_hotplug_for_each_pipe(chamelium_data_t *data,
  * Description: Toggle HPD during Suspend, check that uevents are sent and
  *              connector status is updated
  * Test category: functionality test
- * Run type: FULL
  * Functionality: chamelium, hotplug, suspend
  * Mega feature: HDMI
  * Driver requirement: i915, xe
@@ -386,7 +369,6 @@ static void test_hotplug_for_each_pipe(chamelium_data_t *data,
  * Description: Toggle HPD during Suspend, check that uevents are sent and
  *              connector status is updated
  * Test category: functionality test
- * Run type: FULL
  * Functionality: chamelium, hotplug, suspend
  * Mega feature: VGA
  * Driver requirement: i915, xe
@@ -419,7 +401,6 @@ static void test_suspend_resume_hpd(chamelium_data_t *data,
  * Description: Toggle HPD during suspend on all connectors, check that uevents
  * 		are sent and connector status is updated
  * Test category: functionality test
- * Run type: BAT, FULL
  * Functionality: chamelium, hotplug, suspend
  * Mega feature: General Display Features
  * Driver requirement: i915, xe
@@ -428,7 +409,6 @@ static void test_suspend_resume_hpd(chamelium_data_t *data,
  * Description: Toggle HPD during suspend on all connectors, check that uevents
  *              are sent and connector status is updated
  * Test category: functionality test
- * Run type: FULL
  * Functionality: chamelium, hotplug, hibernation
  * Mega feature: General Display Features
  * Driver requirement: i915, xe
@@ -467,7 +447,6 @@ static void test_suspend_resume_hpd_common(chamelium_data_t *data,
  * Description: Disable DDC on a VGA connector, check we still get a uevent on
  *              hotplug
  * Test category: functionality test
- * Run type: FULL
  * Functionality: chamelium, hotplug
  * Mega feature: VGA
  * Driver requirement: i915, xe
@@ -504,7 +483,6 @@ static void test_hpd_without_ddc(chamelium_data_t *data,
  *              simulate abad cable, check the kernel falls back to polling
  *              to avoid a hotplug storm
  * Test category: functionality test
- * Run type: FULL
  * Functionality: chamelium, hotplug
  * Mega feature: DP
  * Driver requirement: i915, xe
@@ -514,7 +492,6 @@ static void test_hpd_without_ddc(chamelium_data_t *data,
  *              simulate abad cable, check the kernel falls back to polling
  *              to avoid a hotplug storm
  * Test category: functionality test
- * Run type: FULL
  * Functionality: chamelium, hotplug
  * Mega feature: HDMI
  * Driver requirement: i915, xe
@@ -558,7 +535,6 @@ static void test_hpd_storm_detect(chamelium_data_t *data,
  * Description: Disable HPD storm detection, trigger a storm and check the
  *              kernel doesn't detect one
  * Test category: functionality test
- * Run type: FULL
  * Functionality: chamelium, hotplug
  * Mega feature: DP
  * Driver requirement: i915, xe
@@ -567,7 +543,6 @@ static void test_hpd_storm_detect(chamelium_data_t *data,
  * Description: Disable HPD storm detection, trigger a storm and check the
  *              kernel doesn't detect one
  * Test category: functionality test
- * Run type: FULL
  * Functionality: chamelium, hotplug
  * Mega feature: HDMI
  * Driver requirement: i915, xe
diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
index 025e28df00fc..611e60896c8e 100644
--- a/tests/intel/kms_big_fb.c
+++ b/tests/intel/kms_big_fb.c
@@ -595,7 +595,6 @@ max_hw_stride_async_flip_test(data_t *data)
  * Driver requirement: i915, xe
  * Functionality: big_fbs, kms_gem_interop, rotation
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1].values:       8, 16, 32, 64
@@ -609,7 +608,6 @@ max_hw_stride_async_flip_test(data_t *data)
  * Driver requirement: i915, xe
  * Functionality: big_fbs, kms_gem_interop, rotation, tiling
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -631,7 +629,6 @@ max_hw_stride_async_flip_test(data_t *data)
  * Driver requirement: i915, xe
  * Functionality: big_fbs, kms_gem_interop, rotation
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1].values:       32, 64
@@ -646,7 +643,6 @@ max_hw_stride_async_flip_test(data_t *data)
  * Driver requirement: i915, xe
  * Functionality: big_fbs, kms_gem_interop, rotation, tiling
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -668,7 +664,6 @@ max_hw_stride_async_flip_test(data_t *data)
  * Driver requirement: i915, xe
  * Functionality: big_fbs, kms_gem_interop, rotation, tiling
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: %s-max-hw-stride-%dbpp-rotate-%d-%s
@@ -678,7 +673,6 @@ max_hw_stride_async_flip_test(data_t *data)
  * Driver requirement: i915, xe
  * Functionality: async_flips, big_fbs, kms_gem_interop, rotation, tiling
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -748,7 +742,6 @@ static void test_scanout(data_t *data)
  * Driver requirement: i915, xe
  * Functionality: big_fbs, kms_gem_interop
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: %s-addfb-size-overflow
@@ -757,7 +750,6 @@ static void test_scanout(data_t *data)
  * Driver requirement: i915, xe
  * Functionality: big_fbs, kms_gem_interop, tiling
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -818,7 +810,6 @@ test_size_overflow(data_t *data)
  * Driver requirement: i915, xe
  * Functionality: big_fbs, kms_gem_interop
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: %s-addfb-size-offset-overflow
@@ -827,7 +818,6 @@ test_size_overflow(data_t *data)
  * Driver requirement: i915, xe
  * Functionality: big_fbs, kms_gem_interop, tiling
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -902,7 +892,6 @@ static int rmfb(int fd, uint32_t id)
  * Driver requirement: i915, xe
  * Functionality: big_fbs, kms_gem_interop
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: %s-addfb
@@ -911,7 +900,6 @@ static int rmfb(int fd, uint32_t id)
  * Driver requirement: i915, xe
  * Functionality: big_fbs, kms_gem_interop, tiling
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
diff --git a/tests/intel/kms_big_joiner.c b/tests/intel/kms_big_joiner.c
index ae38e02c56b6..a555ca7995f0 100644
--- a/tests/intel/kms_big_joiner.c
+++ b/tests/intel/kms_big_joiner.c
@@ -52,7 +52,6 @@ typedef struct {
  * Driver requirement: i915, xe
  * Functionality: 2p1p
  * Mega feature: Bigjoiner
- * Run type: FULL
  * Test category: functionality test
  */
 static void test_invalid_modeset(data_t *data)
@@ -101,7 +100,6 @@ static void test_invalid_modeset(data_t *data)
  * Driver requirement: i915, xe
  * Functionality: 2p1p
  * Mega feature: Bigjoiner
- * Run type: FULL
  * Test category: functionality test
  */
 static void test_basic_modeset(data_t *data)
@@ -148,7 +146,6 @@ static void test_basic_modeset(data_t *data)
  * Driver requirement: i915, xe
  * Functionality: 2p1p
  * Mega feature: Bigjoiner
- * Run type: FULL
  * Test category: functionality test
  */
 static void test_dual_display(data_t *data)
diff --git a/tests/intel/kms_busy.c b/tests/intel/kms_busy.c
index a1f51775891b..5b620658fb18 100644
--- a/tests/intel/kms_busy.c
+++ b/tests/intel/kms_busy.c
@@ -142,7 +142,6 @@ static void flip_to_fb(igt_display_t *dpy, int pipe,
  * Driver requirement: i915
  * Functionality: kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: basic-hang
@@ -150,7 +149,6 @@ static void flip_to_fb(igt_display_t *dpy, int pipe,
  * Driver requirement: i915
  * Functionality: kms_core, hang
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  */
 static void test_flip(igt_display_t *dpy, int pipe,
@@ -251,7 +249,6 @@ static void test_atomic_commit_hang(igt_display_t *dpy, igt_plane_t *primary,
  * Driver requirement: i915
  * Functionality: kms_core, hang
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -268,7 +265,6 @@ static void test_atomic_commit_hang(igt_display_t *dpy, igt_plane_t *primary,
  * Driver requirement: i915
  * Functionality: kms_core, hang
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -329,7 +325,6 @@ static void test_hang(igt_display_t *dpy,
  * Driver requirement: i915
  * Functionality: kms_core, hang
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  */
 static void
diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
index 976aedb06e80..e2bb5a0670f3 100644
--- a/tests/intel/kms_ccs.c
+++ b/tests/intel/kms_ccs.c
@@ -39,7 +39,6 @@
  * Driver requirement: i915, xe
  * Functionality: ccs, tiling
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -77,7 +76,6 @@
  * Driver requirement: i915, xe
  * Functionality: ccs, tiling
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -119,7 +117,6 @@
  * Driver requirement: i915, xe
  * Functionality: ccs, rotation, tiling
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c
index 237f28f007d1..71d827dacd0c 100644
--- a/tests/intel/kms_cdclk.c
+++ b/tests/intel/kms_cdclk.c
@@ -260,7 +260,6 @@ static void test_mode_transition(data_t *data, enum pipe pipe, igt_output_t *out
  * Driver requirement: i915, xe
  * Functionality: kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  */
 static void test_mode_transition_on_all_outputs(data_t *data)
@@ -365,7 +364,6 @@ static void test_mode_transition_on_all_outputs(data_t *data)
  * Driver requirement: i915, xe
  * Functionality: kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: plane-scaling
@@ -373,7 +371,6 @@ static void test_mode_transition_on_all_outputs(data_t *data)
  * Driver requirement: i915, xe
  * Functionality: kms_core, plane, scaling
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  */
 static void run_cdclk_test(data_t *data, uint32_t flags)
diff --git a/tests/intel/kms_draw_crc.c b/tests/intel/kms_draw_crc.c
index ee1980552f7b..086f64dc8e68 100644
--- a/tests/intel/kms_draw_crc.c
+++ b/tests/intel/kms_draw_crc.c
@@ -150,7 +150,6 @@ static void get_method_crc(enum igt_draw_method method, uint32_t drm_format,
  * Driver requirement: i915, xe
  * Functionality: kms_core, tiling
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -167,7 +166,6 @@ static void get_method_crc(enum igt_draw_method method, uint32_t drm_format,
  * Driver requirement: i915
  * Functionality: kms_core, tiling
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -221,7 +219,6 @@ static void get_fill_crc(uint64_t modifier, igt_crc_t *crc)
  * Driver requirement: i915, xe
  * Functionality: kms_core, tiling
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  */
 static void fill_fb_subtest(void)
diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
index 41e1d95197f9..c7dfb509a877 100644
--- a/tests/intel/kms_dsc.c
+++ b/tests/intel/kms_dsc.c
@@ -44,7 +44,6 @@
  * Driver requirement: i915, xe
  * Functionality: dsc
  * Mega feature: VDSC
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
diff --git a/tests/intel/kms_fb_coherency.c b/tests/intel/kms_fb_coherency.c
index c772ddcdce26..d0c0df9eefb6 100644
--- a/tests/intel/kms_fb_coherency.c
+++ b/tests/intel/kms_fb_coherency.c
@@ -247,7 +247,6 @@ igt_main
 	 * Mega feature: General Display Features
 	 * Functionality: kms_core
 	 * Driver requirement: i915, xe
-	 * Run type: FULL
 	 * Test category: functionality test
 	 */
 	igt_subtest_with_dynamic("memset-crc") {
diff --git a/tests/intel/kms_fbcon_fbt.c b/tests/intel/kms_fbcon_fbt.c
index 2cb0ffdb4073..e017d5887ee0 100644
--- a/tests/intel/kms_fbcon_fbt.c
+++ b/tests/intel/kms_fbcon_fbt.c
@@ -44,7 +44,6 @@
  * Driver requirement: i915, xe
  * Functionality: fbc, fbcon, fbt
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbc-suspend
@@ -53,7 +52,6 @@
  * Driver requirement: i915, xe
  * Functionality: fbc, fbcon, fbt, suspend
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: psr
@@ -62,7 +60,6 @@
  * Driver requirement: i915, xe
  * Functionality: fbcon, fbt, psr
  * Mega feature: PSR
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: psr-suspend
@@ -71,7 +68,6 @@
  * Driver requirement: i915, xe
  * Functionality: fbcon, fbt, psr, suspend
  * Mega feature: PSR
- * Run type: FULL
  * Test category: functionality test
  */
 
diff --git a/tests/intel/kms_fence_pin_leak.c b/tests/intel/kms_fence_pin_leak.c
index 3db5767af25e..03f3990c4c8f 100644
--- a/tests/intel/kms_fence_pin_leak.c
+++ b/tests/intel/kms_fence_pin_leak.c
@@ -40,7 +40,6 @@
  * Driver requirement: i915
  * Functionality: kms_core, synchronization
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  */
 
diff --git a/tests/intel/kms_flip_scaled_crc.c b/tests/intel/kms_flip_scaled_crc.c
index 3d7991890e33..2997b63fac40 100644
--- a/tests/intel/kms_flip_scaled_crc.c
+++ b/tests/intel/kms_flip_scaled_crc.c
@@ -36,7 +36,6 @@
  * Driver requirement: i915, xe
  * Functionality: ccs, scaling, tiling, vblank
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling
@@ -45,7 +44,6 @@
  * Driver requirement: i915, xe
  * Functionality: ccs, scaling, tiling, vblank
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: flip-32bpp-linear-to-64bpp-linear-%s
@@ -54,7 +52,6 @@
  * Driver requirement: i915, xe
  * Functionality: scaling, vblank
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-%s
@@ -63,7 +60,6 @@
  * Driver requirement: i915, xe
  * Functionality: ccs, scaling, tiling, vblank
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: flip-32bpp-4tile-to-64bpp-4tile-%s
@@ -72,7 +68,6 @@
  * Driver requirement: i915, xe
  * Functionality: scaling, tiling, vblank
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: flip-32bpp-xtile-to-64bpp-xtile-%s
@@ -81,7 +76,6 @@
  * Driver requirement: i915, xe
  * Functionality: scaling, tiling, vblank
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: flip-32bpp-yftile-to-32bpp-yftileccs-%s
@@ -90,7 +84,6 @@
  * Driver requirement: i915, xe
  * Functionality: ccs, scaling, tiling, vblank
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: flip-32bpp-yftile-to-64bpp-yftile-%s
@@ -99,7 +92,6 @@
  * Driver requirement: i915, xe
  * Functionality: scaling, tiling, vblank
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: flip-32bpp-yftileccs-to-64bpp-yftile-%s
@@ -108,7 +100,6 @@
  * Driver requirement: i915, xe
  * Functionality: ccs, scaling, tiling, vblank
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: flip-32bpp-ytile-to-32bpp-ytileccs-%s
@@ -117,7 +108,6 @@
  * Driver requirement: i915, xe
  * Functionality: ccs, scaling, tiling, vblank
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-%s
@@ -126,7 +116,6 @@
  * Driver requirement: i915, xe
  * Functionality: ccs, scaling, tiling, vblank
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: flip-32bpp-ytile-to-64bpp-ytile-%s
@@ -135,7 +124,6 @@
  * Driver requirement: i915, xe
  * Functionality: scaling, tiling, vblank
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: flip-32bpp-ytileccs-to-64bpp-ytile-%s
@@ -144,7 +132,6 @@
  * Driver requirement: i915, xe
  * Functionality: ccs, scaling, tiling, vblank
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-%s
@@ -153,7 +140,6 @@
  * Driver requirement: i915, xe
  * Functionality: ccs, scaling, tiling, vblank
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -169,7 +155,6 @@
  * Driver requirement: i915, xe
  * Functionality: scaling, tiling, vblank
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: flip-64bpp-xtile-to-%dbpp-xtile-%s
@@ -178,7 +163,6 @@
  * Driver requirement: i915, xe
  * Functionality: scaling, tiling, vblank
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: flip-64bpp-yftile-to-%dbpp-yftile-%s
@@ -187,7 +171,6 @@
  * Driver requirement: i915, xe
  * Functionality: scaling, tiling, vblank
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: flip-64bpp-ytile-to-%dbpp-ytile-%s
@@ -196,7 +179,6 @@
  * Driver requirement: i915, xe
  * Functionality: scaling, tiling, vblank
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: flip-64bpp-linear-to-%dbpp-linear-%s
@@ -205,7 +187,6 @@
  * Driver requirement: i915, xe
  * Functionality: scaling, tiling, vblank
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1].values: 16, 32
diff --git a/tests/intel/kms_flip_tiling.c b/tests/intel/kms_flip_tiling.c
index d30f73a7f438..44121d7cf5d0 100644
--- a/tests/intel/kms_flip_tiling.c
+++ b/tests/intel/kms_flip_tiling.c
@@ -40,7 +40,6 @@
  * Driver requirement: i915, xe
  * Functionality: kms_gem_interop, tiling
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  */
 
diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index 40b3d4cb5d4f..215ecdeef58d 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -1857,7 +1857,6 @@ static void prepare_subtest(const struct test_mode *t,
  * Driver requirement: i915, xe
  * Functionality: fbt, drrs
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbc-%dp-rte
@@ -1865,7 +1864,6 @@ static void prepare_subtest(const struct test_mode *t,
  * Driver requirement: i915, xe
  * Functionality: fbc, fbt
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: psr-%dp-rte
@@ -1873,7 +1871,6 @@ static void prepare_subtest(const struct test_mode *t,
  * Driver requirement: i915, xe
  * Functionality: fbt, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcdrrs-%dp-rte
@@ -1881,7 +1878,6 @@ static void prepare_subtest(const struct test_mode *t,
  * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcpsr-%dp-rte
@@ -1889,7 +1885,6 @@ static void prepare_subtest(const struct test_mode *t,
  * Driver requirement: i915, xe
  * Functionality: fbc, fbt, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: psrdrrs-%dp-rte
@@ -1897,7 +1892,6 @@ static void prepare_subtest(const struct test_mode *t,
  * Driver requirement: i915, xe
  * Functionality: fbt, drrs, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcpsrdrrs-%dp-rte
@@ -1905,7 +1899,6 @@ static void prepare_subtest(const struct test_mode *t,
  * Driver requirement: i915, xe
  * Functionality: fbc, fbt, drrs, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1].values:   1, 2
@@ -1977,7 +1970,6 @@ static bool op_disables_psr(const struct test_mode *t,
  * Driver requirement: i915, xe
  * Functionality: drrs, fbt, kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbc-1p-offscren-pri-%s-draw-%s
@@ -1985,7 +1977,6 @@ static bool op_disables_psr(const struct test_mode *t,
  * Driver requirement: i915, xe
  * Functionality: fbc, fbt, kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: psr-1p-offscren-pri-%s-draw-%s
@@ -1993,7 +1984,6 @@ static bool op_disables_psr(const struct test_mode *t,
  * Driver requirement: i915, xe
  * Functionality: fbt, kms_core, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcdrrs-1p-offscren-pri-%s-draw-%s
@@ -2001,7 +1991,6 @@ static bool op_disables_psr(const struct test_mode *t,
  * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt, kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcpsr-1p-offscren-pri-%s-draw-%s
@@ -2009,7 +1998,6 @@ static bool op_disables_psr(const struct test_mode *t,
  * Driver requirement: i915, xe
  * Functionality: fbc, fbt, kms_core, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: psrdrrs-1p-offscren-pri-%s-draw-%s
@@ -2017,7 +2005,6 @@ static bool op_disables_psr(const struct test_mode *t,
  * Driver requirement: i915, xe
  * Functionality: drrs, fbt, kms_core, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcpsrdrrs-1p-offscren-pri-%s-draw-%s
@@ -2025,7 +2012,6 @@ static bool op_disables_psr(const struct test_mode *t,
  * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt, kms_core, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -2046,7 +2032,6 @@ static bool op_disables_psr(const struct test_mode *t,
  * Driver requirement: i915
  * Functionality: drrs, fbt, kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbc-1p-offscren-pri-%s-draw-%s
@@ -2054,7 +2039,6 @@ static bool op_disables_psr(const struct test_mode *t,
  * Driver requirement: i915
  * Functionality: fbc, fbt, kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: psr-1p-offscren-pri-%s-draw-%s
@@ -2062,7 +2046,6 @@ static bool op_disables_psr(const struct test_mode *t,
  * Driver requirement: i915
  * Functionality: fbt, kms_core, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcdrrs-1p-offscren-pri-%s-draw-%s
@@ -2070,7 +2053,6 @@ static bool op_disables_psr(const struct test_mode *t,
  * Driver requirement: i915
  * Functionality: drrs, fbc, fbt, kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcpsr-1p-offscren-pri-%s-draw-%s
@@ -2078,7 +2060,6 @@ static bool op_disables_psr(const struct test_mode *t,
  * Driver requirement: i915
  * Functionality: fbc, fbt, kms_core, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: psrdrrs-1p-offscren-pri-%s-draw-%s
@@ -2086,7 +2067,6 @@ static bool op_disables_psr(const struct test_mode *t,
  * Driver requirement: i915
  * Functionality: drrs, fbt, kms_core, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcpsrdrrs-1p-offscren-pri-%s-draw-%s
@@ -2094,7 +2074,6 @@ static bool op_disables_psr(const struct test_mode *t,
  * Driver requirement: i915
  * Functionality: drrs, fbc, fbt, kms_core, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -2115,7 +2094,6 @@ static bool op_disables_psr(const struct test_mode *t,
  * Driver requirement: i915
  * Functionality: drrs, fbt, kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbc-%dp-primscrn-%s-indfb-draw-%s
@@ -2123,7 +2101,6 @@ static bool op_disables_psr(const struct test_mode *t,
  * Driver requirement: i915
  * Functionality: fbc, fbt, kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: psr-%dp-primscrn-%s-indfb-draw-%s
@@ -2131,7 +2108,6 @@ static bool op_disables_psr(const struct test_mode *t,
  * Driver requirement: i915
  * Functionality: fbt, kms_core, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcdrrs-%dp-primscrn-%s-indfb-draw-%s
@@ -2139,7 +2115,6 @@ static bool op_disables_psr(const struct test_mode *t,
  * Driver requirement: i915
  * Functionality: drrs, fbc, fbt, kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcpsr-%dp-primscrn-%s-indfb-draw-%s
@@ -2147,7 +2122,6 @@ static bool op_disables_psr(const struct test_mode *t,
  * Driver requirement: i915
  * Functionality: fbc, fbt, kms_core, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: psrdrrs-%dp-primscrn-%s-indfb-draw-%s
@@ -2155,7 +2129,6 @@ static bool op_disables_psr(const struct test_mode *t,
  * Driver requirement: i915
  * Functionality: drrs, fbt, kms_core, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcpsrdrrs-%dp-primscrn-%s-indfb-draw-%s
@@ -2163,7 +2136,6 @@ static bool op_disables_psr(const struct test_mode *t,
  * Driver requirement: i915
  * Functionality: drrs, fbc, fbt, kms_core, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1].values:   1, 2
@@ -2187,7 +2159,6 @@ static bool op_disables_psr(const struct test_mode *t,
  * Driver requirement: i915, xe
  * Functionality: drrs, fbt, kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbc-%dp-primscrn-%s-indfb-draw-%s
@@ -2195,7 +2166,6 @@ static bool op_disables_psr(const struct test_mode *t,
  * Driver requirement: i915, xe
  * Functionality: fbc, fbt, kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: psr-%dp-primscrn-%s-indfb-draw-%s
@@ -2203,7 +2173,6 @@ static bool op_disables_psr(const struct test_mode *t,
  * Driver requirement: i915, xe
  * Functionality: fbt, kms_core, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcdrrs-%dp-primscrn-%s-indfb-draw-%s
@@ -2211,7 +2180,6 @@ static bool op_disables_psr(const struct test_mode *t,
  * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt, kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcpsr-%dp-primscrn-%s-indfb-draw-%s
@@ -2219,7 +2187,6 @@ static bool op_disables_psr(const struct test_mode *t,
  * Driver requirement: i915, xe
  * Functionality: fbc, fbt, kms_core, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: psrdrrs-%dp-primscrn-%s-indfb-draw-%s
@@ -2227,7 +2194,6 @@ static bool op_disables_psr(const struct test_mode *t,
  * Driver requirement: i915, xe
  * Functionality: drrs, fbt, kms_core, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcpsrdrrs-%dp-primscrn-%s-indfb-draw-%s
@@ -2235,7 +2201,6 @@ static bool op_disables_psr(const struct test_mode *t,
  * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt, kms_core, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1].values:   1, 2
@@ -2259,7 +2224,6 @@ static bool op_disables_psr(const struct test_mode *t,
  * Driver requirement: i915, xe
  * Functionality: drrs, fbt, kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbc-%dp-primscrn-pri-shrfb-draw-%s
@@ -2267,7 +2231,6 @@ static bool op_disables_psr(const struct test_mode *t,
  * Driver requirement: i915, xe
  * Functionality: fbc, fbt, kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: psr-%dp-primscrn-pri-shrfb-draw-%s
@@ -2275,7 +2238,6 @@ static bool op_disables_psr(const struct test_mode *t,
  * Driver requirement: i915, xe
  * Functionality: fbt, kms_core, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcdrrs-%dp-primscrn-pri-shrfb-draw-%s
@@ -2283,7 +2245,6 @@ static bool op_disables_psr(const struct test_mode *t,
  * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt, kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcpsr-%dp-primscrn-pri-shrfb-draw-%s
@@ -2291,7 +2252,6 @@ static bool op_disables_psr(const struct test_mode *t,
  * Driver requirement: i915, xe
  * Functionality: fbc, fbt, kms_core, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: psrdrrs-%dp-primscrn-pri-shrfb-draw-%s
@@ -2299,7 +2259,6 @@ static bool op_disables_psr(const struct test_mode *t,
  * Driver requirement: i915, xe
  * Functionality: drrs, fbt, kms_core, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcpsrdrrs-%dp-primscrn-pri-shrfb-draw-%s
@@ -2307,7 +2266,6 @@ static bool op_disables_psr(const struct test_mode *t,
  * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt, kms_core, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1].values:   1, 2
@@ -2325,7 +2283,6 @@ static bool op_disables_psr(const struct test_mode *t,
  * Driver requirement: i915
  * Functionality: drrs, fbt, kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbc-%dp-primscrn-pri-shrfb-draw-%s
@@ -2333,7 +2290,6 @@ static bool op_disables_psr(const struct test_mode *t,
  * Driver requirement: i915
  * Functionality: fbc, fbt, kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: psr-%dp-primscrn-pri-shrfb-draw-%s
@@ -2341,7 +2297,6 @@ static bool op_disables_psr(const struct test_mode *t,
  * Driver requirement: i915
  * Functionality: fbt, kms_core, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcdrrs-%dp-primscrn-pri-shrfb-draw-%s
@@ -2349,7 +2304,6 @@ static bool op_disables_psr(const struct test_mode *t,
  * Driver requirement: i915
  * Functionality: drrs, fbc, fbt, kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcpsr-%dp-primscrn-pri-shrfb-draw-%s
@@ -2357,7 +2311,6 @@ static bool op_disables_psr(const struct test_mode *t,
  * Driver requirement: i915
  * Functionality: fbc, fbt, kms_core, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: psrdrrs-%dp-primscrn-pri-shrfb-draw-%s
@@ -2365,7 +2318,6 @@ static bool op_disables_psr(const struct test_mode *t,
  * Driver requirement: i915
  * Functionality: drrs, fbt, kms_core, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcpsrdrrs-%dp-primscrn-pri-shrfb-draw-%s
@@ -2373,7 +2325,6 @@ static bool op_disables_psr(const struct test_mode *t,
  * Driver requirement: i915
  * Functionality: drrs, fbc, fbt, kms_core, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1].values:   1, 2
@@ -2391,7 +2342,6 @@ static bool op_disables_psr(const struct test_mode *t,
  * Driver requirement: i915, xe
  * Functionality: drrs, fbt, kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbc-2p-scndscrn-%s-indfb-draw-%s
@@ -2399,7 +2349,6 @@ static bool op_disables_psr(const struct test_mode *t,
  * Driver requirement: i915, xe
  * Functionality: fbc, fbt, kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: psr-2p-scndscrn-%s-indfb-draw-%s
@@ -2407,7 +2356,6 @@ static bool op_disables_psr(const struct test_mode *t,
  * Driver requirement: i915, xe
  * Functionality: fbt, kms_core, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcdrrs-2p-scndscrn-%s-indfb-draw-%s
@@ -2415,7 +2363,6 @@ static bool op_disables_psr(const struct test_mode *t,
  * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt, kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcpsr-2p-scndscrn-%s-indfb-draw-%s
@@ -2423,7 +2370,6 @@ static bool op_disables_psr(const struct test_mode *t,
  * Driver requirement: i915, xe
  * Functionality: fbc, fbt, kms_core, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: psrdrrs-2p-scndscrn-%s-indfb-draw-%s
@@ -2431,7 +2377,6 @@ static bool op_disables_psr(const struct test_mode *t,
  * Driver requirement: i915, xe
  * Functionality: drrs, fbt, kms_core, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcpsrdrrs-2p-scndscrn-%s-indfb-draw-%s
@@ -2439,7 +2384,6 @@ static bool op_disables_psr(const struct test_mode *t,
  * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt, kms_core, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -2461,7 +2405,6 @@ static bool op_disables_psr(const struct test_mode *t,
  * Driver requirement: i915
  * Functionality: drrs, fbt, kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbc-2p-scndscrn-%s-indfb-draw-%s
@@ -2469,7 +2412,6 @@ static bool op_disables_psr(const struct test_mode *t,
  * Driver requirement: i915
  * Functionality: fbc, fbt, kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: psr-2p-scndscrn-%s-indfb-draw-%s
@@ -2477,7 +2419,6 @@ static bool op_disables_psr(const struct test_mode *t,
  * Driver requirement: i915
  * Functionality: fbt, kms_core, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcdrrs-2p-scndscrn-%s-indfb-draw-%s
@@ -2485,7 +2426,6 @@ static bool op_disables_psr(const struct test_mode *t,
  * Driver requirement: i915
  * Functionality: drrs, fbc, fbt, kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcpsr-2p-scndscrn-%s-indfb-draw-%s
@@ -2493,7 +2433,6 @@ static bool op_disables_psr(const struct test_mode *t,
  * Driver requirement: i915
  * Functionality: fbc, fbt, kms_core, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: psrdrrs-2p-scndscrn-%s-indfb-draw-%s
@@ -2501,7 +2440,6 @@ static bool op_disables_psr(const struct test_mode *t,
  * Driver requirement: i915
  * Functionality: drrs, fbt, kms_core, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcpsrdrrs-2p-scndscrn-%s-indfb-draw-%s
@@ -2509,7 +2447,6 @@ static bool op_disables_psr(const struct test_mode *t,
  * Driver requirement: i915
  * Functionality: drrs, fbc, fbt, kms_core, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -2531,7 +2468,6 @@ static bool op_disables_psr(const struct test_mode *t,
  * Driver requirement: i915, xe
  * Functionality: drrs, fbt, kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbc-2p-scndscrn-pri-shrfb-draw-%s
@@ -2539,7 +2475,6 @@ static bool op_disables_psr(const struct test_mode *t,
  * Driver requirement: i915, xe
  * Functionality: fbc, fbt, kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: psr-2p-scndscrn-pri-shrfb-draw-%s
@@ -2547,7 +2482,6 @@ static bool op_disables_psr(const struct test_mode *t,
  * Driver requirement: i915, xe
  * Functionality: fbt, kms_core, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcdrrs-2p-scndscrn-pri-shrfb-draw-%s
@@ -2555,7 +2489,6 @@ static bool op_disables_psr(const struct test_mode *t,
  * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt, kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcpsr-2p-scndscrn-pri-shrfb-draw-%s
@@ -2563,7 +2496,6 @@ static bool op_disables_psr(const struct test_mode *t,
  * Driver requirement: i915, xe
  * Functionality: fbc, fbt, kms_core, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: psrdrrs-2p-scndscrn-pri-shrfb-draw-%s
@@ -2571,7 +2503,6 @@ static bool op_disables_psr(const struct test_mode *t,
  * Driver requirement: i915, xe
  * Functionality: drrs, fbt, kms_core, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcpsrdrrs-2p-scndscrn-pri-shrfb-draw-%s
@@ -2579,7 +2510,6 @@ static bool op_disables_psr(const struct test_mode *t,
  * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt, kms_core, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -2595,7 +2525,6 @@ static bool op_disables_psr(const struct test_mode *t,
  * Driver requirement: i915
  * Functionality: drrs, fbt, kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbc-2p-scndscrn-pri-shrfb-draw-%s
@@ -2603,7 +2532,6 @@ static bool op_disables_psr(const struct test_mode *t,
  * Driver requirement: i915
  * Functionality: fbc, fbt, kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: psr-2p-scndscrn-pri-shrfb-draw-%s
@@ -2611,7 +2539,6 @@ static bool op_disables_psr(const struct test_mode *t,
  * Driver requirement: i915
  * Functionality: fbt, kms_core, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcdrrs-2p-scndscrn-pri-shrfb-draw-%s
@@ -2619,7 +2546,6 @@ static bool op_disables_psr(const struct test_mode *t,
  * Driver requirement: i915
  * Functionality: drrs, fbc, fbt, kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcpsr-2p-scndscrn-pri-shrfb-draw-%s
@@ -2627,7 +2553,6 @@ static bool op_disables_psr(const struct test_mode *t,
  * Driver requirement: i915
  * Functionality: fbc, fbt, kms_core, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: psrdrrs-2p-scndscrn-pri-shrfb-draw-%s
@@ -2635,7 +2560,6 @@ static bool op_disables_psr(const struct test_mode *t,
  * Driver requirement: i915
  * Functionality: drrs, fbt, kms_core, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcpsrdrrs-2p-scndscrn-pri-shrfb-draw-%s
@@ -2643,7 +2567,6 @@ static bool op_disables_psr(const struct test_mode *t,
  * Driver requirement: i915
  * Functionality: drrs, fbc, fbt, kms_core, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -2732,7 +2655,6 @@ static void draw_subtest(const struct test_mode *t)
  * Driver requirement: i915, xe
  * Functionality: drrs, fbt, kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbc-%dp-pri-indfb-multidraw
@@ -2740,7 +2662,6 @@ static void draw_subtest(const struct test_mode *t)
  * Driver requirement: i915, xe
  * Functionality: fbc, fbt, kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: psr-%dp-pri-indfb-multidraw
@@ -2748,7 +2669,6 @@ static void draw_subtest(const struct test_mode *t)
  * Driver requirement: i915, xe
  * Functionality: fbt, kms_core, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcdrrs-%dp-pri-indfb-multidraw
@@ -2756,7 +2676,6 @@ static void draw_subtest(const struct test_mode *t)
  * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt, kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcpsr-%dp-pri-indfb-multidraw
@@ -2764,7 +2683,6 @@ static void draw_subtest(const struct test_mode *t)
  * Driver requirement: i915, xe
  * Functionality: fbc, fbt, kms_core, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: psrdrrs-%dp-pri-indfb-multidraw
@@ -2772,7 +2690,6 @@ static void draw_subtest(const struct test_mode *t)
  * Driver requirement: i915, xe
  * Functionality: drrs, fbt, kms_core, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcpsrdrrs-%dp-pri-indfb-multidraw
@@ -2780,7 +2697,6 @@ static void draw_subtest(const struct test_mode *t)
  * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt, kms_core, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1].values:   1, 2
@@ -2940,7 +2856,6 @@ static void badformat_subtest(const struct test_mode *t)
  * Driver requirement: i915, xe
  * Functionality: drrs, fbt, kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbc-%s-draw-%s
@@ -2948,7 +2863,6 @@ static void badformat_subtest(const struct test_mode *t)
  * Driver requirement: i915, xe
  * Functionality: fbc, fbt, kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: psr-%s-draw-%s
@@ -2956,7 +2870,6 @@ static void badformat_subtest(const struct test_mode *t)
  * Driver requirement: i915, xe
  * Functionality: fbt, kms_core, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcdrrs-%s-draw-%s
@@ -2964,7 +2877,6 @@ static void badformat_subtest(const struct test_mode *t)
  * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt, kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcpsr-%s-draw-%s
@@ -2972,7 +2884,6 @@ static void badformat_subtest(const struct test_mode *t)
  * Driver requirement: i915, xe
  * Functionality: fbc, fbt, kms_core, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: psrdrrs-%s-draw-%s
@@ -2980,7 +2891,6 @@ static void badformat_subtest(const struct test_mode *t)
  * Driver requirement: i915, xe
  * Functionality: drrs, fbt, kms_core, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcpsrdrrs-%s-draw-%s
@@ -2988,7 +2898,6 @@ static void badformat_subtest(const struct test_mode *t)
  * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt, kms_core, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -3009,7 +2918,6 @@ static void badformat_subtest(const struct test_mode *t)
  * Driver requirement: i915
  * Functionality: drrs, fbt, kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbc-%s-draw-%s
@@ -3017,7 +2925,6 @@ static void badformat_subtest(const struct test_mode *t)
  * Driver requirement: i915
  * Functionality: fbc, fbt, kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: psr-%s-draw-%s
@@ -3025,7 +2932,6 @@ static void badformat_subtest(const struct test_mode *t)
  * Driver requirement: i915
  * Functionality: fbt, kms_core, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcdrrs-%s-draw-%s
@@ -3033,7 +2939,6 @@ static void badformat_subtest(const struct test_mode *t)
  * Driver requirement: i915
  * Functionality: drrs, fbc, fbt, kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcpsr-%s-draw-%s
@@ -3041,7 +2946,6 @@ static void badformat_subtest(const struct test_mode *t)
  * Driver requirement: i915
  * Functionality: fbc, fbt, kms_core, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: psrdrrs-%s-draw-%s
@@ -3049,7 +2953,6 @@ static void badformat_subtest(const struct test_mode *t)
  * Driver requirement: i915
  * Functionality: drrs, fbt, kms_core, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcpsrdrrs-%s-draw-%s
@@ -3057,7 +2960,6 @@ static void badformat_subtest(const struct test_mode *t)
  * Driver requirement: i915
  * Functionality: drrs, fbc, fbt, kms_core, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -3121,7 +3023,6 @@ static bool tiling_is_valid(int feature_flags, enum tiling_type tiling)
  * Driver requirement: i915, xe
  * Functionality: drrs, fbt, kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbc-slowdraw
@@ -3129,7 +3030,6 @@ static bool tiling_is_valid(int feature_flags, enum tiling_type tiling)
  * Driver requirement: i915, xe
  * Functionality: fbc, fbt, kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: psr-slowdraw
@@ -3137,7 +3037,6 @@ static bool tiling_is_valid(int feature_flags, enum tiling_type tiling)
  * Driver requirement: i915, xe
  * Functionality: fbt, kms_core, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcdrrs-slowdraw
@@ -3145,7 +3044,6 @@ static bool tiling_is_valid(int feature_flags, enum tiling_type tiling)
  * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt, kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcpsr-slowdraw
@@ -3153,7 +3051,6 @@ static bool tiling_is_valid(int feature_flags, enum tiling_type tiling)
  * Driver requirement: i915, xe
  * Functionality: fbc, fbt, kms_core, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: psrdrrs-slowdraw
@@ -3161,7 +3058,6 @@ static bool tiling_is_valid(int feature_flags, enum tiling_type tiling)
  * Driver requirement: i915, xe
  * Functionality: drrs, fbt, kms_core, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcpsrdrrs-slowdraw
@@ -3169,7 +3065,6 @@ static bool tiling_is_valid(int feature_flags, enum tiling_type tiling)
  * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt, kms_core, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  */
 
@@ -3285,7 +3180,6 @@ static void page_flip_for_params(struct modeset_params *params,
  * Driver requirement: i915, xe
  * Functionality: drrs, fbt, kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbc-%dp-primscrn-%s-%sflip-blt
@@ -3293,7 +3187,6 @@ static void page_flip_for_params(struct modeset_params *params,
  * Driver requirement: i915, xe
  * Functionality: fbc, fbt, kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: psr-%dp-primscrn-%s-%sflip-blt
@@ -3301,7 +3194,6 @@ static void page_flip_for_params(struct modeset_params *params,
  * Driver requirement: i915, xe
  * Functionality: fbt, kms_core, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcdrrs-%dp-primscrn-%s-%sflip-blt
@@ -3309,7 +3201,6 @@ static void page_flip_for_params(struct modeset_params *params,
  * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt, kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcpsr-%dp-primscrn-%s-%sflip-blt
@@ -3317,7 +3208,6 @@ static void page_flip_for_params(struct modeset_params *params,
  * Driver requirement: i915, xe
  * Functionality: fbc, fbt, kms_core, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: psrdrrs-%dp-primscrn-%s-%sflip-blt
@@ -3325,7 +3215,6 @@ static void page_flip_for_params(struct modeset_params *params,
  * Driver requirement: i915, xe
  * Functionality: drrs, fbt, kms_core, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcpsrdrrs-%dp-primscrn-%s-%sflip-blt
@@ -3333,7 +3222,6 @@ static void page_flip_for_params(struct modeset_params *params,
  * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt, kms_core, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1].values:   1, 2
@@ -3356,7 +3244,6 @@ static void page_flip_for_params(struct modeset_params *params,
  * Driver requirement: i915, xe
  * Functionality: drrs, fbt, kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbc-2p-scndscrn-%s-%sflip-blt
@@ -3364,7 +3251,6 @@ static void page_flip_for_params(struct modeset_params *params,
  * Driver requirement: i915, xe
  * Functionality: fbc, fbt, kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: psr-2p-scndscrn-%s-%sflip-blt
@@ -3372,7 +3258,6 @@ static void page_flip_for_params(struct modeset_params *params,
  * Driver requirement: i915, xe
  * Functionality: fbt, kms_core, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcdrrs-2p-scndscrn-%s-%sflip-blt
@@ -3380,7 +3265,6 @@ static void page_flip_for_params(struct modeset_params *params,
  * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt, kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcpsr-2p-scndscrn-%s-%sflip-blt
@@ -3388,7 +3272,6 @@ static void page_flip_for_params(struct modeset_params *params,
  * Driver requirement: i915, xe
  * Functionality: fbc, fbt, kms_core, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: psrdrrs-2p-scndscrn-%s-%sflip-blt
@@ -3396,7 +3279,6 @@ static void page_flip_for_params(struct modeset_params *params,
  * Driver requirement: i915, xe
  * Functionality: drrs, fbt, kms_core, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcpsrdrrs-2p-scndscrn-%s-%sflip-blt
@@ -3404,7 +3286,6 @@ static void page_flip_for_params(struct modeset_params *params,
  * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt, kms_core, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -3485,7 +3366,6 @@ static void flip_subtest(const struct test_mode *t)
  * Driver requirement: i915, xe
  * Functionality: fbc, fbt, kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcdrrs-%dp-%s-fliptrack-mmap-gtt
@@ -3493,7 +3373,6 @@ static void flip_subtest(const struct test_mode *t)
  * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt, kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcpsr-%dp-%s-fliptrack-mmap-gtt
@@ -3501,7 +3380,6 @@ static void flip_subtest(const struct test_mode *t)
  * Driver requirement: i915, xe
  * Functionality: fbc, fbt, kms_core, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcpsrdrrs-%dp-%s-fliptrack-mmap-gtt
@@ -3509,7 +3387,6 @@ static void flip_subtest(const struct test_mode *t)
  * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt, kms_core, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1].values:   1, 2
@@ -3574,7 +3451,6 @@ static void fliptrack_subtest(const struct test_mode *t, enum flip_type type)
  * Driver requirement: i915, xe
  * Functionality: drrs, fbt
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbc-%dp-primscrn-%s-indfb-move
@@ -3582,7 +3458,6 @@ static void fliptrack_subtest(const struct test_mode *t, enum flip_type type)
  * Driver requirement: i915, xe
  * Functionality: fbc, fbt
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: psr-%dp-primscrn-%s-indfb-move
@@ -3590,7 +3465,6 @@ static void fliptrack_subtest(const struct test_mode *t, enum flip_type type)
  * Driver requirement: i915, xe
  * Functionality: fbt, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcdrrs-%dp-primscrn-%s-indfb-move
@@ -3598,7 +3472,6 @@ static void fliptrack_subtest(const struct test_mode *t, enum flip_type type)
  * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcpsr-%dp-primscrn-%s-indfb-move
@@ -3606,7 +3479,6 @@ static void fliptrack_subtest(const struct test_mode *t, enum flip_type type)
  * Driver requirement: i915, xe
  * Functionality: fbc, fbt, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: psrdrrs-%dp-primscrn-%s-indfb-move
@@ -3614,7 +3486,6 @@ static void fliptrack_subtest(const struct test_mode *t, enum flip_type type)
  * Driver requirement: i915, xe
  * Functionality: drrs, fbt, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcpsrdrrs-%dp-primscrn-%s-indfb-move
@@ -3622,7 +3493,6 @@ static void fliptrack_subtest(const struct test_mode *t, enum flip_type type)
  * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1].values:   1, 2
@@ -3639,7 +3509,6 @@ static void fliptrack_subtest(const struct test_mode *t, enum flip_type type)
  * Driver requirement: i915, xe
  * Functionality: drrs, fbt
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbc-2p-scndscrn-%s-indfb-move
@@ -3647,7 +3516,6 @@ static void fliptrack_subtest(const struct test_mode *t, enum flip_type type)
  * Driver requirement: i915, xe
  * Functionality: fbc, fbt
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: psr-2p-scndscrn-%s-indfb-move
@@ -3655,7 +3523,6 @@ static void fliptrack_subtest(const struct test_mode *t, enum flip_type type)
  * Driver requirement: i915, xe
  * Functionality: fbt, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcdrrs-2p-scndscrn-%s-indfb-move
@@ -3663,7 +3530,6 @@ static void fliptrack_subtest(const struct test_mode *t, enum flip_type type)
  * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcpsr-2p-scndscrn-%s-indfb-move
@@ -3671,7 +3537,6 @@ static void fliptrack_subtest(const struct test_mode *t, enum flip_type type)
  * Driver requirement: i915, xe
  * Functionality: fbc, fbt, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: psrdrrs-2p-scndscrn-%s-indfb-move
@@ -3679,7 +3544,6 @@ static void fliptrack_subtest(const struct test_mode *t, enum flip_type type)
  * Driver requirement: i915, xe
  * Functionality: drrs, fbt, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcpsrdrrs-2p-scndscrn-%s-indfb-move
@@ -3687,7 +3551,6 @@ static void fliptrack_subtest(const struct test_mode *t, enum flip_type type)
  * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -3755,7 +3618,6 @@ static void move_subtest(const struct test_mode *t)
  * Driver requirement: i915, xe
  * Functionality: drrs, fbt
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbc-%dp-primscrn-%s-indfb-onoff
@@ -3763,7 +3625,6 @@ static void move_subtest(const struct test_mode *t)
  * Driver requirement: i915, xe
  * Functionality: fbc, fbt
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: psr-%dp-primscrn-%s-indfb-onoff
@@ -3771,7 +3632,6 @@ static void move_subtest(const struct test_mode *t)
  * Driver requirement: i915, xe
  * Functionality: fbt, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcdrrs-%dp-primscrn-%s-indfb-onoff
@@ -3779,7 +3639,6 @@ static void move_subtest(const struct test_mode *t)
  * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcpsr-%dp-primscrn-%s-indfb-onoff
@@ -3787,7 +3646,6 @@ static void move_subtest(const struct test_mode *t)
  * Driver requirement: i915, xe
  * Functionality: fbc, fbt, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: psrdrrs-%dp-primscrn-%s-indfb-onoff
@@ -3795,7 +3653,6 @@ static void move_subtest(const struct test_mode *t)
  * Driver requirement: i915, xe
  * Functionality: drrs, fbt, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcpsrdrrs-%dp-primscrn-%s-indfb-onoff
@@ -3803,7 +3660,6 @@ static void move_subtest(const struct test_mode *t)
  * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1].values:   1, 2
@@ -3820,7 +3676,6 @@ static void move_subtest(const struct test_mode *t)
  * Driver requirement: i915, xe
  * Functionality: drrs, fbt
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbc-2p-scndscrn-%s-indfb-onoff
@@ -3828,7 +3683,6 @@ static void move_subtest(const struct test_mode *t)
  * Driver requirement: i915, xe
  * Functionality: fbc, fbt
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: psr-2p-scndscrn-%s-indfb-onoff
@@ -3836,7 +3690,6 @@ static void move_subtest(const struct test_mode *t)
  * Driver requirement: i915, xe
  * Functionality: fbt, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcdrrs-2p-scndscrn-%s-indfb-onoff
@@ -3844,7 +3697,6 @@ static void move_subtest(const struct test_mode *t)
  * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcpsr-2p-scndscrn-%s-indfb-onoff
@@ -3852,7 +3704,6 @@ static void move_subtest(const struct test_mode *t)
  * Driver requirement: i915, xe
  * Functionality: fbc, fbt, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: psrdrrs-2p-scndscrn-%s-indfb-onoff
@@ -3860,7 +3711,6 @@ static void move_subtest(const struct test_mode *t)
  * Driver requirement: i915, xe
  * Functionality: drrs, fbt, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcpsrdrrs-2p-scndscrn-%s-indfb-onoff
@@ -3868,7 +3718,6 @@ static void move_subtest(const struct test_mode *t)
  * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -3942,7 +3791,6 @@ static bool prim_plane_disabled(void)
  * Driver requirement: i915, xe
  * Functionality: drrs, fbt
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbc-%dp-primscrn-spr-indfb-fullscreen
@@ -3950,7 +3798,6 @@ static bool prim_plane_disabled(void)
  * Driver requirement: i915, xe
  * Functionality: fbc, fbt
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: psr-%dp-primscrn-spr-indfb-fullscreen
@@ -3958,7 +3805,6 @@ static bool prim_plane_disabled(void)
  * Driver requirement: i915, xe
  * Functionality: fbt, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcdrrs-%dp-primscrn-spr-indfb-fullscreen
@@ -3966,7 +3812,6 @@ static bool prim_plane_disabled(void)
  * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcpsr-%dp-primscrn-spr-indfb-fullscreen
@@ -3974,7 +3819,6 @@ static bool prim_plane_disabled(void)
  * Driver requirement: i915, xe
  * Functionality: fbc, fbt, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: psrdrrs-%dp-primscrn-spr-indfb-fullscreen
@@ -3982,7 +3826,6 @@ static bool prim_plane_disabled(void)
  * Driver requirement: i915, xe
  * Functionality: drrs, fbt, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcpsrdrrs-%dp-primscrn-spr-indfb-fullscreen
@@ -3990,7 +3833,6 @@ static bool prim_plane_disabled(void)
  * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: drrs-2p-scndscrn-spr-indfb-fullscreen
@@ -3998,7 +3840,6 @@ static bool prim_plane_disabled(void)
  * Driver requirement: i915, xe
  * Functionality: drrs, fbt
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbc-2p-scndscrn-spr-indfb-fullscreen
@@ -4006,7 +3847,6 @@ static bool prim_plane_disabled(void)
  * Driver requirement: i915, xe
  * Functionality: fbc, fbt
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: psr-2p-scndscrn-spr-indfb-fullscreen
@@ -4014,7 +3854,6 @@ static bool prim_plane_disabled(void)
  * Driver requirement: i915, xe
  * Functionality: fbt, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcdrrs-2p-scndscrn-spr-indfb-fullscreen
@@ -4022,7 +3861,6 @@ static bool prim_plane_disabled(void)
  * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcpsr-2p-scndscrn-spr-indfb-fullscreen
@@ -4030,7 +3868,6 @@ static bool prim_plane_disabled(void)
  * Driver requirement: i915, xe
  * Functionality: fbc, fbt, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: psrdrrs-2p-scndscrn-spr-indfb-fullscreen
@@ -4038,7 +3875,6 @@ static bool prim_plane_disabled(void)
  * Driver requirement: i915, xe
  * Functionality: drrs, fbt, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcpsrdrrs-2p-scndscrn-spr-indfb-fullscreen
@@ -4046,7 +3882,6 @@ static bool prim_plane_disabled(void)
  * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1].values:   1, 2
@@ -4119,7 +3954,6 @@ static void fullscreen_plane_subtest(const struct test_mode *t)
  * Driver requirement: i915, xe
  * Functionality: drrs, fbt, scaling
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbc-%s-scaledprimary
@@ -4127,7 +3961,6 @@ static void fullscreen_plane_subtest(const struct test_mode *t)
  * Driver requirement: i915, xe
  * Functionality: fbc, fbt, scaling
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: psr-%s-scaledprimary
@@ -4135,7 +3968,6 @@ static void fullscreen_plane_subtest(const struct test_mode *t)
  * Driver requirement: i915, xe
  * Functionality: fbt, psr, scaling
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcdrrs-%s-scaledprimary
@@ -4143,7 +3975,6 @@ static void fullscreen_plane_subtest(const struct test_mode *t)
  * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt, scaling
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcpsr-%s-scaledprimary
@@ -4151,7 +3982,6 @@ static void fullscreen_plane_subtest(const struct test_mode *t)
  * Driver requirement: i915, xe
  * Functionality: fbc, fbt, psr, scaling
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: psrdrrs-%s-scaledprimary
@@ -4159,7 +3989,6 @@ static void fullscreen_plane_subtest(const struct test_mode *t)
  * Driver requirement: i915, xe
  * Functionality: drrs, fbt, psr, scaling
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcpsrdrrs-%s-scaledprimary
@@ -4167,7 +3996,6 @@ static void fullscreen_plane_subtest(const struct test_mode *t)
  * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt, psr, scaling
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -4288,7 +4116,6 @@ static void scaledprimary_subtest(const struct test_mode *t)
  * Driver requirement: i915, xe
  * Functionality: drrs, fbt, scaling
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbc-modesetfrombusy
@@ -4296,7 +4123,6 @@ static void scaledprimary_subtest(const struct test_mode *t)
  * Driver requirement: i915, xe
  * Functionality: fbc, fbt, scaling
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: psr-modesetfrombusy
@@ -4304,7 +4130,6 @@ static void scaledprimary_subtest(const struct test_mode *t)
  * Driver requirement: i915, xe
  * Functionality: fbt, psr, scaling
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcdrrs-modesetfrombusy
@@ -4312,7 +4137,6 @@ static void scaledprimary_subtest(const struct test_mode *t)
  * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt, scaling
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcpsr-modesetfrombusy
@@ -4320,7 +4144,6 @@ static void scaledprimary_subtest(const struct test_mode *t)
  * Driver requirement: i915, xe
  * Functionality: fbc, fbt, psr, scaling
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: psrdrrs-modesetfrombusy
@@ -4328,7 +4151,6 @@ static void scaledprimary_subtest(const struct test_mode *t)
  * Driver requirement: i915, xe
  * Functionality: drrs, fbt, psr, scaling
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcpsrdrrs-modesetfrombusy
@@ -4336,7 +4158,6 @@ static void scaledprimary_subtest(const struct test_mode *t)
  * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt, psr, scaling
  * Mega feature: General Display Features
- * Run type: FULL
  */
 
 /**
@@ -4388,7 +4209,6 @@ static void modesetfrombusy_subtest(const struct test_mode *t)
  * Driver requirement: i915, xe
  * Functionality: drrs, fbt, suspend
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbc-suspend
@@ -4396,7 +4216,6 @@ static void modesetfrombusy_subtest(const struct test_mode *t)
  * Driver requirement: i915, xe
  * Functionality: fbc, fbt, suspend
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: psr-suspend
@@ -4404,7 +4223,6 @@ static void modesetfrombusy_subtest(const struct test_mode *t)
  * Driver requirement: i915, xe
  * Functionality: fbt, psr, suspend
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcdrrs-suspend
@@ -4412,7 +4230,6 @@ static void modesetfrombusy_subtest(const struct test_mode *t)
  * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt, suspend
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcpsr-suspend
@@ -4420,7 +4237,6 @@ static void modesetfrombusy_subtest(const struct test_mode *t)
  * Driver requirement: i915, xe
  * Functionality: fbc, fbt, psr, suspend
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: psrdrrs-suspend
@@ -4428,7 +4244,6 @@ static void modesetfrombusy_subtest(const struct test_mode *t)
  * Driver requirement: i915, xe
  * Functionality: drrs, fbt, psr, suspend
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcpsrdrrs-suspend
@@ -4436,7 +4251,6 @@ static void modesetfrombusy_subtest(const struct test_mode *t)
  * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt, psr, suspend
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  */
 
@@ -4478,7 +4292,6 @@ static void suspend_subtest(const struct test_mode *t)
  * Driver requirement: i915
  * Functionality: drrs, fbt, kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbc-farfromfence-mmap-gtt
@@ -4486,7 +4299,6 @@ static void suspend_subtest(const struct test_mode *t)
  * Driver requirement: i915
  * Functionality: fbc, fbt, kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: psr-farfromfence-mmap-gtt
@@ -4494,7 +4306,6 @@ static void suspend_subtest(const struct test_mode *t)
  * Driver requirement: i915
  * Functionality: fbt, kms_core, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcdrrs-farfromfence-mmap-gtt
@@ -4502,7 +4313,6 @@ static void suspend_subtest(const struct test_mode *t)
  * Driver requirement: i915
  * Functionality: drrs, fbc, fbt, kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcpsr-farfromfence-mmap-gtt
@@ -4510,7 +4320,6 @@ static void suspend_subtest(const struct test_mode *t)
  * Driver requirement: i915
  * Functionality: fbc, fbt, kms_core, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: psrdrrs-farfromfence-mmap-gtt
@@ -4518,7 +4327,6 @@ static void suspend_subtest(const struct test_mode *t)
  * Driver requirement: i915
  * Functionality: drrs, fbt, kms_core, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcpsrdrrs-farfromfence-mmap-gtt
@@ -4526,7 +4334,6 @@ static void suspend_subtest(const struct test_mode *t)
  * Driver requirement: i915
  * Functionality: drrs, fbc, fbt, kms_core, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  */
 
@@ -4632,7 +4439,6 @@ static void try_invalid_strides(void)
  * Driver requirement: i915, xe
  * Functionality: fbc, fbt
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcdrrs-badstride
@@ -4640,7 +4446,6 @@ static void try_invalid_strides(void)
  * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcpsr-badstride
@@ -4648,7 +4453,6 @@ static void try_invalid_strides(void)
  * Driver requirement: i915, xe
  * Functionality: fbc, fbt, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcpsrdrrs-badstride
@@ -4656,7 +4460,6 @@ static void try_invalid_strides(void)
  * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  */
 
@@ -4734,7 +4537,6 @@ static void badstride_subtest(const struct test_mode *t)
  * Driver requirement: i915, xe
  * Functionality: fbc, fbt
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcdrrs-stridechange
@@ -4742,7 +4544,6 @@ static void badstride_subtest(const struct test_mode *t)
  * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcpsr-stridechange
@@ -4750,7 +4551,6 @@ static void badstride_subtest(const struct test_mode *t)
  * Driver requirement: i915, xe
  * Functionality: fbc, fbt, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcpsrdrrs-stridechange
@@ -4758,7 +4558,6 @@ static void badstride_subtest(const struct test_mode *t)
  * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt, psr
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  */
 
@@ -4833,7 +4632,6 @@ static void stridechange_subtest(const struct test_mode *t)
  * Driver requirement: i915, xe
  * Functionality: fbc, fbt, tiling
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcdrrs-tiling-%s
@@ -4842,7 +4640,6 @@ static void stridechange_subtest(const struct test_mode *t)
  * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt, tiling
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcpsr-tiling-%s
@@ -4851,7 +4648,6 @@ static void stridechange_subtest(const struct test_mode *t)
  * Driver requirement: i915, xe
  * Functionality: fbc, fbt, psr, tiling
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fbcpsrdrrs-tiling-%s
@@ -4860,7 +4656,6 @@ static void stridechange_subtest(const struct test_mode *t)
  * Driver requirement: i915, xe
  * Functionality: drrs, fbc, fbt, psr, tiling
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -4925,7 +4720,6 @@ static void tiling_disable_fbc_subtest(const struct test_mode *t)
  * Driver requirement: i915, xe
  * Functionality: fbt
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  */
 
diff --git a/tests/intel/kms_legacy_colorkey.c b/tests/intel/kms_legacy_colorkey.c
index f022bab19374..877a6799a9a6 100644
--- a/tests/intel/kms_legacy_colorkey.c
+++ b/tests/intel/kms_legacy_colorkey.c
@@ -34,7 +34,6 @@
  * Driver requirement: i915
  * Functionality: plane, xorg_xv
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: invalid-plane
@@ -42,7 +41,6 @@
  * Driver requirement: i915
  * Functionality: plane, xorg_xv
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  */
 
diff --git a/tests/intel/kms_mmap_write_crc.c b/tests/intel/kms_mmap_write_crc.c
index 73676bc06afa..17d72ee32768 100644
--- a/tests/intel/kms_mmap_write_crc.c
+++ b/tests/intel/kms_mmap_write_crc.c
@@ -48,7 +48,6 @@
  * Driver requirement: i915, xe
  * Functionality: kms_core, kms_gem_interop
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  */
 
diff --git a/tests/intel/kms_pipe_b_c_ivb.c b/tests/intel/kms_pipe_b_c_ivb.c
index 582ec70ef71f..386f3003ae01 100644
--- a/tests/intel/kms_pipe_b_c_ivb.c
+++ b/tests/intel/kms_pipe_b_c_ivb.c
@@ -37,7 +37,6 @@
  * Driver requirement: i915
  * Functionality: kms_core, obsolete
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: enable-pipe-C-while-B-has-3-lanes
@@ -46,7 +45,6 @@
  * Driver requirement: i915
  * Functionality: kms_core, obsolete
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: from-pipe-C-to-B-with-3-lanes
@@ -55,7 +53,6 @@
  * Driver requirement: i915
  * Functionality: kms_core, obsolete
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: pipe-B-double-modeset-then-modeset-pipe-C
@@ -64,7 +61,6 @@
  * Driver requirement: i915
  * Functionality: kms_core, obsolete
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: pipe-B-dpms-off-modeset-pipe-C
@@ -74,7 +70,6 @@
  * Driver requirement: i915
  * Functionality: kms_core, obsolete
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  */
 
diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c
index 9e0e5c4a022e..ffecc5222f33 100644
--- a/tests/intel/kms_psr.c
+++ b/tests/intel/kms_psr.c
@@ -44,7 +44,6 @@
  * Driver requirement: i915, xe
  * Functionality: psr
  * Mega feature: PSR
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: %s_%s
@@ -53,7 +52,6 @@
  * Driver requirement: i915
  * Functionality: kms_core, plane, psr
  * Mega feature: PSR
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -75,7 +73,6 @@
  * Driver requirement: i915, xe
  * Functionality: plane, psr
  * Mega feature: PSR
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: %s_%s
@@ -84,7 +81,6 @@
  * Driver requirement: i915, xe
  * Functionality: kms_core, plane, psr
  * Mega feature: PSR
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -106,7 +102,6 @@
  * Driver requirement: i915, xe
  * Functionality: kms_core, psr
  * Mega feature: PSR
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -122,7 +117,6 @@
  * Driver requirement: i915, xe
  * Functionality: dpms, psr
  * Mega feature: PSR
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: no_drrs
@@ -130,7 +124,6 @@
  * Driver requirement: i915, xe
  * Functionality: drrs, psr
  * Mega feature: PSR
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: suspend
@@ -139,7 +132,6 @@
  * Driver requirement: i915, xe
  * Functionality: psr, suspend
  * Mega feature: PSR
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: psr2_dpms
@@ -148,7 +140,6 @@
  * Driver requirement: i915, xe
  * Functionality: dpms, psr, psr2
  * Mega feature: PSR
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: psr2_no_drrs
@@ -156,7 +147,6 @@
  * Driver requirement: i915, xe
  * Functionality: drrs, psr, psr2
  * Mega feature: PSR
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: psr2_suspend
@@ -165,7 +155,6 @@
  * Driver requirement: i915, xe
  * Functionality: psr, psr2, suspend
  * Mega feature: PSR
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: psr2_basic
@@ -173,7 +162,6 @@
  * Driver requirement: i915, xe
  * Functionality: psr, psr2
  * Mega feature: PSR
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: psr2_%s_%s
@@ -182,7 +170,6 @@
  * Driver requirement: i915
  * Functionality: kms_core, plane, psr, psr2
  * Mega feature: PSR
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -204,7 +191,6 @@
  * Driver requirement: i915, xe
  * Functionality: plane, psr, psr2
  * Mega feature: PSR
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: psr2_primary_%s
@@ -213,7 +199,6 @@
  * Driver requirement: i915, xe
  * Functionality: kms_core, plane, psr, psr2
  * Mega feature: PSR
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -229,7 +214,6 @@
  * Driver requirement: i915, xe
  * Functionality: kms_core, plane, psr, psr2
  * Mega feature: PSR
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -523,7 +507,6 @@ static void fb_dirty_fb_ioctl(data_t *data, struct igt_fb *fb)
  *		cursor planes
  * Driver requirement: i915, xe
  * Test category: functionality test
- * Run type: BAT, FULL
  * Functionality: psr
  * Mega feature: PSR
  *
@@ -532,7 +515,6 @@ static void fb_dirty_fb_ioctl(data_t *data, struct igt_fb *fb)
  *		on primary planes
  * Driver requirement: i915, xe
  * Test category: functionality test
- * Run type: BAT, FULL
  * Functionality: psr
  * Mega feature: PSR
  *
@@ -541,7 +523,6 @@ static void fb_dirty_fb_ioctl(data_t *data, struct igt_fb *fb)
  *		sprite planes
  * Driver requirement: i915, xe
  * Test category: functionality test
- * Run type: BAT, FULL
  * Functionality: psr
  * Mega feature: PSR
  */
diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
index 6f71504b3343..d7a746211f31 100644
--- a/tests/intel/kms_psr2_sf.c
+++ b/tests/intel/kms_psr2_sf.c
@@ -42,7 +42,6 @@
  * Driver requirement: i915, xe
  * Functionality: plane, psr2, selective_fetch
  * Mega feature: PSR
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -63,7 +62,6 @@
  * Driver requirement: i915, xe
  * Functionality: cursor, psr2, selective_fetch
  * Mega feature: PSR
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: overlay-plane-update-continuous-sf
@@ -71,7 +69,6 @@
  * Driver requirement: i915, xe
  * Functionality: plane, psr2, selective_fetch
  * Mega feature: PSR
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: overlay-plane-update-sf-dmg-area
@@ -79,7 +76,6 @@
  * Driver requirement: i915, xe
  * Functionality: plane, psr2, selective_fetch
  * Mega feature: PSR
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: overlay-primary-update-sf-dmg-area
@@ -88,7 +84,6 @@
  * Driver requirement: i915, xe
  * Functionality: plane, psr2, selective_fetch
  * Mega feature: PSR
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: plane-move-sf-dmg-area
@@ -96,7 +91,6 @@
  * Driver requirement: i915, xe
  * Functionality: plane, psr2, selective_fetch
  * Mega feature: PSR
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: primary-plane-update-sf-dmg-area
@@ -104,7 +98,6 @@
  * Driver requirement: i915, xe
  * Functionality: plane, psr2, selective_fetch
  * Mega feature: PSR
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: primary-plane-update-sf-dmg-area-big-fb
@@ -112,7 +105,6 @@
  * Driver requirement: i915, xe
  * Functionality: plane, psr2, selective_fetch
  * Mega feature: PSR
- * Run type: FULL
  * Test category: functionality test
  */
 
diff --git a/tests/intel/kms_psr2_su.c b/tests/intel/kms_psr2_su.c
index 39bb20ded23d..321144d6b93b 100644
--- a/tests/intel/kms_psr2_su.c
+++ b/tests/intel/kms_psr2_su.c
@@ -40,7 +40,6 @@
  * Driver requirement: i915, xe
  * Functionality: fbt, psr2, selective_update
  * Mega feature: PSR
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: page_flip-%s
@@ -48,7 +47,6 @@
  * Driver requirement: i915, xe
  * Functionality: pixel-format, psr2, selective_update
  * Mega feature: PSR
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
diff --git a/tests/intel/kms_psr_stress_test.c b/tests/intel/kms_psr_stress_test.c
index e8cec7807c9f..b6759eeceebd 100644
--- a/tests/intel/kms_psr_stress_test.c
+++ b/tests/intel/kms_psr_stress_test.c
@@ -17,7 +17,6 @@
  * Driver requirement: i915, xe
  * Functionality: plane, psr
  * Mega feature: PSR
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: invalidate-primary-flip-overlay
@@ -26,7 +25,6 @@
  * Driver requirement: i915, xe
  * Functionality: plane, psr
  * Mega feature: PSR
- * Run type: FULL
  * Test category: functionality test
  */
 
diff --git a/tests/intel/kms_pwrite_crc.c b/tests/intel/kms_pwrite_crc.c
index b08997a8d2f2..50df18aa3a61 100644
--- a/tests/intel/kms_pwrite_crc.c
+++ b/tests/intel/kms_pwrite_crc.c
@@ -40,7 +40,6 @@
  * Driver requirement: i915
  * Functionality: crc, kms_core, kms_gem_interop
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  */
 
diff --git a/tests/kms_3d.c b/tests/kms_3d.c
index 617f870c65c9..fa73d0cc6886 100644
--- a/tests/kms_3d.c
+++ b/tests/kms_3d.c
@@ -34,7 +34,6 @@
  * Driver requirement: i915, xe
  * Functionality: stereoscopic
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  */
 
diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
index e9a116c3ba2c..fc16b88143c0 100644
--- a/tests/kms_addfb_basic.c
+++ b/tests/kms_addfb_basic.c
@@ -71,7 +71,6 @@ static int legacy_addfb(int fd, struct drm_mode_fb_cmd *arg)
  * Description: Test that addfb2 call fails correctly for unused %arg[1]
  * Driver requirement: i915, xe
  * Test category: functionality test
- * Run type: BAT, FULL
  * Functionality: kms_gem_interop
  * Mega feature: General Display Features
  *
@@ -79,7 +78,6 @@ static int legacy_addfb(int fd, struct drm_mode_fb_cmd *arg)
  * Description: Test that addfb2 call fails correctly for unused modifier
  * Driver requirement: i915, xe
  * Test category: functionality test
- * Run type: BAT, FULL
  * Functionality: kms_gem_interop, tiling
  * Mega feature: General Display Features
  *
@@ -88,7 +86,6 @@ static int legacy_addfb(int fd, struct drm_mode_fb_cmd *arg)
  * Driver requirement: i915
  * Functionality: kms_gem_interop, tiling
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: invalid-smem-bo-on-discrete
@@ -97,7 +94,6 @@ static int legacy_addfb(int fd, struct drm_mode_fb_cmd *arg)
  * Driver requirement: i915, xe
  * Functionality: kms_gem_interop
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: legacy-format
@@ -105,7 +101,6 @@ static int legacy_addfb(int fd, struct drm_mode_fb_cmd *arg)
  * Driver requirement: i915, xe
  * Functionality: kms_gem_interop
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -332,7 +327,6 @@ static void invalid_tests(int fd)
  * Description: Test that addfb2 call fails correctly without handle
  * Driver requirement: i915, xe
  * Test category: functionality test
- * Run type: BAT, FULL
  * Functionality: kms_gem_interop
  * Mega feature: General Display Features
  *
@@ -340,7 +334,6 @@ static void invalid_tests(int fd)
  * Description: Check if addfb2 call works with given handle
  * Driver requirement: i915, xe
  * Test category: functionality test
- * Run type: BAT, FULL
  * Functionality: kms_gem_interop
  * Mega feature: General Display Features
  *
@@ -348,7 +341,6 @@ static void invalid_tests(int fd)
  * Description: bad-pitch-%arg[1]: Test that addfb2 call fails correctly for bad-pitches
  * Driver requirement: i915, xe
  * Test category: functionality test
- * Run type: BAT, FULL
  * Functionality: kms_gem_interop
  * Mega feature: General Display Features
  *
@@ -406,7 +398,6 @@ static void pitch_tests(int fd)
  * Description: Check if addfb2 and rmfb call works for basic %arg[1] test
  * Driver requirement: i915, xe
  * Test category: functionality test
- * Run type: FULL
  * Functionality: kms_gem_interop, tiling
  * Mega feature: General Display Features
  *
@@ -414,7 +405,6 @@ static void pitch_tests(int fd)
  * Description: Check if addfb2 call works for x and y tiling
  * Driver requirement: i915
  * Test category: functionality test
- * Run type: FULL
  * Functionality: kms_gem_interop, tiling
  * Mega feature: General Display Features
  *
@@ -422,7 +412,6 @@ static void pitch_tests(int fd)
  * Description: Test that addfb2 call fails correctly for pitches mismatch
  * Driver requirement: i915, xe
  * Test category: functionality test
- * Run type: FULL
  * Functionality: kms_gem_interop, tiling
  * Mega feature: General Display Features
  *
@@ -522,7 +511,6 @@ static void tiling_tests(int fd)
  * Description: Check if addfb2 call works with max size of buffer object
  * Driver requirement: i915, xe
  * Test category: functionality test
- * Run type: BAT, FULL
  * Functionality: kms_gem_interop
  * Mega feature: General Display Features
  *
@@ -530,7 +518,6 @@ static void tiling_tests(int fd)
  * Description: Test that addfb2 call fails correctly with increased width of fb
  * Driver requirement: i915, xe
  * Test category: functionality test
- * Run type: BAT, FULL
  * Functionality: kms_gem_interop
  * Mega feature: General Display Features
  *
@@ -538,7 +525,6 @@ static void tiling_tests(int fd)
  * Description: Test that addfb2 call fails correctly with increased height of fb
  * Driver requirement: i915, xe
  * Test category: functionality test
- * Run type: BAT, FULL
  * Functionality: kms_gem_interop
  * Mega feature: General Display Features
  *
@@ -546,7 +532,6 @@ static void tiling_tests(int fd)
  * Description: Test that addfb2 call fails correctly with small size of buffer object
  * Driver requirement: i915, xe
  * Test category: functionality test
- * Run type: BAT, FULL
  * Functionality: kms_gem_interop
  * Mega feature: General Display Features
  *
@@ -554,7 +539,6 @@ static void tiling_tests(int fd)
  * Description: Check if addfb2 call works for given height
  * Driver requirement: i915, xe
  * Test category: functionality test
- * Run type: BAT, FULL
  * Functionality: kms_gem_interop
  * Mega feature: General Display Features
  *
@@ -563,7 +547,6 @@ static void tiling_tests(int fd)
  *              after changing tile
  * Driver requirement: i915
  * Test category: functionality test
- * Run type: FULL
  * Functionality: kms_gem_interop, tiling
  * Mega feature: General Display Features
  */
@@ -687,7 +670,6 @@ static void size_tests(int fd)
  * Description: Test that addfb2 call fails correctly for x-tiling with given modifier
  * Driver requirement: i915, xe
  * Test category: functionality test
- * Run type: BAT, FULL
  * Functionality: kms_gem_interop, tiling
  * Mega feature: General Display Features
  *
@@ -695,7 +677,6 @@ static void size_tests(int fd)
  * Description: Test that addfb2 call fails correctly for irrelevant modifier
  * Driver requirement: i915, xe
  * Test category: functionality test
- * Run type: BAT, FULL
  * Functionality: kms_gem_interop, tiling
  * Mega feature: General Display Features
  *
@@ -703,7 +684,6 @@ static void size_tests(int fd)
  * Description: Test that addfb2 call fails correctly for irrelevant x-tiling
  * Driver requirement: i915, xe
  * Test category: functionality test
- * Run type: FULL
  * Functionality: kms_gem_interop, tiling
  * Mega feature: General Display Features
  *
@@ -711,7 +691,6 @@ static void size_tests(int fd)
  * Description: Check if addfb2 call works for x-tiling
  * Driver requirement: i915, xe
  * Test category: functionality test
- * Run type: FULL
  * Functionality: kms_gem_interop, tiling
  * Mega feature: General Display Features
  *
@@ -719,7 +698,6 @@ static void size_tests(int fd)
  * Description: Check if addfb2 call works for relevant combination of tiling and fbs
  * Driver requirement: i915
  * Test category: functionality test
- * Run type: FULL
  * Functionality: kms_gem_interop, tiling
  * Mega feature: General Display Features
  */
@@ -814,7 +792,6 @@ static int addfb_expected_ret(igt_display_t *disp, struct drm_mode_fb_cmd2 *f)
  * Driver requirement: i915, xe
  * Functionality: kms_gem_interop, tiling
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: addfb25-yf-tiled-legacy
@@ -822,7 +799,6 @@ static int addfb_expected_ret(igt_display_t *disp, struct drm_mode_fb_cmd2 *f)
  * Driver requirement: i915, xe
  * Functionality: kms_gem_interop, tiling
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -902,7 +878,6 @@ static void addfb25_ytile(int fd)
  * Driver requirement: i915, xe
  * Functionality: kms_gem_interop, tiling
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  */
 static void addfb25_4tile(int fd)
@@ -948,7 +923,6 @@ static void addfb25_4tile(int fd)
  * Description: Test that %arg[1] ioctl call fails correctly for %arg[2] object
  * Driver requirement: i915, xe
  * Test category: functionality test
- * Run type: BAT, FULL
  * Functionality: kms_gem_interop
  * Mega feature: General Display Features
  *
@@ -1033,7 +1007,6 @@ static void prop_tests(int fd)
  * Driver requirement: i915, xe
  * Functionality: kms_gem_interop
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  */
 static void master_tests(int fd)
diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 45c38c590f38..6c97558be721 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -210,7 +210,6 @@ static void test_init_fbs(data_t *data)
  * Driver requirement: i915, xe
  * Functionality: async_flips, vblank
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: async-flip-with-page-flip-events
@@ -219,7 +218,6 @@ static void test_init_fbs(data_t *data)
  * Driver requirement: i915, xe
  * Functionality: async_flips, vblank
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  */
 static void test_async_flip(data_t *data)
@@ -325,7 +323,6 @@ static void wait_for_vblank(data_t *data, unsigned long *vbl_time, unsigned int
  * Driver requirement: i915, xe
  * Functionality: async_flips, vblank
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  */
 static void test_timestamp(data_t *data)
@@ -378,7 +375,6 @@ static void test_timestamp(data_t *data)
  * Driver requirement: i915, xe
  * Functionality: async_flips, cursor, vblank
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  */
 static void test_cursor(data_t *data)
@@ -539,7 +535,6 @@ static unsigned int clock_ms(void)
  * Driver requirement: i915, xe
  * Functionality: async_flips, crc, vblank
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  */
 static void test_crc(data_t *data)
@@ -610,7 +605,6 @@ static void test_crc(data_t *data)
  * Driver requirement: i915, xe
  * Functionality: async_flips, vblank
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  */
 static void run_test(data_t *data, void (*test)(data_t *))
diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
index a3205497b830..d1511716ad20 100644
--- a/tests/kms_atomic.c
+++ b/tests/kms_atomic.c
@@ -296,7 +296,6 @@ static uint32_t plane_get_igt_format(igt_plane_t *plane)
  * Driver requirement: i915, xe
  * Functionality: kms_core, plane
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  */
 static void
@@ -388,7 +387,6 @@ plane_primary_overlay_mutable_zpos(igt_pipe_t *pipe, igt_output_t *output,
  * Driver requirement: i915, xe
  * Functionality: kms_core, plane
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  */
 static void
@@ -533,7 +531,6 @@ plane_immutable_zpos(igt_display_t *display, igt_pipe_t *pipe,
  * Driver requirement: i915, xe
  * Functionality: kms_core, plane
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -623,7 +620,6 @@ static void plane_primary(igt_pipe_t *pipe, igt_plane_t *plane, struct igt_fb *f
  * Driver requirement: i915, xe
  * Functionality: kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  */
 
@@ -741,7 +737,6 @@ static void plane_cursor(igt_pipe_t *pipe_obj,
  * Driver requirement: i915, xe
  * Functionality: kms_core, plane
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -844,7 +839,6 @@ static void plane_invalid_params_fence(igt_pipe_t *pipe,
  * Driver requirement: i915, xe
  * Functionality: kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -1007,7 +1001,6 @@ static void crtc_invalid_params_fence(igt_pipe_t *pipe,
  * Driver requirement: i915, xe
  * Functionality: kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  */
 
@@ -1158,7 +1151,6 @@ static void atomic_invalid_params(igt_pipe_t *pipe,
  * Driver requirement: i915, xe
  * Functionality: kms_core, plane
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  */
 static void atomic_plane_damage(igt_pipe_t *pipe, igt_plane_t *plane, struct igt_fb *fb)
diff --git a/tests/kms_atomic_interruptible.c b/tests/kms_atomic_interruptible.c
index c8a8ba447a29..0ae2435f9a52 100644
--- a/tests/kms_atomic_interruptible.c
+++ b/tests/kms_atomic_interruptible.c
@@ -85,7 +85,6 @@ static drmEventContext drm_events = {
  * Driver requirement: i915, xe
  * Functionality: kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -100,7 +99,6 @@ static drmEventContext drm_events = {
  * Driver requirement: i915, xe
  * Functionality: cursor, kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: legacy-dpms
@@ -108,7 +106,6 @@ static drmEventContext drm_events = {
  * Driver requirement: i915, xe
  * Functionality: dpms, kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: legacy-pageflip
@@ -116,7 +113,6 @@ static drmEventContext drm_events = {
  * Driver requirement: i915, xe
  * Functionality: kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  */
 
@@ -126,7 +122,6 @@ static drmEventContext drm_events = {
  * Driver requirement: i915, xe
  * Functionality: kms_core, plane
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index a470eb88cbc6..2fae952497a6 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -68,7 +68,6 @@ int *seqno;
  * Driver requirement: i915, xe
  * Functionality: plane, vblank, watermark
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  */
 static void
@@ -489,7 +488,6 @@ static void wait_for_transition(data_t *data, enum pipe pipe, bool nonblocking,
  * Driver requirement: i915, xe
  * Functionality: plane, watermark
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -504,7 +502,6 @@ static void wait_for_transition(data_t *data, enum pipe pipe, bool nonblocking,
  * Driver requirement: i915, xe
  * Functionality: plane, watermark
  * Mega feature: eDP
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -519,7 +516,6 @@ static void wait_for_transition(data_t *data, enum pipe pipe, bool nonblocking,
  * Driver requirement: i915, xe
  * Functionality: plane, watermark
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -536,7 +532,6 @@ static void wait_for_transition(data_t *data, enum pipe pipe, bool nonblocking,
  * Driver requirement: i915, xe
  * Functionality: plane, watermark
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: plane-use-after-nonblocking-%s
@@ -545,7 +540,6 @@ static void wait_for_transition(data_t *data, enum pipe pipe, bool nonblocking,
  * Driver requirement: i915, xe
  * Functionality: plane, watermark
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -1049,7 +1043,6 @@ retry:
  * Driver requirement: i915, xe
  * Functionality: plane, watermark
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
diff --git a/tests/kms_bw.c b/tests/kms_bw.c
index 5f787628c8cb..5f9a020da027 100644
--- a/tests/kms_bw.c
+++ b/tests/kms_bw.c
@@ -35,7 +35,6 @@
  * Driver requirement: i915, xe
  * Functionality: kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1].values: 1, 2, 3, 4, 5, 6, 7, 8
diff --git a/tests/kms_color.c b/tests/kms_color.c
index 0b6e1d6f0b0b..f59feabd4f5a 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -37,7 +37,6 @@ IGT_TEST_DESCRIPTION("Test Color Features at Pipe level");
  * Driver requirement: i915, xe
  * Functionality: colorspace
  * Mega feature: Color mgmt
- * Run type: FULL
  * Test category: functionality test
  */
 static bool test_pipe_degamma(data_t *data,
@@ -134,7 +133,6 @@ static bool test_pipe_degamma(data_t *data,
  * Driver requirement: i915, xe
  * Functionality: colorspace
  * Mega feature: Color mgmt
- * Run type: FULL
  * Test category: functionality test
  */
 
@@ -232,7 +230,6 @@ static bool test_pipe_gamma(data_t *data,
  * Driver requirement: i915, xe
  * Functionality: colorspace
  * Mega feature: Color mgmt
- * Run type: FULL
  * Test category: functionality test
  */
 
@@ -355,7 +352,6 @@ static bool test_pipe_legacy_gamma(data_t *data,
  * Driver requirement: i915, xe
  * Functionality: colorspace
  * Mega feature: Color mgmt
- * Run type: FULL
  * Test category: functionality test
  */
 
@@ -499,7 +495,6 @@ end:
  * Driver requirement: i915, xe
  * Functionality: colorspace
  * Mega feature: Color mgmt
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -880,7 +875,6 @@ out:
  * Driver requirement: i915, xe
  * Functionality: colorspace
  * Mega feature: Color mgmt
- * Run type: FULL
  * Test category: functionality test
  */
 static void
@@ -990,7 +984,6 @@ run_deep_color_tests_for_pipe(data_t *data, enum pipe p)
  * Driver requirement: i915, xe
  * Functionality: colorspace
  * Mega feature: Color mgmt
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
index a37b7d2fbd6b..d9cb197dea27 100644
--- a/tests/kms_concurrent.c
+++ b/tests/kms_concurrent.c
@@ -36,7 +36,6 @@
  * Driver requirement: i915, xe
  * Functionality: kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 3de31720795c..9378a76c1f78 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -496,7 +496,6 @@ test_fini(igt_output_t *output, enum igt_commit_style s)
  * Driver requirement: i915, xe
  * Functionality: hdcp1.4
  * Mega feature: HDCP
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: content_type_change
@@ -505,7 +504,6 @@ test_fini(igt_output_t *output, enum igt_commit_style s)
  * Driver requirement: i915, xe
  * Functionality: hdcp1.4, hdcp2.2
  * Mega feature: HDCP
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: mei_interface
@@ -514,7 +512,6 @@ test_fini(igt_output_t *output, enum igt_commit_style s)
  * Driver requirement: i915, xe
  * Functionality: hdcp1.4, hdcp2.2
  * Mega feature: HDCP
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: srm
@@ -523,7 +520,6 @@ test_fini(igt_output_t *output, enum igt_commit_style s)
  * Driver requirement: i915, xe
  * Functionality: hdcp1.4
  * Mega feature: HDCP
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: uevent
@@ -532,7 +528,6 @@ test_fini(igt_output_t *output, enum igt_commit_style s)
  * Driver requirement: i915, xe
  * Functionality: hdcp1.4
  * Mega feature: HDCP
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: %s
@@ -540,7 +535,6 @@ test_fini(igt_output_t *output, enum igt_commit_style s)
  * Driver requirement: i915, xe
  * Functionality: hdcp1.4
  * Mega feature: HDCP
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -643,7 +637,6 @@ static void test_cp_lic_on_mst(igt_output_t *mst_outputs[], int valid_outputs, b
  * Driver requirement: i915, xe
  * Functionality: hdcp1.4, mst
  * Mega feature: HDCP
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index 7151ccf809c7..76c01f5577a6 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -660,7 +660,6 @@ static bool require_cursor_size(data_t *data, int w, int h)
  * Driver requirement: i915, xe
  * Functionality: cursor, dpms
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: cursor-suspend
@@ -668,7 +667,6 @@ static bool require_cursor_size(data_t *data, int w, int h)
  * Driver requirement: i915, xe
  * Functionality: cursor, suspend
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: cursor-%s
@@ -676,7 +674,6 @@ static bool require_cursor_size(data_t *data, int w, int h)
  * Driver requirement: i915, xe
  * Functionality: cursor
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -792,7 +789,6 @@ static bool execution_constraint(enum pipe pipe)
  * Driver requirement: i915, xe
  * Functionality: cursor
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
diff --git a/tests/kms_cursor_edge_walk.c b/tests/kms_cursor_edge_walk.c
index 2b4b43282d90..1e233306d2f8 100644
--- a/tests/kms_cursor_edge_walk.c
+++ b/tests/kms_cursor_edge_walk.c
@@ -39,7 +39,6 @@
  * Driver requirement: i915, xe
  * Functionality: cursor
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 3fc2ece885d1..861581c93c3b 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -86,7 +86,6 @@ static void override_output_modes(igt_display_t *display,
  * Driver requirement: i915, xe
  * Functionality: cursor
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -575,7 +574,6 @@ enum basic_flip_cursor {
  * Description: Cursor test with %arg[1] mode
  * Driver requirement: i915, xe
  * Test category: functionality test
- * Run type: BAT, FULL
  * Functionality: cursor
  * Mega feature: General Display Features
  *
@@ -584,7 +582,6 @@ enum basic_flip_cursor {
  * Driver requirement: i915, xe
  * Functionality: cursor
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -598,7 +595,6 @@ enum basic_flip_cursor {
  * Description: Cursor test with %arg[1]
  * Driver requirement: i915, xe
  * Test category: functionality test
- * Run type: BAT, FULL
  * Functionality: cursor
  * Mega feature: General Display Features
  *
@@ -606,7 +602,6 @@ enum basic_flip_cursor {
  * Description: Cursor test with %arg[1]
  * Driver requirement: i915, xe
  * Test category: functionality test
- * Run type: BAT, FULL
  * Functionality: cursor
  * Mega feature: General Display Features
  *
@@ -628,7 +623,6 @@ enum basic_flip_cursor {
  * Driver requirement: i915, xe
  * Functionality: cursor
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -654,7 +648,6 @@ enum basic_flip_cursor {
  * Driver requirement: i915, xe
  * Functionality: cursor
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -991,7 +984,6 @@ static void flip_vs_cursor(igt_display_t *display, enum flip_test mode, int nloo
  * Driver requirement: i915, xe
  * Functionality: cursor
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: nonblocking-modeset-vs-cursor-atomic
@@ -1000,7 +992,6 @@ static void flip_vs_cursor(igt_display_t *display, enum flip_test mode, int nloo
  * Driver requirement: i915, xe
  * Functionality: cursor
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  */
 static void nonblocking_modeset_vs_cursor(igt_display_t *display, int loops)
@@ -1109,7 +1100,6 @@ static void wait_for_modeset(igt_display_t *display, unsigned flags, int timeout
  * Driver requirement: i915, xe
  * Functionality: cursor
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -1132,7 +1122,6 @@ static void wait_for_modeset(igt_display_t *display, unsigned flags, int timeout
  * Driver requirement: i915, xe
  * Functionality: cursor
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -1334,7 +1323,6 @@ done:
  * Driver requirement: i915, xe
  * Functionality: cursor
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -1473,7 +1461,6 @@ static void cursor_vs_flip(igt_display_t *display, enum flip_test mode, int nloo
  * Driver requirement: i915, xe
  * Functionality: cursor
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -1622,7 +1609,6 @@ static void two_screens_cursor_vs_flip(igt_display_t *display, int nloops, bool
  * Driver requirement: i915, xe
  * Functionality: cursor
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -1708,7 +1694,6 @@ static void flip_vs_cursor_crc(igt_display_t *display, bool atomic)
  * Driver requirement: i915, xe
  * Functionality: cursor
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -1835,7 +1820,6 @@ static void flip_vs_cursor_busy_crc(igt_display_t *display, bool atomic)
  * Driver requirement: i915, xe
  * Functionality: cursor
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  */
 static void modeset_atomic_cursor_hotspot(igt_display_t *display)
diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
index 738b7303afd0..f44d452b7bd4 100644
--- a/tests/kms_display_modes.c
+++ b/tests/kms_display_modes.c
@@ -212,7 +212,6 @@ static void run_extendedmode_basic(data_t *data,
  * Driver requirement: i915, xe
  * Functionality: kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  */
 static void run_extendedmode_test(data_t *data) {
@@ -267,7 +266,6 @@ static void run_extendedmode_test(data_t *data) {
  * Driver requirement: i915, xe
  * Functionality: kms_core, mst
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  */
 static void run_extendedmode_negative(data_t *data, int pipe1, int pipe2)
diff --git a/tests/kms_dither.c b/tests/kms_dither.c
index d74bee1f0f9d..c41961937b69 100644
--- a/tests/kms_dither.c
+++ b/tests/kms_dither.c
@@ -192,7 +192,6 @@ static bool is_supported(igt_output_t *output)
  * Driver requirement: i915, xe
  * Functionality: colorspace, kms_gem_interop
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: FB-8BPC-Vs-Panel-8BPC
@@ -200,7 +199,6 @@ static bool is_supported(igt_output_t *output)
  * Driver requirement: i915, xe
  * Functionality: colorspace, kms_gem_interop
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  */
 static void
diff --git a/tests/kms_dp_aux_dev.c b/tests/kms_dp_aux_dev.c
index d8f52920e2ab..e6a67e22ebed 100644
--- a/tests/kms_dp_aux_dev.c
+++ b/tests/kms_dp_aux_dev.c
@@ -41,7 +41,6 @@
  * Driver requirement: i915, xe
  * Functionality: dp_aux
  * Mega feature: DP
- * Run type: FULL
  * Test category: functionality test
  */
 
diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index 23c71cee245b..a1ee3bf26543 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -48,7 +48,6 @@
  * Driver requirement: i915
  * Functionality: gtt, vblank
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: 2x-flip-vs-fences-interruptible
@@ -57,7 +56,6 @@
  * Driver requirement: i915, xe
  * Functionality: gtt, vblank
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: flip-vs-fences
@@ -65,7 +63,6 @@
  * Driver requirement: i915
  * Functionality: gtt, vblank
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: flip-vs-fences-interruptible
@@ -73,7 +70,6 @@
  * Driver requirement: i915
  * Functionality: gtt, vblank
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: dpms-off-confusion
@@ -81,7 +77,6 @@
  * Driver requirement: i915, xe
  * Functionality: dpms, vblank
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: dpms-off-confusion-interruptible
@@ -89,7 +84,6 @@
  * Driver requirement: i915, xe
  * Functionality: dpms, vblank
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: bo-too-big
@@ -97,7 +91,6 @@
  * Driver requirement: i915, xe
  * Functionality: kms_gem_interop, vblank
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: bo-too-big-interruptible
@@ -105,7 +98,6 @@
  * Driver requirement: i915, xe
  * Functionality: kms_gem_interop, vblank
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  */
 
@@ -115,7 +107,6 @@
  * Driver requirement: i915, xe
  * Functionality: vblank
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: 2x-%s
@@ -123,7 +114,6 @@
  * Driver requirement: i915, xe
  * Functionality: vblank
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -152,7 +142,6 @@
  * Driver requirement: i915, xe
  * Functionality: suspend, vblank
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: 2x-flip-vs-suspend
@@ -161,7 +150,6 @@
  * Driver requirement: i915, xe
  * Functionality: suspend, vblank
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: flip-vs-suspend-interruptible
@@ -169,7 +157,6 @@
  * Driver requirement: i915, xe
  * Functionality: suspend, vblank
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: 2x-flip-vs-suspend-interruptible
@@ -178,7 +165,6 @@
  * Driver requirement: i915, xe
  * Functionality: suspend, vblank
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: %s
@@ -186,7 +172,6 @@
  * Driver requirement: i915, xe
  * Functionality: dpms, vblank
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: 2x-%s
@@ -194,7 +179,6 @@
  * Driver requirement: i915, xe
  * Functionality: dpms, vblank
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: %s-interruptible
@@ -202,7 +186,6 @@
  * Driver requirement: i915, xe
  * Functionality: vblank
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: 2x-%s-interruptible
@@ -210,7 +193,6 @@
  * Driver requirement: i915, xe
  * Functionality: vblank
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -229,7 +211,6 @@
  * Driver requirement: i915, xe
  * Functionality: dpms, vblank
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: 2x-%s
@@ -237,7 +218,6 @@
  * Driver requirement: i915, xe
  * Functionality: vblank
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -253,7 +233,6 @@
  * Driver requirement: i915, xe
  * Functionality: vblank
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: 2x-%s-interruptible
@@ -262,7 +241,6 @@
  * Driver requirement: i915, xe
  * Functionality: vblank
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -1809,7 +1787,6 @@ static void run_test_on_crtc_set(struct test_output *o, int *crtc_idxs,
  * Description: Basic test to valide pageflip with dpms
  * Driver requirement: i915, xe
  * Test category: functionality test
- * Run type: BAT, FULL
  * Functionality: dpms, vblank
  * Mega feature: General Display Features
  *
@@ -1817,7 +1794,6 @@ static void run_test_on_crtc_set(struct test_output *o, int *crtc_idxs,
  * Description: Basic test to valide pageflip with %arg[1]
  * Driver requirement: i915, xe
  * Test category: functionality test
- * Run type: BAT, FULL
  * Functionality: vblank
  * Mega feature: General Display Features
  *
@@ -1830,7 +1806,6 @@ static void run_test_on_crtc_set(struct test_output *o, int *crtc_idxs,
  * Description: Basic test for validating page flip
  * Driver requirement: i915, xe
  * Test category: functionality test
- * Run type: BAT, FULL
  * Functionality: vblank
  * Mega feature: General Display Features
  */
@@ -2023,7 +1998,6 @@ static void kms_flip_exit_handler(int sig)
  * Driver requirement: i915, xe
  * Functionality: vblank
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  */
 static void test_nonblocking_read(int in)
diff --git a/tests/kms_flip_event_leak.c b/tests/kms_flip_event_leak.c
index d638a4495f49..57f6f64f7215 100644
--- a/tests/kms_flip_event_leak.c
+++ b/tests/kms_flip_event_leak.c
@@ -44,7 +44,6 @@
  * Driver requirement: i915, xe
  * Functionality: kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  */
 
diff --git a/tests/kms_force_connector_basic.c b/tests/kms_force_connector_basic.c
index 5fe8bf52e7d9..e3b9034db6af 100644
--- a/tests/kms_force_connector_basic.c
+++ b/tests/kms_force_connector_basic.c
@@ -75,7 +75,6 @@ static void reset_connectors(void)
  * Driver requirement: i915
  * Functionality: force_connector, vga
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  */
 static void force_load_detect(int drm_fd, drmModeConnectorPtr connector, drmModeRes *res)
@@ -171,7 +170,6 @@ static void force_load_detect(int drm_fd, drmModeConnectorPtr connector, drmMode
  * Description: Test to check the forced connector state
  * Driver requirement: i915, xe
  * Test category: functionality test
- * Run type: BAT, FULL
  * Functionality: force_connector
  * Mega feature: General Display Features
  */
@@ -219,7 +217,6 @@ static void force_connector_state(int drm_fd, drmModeConnectorPtr connector)
  * Description: Test to check the values after forcing edid
  * Driver requirement: i915, xe
  * Test category: functionality test
- * Run type: BAT, FULL
  * Functionality: force_connector
  * Mega feature: General Display Features
  */
@@ -269,7 +266,6 @@ static void force_edid(int drm_fd, drmModeConnectorPtr connector)
  * Description: Tests pruning of stale modes
  * Driver requirement: i915, xe
  * Test category: functionality test
- * Run type: BAT, FULL
  * Functionality: force_connector
  * Mega feature: General Display Features
  */
diff --git a/tests/kms_getfb.c b/tests/kms_getfb.c
index 6ee58caabee0..059f66d99d28 100644
--- a/tests/kms_getfb.c
+++ b/tests/kms_getfb.c
@@ -184,7 +184,6 @@ static uint32_t get_any_prop_id(int fd)
  * Driver requirement: i915, xe
  * Functionality: kms_gem_interop
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -256,7 +255,6 @@ static void test_handle_input(int fd)
  * Driver requirement: i915, xe
  * Functionality: ccs, kms_gem_interop, tiling
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: getfb-%s-different-handles
@@ -265,7 +263,6 @@ static void test_handle_input(int fd)
  * Driver requirement: i915, xe
  * Functionality: kms_gem_interop
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -344,7 +341,6 @@ static void test_duplicate_handles(int fd)
  * Driver requirement: i915, xe
  * Functionality: ccs, kms_gem_interop, tiling
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: getfb2-into-addfb2
@@ -352,7 +348,6 @@ static void test_duplicate_handles(int fd)
  * Driver requirement: i915, xe
  * Functionality: kms_gem_interop
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: getfb2-handle-%s
@@ -360,7 +355,6 @@ static void test_duplicate_handles(int fd)
  * Driver requirement: i915, xe
  * Functionality: kms_gem_interop
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -483,7 +477,6 @@ static void test_getfb2(int fd)
  * Driver requirement: i915, xe
  * Functionality: kms_gem_interop
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
diff --git a/tests/kms_hdmi_inject.c b/tests/kms_hdmi_inject.c
index ba2d457ccb3c..61f62fa7c7b2 100644
--- a/tests/kms_hdmi_inject.c
+++ b/tests/kms_hdmi_inject.c
@@ -44,7 +44,6 @@
  * Driver requirement: i915, xe
  * Functionality: force_connector, hdmi_edid
  * Mega feature: HDMI
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: inject-audio
@@ -53,7 +52,6 @@
  * Driver requirement: i915, xe
  * Functionality: audio, force_connector
  * Mega feature: HDMI
- * Run type: FULL
  * Test category: functionality test
  */
 
diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index 1a5b5ead839a..ed98a0c26126 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -219,7 +219,6 @@ static bool has_max_bpc(igt_output_t *output)
  * Driver requirement: i915, xe
  * Functionality: colorspace, hdr
  * Mega feature: HDR
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: bpc-switch-dpms
@@ -227,7 +226,6 @@ static bool has_max_bpc(igt_output_t *output)
  * Driver requirement: i915, xe
  * Functionality: colorspace, dpms, hdr
  * Mega feature: HDR
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: bpc-switch-suspend
@@ -235,7 +233,6 @@ static bool has_max_bpc(igt_output_t *output)
  * Driver requirement: i915, xe
  * Functionality: colorspace, hdr, suspend
  * Mega feature: HDR
- * Run type: FULL
  * Test category: functionality test
  */
 static void test_bpc_switch(data_t *data, uint32_t flags)
@@ -597,7 +594,6 @@ static bool has_hdr(igt_output_t *output)
  * Driver requirement: i915, xe
  * Functionality: colorspace, hdr
  * Mega feature: HDR
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: invalid-metadata-sizes
@@ -605,7 +601,6 @@ static bool has_hdr(igt_output_t *output)
  * Driver requirement: i915, xe
  * Functionality: colorspace, hdr
  * Mega feature: HDR
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: static-toggle-dpms
@@ -613,7 +608,6 @@ static bool has_hdr(igt_output_t *output)
  * Driver requirement: i915, xe
  * Functionality: colorspace, dpms, hdr
  * Mega feature: HDR
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: static-toggle-suspend
@@ -621,7 +615,6 @@ static bool has_hdr(igt_output_t *output)
  * Driver requirement: i915, xe
  * Functionality: colorspace, hdr, suspend
  * Mega feature: HDR
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: static-%s
@@ -629,7 +622,6 @@ static bool has_hdr(igt_output_t *output)
  * Driver requirement: i915, xe
  * Functionality: colorspace, hdr
  * Mega feature: HDR
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c
index 306fa972f727..017c2c1951fb 100644
--- a/tests/kms_invalid_mode.c
+++ b/tests/kms_invalid_mode.c
@@ -39,7 +39,6 @@
  * Driver requirement: i915, xe
  * Functionality: kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
diff --git a/tests/kms_lease.c b/tests/kms_lease.c
index fcdb2dbe61de..9ada6d5ea3a1 100644
--- a/tests/kms_lease.c
+++ b/tests/kms_lease.c
@@ -56,7 +56,6 @@
  * Driver requirement: i915, xe
  * Functionality: lease
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: cursor_implicit_plane
@@ -64,7 +63,6 @@
  * Driver requirement: i915, xe
  * Functionality: lease
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: empty_lease
@@ -72,7 +70,6 @@
  * Driver requirement: i915, xe
  * Functionality: lease
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: implicit-plane-lease
@@ -80,7 +77,6 @@
  * Driver requirement: i915, xe
  * Functionality: lease
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: invalid-create-leases
@@ -89,7 +85,6 @@
  * Driver requirement: i915, xe
  * Functionality: lease
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: lease-uevent
@@ -97,7 +92,6 @@
  * Driver requirement: i915, xe
  * Functionality: lease
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: lease_again
@@ -105,7 +99,6 @@
  * Driver requirement: i915, xe
  * Functionality: lease
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: lease_get
@@ -113,7 +106,6 @@
  * Driver requirement: i915, xe
  * Functionality: lease
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: lease_invalid_connector
@@ -121,7 +113,6 @@
  * Driver requirement: i915, xe
  * Functionality: lease
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: lease_invalid_crtc
@@ -129,7 +120,6 @@
  * Driver requirement: i915, xe
  * Functionality: lease
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: lease_invalid_plane
@@ -137,7 +127,6 @@
  * Driver requirement: i915, xe
  * Functionality: lease
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: lease_revoke
@@ -145,7 +134,6 @@
  * Driver requirement: i915, xe
  * Functionality: lease
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: lease_unleased_connector
@@ -153,7 +141,6 @@
  * Driver requirement: i915, xe
  * Functionality: lease
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: lease_unleased_crtc
@@ -161,7 +148,6 @@
  * Driver requirement: i915, xe
  * Functionality: lease
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: lessee_list
@@ -169,7 +155,6 @@
  * Driver requirement: i915, xe
  * Functionality: lease
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: master-vs-lease
@@ -177,7 +162,6 @@
  * Driver requirement: i915, xe
  * Functionality: lease
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: multimaster-lease
@@ -187,7 +171,6 @@
  * Driver requirement: i915, xe
  * Functionality: lease
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: page_flip_implicit_plane
@@ -195,7 +178,6 @@
  * Driver requirement: i915, xe
  * Functionality: lease
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: possible-crtcs-filtering
@@ -205,7 +187,6 @@
  * Driver requirement: i915, xe
  * Functionality: lease
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: setcrtc_implicit_plane
@@ -213,7 +194,6 @@
  * Driver requirement: i915, xe
  * Functionality: lease
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: simple_lease
@@ -221,7 +201,6 @@
  * Driver requirement: i915, xe
  * Functionality: lease
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  */
 
diff --git a/tests/kms_multipipe_modeset.c b/tests/kms_multipipe_modeset.c
index 801e3144bec5..a968a3513180 100644
--- a/tests/kms_multipipe_modeset.c
+++ b/tests/kms_multipipe_modeset.c
@@ -36,7 +36,6 @@
  * Driver requirement: i915, xe
  * Functionality: kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  */
 
diff --git a/tests/kms_panel_fitting.c b/tests/kms_panel_fitting.c
index b36ed4636ea8..a583e1435717 100644
--- a/tests/kms_panel_fitting.c
+++ b/tests/kms_panel_fitting.c
@@ -36,7 +36,6 @@
  * Driver requirement: i915, xe
  * Functionality: eDP, panel_fitting, scaling
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: legacy
@@ -44,7 +43,6 @@
  * Driver requirement: i915, xe
  * Functionality: eDP, panel_fitting, scaling
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  */
 
diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
index c085fb971ab4..d980c3786737 100644
--- a/tests/kms_pipe_crc_basic.c
+++ b/tests/kms_pipe_crc_basic.c
@@ -71,7 +71,6 @@ static bool simulation_constraint(enum pipe pipe)
  * Driver requirement: i915, xe
  * Functionality: crc
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  */
 static void test_bad_source(data_t *data)
@@ -100,7 +99,6 @@ enum {
  * Description: Test for pipe CRC reads
  * Driver requirement: i915, xe
  * Test category: functionality test
- * Run type: BAT, FULL
  * Functionality: crc
  * Mega feature: General Display Features
  *
@@ -108,7 +106,6 @@ enum {
  * Description: Tests the pipe CRC read and ensure frame sequence
  * Driver requirement: i915, xe
  * Test category: functionality test
- * Run type: BAT, FULL
  * Functionality: crc
  * Mega feature: General Display Features
  *
@@ -116,7 +113,6 @@ enum {
  * Description: Test for O_NONBLOCK CRC reads
  * Driver requirement: i915, xe
  * Test category: functionality test
- * Run type: BAT, FULL
  * Functionality: crc
  * Mega feature: General Display Features
  *
@@ -124,7 +120,6 @@ enum {
  * Description: Test for O_NONBLOCK CRC reads and ensure frame sequence
  * Driver requirement: i915, xe
  * Test category: functionality test
- * Run type: BAT, FULL
  * Functionality: crc
  * Mega feature: General Display Features
  *
@@ -132,7 +127,6 @@ enum {
  * Description: Suspend test for pipe CRC reads
  * Driver requirement: i915, xe
  * Test category: functionality test
- * Run type: BAT, FULL
  * Functionality: crc, suspend
  * Mega feature: General Display Features
  *
@@ -140,7 +134,6 @@ enum {
  * Description: Hang test for pipe CRC read
  * Driver requirement: i915, xe
  * Test category: functionality test
- * Run type: BAT, FULL
  * Functionality: crc, hang
  * Mega feature: General Display Features
  */
@@ -246,7 +239,6 @@ static void test_read_crc(data_t *data, enum pipe pipe,
  * Description: Basic sanity check for CRC mismatches with %arg[1]
  * Driver requirement: i915, xe
  * Test category: functionality test
- * Run type: BAT, FULL
  * Functionality: crc, pixel_format
  * Mega feature: General Display Features
  *
@@ -328,7 +320,6 @@ static void test_compare_crc(data_t *data, enum pipe pipe, igt_output_t *output,
  * Driver requirement: i915, xe
  * Functionality: crc
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  */
 static void test_disable_crc_after_crtc(data_t *data, enum pipe pipe,
diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index d8b5dca9c674..9a515559c9b0 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -290,7 +290,6 @@ test_plane_position_with_output(data_t *data,
  * Driver requirement: i915, xe
  * Functionality: plane
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: plane-position-hole-dpms
@@ -299,7 +298,6 @@ test_plane_position_with_output(data_t *data,
  * Driver requirement: i915, xe
  * Functionality: dpms, plane
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -421,7 +419,6 @@ test_plane_panning_with_output(data_t *data,
  * Driver requirement: i915, xe
  * Functionality: plane
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: plane-panning-bottom-right-suspend
@@ -430,7 +427,6 @@ test_plane_panning_with_output(data_t *data,
  * Driver requirement: i915, xe
  * Functionality: plane, suspend
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -1169,7 +1165,6 @@ static bool skip_plane(data_t *data, igt_plane_t *plane)
  * Driver requirement: i915, xe
  * Functionality: pixel_format, plane
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -1239,7 +1234,6 @@ test_pixel_formats(data_t *data, enum pipe pipe)
  * Driver requirement: i915, xe
  * Functionality: pixel_format, plane
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  */
 static void test_invalid_settings(data_t *data)
diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
index d4458ac69fa5..bff624ebef18 100644
--- a/tests/kms_plane_alpha_blend.c
+++ b/tests/kms_plane_alpha_blend.c
@@ -488,7 +488,6 @@ static void coverage_premult_constant(data_t *data, enum pipe pipe, igt_plane_t
  * Driver requirement: i915, xe
  * Functionality: plane
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -506,7 +505,6 @@ static void coverage_premult_constant(data_t *data, enum pipe pipe, igt_plane_t
  * Driver requirement: i915, xe
  * Functionality: plane
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: coverage-7efc
@@ -515,7 +513,6 @@ static void coverage_premult_constant(data_t *data, enum pipe pipe, igt_plane_t
  * Driver requirement: i915, xe
  * Functionality: plane
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: constant-alpha-%s
@@ -523,7 +520,6 @@ static void coverage_premult_constant(data_t *data, enum pipe pipe, igt_plane_t
  * Driver requirement: i915, xe
  * Functionality: plane
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
index 319a8ecaa7eb..22c5a709d1f5 100644
--- a/tests/kms_plane_cursor.c
+++ b/tests/kms_plane_cursor.c
@@ -32,7 +32,6 @@
  * Driver requirement: i915, xe
  * Functionality: cursor, plane
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: primary
@@ -40,7 +39,6 @@
  * Driver requirement: i915, xe
  * Functionality: cursor, plane
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: viewport
@@ -49,7 +47,6 @@
  * Driver requirement: i915, xe
  * Functionality: cursor, plane
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  */
 
diff --git a/tests/kms_plane_lowres.c b/tests/kms_plane_lowres.c
index ea6c08200320..d9a175c9bd0e 100644
--- a/tests/kms_plane_lowres.c
+++ b/tests/kms_plane_lowres.c
@@ -274,7 +274,6 @@ static void test_cleanup(data_t *data)
  * Driver requirement: i915, xe
  * Functionality: plane
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: tiling-%s
@@ -283,7 +282,6 @@ static void test_cleanup(data_t *data)
  * Driver requirement: i915, xe
  * Functionality: plane, tiling
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
index c381d2e5ab6f..b1ae35161383 100644
--- a/tests/kms_plane_multiple.c
+++ b/tests/kms_plane_multiple.c
@@ -386,7 +386,6 @@ test_plane_position(data_t *data, enum pipe pipe, igt_output_t *output, uint64_t
  * Driver requirement: i915, xe
  * Functionality: plane
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: tiling-%s
@@ -396,7 +395,6 @@ test_plane_position(data_t *data, enum pipe pipe, igt_output_t *output, uint64_t
  * Driver requirement: i915, xe
  * Functionality: plane, tiling
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index a7d60d6fc69a..299f55960f6e 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -535,7 +535,6 @@ static const uint64_t modifiers[] = {
  * Driver requirement: i915, xe
  * Functionality: plane, scaling
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: plane-scaler-with-clipping-clamping-modifiers
@@ -543,7 +542,6 @@ static const uint64_t modifiers[] = {
  * Driver requirement: i915, xe
  * Functionality: plane, scaling
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: plane-upscale-with-modifiers-%s
@@ -551,7 +549,6 @@ static const uint64_t modifiers[] = {
  * Driver requirement: i915, xe
  * Functionality: plane, scaling
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -566,7 +563,6 @@ static const uint64_t modifiers[] = {
  * Driver requirement: i915, xe
  * Functionality: plane, scaling
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -613,7 +609,6 @@ static void test_scaler_with_modifier_pipe(data_t *d,
  * Driver requirement: i915, xe
  * Functionality: plane, scaling
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: plane-scaler-with-clipping-clamping-rotation
@@ -621,7 +616,6 @@ static void test_scaler_with_modifier_pipe(data_t *d,
  * Driver requirement: i915, xe
  * Functionality: plane, scaling
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: plane-upscale-with-rotation-%s
@@ -629,7 +623,6 @@ static void test_scaler_with_modifier_pipe(data_t *d,
  * Driver requirement: i915, xe
  * Functionality: plane, scaling
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -644,7 +637,6 @@ static void test_scaler_with_modifier_pipe(data_t *d,
  * Driver requirement: i915, xe
  * Functionality: plane, scaling
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -692,7 +684,6 @@ static void test_scaler_with_rotation_pipe(data_t *d,
  * Driver requirement: i915, xe
  * Functionality: pixel_formats, plane, scaling
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: plane-scaler-with-clipping-clamping-pixel-formats
@@ -700,7 +691,6 @@ static void test_scaler_with_rotation_pipe(data_t *d,
  * Driver requirement: i915, xe
  * Functionality: pixel_formats, plane, scaling
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: plane-upscale-with-pixel-format-%s
@@ -708,7 +698,6 @@ static void test_scaler_with_rotation_pipe(data_t *d,
  * Driver requirement: i915, xe
  * Functionality: pixel_formats, plane, scaling
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -723,7 +712,6 @@ static void test_scaler_with_rotation_pipe(data_t *d,
  * Driver requirement: i915, xe
  * Functionality: pixel_formats, plane, scaling
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -873,7 +861,6 @@ static void setup_fb(int fd, int width, int height, struct igt_fb *fb)
  * Driver requirement: i915, xe
  * Functionality: plane, scaling
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -889,7 +876,6 @@ static void setup_fb(int fd, int width, int height, struct igt_fb *fb)
  * Driver requirement: i915, xe
  * Functionality: plane, scaling
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -910,7 +896,6 @@ static void setup_fb(int fd, int width, int height, struct igt_fb *fb)
  * Driver requirement: i915, xe
  * Functionality: plane, scaling
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: planes-upscale-%s
@@ -918,7 +903,6 @@ static void setup_fb(int fd, int width, int height, struct igt_fb *fb)
  * Driver requirement: i915, xe
  * Functionality: plane, scaling
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -933,7 +917,6 @@ static void setup_fb(int fd, int width, int height, struct igt_fb *fb)
  * Driver requirement: i915, xe
  * Functionality: plane, scaling
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -1013,7 +996,6 @@ test_planes_scaling_combo(data_t *d, int w1, int h1, int w2, int h2,
  * Driver requirement: i915, xe
  * Functionality: plane, scaling
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  */
 static void
@@ -1087,7 +1069,6 @@ test_invalid_num_scalers(data_t *d, enum pipe pipe, igt_output_t *output)
  * Driver requirement: i915, xe
  * Functionality: plane, scaling
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  */
 static void test_scaler_with_multi_pipe_plane(data_t *d)
@@ -1180,7 +1161,6 @@ static void test_scaler_with_multi_pipe_plane(data_t *d)
  * Driver requirement: i915, xe
  * Functionality: plane, scaling
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  */
 static void invalid_parameter_tests(data_t *d)
@@ -1269,7 +1249,6 @@ static drmModeModeInfo *find_mode(data_t *data, igt_output_t *output, const uint
  * Driver requirement: i915, xe
  * Functionality: plane, scaling
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  */
 
diff --git a/tests/kms_prime.c b/tests/kms_prime.c
index a14006147252..14e44869d0b0 100644
--- a/tests/kms_prime.c
+++ b/tests/kms_prime.c
@@ -40,7 +40,6 @@
  * Driver requirement: i915, xe
  * Functionality: hybrid, kms_gem_interop
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: basic-modeset-hybrid
@@ -48,7 +47,6 @@
  * Driver requirement: i915, xe
  * Functionality: hybrid, kms_gem_interop
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: basic-crc-%s
@@ -57,7 +55,6 @@
  * Driver requirement: i915, xe
  * Functionality: crc, hybrid, kms_gem_interop
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
diff --git a/tests/kms_prop_blob.c b/tests/kms_prop_blob.c
index 0dfd38af6c01..c92525227304 100644
--- a/tests/kms_prop_blob.c
+++ b/tests/kms_prop_blob.c
@@ -129,7 +129,6 @@ destroy_prop(int fd, uint32_t prop_id)
  * Driver requirement: i915, xe
  * Functionality: kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: blob-prop-%s
@@ -137,7 +136,6 @@ destroy_prop(int fd, uint32_t prop_id)
  * Driver requirement: i915, xe
  * Functionality: kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -271,7 +269,6 @@ test_core(int fd)
  * Description: Test to ensure property support exists
  * Driver requirement: i915, xe
  * Test category: functionality test
- * Run type: BAT, FULL
  * Functionality: kms_core
  * Mega feature: General Display Features
  */
@@ -291,7 +288,6 @@ test_basic(int fd)
  * Driver requirement: i915, xe
  * Functionality: kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index 50ffa91b57a1..3284366228c0 100644
--- a/tests/kms_properties.c
+++ b/tests/kms_properties.c
@@ -38,7 +38,6 @@
  * Driver requirement: i915, xe
  * Functionality: kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -720,7 +719,6 @@ static void expect_no_props(int fd, uint32_t obj_type, uint32_t obj_id)
  * Driver requirement: i915, xe
  * Functionality: kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
diff --git a/tests/kms_rmfb.c b/tests/kms_rmfb.c
index a4628129c4ea..6c6cdffba511 100644
--- a/tests/kms_rmfb.c
+++ b/tests/kms_rmfb.c
@@ -40,7 +40,6 @@
  * Driver requirement: i915, xe
  * Functionality: kms_gem_interop
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: rmfb-ioctl
@@ -49,7 +48,6 @@
  * Driver requirement: i915, xe
  * Functionality: kms_gem_interop
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  */
 
diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index f08d31e37ca5..f171fcd22c69 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -485,7 +485,6 @@ static bool test_format(data_t *data,
  * Driver requirement: i915, xe
  * Functionality: plane, rotation
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -501,7 +500,6 @@ static bool test_format(data_t *data,
  * Driver requirement: i915, xe
  * Functionality: plane, rotation
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -518,7 +516,6 @@ static bool test_format(data_t *data,
  * Driver requirement: i915, xe
  * Functionality: plane, rotation
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: bad-tiling
@@ -526,7 +523,6 @@ static bool test_format(data_t *data,
  * Driver requirement: i915, xe
  * Functionality: plane, rotation, tiling
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  */
 
@@ -536,7 +532,6 @@ static bool test_format(data_t *data,
  * Driver requirement: i915, xe
  * Functionality: plane, rotation, tiling
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -555,7 +550,6 @@ static bool test_format(data_t *data,
  * Driver requirement: i915, xe
  * Functionality: plane, rotation, tiling
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -570,7 +564,6 @@ static bool test_format(data_t *data,
  * Driver requirement: i915, xe
  * Functionality: plane, rotation
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  */
 static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_format)
@@ -898,7 +891,6 @@ static bool reusecrcfromlastround(planeinfos p[2], int lastroundp1format,
  * Driver requirement: i915, xe
  * Functionality: plane, rotation
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: multiplane-rotation-cropping-%s
@@ -907,7 +899,6 @@ static bool reusecrcfromlastround(planeinfos p[2], int lastroundp1format,
  * Driver requirement: i915, xe
  * Functionality: plane, rotation
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -1119,7 +1110,6 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
  * Driver requirement: i915
  * Functionality: plane, rotation
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  */
 static void test_plane_rotation_exhaust_fences(data_t *data,
diff --git a/tests/kms_scaling_modes.c b/tests/kms_scaling_modes.c
index d32e02dacc9d..bd7ed7e5630b 100644
--- a/tests/kms_scaling_modes.c
+++ b/tests/kms_scaling_modes.c
@@ -35,7 +35,6 @@
  * Driver requirement: i915, xe
  * Functionality: eDP, plane, scaling
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
diff --git a/tests/kms_selftest.c b/tests/kms_selftest.c
index b1416a16c47e..080ffdf2c05e 100644
--- a/tests/kms_selftest.c
+++ b/tests/kms_selftest.c
@@ -33,7 +33,6 @@
  * Driver requirement: i915, xe
  * Functionality: kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
diff --git a/tests/kms_sequence.c b/tests/kms_sequence.c
index 1c825784e527..9476203e9394 100644
--- a/tests/kms_sequence.c
+++ b/tests/kms_sequence.c
@@ -147,7 +147,6 @@ static int crtc_queue_sequence(int fd, struct drm_crtc_queue_sequence *cqs)
  * Driver requirement: i915, xe
  * Functionality: vblank
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -164,7 +163,6 @@ static int crtc_queue_sequence(int fd, struct drm_crtc_queue_sequence *cqs)
  * Driver requirement: i915, xe
  * Functionality: vblank
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index e32c53480c10..32a6fb6907fd 100644
--- a/tests/kms_setmode.c
+++ b/tests/kms_setmode.c
@@ -43,7 +43,6 @@
  * Driver requirement: i915, xe
  * Functionality: kms_core, vblank
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: basic-clone-single-crtc
@@ -52,7 +51,6 @@
  * Driver requirement: i915, xe
  * Functionality: kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: clone-exclusive-crtc
@@ -61,7 +59,6 @@
  * Driver requirement: i915, xe
  * Functionality: kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: invalid-clone-exclusive-crtc
@@ -70,7 +67,6 @@
  * Driver requirement: i915, xe
  * Functionality: kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: invalid-clone-single-crtc
@@ -79,7 +75,6 @@
  * Driver requirement: i915, xe
  * Functionality: kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: invalid-clone-single-crtc-stealing
@@ -88,7 +83,6 @@
  * Driver requirement: i915, xe
  * Functionality: kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  */
 
diff --git a/tests/kms_sysfs_edid_timing.c b/tests/kms_sysfs_edid_timing.c
index 3a440ed98782..ee47a024ea44 100644
--- a/tests/kms_sysfs_edid_timing.c
+++ b/tests/kms_sysfs_edid_timing.c
@@ -39,7 +39,6 @@
  * Driver requirement: i915, xe
  * Functionality: kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  */
 
diff --git a/tests/kms_tiled_display.c b/tests/kms_tiled_display.c
index fbca3890d70a..519c3754c39c 100644
--- a/tests/kms_tiled_display.c
+++ b/tests/kms_tiled_display.c
@@ -54,7 +54,6 @@
  * Driver requirement: i915, xe
  * Functionality: tiled_display
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: basic-test-pattern-with-chamelium
@@ -63,7 +62,6 @@
  * Driver requirement: i915, xe
  * Functionality: chamelium, tiled_display
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  */
 
diff --git a/tests/kms_tv_load_detect.c b/tests/kms_tv_load_detect.c
index dee82dc89c00..67dbb242edfc 100644
--- a/tests/kms_tv_load_detect.c
+++ b/tests/kms_tv_load_detect.c
@@ -33,7 +33,6 @@
  * Driver requirement: i915, xe
  * Functionality: obsolete
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  */
 
diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
index 09d7a76460ef..8aa43a929531 100644
--- a/tests/kms_universal_plane.c
+++ b/tests/kms_universal_plane.c
@@ -38,7 +38,6 @@
  * Driver requirement: i915, xe
  * Functionality: cursor, plane
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: disable-primary-vs-flip-pipe-%s
@@ -47,7 +46,6 @@
  * Driver requirement: i915, xe
  * Functionality: plane
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: universal-plane-pageflip-windowed-pipe-%s
@@ -55,7 +53,6 @@
  * Driver requirement: i915, xe
  * Functionality: plane
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -76,7 +73,6 @@
  * Driver requirement: i915, xe
  * Functionality: plane
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
index 0cc21bb5fee8..57bc62ab3c2b 100644
--- a/tests/kms_vblank.c
+++ b/tests/kms_vblank.c
@@ -50,7 +50,6 @@
  * Driver requirement: i915, xe
  * Functionality: vblank
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: invalid
@@ -58,7 +57,6 @@
  * Driver requirement: i915, xe
  * Functionality: vblank
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  */
 
@@ -69,7 +67,6 @@
  * Driver requirement: i915, xe
  * Functionality: dpms, hang, rpm, vblank
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -91,7 +88,6 @@
  * Driver requirement: i915, xe
  * Functionality: dpms, hang, suspend, vblank
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -113,7 +109,6 @@
  * Driver requirement: i915, xe
  * Functionality: hang, suspend, vblank
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -135,7 +130,6 @@
  * Driver requirement: i915, xe
  * Functionality: hang, rpm, vblank
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
@@ -157,7 +151,6 @@
  * Driver requirement: i915, xe
  * Functionality: hang, vblank
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: pipe-%s-%s
@@ -165,7 +158,6 @@
  * Driver requirement: i915, xe
  * Functionality: hang, vblank
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: pipe-%s-%s-hang
@@ -173,7 +165,6 @@
  * Driver requirement: i915, xe
  * Functionality: hang, vblank
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * arg[1]:
diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index d7ede65131d1..e203fd4d596e 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -35,7 +35,6 @@
  * Driver requirement: i915, xe
  * Functionality: adaptive_sync
  * Mega feature: VRR
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: flip-dpms
@@ -44,7 +43,6 @@
  * Driver requirement: i915, xe
  * Functionality: adaptive_sync, dpms
  * Mega feature: VRR
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: flip-suspend
@@ -53,7 +51,6 @@
  * Driver requirement: i915, xe
  * Functionality: adaptive_sync, suspend
  * Mega feature: VRR
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: flipline
@@ -61,7 +58,6 @@
  * Driver requirement: i915, xe
  * Functionality: adaptive_sync
  * Mega feature: VRR
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: negative-basic
@@ -69,7 +65,6 @@
  * Driver requirement: i915, xe
  * Functionality: adaptive_sync
  * Mega feature: VRR
- * Run type: FULL
  * Test category: functionality test
  */
 
diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index fce6554ce3de..a69cf6609aeb 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -45,7 +45,6 @@
  * Driver requirement: i915, xe
  * Functionality: kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: writeback-fb-id
@@ -53,7 +52,6 @@
  * Driver requirement: i915, xe
  * Functionality: kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: writeback-invalid-parameters
@@ -63,7 +61,6 @@
  * Driver requirement: i915, xe
  * Functionality: kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: writeback-pixel-formats
@@ -71,7 +68,6 @@
  * Driver requirement: i915, xe
  * Functionality: kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  */
 
diff --git a/tests/testdisplay.c b/tests/testdisplay.c
index 0a6d2718a6ea..42218210ff08 100644
--- a/tests/testdisplay.c
+++ b/tests/testdisplay.c
@@ -80,7 +80,6 @@
  * Driver requirement: i915, xe
  * Functionality: kms_core
  * Mega feature: General Display Features
- * Run type: FULL
  * Test category: functionality test
  */
 IGT_TEST_DESCRIPTION("Tests basic display functionality.");
-- 
2.41.0
