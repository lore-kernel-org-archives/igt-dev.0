Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F7EACAC5AE
	for <igt-dev@archiver.kernel.org>; Wed, 24 Sep 2025 14:28:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5165A10E22F;
	Wed, 24 Sep 2025 14:28:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="So/zseI1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95B7010E22F
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Sep 2025 14:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758724113; x=1790260113;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uxV7hhm7Fbm22vBrUSrpdijYH1gRBSANR5G+nmMpehc=;
 b=So/zseI1lcTS6iImjaWT66qgTwSpP0LZk7OmBucG1mxjQ6ZjcvJe387K
 fWu/xkNku36iuQxYkamgnaj5f+vtDT1nNC32sMv/6wbIDcyPb3kKHQPsA
 DJJXw12Beg5Cy4o+JcHemZn/ca23kp7UeyD18Wp1oVODyKZqFilBEwDML
 DdkqVLMi165IXawPeXTU53BdCmo02bEerOw8iJ4Tz2YaGnGLTxEiyK3GM
 TMdY0n43x9iLc+nwQesHh4BOqaekjbE8jUGhhQMp/+f4JHuufOaBExHIQ
 FXKxLvuOmLFpXY2fgzLWAGHWfq2Dm0k6hnx81hpOcW8owq21GgjabLixG w==;
X-CSE-ConnectionGUID: DM2VG32JSMSKLCe1OvJN5Q==
X-CSE-MsgGUID: FXwvjK+TQAW5qWLwKJBfpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="78461355"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="78461355"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 07:28:32 -0700
X-CSE-ConnectionGUID: 7ElPdD/MRPabL98In4e4Sw==
X-CSE-MsgGUID: VCxg8TcuSNizthll++Z4iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="207973162"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by fmviesa001.fm.intel.com with ESMTP; 24 Sep 2025 07:28:32 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH i-g-t] tests/kms_plane: Add test to validate odd panning
Date: Wed, 24 Sep 2025 19:53:13 +0530
Message-Id: <20250924142313.4092036-1-nemesa.garg@intel.com>
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

This feature creates a NV12 plane having two framebuffers
and moving it to odd position and then do continuous flip
along with the change in the width of framebuffer.
This is to check whether panning at odd position is
supported or not.

v2: Add test in kms_plane.[Swati]
v3: Remove extra parameters[Pranay]
v4: Add check for modifier
v5: Adding the break condition
v6: Change the fb size
v7: Make it a part of planar_seeting[JP]

Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
---
 tests/kms_plane.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index d08ec81e4..c25700228 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -1313,6 +1313,25 @@ static void test_planar_settings(data_t *data)
 	} else {
 		igt_debug("Odd height NV12 framebuffer test skipped\n");
 	}
+
+	/* test against intel_plane_check_src_coordinates() in i915 */
+	if (igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
+                                     DRM_FORMAT_MOD_LINEAR)) {
+                int expected_rval = -EINVAL;
+
+		igt_create_fb(data->drm_fd, 810, 590,
+			      DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR, &fb);
+		igt_plane_set_fb(primary, &fb);
+		igt_plane_set_size(primary, 810, 590);
+		igt_plane_set_position(primary, -501, 200);
+		rval = igt_display_try_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET |
+						     DRM_MODE_ATOMIC_TEST_ONLY, NULL);
+
+		igt_remove_fb(data->drm_fd, &fb);
+                igt_assert_f(rval == expected_rval, "Odd horizontal pan NV12 framebuffer\n");
+	} else {
+                igt_debug("Odd horizontal pan NV12 framebuffer test skipped\n");
+        }
 }
 
 static bool is_pipe_limit_reached(int count)
-- 
2.25.1

