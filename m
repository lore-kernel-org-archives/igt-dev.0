Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B396CCF9FE
	for <igt-dev@archiver.kernel.org>; Fri, 31 Oct 2025 14:30:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B29F10EB7C;
	Fri, 31 Oct 2025 14:30:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hOHEq33/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6E1B10EB7C
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Oct 2025 14:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761921002; x=1793457002;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SisHHDww19yc2xqSky4ZGn8GH4ekJRXrFBdXgIV1E0E=;
 b=hOHEq33/P+s45mQmcAnh05smbQdd1ZSTTKFh0ErJIBn90A5L0cc9ToJK
 byK7hAKnam6yxD9Mxkx4FoHScUhgt9Vdt5NKwY7rnDzO6eUbC9StkZ32x
 pHbCU+frCFB35cUH2ZAxBYIoQ83w7EDLXjypd03socJtkhhpH5gbHLyld
 WzLciWc5KO9sAWHdMdc+WtEIjVNu88h0F8ts1sfOm6TSLfMmEBpIhpadx
 pTcwszyoJsCBJ1tYykWK0eKK2vczcj8EBZiRDhKw+PfkWUVDkTv570bdN
 coiLysN+jkfnvAWUF9BB3vxwgDSJ6D0PAVM066o66cwlZ8Utht2uty11/ w==;
X-CSE-ConnectionGUID: IdpeEULIQrGY3rmR9FQVhg==
X-CSE-MsgGUID: 4G3kEJwiR+Cw/vo6nSfyXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="81493812"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="81493812"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 07:30:01 -0700
X-CSE-ConnectionGUID: ztVug2OyRr2UbDBDzFHPrA==
X-CSE-MsgGUID: +QiNCUbBR7iz+Q7/wFs74w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="186704622"
Received: from linux-raptor-lake-client-platform.iind.intel.com
 ([10.190.238.55])
 by fmviesa009.fm.intel.com with ESMTP; 31 Oct 2025 07:30:00 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com,
	Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_pm_rpm: Add test to validate G7
 residency
Date: Fri, 31 Oct 2025 19:59:35 +0530
Message-ID: <20251031142936.10874-1-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250916062411.23433-1-mohammed.thasleem@intel.com>
References: <20250916062411.23433-1-mohammed.thasleem@intel.com>
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

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_pm_rpm.c | 138 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 137 insertions(+), 1 deletion(-)

diff --git a/tests/intel/kms_pm_rpm.c b/tests/intel/kms_pm_rpm.c
index 1610404ff..76f3544c5 100644
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
@@ -163,6 +166,14 @@ enum plane_type {
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
@@ -181,7 +192,10 @@ struct mode_set_data {
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
@@ -1576,6 +1590,121 @@ static void pm_test_caching(void)
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
+static void set_output(void)
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
+	igt_assert_f(igt_wait(read_g7() > prev_count, 30000, 100),
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
 int rounds = 10;
 bool stay = false;
 
@@ -1703,6 +1832,13 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		gem_require_mappable_ggtt(drm_fd);
 		pm_test_caching();
 	}
+	igt_subtest("package-g7") {
+		has_g7_support();
+		set_prefered_mode();
+		set_output();
+		test_g7();
+		cleanup();
+	}
 
 	igt_fixture {
 		teardown_environment();
-- 
2.43.0

