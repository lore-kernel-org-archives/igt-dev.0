Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D759E10E26B
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Sep 2022 06:06:07 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 28 Sep 2022 09:06:01 +0300
Message-Id: <20220928060601.12941-2-ville.syrjala@linux.intel.com>
In-Reply-To: <20220928060601.12941-1-ville.syrjala@linux.intel.com>
References: <20220928060601.12941-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/kms_frontbuffer_tracking: Convert
 DRRS over to per-crtc/connector debugfs files
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

The DRRS debugfs is now provided per-crtc/connector. Make
use of it.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/i915/kms_frontbuffer_tracking.c | 75 ++++++++++++++++-----------
 1 file changed, 46 insertions(+), 29 deletions(-)

diff --git a/tests/i915/kms_frontbuffer_tracking.c b/tests/i915/kms_frontbuffer_tracking.c
index bdf718cf073a..f2fd0352dcae 100644
--- a/tests/i915/kms_frontbuffer_tracking.c
+++ b/tests/i915/kms_frontbuffer_tracking.c
@@ -725,33 +725,47 @@ static void set_mode_for_params(struct modeset_params *params)
 	igt_display_commit(&drm.display);
 }
 
-static void __debugfs_read(const char *param, char *buf, int len)
+static void __debugfs_read_crtc(const char *param, char *buf, int len)
 {
-	len = igt_debugfs_simple_read(drm.debugfs, param, buf, len);
-	if (len < 0)
-		igt_assert(len == -ENOENT || len == -ENODEV);
-}
+	int dir;
+	enum pipe pipe;
 
-static int __debugfs_write(const char *param, char *buf, int len)
-{
-	return igt_sysfs_write(drm.debugfs, param, buf, len - 1);
+	pipe = prim_mode_params.pipe;
+	dir = igt_debugfs_pipe_dir(drm.fd, pipe, O_DIRECTORY);
+	igt_require_fd(dir);
+	igt_debugfs_simple_read(dir, param, buf, len);
+	close(dir);
 }
 
-static void __debugfs_read_crtc(const char *param, char *buf, int len)
+static int __debugfs_write_crtc(const char *param, const char *buf, int len)
 {
-	int dir;
+	int dir, ret;
 	enum pipe pipe;
 
 	pipe = prim_mode_params.pipe;
 	dir = igt_debugfs_pipe_dir(drm.fd, pipe, O_DIRECTORY);
 	igt_require_fd(dir);
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
 	igt_debugfs_simple_read(dir, param, buf, len);
 	close(dir);
 }
 
-#define debugfs_read(p, arr) __debugfs_read(p, arr, sizeof(arr))
-#define debugfs_write(p, arr) __debugfs_write(p, arr, sizeof(arr))
 #define debugfs_read_crtc(p, arr) __debugfs_read_crtc(p, arr, sizeof(arr))
+#define debugfs_write_crtc(p, arr) __debugfs_write_crtc(p, arr, sizeof(arr))
+#define debugfs_read_connector(p, arr) __debugfs_read_connector(p, arr, sizeof(arr))
 
 static char last_fbc_buf[128];
 
@@ -781,7 +795,7 @@ static void drrs_set(unsigned int val)
 
 	igt_debug("Manually %sabling DRRS. %u\n", val ? "en" : "dis", val);
 	snprintf(buf, sizeof(buf), "%d", val);
-	ret = debugfs_write("i915_drrs_ctl", buf);
+	ret = debugfs_write_crtc("i915_drrs_ctl", buf);
 
 	/*
 	 * drrs_enable() is called on DRRS capable platform only,
@@ -796,46 +810,50 @@ static bool is_drrs_high(void)
 {
 	char buf[MAX_DRRS_STATUS_BUF_LEN];
 
-	debugfs_read("i915_drrs_status", buf);
-	return strstr(buf, "DRRS_HIGH_RR");
+	debugfs_read_crtc("i915_drrs_status", buf);
+	return strstr(buf, "DRRS refresh rate: high");
 }
 
 static bool is_drrs_low(void)
 {
 	char buf[MAX_DRRS_STATUS_BUF_LEN];
 
-	debugfs_read("i915_drrs_status", buf);
-	return strstr(buf, "DRRS_LOW_RR");
+	debugfs_read_crtc("i915_drrs_status", buf);
+	return strstr(buf, "DRRS refresh rate: low");
 }
 
 static bool is_drrs_supported(void)
 {
 	char buf[MAX_DRRS_STATUS_BUF_LEN];
 
-	debugfs_read("i915_drrs_status", buf);
-	return strcasestr(buf, "DRRS Supported: Yes");
+	debugfs_read_crtc("i915_drrs_status", buf);
+	return strcasestr(buf, "DRRS enabled:");
 }
 
 static bool is_drrs_inactive(void)
 {
 	char buf[MAX_DRRS_STATUS_BUF_LEN];
 
-	debugfs_read("i915_drrs_status", buf);
-
-	if (strstr(buf, "DRRS_State: "))
-		return false;
-
-	return true;
+	debugfs_read_crtc("i915_drrs_status", buf);
+	return strstr(buf, "DRRS active: no");
 }
 
 static void drrs_print_status(void)
 {
 	char buf[MAX_DRRS_STATUS_BUF_LEN];
 
-	debugfs_read("i915_drrs_status", buf);
+	debugfs_read_crtc("i915_drrs_status", buf);
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
@@ -1450,9 +1468,8 @@ static void teardown_psr(void)
 
 static void setup_drrs(void)
 {
-	if (prim_mode_params.output->config.connector->connector_type !=
-	    DRM_MODE_CONNECTOR_eDP) {
-		igt_info("Can't test DRRS: no usable eDP screen.\n");
+	if (!output_has_drrs()) {
+		igt_info("Can't test DRRS: no usable screen.\n");
 		return;
 	}
 
-- 
2.35.1
