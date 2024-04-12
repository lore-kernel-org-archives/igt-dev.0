Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 307C4C4345F
	for <igt-dev@archiver.kernel.org>; Fri, 12 Apr 2024 01:39:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC9D210ED6C;
	Fri, 12 Apr 2024 01:39:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lsy8J+Sw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A905210ED44
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Apr 2024 01:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712885976; x=1744421976;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bIXq9vXgYvlvutR8lpmqhgVtnHqbBvkEW5u0wr5IPn4=;
 b=Lsy8J+SwLjl9xK3x8qOLYSTzlU9AOLtTh/n3dNwhHYsMKmxSfPdUSJsP
 /9mIF93TbIifqVfuNtw9DRWU8Vg68WG1IdFXh1UylIqP8cKtDGvE+l9Di
 zhBjZZ3VsqOKRbw8QECYXBUtDXUZtSK17nJKxxxCmeAc+Qnu0XrI4y7o1
 ok0slRefnk00C4eECSESrHE0R2x8AlHbokUa9n/kA+FoA1x0xhaVxvyqS
 v3Fg9G9W51HHUUr+ThZ0H6zoo+4ATxx8LaBPIB5KyLCGOWw9clXL0T+aX
 yKFVNZUyL6RNigCXEjlS2G/UIrO9Vp4tIMhXEtPk1Nn/x2At5QAYpFB2B A==;
X-CSE-ConnectionGUID: XHTXdIXtTw26HxtcdUs7tA==
X-CSE-MsgGUID: F8KmkBxyREuYBRssWZvN5g==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="19722804"
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000"; d="scan'208";a="19722804"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 18:39:34 -0700
X-CSE-ConnectionGUID: E4TjMZPoSWaIElZA58rJeA==
X-CSE-MsgGUID: 6JoQ8uV5QMGwgmyz5eU6Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000"; d="scan'208";a="21171268"
Received: from saurabhg-nuc10i5fnh.jf.intel.com ([10.165.21.145])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 18:39:34 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: 
Cc: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 jonathan.cavitt@intel.com,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Subject: [PATCH i-g-t v4 2/2] tests/xe_ccs: Update compression check based on
 flat-ccs enablement
Date: Fri, 12 Apr 2024 06:37:30 -0700
Message-Id: <af10689c8fc1c87fb713e94ca4d725e2c20613f9.1712928787.git.akshata.jahagirdar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1712928787.git.akshata.jahagirdar@intel.com>
References: <cover.1712928787.git.akshata.jahagirdar@intel.com>
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

In Xe2+ platforms, we need to run this test regardless of the status of
flat-ccs. Check if the platform supports compression and has flat ccs enabled,
and if it doesn't, then update the checks based on  compression
accordingly and  proceed with the test.

Additionally, On Xe2 dGPU, compression is only supported with VRAM. When copying from
VRAM -> system memory the KMD uses mapping with uncompressed PAT
so the copy in system memory is guaranteed to be uncompressed.
When restoring such buffers from system memory -> VRAM the KMD can't
easily know which pages were originally compressed, so we always use
uncompressed -> uncompressed here.
so this means that there's no need for extra CCS storage on such
platforms.
Thats why we shouldn't need to run suspend-resume on xe2 dgpu.

Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Acked-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 tests/intel/xe_ccs.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
index b3bf97af7..ce695c80a 100644
--- a/tests/intel/xe_ccs.c
+++ b/tests/intel/xe_ccs.c
@@ -162,8 +162,11 @@ static void surf_copy(int xe,
 						      (void *)mid->ptr, mid->size);
 
 		munmap(ccsmap2, ccssize);
-		igt_assert(!strcmp(orig, newsum));
-		igt_assert(!strcmp(orig2, newsum2));
+		if (AT_LEAST_GEN(xe, 20) && !is_intel_dgfx(xe) &&
+		    !blt_platform_has_flat_ccs_enabled(xe)) {
+			igt_assert(!strcmp(orig, newsum));
+			igt_assert(!strcmp(orig2, newsum2));
+		}
 		g_free(orig);
 		g_free(orig2);
 		g_free(newsum);
@@ -193,7 +196,8 @@ static void surf_copy(int xe,
 	intel_ctx_xe_sync(ctx, true);
 	WRITE_PNG(xe, run_id, "corrupted", &blt.dst, dst->x2, dst->y2, bpp);
 	result = memcmp(src->ptr, dst->ptr, src->size);
-	igt_assert(result != 0);
+	if (AT_LEAST_GEN(xe, 20) && !blt_platform_has_flat_ccs_enabled(xe))
+		igt_assert(result != 0);
 
 	/* retrieve back ccs */
 	memcpy(ccsmap, ccscopy, ccssize);
@@ -365,7 +369,8 @@ static void block_copy(int xe,
 	 * occurs and ctrl surface will be filled with some not-zeroed values.
 	 */
 	if (mid->compression && FROM_EXP_WH(width, height))
-		igt_assert(blt_surface_is_compressed(xe, ctx, NULL, ahnd, mid));
+		if (AT_LEAST_GEN(xe, 20) && !blt_platform_has_flat_ccs_enabled(xe))
+			igt_assert(blt_surface_is_compressed(xe, ctx, NULL, ahnd, mid));
 
 	WRITE_PNG(xe, run_id, "mid", &blt.dst, width, height, bpp);
 
-- 
2.34.1

