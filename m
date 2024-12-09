Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E18DEE77184
	for <igt-dev@archiver.kernel.org>; Mon,  9 Dec 2024 11:43:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C8CD10E6CD;
	Mon,  9 Dec 2024 11:43:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gU7z0AFl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C298310E4A4
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Dec 2024 11:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733744625; x=1765280625;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tph9eTztRhJgPIye5mFGyZD3izbu6HAliWLgcvr1tds=;
 b=gU7z0AFl4BXzJ37Ujh3bGwUFRJPKKPstqI55Bs2XLdsjlq24W9InD+Z3
 Zcz+cSjZb6viIGg9FrFpQmCVeLRPjOsaqeTv5h3WxqlUbF0qbfXQQE4Om
 ghEa4DUWyuBQpJ/JdUXwjpkZ87mW3+WMecOeG0SFz0dehx763WvzDGawp
 2X6Ibon369U34ohz6CLPjf8k/ZTGe4jLCDtNZuyNMgIbfWhTrNBTwtlzJ
 LBo7LcUDS/6dgXD9COQX6omWZ4rk99gWVwHiApZDtntVqrv1bkf1yApOU
 yAWW7qZTUbCL2mNRFCgYnq45ZHpj5/9bJqbwsJDE7HGT6Ktl4MAck11xL Q==;
X-CSE-ConnectionGUID: DfpjS98ZTpeINWjl/HyxJw==
X-CSE-MsgGUID: 7/OAXTzQQrufuPcDRwA6sA==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="34182070"
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="34182070"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 03:43:45 -0800
X-CSE-ConnectionGUID: +SlJ0UgHQ9KdDG4g7cXmzw==
X-CSE-MsgGUID: My1L3OhZQ7eMzuc407v7Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="99503174"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.130])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 03:43:44 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 6/9] tests/kms_sharpness_filter: Add dpms/suspend
 subtests
Date: Mon,  9 Dec 2024 17:16:20 +0530
Message-Id: <20241209114623.1843033-7-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241209114623.1843033-1-swati2.sharma@intel.com>
References: <20241209114623.1843033-1-swati2.sharma@intel.com>
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

Subtests are added to verify casf with dpms and suspend.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_sharpness_filter.c | 52 ++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/tests/kms_sharpness_filter.c b/tests/kms_sharpness_filter.c
index f91c444f7..92c816480 100644
--- a/tests/kms_sharpness_filter.c
+++ b/tests/kms_sharpness_filter.c
@@ -40,6 +40,14 @@
  *
  * SUBTEST: filter-tap
  * Description: Verify that following a resolution change, distinct taps are selected.
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
@@ -69,6 +77,8 @@ enum test_type {
 	TEST_FILTER_STRENGTH,
 	TEST_FILTER_TOGGLE,
 	TEST_FILTER_TAP,
+	TEST_FILTER_DPMS,
+	TEST_FILTER_SUSPEND,
 };
 
 const int filter_strength_list[] = {
@@ -210,6 +220,7 @@ static int test_filter_toggle(data_t *data)
 
 static void test_sharpness_filter(data_t *data,  enum test_type type)
 {
+	igt_output_t *output = data->output;
 	drmModeModeInfo *mode = data->mode;
 	int height = mode->hdisplay;
 	int width =  mode->vdisplay;
@@ -234,6 +245,19 @@ static void test_sharpness_filter(data_t *data,  enum test_type type)
 
 	ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
 
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
 	if (type == TEST_FILTER_TOGGLE)
 		ret |= test_filter_toggle(data);
 
@@ -324,6 +348,12 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
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
@@ -458,6 +488,28 @@ igt_main_args("l", NULL, help_str, opt_handler, &data)
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

