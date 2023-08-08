Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BCE810E136
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Aug 2023 12:28:24 +0000 (UTC)
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  8 Aug 2023 15:27:58 +0300
Message-Id: <20230808122759.978258-2-jouni.hogander@intel.com>
In-Reply-To: <20230808122759.978258-1-jouni.hogander@intel.com>
References: <20230808122759.978258-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/3] Revert
 "tests/i915/kms_frontbuffer_tracking: Split drrs into library"
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

This reverts commit bc3b24882550bbccbf072b428f51aa6edb75aea6.

This patch is missing added intel_drrs.h and intel_drrs.c files.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 lib/meson.build                       |  1 -
 tests/i915/kms_frontbuffer_tracking.c | 83 ++++++++++++++++++++++++---
 2 files changed, 76 insertions(+), 8 deletions(-)

diff --git a/lib/meson.build b/lib/meson.build
index 819ae90b2..4b5c2f276 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -12,7 +12,6 @@ lib_sources = [
 	'i915/gem_mman.c',
 	'i915/gem_vm.c',
 	'i915/intel_decode.c',
-	'i915/intel_drrs.c',
 	'i915/intel_fbc.c',
 	'i915/intel_memory_region.c',
 	'i915/i915_crc.c',
diff --git a/tests/i915/kms_frontbuffer_tracking.c b/tests/i915/kms_frontbuffer_tracking.c
index 9c58beaae..ca1aa0515 100644
--- a/tests/i915/kms_frontbuffer_tracking.c
+++ b/tests/i915/kms_frontbuffer_tracking.c
@@ -32,7 +32,6 @@
 
 #include "i915/gem.h"
 #include "i915/gem_create.h"
-#include "i915/intel_drrs.h"
 #include "i915/intel_fbc.h"
 #include "igt.h"
 #include "igt_sysfs.h"
@@ -747,10 +746,54 @@ static void __debugfs_read_crtc(const char *param, char *buf, int len)
 	close(dir);
 }
 
+static int __debugfs_write_crtc(const char *param, const char *buf, int len)
+{
+	int dir, ret;
+	enum pipe pipe;
+
+	pipe = prim_mode_params.pipe;
+	dir = igt_debugfs_pipe_dir(drm.fd, pipe, O_DIRECTORY);
+	igt_require_fd(dir);
+	ret = igt_sysfs_write(dir, param, buf, len - 1);
+	close(dir);
+
+	return ret;
+}
+
+static void __debugfs_read_connector(const char *param, char *buf, int len)
+{
+	int dir;
+	igt_output_t *output;
+
+	output = prim_mode_params.output;
+	dir = igt_debugfs_connector_dir(drm.fd, output->name, O_DIRECTORY);
+	igt_require_fd(dir);
+	igt_debugfs_simple_read(dir, param, buf, len);
+	close(dir);
+}
+
 #define debugfs_read_crtc(p, arr) __debugfs_read_crtc(p, arr, sizeof(arr))
 #define debugfs_write_crtc(p, arr) __debugfs_write_crtc(p, arr, sizeof(arr))
 #define debugfs_read_connector(p, arr) __debugfs_read_connector(p, arr, sizeof(arr))
 
+static void drrs_set(unsigned int val)
+{
+	char buf[2];
+	int ret;
+
+	igt_debug("Manually %sabling DRRS. %u\n", val ? "en" : "dis", val);
+	snprintf(buf, sizeof(buf), "%d", val);
+	ret = debugfs_write_crtc("i915_drrs_ctl", buf);
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
 static bool is_drrs_high(void)
 {
 	char buf[MAX_DRRS_STATUS_BUF_LEN];
@@ -767,6 +810,22 @@ static bool is_drrs_low(void)
 	return strstr(buf, "DRRS refresh rate: low");
 }
 
+static bool is_drrs_supported(void)
+{
+	char buf[MAX_DRRS_STATUS_BUF_LEN];
+
+	debugfs_read_crtc("i915_drrs_status", buf);
+	return strcasestr(buf, "DRRS enabled:");
+}
+
+static bool is_drrs_inactive(void)
+{
+	char buf[MAX_DRRS_STATUS_BUF_LEN];
+
+	debugfs_read_crtc("i915_drrs_status", buf);
+	return strstr(buf, "DRRS active: no");
+}
+
 static void drrs_print_status(void)
 {
 	char buf[MAX_DRRS_STATUS_BUF_LEN];
@@ -775,6 +834,14 @@ static void drrs_print_status(void)
 	igt_info("DRRS STATUS :\n%s\n", buf);
 }
 
+static bool output_has_drrs(void)
+{
+	char buf[MAX_DRRS_STATUS_BUF_LEN];
+
+	debugfs_read_connector("i915_drrs_type", buf);
+	return strstr(buf, "seamless");
+}
+
 static struct timespec fbc_get_last_action(void)
 {
 	struct timespec ret = { 0, 0 };
@@ -888,6 +955,9 @@ static bool drrs_wait_until_rr_switch_to_low(void)
 	return igt_wait(is_drrs_low(), 5000, 1);
 }
 
+#define drrs_enable()	drrs_set(1)
+#define drrs_disable()	drrs_set(0)
+
 static struct rect pat1_get_rect(struct fb_region *fb, int r)
 {
 	struct rect rect;
@@ -1089,9 +1159,8 @@ static bool disable_features(const struct test_mode *t)
 	if (t->feature == FEATURE_DEFAULT)
 		return false;
 
+	drrs_disable();
 	intel_fbc_disable(drm.fd);
-	intel_drrs_disable(drm.fd, prim_mode_params.pipe);
-
 	return psr.can_test ? psr_disable(drm.fd, drm.debugfs) : false;
 }
 
@@ -1370,12 +1439,12 @@ static void teardown_psr(void)
 
 static void setup_drrs(void)
 {
-	if (!intel_output_has_drrs(drm.fd, prim_mode_params.output)) {
+	if (!output_has_drrs()) {
 		igt_info("Can't test DRRS: no usable screen.\n");
 		return;
 	}
 
-	if (!intel_is_drrs_supported(drm.fd, prim_mode_params.pipe)) {
+	if (!is_drrs_supported()) {
 		igt_info("Can't test DRRS: Not supported.\n");
 		return;
 	}
@@ -1533,7 +1602,7 @@ static void do_status_assertions(int flags)
 			igt_assert_f(false, "DRRS LOW\n");
 		}
 	} else if (flags & ASSERT_DRRS_INACTIVE) {
-		if (!intel_is_drrs_inactive(drm.fd, prim_mode_params.pipe)) {
+		if (!is_drrs_inactive()) {
 			drrs_print_status();
 			igt_assert_f(false, "DRRS INACTIVE\n");
 		}
@@ -1698,7 +1767,7 @@ static bool enable_features_for_test(const struct test_mode *t)
 	if (t->feature & FEATURE_PSR)
 		ret = psr_enable(drm.fd, drm.debugfs, PSR_MODE_1);
 	if (t->feature & FEATURE_DRRS)
-		intel_drrs_enable(drm.fd, prim_mode_params.pipe);
+		drrs_enable();
 
 	return ret;
 }
-- 
2.34.1
