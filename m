Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCB86D609D7
	for <igt-dev@archiver.kernel.org>; Tue, 16 Dec 2025 18:45:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75C4A10E049;
	Tue, 16 Dec 2025 18:45:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JcJF+nhg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD6DA10E2DD
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Dec 2025 18:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765910712; x=1797446712;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lUUiXNIfPAtfrrY+JeYqvlaKO3iC3f96EK9vGMQadC0=;
 b=JcJF+nhgAmZMnSnmuE2/U2B/H+CxMqElla+Gnk+/Axam7QeV+Tk3StgD
 Drt9e/uyWH8Y0PC3/W30wYXdj/cALs0ocdOT5o6X42KJF2kifgYFWvNFQ
 QaBtX0WYXJolaFW2depT1q/o8FzTrC1k5PZUzVsvt9+5GbSGVx3dgyD15
 G9+OjFQT/9CDICBFFZMVuN4aKHHLFT1qoQYU4oQagIc7dutG1xqwz4T+H
 Rw2Ytgbdtj8zS45gsg4a0TykyKKMhHIsoiBDzsfy4eEU1mFqUSf2kDF26
 O3080i/WK5ifpiCka/VDgVhmrVgD5KKH9OA8mk1V3raQdf1r5evwpzCkS A==;
X-CSE-ConnectionGUID: qKcEvfEIRFGGO1WY8ObFVQ==
X-CSE-MsgGUID: +wlCuFiEQXG0eP+ac1RcwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="70416023"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; d="scan'208";a="70416023"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 10:45:11 -0800
X-CSE-ConnectionGUID: C4B0m9Q0TPCgFVFefmUxUw==
X-CSE-MsgGUID: 3vJSTxMCQ0OBfpfnAiYvKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; d="scan'208";a="198148599"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 10:45:11 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
Subject: [PATCH i-g-t 1/7] tests/intel/kms_big_fb: NVL supports horizontal
 flip with linear surfaces
Date: Wed, 17 Dec 2025 00:22:09 +0530
Message-Id: <20251216185215.1281390-2-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251216185215.1281390-1-swati2.sharma@intel.com>
References: <20251216185215.1281390-1-swati2.sharma@intel.com>
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

From: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>

Starting NVL (display version 35), horizontal flip is supported with
linear surfaces, thus don't skip that case.

Signed-off-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
---
 tests/intel/kms_big_fb.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
index 686c6772e..2e30dff4a 100644
--- a/tests/intel/kms_big_fb.c
+++ b/tests/intel/kms_big_fb.c
@@ -82,23 +82,24 @@
  *              of %arg[1] modifier with max hardware stride length, %arg[2]-bpp,
  *              and %arg[3]-rotation
  *
+ * SUBTEST: %s-max-hw-stride-%dbpp-rotate-%d-hflip
+ * Description: Test maximum hardware supported stride length for given combination
+ *              of %arg[1] modifier with max hardware stride length, %arg[2]-bpp,
+ *              and %arg[3]-rotation with H-flip mode
+ *
  * arg[1]:
  *
  * @4-tiled:            TILE-4 modifier
  * @x-tiled:            TILE-X modifier
  * @y-tiled:            TILE-Y modifier
  * @yf-tiled:           TILE-YF modifier
+ * @linear:             LINEAR modifier
  *
  * arg[2].values:       32, 64
  * arg[3].values:       0, 180
  */
 
 /**
- * SUBTEST: %s-max-hw-stride-%dbpp-rotate-%d-hflip
- * Description: Test maximum hardware supported stride length for given combination
- *              of %arg[1] modifier with max hardware stride length, %arg[2]-bpp,
- *              and %arg[3]-rotation with H-flip mode
- *
  * SUBTEST: %s-max-hw-stride-%dbpp-rotate-%d-%s
  * Description: Test maximum hardware supported stride length for given combination
  *              of %arg[1] modifier with max hardware stride length, %arg[2]-bpp,
@@ -1103,15 +1104,18 @@ int igt_main()
 				for (int k = 0; k < ARRAY_SIZE(rotations); k++) {
 					data.rotation = rotations[k].rotation | fliptab[l].flip;
 
-					// this combination will never happen.
-					if (igt_rotation_90_or_270(data.rotation) ||
-					    (fliptab[l].flip == IGT_REFLECT_X && modifiers[i].modifier == DRM_FORMAT_MOD_LINEAR))
+					if (igt_rotation_90_or_270(data.rotation))
 						continue;
 
 					igt_describe("test maximum hardware supported stride length for given bpp and modifiers.");
 					igt_subtest_f("%s-max-hw-stride-%dbpp-rotate-%d%s", modifiers[i].name,
 						formats[j].bpp, rotations[k].angle, fliptab[l].flipname) {
 						igt_require(intel_display_ver(intel_get_drm_devid(data.drm_fd)) >= 5);
+
+						if(fliptab[l].flip == IGT_REFLECT_X &&
+						   modifiers[i].modifier == DRM_FORMAT_MOD_LINEAR)
+							igt_require(intel_display_ver(data.devid) >= 35);
+
 						data.max_hw_fb_width = min(data.hw_stride / (formats[j].bpp >> 3), data.max_fb_width);
 
 						test_scanout(&data);
-- 
2.25.1

