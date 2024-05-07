Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 684FAC10F1A
	for <igt-dev@archiver.kernel.org>; Tue,  7 May 2024 07:59:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC5AE112488;
	Tue,  7 May 2024 07:59:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iBSlXxKE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26F63112488
 for <igt-dev@lists.freedesktop.org>; Tue,  7 May 2024 07:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715068773; x=1746604773;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HylHA0KSxkKfZ+B/3NJrsqesYj+d5L9S/3SAId/rd1Y=;
 b=iBSlXxKE/Wv56CjRay3g6BatjXrTHIzdDbwLsTIalA+xtlo+yhvVnAPj
 Qh0HdugQ0+EKyymbp95ND/hHkfJnCfHEEYLNp0cg/59cs+MetejsX2xgI
 PxOHmVOjtI41aPIyLuLphh+eEfwiHLQHH0RLYp7MgBFA432iJfWtwOxj5
 uosDKPL3sq8XDw6g64aRUD9WieR94nPAvWW/zjQOVD18X/zbNdXY47e74
 SE/EBkw7FUTtYzTuJZSKxj19s9B7Ux/5LZgpxXIL8MzCyZ05q6m/WnDRT
 6QK64hmFhLqPs8BSPHFOub/zU1dnuKJXtr0GFGLlDgD6/I5+SMIm2rmin w==;
X-CSE-ConnectionGUID: XSnpc/beQrOv9PIXkV7QOA==
X-CSE-MsgGUID: ZdQC8aS8QVy1vFkwSVjZbA==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="14656362"
X-IronPort-AV: E=Sophos;i="6.07,260,1708416000"; d="scan'208";a="14656362"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 00:59:33 -0700
X-CSE-ConnectionGUID: odUpCdCKQCCEdsHwgmE33g==
X-CSE-MsgGUID: xlQNc9F6QZevsjbJzQTQ2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,260,1708416000"; d="scan'208";a="65887252"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.12])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 00:59:32 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v3 11/11] tests/xe_intel_bb: Use supported tilings
 instead hardcoded ones
Date: Tue,  7 May 2024 09:58:36 +0200
Message-Id: <20240507075836.259581-12-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240507075836.259581-1-zbigniew.kempczynski@intel.com>
References: <20240507075836.259581-1-zbigniew.kempczynski@intel.com>
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

Use introduced render tilings in cmds-info to select appropriate one
on which render subtest is executed.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/intel/xe_intel_bb.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/tests/intel/xe_intel_bb.c b/tests/intel/xe_intel_bb.c
index 09164c41fc..ad6a2d22ca 100644
--- a/tests/intel/xe_intel_bb.c
+++ b/tests/intel/xe_intel_bb.c
@@ -18,6 +18,7 @@
 
 #include "igt.h"
 #include "igt_crc.h"
+#include "intel_blt.h"
 #include "intel_bufops.h"
 #include "intel_mocs.h"
 #include "intel_pat.h"
@@ -978,19 +979,10 @@ const char *help_str =
 
 igt_main_args("dpib", NULL, help_str, opt_handler, NULL)
 {
-	int xe, i;
+	int xe;
 	struct buf_ops *bops;
 	uint32_t width;
 
-	struct test {
-		uint32_t tiling;
-		const char *tiling_name;
-	} tests[] = {
-		{ I915_TILING_NONE, "none" },
-		{ I915_TILING_X, "x" },
-		{ I915_TILING_4, "4" },
-	};
-
 	igt_fixture {
 		xe = drm_open_driver(DRIVER_XE);
 		bops = buf_ops_create(xe);
@@ -1053,14 +1045,19 @@ igt_main_args("dpib", NULL, help_str, opt_handler, NULL)
 		delta_check(bops);
 
 	igt_subtest_with_dynamic("render") {
+		int tiling;
+
 		igt_require(xe_has_engine_class(xe, DRM_XE_ENGINE_CLASS_RENDER));
 
-		for (i = 0; i < ARRAY_SIZE(tests); i++) {
-			const struct test *t = &tests[i];
+		for_each_tiling(tiling) {
+			if (!render_supports_tiling(xe, tiling, false))
+				continue;
 
 			for (width = 512; width <= 1024; width += 512)
-				igt_dynamic_f("render-%s-%u", t->tiling_name, width)
-					render(bops, t->tiling, width, width);
+				igt_dynamic_f("render-%s-%u",
+					      blt_tiling_name(tiling), width)
+					render(bops, blt_tile_to_i915_tile(tiling),
+					       width, width);
 		}
 	}
 
-- 
2.34.1

