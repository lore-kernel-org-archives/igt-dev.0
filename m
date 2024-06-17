Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 161A4C2BA18
	for <igt-dev@archiver.kernel.org>; Mon, 17 Jun 2024 15:59:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94C0E10E441;
	Mon, 17 Jun 2024 15:59:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eHZJHeKR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0252610E44D
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Jun 2024 15:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718639951; x=1750175951;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gxAgVPonsCzDMu8mi16vHolgnnCUG3bYUw2qudbNkrw=;
 b=eHZJHeKRsxq9f6/jPu8y08n3taj170huvtRCjSQlq3VGnSWBB1k5FR+5
 kJvlejN7RZmZQdVi0fytLJROONfp7P0WkgnepelciMRVFGpeuIvmfERZA
 XUHfd+/IGi+qODgV4J1qvj+l7os03BkeoQymM/uvq+FzVmzqROfUHaGcK
 41OikfJKrUvxB5+nmiBH+BwllhsFAjL8YQ4NyDFExC7r1wq/YlsPedF7F
 z1b/zm3uso5iUCM0Y1gnCdFHlsKWqNhzdgVbr2CIr/1oQU2sLV5GcYzqN
 IwHpSZxWkV3ZqZY9ZchzDykS/6KP8FLjkM/LC0QbcNN1u9I2On40ZQZe1 w==;
X-CSE-ConnectionGUID: tbIjueMCTQ+HdLBvIpDxzA==
X-CSE-MsgGUID: Vk8eJfL1Tii5ZrObW/kaSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="33010465"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; d="scan'208";a="33010465"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 08:58:58 -0700
X-CSE-ConnectionGUID: xsbreuxTQQiqngwEI75fIQ==
X-CSE-MsgGUID: Tplp0VrFQQGJ2Yxaaj8HPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; d="scan'208";a="45781841"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 08:58:57 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>
Subject: [PATCH i-g-t 1/2] tests/kms_bw: add subtest for only connected outputs
Date: Mon, 17 Jun 2024 21:40:51 +0530
Message-Id: <20240617161052.1113250-2-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240617161052.1113250-1-kunal1.joshi@intel.com>
References: <20240617161052.1113250-1-kunal1.joshi@intel.com>
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

forcing DP connector doesn't work well and tests are skipping
with unsupported mode, add new test which runs test on connected
outputs only.

v2: added debug print for better clarity of skips on unsupported mode

Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Reviewed-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
---
 tests/kms_bw.c | 43 +++++++++++++++++++++++++++++++++++++------
 1 file changed, 37 insertions(+), 6 deletions(-)

diff --git a/tests/kms_bw.c b/tests/kms_bw.c
index 05f7e79ad..9f376bfe3 100644
--- a/tests/kms_bw.c
+++ b/tests/kms_bw.c
@@ -48,6 +48,19 @@
  * @2560x1440p:       2560x1440 resolution
  * @3840x2160p:       3840x2160 resolution
  * @2160x1440p:       2160x1440 resolution
+ *
+ * SUBTEST: connected-linear-tiling-%d-displays-%s
+ * Description: bw test with %arg[2]
+ *
+ * arg[1].values: 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
+ *
+ * arg[2]:
+ *
+ * @1920x1080p:       1920x1080 resolution
+ * @2560x1440p:       2560x1440 resolution
+ * @3840x2160p:       3840x2160 resolution
+ * @2160x1440p:       2160x1440 resolution
+ *
  */
 
 /* Common test data. */
@@ -55,6 +68,7 @@ typedef struct data {
         igt_display_t display;
         igt_plane_t *primary[IGT_MAX_PIPES];
         igt_output_t *output[IGT_MAX_PIPES];
+	igt_output_t *connected_output[IGT_MAX_PIPES];
         igt_pipe_t *pipe[IGT_MAX_PIPES];
         igt_pipe_crc_t *pipe_crc[IGT_MAX_PIPES];
         drmModeModeInfo mode[IGT_MAX_PIPES];
@@ -62,6 +76,7 @@ typedef struct data {
         int w[IGT_MAX_PIPES];
         int h[IGT_MAX_PIPES];
         int fd;
+	int connected_outputs;
 } data_t;
 
 static drmModeModeInfo test_mode[] = {
@@ -108,6 +123,7 @@ static void test_init(data_t *data)
 	igt_display_t *display = &data->display;
 	int i, max_pipes = display->n_pipes;
 	igt_output_t *output;
+	data->connected_outputs = 0;
 
 	for_each_pipe(display, i) {
 		data->pipe_id[i] = i;
@@ -124,12 +140,12 @@ static void test_init(data_t *data)
 			continue;
 
 		output = &display->outputs[i];
-
 		data->output[i] = output;
 
 		/* Only allow physically connected displays for the tests. */
 		if (!igt_output_is_connected(output))
 			continue;
+		data->connected_output[data->connected_outputs++] = output;
 
 		igt_assert(kmstest_get_connector_default_mode(
 			data->fd, output->config.connector, &data->mode[i]));
@@ -173,7 +189,7 @@ static void force_output_mode(data_t *d, igt_output_t *output,
 	igt_output_override_mode(output, mode);
 }
 
-static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo *mode) {
+static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo *mode, bool physical) {
 	igt_display_t *display = &data->display;
 	igt_output_t *output;
 	struct igt_fb buffer[IGT_MAX_PIPES];
@@ -189,11 +205,15 @@ static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo
 	igt_skip_on_f(pipe >= num_pipes,
                       "ASIC does not have %d pipes\n", pipe);
 
+        igt_skip_on_f(physical && pipe > data->connected_outputs ,
+                      "Only %d connected need %d pipes\n",data->connected_outputs, pipe);
+
+
 	test_init(data);
 
 	/* create buffers */
 	for (i = 0; i <= pipe; i++) {
-		output = data->output[i];
+		output = physical ? data->connected_output[i] : data->output[i];
 		if (!output) {
 			continue;
 		}
@@ -208,6 +228,8 @@ static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo
 		igt_output_set_pipe(output, i);
 
 		igt_plane_set_fb(data->primary[i], &buffer[i]);
+		igt_info("Assigning pipe %s to output %s with mode %s",
+				 kmstest_pipe_name(i), igt_output_name(output), mode->name);
 	}
 
 	ret = igt_display_try_commit_atomic(display,
@@ -219,7 +241,7 @@ static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 
 	for (i = 0; i <= pipe; i++) {
-		output = data->output[i];
+		output = physical ? data->connected_output[i] : data->output[i];
 		if (!output) {
 			continue;
 		}
@@ -230,7 +252,7 @@ static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo
 	}
 
 	for (i = pipe; i >= 0; i--) {
-		output = data->output[i];
+		output = physical ? data->connected_output[i] : data->output[i];
 		if (!output)
 			continue;
 
@@ -265,10 +287,19 @@ igt_main
 		for (j = 0; j < ARRAY_SIZE(test_mode); j++) {
 			igt_subtest_f("linear-tiling-%d-displays-%s", i+1,
 			      test_mode[j].name)
-			run_test_linear_tiling(&data, i, &test_mode[j]);
+			run_test_linear_tiling(&data, i, &test_mode[j], false);
 		}
 	}
 
+        for (i = 0; i < IGT_MAX_PIPES; i++) {
+                for (j = 0; j < ARRAY_SIZE(test_mode); j++) {
+                        igt_subtest_f("connected-linear-tiling-%d-displays-%s", i+1,
+                              test_mode[j].name)
+                        run_test_linear_tiling(&data, i, &test_mode[j], true);
+                }
+        }
+
+
 	igt_fixture
 	{
 		igt_display_fini(&data.display);
-- 
2.25.1

