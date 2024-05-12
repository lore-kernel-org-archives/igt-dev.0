Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23B65C25B4F
	for <igt-dev@archiver.kernel.org>; Sun, 12 May 2024 15:51:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1A2A10E2CF;
	Sun, 12 May 2024 15:51:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dn4eZxKM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0284B10E28D
 for <igt-dev@lists.freedesktop.org>; Sun, 12 May 2024 15:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715529073; x=1747065073;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=33xFSyWrFj2OM2kFMBjGjXk36DZRID2DciUboAeroq8=;
 b=dn4eZxKMtmkoLdbEf/YnOpHUTFs455JVHWFfZEzoSXA7XR0JOpP8pACO
 h+7g3cZuL9kk2ig4N8Qlhybm1/BoiWj/RXwlx4tsD7a57392oL+6ZvlOC
 arE/KtIeokz047NJmzT9c2QVWRLwlBtQhLUPqUeIKpY/7aYRDLbldStfi
 lcI1UfCHhR2EuJik1iB2TQWOJHXRFGNnHbLm94PXzBqq27fAF89l5dmIk
 DmgNixzQ2MA50xwkUGOmjg3dorp+Io62V+1MKBdYlwyudlWlZKoeuF9q/
 iZqXQ4xmaXgoC8umfdQl7AtAm3Thl8iq9EgAfS5bR0SAMmfkA3AeR32tA w==;
X-CSE-ConnectionGUID: BY8H5gvJSJGEmTy27VsIfA==
X-CSE-MsgGUID: EU3FedWTQxyZ9P62I9eQaQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="22137085"
X-IronPort-AV: E=Sophos;i="6.08,156,1712646000"; d="scan'208";a="22137085"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2024 08:51:13 -0700
X-CSE-ConnectionGUID: QyXeE7vrQmmt+El+8aloEA==
X-CSE-MsgGUID: 4O3bjN/+RrOIBvkZYgeMLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,156,1712646000"; d="scan'208";a="34623211"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2024 08:51:12 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 1/3] tests/kms_bw: convert to dynamic subtest
Date: Sun, 12 May 2024 21:31:56 +0530
Message-Id: <20240512160158.3328235-2-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240512160158.3328235-1-kunal1.joshi@intel.com>
References: <20240512160158.3328235-1-kunal1.joshi@intel.com>
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
2.34.1

