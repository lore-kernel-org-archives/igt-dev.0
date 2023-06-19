Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC2A510E0E7
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jun 2023 12:57:16 +0000 (UTC)
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 19 Jun 2023 15:56:30 +0300
Message-Id: <20230619125633.2395171-2-jouni.hogander@intel.com>
In-Reply-To: <20230619125633.2395171-1-jouni.hogander@intel.com>
References: <20230619125633.2395171-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 1/4] tests/i915/kms_frontbuffer_tracking:
 Split fbc into library
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

Split fbc handling into library to be used by other tests as well.

v3: Add library function descriptions
v2: Moved into libigt instead of static kms_fbc_helper

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 lib/i915/intel_fbc.c                  | 96 +++++++++++++++++++++++++++
 lib/i915/intel_fbc.h                  | 19 ++++++
 lib/meson.build                       |  1 +
 tests/i915/kms_frontbuffer_tracking.c | 57 +++-------------
 4 files changed, 126 insertions(+), 47 deletions(-)
 create mode 100644 lib/i915/intel_fbc.c
 create mode 100644 lib/i915/intel_fbc.h

diff --git a/lib/i915/intel_fbc.c b/lib/i915/intel_fbc.c
new file mode 100644
index 000000000..a885b2f97
--- /dev/null
+++ b/lib/i915/intel_fbc.c
@@ -0,0 +1,96 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include <fcntl.h>
+
+#include "igt.h"
+
+#include "intel_fbc.h"
+
+#define FBC_STATUS_BUF_LEN 128
+
+/**
+ * intel_fbc_supported_on_chipset:
+ * @device: fd of the device
+ * @pipe: Display pipe
+ *
+ * Check if FBC is supported by chipset on given pipe.
+ *
+ * Returns:
+ * true if FBC is supported and false otherwise.
+ */
+bool intel_fbc_supported_on_chipset(int device, enum pipe pipe)
+{
+	char buf[FBC_STATUS_BUF_LEN];
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
+static bool _intel_fbc_is_enabled(int device, enum pipe pipe, int log_level, char *last_fbc_buf)
+{
+	char buf[FBC_STATUS_BUF_LEN];
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
+		igt_log(IGT_LOG_DOMAIN, log_level, "fbc_is_enabled():\n%s\n", buf);
+
+	return strstr(buf, "FBC enabled\n");
+}
+
+/**
+ * intel_fbc_is_enabled:
+ * @device: fd of the device
+ * @pipe: Display pipe
+ * @log_level: Wanted loglevel
+ *
+ * Check if FBC is enabled on given pipe. Loglevel can be used to
+ * control at which loglevel current state is printed out.
+ *
+ * Returns:
+ * true if FBC is enabled.
+ */
+bool intel_fbc_is_enabled(int device, enum pipe pipe, int log_level)
+{
+	char last_fbc_buf[FBC_STATUS_BUF_LEN] = {'\0'};
+
+	return _intel_fbc_is_enabled(device, pipe, log_level, last_fbc_buf);
+}
+
+/**
+ * intel_fbc_wait_until_enabled:
+ * @device: fd of the device
+ * @pipe: Display pipe
+ *
+ * Wait until fbc is enabled. Used timeout is constant 2 seconds.
+ *
+ * Returns:
+ * true if FBC got enabled.
+ */
+bool intel_fbc_wait_until_enabled(int device, enum pipe pipe)
+{
+	char last_fbc_buf[FBC_STATUS_BUF_LEN] = {'\0'};
+
+	return igt_wait(_intel_fbc_is_enabled(device, pipe, IGT_LOG_DEBUG, last_fbc_buf), 2000, 1);
+}
diff --git a/lib/i915/intel_fbc.h b/lib/i915/intel_fbc.h
new file mode 100644
index 000000000..901bf984b
--- /dev/null
+++ b/lib/i915/intel_fbc.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+
+#ifndef INTEL_FBC_H
+#define INTEL_FBC_H
+
+#include "igt.h"
+
+#define intel_fbc_enable(device) igt_set_module_param_int(device, "enable_fbc", 1)
+#define intel_fbc_disable(device) igt_set_module_param_int(device, "enable_fbc", 0)
+
+bool intel_fbc_supported_on_chipset(int device, enum pipe pipe);
+bool intel_fbc_wait_until_enabled(int device, enum pipe pipe);
+bool intel_fbc_is_enabled(int device, enum pipe pipe, int log_level);
+
+#endif
+
diff --git a/lib/meson.build b/lib/meson.build
index 8e9977083..22cd7f274 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -12,6 +12,7 @@ lib_sources = [
 	'i915/gem_mman.c',
 	'i915/gem_vm.c',
 	'i915/intel_decode.c',
+	'i915/intel_fbc.c',
 	'i915/intel_memory_region.c',
 	'i915/intel_cmds_info.c',
 	'i915/i915_blt.c',
diff --git a/tests/i915/kms_frontbuffer_tracking.c b/tests/i915/kms_frontbuffer_tracking.c
index 650e14a77..f5da0f245 100644
--- a/tests/i915/kms_frontbuffer_tracking.c
+++ b/tests/i915/kms_frontbuffer_tracking.c
@@ -32,6 +32,7 @@
 
 #include "i915/gem.h"
 #include "i915/gem_create.h"
+#include "i915/intel_fbc.h"
 #include "igt.h"
 #include "igt_sysfs.h"
 #include "igt_psr.h"
@@ -775,27 +776,6 @@ static void __debugfs_read_connector(const char *param, char *buf, int len)
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
@@ -970,20 +950,11 @@ static bool fbc_mode_too_large(void)
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
 
@@ -1188,8 +1159,8 @@ static bool disable_features(const struct test_mode *t)
 	if (t->feature == FEATURE_DEFAULT)
 		return false;
 
-	fbc_disable();
 	drrs_disable();
+	intel_fbc_disable(drm.fd);
 	return psr.can_test ? psr_disable(drm.fd, drm.debugfs) : false;
 }
 
@@ -1429,20 +1400,9 @@ static void teardown_crcs(void)
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
+	if (!intel_fbc_supported_on_chipset(drm.fd, prim_mode_params.pipe)) {
 		igt_info("Can't test FBC: not supported on this chipset\n");
 		return;
 	}
@@ -1649,15 +1609,18 @@ static void do_status_assertions(int flags)
 		igt_require(!fbc_not_enough_stolen());
 		igt_require(!fbc_stride_not_supported());
 		igt_require(!fbc_mode_too_large());
-		if (!fbc_wait_until_enabled()) {
-			igt_assert_f(fbc_is_enabled(IGT_LOG_WARN),
+		if (!intel_fbc_wait_until_enabled(drm.fd, prim_mode_params.pipe)) {
+			igt_assert_f(intel_fbc_is_enabled(drm.fd,
+						    prim_mode_params.pipe,
+						    IGT_LOG_WARN),
 				     "FBC disabled\n");
 		}
 
 		if (opt.fbc_check_compression)
 			igt_assert(fbc_wait_for_compression());
 	} else if (flags & ASSERT_FBC_DISABLED) {
-		igt_assert(!fbc_wait_until_enabled());
+		igt_assert(!intel_fbc_wait_until_enabled(drm.fd,
+						   prim_mode_params.pipe));
 	}
 
 	if (flags & ASSERT_PSR_ENABLED)
@@ -1797,7 +1760,7 @@ static bool enable_features_for_test(const struct test_mode *t)
 		return false;
 
 	if (t->feature & FEATURE_FBC)
-		fbc_enable();
+		intel_fbc_enable(drm.fd);
 	if (t->feature & FEATURE_PSR)
 		ret = psr_enable(drm.fd, drm.debugfs, PSR_MODE_1);
 	if (t->feature & FEATURE_DRRS)
-- 
2.34.1
