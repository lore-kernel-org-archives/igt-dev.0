Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38432C27C53
	for <igt-dev@archiver.kernel.org>; Wed, 19 Jun 2024 05:18:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98C0F10E0CE;
	Wed, 19 Jun 2024 05:18:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FDl0L3d5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4DDC10E0CE
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Jun 2024 05:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718774289; x=1750310289;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LBv2Bay0RcXvFtYJQYNop0u8Jv2DsDVXn4/cpLZgFIk=;
 b=FDl0L3d5QZ5IOvIwjxTUgHOVBtmy69je8T7083dO29wQ2NpsVcf4XAON
 yP6I4IGMXfS5qUVWZhHS7ozmgpc+l0V+TSHGgVsPI/mq1cVp2XpCEaE6l
 lNIlQf4LaolNiTeKG/6sswwfPXG+cXCC31j4gL2Co4Te+XS7AHTbpAfM1
 6mjDoxzwSgmaHY/NARRjRi+XNfnlsIlSd9uT4RnKM4lguRuNnjr6dBbdk
 gAPmsB0PmizLVcokpUb0sGFR0fA3+tq1J/JSLsBNh1tmZA50ZslbS4rvs
 dw3/sh9JaerKV3UEHOnAZ499kFkBZyR5xjSsPmzAPH2vvDkToZV+kZxOw w==;
X-CSE-ConnectionGUID: aSTvDa13RWKkc7TeW7w6iQ==
X-CSE-MsgGUID: iPAggZjGQgCr7hYh+T1iFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="15922896"
X-IronPort-AV: E=Sophos;i="6.08,249,1712646000"; d="scan'208";a="15922896"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 22:18:08 -0700
X-CSE-ConnectionGUID: ZLFtEGqgSUuUDzlbCJ9u1w==
X-CSE-MsgGUID: BI9yWn90ThyhYYVpRCrSuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,249,1712646000"; d="scan'208";a="41885615"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.231])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 22:18:07 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t v2] tests/api_intel_bb: Fix render-ccs subtest hang on
 DG2
Date: Wed, 19 Jun 2024 07:18:01 +0200
Message-Id: <20240619051801.229442-1-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Avoid hang by use appropriate compression tiling (Tile4) on DG2.
Compressed surfaces also need to reside in vram for discrete so
adjust this placement either.

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10380
Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/intel/api_intel_bb.c | 40 ++++++++++++++++++++++++--------------
 1 file changed, 25 insertions(+), 15 deletions(-)

diff --git a/tests/intel/api_intel_bb.c b/tests/intel/api_intel_bb.c
index 4158fa06c8..6cb5d4f9e9 100644
--- a/tests/intel/api_intel_bb.c
+++ b/tests/intel/api_intel_bb.c
@@ -849,10 +849,15 @@ static void scratch_buf_init(struct buf_ops *bops,
 			     uint32_t req_tiling,
 			     enum i915_compression compression)
 {
+	int fd = buf_ops_get_fd(bops);
 	int bpp = 32;
+	uint32_t region = REGION_SMEM;
 
-	intel_buf_init(bops, buf, width, height, bpp, 0,
-		       req_tiling, compression);
+	if (compression && gem_has_lmem(fd))
+		region = REGION_LMEM(0);
+
+	intel_buf_init_in_region(bops, buf, width, height, bpp, 0,
+				 req_tiling, compression, region);
 
 	igt_assert(intel_buf_width(buf) == width);
 	igt_assert(intel_buf_height(buf) == height);
@@ -1419,6 +1424,7 @@ static void render_ccs(struct buf_ops *bops)
 	uint32_t compressed = 0;
 	uint32_t devid = intel_get_drm_devid(i915);
 	igt_render_copyfunc_t render_copy = NULL;
+	int tiling = IS_DG2(devid) ? I915_TILING_4 : I915_TILING_Y;
 
 	ibb = intel_bb_create(i915, PAGE_SIZE);
 	if (debug_bb)
@@ -1426,9 +1432,9 @@ static void render_ccs(struct buf_ops *bops)
 
 	scratch_buf_init(bops, &src, width, height, I915_TILING_NONE,
 			 I915_COMPRESSION_NONE);
-	scratch_buf_init(bops, &dst, width, height, I915_TILING_Y,
+	scratch_buf_init(bops, &dst, width, height, tiling,
 			 I915_COMPRESSION_RENDER);
-	scratch_buf_init(bops, &dst2, width, height, I915_TILING_Y,
+	scratch_buf_init(bops, &dst2, width, height, tiling,
 			 I915_COMPRESSION_RENDER);
 	scratch_buf_init(bops, &final, width, height, I915_TILING_NONE,
 			 I915_COMPRESSION_NONE);
@@ -1459,21 +1465,25 @@ static void render_ccs(struct buf_ops *bops)
 		    0, 0);
 
 	intel_bb_sync(ibb);
-
-	fails = compare_bufs(&src, &final, true);
-	compressed = count_compressed(ibb->gen, &dst);
-
 	intel_bb_destroy(ibb);
 
-	igt_debug("fails: %u, compressed: %u\n", fails, compressed);
+	fails = compare_bufs(&src, &final, true);
+	if (!HAS_FLATCCS(devid)) {
+		compressed = count_compressed(ibb->gen, &dst);
+		igt_debug("fails: %u, compressed: %u\n", fails, compressed);
+	} else {
+		igt_debug("fails: %u\n", fails);
+	}
 
 	if (write_png) {
-		intel_buf_write_to_png(&src, "render-ccs-src.png");
-		intel_buf_write_to_png(&dst, "render-ccs-dst.png");
-		intel_buf_write_to_png(&dst2, "render-ccs-dst2.png");
-		intel_buf_write_aux_to_png(&dst, "render-ccs-dst-aux.png");
-		intel_buf_write_aux_to_png(&dst2, "render-ccs-dst2-aux.png");
-		intel_buf_write_to_png(&final, "render-ccs-final.png");
+		intel_buf_raw_write_to_png(&src, "render-ccs-src.png");
+		intel_buf_raw_write_to_png(&dst, "render-ccs-dst.png");
+		intel_buf_raw_write_to_png(&dst2, "render-ccs-dst2.png");
+		intel_buf_raw_write_to_png(&final, "render-ccs-final.png");
+		if (!HAS_FLATCCS(devid)) {
+			intel_buf_write_aux_to_png(&dst, "render-ccs-dst-aux.png");
+			intel_buf_write_aux_to_png(&dst2, "render-ccs-dst2-aux.png");
+		}
 	}
 
 	intel_buf_close(bops, &src);
-- 
2.34.1

