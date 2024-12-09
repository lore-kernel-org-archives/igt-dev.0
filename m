Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0557E7717D
	for <igt-dev@archiver.kernel.org>; Mon,  9 Dec 2024 11:43:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8129010E6FB;
	Mon,  9 Dec 2024 11:43:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mactmgFu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2864C10E6D3
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Dec 2024 11:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733744622; x=1765280622;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lal49dItUa2n3ae61TQN73l8dz5EvR/1PzaCVdV3CA8=;
 b=mactmgFulaX/sXc8bhgng45MVtpm9jHgYQD/QeLVudWXmSYwouv/HwYv
 x3IjznVmTp2k/ACHSYLmyN6e906c/Ww0RkI/MalJcLvCPPOMZ4Kv1a9EG
 M1JDAsbn/tvV7cwfZZV45M95gKmi2y0ZDGfvnwX0nFy+Ihr18VBWFNRxd
 4uNZO5grofxmrAMV+9cqKJHRC7KKlkXTEdjCUDT3vUBQG1khQbqx5OSce
 Ta7mlokJBoch8CeCgtKlGwIN6AEQ/TIAR5vcIK06OLaIMMXFmSwcIVXXI
 tLC76sj/MKM971CdqWl1skQvhXr+bKLuXZ9jq6pL0uDMU3t7zRO/JlvCw w==;
X-CSE-ConnectionGUID: YyOXxhBKTmGa66X9D6XY4w==
X-CSE-MsgGUID: VzNcDiWrSvWD7BW6/MPY2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="34182067"
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="34182067"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 03:43:42 -0800
X-CSE-ConnectionGUID: Aye2Bq0oSQ+dY0KTn6y5uA==
X-CSE-MsgGUID: 7af2cfXvRB+IJP7F7dMHIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="99503165"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.130])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 03:43:41 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 4/9] tests/kms_sharpness_filter: Add toggle subtest
Date: Mon,  9 Dec 2024 17:16:18 +0530
Message-Id: <20241209114623.1843033-5-swati2.sharma@intel.com>
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

Subtest is added to verify toggling/switching between enabling
and disabling of content adaptive sharpness filter.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_sharpness_filter.c | 40 ++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/tests/kms_sharpness_filter.c b/tests/kms_sharpness_filter.c
index bf660cb02..aa200b16a 100644
--- a/tests/kms_sharpness_filter.c
+++ b/tests/kms_sharpness_filter.c
@@ -34,6 +34,9 @@
  * SUBTEST: filter-formats
  * Description: Verify content adaptive sharpness filter with varying formats.
  * Functionality: casf, pixel-format
+ *
+ * SUBTEST: filter-toggle
+ * Description: Verify toggling between enabling and disabling content adaptive sharpness filter.
 */
 
 IGT_TEST_DESCRIPTION("Test to validate content adaptive sharpness filter");
@@ -44,9 +47,11 @@ IGT_TEST_DESCRIPTION("Test to validate content adaptive sharpness filter");
  * is seen without corruption for each subtest.
  */
 
+#define DISABLE_FILTER			0
 #define MIN_FILTER_STRENGTH		1
 #define MID_FILTER_STRENGTH		128
 #define MAX_FILTER_STRENGTH		255
+#define NROUNDS				10
 
 enum test_type {
 	TEST_FILTER_BASIC,
@@ -54,6 +59,7 @@ enum test_type {
 	TEST_FILTER_ROTATION,
 	TEST_FILTER_FORMATS,
 	TEST_FILTER_STRENGTH,
+	TEST_FILTER_TOGGLE,
 };
 
 const int filter_strength_list[] = {
@@ -145,6 +151,23 @@ static void cleanup(data_t *data)
 	cleanup_fbs(data);
 }
 
+static int test_filter_toggle(data_t *data)
+{
+	int ret = 0;
+
+	for (int k = 0; k < NROUNDS; k++) {
+		if (k % 2 == 0)
+			data->filter_strength = DISABLE_FILTER;
+		else
+			data->filter_strength = MAX_FILTER_STRENGTH;
+
+		set_filter_strength_on_pipe(data);
+		ret |= igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
+	}
+
+	return ret;
+}
+
 static void test_sharpness_filter(data_t *data,  enum test_type type)
 {
 	drmModeModeInfo *mode = data->mode;
@@ -171,6 +194,9 @@ static void test_sharpness_filter(data_t *data,  enum test_type type)
 
 	ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
 
+	if (type == TEST_FILTER_TOGGLE)
+		ret |= test_filter_toggle(data);
+
 	igt_assert_eq(ret, 0);
 
 	cleanup(data);
@@ -227,6 +253,9 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
 			case TEST_FILTER_STRENGTH:
 				snprintf(name, sizeof(name), "-strength-%d", data->filter_strength);
 				break;
+			case TEST_FILTER_TOGGLE:
+				snprintf(name, sizeof(name), "-toggle");
+				break;
 			default:
 				igt_assert(0);
 			}
@@ -339,6 +368,17 @@ igt_main_args("l", NULL, help_str, opt_handler, &data)
 		}
 	}
 
+	igt_describe("Verify toggling between enabling and disabling "
+		     "content adaptive sharpness filter.");
+	igt_subtest_with_dynamic("filter-toggle") {
+		data.modifier = DRM_FORMAT_MOD_LINEAR;
+		data.rotation = IGT_ROTATION_0;
+		data.format = DRM_FORMAT_XRGB8888;
+
+		data.filter_strength = MAX_FILTER_STRENGTH;
+		run_sharpness_filter_test(&data, TEST_FILTER_TOGGLE);
+	}
+
 	igt_fixture {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
-- 
2.25.1

