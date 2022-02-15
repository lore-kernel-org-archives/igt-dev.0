Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89E7A10E3EB
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Feb 2022 08:10:24 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
Date: Tue, 15 Feb 2022 13:41:18 +0530
Message-Id: <20220215081118.15905-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2] tests/i915:Extend
 kms_frontbuffer_tracking to test FBC on multiple pipes
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>, ville.syrjala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

In future more platforms will support FBC on
multiple pipes, so to validate the same extending
the kms_frontbuffer_tracking test.

In kernel code now  FBC debugfs files are exposed
for each crtc so added debugfs_read_crtc function
to get the per pipe fbc status.

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/i915/kms_frontbuffer_tracking.c | 42 +++++++++++++++------------
 1 file changed, 23 insertions(+), 19 deletions(-)

diff --git a/tests/i915/kms_frontbuffer_tracking.c b/tests/i915/kms_frontbuffer_tracking.c
index 532bfbb9..363b4c6c 100644
--- a/tests/i915/kms_frontbuffer_tracking.c
+++ b/tests/i915/kms_frontbuffer_tracking.c
@@ -732,8 +732,23 @@ static int __debugfs_write(const char *param, char *buf, int len)
 	return igt_sysfs_write(drm.debugfs, param, buf, len - 1);
 }
 
+static void __debugfs_read_crtc(const char *param, char *buf, int len)
+{
+	int dir,fd;
+	enum pipe pipe;
+
+	pipe = prim_mode_params.pipe;
+	dir = igt_debugfs_pipe_dir(drm.fd, pipe, O_RDONLY);
+	igt_require_fd(dir);
+	fd = openat(dir, "i915_fbc_status", O_RDONLY);
+	igt_debugfs_simple_read(fd, param, buf, len);
+	close(fd);
+	close(dir);
+}
+
 #define debugfs_read(p, arr) __debugfs_read(p, arr, sizeof(arr))
 #define debugfs_write(p, arr) __debugfs_write(p, arr, sizeof(arr))
+#define debugfs_read_crtc(p, arr) __debugfs_read_crtc(p, arr, sizeof(arr))
 
 static char last_fbc_buf[128];
 
@@ -742,7 +757,7 @@ static bool fbc_is_enabled(int lvl)
 	char buf[128];
 	bool print = true;
 
-	debugfs_read("i915_fbc_status", buf);
+	debugfs_read_crtc("i915_fbc_status", buf);
 	if (lvl != IGT_LOG_DEBUG)
 		last_fbc_buf[0] = '\0';
 	else if (strcmp(last_fbc_buf, buf))
@@ -825,8 +840,8 @@ static struct timespec fbc_get_last_action(void)
 	char *action;
 	ssize_t n_read;
 
-	debugfs_read("i915_fbc_status", buf);
 
+	debugfs_read_crtc("i915_fbc_status", buf);
 	action = strstr(buf, "\nLast action:");
 	igt_assert(action);
 
@@ -874,8 +889,8 @@ static void fbc_setup_last_action(void)
 	char buf[128];
 	char *action;
 
-	debugfs_read("i915_fbc_status", buf);
 
+	debugfs_read_crtc("i915_fbc_status", buf);
 	action = strstr(buf, "\nLast action:");
 	if (!action) {
 		igt_info("FBC last action not supported\n");
@@ -893,7 +908,7 @@ static bool fbc_is_compressing(void)
 {
 	char buf[128];
 
-	debugfs_read("i915_fbc_status", buf);
+	debugfs_read_crtc("i915_fbc_status", buf);
 	return strstr(buf, "\nCompressing: yes\n") != NULL;
 }
 
@@ -906,7 +921,7 @@ static bool fbc_not_enough_stolen(void)
 {
 	char buf[128];
 
-	debugfs_read("i915_fbc_status", buf);
+	debugfs_read_crtc("i915_fbc_status", buf);
 	return strstr(buf, "FBC disabled: not enough stolen memory\n");
 }
 
@@ -914,7 +929,7 @@ static bool fbc_stride_not_supported(void)
 {
 	char buf[128];
 
-	debugfs_read("i915_fbc_status", buf);
+	debugfs_read_crtc("i915_fbc_status", buf);
 	return strstr(buf, "FBC disabled: framebuffer stride not supported\n");
 }
 
@@ -922,7 +937,7 @@ static bool fbc_mode_too_large(void)
 {
 	char buf[128];
 
-	debugfs_read("i915_fbc_status", buf);
+	debugfs_read_crtc("i915_fbc_status", buf);
 	return strstr(buf, "FBC disabled: mode too large for compression\n");
 }
 
@@ -1388,7 +1403,7 @@ static bool fbc_supported_on_chipset(void)
 {
 	char buf[128];
 
-	debugfs_read("i915_fbc_status", buf);
+	debugfs_read_crtc("i915_fbc_status", buf);
 	if (*buf == '\0')
 		return false;
 
@@ -1404,17 +1419,6 @@ static void setup_fbc(void)
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
