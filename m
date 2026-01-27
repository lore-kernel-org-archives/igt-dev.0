Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A65D2D2594E
	for <igt-dev@archiver.kernel.org>; Tue, 27 Jan 2026 06:34:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E8BC10E149;
	Tue, 27 Jan 2026 06:34:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JH9EyMAV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0ED310E149
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jan 2026 06:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769495678; x=1801031678;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rqWlid2eJn81tUFRIhqrYxcNJScyKxMxjTPS/zZrA58=;
 b=JH9EyMAVZI5aC3xa23u9zd3CuI0wFIiYuJYMPkq4kuK3jciXb/2f+fV7
 FQH8aLwuKBsK3xl0WeSGgjxcfXWQM5GJG1w+BA8ujcm0oafq2luXnYZ2F
 aVbJeeqkSxagRp6TyVCMRr0xRKCds5Wq9vDaJ05JtlMciHjPEk8R/A3W2
 bObeQbZ2kXF/ENbdGcGACiomvc6llPYTjXydIjKZqKPbjAatfJu76iovh
 WLuWV8Q9DtBp/8oLNKMHWYL1QKNq6TJFbwd/zi9WoVCeLqsTS7vdz0RoB
 d3r3F1+Vxp574XDCDl2UWQIYTMsHy6x9pQ1kRnRo+YZyX4e62pKv4HhIn Q==;
X-CSE-ConnectionGUID: cErpHXZOSVSYjpZEcHJcpg==
X-CSE-MsgGUID: dUe6eGUxReSQFgTQpbw0nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="70721597"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="70721597"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 22:34:38 -0800
X-CSE-ConnectionGUID: oNzs2a7oSiimqbZL59Rfgg==
X-CSE-MsgGUID: fW5jIt16S2WMjN2tz/1nPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="212868614"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 22:34:37 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mohammed.thasleem@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] lib/igt_pm: Move DC State Counter Functions to common
 library
Date: Tue, 27 Jan 2026 12:04:32 +0530
Message-ID: <20260127063432.183096-1-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Move DC counter utility functions from tests/intel/kms_pm_dc.c
to lib/igt_pm.c for reuse across other tests.

v2: Add 'igt_' prefix before all functions. (Thasleem)

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 lib/igt_pm.c            | 169 ++++++++++++++++++++++++++++++++++++++++
 lib/igt_pm.h            |  15 ++++
 tests/intel/kms_pm_dc.c | 167 ++++++---------------------------------
 3 files changed, 207 insertions(+), 144 deletions(-)

diff --git a/lib/igt_pm.c b/lib/igt_pm.c
index 1ffcdcef3..cc82e2134 100644
--- a/lib/igt_pm.c
+++ b/lib/igt_pm.c
@@ -1543,3 +1543,172 @@ void igt_pm_dpms_toggle(igt_output_t *output)
 				   DRM_MODE_DPMS_ON);
 	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_ACTIVE));
 }
+
+/**
+ * igt_get_dc_counter:
+ * @dc_data: String containing DC counter data in format
+ *
+ * Returns the counter value as uint32_t
+ */
+uint32_t igt_get_dc_counter(char *dc_data)
+{
+	char *e;
+	long ret;
+	char *s = strchr(dc_data, ':');
+
+	igt_assert(s);
+	s++;
+	ret = strtol(s, &e, 10);
+	igt_assert(((ret != LONG_MIN && ret != LONG_MAX) || errno != ERANGE) &&
+		   e > s && *e == '\n' && ret >= 0);
+	return ret;
+}
+
+/**
+ * igt_support_dc6:
+ * @debugfs_fd: DRM file descriptor
+ *
+ * Returns true if DC6 is supported.
+ */
+bool igt_support_dc6(int debugfs_fd)
+{
+	char buf[4096];
+
+	igt_debugfs_simple_read(debugfs_fd, "i915_dmc_info",
+				buf, sizeof(buf));
+	return strstr(buf, "DC5 -> DC6 count");
+}
+
+/**
+ * igt_get_dc6_counter:Locate DC6 counter string in debugfs buffer
+ * @buf: Buffer containing i915_dmc_info debugfs output
+ *
+ * Searches for DC6 counter information in the DMC info buffer.
+ */
+char *igt_get_dc6_counter(const char *buf)
+{
+	char *str;
+
+	str = strstr(buf, "DC5 -> DC6 count");
+	if (!str)
+		str = strstr(buf, "DC5 -> DC6 allowed count");
+
+	return str;
+}
+
+/**
+ * igt_read_dc_counter:
+ * @debugfs_fd: DRM file descriptor
+ * @dc_flag: DC state flag (CHECK_DC5, CHECK_DC6, or CHECK_DC3CO)
+ *
+ * Returns current counter value for the specified DC state
+ */
+uint32_t igt_read_dc_counter(uint32_t debugfs_fd, int dc_flag)
+{
+	char buf[4096];
+	char *str;
+
+	igt_debugfs_simple_read(debugfs_fd, "i915_dmc_info", buf, sizeof(buf));
+
+	if (dc_flag & CHECK_DC5) {
+		str = strstr(buf, "DC3 -> DC5 count");
+		igt_assert_f(str, "DC5 counter is not available\n");
+	} else if (dc_flag & CHECK_DC6) {
+		str = igt_get_dc6_counter(buf);
+		igt_assert_f(str, "No DC6 counter available\n");
+	} else if (dc_flag & CHECK_DC3CO) {
+		str = strstr(buf, "DC3CO count");
+		igt_assert_f(str, "DC3CO counter is not available\n");
+	} else {
+		igt_assert(!"reached");
+		str = NULL;
+	}
+
+	return igt_get_dc_counter(str);
+}
+
+/**
+ * igt_dc_state_wait_entrytry:
+ * @debugfs_fd: DRM file descriptor
+ * @dc_flag: DC state flag
+ * @prev_dc_count: Previous counter value to compare against
+ *
+ * Returns true if DC state entry detected within timeout, false otherwise
+ */
+bool igt_dc_state_wait_entrytry(int debugfs_fd, int dc_flag, int prev_dc_count)
+{
+	return igt_wait(igt_read_dc_counter(debugfs_fd, dc_flag) >
+			prev_dc_count, 3000, 100);
+}
+
+/**
+ * igt_dc_state_namee:
+ * @dc_flag: DC state flag
+ *
+ * Converts DC state flag constants to readable string names
+ */
+const char *igt_dc_state_namee(int dc_flag)
+{
+	if (dc_flag & CHECK_DC3CO)
+		return "DC3CO";
+	else if (dc_flag & CHECK_DC5)
+		return "DC5";
+	else
+		return "DC6";
+}
+
+/**
+ * igt_require_dc_counter:
+ * @debugfs_fd: File descriptor for the debugfs
+ * @dc_flag: DC counter type to check (CHECK_DC3CO, CHECK_DC5,
+ * or CHECK_DC6)
+ *
+ * Skips the current test if the requested DC counter is not available
+ * on the system.
+ */
+void igt_require_dc_counter(int debugfs_fd, int dc_flag)
+{
+	char *str;
+	char buf[4096];
+
+	igt_debugfs_simple_read(debugfs_fd, "i915_dmc_info",
+				buf, sizeof(buf));
+
+	switch (dc_flag) {
+	case CHECK_DC3CO:
+		igt_skip_on_f(!strstr(buf, "DC3CO count"),
+			      "DC3CO counter is not available\n");
+		break;
+	case CHECK_DC5:
+		igt_skip_on_f(!strstr(buf, "DC3 -> DC5 count"),
+			      "DC5 counter is not available\n");
+		break;
+	case CHECK_DC6:
+		str = igt_get_dc6_counter(buf);
+		igt_skip_on_f(!str, "No DC6 counter available\n");
+		break;
+	default:
+		igt_assert_f(0, "Unknown DC counter %d\n", dc_flag);
+	}
+}
+
+/**
+ * igt_read_pkgc_counter:
+ * @debugfs_root_fd: File descriptor for the debugfs
+ *
+ * Returns PC10 counter value.
+ */
+unsigned int igt_read_pkgc_counter(int debugfs_root_fd)
+{
+	char buf[4096];
+	char *str;
+	int len;
+
+	len = igt_sysfs_read(debugfs_root_fd, PACKAGE_CSTATE_PATH, buf, sizeof(buf) - 1);
+	igt_skip_on_f(len < 0, "PKGC state file not found\n");
+	buf[len] = '\0';
+	str = strstr(buf, "Package C10");
+	igt_skip_on_f(!str, "PKGC10 is not supported.\n");
+
+	return igt_get_dc_counter(str);
+}
diff --git a/lib/igt_pm.h b/lib/igt_pm.h
index e931e51af..1930b3255 100644
--- a/lib/igt_pm.h
+++ b/lib/igt_pm.h
@@ -29,6 +29,13 @@
 
 #include "igt_kms.h"
 
+#define PACKAGE_CSTATE_PATH  "pmc_core/package_cstate_show"
+
+/* DC State Flags */
+#define CHECK_DC5       (1 << 0)
+#define CHECK_DC6       (1 << 1)
+#define CHECK_DC3CO     (1 << 2)
+
 void igt_pm_enable_audio_runtime_pm(void);
 void igt_pm_enable_sata_link_power_management(void);
 void igt_pm_restore_sata_link_power_management(void);
@@ -99,5 +106,13 @@ int igt_pm_get_runtime_usage(struct pci_device *pci_dev);
 void igt_pm_ignore_slpc_efficient_freq(int i915, int gtfd, bool val);
 bool igt_has_pci_pm_capability(struct pci_device *pci_dev);
 void igt_pm_dpms_toggle(igt_output_t *output);
+uint32_t igt_get_dc_counter(char *dc_data);
+bool igt_support_dc6(int debugfs_fd);
+char *igt_get_dc6_counter(const char *buf);
+uint32_t igt_read_dc_counter(uint32_t debugfs_fd, int dc_flag);
+bool igt_dc_state_wait_entrytry(int debugfs_fd, int dc_flag, int prev_dc_count);
+const char *igt_dc_state_namee(int dc_flag);
+void igt_require_dc_counter(int debugfs_fd, int dc_flag);
+unsigned int igt_read_pkgc_counter(int debugfs_root_fd);
 
 #endif /* IGT_PM_H */
diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 4babf1341..81e11c41d 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -79,15 +79,9 @@
  * Description: This test validates display engine entry to DC5 state while PSR is active on Pipe B
  */
 
-/* DC State Flags */
-#define CHECK_DC5	(1 << 0)
-#define CHECK_DC6	(1 << 1)
-#define CHECK_DC3CO	(1 << 2)
-
 #define PWR_DOMAIN_INFO "i915_power_domain_info"
 #define RPM_STATUS "i915_runtime_pm_status"
 #define KMS_HELPER "/sys/module/drm_kms_helper/parameters/"
-#define PACKAGE_CSTATE_PATH  "pmc_core/package_cstate_show"
 #define KMS_POLL_DISABLE 0
 #define DC9_RESETS_DC_COUNTERS(devid) (!(IS_DG1(devid) || IS_DG2(devid) || intel_display_ver(devid) >= 14))
 #define SEC 1
@@ -116,7 +110,6 @@ typedef struct {
 	bool runtime_suspend_disabled;
 } data_t;
 
-static bool dc_state_wait_entry(int drm_fd, int dc_flag, int prev_dc_count);
 static void check_dc_counter(data_t *data, int dc_flag, uint32_t prev_dc_count);
 
 static void set_output_on_pipe_b(data_t *data)
@@ -262,81 +255,17 @@ static void create_color_fb(data_t *data, igt_fb_t *fb, color_t *fb_color)
 	paint_rectangles(data, data->mode, fb_color, fb);
 }
 
-static uint32_t get_dc_counter(char *dc_data)
-{
-	char *e;
-	long ret;
-	char *s = strchr(dc_data, ':');
-
-	igt_assert(s);
-	s++;
-	ret = strtol(s, &e, 10);
-	igt_assert(((ret != LONG_MIN && ret != LONG_MAX) || errno != ERANGE) && e > s && *e == '\n' && ret >= 0);
-	return ret;
-}
-
-static char *get_dc6_counter(const char *buf)
-{
-	char *str;
-
-	str = strstr(buf, "DC5 -> DC6 count");
-	if (!str)
-		str = strstr(buf, "DC5 -> DC6 allowed count");
-
-	return str;
-}
-
-static uint32_t read_dc_counter(uint32_t debugfs_fd, int dc_flag)
-{
-	char buf[4096];
-	char *str;
-
-	igt_debugfs_simple_read(debugfs_fd, "i915_dmc_info", buf, sizeof(buf));
-
-	if (dc_flag & CHECK_DC5) {
-		str = strstr(buf, "DC3 -> DC5 count");
-		igt_assert_f(str, "DC5 counter is not available\n");
-	} else if (dc_flag & CHECK_DC6) {
-		str = get_dc6_counter(buf);
-		igt_assert_f(str, "No DC6 counter available\n");
-	} else if (dc_flag & CHECK_DC3CO) {
-		str = strstr(buf, "DC3CO count");
-		igt_assert_f(str, "DC3CO counter is not available\n");
-	} else {
-		igt_assert(!"reached");
-		str = NULL;
-	}
-
-	return get_dc_counter(str);
-}
-
-static bool dc_state_wait_entry(int debugfs_fd, int dc_flag, int prev_dc_count)
-{
-	return igt_wait(read_dc_counter(debugfs_fd, dc_flag) >
-			prev_dc_count, 3000, 100);
-}
-
-static const char *dc_state_name(int dc_flag)
-{
-	if (dc_flag & CHECK_DC3CO)
-		return "DC3CO";
-	else if (dc_flag & CHECK_DC5)
-		return "DC5";
-	else
-		return "DC6";
-}
-
 static void check_dc_counter(data_t *data, int dc_flag, uint32_t prev_dc_count)
 {
-	igt_assert_f(dc_state_wait_entry(data->debugfs_fd, dc_flag, prev_dc_count),
-		     "%s state is not achieved\n%s:\n%s\n", dc_state_name(dc_flag), PWR_DOMAIN_INFO,
+	igt_assert_f(igt_dc_state_wait_entrytry(data->debugfs_fd, dc_flag, prev_dc_count),
+		     "%s state is not achieved\n%s:\n%s\n", igt_dc_state_namee(dc_flag), PWR_DOMAIN_INFO,
 		     data->debugfs_dump = igt_sysfs_get(data->debugfs_fd, PWR_DOMAIN_INFO));
 }
 
 static void check_dc_counter_negative(data_t *data, int dc_flag, uint32_t prev_dc_count)
 {
-	igt_assert_f(!dc_state_wait_entry(data->debugfs_fd, dc_flag, prev_dc_count),
-		     "%s state is achieved\n%s:\n%s\n", dc_state_name(dc_flag), PWR_DOMAIN_INFO,
+	igt_assert_f(!igt_dc_state_wait_entrytry(data->debugfs_fd, dc_flag, prev_dc_count),
+		     "%s state is achieved\n%s:\n%s\n", igt_dc_state_namee(dc_flag), PWR_DOMAIN_INFO,
 		     data->debugfs_dump = igt_sysfs_get(data->debugfs_fd, PWR_DOMAIN_INFO));
 }
 
@@ -368,7 +297,7 @@ static void check_dc3co_with_videoplayback_like_load(data_t *data)
 	primary = igt_output_get_plane_type(data->output,
 					    DRM_PLANE_TYPE_PRIMARY);
 	igt_plane_set_fb(primary, NULL);
-	dc3co_prev_cnt = read_dc_counter(data->debugfs_fd, CHECK_DC3CO);
+	dc3co_prev_cnt = igt_read_dc_counter(data->debugfs_fd, CHECK_DC3CO);
 
 	/* Calculate delay to generate idle frame in usec*/
 	delay = 1.5 * ((1000 * 1000) / data->mode->vrefresh);
@@ -383,36 +312,10 @@ static void check_dc3co_with_videoplayback_like_load(data_t *data)
 		usleep(delay);
 	}
 
-	igt_require_f(dc_state_wait_entry(data->debugfs_fd,
+	igt_require_f(igt_dc_state_wait_entrytry(data->debugfs_fd,
 		      CHECK_DC3CO, dc3co_prev_cnt), "dc3co-vpb-simulation not enabled\n");
 }
 
-static void require_dc_counter(int debugfs_fd, int dc_flag)
-{
-	char *str;
-	char buf[4096];
-
-	igt_debugfs_simple_read(debugfs_fd, "i915_dmc_info",
-				buf, sizeof(buf));
-
-	switch (dc_flag) {
-	case CHECK_DC3CO:
-		igt_skip_on_f(!strstr(buf, "DC3CO count"),
-			      "DC3CO counter is not available\n");
-		break;
-	case CHECK_DC5:
-		igt_skip_on_f(!strstr(buf, "DC3 -> DC5 count"),
-			      "DC5 counter is not available\n");
-		break;
-	case CHECK_DC6:
-		str = get_dc6_counter(buf);
-		igt_skip_on_f(!str, "No DC6 counter available\n");
-		break;
-	default:
-		igt_assert_f(0, "Unknown DC counter %d\n", dc_flag);
-	}
-}
-
 static void setup_dc3co(data_t *data)
 {
 	data->op_psr_mode = PSR_MODE_2;
@@ -423,7 +326,7 @@ static void setup_dc3co(data_t *data)
 
 static void test_dc3co_vpb_simulation(data_t *data)
 {
-	require_dc_counter(data->debugfs_fd, CHECK_DC3CO);
+	igt_require_dc_counter(data->debugfs_fd, CHECK_DC3CO);
 	setup_output(data);
 	setup_dc3co(data);
 	setup_videoplayback(data);
@@ -435,8 +338,8 @@ static void test_dc5_retention_flops(data_t *data, int dc_flag)
 {
 	uint32_t dc_counter_before_psr;
 
-	require_dc_counter(data->debugfs_fd, dc_flag);
-	dc_counter_before_psr = read_dc_counter(data->debugfs_fd, dc_flag);
+	igt_require_dc_counter(data->debugfs_fd, dc_flag);
+	dc_counter_before_psr = igt_read_dc_counter(data->debugfs_fd, dc_flag);
 	set_output_on_pipe_b(data);
 	setup_primary(data);
 	igt_assert(psr_wait_entry(data->debugfs_fd, data->op_psr_mode, NULL));
@@ -448,8 +351,8 @@ static void test_dc_state_psr(data_t *data, int dc_flag)
 {
 	uint32_t dc_counter_before_psr;
 
-	require_dc_counter(data->debugfs_fd, dc_flag);
-	dc_counter_before_psr = read_dc_counter(data->debugfs_fd, dc_flag);
+	igt_require_dc_counter(data->debugfs_fd, dc_flag);
+	dc_counter_before_psr = igt_read_dc_counter(data->debugfs_fd, dc_flag);
 	setup_output(data);
 	setup_primary(data);
 	igt_require(!psr_disabled_check(data->debugfs_fd));
@@ -512,9 +415,9 @@ static void test_dc_state_dpms(data_t *data, int dc_flag)
 {
 	uint32_t dc_counter;
 
-	require_dc_counter(data->debugfs_fd, dc_flag);
+	igt_require_dc_counter(data->debugfs_fd, dc_flag);
 	setup_dc_dpms(data);
-	dc_counter = read_dc_counter(data->debugfs_fd, dc_flag);
+	dc_counter = igt_read_dc_counter(data->debugfs_fd, dc_flag);
 	dpms_off(data);
 	check_dc_counter(data, dc_flag, dc_counter);
 	dpms_on(data);
@@ -525,23 +428,14 @@ static void test_dc_state_dpms_negative(data_t *data, int dc_flag)
 {
 	uint32_t dc_counter;
 
-	require_dc_counter(data->debugfs_fd, dc_flag);
+	igt_require_dc_counter(data->debugfs_fd, dc_flag);
 	setup_dc_dpms(data);
-	dc_counter = read_dc_counter(data->debugfs_fd, dc_flag);
+	dc_counter = igt_read_dc_counter(data->debugfs_fd, dc_flag);
 	dpms_on(data);
 	check_dc_counter_negative(data, dc_flag, dc_counter);
 	cleanup_dc_dpms(data);
 }
 
-static bool support_dc6(int debugfs_fd)
-{
-	char buf[4096];
-
-	igt_debugfs_simple_read(debugfs_fd, "i915_dmc_info",
-				buf, sizeof(buf));
-	return strstr(buf, "DC5 -> DC6 count");
-}
-
 static uint64_t read_runtime_suspended_time(int drm_fd)
 {
 	struct pci_device *i915;
@@ -564,7 +458,7 @@ static bool dc9_wait_entry(data_t *data, int dc_target, int prev_dc, uint64_t pr
 	 */
 	return igt_wait((read_runtime_suspended_time(data->drm_fd) > prev_rpm) &&
 			(!DC9_RESETS_DC_COUNTERS(data->devid) ||
-			(read_dc_counter(data->debugfs_fd, dc_target) < prev_dc)), msecs, 1000);
+			(igt_read_dc_counter(data->debugfs_fd, dc_target) < prev_dc)), msecs, 1000);
 }
 
 static void check_dc9(data_t *data, int dc_target, int prev_dc, int prev_rpm)
@@ -584,12 +478,12 @@ static void setup_dc9_dpms(data_t *data, int dc_target)
 	__igt_sysfs_set_boolean(sysfs_fd, "poll", KMS_POLL_DISABLE);
 	close(sysfs_fd);
 	if (DC9_RESETS_DC_COUNTERS(data->devid)) {
-		prev_dc = read_dc_counter(data->debugfs_fd, dc_target);
+		prev_dc = igt_read_dc_counter(data->debugfs_fd, dc_target);
 		setup_dc_dpms(data);
 		dpms_off(data);
-		igt_skip_on_f(!(igt_wait(read_dc_counter(data->debugfs_fd, dc_target) >
+		igt_skip_on_f(!(igt_wait(igt_read_dc_counter(data->debugfs_fd, dc_target) >
 				prev_dc, 3000, 100)), "Unable to enters shallow DC states\n");
-		prev_dc = read_dc_counter(data->debugfs_fd, dc_target);
+		prev_dc = igt_read_dc_counter(data->debugfs_fd, dc_target);
 		dpms_on(data);
 		cleanup_dc_dpms(data);
 	}
@@ -603,8 +497,8 @@ static void test_dc9_dpms(data_t *data)
 {
 	int dc_target;
 
-	require_dc_counter(data->debugfs_fd, CHECK_DC5);
-	dc_target = support_dc6(data->debugfs_fd) ? CHECK_DC6 : CHECK_DC5;
+	igt_require_dc_counter(data->debugfs_fd, CHECK_DC5);
+	dc_target = igt_support_dc6(data->debugfs_fd) ? CHECK_DC6 : CHECK_DC5;
 	setup_dc9_dpms(data, dc_target);
 }
 
@@ -623,21 +517,6 @@ static int has_panels_without_dc_support(igt_display_t *display)
 	return external_panel;
 }
 
-static unsigned int read_pkgc_counter(int debugfs_root_fd)
-{
-	char buf[4096];
-	char *str;
-	int len;
-
-	len = igt_sysfs_read(debugfs_root_fd, PACKAGE_CSTATE_PATH, buf, sizeof(buf) - 1);
-	igt_skip_on_f(len < 0, "PKGC state file not found\n");
-	buf[len] = '\0';
-	str = strstr(buf, "Package C10");
-	igt_skip_on_f(!str, "PKGC10 is not supported.\n");
-
-	return get_dc_counter(str);
-}
-
 static void test_deep_pkgc_state(data_t *data)
 {
 	unsigned int pre_val = 0, cur_val = 0;
@@ -701,7 +580,7 @@ static void test_deep_pkgc_state(data_t *data)
 	igt_display_commit(&data->display);
 	/* Wait for the vblank to sync the frame time */
 	igt_wait_for_vblank_count(igt_crtc_for_pipe(&data->display, pipe), 1);
-	pre_val = read_pkgc_counter(data->debugfs_root_fd);
+	pre_val = igt_read_pkgc_counter(data->debugfs_root_fd);
 	/* Add a half-frame delay to ensure the flip occurs when the frame is active. */
 	usleep(delay * 0.5);
 
@@ -710,7 +589,7 @@ static void test_deep_pkgc_state(data_t *data)
 		igt_plane_set_fb(primary, flip ? &data->fb_rgb : &data->fb_rgr);
 		igt_display_commit(&data->display);
 
-		igt_wait((cur_val = read_pkgc_counter(data->debugfs_root_fd)) > pre_val,
+		igt_wait((cur_val = igt_read_pkgc_counter(data->debugfs_root_fd)) > pre_val,
 						      (delay * 2), (5 * MSEC));
 		if (cur_val > pre_val) {
 			pkgc_flag = true;
-- 
2.43.0

