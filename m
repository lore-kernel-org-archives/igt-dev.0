Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB923C04FF8
	for <igt-dev@archiver.kernel.org>; Tue, 16 Apr 2024 16:27:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CDD4112D75;
	Tue, 16 Apr 2024 16:27:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Me0LjQNr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B56A6112D70
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Apr 2024 16:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713284862; x=1744820862;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8dG4vZCwAHSgDm2AieBa00mvc7CtGe9V/tHTbZZmJYA=;
 b=Me0LjQNrmjldrdeIdVzefV5/vd+WoZRorQFfD8OHiu2eWz3utliBlIvm
 0s6B75FT26+pfohYGMAIKK2fKbe6rhC3r/Abksm8iGrc5bdbrKN32H8hg
 W+KL7IEq+qLNdTeyslcNY/cxEAL/uI9gL7QhEzb3SDwqupRRnWvT+/WF0
 MuQgxvHovNtnEspkYMZgqj3S2oCnAQDMOaujVK/yRWfLESqHHTP4ClmX/
 hY/JrMk52zOATb/V/m0at+kUTOzkBfKG0CL3hd8Lfvjb7JW1TrdDijnd2
 OIUQXjfcbyQdDEyPRpxC5CKFLRfUjKFWc7ZGbf1IauiCilW0LhI7/GGbz Q==;
X-CSE-ConnectionGUID: ttOILODZTwGP5uj4eB62aw==
X-CSE-MsgGUID: rMYR59U5SsGzRTfmNrKP9Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="31218247"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="31218247"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 09:27:42 -0700
X-CSE-ConnectionGUID: vRZ8/3xPQKOmLPZ7r6izSw==
X-CSE-MsgGUID: DaWUKBNzSPmUoKEYwTaLBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="26885970"
Received: from saurabhg-nuc10i5fnh.jf.intel.com ([10.165.21.145])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 09:27:41 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: 
Cc: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH i-g-t v5 2/2] tests/xe_ccs: Update compression check based on
 flat-ccs enablement
Date: Tue, 16 Apr 2024 21:25:33 -0700
Message-Id: <8d12225cebb54ccf921c955501f61d407507e361.1713327400.git.akshata.jahagirdar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1713327400.git.akshata.jahagirdar@intel.com>
References: <cover.1713327400.git.akshata.jahagirdar@intel.com>
MIME-Version: 1.0
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

In Xe2+ platforms,we need to run this test regardless of the status of flat-ccs.
Check if the platform supports compression and has flat ccs enabled, and if it
doesn't, then update the checks accordingly and proceed with the test.

Additionally, On Xe2 dGPU, compression is only supported with VRAM. When copying
from VRAM -> sysmem the KMD uses mapping with uncompressed PAT so the copy
in system memory is guaranteed to be uncompressed. When restoring such buffers
from sysmem -> VRAM the KMD can't easily know which pages were originally
compressed, so we always use uncompressed -> uncompressed here. so this means
there's no need for extra CCS storage on such platforms.
Thats why we shouldn't need to run suspend-resume on xe2 dgpu.

Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Acked-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 tests/intel/xe_ccs.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
index b3bf97af7..d61644884 100644
--- a/tests/intel/xe_ccs.c
+++ b/tests/intel/xe_ccs.c
@@ -162,8 +162,24 @@ static void surf_copy(int xe,
 						      (void *)mid->ptr, mid->size);
 
 		munmap(ccsmap2, ccssize);
-		igt_assert(!strcmp(orig, newsum));
-		igt_assert(!strcmp(orig2, newsum2));
+		if (blt_platform_has_flat_ccs_enabled(xe))
+			if (IS_GEN(xe, 12) && is_intel_dgfx(xe)) {
+				igt_assert(!strcmp(orig, newsum));
+				igt_assert(!strcmp(orig2, newsum2));
+			} else if (AT_LEAST_GEN(xe, 20)) {
+				if (is_dgfx(xe)) {
+					/* buffer object would become
+					 * uncompressed in xe2+ dgfx
+					 */
+					igt_assert(!blt_surface_is_compressed(xe, ctx,
+							NULL, ahnd, mid));
+				} else {
+					/* ccs should be present in xe2+ igfx */
+					igt_assert(blt_surface_is_compressed(xe, ctx,
+							NULL, ahnd, mid));
+				}
+			}
+
 		g_free(orig);
 		g_free(orig2);
 		g_free(newsum);
@@ -193,7 +209,8 @@ static void surf_copy(int xe,
 	intel_ctx_xe_sync(ctx, true);
 	WRITE_PNG(xe, run_id, "corrupted", &blt.dst, dst->x2, dst->y2, bpp);
 	result = memcmp(src->ptr, dst->ptr, src->size);
-	igt_assert(result != 0);
+	if (!blt_platform_has_flat_ccs_enabled(xe))
+		igt_assert(result != 0);
 
 	/* retrieve back ccs */
 	memcpy(ccsmap, ccscopy, ccssize);
@@ -365,7 +382,8 @@ static void block_copy(int xe,
 	 * occurs and ctrl surface will be filled with some not-zeroed values.
 	 */
 	if (mid->compression && FROM_EXP_WH(width, height))
-		igt_assert(blt_surface_is_compressed(xe, ctx, NULL, ahnd, mid));
+		if (!blt_platform_has_flat_ccs_enabled(xe))
+			igt_assert(blt_surface_is_compressed(xe, ctx, NULL, ahnd, mid));
 
 	WRITE_PNG(xe, run_id, "mid", &blt.dst, width, height, bpp);
 
-- 
2.34.1

