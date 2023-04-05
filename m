Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 296AE10E30F
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Apr 2023 05:35:21 +0000 (UTC)
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  5 Apr 2023 08:34:49 +0300
Message-Id: <20230405053451.2878039-2-jouni.hogander@intel.com>
In-Reply-To: <20230405053451.2878039-1-jouni.hogander@intel.com>
References: <20230405053451.2878039-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/3] tests/i915/kms_frontbuffer_tracking:
 Split fbc into separate helper
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

Split fbc handling into separate helper to be used by other tests
as well.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 tests/i915/kms_fbc_helper.c           | 57 ++++++++++++++++++++++++++
 tests/i915/kms_fbc_helper.h           | 19 +++++++++
 tests/i915/kms_frontbuffer_tracking.c | 58 +++++----------------------
 tests/meson.build                     |  9 ++++-
 4 files changed, 95 insertions(+), 48 deletions(-)
 create mode 100644 tests/i915/kms_fbc_helper.c
 create mode 100644 tests/i915/kms_fbc_helper.h

diff --git a/tests/i915/kms_fbc_helper.c b/tests/i915/kms_fbc_helper.c
new file mode 100644
index 00000000..935679d3
--- /dev/null
+++ b/tests/i915/kms_fbc_helper.c
@@ -0,0 +1,57 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include <fcntl.h>
+
+#include "igt.h"
+
+#include "kms_fbc_helper.h"
+
+bool fbc_supported_on_chipset(int device, enum pipe pipe)
+{
+	char buf[128];
+	int dir;
+
+	dir = igt_debugfs_pipe_dir(device, pipe, O_DIRECTORY);
+	igt_require_fd(dir);
+	igt_debugfs_simple_read(dir, "i915_fbc_status", buf, sizeof(buf));
+	close(dir);
+	if (*buf == '\0')
+		return false;
+
+	return !strstr(buf, "FBC unsupported on this chipset\n");
+}
+
+static char last_fbc_buf[128];
+
+bool fbc_is_enabled(int device, enum pipe pipe, int log_level)
+{
+	char buf[128];
+	bool print = true;
+	int dir;
+
+	dir = igt_debugfs_pipe_dir(device, pipe, O_DIRECTORY);
+	igt_require_fd(dir);
+	igt_debugfs_simple_read(dir, "i915_fbc_status", buf, sizeof(buf));
+	close(dir);
+	if (log_level != IGT_LOG_DEBUG)
+		last_fbc_buf[0] = '\0';
+	else if (strcmp(last_fbc_buf, buf))
+		strcpy(last_fbc_buf, buf);
+	else
+		print = false;
+
+	if (print)
+		igt_log(IGT_LOG_DOMAIN, log_level, "fbc_is_enabled()?\n%s", buf);
+
+	return strstr(buf, "FBC enabled\n");
+}
+
+bool fbc_wait_until_enabled(int device, enum pipe pipe)
+{
+	last_fbc_buf[0] = '\0';
+
+	return igt_wait(fbc_is_enabled(device, pipe, IGT_LOG_DEBUG), 2000, 1);
+}
diff --git a/tests/i915/kms_fbc_helper.h b/tests/i915/kms_fbc_helper.h
new file mode 100644
index 00000000..c8a30602
--- /dev/null
+++ b/tests/i915/kms_fbc_helper.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+
+#ifndef IGT_KMS_FBC_HELPER_H
+#define IGT_KMS_FBC_HELPER_H
+
+#include "igt.h"
+
+#define fbc_enable(device) igt_set_module_param_int(device, "enable_fbc", 1)
+#define fbc_disable(device) igt_set_module_param_int(device, "enable_fbc", 0)
+
+bool fbc_supported_on_chipset(int device, enum pipe pipe);
+bool fbc_wait_until_enabled(int device, enum pipe pipe);
+bool fbc_is_enabled(int device, enum pipe pipe, int log_level);
+
+#endif
+
diff --git a/tests/i915/kms_frontbuffer_tracking.c b/tests/i915/kms_frontbuffer_tracking.c
index 650e14a7..63fcb0fd 100644
--- a/tests/i915/kms_frontbuffer_tracking.c
+++ b/tests/i915/kms_frontbuffer_tracking.c
@@ -36,6 +36,8 @@
 #include "igt_sysfs.h"
 #include "igt_psr.h"
 
+#include "kms_fbc_helper.h"
+
 #define TIME SLOW_QUICK(1000, 10000)
 
 IGT_TEST_DESCRIPTION("Test the Kernel's frontbuffer tracking mechanism and "
@@ -775,27 +777,6 @@ static void __debugfs_read_connector(const char *param, char *buf, int len)
 #define debugfs_write_crtc(p, arr) __debugfs_write_crtc(p, arr, sizeof(arr))
 #define debugfs_read_connector(p, arr) __debugfs_read_connector(p, arr, sizeof(arr))
 
-static char last_fbc_buf[128];
-
-static bool fbc_is_enabled(int lvl)
-{
-	char buf[128];
-	bool print = true;
-
-	debugfs_read_crtc("i915_fbc_status", buf);
-	if (lvl != IGT_LOG_DEBUG)
-		last_fbc_buf[0] = '\0';
-	else if (strcmp(last_fbc_buf, buf))
-		strcpy(last_fbc_buf, buf);
-	else
-		print = false;
-
-	if (print)
-		igt_log(IGT_LOG_DOMAIN, lvl, "fbc_is_enabled()?\n%s", buf);
-
-	return strstr(buf, "FBC enabled\n");
-}
-
 static void drrs_set(unsigned int val)
 {
 	char buf[2];
@@ -970,20 +951,11 @@ static bool fbc_mode_too_large(void)
 	return strstr(buf, "FBC disabled: mode too large for compression\n");
 }
 
-static bool fbc_wait_until_enabled(void)
-{
-	last_fbc_buf[0] = '\0';
-
-	return igt_wait(fbc_is_enabled(IGT_LOG_DEBUG), 2000, 1);
-}
-
 static bool drrs_wait_until_rr_switch_to_low(void)
 {
 	return igt_wait(is_drrs_low(), 5000, 1);
 }
 
-#define fbc_enable() igt_set_module_param_int(drm.fd, "enable_fbc", 1)
-#define fbc_disable() igt_set_module_param_int(drm.fd, "enable_fbc", 0)
 #define drrs_enable()	drrs_set(1)
 #define drrs_disable()	drrs_set(0)
 
@@ -1188,8 +1160,8 @@ static bool disable_features(const struct test_mode *t)
 	if (t->feature == FEATURE_DEFAULT)
 		return false;
 
-	fbc_disable();
 	drrs_disable();
+	fbc_disable(drm.fd);
 	return psr.can_test ? psr_disable(drm.fd, drm.debugfs) : false;
 }
 
@@ -1429,20 +1401,9 @@ static void teardown_crcs(void)
 	igt_pipe_crc_free(pipe_crc);
 }
 
-static bool fbc_supported_on_chipset(void)
-{
-	char buf[128];
-
-	debugfs_read_crtc("i915_fbc_status", buf);
-	if (*buf == '\0')
-		return false;
-
-	return !strstr(buf, "FBC unsupported on this chipset\n");
-}
-
 static void setup_fbc(void)
 {
-	if (!fbc_supported_on_chipset()) {
+	if (!fbc_supported_on_chipset(drm.fd, prim_mode_params.pipe)) {
 		igt_info("Can't test FBC: not supported on this chipset\n");
 		return;
 	}
@@ -1649,15 +1610,18 @@ static void do_status_assertions(int flags)
 		igt_require(!fbc_not_enough_stolen());
 		igt_require(!fbc_stride_not_supported());
 		igt_require(!fbc_mode_too_large());
-		if (!fbc_wait_until_enabled()) {
-			igt_assert_f(fbc_is_enabled(IGT_LOG_WARN),
+		if (!fbc_wait_until_enabled(drm.fd, prim_mode_params.pipe)) {
+			igt_assert_f(fbc_is_enabled(drm.fd,
+						    prim_mode_params.pipe,
+						    IGT_LOG_WARN),
 				     "FBC disabled\n");
 		}
 
 		if (opt.fbc_check_compression)
 			igt_assert(fbc_wait_for_compression());
 	} else if (flags & ASSERT_FBC_DISABLED) {
-		igt_assert(!fbc_wait_until_enabled());
+		igt_assert(!fbc_wait_until_enabled(drm.fd,
+						   prim_mode_params.pipe));
 	}
 
 	if (flags & ASSERT_PSR_ENABLED)
@@ -1797,7 +1761,7 @@ static bool enable_features_for_test(const struct test_mode *t)
 		return false;
 
 	if (t->feature & FEATURE_FBC)
-		fbc_enable();
+		fbc_enable(drm.fd);
 	if (t->feature & FEATURE_PSR)
 		ret = psr_enable(drm.fd, drm.debugfs, PSR_MODE_1);
 	if (t->feature & FEATURE_DRRS)
diff --git a/tests/meson.build b/tests/meson.build
index da31e782..27459938 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -227,7 +227,6 @@ i915_progs = [
 	'kms_fence_pin_leak',
 	'kms_flip_scaled_crc',
 	'kms_flip_tiling',
-	'kms_frontbuffer_tracking',
 	'kms_legacy_colorkey',
 	'kms_mmap_write_crc',
 	'kms_pipe_b_c_ivb',
@@ -487,6 +486,14 @@ test_executables += executable('kms_psr2_sf',
 	   install : true)
 test_list += 'kms_psr2_sf'
 
+test_executables += executable('kms_frontbuffer_tracking',
+	   [ join_paths('i915', 'kms_frontbuffer_tracking.c'), join_paths ('i915', 'kms_fbc_helper.c')],
+	   dependencies : test_deps,
+	   install_dir : libexecdir,
+	   install_rpath : libexecdir_rpathdir,
+	   install : true)
+test_list += 'kms_frontbuffer_tracking'
+
 if chamelium.found()
        test_executables += executable('kms_chamelium_color',
                              [ 'chamelium/kms_chamelium_color.c', 'kms_color_helper.c' ],
-- 
2.34.1
