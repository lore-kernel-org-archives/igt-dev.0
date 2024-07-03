Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D79C30653
	for <igt-dev@archiver.kernel.org>; Wed,  3 Jul 2024 06:33:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03F2810E100;
	Wed,  3 Jul 2024 06:33:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tz7o0eqF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6AB510E100
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Jul 2024 06:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719988403; x=1751524403;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8bEeJTeO0x6GHMJLGFe49I/mGS8atjOufc5c0QsLbEM=;
 b=Tz7o0eqFTzXSSe7BIzEIM3sh8KsdPMJ/fFA523/QE0TfiAAcgKeP9ZZs
 fF6/nUzEW7xYDUb9KJ2NtoeXFApHzIttEskeNwGgIqKpdflXmqRryUhw4
 HfoxbmwlEZGrh6bXlLTky2LRzBjVoxsTb7FcaeVOUiTBO9NkUZ1rU3lc1
 QZ0nSrGBpuWsmfSjVXcCYoXctHZGoYKwIk/m52NFe8uSLdvn8+yQZ3w74
 epe0wymmRB4UzZVN1u7DFmVwlO0ufzTUOtAYT5tV9RwnJ++dgQOQd9PCE
 El/T1MuVgbmlNwTgJlS4mBjn/wwrkbG8jDxsNRpc/ho4BXWzLPdsGDsOs Q==;
X-CSE-ConnectionGUID: h3fIiYWpS/iKN8QWVignxg==
X-CSE-MsgGUID: gH3MP9rfQJWqwU9aHKj14g==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="27801420"
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; d="scan'208";a="27801420"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 23:33:23 -0700
X-CSE-ConnectionGUID: PUuHs4OzTG6OTRHTb8HzKg==
X-CSE-MsgGUID: UId587RMQMm7FGfMe+oxIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; d="scan'208";a="50997827"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.248])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 23:33:22 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t] tests/xe_intel_bb: Reduce render subtest execution time
Date: Wed,  3 Jul 2024 08:33:14 +0200
Message-Id: <20240703063314.252920-1-zbigniew.kempczynski@intel.com>
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

Test xe_intel_bb verifies intel-bb so it doesn't make sense to perform
large render operations as those are covered in xe_render_copy test.
Use 256px surface for render instead 512 and 1024 px.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/xe_intel_bb.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/tests/intel/xe_intel_bb.c b/tests/intel/xe_intel_bb.c
index 5dd794b186..647fd64e7e 100644
--- a/tests/intel/xe_intel_bb.c
+++ b/tests/intel/xe_intel_bb.c
@@ -40,6 +40,7 @@
 #define HEIGHT	64
 #define STRIDE	(WIDTH * 4)
 #define SIZE	(HEIGHT * STRIDE)
+#define RENDER_WIDTH 256
 
 #define COLOR_00	0x00
 #define COLOR_33	0x33
@@ -1054,11 +1055,11 @@ igt_main_args("dpib", NULL, help_str, opt_handler, NULL)
 			if (!render_supports_tiling(xe, tiling, false))
 				continue;
 
-			for (width = 512; width <= 1024; width += 512)
-				igt_dynamic_f("render-%s-%u",
-					      blt_tiling_name(tiling), width)
-					render(bops, blt_tile_to_i915_tile(tiling),
-					       width, width);
+			width = RENDER_WIDTH;
+			igt_dynamic_f("render-%s-%u",
+				      blt_tiling_name(tiling), width)
+				render(bops, blt_tile_to_i915_tile(tiling),
+				       width, width);
 		}
 	}
 
-- 
2.34.1

