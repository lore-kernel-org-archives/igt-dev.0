Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07529C5475B
	for <igt-dev@archiver.kernel.org>; Wed,  6 Mar 2024 15:02:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5479113266;
	Wed,  6 Mar 2024 15:02:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oGwQT4jN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67CE2113266
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Mar 2024 15:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709737365; x=1741273365;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tTf3qmNYvEm4PCwjNWnH+LXpC3CO/xFioRC4Fa5rbZo=;
 b=oGwQT4jNsLi9oXYIQvmSAId+Emd3lGuIpiyrR0XVfxT8irVoLm6eDoqr
 XWc1wLNTJMU5XcF5ifMSPDImvt3m6EYYuGfLSxB9zRetNgqY9lLqjNvKI
 msunlT18/UB+eAvWQBIgqM3zwNEYRRdu8pvSJ072LQUYjG1+t9HEcQO8o
 Jgw/iEhu5vrjtGMTCgqznp1pYphhceEtV85tK9ElXllw3uj+R7mug9WdR
 ZF2xL1YgwOTO58kByZO+5omLz4jx2wc7l7u9s0g6Vh/mdGcDkyBT22aTe
 RlxyBzttf2clfmp4E5m+ftbgB8WNT7Xzxrcn0uZ1JX0XR1Hw1IQ8t0yyf w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="4284122"
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; 
   d="scan'208";a="4284122"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 07:02:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; d="scan'208";a="32929543"
Received: from unknown (HELO localhost) ([10.245.244.139])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 07:02:36 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH i-g-t v2 3/4] lib/rendercopy_gen9: Add Tile64 support for
 render-copy
Date: Wed,  6 Mar 2024 16:02:18 +0100
Message-Id: <20240306150219.301977-4-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240306150219.301977-1-zbigniew.kempczynski@intel.com>
References: <20240306150219.301977-1-zbigniew.kempczynski@intel.com>
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

Refactor a bit handling different tilings in render-copy pipeline
and add Tile64 which I want to exercise in xe_render_copy test.

Cc: Matthew Auld <matthew.auld@intel.com>
Acked-by: Matthew Auld <matthew.auld@intel.com>
Link: https://lore.kernel.org/r/20240305054056.139691-4-zbigniew.kempczynski@intel.com
Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/rendercopy_gen9.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
index efd7cb37c1..2b66e15ee6 100644
--- a/lib/rendercopy_gen9.c
+++ b/lib/rendercopy_gen9.c
@@ -191,19 +191,29 @@ gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
 		ss->ss5.mip_tail_start_lod = 1; /* needed with trmode */
 	}
 
-	if (buf->tiling == I915_TILING_X)
+	switch (buf->tiling) {
+	case I915_TILING_NONE:
+		ss->ss0.tiled_mode = 0;
+		break;
+	case I915_TILING_X:
 		ss->ss0.tiled_mode = 2;
-	else if (buf->tiling != I915_TILING_NONE)
+		break;
+	case I915_TILING_64:
+		ss->ss0.tiled_mode = 1;
+		ss->ss5.mip_tail_start_lod = 0xf;
+		break;
+	default:
 		ss->ss0.tiled_mode = 3;
+		if (buf->tiling == I915_TILING_Yf)
+			ss->ss5.trmode = 1;
+		else if (buf->tiling == I915_TILING_Ys)
+			ss->ss5.trmode = 2;
+		break;
+	}
 
 	if (intel_buf_pxp(buf))
 		ss->ss1.pxp = 1;
 
-	if (buf->tiling == I915_TILING_Yf)
-		ss->ss5.trmode = 1;
-	else if (buf->tiling == I915_TILING_Ys)
-		ss->ss5.trmode = 2;
-
 	address = intel_bb_offset_reloc(ibb, buf->handle,
 					read_domain, write_domain,
 					intel_bb_offset(ibb) + 4 * 8,
-- 
2.34.1

