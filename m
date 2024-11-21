Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B4C0D6ED19
	for <igt-dev@archiver.kernel.org>; Thu, 21 Nov 2024 12:41:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE7A610E403;
	Thu, 21 Nov 2024 12:41:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eMJO9ZR5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB1AD10E403
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Nov 2024 12:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732192911; x=1763728911;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6YEAMgVG58OuzFECxz3bFSa2VBNNwVcrSXarHL2yTIQ=;
 b=eMJO9ZR5gZ6u8/6JPZQTtmNyiUqJbMMrR37gWCpcmyuf/Oc9qKx9WVeL
 /HfIt3jEpD/mPkmQ5WUDV4XUI+WYyKCo0PEJ7Exq7YeZgvNSzMe2Z2vGU
 8fNwd08fxIeVe4LuaRVCPM+SFvlK91RJu9xtp2OJ0WYd0XehR+o1lxmSS
 VI5J3KbO+lSW9CMR16gHfAqSg3gv7quxa43KrEXSosbgahLjHnNqasdvZ
 Lx2/Hf924GRiZXoHrtGgAjmI++heazbLWYMpwScXmh3u0p7QUdcSn+x1t
 9e+aRspaVA/HlVHBsIvdtuadEiQORRO9a/t05jtu77USMtKMVCwHs3fOP w==;
X-CSE-ConnectionGUID: lPaG6MwiSTCS52iXf70UOQ==
X-CSE-MsgGUID: +HgP1y7vRgeTTe7Ac2v5Qg==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="32050820"
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="32050820"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 04:41:47 -0800
X-CSE-ConnectionGUID: 8o2sLhusTnuCkXRBK1IuoQ==
X-CSE-MsgGUID: RXY1m7lvRAqP1rajbCK1Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="121104645"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by orviesa002.jf.intel.com with ESMTP; 21 Nov 2024 04:41:45 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t] tests/kms_plane:Add more logs to skips/failure
Date: Thu, 21 Nov 2024 18:12:14 +0530
Message-Id: <20241121124214.1929042-1-pranay.samala@intel.com>
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

Having some logs for test failures and skips would
make debugging much easier.

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/kms_plane.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 77a669dc5..383149564 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -293,8 +293,11 @@ test_plane_position_with_output(data_t *data,
 	create_fb_for_mode(data, mode, &green, &rect, 1, &primary_fb);
 	igt_plane_set_fb(primary, &primary_fb);
 
-	if (!igt_plane_has_format_mod(sprite, DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR))
+	if (!igt_plane_has_format_mod(sprite, DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR)) {
+		igt_info("plane-%d does not supports XRGB format and Linear modifier\n",
+			 sprite->index);
 		return;
+	}
 
 	igt_create_color_fb(data->drm_fd,
 			    64, 64, /* width, height */
@@ -493,7 +496,7 @@ test_plane_panning(data_t *data, enum pipe pipe)
 		mode_found = true;
 		break;
 	}
-	igt_require(mode_found);
+	igt_require_f(mode_found, "All connector modes are skipped due to low memory\n");
 
 	if (data->flags & TEST_PANNING_TOP_LEFT)
 		test_grab_crc(data, output, pipe, &red, data->flags, &ref_crc);
@@ -1263,13 +1266,14 @@ static void test_planar_settings(data_t *data)
 	 * If here is added non-intel tests below require will need to be
 	 * changed to if(..)
 	 */
-	igt_require(data->display.is_atomic);
+	igt_require_f(data->display.is_atomic, "Atomic mode-set not supported\n");
 	igt_require_intel(data->drm_fd);
 	devid = intel_get_drm_devid(data->drm_fd);
-	igt_require(intel_display_ver(devid) >= 9);
+	igt_require_f(intel_display_ver(devid) >= 9, "Requires Intel display version 9 or above\n");
 
 	output = igt_get_single_output_for_pipe(&data->display, pipe);
-	igt_require(output);
+	igt_require_f(output, "Output-%s is not compatible with pipe-%s\n",
+		      data->output->name, kmstest_pipe_name(pipe));
 
 	igt_output_set_pipe(output, pipe);
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
-- 
2.34.1

