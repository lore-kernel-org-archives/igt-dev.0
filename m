Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 041E7C5478C
	for <igt-dev@archiver.kernel.org>; Tue,  5 Mar 2024 05:41:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89909112711;
	Tue,  5 Mar 2024 05:41:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AUcqRfin";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17598112713
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Mar 2024 05:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709617285; x=1741153285;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8VArSvl9sALCV+GFfJ7LRppE7G6yg3i8FEttKBSZCn8=;
 b=AUcqRfinvgRJRf0QJIYWLpkRWdMWGMxfrKbM3Pul/21lWEHyKO4kcoxf
 FxgkQFQ3XA8dmtgOfRkyFbbkvyQGLXdMnoWVWGRnf9a6LmB0+eAfAqCQE
 pqqWL2tsy6NgpieGXR0P076N1Ki6+vrq8le5ce/HsobjcBCRZBcKAyd2m
 3zVKv5dClyYn4DQPwpl89D8b0hFf9rKRUU81G2og8XMLRSPiIepIwU6Ju
 DRq1whzKDTVyIB+S/ZgMzsaZedInLI7spBBrfSrniLrA2qhk+wPEAFWGB
 xeaegtCdhgFL/lP7q6sYnxSMOd1ZsqxNXi0LeJ3IXDxg9d3dO6k6T1kqF g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="14729425"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; d="scan'208";a="14729425"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 21:41:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="9325556"
Received: from unknown (HELO localhost) ([10.245.244.112])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 21:41:23 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH i-g-t 3/4] lib/rendercopy_gen9: Add Tile64 support for
 render-copy
Date: Tue,  5 Mar 2024 06:40:55 +0100
Message-Id: <20240305054056.139691-4-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240305054056.139691-1-zbigniew.kempczynski@intel.com>
References: <20240305054056.139691-1-zbigniew.kempczynski@intel.com>
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

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
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

