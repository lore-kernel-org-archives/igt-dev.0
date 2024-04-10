Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C01A9CD1296
	for <igt-dev@archiver.kernel.org>; Wed, 10 Apr 2024 10:09:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65A651130C2;
	Wed, 10 Apr 2024 10:09:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P7RvuV+G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 133AC1130C2
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Apr 2024 10:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712743778; x=1744279778;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=krmYGY2L+ZBYft1+TSRlS4xlQThLM8rwV/jxf+frC0I=;
 b=P7RvuV+GgufuJJm5cFJayDakY+JhB3OO79mm5b8a7DkUynymyuYondeS
 a8AmWrd7c30ePdjM/2FazpF5dLEc+KiOlD7HGHZs1ffK6KQEUUbsYwaEa
 DzmxQpR93FttfEwAC3Gfnyg5VZUArgi4wENIAnZns1u07RzJuSvfImZQ9
 qgUYygDiw9Jyc1qpZD8stjWNBqkamt2RT6NZQo3cu9JKD5sqKCSb7SyTi
 vn3ZFvhtKkr9wCpT/2chqmi3wOWR/7NZmpHn8TQo7kS2OkoSz2c12rIje
 tC4PoYjCEg583YY7gefyRD/dvDIgXBSOT6ujth/Z7FG7qMtXHVEbbB37w g==;
X-CSE-ConnectionGUID: Oc0Cfh3eTS6WuiKEhwa9sg==
X-CSE-MsgGUID: y47F8p2oRlaMVwlIJuvU4Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="11063024"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="11063024"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 03:09:30 -0700
X-CSE-ConnectionGUID: mAYLacTOQN2nDYyo8xKlXQ==
X-CSE-MsgGUID: Ke5nGT9pThSbEoYHKpCj4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20988672"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.142])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 03:09:28 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Karolina Stolarek <karolina.stolarek@intel.com>,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Subject: [PATCH i-g-t v2 2/2] tests/gem|xe_ccs: Check surface ccs data instead
 of naive comparison
Date: Wed, 10 Apr 2024 12:09:15 +0200
Message-Id: <20240410100915.48541-3-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240410100915.48541-1-zbigniew.kempczynski@intel.com>
References: <20240410100915.48541-1-zbigniew.kempczynski@intel.com>
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
v2: rephrase comment (Karolina)
---
 tests/intel/gem_ccs.c | 16 +++++++++++++---
 tests/intel/xe_ccs.c  | 14 ++++++--------
 2 files changed, 19 insertions(+), 11 deletions(-)

diff --git a/tests/intel/gem_ccs.c b/tests/intel/gem_ccs.c
index e4126bcaa8..a8e7e8a747 100644
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
@@ -359,9 +363,15 @@ static void block_copy(int i915,
 	blt_block_copy(i915, ctx, e, ahnd, &blt, pext);
 	gem_sync(i915, mid->handle);
 
-	/* We expect mid != src if there's compression */
-	if (mid->compression)
-		igt_assert(memcmp(src->ptr, mid->ptr, src->size) != 0);
+	/*
+	 * If there's a compression we expect ctrl surface is not fully zeroed.
+	 * Gradient image used as the reference may be not compressible for
+	 * smaller sizes. Let's use some 'safe' size we're sure compression
+	 * occurs and ctrl surface will be filled with some not-zeroed values.
+	 */
+	if (mid->compression && FROM_EXP_WH(width, height))
+		igt_assert(blt_surface_is_compressed(i915, (intel_ctx_t *)ctx, e,
+						     ahnd, mid));
 
 	WRITE_PNG(i915, run_id, "mid", &blt.dst, width, height, bpp);
 
diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
index 7d0f2f2a11..b3bf97af7e 100644
--- a/tests/intel/xe_ccs.c
+++ b/tests/intel/xe_ccs.c
@@ -359,15 +359,13 @@ static void block_copy(int xe,
 	intel_ctx_xe_sync(ctx, true);
 
 	/*
-	 * We expect mid != src if there's compression. Ignore this for small
-	 * width x height for linear as compression for gradient occurs in the
-	 * middle for bigger sizes. We also ignore 1x1 as this looks same for
-	 * xmajor.
+	 * If there's a compression we expect ctrl surface is not fully zeroed.
+	 * Gradient image used as the reference may be not compressible for
+	 * smaller sizes. Let's use some 'safe' size we're sure compression
+	 * occurs and ctrl surface will be filled with some not-zeroed values.
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

