Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD04FFD9E34
	for <igt-dev@archiver.kernel.org>; Fri, 27 Feb 2026 06:22:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C53210EA51;
	Fri, 27 Feb 2026 06:22:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LQFfoDj4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EE3810EA4D
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Feb 2026 06:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772173376; x=1803709376;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jepIaX7EwMtU8TxMw/ksEg/QOwxn0ODeJJB0txlNzP8=;
 b=LQFfoDj4R/o3ImsxHlPoDvVx2G/H19uyFriqKePeVU9QUxSRICl+HCJn
 p/KplTwBaoN24W9bMU63n2iytwuUFLMrOM6+di8dKoQ3MsJjUadXnVq8v
 Cg13NeKzAjYeNHm7zpSntOv++buS76I6KXg7dMSDIdwzyRq/HLBKu0DZN
 o1RACPUkNX8x3YqEe8I1YU6/6au4Y4ZWKYdf1UaidRMi2rW93fCih1BkY
 JIgnnkIiT/qZb9cZHmKCfITos4zG/bK8t9LEClLv8lCoWvwhVS1rVg0+u
 wo+cevJtTrzDqrBPpCutQuD4XwWNdKWMlKCzkOvgdgkThPio9Xgpyh1gR Q==;
X-CSE-ConnectionGUID: 3NdtAgNaRReImikB6kOz2Q==
X-CSE-MsgGUID: uM760p8BS2yMGeL+grmZHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="95870261"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208,223";a="95870261"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 22:22:54 -0800
X-CSE-ConnectionGUID: QqbfpG61TISHTpxTlDuJGg==
X-CSE-MsgGUID: EJHjsrkgS2i4M9PHIHYtXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
 d="scan'208,223";a="247327014"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by orviesa002.jf.intel.com with ESMTP; 26 Feb 2026 22:22:52 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t] tests/intel/kms_big_fb: Skip 90/270 rotation on Display
 Ver >= 13
Date: Fri, 27 Feb 2026 12:03:33 +0530
Message-Id: <20260227063333.2044616-1-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
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

From Display Ver 13, 90/270 hardware rotation no longer
supported. Skip these tests on affected platforms. Also move
plane capability checks to the outer loop to continue testing
other planes.

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/intel/kms_big_fb.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
index 66d7c5428..171b38602 100644
--- a/tests/intel/kms_big_fb.c
+++ b/tests/intel/kms_big_fb.c
@@ -172,6 +172,7 @@ typedef struct {
 	int hw_stride;
 	int max_hw_fb_width;
 	double planeclearrgb[3];
+	int disp_ver;
 } data_t;
 
 static struct intel_buf *init_buf(data_t *data,
@@ -422,12 +423,6 @@ static bool test_plane(data_t *data)
 		{ w, h, },
 	};
 
-	if (!igt_plane_has_format_mod(plane, data->format, data->modifier))
-		return false;
-
-	if (!igt_plane_has_rotation(plane, data->rotation))
-		return false;
-
 	if (igt_plane_has_prop(plane, IGT_PLANE_ROTATION))
 		igt_plane_set_rotation(plane, data->rotation);
 	igt_plane_set_position(plane, 0, 0);
@@ -570,6 +565,10 @@ static bool test_pipe(data_t *data)
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 
 	for_each_plane_on_pipe(&data->display, data->crtc->pipe, data->plane) {
+		if (!igt_plane_has_rotation(data->plane, data->rotation))
+			continue;
+		if (!igt_plane_has_format_mod(data->plane, data->format, data->modifier))
+			continue;
 		ret = test_plane(data);
 		if (ret || run_in_simulation)
 			break;
@@ -688,6 +687,9 @@ static void test_scanout(data_t *data)
 	igt_crtc_t *crtc;
 	igt_output_t *output;
 
+	if (igt_rotation_90_or_270(data->rotation))
+		igt_require_f(data->disp_ver < 13, "90/270 rotation not supported by platform\n");
+
 	igt_require(data->format == DRM_FORMAT_C8 ||
 		    igt_fb_supported_format(data->format));
 
@@ -983,6 +985,7 @@ int igt_main()
 		igt_require(is_intel_device(data.drm_fd));
 
 		data.devid = intel_get_drm_devid(data.drm_fd);
+		data.disp_ver = intel_display_ver(data.devid);
 
 		kmstest_set_vt_graphics_mode();
 
-- 
2.34.1

