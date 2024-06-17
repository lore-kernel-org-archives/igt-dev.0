Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 118C5C27C6E
	for <igt-dev@archiver.kernel.org>; Mon, 17 Jun 2024 09:11:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC9EA10E309;
	Mon, 17 Jun 2024 09:11:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PdQo9jzL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92BE810E319
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Jun 2024 09:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718615460; x=1750151460;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FGRv8TRu4U7V+06sW0tP5s06QpH1OSP+IHllDFW4fXQ=;
 b=PdQo9jzLoeGJQxyzRkp6MNExKLH+1xO3s1VIpUfliODCTg8N7hdxRtzi
 05C6msmtXjIxGK70c7qHqBk18ZzcCAXqAPGQ0FNdNAhJxU3yW+skOrsCW
 NJxxCRpxymw8NDhOWN77NTYGA6aJ/25cuK/Q81PTdH3iRSQ2p0cM33SJv
 o8bcDEobVFDcejoblk/tEYCMEVPT6L4ISzbJ+DYQS5L74hVUnSB8QJrMe
 lPR7waz/xtHN05pqrRYTA5aIU+eh8ZvS++a+v7W1gJHcNthHWuYcXKdiA
 wP4ICUCz+ReHbC11U5DJAbm4iGdIlmRgMogEOHNSbamsjpo/Byd4DGnvD w==;
X-CSE-ConnectionGUID: sZQu0ZjbQ/inMsJzx9ncYQ==
X-CSE-MsgGUID: Ai9GkokvS7qNvzmIuX7JEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="12106305"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; d="scan'208";a="12106305"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 02:10:59 -0700
X-CSE-ConnectionGUID: E9tXjQOCQJ+bVU7EKbl6DQ==
X-CSE-MsgGUID: wP+0rlXURomv0392POrBzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; d="scan'208";a="46251744"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.58])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 02:10:58 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t] tests/api_intel_bb: Fix render-ccs subtest hang on DG2
Date: Mon, 17 Jun 2024 11:10:54 +0200
Message-Id: <20240617091054.63602-1-zbigniew.kempczynski@intel.com>
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
 tests/intel/api_intel_bb.c | 44 ++++++++++++++++++++++++--------------
 1 file changed, 28 insertions(+), 16 deletions(-)

diff --git a/tests/intel/api_intel_bb.c b/tests/intel/api_intel_bb.c
index 4158fa06c8..6781c542fd 100644
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
@@ -896,7 +901,9 @@ static int compare_bufs(struct intel_buf *buf1, struct intel_buf *buf2,
 	void *ptr1, *ptr2;
 	int fd1, fd2, ret;
 
-	igt_assert(buf1->surface[0].size == buf2->surface[0].size);
+	/* compare only buffers which size matches */
+	if (buf1->surface[0].size != buf2->surface[0].size)
+		return 0;
 
 	fd1 = buf_ops_get_fd(buf1->bops);
 	fd2 = buf_ops_get_fd(buf2->bops);
@@ -1419,6 +1426,7 @@ static void render_ccs(struct buf_ops *bops)
 	uint32_t compressed = 0;
 	uint32_t devid = intel_get_drm_devid(i915);
 	igt_render_copyfunc_t render_copy = NULL;
+	int tiling = IS_DG2(devid) ? I915_TILING_4 : I915_TILING_Y;
 
 	ibb = intel_bb_create(i915, PAGE_SIZE);
 	if (debug_bb)
@@ -1426,9 +1434,9 @@ static void render_ccs(struct buf_ops *bops)
 
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
@@ -1459,21 +1467,25 @@ static void render_ccs(struct buf_ops *bops)
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

