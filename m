Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3A98D0E6E3
	for <igt-dev@archiver.kernel.org>; Tue, 25 Nov 2025 13:46:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 771C610E3CD;
	Tue, 25 Nov 2025 13:46:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bqNceK7V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69B6F10E3CD
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Nov 2025 13:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764078396; x=1795614396;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Jd6JDJGScyxqzWKYXSrmZTGL9jSz4cWx+XjzY0nOMDM=;
 b=bqNceK7VVpF7rS8t2YfpumoOuYrQD/ESDFaNHXEbuRZKnrauiB/A9N9m
 fPE8CcjOt4h7pljhiWXtEzRsN2lgNXDhGERWxtXYYN/b4hfJrmoeKTawj
 UpThX8tmgF0DflCguTAVYVP/8mPTq9HnInuT2+7qUNVD1Bx9274+3GOZV
 VRyS8/MAyFO9QLfv3BQRTlpAi+1MbuxwlMSjOow9FZKIm6c90XW3FcY7r
 D6LJui3CI4o4OWLGO1oncrXEngeDbgIwlyOq5uTi9Ix7putMDYfsyjCFo
 KdfKcYpmxAy9ElkijSfDCFCbUOS6zYjryMN+BCogal1H6syDd7lpKm33a w==;
X-CSE-ConnectionGUID: 3hkL+TWtTxu5+FmhzmoHag==
X-CSE-MsgGUID: t/0FtkJmQjaPCiNVkAxLrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="76421211"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="76421211"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 05:46:35 -0800
X-CSE-ConnectionGUID: 5Kgi0qSMScumvmSifKfoZg==
X-CSE-MsgGUID: l0oBhZtUQuCBDPWhATw+Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="223622293"
Received: from unknown (HELO
 dg2adlp-Alder-Lake-Client-Platform.iind.intel.com) ([10.223.55.76])
 by fmviesa001.fm.intel.com with ESMTP; 25 Nov 2025 05:46:33 -0800
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com,
	Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_pm_rpm: Add test to validate G7
 residency
Date: Tue, 25 Nov 2025 19:12:33 +0530
Message-Id: <20251125134233.33376-1-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251031142936.10874-1-mohammed.thasleem@intel.com>
References: <20251031142936.10874-1-mohammed.thasleem@intel.com>
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

This test validates the dgfx Package G7 residency.

v2: Move igt display reset outside loop. (Jeevan)
    Add G7 residency check before test execution. (Jeevan)
    Add 4k@144hz supported mode for G7 validation.
v3: Rename set_output function name. (Kunal)
    Move all calling functions from igt subset to test_package_g7. (Kunal)

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_pm_rpm.c | 145 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 144 insertions(+), 1 deletion(-)

diff --git a/tests/intel/kms_pm_rpm.c b/tests/intel/kms_pm_rpm.c
index 1610404ff..9d948047b 100644
--- a/tests/intel/kms_pm_rpm.c
+++ b/tests/intel/kms_pm_rpm.c
@@ -131,6 +131,9 @@
  *
  * SUBTEST: system-suspend-idle
  * Description: Validate suspend-to-idle (S0ix) functionality.
+ *
+ * SUBTEST: package-g7
+ * Description: Validate the package-g7 residency.
  */
 
 #define MSR_PC8_RES	0x630
@@ -146,6 +149,8 @@
 #define STRIDE (WIDTH)
 #define SIZE (HEIGHT * STRIDE)
 
+#define G7_RES_TIMEOUT 30000
+
 enum pc8_status {
 	PC8_ENABLED,
 	PC8_DISABLED
@@ -163,6 +168,14 @@ enum plane_type {
 	PLANE_CURSOR,
 };
 
+static const struct {
+	int w, h, hz;
+	const char *name;
+} prefers_mode[] = {
+	{7680, 4320, 60,  "8K@60"},
+	{3840, 2160, 144, "4K@144"},
+};
+
 /* Wait flags */
 #define DONT_WAIT	0
 #define WAIT_STATUS	1
@@ -181,7 +194,10 @@ struct mode_set_data {
 	drmModeConnectorPtr connectors[MAX_CONNECTORS];
 	drmModePropertyBlobPtr edids[MAX_CONNECTORS];
 	igt_display_t display;
-
+	igt_output_t *output;
+	drmModeModeInfo *mode;
+	igt_plane_t *primary;
+	struct igt_fb fb_white;
 	uint32_t devid;
 	int fw_fd;
 };
@@ -1576,6 +1592,131 @@ static void pm_test_caching(void)
 	gem_close(drm_fd, handle);
 }
 
+static void set_prefered_mode(void)
+{
+	enum pipe pipe;
+	igt_output_t *output;
+	bool mode_found = false;
+	drmModeModeInfo *mode = NULL;
+	drmModeConnectorPtr connector = NULL;
+	igt_display_t *display = &ms_data.display;
+
+	igt_display_reset(display);
+
+	for_each_pipe_with_valid_output(display, pipe, output) {
+		connector = output->config.connector;
+
+		if (connector->connection != DRM_MODE_CONNECTED)
+			continue;
+
+		igt_output_set_pipe(output, pipe);
+
+		if (!intel_pipe_output_combo_valid(display))
+			continue;
+
+		for (int i = 0; i < output->config.connector->count_modes && !mode_found; i++) {
+			mode = &output->config.connector->modes[i];
+
+			for (int j = 0; j < ARRAY_SIZE(prefers_mode); j++) {
+				if (mode->hdisplay == prefers_mode[j].w &&
+					mode->vdisplay == prefers_mode[j].h &&
+					mode->vrefresh == prefers_mode[j].hz) {
+
+					igt_output_override_mode(output, mode);
+					ms_data.output = output;
+					ms_data.mode = igt_output_get_mode(output);
+					ms_data.primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+
+					mode_found = true;
+					break;
+				}
+			}
+		}
+		if (mode_found)
+			break;
+	}
+
+	igt_require_f(mode_found, "Not found any 8K@60Hz or 4k@144hz mode on any connected output\n");
+}
+
+static void setup_output_fb(void)
+{
+	igt_plane_set_fb(ms_data.primary, NULL);
+	igt_create_color_fb(drm_fd,
+			    ms_data.mode->hdisplay, ms_data.mode->vdisplay,
+			    DRM_FORMAT_XRGB8888,
+			    DRM_FORMAT_MOD_LINEAR,
+			    1.0, 1.0, 1.0,
+			    &ms_data.fb_white);
+	igt_plane_set_fb(ms_data.primary, &ms_data.fb_white);
+
+	igt_display_commit(&ms_data.display);
+}
+
+static void has_g7_support(void)
+{
+	char buf[256];
+
+	igt_require_f(igt_debugfs_simple_read(debugfs, "dgfx_pkg_residencies", buf, sizeof(buf)) >= 0 &&
+		      strstr(buf, "Package G7"), "Package G7 is not supported\n");
+}
+
+static uint64_t get_pkg_count(char *pkg_data)
+{
+	char *e;
+	long long ret;
+	char *s = strchr(pkg_data, ':');
+
+	igt_assert(s);
+	s++;
+	ret = strtol(s, &e, 10);
+	igt_assert(((ret != LLONG_MIN && ret != LLONG_MAX) || errno != ERANGE) && e > s && *e == '\n' && ret >= 0);
+
+	return ret;
+}
+
+static uint64_t read_g7(void)
+{
+	char buf[256];
+	int ret;
+	char *str;
+
+	ret = igt_debugfs_simple_read(debugfs, "dgfx_pkg_residencies", buf, sizeof(buf));
+	igt_assert_f(ret >= 0, "Debugfs dgfx_pkg_residencies file not present.\n");
+
+	str = strstr(buf, "Package G7");
+	igt_skip_on_f(!str, "Package G7 is not supported.\n");
+
+	return get_pkg_count(str);
+}
+
+static void test_g7(void)
+{
+	uint64_t prev_count = 0;
+
+	prev_count = read_g7();
+	/* 30 sec timeout, based on trial statistics, is safe for G7 entry. */
+	igt_assert_f(igt_wait(read_g7() > prev_count, G7_RES_TIMEOUT, 100),
+		     "Package G7 residency is not achived\n");
+}
+
+static void cleanup(void)
+{
+	igt_plane_set_fb(ms_data.primary, NULL);
+	igt_output_override_mode(ms_data.output, NULL);
+	igt_display_commit(&ms_data.display);
+	igt_remove_fb(drm_fd, &ms_data.fb_white);
+}
+
+static void test_package_g7(void)
+{
+	has_g7_support();
+	set_prefered_mode();
+	setup_output_fb();
+	test_g7();
+	cleanup();
+}
+
 int rounds = 10;
 bool stay = false;
 
@@ -1703,6 +1844,8 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		gem_require_mappable_ggtt(drm_fd);
 		pm_test_caching();
 	}
+	igt_subtest("package-g7")
+		test_package_g7();
 
 	igt_fixture {
 		teardown_environment();
-- 
2.43.0

