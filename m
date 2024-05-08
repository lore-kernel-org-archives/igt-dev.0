Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B62BC25B5F
	for <igt-dev@archiver.kernel.org>; Wed,  8 May 2024 12:55:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C649F1128C7;
	Wed,  8 May 2024 12:55:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gLCST7iI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C72211128C7
 for <igt-dev@lists.freedesktop.org>; Wed,  8 May 2024 12:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715172900; x=1746708900;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Nv9w8NPLhnmNRhgwpTufWeQpyI+mHRVd+13o1C3UOyI=;
 b=gLCST7iIxodvRD420ALM3NTxsj8gnpRZhE8fT9U14CQWE8sDGr9626O4
 JOCcYiLxu33216yU1l2I3CzDRZakCw5s8Fz4OiO6p00DPsw1to5zTNZCa
 ++3LGMNKdDtsHB4Ic1ov5fWxdt7WGV+G6nsVwqsqcWq1Oeveb1PA2AqKN
 rjpZcerv45vvWUoIc5+CiplKCiGTItY1Ph0oK1xqweUhL2EeatlA1ORFO
 shN+8SFYtDL9vVNNWXTMxz3m8k/WtoOoJwyBUTOOU27uUWh5tmsQBlAeO
 86N7MHNCmyVgHPIXB03HBvdzEKc1YwUDKOOAwplwmAhtPTvziB1kY/DYI A==;
X-CSE-ConnectionGUID: X2YUxCDUQxiYBtlJUe1W1Q==
X-CSE-MsgGUID: kohqRTy3TbqWnbfVOU625Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="10865079"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="10865079"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 05:55:00 -0700
X-CSE-ConnectionGUID: IpJlEVxYTo+I1QdCZAP0mg==
X-CSE-MsgGUID: jFkUhNFjQRqtMR6YBTySFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="33716310"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.90])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 05:54:58 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Karolina Stolarek <karolina.stolarek@intel.com>
Subject: [PATCH i-g-t v4 02/11] lib/intel_blt: Rename confusing fb tile to
 i915 tile
Date: Wed,  8 May 2024 14:54:34 +0200
Message-Id: <20240508125443.404402-3-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240508125443.404402-1-zbigniew.kempczynski@intel.com>
References: <20240508125443.404402-1-zbigniew.kempczynski@intel.com>
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

Fb tile is defacto drm modifier, thus blt_tile_to_fb_tile() name
is confusing as it converts to I915_TILING*, not drm modifier.
Lets rename it.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Reviewed-by: Karolina Stolarek <karolina.stolarek@intel.com>
---
 lib/intel_blt.c              | 4 ++--
 lib/intel_blt.h              | 2 +-
 tests/intel/xe_render_copy.c | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/lib/intel_blt.c b/lib/intel_blt.c
index 4da5cc855e..5a281036c4 100644
--- a/lib/intel_blt.c
+++ b/lib/intel_blt.c
@@ -536,14 +536,14 @@ static int __block_tiling(enum blt_tiling_type tiling)
 }
 
 /**
- * blt_tile_to_fb_tile:
+ * blt_tile_to_i915_tile:
  * @tiling: tiling id
  *
  * Returns:
  * id of tiling introduced in i915 like I915_TILING_* used for example
  * in render-copy code.
  */
-int blt_tile_to_fb_tile(enum blt_tiling_type tiling)
+int blt_tile_to_i915_tile(enum blt_tiling_type tiling)
 {
 	switch (tiling) {
 	case T_LINEAR: return I915_TILING_NONE;
diff --git a/lib/intel_blt.h b/lib/intel_blt.h
index cc59666862..fcfce69bee 100644
--- a/lib/intel_blt.h
+++ b/lib/intel_blt.h
@@ -213,7 +213,7 @@ bool blt_platform_has_flat_ccs_enabled(int fd);
 bool blt_uses_extended_block_copy(int fd);
 
 const char *blt_tiling_name(enum blt_tiling_type tiling);
-int blt_tile_to_fb_tile(enum blt_tiling_type tiling);
+int blt_tile_to_i915_tile(enum blt_tiling_type tiling);
 
 uint32_t blt_get_min_stride(uint32_t width, uint32_t bpp,
 			    enum blt_tiling_type tiling);
diff --git a/tests/intel/xe_render_copy.c b/tests/intel/xe_render_copy.c
index 4f98cb7dfa..ef75c4ce6d 100644
--- a/tests/intel/xe_render_copy.c
+++ b/tests/intel/xe_render_copy.c
@@ -407,7 +407,7 @@ igt_main_args("dpiW:H:", NULL, help_str, opt_handler, NULL)
 					continue;
 
 				tiling_name = blt_tiling_name(tiling);
-				tiling = blt_tile_to_fb_tile(tiling);
+				tiling = blt_tile_to_i915_tile(tiling);
 				igt_dynamic_f("render-%s-%ux%u", tiling_name, surfwidth, surfheight)
 					render(bops, tiling, surfwidth, surfheight, id);
 			}
-- 
2.34.1

