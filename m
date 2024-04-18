Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3BB2C4345F
	for <igt-dev@archiver.kernel.org>; Wed, 17 Apr 2024 20:48:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52E8C10E513;
	Wed, 17 Apr 2024 20:48:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NaNBtVqs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D1DF10E513
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Apr 2024 20:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713386933; x=1744922933;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7GzSTtkusNdrGZ31aYHKpBTJl2dXtCTrgib4hkV0yq0=;
 b=NaNBtVqsCXokJD9+S5BRn5D5al3onJjOhat/PLsJAW/Ywb6FIMop382P
 F8fHSZYfh9IVQ1ePsrUhp8exO+F9t/Jl6Cz2EVtIeReA+6WRwBh22zdpA
 Qo3iN/VjM8DW/ZikAZ7GUI/farbNdahhkhjunooC0PtTTry6qd+eqv0XQ
 lpFix4A7FxajL5o0ikG30qo5IgX+ACvJg9QT5QhXzryvGZ6c/33pZi2oO
 zbqazx6QO23jzHi3q8X40KViDr+6schyZmgCP17Rlpu11/w/DHXfP6syw
 w6C2C8xL33wJuWiiPOhRWYSyWtM7K4hGj92fOETyxSvrn8EtjNCU3dz4D w==;
X-CSE-ConnectionGUID: IE4LwaPvRUGLRkoubiIySw==
X-CSE-MsgGUID: tMbhcxvISrGKzv5CNLJj6A==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="9071277"
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; 
   d="scan'208";a="9071277"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 13:48:52 -0700
X-CSE-ConnectionGUID: JbqWxRtJRG+qN2zRniL8kQ==
X-CSE-MsgGUID: JqqsLnHPRuOuhxCldbJeIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; d="scan'208";a="60173272"
Received: from saurabhg-nuc10i5fnh.jf.intel.com ([10.165.21.145])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 13:48:51 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: 
Cc: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH i-g-t v6 2/2] tests/xe_ccs: Update compression check based on
 flat-ccs enablement
Date: Thu, 18 Apr 2024 01:46:43 -0700
Message-Id: <0cfbaccb86155a3e5b6fc5c68447848fb08c51ef.1713429755.git.akshata.jahagirdar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1713429755.git.akshata.jahagirdar@intel.com>
References: <cover.1713429755.git.akshata.jahagirdar@intel.com>
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
index b3bf97af7..d6148dc44 100644
--- a/tests/intel/xe_ccs.c
+++ b/tests/intel/xe_ccs.c
@@ -162,8 +162,24 @@ static void surf_copy(int xe,
 						      (void *)mid->ptr, mid->size);
 
 		munmap(ccsmap2, ccssize);
-		igt_assert(!strcmp(orig, newsum));
-		igt_assert(!strcmp(orig2, newsum2));
+		if (blt_platform_has_flat_ccs_enabled(xe)) {
+			if (IS_GEN(xe, 12) && is_intel_dgfx(xe)) {
+				igt_assert(!strcmp(orig, newsum));
+				igt_assert(!strcmp(orig2, newsum2));
+			} else if (AT_LEAST_GEN(xe, 20)) {
+				if (is_intel_dgfx(xe)) {
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
+		}
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

