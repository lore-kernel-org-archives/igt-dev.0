Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 179EC10E0E7
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jun 2023 12:57:17 +0000 (UTC)
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 19 Jun 2023 15:56:31 +0300
Message-Id: <20230619125633.2395171-3-jouni.hogander@intel.com>
In-Reply-To: <20230619125633.2395171-1-jouni.hogander@intel.com>
References: <20230619125633.2395171-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 2/4] tests/i915/kms_frontbuffer_tracking:
 Split drrs into library
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

Split drrs handling into library to be used by other testcases as well.

v3: Add library function descriptions
v2: Moved into libigt instead of static kms_drrs_helper

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 lib/i915/intel_drrs.c                 | 133 ++++++++++++++++++++++++++
 lib/i915/intel_drrs.h                 |  17 ++++
 lib/meson.build                       |   1 +
 tests/i915/kms_frontbuffer_tracking.c |  83 ++--------------
 4 files changed, 158 insertions(+), 76 deletions(-)
 create mode 100644 lib/i915/intel_drrs.c
 create mode 100644 lib/i915/intel_drrs.h

diff --git a/lib/i915/intel_drrs.c b/lib/i915/intel_drrs.c
new file mode 100644
index 000000000..2f83e1394
--- /dev/null
+++ b/lib/i915/intel_drrs.c
@@ -0,0 +1,133 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include <fcntl.h>
+
+#include "igt.h"
+#include "igt_sysfs.h"
+
+#include "intel_drrs.h"
+
+/**
+ * intel_is_drrs_supported:
+ * @device: fd of the device
+ * @pipe: Display pipe
+ *
+ * Check if DRRS is supported on given pipe.
+ *
+ * Returns:
+ * true if DRRS is supported and false otherwise.
+ */
+bool intel_is_drrs_supported(int device, enum pipe pipe)
+{
+	char buf[256];
+	int dir;
+
+	dir = igt_debugfs_pipe_dir(device, pipe, O_DIRECTORY);
+	igt_require_fd(dir);
+	igt_debugfs_simple_read(dir, "i915_drrs_status", buf, sizeof(buf));
+	close(dir);
+	if (*buf == '\0')
+		return false;
+
+	return !strcasestr(buf, "DRRS enabled:");
+}
+
+/**
+ * intel_output_has_drrs
+ * @device: fd of the device
+ * @output: Display output
+ *
+ * Check if drrs used on given output.
+ *
+ * Returns:
+ * true if DRRS is used and false otherwise.
+ */
+bool intel_output_has_drrs(int device, igt_output_t *output)
+{
+	char buf[256];
+	int dir;
+
+	dir = igt_debugfs_connector_dir(device, output->name, O_DIRECTORY);
+	igt_require_fd(dir);
+	igt_debugfs_simple_read(dir, "i915_drrs_type", buf, sizeof(buf));
+	close(dir);
+
+	return strstr(buf, "seamless");
+}
+
+static void drrs_set(int device, enum pipe pipe, unsigned int val)
+{
+	char buf[2];
+	int dir, ret;
+
+	igt_debug("Manually %sabling DRRS. %u\n", val ? "en" : "dis", val);
+	snprintf(buf, sizeof(buf), "%d", val);
+
+	dir = igt_debugfs_pipe_dir(device, pipe, O_DIRECTORY);
+	igt_require_fd(dir);
+	ret = igt_sysfs_write(dir, "i915_drrs_ctl", buf, sizeof(buf) - 1);
+
+	/*
+	 * drrs_enable() is called on DRRS capable platform only,
+	 * whereas drrs_disable() is called on all platforms.
+	 * So handle the failure of debugfs_write only for drrs_enable().
+	 */
+	if (val)
+		igt_assert_f(ret == (sizeof(buf) - 1), "debugfs_write failed");
+}
+
+/**
+ * intel_drrs_enable:
+ * @device: fd of the device
+ * @pipe: Display pipe
+ *
+ * Enable DRRS on given pipe
+ *
+ * Returns:
+ * none
+ */
+void intel_drrs_enable(int device, enum pipe pipe)
+{
+	drrs_set(device, pipe, 1);
+}
+
+/**
+ * intel_drrs_disable:
+ * @device: fd of the device
+ * @pipe: Display pipe
+ *
+ * Disable DRRS on given pipe
+ *
+ * Returns:
+ * none
+ */
+void intel_drrs_disable(int device, enum pipe pipe)
+{
+	drrs_set(device, pipe, 0);
+}
+
+/**
+ * intel_is_drrs_inactive:
+ * @device: fd of the device
+ * @pipe: Display pipe
+ *
+ * Check if drrs is inactive on given pipe
+ *
+ * Returns:
+ * true if inactive and false otherwise
+ */
+bool intel_is_drrs_inactive(int device, enum pipe pipe)
+{
+	char buf[256];
+	int dir;
+
+	dir = igt_debugfs_pipe_dir(device, pipe, O_DIRECTORY);
+	igt_require_fd(dir);
+	igt_debugfs_simple_read(dir, "i915_drrs_status", buf, sizeof(buf));
+	close(dir);
+
+	return strstr(buf, "DRRS active: no");
+}
diff --git a/lib/i915/intel_drrs.h b/lib/i915/intel_drrs.h
new file mode 100644
index 000000000..d4d27a5f9
--- /dev/null
+++ b/lib/i915/intel_drrs.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+
+#ifndef INTEL_DRRS_H
+#define INTEL_DRRS_H
+
+#include "igt.h"
+
+bool intel_is_drrs_supported(int device, enum pipe pipe);
+bool intel_output_has_drrs(int device, igt_output_t *output);
+void intel_drrs_enable(int device, enum pipe pipe);
+void intel_drrs_disable(int device, enum pipe pipe);
+bool intel_is_drrs_inactive(int device, enum pipe pipe);
+
+#endif
diff --git a/lib/meson.build b/lib/meson.build
index 22cd7f274..e274917e9 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -12,6 +12,7 @@ lib_sources = [
 	'i915/gem_mman.c',
 	'i915/gem_vm.c',
 	'i915/intel_decode.c',
+	'i915/intel_drrs.c',
 	'i915/intel_fbc.c',
 	'i915/intel_memory_region.c',
 	'i915/intel_cmds_info.c',
diff --git a/tests/i915/kms_frontbuffer_tracking.c b/tests/i915/kms_frontbuffer_tracking.c
index f5da0f245..4669e0d45 100644
--- a/tests/i915/kms_frontbuffer_tracking.c
+++ b/tests/i915/kms_frontbuffer_tracking.c
@@ -32,6 +32,7 @@
 
 #include "i915/gem.h"
 #include "i915/gem_create.h"
+#include "i915/intel_drrs.h"
 #include "i915/intel_fbc.h"
 #include "igt.h"
 #include "igt_sysfs.h"
@@ -746,54 +747,10 @@ static void __debugfs_read_crtc(const char *param, char *buf, int len)
 	close(dir);
 }
 
-static int __debugfs_write_crtc(const char *param, const char *buf, int len)
-{
-	int dir, ret;
-	enum pipe pipe;
-
-	pipe = prim_mode_params.pipe;
-	dir = igt_debugfs_pipe_dir(drm.fd, pipe, O_DIRECTORY);
-	igt_require_fd(dir);
-	ret = igt_sysfs_write(dir, param, buf, len - 1);
-	close(dir);
-
-	return ret;
-}
-
-static void __debugfs_read_connector(const char *param, char *buf, int len)
-{
-	int dir;
-	igt_output_t *output;
-
-	output = prim_mode_params.output;
-	dir = igt_debugfs_connector_dir(drm.fd, output->name, O_DIRECTORY);
-	igt_require_fd(dir);
-	igt_debugfs_simple_read(dir, param, buf, len);
-	close(dir);
-}
-
 #define debugfs_read_crtc(p, arr) __debugfs_read_crtc(p, arr, sizeof(arr))
 #define debugfs_write_crtc(p, arr) __debugfs_write_crtc(p, arr, sizeof(arr))
 #define debugfs_read_connector(p, arr) __debugfs_read_connector(p, arr, sizeof(arr))
 
-static void drrs_set(unsigned int val)
-{
-	char buf[2];
-	int ret;
-
-	igt_debug("Manually %sabling DRRS. %u\n", val ? "en" : "dis", val);
-	snprintf(buf, sizeof(buf), "%d", val);
-	ret = debugfs_write_crtc("i915_drrs_ctl", buf);
-
-	/*
-	 * drrs_enable() is called on DRRS capable platform only,
-	 * whereas drrs_disable() is called on all platforms.
-	 * So handle the failure of debugfs_write only for drrs_enable().
-	 */
-	if (val)
-		igt_assert_f(ret == (sizeof(buf) - 1), "debugfs_write failed");
-}
-
 static bool is_drrs_high(void)
 {
 	char buf[MAX_DRRS_STATUS_BUF_LEN];
@@ -810,22 +767,6 @@ static bool is_drrs_low(void)
 	return strstr(buf, "DRRS refresh rate: low");
 }
 
-static bool is_drrs_supported(void)
-{
-	char buf[MAX_DRRS_STATUS_BUF_LEN];
-
-	debugfs_read_crtc("i915_drrs_status", buf);
-	return strcasestr(buf, "DRRS enabled:");
-}
-
-static bool is_drrs_inactive(void)
-{
-	char buf[MAX_DRRS_STATUS_BUF_LEN];
-
-	debugfs_read_crtc("i915_drrs_status", buf);
-	return strstr(buf, "DRRS active: no");
-}
-
 static void drrs_print_status(void)
 {
 	char buf[MAX_DRRS_STATUS_BUF_LEN];
@@ -834,14 +775,6 @@ static void drrs_print_status(void)
 	igt_info("DRRS STATUS :\n%s\n", buf);
 }
 
-static bool output_has_drrs(void)
-{
-	char buf[MAX_DRRS_STATUS_BUF_LEN];
-
-	debugfs_read_connector("i915_drrs_type", buf);
-	return strstr(buf, "seamless");
-}
-
 static struct timespec fbc_get_last_action(void)
 {
 	struct timespec ret = { 0, 0 };
@@ -955,9 +888,6 @@ static bool drrs_wait_until_rr_switch_to_low(void)
 	return igt_wait(is_drrs_low(), 5000, 1);
 }
 
-#define drrs_enable()	drrs_set(1)
-#define drrs_disable()	drrs_set(0)
-
 static struct rect pat1_get_rect(struct fb_region *fb, int r)
 {
 	struct rect rect;
@@ -1159,8 +1089,9 @@ static bool disable_features(const struct test_mode *t)
 	if (t->feature == FEATURE_DEFAULT)
 		return false;
 
-	drrs_disable();
 	intel_fbc_disable(drm.fd);
+	intel_drrs_disable(drm.fd, prim_mode_params.pipe);
+
 	return psr.can_test ? psr_disable(drm.fd, drm.debugfs) : false;
 }
 
@@ -1437,12 +1368,12 @@ static void teardown_psr(void)
 
 static void setup_drrs(void)
 {
-	if (!output_has_drrs()) {
+	if (!intel_output_has_drrs(drm.fd, prim_mode_params.output)) {
 		igt_info("Can't test DRRS: no usable screen.\n");
 		return;
 	}
 
-	if (!is_drrs_supported()) {
+	if (!intel_is_drrs_supported(drm.fd, prim_mode_params.pipe)) {
 		igt_info("Can't test DRRS: Not supported.\n");
 		return;
 	}
@@ -1599,7 +1530,7 @@ static void do_status_assertions(int flags)
 			igt_assert_f(false, "DRRS LOW\n");
 		}
 	} else if (flags & ASSERT_DRRS_INACTIVE) {
-		if (!is_drrs_inactive()) {
+		if (!intel_is_drrs_inactive(drm.fd, prim_mode_params.pipe)) {
 			drrs_print_status();
 			igt_assert_f(false, "DRRS INACTIVE\n");
 		}
@@ -1764,7 +1695,7 @@ static bool enable_features_for_test(const struct test_mode *t)
 	if (t->feature & FEATURE_PSR)
 		ret = psr_enable(drm.fd, drm.debugfs, PSR_MODE_1);
 	if (t->feature & FEATURE_DRRS)
-		drrs_enable();
+		intel_drrs_enable(drm.fd, prim_mode_params.pipe);
 
 	return ret;
 }
-- 
2.34.1
