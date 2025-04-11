Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C661EC36010
	for <igt-dev@archiver.kernel.org>; Fri, 11 Apr 2025 12:07:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79CAA10EB8C;
	Fri, 11 Apr 2025 12:07:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OcQJ7vSt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4AEB10EB8B
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Apr 2025 12:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744373248; x=1775909248;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mujYfY7wIwJJ0C+mnnDsoEDB09PF0JqnMIqA+3kDAQE=;
 b=OcQJ7vStrYnnCJVOmEmxJ4uKq7fAbGHuYITG6b+u/g58uXYIgWG2Amak
 aI6NlFjMcYttwekiEPZDAKQL8imWe4dVLDmWEXlSXJ9Lj7Z31HgcZOOLh
 4aPwjFwIOjdr2AoaQ3PPS6epw+C98FjKpgG+zhp1GCSQF0JkIUzZ7VO95
 u84QT1hNcxxZxD3i4FXoJVvjhlMDU26Q+/VtoCmRdMTID/7ed9OjURJb9
 BrSL5M+VFgbqwTL82AEdkbFF9uovutEq8UxQIUE1ATocf8Z9VT6i4jI/V
 mWvgY/KIygGZ2Aa9g8UpvrtgTVvB0yKpscLr8kMnfgDu9AVEJIeNnhVLI g==;
X-CSE-ConnectionGUID: GXjFYeHiTO+RAb0nlQFvIA==
X-CSE-MsgGUID: DB9dIfQKTQ2yaHciGTvP5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="56907858"
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; d="scan'208";a="56907858"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 05:07:27 -0700
X-CSE-ConnectionGUID: h36b6MFPSzqPheSvhM1s7Q==
X-CSE-MsgGUID: p2nKethAR+6gnvyp48U4qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; d="scan'208";a="134044975"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 05:07:27 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v2 06/10] tests/kms_sharpness_filter: Add dpms/suspend subtests
Date: Fri, 11 Apr 2025 17:42:34 +0530
Message-Id: <20250411121238.773949-7-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250411121238.773949-1-swati2.sharma@intel.com>
References: <20250411121238.773949-1-swati2.sharma@intel.com>
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

Add subtests to verify CASF with DPMS and suspend.

v2: -Added CRC based verification (Ankit)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 tests/kms_sharpness_filter.c | 67 ++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/tests/kms_sharpness_filter.c b/tests/kms_sharpness_filter.c
index d1d6558c5..32ad7a752 100644
--- a/tests/kms_sharpness_filter.c
+++ b/tests/kms_sharpness_filter.c
@@ -41,6 +41,14 @@
  * SUBTEST: filter-tap
  * Description: Verify content adaptive sharpness filter with resolution change, resolution change
  * 		will lead to selection of distinct taps.
+ *
+ * SUBTEST: filter-dpms
+ * Description: Verify content adaptive sharpness filter with DPMS.
+ * Functionality: casf, dpms
+ *
+ * SUBTEST: filter-suspend
+ * Description: Verify content adaptive sharpness filter with suspend.
+ * Functionality: casf, suspend
 */
 
 IGT_TEST_DESCRIPTION("Test to validate content adaptive sharpness filter");
@@ -70,6 +78,8 @@ enum test_type {
 	TEST_FILTER_STRENGTH,
 	TEST_FILTER_TOGGLE,
 	TEST_FILTER_TAP,
+	TEST_FILTER_DPMS,
+	TEST_FILTER_SUSPEND,
 };
 
 const int filter_strength_list[] = {
@@ -212,9 +222,12 @@ static int test_filter_toggle(data_t *data)
 
 static void test_sharpness_filter(data_t *data,  enum test_type type)
 {
+	igt_output_t *output = data->output;
 	drmModeModeInfo *mode = data->mode;
 	int height = mode->hdisplay;
 	int width =  mode->vdisplay;
+	igt_crc_t ref_crc, crc;
+	igt_pipe_crc_t *pipe_crc = NULL;
 	int ret;
 
 	data->plane[0] = igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
@@ -238,11 +251,37 @@ static void test_sharpness_filter(data_t *data,  enum test_type type)
 
 	ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
 
+	if (type == TEST_FILTER_DPMS || type == TEST_FILTER_SUSPEND) {
+		pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe_id,
+					    IGT_PIPE_CRC_SOURCE_AUTO);
+		igt_pipe_crc_collect_crc(pipe_crc, &ref_crc);
+	}
+
+	if (type == TEST_FILTER_DPMS) {
+		kmstest_set_connector_dpms(data->drm_fd,
+					   output->config.connector,
+					   DRM_MODE_DPMS_OFF);
+		kmstest_set_connector_dpms(data->drm_fd,
+					   output->config.connector,
+					   DRM_MODE_DPMS_ON);
+	}
+
+	if (type == TEST_FILTER_SUSPEND)
+		igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
+					      SUSPEND_TEST_NONE);
+
+	if (type == TEST_FILTER_DPMS || type == TEST_FILTER_SUSPEND) {
+		igt_pipe_crc_collect_crc(pipe_crc, &crc);
+		igt_assert_crc_equal(&crc, &ref_crc);
+	}
+
 	if (type == TEST_FILTER_TOGGLE)
 		ret |= test_filter_toggle(data);
 
 	igt_assert_eq(ret, 0);
 
+	/* clean-up */
+	igt_pipe_crc_free(pipe_crc);
 	cleanup(data);
 }
 
@@ -328,6 +367,12 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
 			case TEST_FILTER_TOGGLE:
 				snprintf(name, sizeof(name), "-toggle");
 				break;
+			case TEST_FILTER_DPMS:
+				snprintf(name, sizeof(name), "-dpms");
+				break;
+			case TEST_FILTER_SUSPEND:
+				snprintf(name, sizeof(name), "-suspend");
+				break;
 			default:
 				igt_assert(0);
 			}
@@ -462,6 +507,28 @@ igt_main_args("l", NULL, help_str, opt_handler, &data)
 		run_sharpness_filter_test(&data, TEST_FILTER_TAP);
 	}
 
+	igt_describe("Verify content adaptive sharpness filter "
+		     "with DPMS.");
+	igt_subtest_with_dynamic("filter-dpms") {
+		data.modifier = DRM_FORMAT_MOD_LINEAR;
+		data.rotation = IGT_ROTATION_0;
+		data.format = DRM_FORMAT_XRGB8888;
+		data.filter_strength = MID_FILTER_STRENGTH;
+
+		run_sharpness_filter_test(&data, TEST_FILTER_DPMS);
+	}
+
+	igt_describe("Verify content adaptive sharpness filter "
+		     "with suspend.");
+	igt_subtest_with_dynamic("filter-suspend") {
+		data.modifier = DRM_FORMAT_MOD_LINEAR;
+		data.rotation = IGT_ROTATION_0;
+		data.format = DRM_FORMAT_XRGB8888;
+		data.filter_strength = MID_FILTER_STRENGTH;
+
+		run_sharpness_filter_test(&data, TEST_FILTER_SUSPEND);
+	}
+
 	igt_fixture {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
-- 
2.25.1

