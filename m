Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68040C25B75
	for <igt-dev@archiver.kernel.org>; Wed, 15 May 2024 12:20:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0517010E5C7;
	Wed, 15 May 2024 12:20:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mLcVFhCd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B376C10E5C7
 for <igt-dev@lists.freedesktop.org>; Wed, 15 May 2024 12:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715775632; x=1747311632;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S/Mb9kSzGssRQrFF+jabf3JafCG2xYgcw9/T92ZOvrw=;
 b=mLcVFhCdUvXSDX2OP6zuOg9HPTq8SOAStsH7RNcGiH0mz417XGBBIxyf
 rjJWc7k0IZrDnbSBB5sJuAyNTH2Ig5Of39YEn9NzX33gDZhIb4B9ewUZL
 /94SzsQZ6KgJRocmSIFkHfsF/jSGpfqPmKefoxr2dZ5zI8tcUIsQa4QFh
 udl/fFles/X5KhjvSlq5V3RYA453l69HNsyPIwBm9jxrJ6/C5omywD0Zp
 jsWmKeT3u51krnn2Ky2xbI4sUXEpShRewYVY5aMy2lEV60YSWWewv6Jq+
 tKQV3nIATWBvZRUgjqajC59UXHgwBX5XdEviCxEhLtgiE8l6k+TFm7UTf Q==;
X-CSE-ConnectionGUID: Usu1sSULTl6PFoo+xUsQBA==
X-CSE-MsgGUID: Qu9H3LuNQcG4UEwbjjoBCg==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="11764294"
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; d="scan'208";a="11764294"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 05:20:32 -0700
X-CSE-ConnectionGUID: ug/8PPdzR9K3fqx4KuxriA==
X-CSE-MsgGUID: Cucn34OfRB6CKs/U5wxbtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; d="scan'208";a="31161804"
Received: from unknown (HELO localhost) ([10.245.246.122])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 05:20:30 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Karolina Stolarek <karolina.stolarek@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t v6 9/9] tests/xe_intel_bb: Use supported tilings instead
 hardcoded ones
Date: Wed, 15 May 2024 14:19:49 +0200
Message-Id: <20240515121949.245280-10-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240515121949.245280-1-zbigniew.kempczynski@intel.com>
References: <20240515121949.245280-1-zbigniew.kempczynski@intel.com>
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
Reviewed-by: Karolina Stolarek <karolina.stolarek@intel.com>
Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/intel/xe_intel_bb.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/tests/intel/xe_intel_bb.c b/tests/intel/xe_intel_bb.c
index 6905765863..c712d04ba7 100644
--- a/tests/intel/xe_intel_bb.c
+++ b/tests/intel/xe_intel_bb.c
@@ -18,6 +18,7 @@
 
 #include "igt.h"
 #include "igt_crc.h"
+#include "intel_blt.h"
 #include "intel_bufops.h"
 #include "intel_mocs.h"
 #include "intel_pat.h"
@@ -979,19 +980,10 @@ const char *help_str =
 
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
@@ -1054,14 +1046,19 @@ igt_main_args("dpib", NULL, help_str, opt_handler, NULL)
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

