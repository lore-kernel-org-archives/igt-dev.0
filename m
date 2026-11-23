Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5139606A327
	for <igt-dev@archiver.kernel.org>; Mon, 23 Nov 2026 10:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NXSvPisc
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B3CE10EBB6;
	Mon, 23 Nov 2026 10:13:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A247610EBB3
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Nov 2026 10:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795428647; x=1826964647;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5Y2USkjJkpkiKEenDyDw2XtAXyrCwQ0E4l4IuJoTS08=;
 b=NXSvPisclihZA+azLdNCgmP3TQI0jGCTuXIvPOQ6ROIyFJ03jZoqmi/S
 +gNwDTPoOiTxukj67PTUuUStvdL03qEILu3y6AX6bAHnFKI1OAXxYmX56
 hAQtwjt+v5Aia9AOdeK5Kns96SvcwmYaJV6xo1DfPiby4+iPAstoJid+4
 dpWosqkbcfLmF8AYZS9cCDSXtqL9EWycV5fccgGP25CSV6ulTkd7SCXun
 sjnN3mI/o5xByl0XvpCaFQQPIq47pyDeJd19iGrpSOGASevBPfhI5cx7X
 aei/62L9B6LaNkC7z8P9nMxtO1UvXNZPyawwb4J5famq0AudruOB3SOt5 w==;
X-CSE-ConnectionGUID: Vgq3EciXQ8+oNla4/M1sIg==
X-CSE-MsgGUID: R8S1YvNuQ4+1TAfluAN6hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4247519"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4247519"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 02:10:47 -0800
X-CSE-ConnectionGUID: Yi2b43U0T5C8b7mIARSkCw==
X-CSE-MsgGUID: Pg+jjhZnTtOy+b/N3r0JIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11621896"
Received: from avandhic-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 02:10:46 -0800
From: Avandhica S R <avandhica.s.r@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: sowmiya.s@intel.com,
	avandhica.s.r@intel.com
Subject: [PATCH i-g-t v2 1/2] Fix plane count and shuffle bugs
Date: Mon, 23 Nov 2026 15:40:54 +0530
Message-ID: <20261123101055.583218-2-avandhica.s.r@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123101055.583218-1-avandhica.s.r@intel.com>
References: <20261123101055.583218-1-avandhica.s.r@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Use the CRTC's actual plane count for memory allocations,
fixed the shuffle randomization range and used try_commit
instead of commit for unsupported plane combinations so
that the test skips rather than asserting.Also reference
buffer and plane buffer are kept separate to avoid over
writing reference framebuffers and fixed fb cleanups.

Signed-off-by: Avandhica S R <avandhica.s.r@intel.com>
---
 tests/kms_plane_multiple.c | 81 ++++++++++++++++++++++----------------
 1 file changed, 47 insertions(+), 34 deletions(-)

diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
index 0d338eeb5..9db3e891d 100644
--- a/tests/kms_plane_multiple.c
+++ b/tests/kms_plane_multiple.c
@@ -88,7 +88,7 @@ typedef struct {
 	igt_crc_t ref_crc1, ref_crc2;
 	igt_pipe_crc_t *pipe_crc1, *pipe_crc2;
 	igt_plane_t **plane1, **plane2;
-	struct igt_fb *fb1, *fb2;
+	struct igt_fb *fb1, *fb2, ref_fb1, ref_fb2;
 } data_t;
 
 /* Command line parameters. */
@@ -105,19 +105,19 @@ struct {
 /*
  * Common code across all tests, acting on data_t
  */
-static void test_init(data_t *data, igt_crtc_t *crtc, int n_planes)
+static void test_init(data_t *data, igt_crtc_t *crtc)
 {
 	data->pipe_crc1 = igt_crtc_crc_new(crtc,
 					   IGT_PIPE_CRC_SOURCE_AUTO);
 
-	data->plane1 = calloc(n_planes, sizeof(*data->plane1));
+	data->plane1 = calloc(crtc->n_planes, sizeof(*data->plane1));
 	igt_assert_f(data->plane1 != NULL, "Failed to allocate memory for planes\n");
 
-	data->fb1 = calloc(n_planes, sizeof(struct igt_fb));
+	data->fb1 = calloc(crtc->n_planes, sizeof(struct igt_fb));
 	igt_assert_f(data->fb1 != NULL, "Failed to allocate memory for FBs\n");
 }
 
-static void test_fini(data_t *data, igt_output_t *output, int n_planes)
+static void test_fini(data_t *data, igt_output_t *output)
 {
 	/* reset the constraint on the pipe */
 	igt_output_set_crtc(output, NULL);
@@ -138,7 +138,7 @@ static void
 get_reference_crc(data_t *data, igt_output_t *output, igt_crtc_t *crtc,
 		  igt_pipe_crc_t *pipe_crc,
 		  color_t *color, igt_plane_t **plane, uint64_t modifier,
-		  igt_crc_t *ref_crc)
+		  igt_crc_t *ref_crc, struct igt_fb *ref_fb)
 {
 	drmModeModeInfo *mode;
 	igt_plane_t *primary;
@@ -156,9 +156,9 @@ get_reference_crc(data_t *data, igt_output_t *output, igt_crtc_t *crtc,
 			    DRM_FORMAT_XRGB8888,
 			    modifier,
 			    color->red, color->green, color->blue,
-			    &data->fb1[primary->index]);
+			    ref_fb);
 
-	igt_plane_set_fb(plane[primary->index], &data->fb1[primary->index]);
+	igt_plane_set_fb(plane[primary->index], ref_fb);
 
 	ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
 	igt_skip_on(ret != 0);
@@ -212,7 +212,7 @@ prepare_planes(data_t *data, igt_crtc_t *crtc, color_t *color,
 	int *y;
 	int *size;
 	int i;
-	int* suffle;
+	int *suffle;
 
 	igt_output_set_crtc(output,
 			    crtc);
@@ -242,13 +242,13 @@ prepare_planes(data_t *data, igt_crtc_t *crtc, color_t *color,
 		int n, m;
 		int a, b;
 
-		n = rand() % (crtc->n_planes-1);
-		m = rand() % (crtc->n_planes-1);
+		n = rand() % (crtc->n_planes);
+		m = rand() % (crtc->n_planes);
 
 		/*
 		 * keep primary plane at its place for test's sake.
 		 */
-		if(n == primary->index || m == primary->index)
+		if (n == primary->index || m == primary->index)
 			continue;
 
 		a = suffle[n];
@@ -306,10 +306,10 @@ prepare_planes(data_t *data, igt_crtc_t *crtc, color_t *color,
 	create_fb_for_mode_position(data, output, mode, color, x, y,
 				    size, size, modifier, max_planes, &fb[primary->index]);
 	igt_plane_set_fb(plane[primary->index], &fb[primary->index]);
-	free((void*)x);
-	free((void*)y);
-	free((void*)size);
-	free((void*)suffle);
+	free((void *)x);
+	free((void *)y);
+	free((void *)size);
+	free((void *)suffle);
 }
 
 /*
@@ -331,7 +331,7 @@ test_plane_position_with_output(data_t *data, igt_crtc_t *crtc,
 	color_t blue  = { 0.0f, 0.0f, 1.0f };
 	igt_crc_t crc;
 	igt_plane_t *plane;
-	int i;
+	int i, ret;
 	int err, c = 0;
 	int iterations = max(1, opt.iterations);
 	bool loop_forever;
@@ -349,12 +349,12 @@ test_plane_position_with_output(data_t *data, igt_crtc_t *crtc,
 			iterations, iterations > 1 ? "iterations" : "iteration");
 	}
 
-	test_init(data, crtc, n_planes);
+	test_init(data, crtc);
 
 	get_reference_crc(data, output,
 			  crtc,
 			  data->pipe_crc1, &blue,
-			  data->plane1, modifier, &data->ref_crc1);
+			  data->plane1, modifier, &data->ref_crc1, &data->ref_fb1);
 
 	/* Find out how many planes are allowed simultaneously */
 	do {
@@ -370,7 +370,7 @@ test_plane_position_with_output(data_t *data, igt_crtc_t *crtc,
 		igt_output_set_crtc(output, NULL);
 		igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
-		for (int x = 0; x < c; x++)
+		for (int x = 0; x < crtc->n_planes; x++)
 			igt_remove_fb(data->drm_fd, &data->fb1[x]);
 	} while (!err && c < n_planes);
 
@@ -388,7 +388,8 @@ test_plane_position_with_output(data_t *data, igt_crtc_t *crtc,
 		prepare_planes(data, crtc, &blue,
 			       data->plane1, modifier, c, output, data->fb1);
 
-		igt_display_commit2(&data->display, COMMIT_ATOMIC);
+		ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
+		igt_skip_on(ret != 0);
 		igt_pipe_crc_start(data->pipe_crc1);
 
 		igt_pipe_crc_get_current(data->display.drm_fd, data->pipe_crc1, &crc);
@@ -402,13 +403,13 @@ test_plane_position_with_output(data_t *data, igt_crtc_t *crtc,
 		igt_output_set_crtc(output, NULL);
 		igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
-		for (int x = 0; x < c; x++)
+		for (int x = 0; x < crtc->n_planes; x++)
 			igt_remove_fb(data->drm_fd, &data->fb1[x]);
 
 		i++;
 	}
-
-	test_fini(data, output, n_planes);
+	igt_remove_fb(data->drm_fd, &data->ref_fb1);
+	test_fini(data, output);
 }
 
 static void
@@ -430,23 +431,23 @@ test_plane_position(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
 }
 
 static void test_init_2_display(data_t *data, igt_crtc_t *crtc1,
-				igt_crtc_t *crtc2, int n_planes)
+				igt_crtc_t *crtc2)
 {
 	data->pipe_crc1 = igt_crtc_crc_new(crtc1,
 					   IGT_PIPE_CRC_SOURCE_AUTO);
 	data->pipe_crc2 = igt_crtc_crc_new(crtc2,
 					   IGT_PIPE_CRC_SOURCE_AUTO);
 
-	data->plane1 = calloc(n_planes, sizeof(*data->plane1));
+	data->plane1 = calloc(crtc1->n_planes, sizeof(*data->plane1));
 	igt_assert_f(data->plane1 != NULL, "Failed to allocate memory for planes\n");
 
-	data->plane2 = calloc(n_planes, sizeof(*data->plane2));
+	data->plane2 = calloc(crtc2->n_planes, sizeof(*data->plane2));
 	igt_assert_f(data->plane2 != NULL, "Failed to allocate memory for planes\n");
 
-	data->fb1 = calloc(n_planes, sizeof(struct igt_fb));
+	data->fb1 = calloc(crtc1->n_planes, sizeof(struct igt_fb));
 	igt_assert_f(data->fb1 != NULL, "Failed to allocate memory for FBs\n");
 
-	data->fb2 = calloc(n_planes, sizeof(struct igt_fb));
+	data->fb2 = calloc(crtc2->n_planes, sizeof(struct igt_fb));
 	igt_assert_f(data->fb2 != NULL, "Failed to allocate memory for FBs\n");
 }
 
@@ -480,7 +481,7 @@ static void test_plane_position_2_display(data_t *data, igt_crtc_t *crtc1,
 {
 	color_t blue  = { 0.0f, 0.0f, 1.0f };
 	igt_crc_t crc1, crc2;
-	int n_planes;
+	int n_planes, ret;
 
 	n_planes = min(crtc1->n_planes, crtc2->n_planes);
 	if (!opt.all_planes)
@@ -494,15 +495,15 @@ static void test_plane_position_2_display(data_t *data, igt_crtc_t *crtc1,
 	 */
 
 	test_init_2_display(data, crtc1,
-			    crtc2, n_planes);
+			    crtc2);
 	get_reference_crc(data, output1,
 			  crtc1,
 			  data->pipe_crc1, &blue,
-			  data->plane1, DRM_FORMAT_MOD_LINEAR, &data->ref_crc1);
+			  data->plane1, DRM_FORMAT_MOD_LINEAR, &data->ref_crc1, &data->ref_fb1);
 	get_reference_crc(data, output2,
 			  crtc2,
 			  data->pipe_crc2, &blue,
-			  data->plane2, DRM_FORMAT_MOD_LINEAR, &data->ref_crc2);
+			  data->plane2, DRM_FORMAT_MOD_LINEAR, &data->ref_crc2, &data->ref_fb2);
 
 	prepare_planes(data, crtc1, &blue,
 		       data->plane1,
@@ -511,7 +512,8 @@ static void test_plane_position_2_display(data_t *data, igt_crtc_t *crtc1,
 		       data->plane2,
 		       modifier, 2, output2, data->fb2);
 
-	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+	ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
+	igt_skip_on(ret != 0);
 	igt_pipe_crc_start(data->pipe_crc1);
 	igt_pipe_crc_start(data->pipe_crc2);
 
@@ -556,6 +558,17 @@ static void run_2_display_test(data_t *data, uint64_t modifier, const char *name
 							      crtc1, crtc2,
 							      output1, output2,
 							      modifier);
+			igt_output_set_crtc(output1, NULL);
+			igt_output_set_crtc(output2, NULL);
+			igt_display_commit2(&data->display, COMMIT_ATOMIC);
+			for (int x = 0; x < crtc1->n_planes; x++)
+				igt_remove_fb(data->drm_fd, &data->fb1[x]);
+
+			for (int x = 0; x < crtc2->n_planes; x++)
+				igt_remove_fb(data->drm_fd, &data->fb2[x]);
+
+			igt_remove_fb(data->drm_fd, &data->ref_fb1);
+			igt_remove_fb(data->drm_fd, &data->ref_fb2);
 			test_fini_2_display(data);
 		}
 	}
-- 
2.53.0

