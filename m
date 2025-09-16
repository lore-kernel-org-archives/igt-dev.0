Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED94CAC598
	for <igt-dev@archiver.kernel.org>; Tue, 16 Sep 2025 05:51:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3F2210E274;
	Tue, 16 Sep 2025 05:51:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ii4+DBfu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8AF010E274
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Sep 2025 05:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758001861; x=1789537861;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aadJlrhYyyRVg6f9iNEYJrymWEeR3eMmjo7QCZgeUko=;
 b=ii4+DBfuoudnJBmffMfpn3/qak0vKyovIJqxrX3eyRtJGxhUT1TKvhCo
 Yt9YB+9g4MGd7UHuQVcmRK2AU1LbSZ/H0r+2gZGv2vZ3/ctz+RdDEciDa
 m7xFYSp3iBGfxXNaIZG+SIM0Ap7PiTrutiru8aoNt9b7hpPFVSeqP3zin
 XvgTMS4qSHMcoR6Ho171pYq4NYs8MJHGSCPHzXmoQXZrff8qs58vSe2m5
 F+2HwYb5UZLPjKpFaIaPMR0wQ4ENz1G3ROeipoGF1iV0HFW+DmVigSToO
 67O1dr2ovM/nq8O+/ndPlwZESBGi5dO0clc/N0Dla2jCXkj35MA8PPeWW Q==;
X-CSE-ConnectionGUID: /PPVwZRUSACHIIgzso+VSQ==
X-CSE-MsgGUID: smbxEGHcTpqSZZj4i1MX7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="77711892"
X-IronPort-AV: E=Sophos;i="6.18,268,1751266800"; d="scan'208";a="77711892"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 22:51:01 -0700
X-CSE-ConnectionGUID: 9EI4QBt5SQCxBequgQdJ6g==
X-CSE-MsgGUID: f0oBJsknRE26GKalgFP8PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,268,1751266800"; d="scan'208";a="174655733"
Received: from dg2adlp-alder-lake-client-platform.iind.intel.com
 ([10.223.55.76])
 by orviesa007.jf.intel.com with ESMTP; 15 Sep 2025 22:50:59 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_pm_rpm: Add test to validate G7
 residency
Date: Tue, 16 Sep 2025 11:18:30 +0530
Message-Id: <20250916054830.23112-1-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.25.1
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

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_pm_rpm.c | 116 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 115 insertions(+), 1 deletion(-)

diff --git a/tests/intel/kms_pm_rpm.c b/tests/intel/kms_pm_rpm.c
index d22f165b8..c5970de43 100644
--- a/tests/intel/kms_pm_rpm.c
+++ b/tests/intel/kms_pm_rpm.c
@@ -128,6 +128,9 @@
  *
  * SUBTEST: universal-planes-dpms
  * Description: Validate universal plane (set/unset/change) with dpms.
+ *
+ * SUBTEST: package-g7
+ * Description: Validate the package-g7 residency.
  */
 
 #define MSR_PC8_RES	0x630
@@ -178,7 +181,10 @@ struct mode_set_data {
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
@@ -1572,6 +1578,108 @@ static void pm_test_caching(void)
 	gem_close(drm_fd, handle);
 }
 
+static void set_mode(void)
+{
+	enum pipe pipe;
+	bool found = false;
+	igt_output_t *output;
+	drmModeModeInfo *mode = NULL;
+	igt_display_t *display = &ms_data.display;
+
+	for_each_pipe_with_valid_output(display, pipe, output) {
+		drmModeConnectorPtr connector = output->config.connector;
+
+		if (connector->connection != DRM_MODE_CONNECTED)
+			continue;
+
+		igt_display_reset(display);
+		igt_output_set_pipe(output, pipe);
+
+		if (!intel_pipe_output_combo_valid(display))
+			continue;
+
+		for (int i = 0; i < output->config.connector->count_modes; i++) {
+			mode = &output->config.connector->modes[i];
+			if (mode->hdisplay == 3840 && mode->vdisplay == 2160 && mode->vrefresh == 60) {
+				igt_output_override_mode(output, mode);
+
+				ms_data.output = output;
+				ms_data.mode = igt_output_get_mode(output);
+				ms_data.primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+
+				found = true;
+				break;
+			}
+		}
+		if (found)
+			break;
+	}
+
+	igt_require_f(found, "No 8K@60Hz mode found on any connected output \n");
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
+static void cleanup(void)
+{
+	igt_plane_set_fb(ms_data.primary, NULL);
+	igt_output_override_mode(ms_data.output, NULL);
+	igt_display_commit(&ms_data.display);
+	igt_remove_fb(drm_fd, &ms_data.fb_white);
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
+	str = strstr(buf, "Package G10");
+	igt_skip_on_f(!str, "Package G7 is not supported.\n");
+
+	return get_pkg_count(str);
+}
+
+static void test_g7(void)
+{
+	uint64_t prev_count = 0, curr_count = 0;
+
+	prev_count = read_g7();
+	sleep(10);
+	curr_count = read_g7();
+
+	igt_assert_f(curr_count > prev_count, "Package G7 residency is not achived\n");
+}
+
 int rounds = 10;
 bool stay = false;
 
@@ -1695,6 +1803,12 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		gem_require_mappable_ggtt(drm_fd);
 		pm_test_caching();
 	}
+	igt_subtest("package-g7") {
+		set_mode();
+		set_output();
+		test_g7();
+		cleanup();
+	}
 
 	igt_fixture {
 		teardown_environment();
-- 
2.43.0

