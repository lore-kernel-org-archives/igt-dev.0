Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EECF0D3B7DD
	for <igt-dev@archiver.kernel.org>; Mon,  8 Dec 2025 08:40:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AE3410E11A;
	Mon,  8 Dec 2025 08:40:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="idJIAFDa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A48910E11A
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Dec 2025 08:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765183202; x=1796719202;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=K/+lgh2KW2AxPpt4P7OiGSQUpcnL6hbqz7oS27Ccd1g=;
 b=idJIAFDaj7tdO/fpB2ZQ4mtpKbkdQiwLajCq0isz7ExN8Pnm8ENOBi7d
 q4CBfQbAubZo9ou/jY/bLF9O2K4BCHthCq+u25qkOMAL7pT86R1puxGt8
 OkdUFXIVK7DH+87vXt8Xc+5BDvHfnNcO06yx/L+1bdOaFINafk3YHpami
 mhzrorvKIQj/8vwqewYJCN2P5vFqXD2w7vm00iSR6T0QvDSRRnljqSuc4
 Qm5ZT+kx/JzLLU/bkjgR8fEBqkj/eGlaWaVWMS5U+eiGsTvDhCbbl31Ab
 FeC0NrB4FMBaddpB0jhH7asCSqry9yqjXGFZySi+QCChKopuoSeuL9E6+ Q==;
X-CSE-ConnectionGUID: Tbkp+DOaQ++boa+R/xHoaw==
X-CSE-MsgGUID: 4/0uMR9ETWqmfw8gbGbrog==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="84725869"
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; d="scan'208";a="84725869"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 00:40:02 -0800
X-CSE-ConnectionGUID: LoB6cxHBTkOcF+dq3HZbFg==
X-CSE-MsgGUID: +30epR5OTQmWwYCTKgiNSA==
X-ExtLoop1: 1
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 00:40:00 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, mohammed.thasleem@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] lib/igt_pm: Move DC State Counter Functions to common
 library
Date: Mon,  8 Dec 2025 14:09:51 +0530
Message-ID: <20251208083951.2279254-1-jeevan.b@intel.com>
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

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 lib/igt_pm.c            | 169 ++++++++++++++++++++++++++++++++++++++++
 lib/igt_pm.h            |  15 ++++
 tests/intel/kms_pm_dc.c | 121 ----------------------------
 3 files changed, 184 insertions(+), 121 deletions(-)

diff --git a/lib/igt_pm.c b/lib/igt_pm.c
index 1ffcdcef3..7873c68a4 100644
--- a/lib/igt_pm.c
+++ b/lib/igt_pm.c
@@ -1543,3 +1543,172 @@ void igt_pm_dpms_toggle(igt_output_t *output)
 				   DRM_MODE_DPMS_ON);
 	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_ACTIVE));
 }
+
+/**
+ * get_dc_counter:
+ * @dc_data: String containing DC counter data in format
+ *
+ * Returns the counter value as uint32_t
+ */
+uint32_t get_dc_counter(char *dc_data)
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
+ * support_dc6:
+ * @debugfs_fd: DRM file descriptor
+ *
+ * Returns true if DC6 is supported.
+ */
+bool support_dc6(int debugfs_fd)
+{
+	char buf[4096];
+
+	igt_debugfs_simple_read(debugfs_fd, "i915_dmc_info",
+				buf, sizeof(buf));
+	return strstr(buf, "DC5 -> DC6 count");
+}
+
+/**
+ * get_dc6_counter:Locate DC6 counter string in debugfs buffer
+ * @buf: Buffer containing i915_dmc_info debugfs output
+ *
+ * Searches for DC6 counter information in the DMC info buffer.
+ */
+char *get_dc6_counter(const char *buf)
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
+ * read_dc_counter:
+ * @debugfs_fd: DRM file descriptor
+ * @dc_flag: DC state flag (CHECK_DC5, CHECK_DC6, or CHECK_DC3CO)
+ *
+ * Returns current counter value for the specified DC state
+ */
+uint32_t read_dc_counter(uint32_t debugfs_fd, int dc_flag)
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
+		str = get_dc6_counter(buf);
+		igt_assert_f(str, "No DC6 counter available\n");
+	} else if (dc_flag & CHECK_DC3CO) {
+		str = strstr(buf, "DC3CO count");
+		igt_assert_f(str, "DC3CO counter is not available\n");
+	} else {
+		igt_assert(!"reached");
+		str = NULL;
+	}
+
+	return get_dc_counter(str);
+}
+
+/**
+ * dc_state_wait_entry:
+ * @debugfs_fd: DRM file descriptor
+ * @dc_flag: DC state flag
+ * @prev_dc_count: Previous counter value to compare against
+ *
+ * Returns true if DC state entry detected within timeout, false otherwise
+ */
+bool dc_state_wait_entry(int debugfs_fd, int dc_flag, int prev_dc_count)
+{
+	return igt_wait(read_dc_counter(debugfs_fd, dc_flag) >
+			prev_dc_count, 3000, 100);
+}
+
+/**
+ * dc_state_name:
+ * @dc_flag: DC state flag
+ *
+ * Converts DC state flag constants to readable string names
+ */
+const char *dc_state_name(int dc_flag)
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
+ * require_dc_counter:
+ * @debugfs_fd: File descriptor for the debugfs
+ * @dc_flag: DC counter type to check (CHECK_DC3CO, CHECK_DC5,
+ * or CHECK_DC6)
+ *
+ * Skips the current test if the requested DC counter is not available
+ * on the system.
+ */
+void require_dc_counter(int debugfs_fd, int dc_flag)
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
+		str = get_dc6_counter(buf);
+		igt_skip_on_f(!str, "No DC6 counter available\n");
+		break;
+	default:
+		igt_assert_f(0, "Unknown DC counter %d\n", dc_flag);
+	}
+}
+
+/**
+ * read_pkgc_counter:
+ * @debugfs_root_fd: File descriptor for the debugfs
+ *
+ * Returns PC10 counter value.
+ */
+unsigned int read_pkgc_counter(int debugfs_root_fd)
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
+	return get_dc_counter(str);
+}
diff --git a/lib/igt_pm.h b/lib/igt_pm.h
index e931e51af..2db71e826 100644
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
+uint32_t get_dc_counter(char *dc_data);
+bool support_dc6(int debugfs_fd);
+char *get_dc6_counter(const char *buf);
+uint32_t read_dc_counter(uint32_t debugfs_fd, int dc_flag);
+bool dc_state_wait_entry(int debugfs_fd, int dc_flag, int prev_dc_count);
+const char *dc_state_name(int dc_flag);
+void require_dc_counter(int debugfs_fd, int dc_flag);
+unsigned int read_pkgc_counter(int debugfs_root_fd);
 
 #endif /* IGT_PM_H */
diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 8cdf312f6..226bb753d 100644
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
@@ -260,70 +253,6 @@ static void create_color_fb(data_t *data, igt_fb_t *fb, color_t *fb_color)
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
 	igt_assert_f(dc_state_wait_entry(data->debugfs_fd, dc_flag, prev_dc_count),
@@ -385,32 +314,6 @@ static void check_dc3co_with_videoplayback_like_load(data_t *data)
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
@@ -531,15 +434,6 @@ static void test_dc_state_dpms_negative(data_t *data, int dc_flag)
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
@@ -621,21 +515,6 @@ static int has_panels_without_dc_support(igt_display_t *display)
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
-- 
2.43.0

