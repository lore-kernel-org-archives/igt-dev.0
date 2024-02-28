Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 510B4C5478C
	for <igt-dev@archiver.kernel.org>; Wed, 28 Feb 2024 14:54:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4E1410E9F5;
	Wed, 28 Feb 2024 14:54:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kFO2K1zQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FA1610E9F5
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Feb 2024 14:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709132075; x=1740668075;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X2zhGXBkPKiGn6Fy1k34kQqzAymG2yViqkhYJcANv+4=;
 b=kFO2K1zQ8VbdqZopKC9NnUePPQmVEBtqOx2d9m1h5mHUz6LDUplA03sC
 W3foXAQE8m0JWJaeuj6D0X7zjGH1fymvlJJ2HNCkw2q9PgPnjm4eM/of/
 XV0uqaNGk7yAB3mPrIp6K3QyXo7CGB9ETF23wg8+jeYKEQiNk6bnEvprr
 A5pwDTI8WtjDiiKY0U4SpgC3RZs/CAMXL2NE/Ldhvktiyny4DUCYQQIku
 uQOMXIXhBeDGgGpVWVEJQO0r8HjHnphLXRmyvc7mVJZAmjrnqWmKJhrOB
 DV/sU2z2ICRcwbpflIMHm99vnNiLTrBXq6PfdKpxMePZX200T9qO3OSiB w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="14952548"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; d="scan'208";a="14952548"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 06:54:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; d="scan'208";a="12121193"
Received: from wbosek-mobl.ger.corp.intel.com (HELO localhost) ([10.245.80.56])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 06:54:32 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH i-g-t 4/7] lib/intel_bufops: Simplify buffer dimension
 calculations
Date: Wed, 28 Feb 2024 15:54:04 +0100
Message-Id: <20240228145407.370325-5-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240228145407.370325-1-zbigniew.kempczynski@intel.com>
References: <20240228145407.370325-1-zbigniew.kempczynski@intel.com>
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

When caller wants to create a buffer in the library it doesn't
care about hardware requirements of stride and height.
Lets simplify calculation and use aligned stride and height
according to buffer tiling type.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
---
 lib/intel_bufops.c | 94 +++++++++++++++++++++++++---------------------
 1 file changed, 52 insertions(+), 42 deletions(-)

diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
index 9d3d17def9..ca026f7956 100644
--- a/lib/intel_bufops.c
+++ b/lib/intel_bufops.c
@@ -813,6 +813,43 @@ void linear_to_intel_buf(struct buf_ops *bops, struct intel_buf *buf,
 		__copy_ccs(bops, buf, linear, CCS_LINEAR_TO_BUF);
 }
 
+static uint32_t __get_min_stride(uint32_t width, uint32_t bpp, int tiling)
+{
+	switch (tiling) {
+	case I915_TILING_NONE:
+		return width * bpp / 8;
+	case I915_TILING_X:
+		return ALIGN(width * bpp / 8, 512);
+	case I915_TILING_64:
+		if (bpp == 8)
+			return ALIGN(width, 256);
+		else if (bpp == 16 || bpp == 32)
+			return ALIGN(width * bpp / 8, 512);
+		return ALIGN(width * bpp / 8, 1024);
+
+	default:
+		return ALIGN(width * bpp / 8, 128);
+	}
+}
+
+static uint32_t __get_aligned_height(uint32_t height, uint32_t bpp, int tiling)
+{
+	switch (tiling) {
+	case I915_TILING_NONE:
+		return height;
+	case I915_TILING_X:
+		return ALIGN(height, 8);
+	case I915_TILING_64:
+		if (bpp == 8)
+			return ALIGN(height, 256);
+		else if (bpp == 16 || bpp == 32)
+			return ALIGN(height, 128);
+		return ALIGN(height, 64);
+	default:
+		return ALIGN(height, 32);
+	}
+}
+
 static void __intel_buf_init(struct buf_ops *bops,
 			     uint32_t handle,
 			     struct intel_buf *buf,
@@ -823,9 +860,7 @@ static void __intel_buf_init(struct buf_ops *bops,
 {
 	uint32_t tiling = req_tiling;
 	uint64_t size;
-	uint32_t devid;
-	int tile_width;
-	int align_h = 1;
+	int tile_width, aligned_height;
 
 	igt_assert(bops);
 	igt_assert(buf);
@@ -838,11 +873,23 @@ static void __intel_buf_init(struct buf_ops *bops,
 	buf->bops = bops;
 	buf->width = width;
 	buf->height = height;
+	buf->tiling = tiling;
+	buf->bpp = bpp;
+	buf->compression = compression;
 	buf->addr.offset = INTEL_BUF_INVALID_ADDRESS;
-	IGT_INIT_LIST_HEAD(&buf->link);
 	buf->mocs = INTEL_BUF_MOCS_DEFAULT;
-
 	buf->pat_index = pat_index;
+	IGT_INIT_LIST_HEAD(&buf->link);
+
+	tile_width = __get_min_stride(width, bpp, tiling);
+	aligned_height = __get_aligned_height(height, bpp, tiling);
+
+	if (bo_stride)
+		buf->surface[0].stride = bo_stride;
+	else
+		buf->surface[0].stride = tile_width;
+
+	size = buf->surface[0].size = buf->surface[0].stride * aligned_height;
 
 	if (compression) {
 		igt_require(bops->intel_gen >= 9);
@@ -855,20 +902,6 @@ static void __intel_buf_init(struct buf_ops *bops,
 		 * CCS units, that is 4 * 64 bytes. These 4 CCS units are in
 		 * turn mapped by one L1 AUX page table entry.
 		 */
-		if (bo_stride)
-			buf->surface[0].stride = bo_stride;
-		else if (bops->intel_gen >= 12)
-			buf->surface[0].stride = ALIGN(width * (bpp / 8), 128 * 4);
-		else
-			buf->surface[0].stride = ALIGN(width * (bpp / 8), 128);
-
-		if (bops->intel_gen >= 12)
-			height = ALIGN(height, 32);
-
-		buf->surface[0].size = buf->surface[0].stride * height;
-		buf->tiling = tiling;
-		buf->bpp = bpp;
-		buf->compression = compression;
 
 		if (!HAS_FLATCCS(intel_get_drm_devid(bops->fd))) {
 			int aux_width, aux_height;
@@ -879,30 +912,7 @@ static void __intel_buf_init(struct buf_ops *bops,
 			buf->ccs[0].offset = buf->surface[0].stride * ALIGN(height, 32);
 			buf->ccs[0].stride = aux_width;
 			size = buf->ccs[0].offset + aux_width * aux_height;
-		} else {
-			size = buf->ccs[0].offset;
 		}
-	} else {
-		if (tiling) {
-			devid =  intel_get_drm_devid(bops->fd);
-			tile_width = get_stride(devid, tiling);
-			if (bo_stride)
-				buf->surface[0].stride = bo_stride;
-			else
-				buf->surface[0].stride = ALIGN(width * (bpp / 8), tile_width);
-			align_h = tiling == I915_TILING_X ? 8 : 32;
-		} else {
-			if (bo_stride)
-				buf->surface[0].stride = bo_stride;
-			else
-				buf->surface[0].stride = ALIGN(width * (bpp / 8), alignment ?: 1);
-		}
-
-		buf->surface[0].size = buf->surface[0].stride * height;
-		buf->tiling = tiling;
-		buf->bpp = bpp;
-
-		size = buf->surface[0].stride * ALIGN(height, align_h);
 	}
 
 	/* Store buffer size to avoid mistakes in calculating it again */
-- 
2.34.1

