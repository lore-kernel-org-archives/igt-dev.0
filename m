Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C4ED65C68
	for <igt-dev@archiver.kernel.org>; Thu, 14 Nov 2024 09:49:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBBFE10E0D1;
	Thu, 14 Nov 2024 09:49:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ljc+5ZTr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFC8A10E7D7
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Nov 2024 09:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731577745; x=1763113745;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iM9pDzahtuw9vMt4mIloGT56gWUmnVNmZQXzPuCxNfs=;
 b=Ljc+5ZTrv87vWuieeAXcRlYJ/Q+Y5/lMRmM2EB1SLimbmaINcgzMYZfO
 SJdXHsyMdGEg/jSWvHoSa3QbkpOiMAIV2a74GD7RBtbURa/txOUBBJsvv
 mY9W/hZmGgSUW4PbhXd6HduaxavupB3OVatA48x70XZuatT6w7WRAxUKB
 go3KDY+yE/lh3Vq+fgnq6Mp0L4b2bDH9RLhLHxo9cAu550Ot7hV1KzXi2
 EuCOMqGTEGMP7iaMxb93HhYCcIKgXOBHR+fuM72+FL5XdPT2IOw9QCmG0
 0hYdYVVnzWyiFoo7Zag/5zAEIxTmAIVEGtPZ4vvlH9oDrJgvoBqF5Ve3y w==;
X-CSE-ConnectionGUID: 7+UnkzR6TTG2nIE48oJSeg==
X-CSE-MsgGUID: HQbavkoMSY6KWG7IdTlpRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="54045765"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="54045765"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 01:49:04 -0800
X-CSE-ConnectionGUID: ec2V8T9KTJqaRu0bmCR+qw==
X-CSE-MsgGUID: uz8rgkvpTrqCoUzRTjl42Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; d="scan'208";a="93203945"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2024 01:49:03 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] RFC: tests/kms_plane_lowres: Refactor test to handle
 tiling formats dynamically
Date: Thu, 14 Nov 2024 15:33:32 +0530
Message-Id: <20241114100332.1490538-1-jeevan.b@intel.com>
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

Refactored the test to dynamically handle different tiling formats.
Removed the hardcoded list of subtests and instead automatically checks
which tiling formats are supported for each plane.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_plane_lowres.c | 105 ++++++++++++++-------------------------
 1 file changed, 36 insertions(+), 69 deletions(-)

diff --git a/tests/kms_plane_lowres.c b/tests/kms_plane_lowres.c
index ef85e8fb9..a2b81a129 100644
--- a/tests/kms_plane_lowres.c
+++ b/tests/kms_plane_lowres.c
@@ -42,21 +42,10 @@
 #include <time.h>
 
 /**
- * SUBTEST: tiling-none
+ * SUBTEST: tiling
  * Description: Tests the visibility of the planes when switching between high
- *              and low resolution with Linear buffer (no tiling)
+ *              and low resolution with Supported Tiling Formats
  * Functionality: plane
- *
- * SUBTEST: tiling-%s
- * Description: Tests the visibility of the planes when switching between high
- *              and low resolution with %arg[1]
- *
- * arg[1]:
- *
- * @4:           4-tiling
- * @x:           x-tiling
- * @y:           y-tiling
- * @yf:          yf-tiling
  */
 
 IGT_TEST_DESCRIPTION("Test atomic mode setting with a plane by switching between high and low resolutions");
@@ -290,57 +279,6 @@ static void test_cleanup(data_t *data)
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 }
 
-static void run_test(data_t *data, uint64_t modifier)
-{
-	enum pipe pipe;
-	igt_output_t *output;
-
-	if(!igt_display_has_format_mod(&data->display, DRM_FORMAT_XRGB8888, modifier))
-		return;
-
-	for_each_pipe(&data->display, pipe) {
-		for_each_valid_output_on_pipe(&data->display, pipe, output) {
-			data->pipe = pipe;
-			data->output = output;
-
-			igt_display_reset(&data->display);
-			igt_output_set_pipe(data->output, data->pipe);
-
-			if (!intel_pipe_output_combo_valid(&data->display))
-				continue;
-
-			data->pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe,
-							  IGT_PIPE_CRC_SOURCE_AUTO);
-
-			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), data->output->name)
-				test_planes_on_pipe(data, modifier);
-
-			test_cleanup(data);
-		}
-	}
-}
-
-static const struct {
-	const char *name;
-	uint64_t modifier;
-} subtests[] = {
-	{ .name = "tiling-none",
-	  .modifier = DRM_FORMAT_MOD_LINEAR,
-	},
-	{ .name = "tiling-x",
-	  .modifier = I915_FORMAT_MOD_X_TILED,
-	},
-	{ .name = "tiling-y",
-	  .modifier = I915_FORMAT_MOD_Y_TILED,
-	},
-	{ .name = "tiling-yf",
-	  .modifier = I915_FORMAT_MOD_Yf_TILED,
-	},
-	{ .name = "tiling-4",
-	  .modifier = I915_FORMAT_MOD_4_TILED,
-	},
-};
-
 igt_main
 {
 	data_t data = {};
@@ -358,12 +296,41 @@ igt_main
 		igt_require(data.display.is_atomic);
 	}
 
-	for (int i = 0; i < ARRAY_SIZE(subtests); i++) {
-		igt_describe_f("Tests the visibility of the planes when switching between "
-			       "high and low resolution with %s\n", subtests[i].name);
+	igt_describe("Tests the visibility of the planes when switching between "
+		     "high and low resolution\n");
+	igt_subtest_with_dynamic("tiling") {
+		enum pipe pipe;
+		igt_output_t *output;
+
+		for_each_pipe(&data.display, pipe) {
+			for_each_valid_output_on_pipe(&data.display, pipe, output) {
+				igt_plane_t *plane;
+				data.pipe = pipe;
+				data.output = output;
+
+				igt_display_reset(&data.display);
+				igt_output_set_pipe(data.output, data.pipe);
 
-		igt_subtest_with_dynamic(subtests[i].name)
-			run_test(&data, subtests[i].modifier);
+				if (!intel_pipe_output_combo_valid(&data.display))
+					continue;
+
+				data.pipe_crc = igt_pipe_crc_new(data.drm_fd, data.pipe,
+								  IGT_PIPE_CRC_SOURCE_AUTO);
+
+				plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+
+				for (int i = 0; i < plane->format_mod_count; i++) {
+					if (plane->formats[i] != DRM_FORMAT_XRGB8888)
+						continue;
+
+		                        igt_dynamic_f("%s-pipe-%s-%s", igt_fb_modifier_name(plane->modifiers[i]),
+						      kmstest_pipe_name(pipe), data.output->name);
+					test_planes_on_pipe(&data, plane->modifiers[i]);
+
+					test_cleanup(&data);
+				}
+			}
+		}
 	}
 
 	igt_fixture {
-- 
2.25.1

