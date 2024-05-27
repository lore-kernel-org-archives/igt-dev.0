Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0447C25B78
	for <igt-dev@archiver.kernel.org>; Mon, 27 May 2024 07:34:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E76D610E472;
	Mon, 27 May 2024 07:34:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lNmx+Jy4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBF0210F921
 for <igt-dev@lists.freedesktop.org>; Mon, 27 May 2024 07:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716795284; x=1748331284;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PRCZvPbZDACbsWq+DMhmfFH2A8DGmgR7sZSv1ULeZ+w=;
 b=lNmx+Jy49guroOuYdgNrYI+ZVCKPhz2kg4T14/9gNWULLLC0nDJ+K/C7
 aFE60G7vXUNkIS3sO74eCZ3cUg/i1oCTsybCuLk8Zpf3YRh7bAahPJl22
 PyQ93fT4KOsKdF3cZH40dMkVKCZQLMjqSgyZauCSAOYrIyBBYp/KISbzl
 bV+Di8MDeF0lsz/FagnhR+dqjDssY35n9rqyerPfu9YIfbWDbPYBpZfO6
 SC4ONxxeqq0u2jUoIGLQP3Jko6B4DBraSc5wsuEDD+303Fh/h0XdMIiwx
 lwKTpB5QCULSB3mUZvKF+/SUeNeT0SFXPBaj2AEyEneeAnEE0sILsu9V3 w==;
X-CSE-ConnectionGUID: gsPO1vtpQPegNIZcHs4Hkw==
X-CSE-MsgGUID: Qdg9jkFgRxWEFRy8IY4tRw==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="24225322"
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="24225322"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 00:34:44 -0700
X-CSE-ConnectionGUID: q2yQHQdGSCCYdaHDtzWS2A==
X-CSE-MsgGUID: QdjUkUxTSqavODomC9a61g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="34584533"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.184])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 00:34:42 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 10/12] lib/intel_bufops: Drop Tile4 swizzling
Date: Mon, 27 May 2024 09:33:43 +0200
Message-Id: <20240527073345.54729-11-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240527073345.54729-1-zbigniew.kempczynski@intel.com>
References: <20240527073345.54729-1-zbigniew.kempczynski@intel.com>
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

Swizzling is used only on older platforms and for X and Y tilings.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/intel_bufops.c | 38 +++++++-------------------------------
 1 file changed, 7 insertions(+), 31 deletions(-)

diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
index eb367be2f3..d0f6ab481f 100644
--- a/lib/intel_bufops.c
+++ b/lib/intel_bufops.c
@@ -121,7 +121,6 @@ struct buf_ops {
 	uint32_t supported_hw_tiles;
 	uint32_t swizzle_x;
 	uint32_t swizzle_y;
-	uint32_t swizzle_tile4;
 	bo_copy linear_to;
 	bo_copy linear_to_x;
 	bo_copy linear_to_y;
@@ -654,7 +653,7 @@ static void copy_linear_to_tile4(struct buf_ops *bops, struct intel_buf *buf,
 				 uint32_t *linear)
 {
 	DEBUGFN();
-	__copy_linear_to(bops->fd, buf, linear, I915_TILING_4, bops->swizzle_tile4);
+	__copy_linear_to(bops->fd, buf, linear, I915_TILING_4, 0);
 }
 
 static void __copy_to_linear(int fd, struct intel_buf *buf,
@@ -1531,7 +1530,7 @@ void intel_buf_draw_pattern(struct buf_ops *bops, struct intel_buf *buf,
 #define DEFAULT_BUFOPS(__gen_start, __gen_end) \
 	.gen_start          = __gen_start, \
 	.gen_end            = __gen_end, \
-	.supported_hw_tiles = TILE_X | TILE_Y | TILE_4, \
+	.supported_hw_tiles = TILE_X | TILE_Y, \
 	.linear_to          = copy_linear_to_wc, \
 	.linear_to_x        = copy_linear_to_gtt, \
 	.linear_to_y        = copy_linear_to_gtt, \
@@ -1586,8 +1585,6 @@ static bool probe_hw_tiling(struct buf_ops *bops, uint32_t tiling,
 			bops->swizzle_x = buf_swizzle;
 		else if (tiling == I915_TILING_Y)
 			bops->swizzle_y = buf_swizzle;
-		else if (tiling == I915_TILING_4)
-			bops->swizzle_tile4 = buf_swizzle;
 
 		*swizzling_supported = buf_swizzle == phys_swizzle;
 	}
@@ -1754,36 +1751,15 @@ static struct buf_ops *__buf_ops_create(int fd, bool check_idempotency)
 		}
 	}
 
-	if (is_hw_tiling_supported(bops, I915_TILING_4)) {
-		bool swizzling_supported;
-		bool supported = probe_hw_tiling(bops, I915_TILING_4,
-						 &swizzling_supported);
-
-		if (!swizzling_supported) {
-			igt_debug("Swizzling for 4 is not supported\n");
-			bops->supported_tiles &= ~TILE_4;
-		}
-
-		igt_debug("4 fence support: %s\n", bool_str(supported));
-		if (!supported) {
-			bops->supported_hw_tiles &= ~TILE_4;
-			bops->linear_to_tile4 = copy_linear_to_tile4;
-			bops->tile4_to_linear = copy_tile4_to_linear;
-		}
-	}
-
 	/* Disable other tiling format functions if not supported */
-	if (!is_tiling_supported(bops, I915_TILING_Yf)) {
+	if (!is_tiling_supported(bops, I915_TILING_Yf))
 		igt_debug("Yf format not supported\n");
-		bops->linear_to_yf = NULL;
-		bops->yf_to_linear = NULL;
-	}
 
-	if (!is_tiling_supported(bops, I915_TILING_Ys)) {
+	if (!is_tiling_supported(bops, I915_TILING_Ys))
 		igt_debug("Ys format not supported\n");
-		bops->linear_to_ys = NULL;
-		bops->ys_to_linear = NULL;
-	}
+
+	if (!is_tiling_supported(bops, I915_TILING_4))
+		igt_debug("Tile4 format not supported\n");
 
 	if (check_idempotency) {
 		idempotency_selftest(bops, I915_TILING_X);
-- 
2.34.1

