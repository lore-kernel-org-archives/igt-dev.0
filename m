Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C11DF10E7A7
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Jan 2023 16:49:13 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 18 Jan 2023 22:20:17 +0530
Message-Id: <20230118165017.32078-3-swati2.sharma@intel.com>
In-Reply-To: <20230118165017.32078-1-swati2.sharma@intel.com>
References: <20230118165017.32078-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v3 2/2] Move wrapper functions from kms_dsc to
 kms_dsc_helper
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

To add dsc concurrent tests, these wrapper functions can be
reused. Lets create separate helper file to avoid code duplication.

v2: -use of SPDX licence placeholder
    -add more parameters to exported functions (Jouni)
v3: -make var static (Jouni)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/i915/kms_dsc.c        | 133 +++---------------------------------
 tests/i915/kms_dsc_helper.c |  99 +++++++++++++++++++++++++++
 tests/i915/kms_dsc_helper.h |  35 ++++++++++
 tests/meson.build           |   9 ++-
 4 files changed, 151 insertions(+), 125 deletions(-)
 create mode 100644 tests/i915/kms_dsc_helper.c
 create mode 100644 tests/i915/kms_dsc_helper.h

diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
index 330fc050b..22239122c 100644
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
 
@@ -64,9 +50,6 @@ typedef struct {
 	enum pipe pipe;
 } data_t;
 
-bool force_dsc_en_orig;
-int force_dsc_restore_fd = -1;
-
 const struct {
 	const int format;
 	const char format_str[20];
@@ -84,56 +67,6 @@ static inline void manual(const char *expected)
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
@@ -146,26 +79,6 @@ static drmModeModeInfo *get_highres_mode(igt_output_t *output)
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
@@ -181,34 +94,6 @@ static bool check_big_joiner_pipe_constraint(data_t *data)
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
@@ -235,12 +120,12 @@ static void update_display(data_t *data, enum dsc_test_type test_type, unsigned
 	igt_display_commit(display);
 
 	igt_debug("DSC is supported on %s\n", data->output->name);
-	save_force_dsc_en(data);
-	force_dsc_enable(data);
+	save_force_dsc_en(data->drm_fd, data->output);
+	force_dsc_enable(data->drm_fd, data->output);
 
 	if (test_type == TEST_DSC_BPC) {
 		igt_debug("Trying to set input BPC to %d\n", data->input_bpc);
-		force_dsc_enable_bpc(data);
+		force_dsc_enable_bpc(data->drm_fd, data->output, data->input_bpc);
 	}
 
 	igt_output_set_pipe(output, data->pipe);
@@ -279,7 +164,7 @@ static void update_display(data_t *data, enum dsc_test_type test_type, unsigned
 	restore_force_dsc_en();
 	igt_debug("Reset compression BPC\n");
 	data->input_bpc = 0;
-	force_dsc_enable_bpc(data);
+	force_dsc_enable_bpc(data->drm_fd, data->output, data->input_bpc);
 
 	igt_assert_f(enabled,
 		     "Default DSC enable failed on connector: %s pipe: %s\n",
@@ -302,13 +187,13 @@ static void test_dsc(data_t *data, enum dsc_test_type test_type, int bpc,
 		data->output = output;
 		data->pipe = pipe;
 
-		if (!check_dsc_on_connector(data))
+		if (!check_dsc_on_connector(data->drm_fd, data->output))
 			continue;
 
-		if (!check_gen11_dp_constraint(data))
+		if (!check_gen11_dp_constraint(data->drm_fd, data->output, data->pipe))
 			continue;
 
-		if (!check_gen11_bpc_constraint(data))
+		if (!check_gen11_bpc_constraint(data->drm_fd, data->output, data->input_bpc))
 			continue;
 
 		if (!check_big_joiner_pipe_constraint(data))
diff --git a/tests/i915/kms_dsc_helper.c b/tests/i915/kms_dsc_helper.c
new file mode 100644
index 000000000..535061a74
--- /dev/null
+++ b/tests/i915/kms_dsc_helper.c
@@ -0,0 +1,99 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include "kms_dsc_helper.h"
+
+static bool force_dsc_en_orig;
+static int force_dsc_restore_fd = -1;
+
+void force_dsc_enable(int drmfd, igt_output_t *output)
+{
+	int ret;
+
+	igt_debug("Forcing DSC enable on %s\n", output->name);
+	ret = igt_force_dsc_enable(drmfd, output->name);
+	igt_assert_f(ret > 0, "debugfs_write failed");
+}
+
+void force_dsc_enable_bpc(int drmfd, igt_output_t *output, int input_bpc)
+{
+	int ret;
+
+	igt_debug("Forcing input DSC BPC to %d on %s\n",
+		  input_bpc, output->name);
+	ret = igt_force_dsc_enable_bpc(drmfd, output->name, input_bpc);
+	igt_assert_f(ret > 0, "debugfs_write failed");
+}
+
+void save_force_dsc_en(int drmfd, igt_output_t *output)
+{
+	force_dsc_en_orig =
+		igt_is_force_dsc_enabled(drmfd, output->name);
+	force_dsc_restore_fd =
+		igt_get_dsc_debugfs_fd(drmfd, output->name);
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
+bool check_dsc_on_connector(int drmfd, igt_output_t *output)
+{
+	if (!igt_is_dsc_supported(drmfd, output->name)) {
+		igt_debug("DSC not supported on connector %s\n",
+			  output->name);
+		return false;
+	}
+
+	if (!output_is_internal_panel(output) &&
+	    !igt_is_fec_supported(drmfd, output->name)) {
+		igt_debug("DSC cannot be enabled without FEC on %s\n",
+			  output->name);
+		return false;
+	}
+
+	return true;
+}
+
+bool check_gen11_dp_constraint(int drmfd, igt_output_t *output, enum pipe pipe)
+{
+	uint32_t devid = intel_get_drm_devid(drmfd);
+	drmModeConnector *connector = output->config.connector;
+
+	if ((connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort) &&
+	    (pipe == PIPE_A) && IS_GEN11(devid)) {
+		igt_debug("DSC not supported on pipe A on external DP in gen11 platforms\n");
+		return false;
+	}
+
+	return true;
+}
+
+/* Max DSC Input BPC for ICL is 10 and for TGL+ is 12 */
+bool check_gen11_bpc_constraint(int drmfd, igt_output_t *output, int input_bpc)
+{
+	uint32_t devid = intel_get_drm_devid(drmfd);
+
+	if (IS_GEN11(devid) && input_bpc == 12) {
+		igt_debug("Input bpc 12 not supported on gen11 platforms\n");
+		return false;
+	}
+
+	return true;
+}
diff --git a/tests/i915/kms_dsc_helper.h b/tests/i915/kms_dsc_helper.h
new file mode 100644
index 000000000..fe479dac4
--- /dev/null
+++ b/tests/i915/kms_dsc_helper.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2022 Intel Corporation
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
+void force_dsc_enable(int drmfd, igt_output_t *output);
+void force_dsc_enable_bpc(int drmfd, igt_output_t *output, int input_bpc);
+void save_force_dsc_en(int drmfd, igt_output_t *output);
+void restore_force_dsc_en(void);
+void kms_dsc_exit_handler(int sig);
+bool check_dsc_on_connector(int drmfd, igt_output_t *output);
+bool check_gen11_dp_constraint(int drmfd, igt_output_t *output, enum pipe pipe);
+bool check_gen11_bpc_constraint(int drmfd, igt_output_t *output, int input_bpc);
+
+#endif
diff --git a/tests/meson.build b/tests/meson.build
index e20a86403..d41ed30fa 100644
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
@@ -428,6 +427,14 @@ test_executables += executable('kms_color',
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
 if chamelium.found()
        test_executables += executable('kms_chamelium_color',
                              [ 'chamelium/kms_chamelium_color.c', 'kms_color_helper.c' ],
-- 
2.25.1
