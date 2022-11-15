Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D30D10E08C
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Nov 2022 17:53:02 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id s20so10006766qkg.5
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Nov 2022 09:53:02 -0800 (PST)
From: Mark Yacoub <markyacoub@chromium.org>
To: igt-dev@lists.freedesktop.org
Date: Tue, 15 Nov 2022 12:52:57 -0500
Message-Id: <20221115175257.3988088-1-markyacoub@chromium.org>
In-Reply-To: <20221110174133.262111-1-markyacoub@chromium.org>
References: <20221110174133.262111-1-markyacoub@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v3] [NEW] Chamelium: Add new EDID Resolution List
 test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: robdclark@chromium.org, vsuley@google.com, petri.latvala@intel.com,
 ihf@google.com, amstan@chromium.org, kalin@google.com, seanpaul@chromium.org,
 matthewtlam@google.com, khaled.almahallawy@intel.com, markyacoub@google.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

[Why]
1. Users can change resolutions of monitors on the fly.
2. Monitors can come with different shapes and form aka different modes.
Test a change between different modes on the fly.

[How]
1. Created an EDID based on a random combination of screen size, Refresh
   Rate and Aspect Ratio.
2. Set that EDID to Chamelium.
3. Iterate over every mode on the connector, assign it to the connector
   and check that the screen resolution changes to this one.

Test Based on: [ChromeOS AutoTest
display_ResolutionList](https://chromium.googlesource.com/chromiumos/third_party/autotest/+/HEAD/server/site_tests/display_ResolutionList/display_ResolutionList.py)

Tested on: TGL with Cv3

Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
---
 lib/igt_edid.c                  |  7 +++-
 lib/igt_edid.h                  |  2 +
 lib/igt_kms.c                   | 32 +++++++++++++++
 lib/igt_kms.h                   |  5 ++-
 tests/chamelium/kms_chamelium.c | 69 +++++++++++++++++++++++++++++++++
 5 files changed, 112 insertions(+), 3 deletions(-)

diff --git a/lib/igt_edid.c b/lib/igt_edid.c
index bff13a0d..b5e0b4ba 100644
--- a/lib/igt_edid.c
+++ b/lib/igt_edid.c
@@ -60,8 +60,11 @@ static const char monitor_range_padding[] = {
 
 const uint8_t hdmi_ieee_oui[3] = {0x03, 0x0C, 0x00};
 
-/* vfreq is in Hz */
-static void std_timing_set(struct std_timing *st, int hsize, int vfreq,
+/**
+ * std_timing_set: Sets the EDID standard timing for a given |hsize|, |vfreq|
+ * in Hz and |aspect| ratio
+ */
+ void std_timing_set(struct std_timing *st, int hsize, int vfreq,
 			   enum std_timing_aspect aspect)
 {
 	assert(hsize >= 256 && hsize <= 2288);
diff --git a/lib/igt_edid.h b/lib/igt_edid.h
index a9251d68..477f16c2 100644
--- a/lib/igt_edid.h
+++ b/lib/igt_edid.h
@@ -379,6 +379,8 @@ size_t edid_get_size(const struct edid *edid);
 void edid_get_mfg(const struct edid *edid, char out[static 3]);
 uint8_t edid_get_deep_color_from_vsdb(const struct edid *edid);
 uint8_t edid_get_bit_depth_from_vid(const struct edid *edid);
+void std_timing_set(struct std_timing *st, int hsize, int vfreq,
+		    enum std_timing_aspect aspect);
 void detailed_timing_set_mode(struct detailed_timing *dt, drmModeModeInfo *mode,
 			      int width_mm, int height_mm);
 void detailed_timing_set_monitor_range_mode(struct detailed_timing *dt,
diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 921a623d..b4a98ae1 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -133,6 +133,36 @@ const struct edid *igt_kms_get_base_edid(void)
 	return &edid;
 }
 
+const struct edid *igt_kms_get_full_edid(void)
+{
+	static struct edid edid;
+	drmModeModeInfo mode = {};
+
+	mode.clock = 148500;
+	mode.hdisplay = 2288;
+	mode.hsync_start = 2008;
+	mode.hsync_end = 2052;
+	mode.htotal = 2200;
+	mode.vdisplay = 1287;
+	mode.vsync_start = 1084;
+	mode.vsync_end = 1089;
+	mode.vtotal = 1125;
+	mode.vrefresh = 144;
+	edid_init_with_mode(&edid, &mode);
+
+	std_timing_set(&edid.standard_timings[0], 256, 60, STD_TIMING_16_10);
+	std_timing_set(&edid.standard_timings[1], 510, 69, STD_TIMING_4_3);
+	std_timing_set(&edid.standard_timings[2], 764, 78, STD_TIMING_5_4);
+	std_timing_set(&edid.standard_timings[3], 1018, 87, STD_TIMING_16_9);
+	std_timing_set(&edid.standard_timings[4], 1526, 96, STD_TIMING_16_10);
+	std_timing_set(&edid.standard_timings[5], 1780, 105, STD_TIMING_4_3);
+	std_timing_set(&edid.standard_timings[6], 2034, 114, STD_TIMING_5_4);
+	std_timing_set(&edid.standard_timings[7], 2288, 123, STD_TIMING_16_9);
+
+	edid_update_checksum(&edid);
+	return &edid;
+}
+
 const struct edid *igt_kms_get_base_tile_edid(void)
 {
 	static struct edid edid;
@@ -548,6 +578,8 @@ const struct edid *igt_kms_get_custom_edid(enum igt_custom_edid_type edid)
 	switch (edid) {
 	case IGT_CUSTOM_EDID_BASE:
 		return igt_kms_get_base_edid();
+	case IGT_CUSTOM_EDID_FULL:
+		return igt_kms_get_full_edid();
 	case IGT_CUSTOM_EDID_ALT:
 		return igt_kms_get_alt_edid();
 	case IGT_CUSTOM_EDID_HDMI_AUDIO:
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index b09441d0..7a00d204 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -82,6 +82,7 @@ enum port {
  *
  * Enum used for the helper function igt_custom_edid_type
  * @IGT_CUSTOM_EDID_BASE: Returns base edid
+ * @IGT_CUSTOM_EDID_FULL: Returns edid with full list of standard timings.
  * @IGT_CUSTOM_EDID_ALT: Returns alternate edid
  * @IGT_CUSTOM_EDID_HDMI_AUDIO: Returns edid with HDMI audio block
  * @IGT_CUSTOM_EDID_DP_AUDIO: Returns edid with DP audio block
@@ -89,12 +90,13 @@ enum port {
  */
 enum igt_custom_edid_type {
 	IGT_CUSTOM_EDID_BASE,
+	IGT_CUSTOM_EDID_FULL,
 	IGT_CUSTOM_EDID_ALT,
 	IGT_CUSTOM_EDID_HDMI_AUDIO,
 	IGT_CUSTOM_EDID_DP_AUDIO,
 	IGT_CUSTOM_EDID_ASPECT_RATIO,
 };
-#define IGT_CUSTOM_EDID_COUNT 5
+#define IGT_CUSTOM_EDID_COUNT 6
 
 /**
  * kmstest_port_name:
@@ -865,6 +867,7 @@ void igt_reset_connectors(void);
 uint32_t kmstest_get_vbl_flag(int crtc_offset);
 
 const struct edid *igt_kms_get_base_edid(void);
+const struct edid *igt_kms_get_full_edid(void);
 const struct edid *igt_kms_get_base_tile_edid(void);
 const struct edid *igt_kms_get_alt_edid(void);
 const struct edid *igt_kms_get_hdmi_audio_edid(void);
diff --git a/tests/chamelium/kms_chamelium.c b/tests/chamelium/kms_chamelium.c
index 2bc97d5a..d2ec5175 100644
--- a/tests/chamelium/kms_chamelium.c
+++ b/tests/chamelium/kms_chamelium.c
@@ -2612,6 +2612,71 @@ static void edid_stress_resolution(data_t *data, struct chamelium_port *port,
 			      data->ports, data->port_count);
 }
 
+static const char igt_edid_resolution_list_desc[] =
+	"Get an EDID with many modes of different configurations, set them on the screen and check the"
+	" screen resolution matches the mode resolution.";
+
+static void edid_resolution_list(data_t *data, struct chamelium_port *port)
+{
+	struct chamelium *chamelium = data->chamelium;
+	struct udev_monitor *mon = igt_watch_uevents();
+	drmModeConnector *init_connector;
+	drmModeModeInfoPtr modes;
+	int count_modes;
+	int i;
+	igt_output_t *output;
+	enum pipe pipe;
+
+	chamelium_unplug(chamelium, port);
+	set_edid(data, port, IGT_CUSTOM_EDID_FULL);
+
+	igt_flush_uevents(mon);
+	chamelium_plug(chamelium, port);
+	wait_for_connector_after_hotplug(data, mon, port, DRM_MODE_CONNECTED);
+	igt_flush_uevents(mon);
+
+	init_connector = chamelium_port_get_connector(chamelium, port, true);
+	modes = init_connector->modes;
+	count_modes = init_connector->count_modes;
+
+	output = get_output_for_port(data, port);
+	pipe = get_pipe_for_output(&data->display, output);
+	igt_output_set_pipe(output, pipe);
+
+	for (i = 0; i < count_modes; ++i)
+		igt_debug("#%d %s %uHz\n", i, modes[i].name, modes[i].vrefresh);
+
+	for (i = 0; i < count_modes; ++i) {
+		struct chamelium_edid *chamelium_edid;
+		struct igt_fb fb = { 0 };
+		bool is_video_stable;
+		int screen_res_w, screen_res_h;
+		drmModeConnector *connector;
+		drmModeModeInfoPtr expected_mode;
+		bool is_same_mode;
+
+		igt_info("Testing #%d %s %uHz\n", i, modes[i].name,
+			 modes[i].vrefresh);
+
+		/* Set the screen mode with the one we chose. */
+		create_fb_for_mode(data, &fb, &modes[i]);
+		enable_output(data, port, output, &modes[i], &fb);
+		is_video_stable = chamelium_port_wait_video_input_stable(
+			chamelium, port, 10);
+		igt_assert(is_video_stable);
+
+		chamelium_port_get_resolution(chamelium, port, &screen_res_w,
+					      &screen_res_h);
+		igt_assert_eq(screen_res_w, modes[i].hdisplay);
+		igt_assert_eq(screen_res_h, modes[i].vdisplay);
+
+		igt_remove_fb(data->drm_fd, &fb);
+	}
+
+	igt_modeset_disable_all_outputs(&data->display);
+	drmModeFreeConnector(init_connector);
+}
+
 #define for_each_port(p, port)            \
 	for (p = 0, port = data.ports[p]; \
 	     p < data.port_count;         \
@@ -2714,6 +2779,10 @@ igt_main
 			edid_stress_resolution(&data, port, DP_EDIDS_NON_4K,
 					       ARRAY_SIZE(DP_EDIDS_NON_4K));
 
+		igt_describe(igt_edid_resolution_list_desc);
+		connector_subtest("dp-edid-resolution-list", DisplayPort)
+			edid_resolution_list(&data, port);
+
 		igt_describe(test_suspend_resume_hpd_desc);
 		connector_subtest("dp-hpd-after-suspend", DisplayPort)
 			test_suspend_resume_hpd(&data, port,
-- 
2.38.1.431.g37b22c650d-goog
