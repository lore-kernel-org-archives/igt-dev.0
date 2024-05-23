Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0306C25B7A
	for <igt-dev@archiver.kernel.org>; Thu, 23 May 2024 09:50:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA9EE10E23D;
	Thu, 23 May 2024 09:50:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L4CW2Feg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0A5E10E13B
 for <igt-dev@lists.freedesktop.org>; Thu, 23 May 2024 09:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716457854; x=1747993854;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pBKMT4JManOB/4DkQr0HgWhfhKqwPsfrrjqzFHpjHPo=;
 b=L4CW2Fegf2WPtkWmyp3c9OdO7CiPJMDTvesHJYPUfAAUz2wMxdKzZSjZ
 K+mg5ERPHwroSwFZAMfxYXBGNSlzh0iYnAp1RXUWFt538yNYnqL2J4IA6
 7J4/yjzQQk34qqd9PDoQJNqp5avHRHZwCual4Y9sb/+9xgG2hLm2gzFKX
 D6qXId/D7G5SK1p9GOrfgBQXxTSZvC29oQl3f+kJGCu1a3EJVA+cMROMf
 N+jZP+PTK8cXktir+mR9qU/+i1stbEs6eDZXyuY9rdsj4okNhHPb1i1DM
 zXNIXM/sxpJhExOowikWGBgbshYdks3PeAOJRiauYxDfH4j53B/+M5uUO g==;
X-CSE-ConnectionGUID: bE99HBieTkeuFhZrmZFkDw==
X-CSE-MsgGUID: Arb0v/fzRl2xvv3b8mEGZQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="15711468"
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; d="scan'208";a="15711468"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 02:50:53 -0700
X-CSE-ConnectionGUID: WR91PRppT4WWcLvD3GssdQ==
X-CSE-MsgGUID: J+g7dUvaTr+/1v02hgHwSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; d="scan'208";a="34148329"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2024 02:50:53 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 1/3] tests/kms_bw: convert to dynamic subtest
Date: Thu, 23 May 2024 15:32:46 +0530
Message-Id: <20240523100248.230989-2-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240523100248.230989-1-kunal1.joshi@intel.com>
References: <20240523100248.230989-1-kunal1.joshi@intel.com>
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

Convert the test structure from individual subtests for each
display mode (1080, 2k, 4k...) and display count (1, 2... n)
to a dynamic subtest structure. The change addresses the issue
of high skip counts due to potentially missing configurations,
which previously required blacklisting.

In the new structure, the display mode is set at the subtest level,
while the number of displays is dynamic. This ensures that the subtest
passes regardless of the number of connected displays.
To cover all scenarios, it may be necessary to connect the
maximum possible number of displays.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/kms_bw.c | 38 ++++++++++++++++++++------------------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/tests/kms_bw.c b/tests/kms_bw.c
index 05f7e79ad..b50f324af 100644
--- a/tests/kms_bw.c
+++ b/tests/kms_bw.c
@@ -37,12 +37,10 @@
 #include <xf86drmMode.h>
 
 /**
- * SUBTEST: linear-tiling-%d-displays-%s
- * Description: bw test with %arg[2]
+ * SUBTEST: linear-tiling-%s
+ * Description: bw test with %arg[1]
  *
- * arg[1].values: 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
- *
- * arg[2]:
+ * arg[1]:
  *
  * @1920x1080p:       1920x1080 resolution
  * @2560x1440p:       2560x1440 resolution
@@ -62,6 +60,7 @@ typedef struct data {
         int w[IGT_MAX_PIPES];
         int h[IGT_MAX_PIPES];
         int fd;
+	int num_pipes;
 } data_t;
 
 static drmModeModeInfo test_mode[] = {
@@ -178,16 +177,10 @@ static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo
 	igt_output_t *output;
 	struct igt_fb buffer[IGT_MAX_PIPES];
 	igt_crc_t zero, captured[IGT_MAX_PIPES];
-	int i = 0, num_pipes = 0;
-	enum pipe p;
 	int ret;
 
-	/* Cannot use igt_display_get_n_pipes() due to fused pipes on i915 where they do
-	 * not give the numver of valid crtcs and always return IGT_MAX_PIPES */
-	for_each_pipe(display, p) num_pipes++;
-
-	igt_skip_on_f(pipe >= num_pipes,
-                      "ASIC does not have %d pipes\n", pipe);
+	igt_skip_on_f(pipe >= data->num_pipes,
+				  "ASIC does not have %d pipes\n", pipe);
 
 	test_init(data);
 
@@ -244,28 +237,37 @@ igt_main
 {
 	data_t data;
 	int i = 0, j = 0;
+	enum pipe p;
 
 	memset(&data, 0, sizeof(data));
 
 	igt_fixture
 	{
 		data.fd = drm_open_driver_master(DRIVER_ANY);
+		data.num_pipes = 0;
 
 		kmstest_set_vt_graphics_mode();
 
 		igt_display_require(&data.display, data.fd);
 		igt_require(&data.display.is_atomic);
 		igt_display_require_output(&data.display);
+		/*
+		 * Cannot use igt_display_get_n_pipes() due to fused pipes on i915 where they do
+		 * not give the numver of valid crtcs and always return IGT_MAX_PIPES
+		 */
+		for_each_pipe(&data.display, p) data.num_pipes++;
 
 	}
 
 	/* We're not using for_each_pipe_static because we need the
 	 * _amount_ of pipes */
-	for (i = 0; i < IGT_MAX_PIPES; i++) {
-		for (j = 0; j < ARRAY_SIZE(test_mode); j++) {
-			igt_subtest_f("linear-tiling-%d-displays-%s", i+1,
-			      test_mode[j].name)
-			run_test_linear_tiling(&data, i, &test_mode[j]);
+	for (j = 0; j < ARRAY_SIZE(test_mode); j++) {
+		igt_subtest_with_dynamic_f("linear-tiling-%s", test_mode[j].name)
+		{
+			for (i = 0; i < data.num_pipes; i++) {
+				igt_dynamic_f("%d-display%s", i+1, i == 0 ? "" : "s")
+					run_test_linear_tiling(&data, i, &test_mode[j]);
+			}
 		}
 	}
 
-- 
2.25.1

