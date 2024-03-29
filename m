Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A35C6FD1F
	for <igt-dev@archiver.kernel.org>; Fri, 29 Mar 2024 09:17:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F216112604;
	Fri, 29 Mar 2024 09:17:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HEYRcE3M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3289112602
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Mar 2024 09:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711703834; x=1743239834;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MAq23L/VAHWOuTSqlPfZXen6AOIcL8YRUkABFr+o/oQ=;
 b=HEYRcE3MxDe6188B/wEqQpNZY48suAvX4iG8oxL8wRZUjNh+PnsEQ/Ig
 hrlJtDHL9jmfSrFLzC2l7aH6MxPLbxVaE/xf3Y3HbWkIjdOWlBpyUuOc2
 d0P8tetXVANQUuIoJ66feif8OHVFXCFbzMk+7WVuukdih6GiCGfDjAs3W
 dPvMlXkWYhZILaF3/OwjXvwfLHyYr60BVGLaOADbSLyCs6XX+70HN4/2g
 XYs16r2p1Tm/OGFNyMFHotQIaY7K2bS4pHOKY1cnOXYirb8GQuzFUx20J
 WhMcDQQriDshkr0PzE8DTL5jxfKxlzjt37889nhQq5WO8azHEaRJiiYqR w==;
X-CSE-ConnectionGUID: RUrRJZbJQFmpzgj4rFQnQQ==
X-CSE-MsgGUID: dSB6hsd8SmacXxGq+hiWkA==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="10673890"
X-IronPort-AV: E=Sophos;i="6.07,164,1708416000"; d="scan'208";a="10673890"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2024 02:17:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,164,1708416000"; d="scan'208";a="16896938"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.67])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2024 02:17:11 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Karolina Stolarek <karolina.stolarek@intel.com>,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Subject: [PATCH i-g-t 2/2] tests/gem|xe_ccs: Check surface ccs data instead of
 naive comparison
Date: Fri, 29 Mar 2024 10:16:55 +0100
Message-Id: <20240329091655.1347862-3-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240329091655.1347862-1-zbigniew.kempczynski@intel.com>
References: <20240329091655.1347862-1-zbigniew.kempczynski@intel.com>
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

Start using function which extracts ccs data from the surface and
determines its compression.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Karolina Stolarek <karolina.stolarek@intel.com>
Cc: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
---
 tests/intel/gem_ccs.c | 15 ++++++++++++---
 tests/intel/xe_ccs.c  |  9 +++------
 2 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/tests/intel/gem_ccs.c b/tests/intel/gem_ccs.c
index e4126bcaa8..c59fc69fb7 100644
--- a/tests/intel/gem_ccs.c
+++ b/tests/intel/gem_ccs.c
@@ -305,6 +305,10 @@ static int blt_block_copy3(int i915,
 	return ret;
 }
 
+#define CHECK_FROM_WIDTH 256
+#define CHECK_FROM_HEIGHT 256
+#define FROM_EXP_WH(w, h) ((w) >= CHECK_FROM_WIDTH && (h) >= CHECK_FROM_HEIGHT)
+
 static void block_copy(int i915,
 		       const intel_ctx_t *ctx,
 		       const struct intel_execution_engine2 *e,
@@ -359,9 +363,14 @@ static void block_copy(int i915,
 	blt_block_copy(i915, ctx, e, ahnd, &blt, pext);
 	gem_sync(i915, mid->handle);
 
-	/* We expect mid != src if there's compression */
-	if (mid->compression)
-		igt_assert(memcmp(src->ptr, mid->ptr, src->size) != 0);
+	/*
+	 * We expect mid != src if there's compression. Ignore this for small
+	 * width x height for linear as compression for gradient occurs in the
+	 * middle for bigger sizes.
+	 */
+	if (mid->compression && FROM_EXP_WH(width, height))
+		igt_assert(blt_surface_is_compressed(i915, (intel_ctx_t *)ctx, e,
+						     ahnd, mid));
 
 	WRITE_PNG(i915, run_id, "mid", &blt.dst, width, height, bpp);
 
diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
index 7d0f2f2a11..5525aaed65 100644
--- a/tests/intel/xe_ccs.c
+++ b/tests/intel/xe_ccs.c
@@ -361,13 +361,10 @@ static void block_copy(int xe,
 	/*
 	 * We expect mid != src if there's compression. Ignore this for small
 	 * width x height for linear as compression for gradient occurs in the
-	 * middle for bigger sizes. We also ignore 1x1 as this looks same for
-	 * xmajor.
+	 * middle for bigger sizes.
 	 */
-	if (mid->compression && MIN_EXP_WH(width, height)) {
-		if (mid_tiling != T_LINEAR || FROM_EXP_WH(width, height))
-			igt_assert(memcmp(src->ptr, mid->ptr, src->size) != 0);
-	}
+	if (mid->compression && FROM_EXP_WH(width, height))
+		igt_assert(blt_surface_is_compressed(xe, ctx, NULL, ahnd, mid));
 
 	WRITE_PNG(xe, run_id, "mid", &blt.dst, width, height, bpp);
 
-- 
2.34.1

