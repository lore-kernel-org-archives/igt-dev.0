Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E70ED1D89D
	for <igt-dev@archiver.kernel.org>; Thu,  4 Dec 2025 09:30:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6A3810E8EF;
	Thu,  4 Dec 2025 09:30:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mpVjO2nz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9AF310E8EF
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Dec 2025 09:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764840646; x=1796376646;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=23CbZfsxosCHS82rIBNzfiisW2AwFov4oWDWYLFtTRQ=;
 b=mpVjO2nzeyPjpgz41QWY00Ptk4+DWa4ApAN1Yg356ICz0gKyhg8i6NBq
 JY6pjqrWvAYXjNMxv2zjHU402ciY/5QGLRzPbUI6h3/f2mp7Tn6/74l8j
 mCyzwX1pJSPK5H0HUgQS4ynbACVFyMYZLKDb3KJL1soWQJn15bK0nNeLH
 RYO4uFerHoTtt+3/yiWFgvkMA34+MP7hTkMCYr8I9vFp5CYkThNnKK3O6
 dFxyy2UfEFNTg392ERVKUqR5QsYZ58ywLv1em2u948TEzAkSym9J1r53u
 bLcOA/mg0GvtvccmuiaI7zDnNhoKbG0s3MmxoDE7mCMQ7ApCO0b0I/ki1 w==;
X-CSE-ConnectionGUID: Uk55+vMjTd2+FKl/HfxxPg==
X-CSE-MsgGUID: k8HmdZqwTJeAa69MRkNzfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="70705521"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="70705521"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 01:30:22 -0800
X-CSE-ConnectionGUID: McnydQSXTE+B8RP07CmW8w==
X-CSE-MsgGUID: 4/bzla0sSUavJF+ZJgkIBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="200067855"
Received: from dg2adlp-alder-lake-client-platform.iind.intel.com
 ([10.223.55.76])
 by orviesa005.jf.intel.com with ESMTP; 04 Dec 2025 01:30:21 -0800
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com,
	Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_pm_rpm: Add test to validate G7
 residency
Date: Thu,  4 Dec 2025 14:55:48 +0530
Message-Id: <20251204092548.60528-1-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251125134233.33376-1-mohammed.thasleem@intel>
References: <20251125134233.33376-1-mohammed.thasleem@intel>
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
v4: Move mode detection logic in to is_preferred_mode_present. (Kunal)

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_pm_rpm.c | 148 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 147 insertions(+), 1 deletion(-)

diff --git a/tests/intel/kms_pm_rpm.c b/tests/intel/kms_pm_rpm.c
index 1610404ff..431870cac 100644
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
@@ -1576,6 +1592,134 @@ static void pm_test_caching(void)
 	gem_close(drm_fd, handle);
 }
 
+static bool is_preferred_mode_present(igt_output_t *output, enum pipe pipe,
+				      igt_display_t *display)
+{
+	drmModeModeInfo *mode = NULL;
+
+	for (int i = 0; i < output->config.connector->count_modes; i++) {
+		mode = &output->config.connector->modes[i];
+
+		for (int j = 0; j < ARRAY_SIZE(prefers_mode); j++) {
+			if (mode->hdisplay == prefers_mode[j].w &&
+				mode->vdisplay == prefers_mode[j].h &&
+				mode->vrefresh == prefers_mode[j].hz) {
+
+				igt_output_override_mode(output, mode);
+				ms_data.output = output;
+				ms_data.mode = igt_output_get_mode(output);
+				ms_data.primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+
+				return true;
+			}
+		}
+	}
+
+	return false;
+}
+
+static void set_prefered_mode(void)
+{
+	enum pipe pipe;
+	igt_output_t *output;
+	bool mode_found = false;
+	igt_display_t *display = &ms_data.display;
+
+	igt_display_reset(display);
+
+	for_each_pipe_with_valid_output(display, pipe, output) {
+
+		igt_output_set_pipe(output, pipe);
+
+		if (!intel_pipe_output_combo_valid(display))
+			continue;
+
+		if (is_preferred_mode_present(output, pipe, display)) {
+			mode_found = true;
+			break;
+		}
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
 
@@ -1703,6 +1847,8 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		gem_require_mappable_ggtt(drm_fd);
 		pm_test_caching();
 	}
+	igt_subtest("package-g7")
+		test_package_g7();
 
 	igt_fixture {
 		teardown_environment();
-- 
2.43.0

