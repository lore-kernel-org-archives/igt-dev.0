Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 655F710E81F
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Apr 2023 05:35:47 +0000 (UTC)
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  5 Apr 2023 08:34:50 +0300
Message-Id: <20230405053451.2878039-3-jouni.hogander@intel.com>
In-Reply-To: <20230405053451.2878039-1-jouni.hogander@intel.com>
References: <20230405053451.2878039-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/3] tests/i915/kms_frontbuffer_tracking:
 Split drrs
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

Split drrs handling into separate helper to be used by other testcases
as well.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 tests/i915/kms_drrs_helper.c          | 83 +++++++++++++++++++++++++++
 tests/i915/kms_drrs_helper.h          | 15 +++++
 tests/i915/kms_frontbuffer_tracking.c | 82 ++------------------------
 tests/meson.build                     |  2 +-
 4 files changed, 105 insertions(+), 77 deletions(-)
 create mode 100644 tests/i915/kms_drrs_helper.c
 create mode 100644 tests/i915/kms_drrs_helper.h

diff --git a/tests/i915/kms_drrs_helper.c b/tests/i915/kms_drrs_helper.c
new file mode 100644
index 00000000..67443e9e
--- /dev/null
+++ b/tests/i915/kms_drrs_helper.c
@@ -0,0 +1,83 @@
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
+#include "kms_drrs_helper.h"
+
+bool is_drrs_supported(int device, enum pipe pipe)
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
+bool output_has_drrs(int device, igt_output_t *output)
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
+void drrs_enable(int device, enum pipe pipe)
+{
+	drrs_set(device, pipe, 1);
+}
+
+void drrs_disable(int device, enum pipe pipe)
+{
+	drrs_set(device, pipe, 0);
+}
+
+bool is_drrs_inactive(int device, enum pipe pipe)
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
diff --git a/tests/i915/kms_drrs_helper.h b/tests/i915/kms_drrs_helper.h
new file mode 100644
index 00000000..ca037ca5
--- /dev/null
+++ b/tests/i915/kms_drrs_helper.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+
+#ifndef IGT_KMS_DRRS_HELPER_H
+#define IGT_KMS_DRRS_HELPER_H
+
+bool is_drrs_supported(int device, enum pipe pipe);
+bool output_has_drrs(int device, igt_output_t *output);
+void drrs_enable(int device, enum pipe pipe);
+void drrs_disable(int device, enum pipe pipe);
+bool is_drrs_inactive(int device, enum pipe pipe);
+
+#endif
diff --git a/tests/i915/kms_frontbuffer_tracking.c b/tests/i915/kms_frontbuffer_tracking.c
index 63fcb0fd..64b35880 100644
--- a/tests/i915/kms_frontbuffer_tracking.c
+++ b/tests/i915/kms_frontbuffer_tracking.c
@@ -36,6 +36,7 @@
 #include "igt_sysfs.h"
 #include "igt_psr.h"
 
+#include "kms_drrs_helper.h"
 #include "kms_fbc_helper.h"
 
 #define TIME SLOW_QUICK(1000, 10000)
@@ -747,54 +748,10 @@ static void __debugfs_read_crtc(const char *param, char *buf, int len)
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
@@ -811,22 +768,6 @@ static bool is_drrs_low(void)
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
@@ -835,14 +776,6 @@ static void drrs_print_status(void)
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
@@ -956,9 +889,6 @@ static bool drrs_wait_until_rr_switch_to_low(void)
 	return igt_wait(is_drrs_low(), 5000, 1);
 }
 
-#define drrs_enable()	drrs_set(1)
-#define drrs_disable()	drrs_set(0)
-
 static struct rect pat1_get_rect(struct fb_region *fb, int r)
 {
 	struct rect rect;
@@ -1160,8 +1090,8 @@ static bool disable_features(const struct test_mode *t)
 	if (t->feature == FEATURE_DEFAULT)
 		return false;
 
-	drrs_disable();
 	fbc_disable(drm.fd);
+	drrs_disable(drm.fd, prim_mode_params.pipe);
 	return psr.can_test ? psr_disable(drm.fd, drm.debugfs) : false;
 }
 
@@ -1438,12 +1368,12 @@ static void teardown_psr(void)
 
 static void setup_drrs(void)
 {
-	if (!output_has_drrs()) {
+	if (!output_has_drrs(drm.fd, prim_mode_params.output)) {
 		igt_info("Can't test DRRS: no usable screen.\n");
 		return;
 	}
 
-	if (!is_drrs_supported()) {
+	if (!is_drrs_supported(drm.fd, prim_mode_params.pipe)) {
 		igt_info("Can't test DRRS: Not supported.\n");
 		return;
 	}
@@ -1600,7 +1530,7 @@ static void do_status_assertions(int flags)
 			igt_assert_f(false, "DRRS LOW\n");
 		}
 	} else if (flags & ASSERT_DRRS_INACTIVE) {
-		if (!is_drrs_inactive()) {
+		if (!is_drrs_inactive(drm.fd, prim_mode_params.pipe)) {
 			drrs_print_status();
 			igt_assert_f(false, "DRRS INACTIVE\n");
 		}
@@ -1765,7 +1695,7 @@ static bool enable_features_for_test(const struct test_mode *t)
 	if (t->feature & FEATURE_PSR)
 		ret = psr_enable(drm.fd, drm.debugfs, PSR_MODE_1);
 	if (t->feature & FEATURE_DRRS)
-		drrs_enable();
+		drrs_enable(drm.fd, prim_mode_params.pipe);
 
 	return ret;
 }
diff --git a/tests/meson.build b/tests/meson.build
index 27459938..8fa69af3 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -487,7 +487,7 @@ test_executables += executable('kms_psr2_sf',
 test_list += 'kms_psr2_sf'
 
 test_executables += executable('kms_frontbuffer_tracking',
-	   [ join_paths('i915', 'kms_frontbuffer_tracking.c'), join_paths ('i915', 'kms_fbc_helper.c')],
+	   [ join_paths('i915', 'kms_frontbuffer_tracking.c'), join_paths ('i915', 'kms_fbc_helper.c'), join_paths ('i915', 'kms_drrs_helper.c')],
 	   dependencies : test_deps,
 	   install_dir : libexecdir,
 	   install_rpath : libexecdir_rpathdir,
-- 
2.34.1
