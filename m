Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 958ED10E524
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Aug 2023 10:40:26 +0000 (UTC)
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 24 Aug 2023 13:40:06 +0300
Message-Id: <20230824104007.931922-4-jouni.hogander@intel.com>
In-Reply-To: <20230824104007.931922-1-jouni.hogander@intel.com>
References: <20230824104007.931922-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v9 3/4] tests/i915/kms_frontbuffer_tracking:
 Utilize added fbc and drrs helpers
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

We have now helper functions for fbc and drrs in igt library. Use these
instead of own implementations.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/i915/kms_frontbuffer_tracking.c | 141 ++++----------------------
 1 file changed, 17 insertions(+), 124 deletions(-)

diff --git a/tests/i915/kms_frontbuffer_tracking.c b/tests/i915/kms_frontbuffer_tracking.c
index 136426204..40b3d4cb5 100644
--- a/tests/i915/kms_frontbuffer_tracking.c
+++ b/tests/i915/kms_frontbuffer_tracking.c
@@ -37,6 +37,8 @@
 
 #include "i915/gem.h"
 #include "i915/gem_create.h"
+#include "i915/intel_drrs.h"
+#include "i915/intel_fbc.h"
 #include "igt.h"
 #include "igt_sysfs.h"
 #include "igt_psr.h"
@@ -750,75 +752,10 @@ static void __debugfs_read_crtc(const char *param, char *buf, int len)
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
@@ -835,22 +772,6 @@ static bool is_drrs_low(void)
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
@@ -859,14 +780,6 @@ static void drrs_print_status(void)
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
@@ -975,23 +888,11 @@ static bool fbc_mode_too_large(void)
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
-#define drrs_enable()	drrs_set(1)
-#define drrs_disable()	drrs_set(0)
-
 static struct rect pat1_get_rect(struct fb_region *fb, int r)
 {
 	struct rect rect;
@@ -1193,8 +1094,9 @@ static bool disable_features(const struct test_mode *t)
 	if (t->feature == FEATURE_DEFAULT)
 		return false;
 
-	fbc_disable();
-	drrs_disable();
+	intel_fbc_disable(drm.fd);
+	intel_drrs_disable(drm.fd, prim_mode_params.pipe);
+
 	return psr.can_test ? psr_disable(drm.fd, drm.debugfs) : false;
 }
 
@@ -1436,21 +1338,9 @@ static void teardown_crcs(void)
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
-	return !strstr(buf, "FBC unsupported on this chipset\n") &&
-		!strstr(buf, "stolen memory not initialised\n");
-}
-
 static void setup_fbc(void)
 {
-	if (!fbc_supported_on_chipset()) {
+	if (!intel_fbc_supported_on_chipset(drm.fd, prim_mode_params.pipe)) {
 		igt_info("Can't test FBC: not supported on this chipset\n");
 		return;
 	}
@@ -1485,12 +1375,12 @@ static void teardown_psr(void)
 
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
@@ -1648,7 +1538,7 @@ static void do_status_assertions(int flags)
 			igt_assert_f(false, "DRRS LOW\n");
 		}
 	} else if (flags & ASSERT_DRRS_INACTIVE) {
-		if (!is_drrs_inactive()) {
+		if (!intel_is_drrs_inactive(drm.fd, prim_mode_params.pipe)) {
 			drrs_print_status();
 			igt_assert_f(false, "DRRS INACTIVE\n");
 		}
@@ -1658,15 +1548,18 @@ static void do_status_assertions(int flags)
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
@@ -1806,11 +1699,11 @@ static bool enable_features_for_test(const struct test_mode *t)
 		return false;
 
 	if (t->feature & FEATURE_FBC)
-		fbc_enable();
+		intel_fbc_enable(drm.fd);
 	if (t->feature & FEATURE_PSR)
 		ret = psr_enable(drm.fd, drm.debugfs, PSR_MODE_1);
 	if (t->feature & FEATURE_DRRS)
-		drrs_enable();
+		intel_drrs_enable(drm.fd, prim_mode_params.pipe);
 
 	return ret;
 }
-- 
2.34.1
