Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CC3210E440
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Jan 2023 15:26:55 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  9 Jan 2023 20:58:25 +0530
Message-Id: <20230109152832.3310-3-swati2.sharma@intel.com>
In-Reply-To: <20230109152832.3310-1-swati2.sharma@intel.com>
References: <20230109152832.3310-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/8] Move wrapper functions from kms_dsc to
 kms_dsc_helper
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

To add dsc concurrent tests, these wrapper functions can be
reused. Lets create separate helper file to avoid code duplication.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/i915/kms_dsc.c        | 130 +----------------------------------
 tests/i915/kms_dsc_helper.c | 131 ++++++++++++++++++++++++++++++++++++
 tests/i915/kms_dsc_helper.h |  65 ++++++++++++++++++
 tests/meson.build           |  10 ++-
 4 files changed, 207 insertions(+), 129 deletions(-)
 create mode 100644 tests/i915/kms_dsc_helper.c
 create mode 100644 tests/i915/kms_dsc_helper.h

diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
index 330fc050b..0db6cc2ef 100644
--- a/tests/i915/kms_dsc.c
+++ b/tests/i915/kms_dsc.c
@@ -29,22 +29,8 @@
  * Manasi Navare <manasi.d.navare@intel.com>
  *
  */
-#include "igt.h"
-#include "igt_sysfs.h"
-#include <errno.h>
-#include <getopt.h>
-#include <math.h>
-#include <stdint.h>
-#include <stdbool.h>
-#include <strings.h>
-#include <unistd.h>
-#include <stdlib.h>
-#include <signal.h>
-#include <time.h>
-#include <fcntl.h>
-#include <termios.h>
-
-#define HDISPLAY_5K	5120
+
+#include "kms_dsc_helper.h"
 
 IGT_TEST_DESCRIPTION("Test to validate display stream compression");
 
@@ -53,20 +39,6 @@ enum dsc_test_type {
 	TEST_DSC_BPC
 };
 
-typedef struct {
-	int drm_fd;
-	uint32_t devid;
-	igt_display_t display;
-	struct igt_fb fb_test_pattern;
-	igt_output_t *output;
-	int input_bpc;
-	int n_pipes;
-	enum pipe pipe;
-} data_t;
-
-bool force_dsc_en_orig;
-int force_dsc_restore_fd = -1;
-
 const struct {
 	const int format;
 	const char format_str[20];
@@ -84,56 +56,6 @@ static inline void manual(const char *expected)
 	igt_debug_interactive_mode_check("all", expected);
 }
 
-static void force_dsc_enable(data_t *data)
-{
-	int ret;
-
-	igt_debug("Forcing DSC enable on %s\n", data->output->name);
-	ret = igt_force_dsc_enable(data->drm_fd,
-				   data->output->name);
-	igt_assert_f(ret > 0, "debugfs_write failed");
-}
-
-static void force_dsc_enable_bpc(data_t *data)
-{
-	int ret;
-
-	igt_debug("Forcing input DSC BPC to %d on %s\n",
-		  data->input_bpc, data->output->name);
-	ret = igt_force_dsc_enable_bpc(data->drm_fd,
-				       data->output->name,
-				       data->input_bpc);
-	igt_assert_f(ret > 0, "debugfs_write failed");
-}
-
-static void save_force_dsc_en(data_t *data)
-{
-	force_dsc_en_orig =
-		igt_is_force_dsc_enabled(data->drm_fd,
-					 data->output->name);
-	force_dsc_restore_fd =
-		igt_get_dsc_debugfs_fd(data->drm_fd,
-				       data->output->name);
-	igt_assert(force_dsc_restore_fd >= 0);
-}
-
-static void restore_force_dsc_en(void)
-{
-	if (force_dsc_restore_fd < 0)
-		return;
-
-	igt_debug("Restoring DSC enable\n");
-	igt_assert(write(force_dsc_restore_fd, force_dsc_en_orig ? "1" : "0", 1) == 1);
-
-	close(force_dsc_restore_fd);
-	force_dsc_restore_fd = -1;
-}
-
-static void kms_dsc_exit_handler(int sig)
-{
-	restore_force_dsc_en();
-}
-
 static drmModeModeInfo *get_highres_mode(igt_output_t *output)
 {
 	drmModeConnector *connector = output->config.connector;
@@ -146,26 +68,6 @@ static drmModeModeInfo *get_highres_mode(igt_output_t *output)
 	return highest_mode;
 }
 
-static bool check_dsc_on_connector(data_t *data)
-{
-	igt_output_t *output = data->output;
-
-	if (!igt_is_dsc_supported(data->drm_fd, output->name)) {
-		igt_debug("DSC not supported on connector %s\n",
-			  output->name);
-		return false;
-	}
-
-	if (!output_is_internal_panel(output) &&
-	    !igt_is_fec_supported(data->drm_fd, output->name)) {
-		igt_debug("DSC cannot be enabled without FEC on %s\n",
-			  output->name);
-		return false;
-	}
-
-	return true;
-}
-
 static bool check_big_joiner_pipe_constraint(data_t *data)
 {
 	igt_output_t *output = data->output;
@@ -181,34 +83,6 @@ static bool check_big_joiner_pipe_constraint(data_t *data)
 	return true;
 }
 
-static bool check_gen11_dp_constraint(data_t *data)
-{
-	igt_output_t *output = data->output;
-	uint32_t devid = intel_get_drm_devid(data->drm_fd);
-	drmModeConnector *connector = output->config.connector;
-
-	if ((connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort) &&
-	    (data->pipe == PIPE_A) && IS_GEN11(devid)) {
-		igt_debug("DSC not supported on pipe A on external DP in gen11 platforms\n");
-		return false;
-	}
-
-	return true;
-}
-
-/* Max DSC Input BPC for ICL is 10 and for TGL+ is 12 */
-static bool check_gen11_bpc_constraint(data_t *data)
-{
-	uint32_t devid = intel_get_drm_devid(data->drm_fd);
-
-	if (IS_GEN11(devid) && data->input_bpc == 12) {
-		igt_debug("Input bpc 12 not supported on gen11 platforms\n");
-		return false;
-	}
-
-	return true;
-}
-
 static void test_cleanup(data_t *data)
 {
 	igt_output_t *output = data->output;
diff --git a/tests/i915/kms_dsc_helper.c b/tests/i915/kms_dsc_helper.c
new file mode 100644
index 000000000..183a31457
--- /dev/null
+++ b/tests/i915/kms_dsc_helper.c
@@ -0,0 +1,131 @@
+/*
+ * Copyright © 2023 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ *
+ * Displayport Display Stream Compression test
+ * Until the CRC support is added this needs to be invoked with --interactive
+ * to manually verify if the test pattern is seen without corruption for each
+ * subtest.
+ *
+ */
+
+#include "kms_dsc_helper.h"
+
+bool force_dsc_en_orig;
+int force_dsc_restore_fd = -1;
+
+void force_dsc_enable(data_t *data)
+{
+	int ret;
+
+	igt_debug("Forcing DSC enable on %s\n", data->output->name);
+	ret = igt_force_dsc_enable(data->drm_fd,
+				   data->output->name);
+	igt_assert_f(ret > 0, "debugfs_write failed");
+}
+
+void force_dsc_enable_bpc(data_t *data)
+{
+	int ret;
+
+	igt_debug("Forcing input DSC BPC to %d on %s\n",
+		  data->input_bpc, data->output->name);
+	ret = igt_force_dsc_enable_bpc(data->drm_fd,
+				       data->output->name,
+				       data->input_bpc);
+	igt_assert_f(ret > 0, "debugfs_write failed");
+}
+
+void save_force_dsc_en(data_t *data)
+{
+	force_dsc_en_orig =
+		igt_is_force_dsc_enabled(data->drm_fd,
+					 data->output->name);
+	force_dsc_restore_fd =
+		igt_get_dsc_debugfs_fd(data->drm_fd,
+				       data->output->name);
+	igt_assert(force_dsc_restore_fd >= 0);
+}
+
+void restore_force_dsc_en(void)
+{
+	if (force_dsc_restore_fd < 0)
+		return;
+
+	igt_debug("Restoring DSC enable\n");
+	igt_assert(write(force_dsc_restore_fd, force_dsc_en_orig ? "1" : "0", 1) == 1);
+
+	close(force_dsc_restore_fd);
+	force_dsc_restore_fd = -1;
+}
+
+void kms_dsc_exit_handler(int sig)
+{
+	restore_force_dsc_en();
+}
+
+bool check_dsc_on_connector(data_t *data)
+{
+	igt_output_t *output = data->output;
+
+	if (!igt_is_dsc_supported(data->drm_fd, output->name)) {
+		igt_debug("DSC not supported on connector %s\n",
+			  output->name);
+		return false;
+	}
+
+	if (!output_is_internal_panel(output) &&
+	    !igt_is_fec_supported(data->drm_fd, output->name)) {
+		igt_debug("DSC cannot be enabled without FEC on %s\n",
+			  output->name);
+		return false;
+	}
+
+	return true;
+}
+
+bool check_gen11_dp_constraint(data_t *data)
+{
+	igt_output_t *output = data->output;
+	uint32_t devid = intel_get_drm_devid(data->drm_fd);
+	drmModeConnector *connector = output->config.connector;
+
+	if ((connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort) &&
+	    (data->pipe == PIPE_A) && IS_GEN11(devid)) {
+		igt_debug("DSC not supported on pipe A on external DP in gen11 platforms\n");
+		return false;
+	}
+
+	return true;
+}
+
+/* Max DSC Input BPC for ICL is 10 and for TGL+ is 12 */
+bool check_gen11_bpc_constraint(data_t *data)
+{
+	uint32_t devid = intel_get_drm_devid(data->drm_fd);
+
+	if (IS_GEN11(devid) && data->input_bpc == 12) {
+		igt_debug("Input bpc 12 not supported on gen11 platforms\n");
+		return false;
+	}
+
+	return true;
+}
diff --git a/tests/i915/kms_dsc_helper.h b/tests/i915/kms_dsc_helper.h
new file mode 100644
index 000000000..0d93f7369
--- /dev/null
+++ b/tests/i915/kms_dsc_helper.h
@@ -0,0 +1,65 @@
+/*
+ * Copyright © 2023 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ *
+ */
+
+#ifndef IGT_KMS_DSC_HELPER_H
+#define IGT_KMS_DSC_HELPER_H
+
+#include "igt.h"
+#include "igt_sysfs.h"
+#include <errno.h>
+#include <getopt.h>
+#include <math.h>
+#include <stdint.h>
+#include <stdbool.h>
+#include <strings.h>
+#include <unistd.h>
+#include <stdlib.h>
+#include <signal.h>
+#include <time.h>
+#include <fcntl.h>
+#include <termios.h>
+
+#define HDISPLAY_5K	5120
+
+typedef struct {
+	int drm_fd;
+	uint32_t devid;
+	igt_display_t display;
+	struct igt_fb fb_test_pattern;
+	igt_output_t *output;
+	int input_bpc;
+	int n_pipes;
+	enum pipe pipe;
+} data_t;
+
+void force_dsc_enable_bpc(data_t *data);
+void force_dsc_enable(data_t *data);
+void save_force_dsc_en(data_t *data);
+void restore_force_dsc_en(void);
+void kms_dsc_exit_handler(int sig);
+bool check_dsc_on_connector(data_t *data);
+bool check_gen11_dp_constraint(data_t *data);
+bool check_gen11_bpc_constraint(data_t *data);
+
+#endif
diff --git a/tests/meson.build b/tests/meson.build
index cb4289985..e63d62249 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -221,7 +221,6 @@ i915_progs = [
 	'kms_ccs',
 	'kms_cdclk',
 	'kms_draw_crc',
-	'kms_dsc',
 	'kms_fbcon_fbt',
 	'kms_fence_pin_leak',
 	'kms_flip_scaled_crc',
@@ -424,6 +423,15 @@ test_executables += executable('kms_color',
 	   install : true)
 test_list += 'kms_color'
 
+test_executables += executable('kms_dsc',
+	   [ join_paths('i915', 'kms_dsc.c'), join_paths ('i915', 'kms_dsc_helper.c')],
+	   dependencies : test_deps,
+	   install_dir : libexecdir,
+	   install_rpath : libexecdir_rpathdir,
+	   install : true)
+test_list += 'kms_dsc'
+
+
 if chamelium.found()
        test_executables += executable('kms_color_chamelium',
                              [ 'chamelium/kms_color_chamelium.c', 'kms_color_helper.c' ],
-- 
2.25.1
