Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC37210E873
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Oct 2022 16:43:03 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id g11so3811285qts.1
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Oct 2022 09:43:03 -0700 (PDT)
From: Mark Yacoub <markyacoub@chromium.org>
To: igt-dev@lists.freedesktop.org
Date: Fri, 28 Oct 2022 12:42:55 -0400
Message-Id: <20221028164255.986636-1-markyacoub@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH] [NEW]kms_chamelium: Add new EDID stress
 resolution test
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
2 things that happen concurrently that we would like to test:
1. Test multiple plug/unplug of different monitors (as in different
   EDIDs) to the DUT in a short time span.
2. Test that the different EDIDs are understood well by the DUT through
   verifying the resolution after each plug and enable output.

[How]
1. Get EDID from list of EDIDs
2. Set the EDID
3. Plug and enable display
4. Check the resolution
5. Unplug and repeat.

TODO:
1. Add more EDIDs
2. Do the same for HDMI

Test Based on: [ChromeOS AutoTest display_EdidStress](https://chromium.googlesource.com/chromiumos/third_party/autotest/+/HEAD/server/site_tests/display_EdidStress/display_EdidStress.py)

Tested on: TGL with Cv3

Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
---
 lib/igt_chamelium.c                      | 10 +--
 lib/igt_chamelium.h                      | 22 +++++-
 lib/meson.build                          |  4 +-
 lib/monitor_edids/dp_edids.h             | 56 +++++++++++++++
 lib/monitor_edids/monitor_edids_helper.c | 92 ++++++++++++++++++++++++
 lib/monitor_edids/monitor_edids_helper.h | 33 +++++++++
 tests/chamelium/kms_chamelium.c          | 75 +++++++++++++++++++
 7 files changed, 278 insertions(+), 14 deletions(-)
 create mode 100644 lib/monitor_edids/dp_edids.h
 create mode 100644 lib/monitor_edids/monitor_edids_helper.c
 create mode 100644 lib/monitor_edids/monitor_edids_helper.h

diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
index d998a1f1..db3ca0d7 100644
--- a/lib/igt_chamelium.c
+++ b/lib/igt_chamelium.c
@@ -91,14 +91,6 @@
  */
 #define CHAMELIUM_HOTPLUG_DETECTION_DELAY 10
 
-struct chamelium_edid {
-	struct chamelium *chamelium;
-	struct edid *base;
-	struct edid *raw[CHAMELIUM_MAX_PORTS];
-	int ids[CHAMELIUM_MAX_PORTS];
-	struct igt_list_head link;
-};
-
 struct chamelium_port {
 	unsigned int type;
 	int id;
@@ -688,7 +680,7 @@ static xmlrpc_value *chamelium_rpc(struct chamelium *chamelium,
 		va_end(va_args);
 	}
 	igt_assert_f(!chamelium->env.fault_occurred,
-		     "Chamelium RPC call failed: %s\n",
+		     "Chamelium RPC call[%s] failed: %s\n", method_name,
 		     chamelium->env.fault_string);
 
 	return res;
diff --git a/lib/igt_chamelium.h b/lib/igt_chamelium.h
index e1ee2b59..6da4ef66 100644
--- a/lib/igt_chamelium.h
+++ b/lib/igt_chamelium.h
@@ -33,6 +33,7 @@
 
 #include "igt_debugfs.h"
 #include "igt_kms.h"
+#include "igt_list.h"
 
 struct igt_fb;
 struct edid;
@@ -80,12 +81,11 @@ struct chamelium_infoframe {
 	uint8_t *payload;
 };
 
-struct chamelium_edid;
-
 /**
  * CHAMELIUM_MAX_PORTS: the maximum number of ports supported by igt_chamelium.
  *
- * For now, we have 1 VGA, 1 HDMI and 2 DisplayPort ports.
+ * On V2: 1 VGA, 1 HDMI and 2 DisplayPort ports.
+ * On V3: 2 HDMI and 2 DisplayPort ports.
  */
 #define CHAMELIUM_MAX_PORTS 4
 
@@ -105,6 +105,22 @@ extern bool igt_chamelium_allow_fsm_handling;
 
 #define CHAMELIUM_HOTPLUG_TIMEOUT 20 /* seconds */
 
+/**
+ * chamelium_edid:
+ * @chamelium: instance of the chamelium where the EDID will be applied
+ * @base: Unaltered EDID that would be used for all ports. Matches what you
+ * would get from a real monitor.
+ * @raw: EDID to be applied for each port.
+ * @ids: The ID received from Chamelium after it's created for specific ports.
+ */
+struct chamelium_edid {
+	struct chamelium *chamelium;
+	struct edid *base;
+	struct edid *raw[CHAMELIUM_MAX_PORTS];
+	int ids[CHAMELIUM_MAX_PORTS];
+	struct igt_list_head link;
+};
+
 void chamelium_deinit_rpc_only(struct chamelium *chamelium);
 struct chamelium *chamelium_init_rpc_only(void);
 struct chamelium *chamelium_init(int drm_fd, igt_display_t *display);
diff --git a/lib/meson.build b/lib/meson.build
index 1fa6d6ee..0e0fc8a1 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -164,8 +164,8 @@ endif
 
 if chamelium.found()
 	lib_deps += chamelium
-	lib_sources += 'igt_chamelium.c'
-	lib_sources += 'igt_chamelium_stream.c'
+	lib_sources += [ 'igt_chamelium.c', 'igt_chamelium_stream.c' ]
+	lib_sources += 'monitor_edids/monitor_edids_helper.c'
 endif
 
 if get_option('srcdir') != ''
diff --git a/lib/monitor_edids/dp_edids.h b/lib/monitor_edids/dp_edids.h
new file mode 100644
index 00000000..1217fedc
--- /dev/null
+++ b/lib/monitor_edids/dp_edids.h
@@ -0,0 +1,56 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * List of real DP EDIDs from popular monitors.
+ * The current list (at the time of writing this comment) is based on the top
+ * monitors used on ChromeOS.
+ *
+ * Copyright 2022 Google LLC.
+ *
+ * Authors: Mark Yacoub <markyacoub@chromium.org>
+ */
+
+#ifndef TESTS_CHAMELIUM_MONITOR_EDIDS_DP_EDIDS_H_
+#define TESTS_CHAMELIUM_MONITOR_EDIDS_DP_EDIDS_H_
+
+#include "monitor_edids_helper.h"
+
+// TODO: Add more EDIDs.
+struct monitor_edid DP_EDIDS[] = {
+	{ .name = "4K_DELL_UP3216Q_DP",
+	  .edid = "00ffffffffffff0010acf84050383230"
+		  "051a0104a5431c783aca95a6554ea126"
+		  "0f5054a54b808100b300714f8180d1c0"
+		  "0101010101017e4800e0a0381f404040"
+		  "3a00a11c2100001a000000ff00393143"
+		  "5937333538303238500a000000fc0044"
+		  "454c4c205532393137570a20000000fd"
+		  "00314c1d5e13010a2020202020200117"
+		  "02031df1501005040302071601061112"
+		  "1513141f2023091f0783010000023a80"
+		  "1871382d40582c2500a11c2100001e01"
+		  "1d8018711c1620582c2500a11c210000"
+		  "9e011d007251d01e206e285500a11c21"
+		  "00001e8c0ad08a20e02d10103e9600a1"
+		  "1c210000180000000000000000000000"
+		  "000000000000000000000000000000dd" },
+
+	{ .name = "DEL_16543_DELL_P2314T_DP",
+	  .edid = "00ffffffffffff0010ac9f404c4c3645"
+		  "10180104a5331d783ae595a656529d27"
+		  "105054a54b00714f8180a9c0d1c00101"
+		  "010101010101023a801871382d40582c"
+		  "4500fd1e1100001e000000ff00445746"
+		  "325834344645364c4c0a000000fc0044"
+		  "454c4c205032333134540a20000000fd"
+		  "00384c1e5311010a20202020202001bb"
+		  "02031cf14f9005040302071601061112"
+		  "1513141f2309070783010000023a8018"
+		  "71382d40582c4500fd1e1100001e011d"
+		  "8018711c1620582c2500fd1e1100009e"
+		  "011d007251d01e206e285500fd1e1100"
+		  "001e8c0ad08a20e02d10103e9600fd1e"
+		  "11000018000000000000000000000000"
+		  "0000000000000000000000000000003f" }
+};
+
+#endif /* TESTS_CHAMELIUM_MONITOR_EDIDS_DP_EDIDS_H_ */
\ No newline at end of file
diff --git a/lib/monitor_edids/monitor_edids_helper.c b/lib/monitor_edids/monitor_edids_helper.c
new file mode 100644
index 00000000..acea1431
--- /dev/null
+++ b/lib/monitor_edids/monitor_edids_helper.c
@@ -0,0 +1,92 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * A helper library for parsing and making use of real EDID data from monitors
+ * and make them compatible with IGT and Chamelium.
+ *
+ * Copyright 2022 Google LLC.
+ *
+ * Authors: Mark Yacoub <markyacoub@chromium.org>
+ */
+
+#include "monitor_edids_helper.h"
+
+#include <stdlib.h>
+#include <string.h>
+#include <assert.h>
+
+#include "igt_core.h"
+
+static uint8_t convert_hex_char_to_byte(char c)
+{
+	if (c >= '0' && c <= '9')
+		return c - '0';
+	if (c >= 'A' && c <= 'F')
+		return c - 'A' + 10;
+	if (c >= 'a' && c <= 'f')
+		return c - 'a' + 10;
+
+	assert(0);
+	return 0;
+}
+
+static uint8_t *get_edid_bytes_from_hex_str(const char *edid_str)
+{
+	int i;
+
+	int edid_size = strlen(edid_str) / 2; /* each asci is a nibble. */
+	uint8_t *edid = (uint8_t *)malloc(edid_size);
+
+	for (i = 0; i < edid_size; i++) {
+		edid[i] = convert_hex_char_to_byte(edid_str[i * 2]) << 4 |
+			  convert_hex_char_to_byte(edid_str[i * 2 + 1]);
+	}
+
+	return edid;
+}
+
+const char *monitor_edid_get_name(const struct monitor_edid *edid)
+{
+	return edid->name;
+}
+
+struct chamelium_edid *
+get_chameleon_edid_from_monitor_edid(struct chamelium *chamelium,
+				     const struct monitor_edid *edid)
+{
+	int i;
+	struct chamelium_edid *chamelium_edid;
+
+	uint8_t *base_edid = get_edid_bytes_from_hex_str(edid->edid);
+	assert(base_edid);
+
+	/*Print the full formatted EDID on debug. */
+	for (i = 0; i < strlen(edid->edid) / 2; i++) {
+		igt_debug("%02x ", base_edid[i]);
+		if (i % 16 == 15)
+			igt_debug("\n");
+	}
+
+	chamelium_edid = malloc(sizeof(struct chamelium_edid));
+	assert(chamelium_edid);
+
+	chamelium_edid->base = base_edid;
+	chamelium_edid->chamelium = chamelium;
+	for (i = 0; i < CHAMELIUM_MAX_PORTS; i++) {
+		chamelium_edid->raw[i] = NULL;
+		chamelium_edid->ids[i] = 0;
+	}
+
+	return chamelium_edid;
+}
+
+void free_chamelium_edid_from_monitor_edid(struct chamelium_edid *edid)
+{
+	int i;
+
+	free(edid->base);
+	for (i = 0; i < CHAMELIUM_MAX_PORTS; i++)
+		free(edid->raw[i]);
+
+	free(edid);
+	edid = NULL;
+}
diff --git a/lib/monitor_edids/monitor_edids_helper.h b/lib/monitor_edids/monitor_edids_helper.h
new file mode 100644
index 00000000..46f85629
--- /dev/null
+++ b/lib/monitor_edids/monitor_edids_helper.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * A helper library for parsing and making use of real EDID data from monitors
+ * and make them compatible with IGT and Chamelium.
+ *
+ * Copyright 2022 Google LLC.
+ *
+ * Authors: Mark Yacoub <markyacoub@chromium.org>
+ */
+
+#ifndef TESTS_CHAMELIUM_MONITOR_EDIDS_MONITOR_EDIDS_HELPER_H_
+#define TESTS_CHAMELIUM_MONITOR_EDIDS_MONITOR_EDIDS_HELPER_H_
+
+#include <stdint.h>
+
+#include "igt_chamelium.h"
+
+/* Max Length can be increased as needed, when new EDIDs are added. */
+#define EDID_NAME_MAX_LEN 25
+#define EDID_HEX_STR_MAX_LEN 512
+
+struct monitor_edid {
+	char name[EDID_NAME_MAX_LEN];
+	char edid[EDID_HEX_STR_MAX_LEN + 1];
+};
+
+const char *monitor_edid_get_name(const struct monitor_edid *edid);
+struct chamelium_edid *
+get_chameleon_edid_from_monitor_edid(struct chamelium *chamelium,
+				     const struct monitor_edid *edid);
+void free_chamelium_edid_from_monitor_edid(struct chamelium_edid *edid);
+
+#endif /* TESTS_CHAMELIUM_MONITOR_EDIDS_MONITOR_EDIDS_HELPER_H_ */
\ No newline at end of file
diff --git a/tests/chamelium/kms_chamelium.c b/tests/chamelium/kms_chamelium.c
index 99cc23a1..6e77ba3c 100644
--- a/tests/chamelium/kms_chamelium.c
+++ b/tests/chamelium/kms_chamelium.c
@@ -30,11 +30,16 @@
 #include "igt_edid.h"
 #include "igt_eld.h"
 #include "igt_infoframe.h"
+#include "monitor_edids/dp_edids.h"
+#include "monitor_edids/monitor_edids_helper.h"
 
 #include <fcntl.h>
 #include <pthread.h>
 #include <string.h>
 #include <stdatomic.h>
+// #include <stdio.h>
+
+// struct chamelium_edid;
 
 enum test_modeset_mode {
 	TEST_MODESET_ON,
@@ -2541,6 +2546,71 @@ test_hpd_storm_disable(data_t *data, struct chamelium_port *port, int width)
 	igt_hpd_storm_reset(data->drm_fd);
 }
 
+static const char igt_edid_stress_resolution_desc[] =
+	"Stress test the DUT by testing multiple EDIDs, one right after the other,"
+	"and ensure their validity by check the real screen resolution vs the"
+	"advertised mode resultion.";
+static void edid_stress_resolution(data_t *data, struct chamelium_port *port,
+				   struct monitor_edid edids_list[],
+				   size_t edids_list_len)
+{
+	int i;
+	struct chamelium *chamelium = data->chamelium;
+	struct udev_monitor *mon = igt_watch_uevents();
+
+	for (i = 0; i < edids_list_len; ++i) {
+		struct chamelium_edid *chamelium_edid;
+		drmModeModeInfo mode;
+		struct igt_fb fb = { 0 };
+		igt_output_t *output;
+		enum pipe pipe;
+		bool is_video_stable;
+		int screen_res_w, screen_res_h;
+
+		struct monitor_edid *monitor_edid = &edids_list[i];
+		igt_info("Testing out the EDID for %s\n",
+			 monitor_edid_get_name(monitor_edid));
+
+		/* Getting and Setting the EDID on Chamelium. */
+		chamelium_edid = get_chameleon_edid_from_monitor_edid(
+			chamelium, monitor_edid);
+		chamelium_port_set_edid(data->chamelium, port, chamelium_edid);
+		free_chamelium_edid_from_monitor_edid(chamelium_edid);
+
+		igt_flush_uevents(mon);
+		chamelium_plug(chamelium, port);
+		wait_for_connector_after_hotplug(data, mon, port,
+						 DRM_MODE_CONNECTED);
+		igt_flush_uevents(mon);
+
+		/* Setting an output on the screen to turn it on. */
+		mode = get_mode_for_port(chamelium, port);
+		create_fb_for_mode(data, &fb, &mode);
+		output = get_output_for_port(data, port);
+		pipe = get_pipe_for_output(&data->display, output);
+		igt_output_set_pipe(output, pipe);
+		enable_output(data, port, output, &mode, &fb);
+
+		/* Capture the screen resolution and verify. */
+		is_video_stable = chamelium_port_wait_video_input_stable(
+			chamelium, port, 5);
+		igt_assert(is_video_stable);
+
+		chamelium_port_get_resolution(chamelium, port, &screen_res_w,
+					      &screen_res_h);
+		igt_assert(screen_res_w == fb.width);
+		igt_assert(screen_res_h == fb.height);
+
+		// Clean up
+		igt_remove_fb(data->drm_fd, &fb);
+		igt_modeset_disable_all_outputs(&data->display);
+		chamelium_unplug(chamelium, port);
+	}
+
+	chamelium_reset_state(&data->display, data->chamelium, port,
+			      data->ports, data->port_count);
+}
+
 #define for_each_port(p, port)            \
 	for (p = 0, port = data.ports[p]; \
 	     p < data.port_count;         \
@@ -2632,6 +2702,11 @@ igt_main
 			igt_custom_edid_type_read(&data, port, IGT_CUSTOM_EDID_ALT);
 		}
 
+		igt_describe(igt_edid_stress_resolution_desc);
+		connector_subtest("dp-edid-stress-resolution", DisplayPort)
+			edid_stress_resolution(&data, port, DP_EDIDS,
+					       ARRAY_SIZE(DP_EDIDS));
+
 		igt_describe(test_suspend_resume_hpd_desc);
 		connector_subtest("dp-hpd-after-suspend", DisplayPort)
 			test_suspend_resume_hpd(&data, port,
-- 
2.38.1.273.g43a17bfeac-goog
