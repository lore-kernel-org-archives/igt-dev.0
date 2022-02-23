Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A9B610F5DC
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Feb 2022 13:33:26 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 23 Feb 2022 19:04:22 +0530
Message-Id: <20220223133422.17032-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5] tests/i915:Extend
 kms_frontbuffer_tracking to test FBC on multiple pipes
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

In future more platforms will support FBC on
multiple pipes, so to validate the same extending
the kms_frontbuffer_tracking test.

In kernel code now  FBC debugfs files are exposed
for each crtc so added debugfs_read_crtc function
to get the per pipe fbc status.

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/i915/kms_frontbuffer_tracking.c | 40 ++++++++++++++-------------
 1 file changed, 21 insertions(+), 19 deletions(-)

diff --git a/tests/i915/kms_frontbuffer_tracking.c b/tests/i915/kms_frontbuffer_tracking.c
index 532bfbb9..12cb98f3 100644
--- a/tests/i915/kms_frontbuffer_tracking.c
+++ b/tests/i915/kms_frontbuffer_tracking.c
@@ -732,8 +732,21 @@ static int __debugfs_write(const char *param, char *buf, int len)
 	return igt_sysfs_write(drm.debugfs, param, buf, len - 1);
 }
 
+static void __debugfs_read_crtc(const char *param, char *buf, int len)
+{
+	int dir;
+	enum pipe pipe;
+
+	pipe = prim_mode_params.pipe;
+	dir = igt_debugfs_pipe_dir(drm.fd, pipe, O_DIRECTORY);
+	igt_require_fd(dir);
+	igt_debugfs_simple_read(dir, param, buf, len);
+	close(dir);
+}
+
 #define debugfs_read(p, arr) __debugfs_read(p, arr, sizeof(arr))
 #define debugfs_write(p, arr) __debugfs_write(p, arr, sizeof(arr))
+#define debugfs_read_crtc(p, arr) __debugfs_read_crtc(p, arr, sizeof(arr))
 
 static char last_fbc_buf[128];
 
@@ -742,7 +755,7 @@ static bool fbc_is_enabled(int lvl)
 	char buf[128];
 	bool print = true;
 
-	debugfs_read("i915_fbc_status", buf);
+	debugfs_read_crtc("i915_fbc_status", buf);
 	if (lvl != IGT_LOG_DEBUG)
 		last_fbc_buf[0] = '\0';
 	else if (strcmp(last_fbc_buf, buf))
@@ -825,8 +838,8 @@ static struct timespec fbc_get_last_action(void)
 	char *action;
 	ssize_t n_read;
 
-	debugfs_read("i915_fbc_status", buf);
 
+	debugfs_read_crtc("i915_fbc_status", buf);
 	action = strstr(buf, "\nLast action:");
 	igt_assert(action);
 
@@ -874,8 +887,8 @@ static void fbc_setup_last_action(void)
 	char buf[128];
 	char *action;
 
-	debugfs_read("i915_fbc_status", buf);
 
+	debugfs_read_crtc("i915_fbc_status", buf);
 	action = strstr(buf, "\nLast action:");
 	if (!action) {
 		igt_info("FBC last action not supported\n");
@@ -893,7 +906,7 @@ static bool fbc_is_compressing(void)
 {
 	char buf[128];
 
-	debugfs_read("i915_fbc_status", buf);
+	debugfs_read_crtc("i915_fbc_status", buf);
 	return strstr(buf, "\nCompressing: yes\n") != NULL;
 }
 
@@ -906,7 +919,7 @@ static bool fbc_not_enough_stolen(void)
 {
 	char buf[128];
 
-	debugfs_read("i915_fbc_status", buf);
+	debugfs_read_crtc("i915_fbc_status", buf);
 	return strstr(buf, "FBC disabled: not enough stolen memory\n");
 }
 
@@ -914,7 +927,7 @@ static bool fbc_stride_not_supported(void)
 {
 	char buf[128];
 
-	debugfs_read("i915_fbc_status", buf);
+	debugfs_read_crtc("i915_fbc_status", buf);
 	return strstr(buf, "FBC disabled: framebuffer stride not supported\n");
 }
 
@@ -922,7 +935,7 @@ static bool fbc_mode_too_large(void)
 {
 	char buf[128];
 
-	debugfs_read("i915_fbc_status", buf);
+	debugfs_read_crtc("i915_fbc_status", buf);
 	return strstr(buf, "FBC disabled: mode too large for compression\n");
 }
 
@@ -1388,7 +1401,7 @@ static bool fbc_supported_on_chipset(void)
 {
 	char buf[128];
 
-	debugfs_read("i915_fbc_status", buf);
+	debugfs_read_crtc("i915_fbc_status", buf);
 	if (*buf == '\0')
 		return false;
 
@@ -1404,17 +1417,6 @@ static void setup_fbc(void)
 		return;
 	}
 
-	/*
-	 * While some platforms do allow FBC on pipes B/C, this test suite
-	 * is not prepared for that yet.
-	 * TODO: solve this.
-	 */
-	if (prim_mode_params.pipe != PIPE_A) {
-		igt_info("Can't test FBC: primary connector doesn't support "
-			 "pipe A\n");
-		return;
-	}
-
 	/* Early Generations are not able to report compression status. */
 	if (!AT_LEAST_GEN(devid, 7))
 		opt.fbc_check_compression = false;
-- 
2.26.2
