Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0602C071FD
	for <igt-dev@archiver.kernel.org>; Fri, 19 Apr 2024 15:38:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51E6710E365;
	Fri, 19 Apr 2024 15:38:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OZ8cH/P+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7597510E365
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Apr 2024 15:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713541109; x=1745077109;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BELbZULJOlr7gWsI9AGx+sgpaTSOxR9VfeIWXi1JyWA=;
 b=OZ8cH/P+5d4BSl3Ld5fLbfDWHij+qcnrf8upnk3RdOZ8NfBop+978DTW
 LIYYrD2RPh5vn+VPrXgz/REgQ0H7H5m4aDR8/zzHsKUtmslVJPTS6qakm
 vwS7aPIlDO7jCBEwZJMGStW00w6NtECLKrqUvtEy7XOL0kaLhdOjpvAsu
 qy9STt+T6Hhf71P6LUlndTdMFTKtyYL3DaCit+ck/v9JBYdVQvNV81kqK
 VVgiXahVpoaQZ6fTOoyNbn0xmVQXXpq2JBmNq38Dmofl2yVQXk7CjpiqI
 spBKNrvD0St25E3SYnAT9/zqYVNSsyfq6/gMxUF9cbFEtUQj+4jf8bvTf Q==;
X-CSE-ConnectionGUID: NuGMv2iGTDa19bqPZQl8gA==
X-CSE-MsgGUID: a8H2zpt7R0uAE6BJjEpaPg==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="9009104"
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; 
   d="scan'208";a="9009104"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 08:38:28 -0700
X-CSE-ConnectionGUID: p3IyRhk2TOGxjI17lqwADA==
X-CSE-MsgGUID: gzCkLu98S0ilb2pAtKDMjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; d="scan'208";a="28017188"
Received: from saurabhg-nuc10i5fnh.jf.intel.com ([10.165.21.145])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 08:38:28 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: 
Cc: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH i-g-t v6 2/2] tests/xe_ccs: Update compression check based on
 flat-ccs enablement
Date: Fri, 19 Apr 2024 20:36:17 -0700
Message-Id: <724d7114ac0d2f4f42c3a1c2cad09d82c0c00d57.1713584014.git.akshata.jahagirdar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1713584014.git.akshata.jahagirdar@intel.com>
References: <cover.1713584014.git.akshata.jahagirdar@intel.com>
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
 tests/intel/xe_ccs.c | 40 +++++++++++++++++++++++++++++++++-------
 1 file changed, 33 insertions(+), 7 deletions(-)

diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
index b3bf97af7..7b6cf231e 100644
--- a/tests/intel/xe_ccs.c
+++ b/tests/intel/xe_ccs.c
@@ -114,10 +114,11 @@ static void surf_copy(int xe,
 	uint32_t sysmem = system_memory(xe);
 	uint8_t comp_pat_index = DEFAULT_PAT_INDEX;
 	uint16_t cpu_caching = __xe_default_cpu_caching(xe, sysmem, 0);
+	uint32_t devid = intel_get_drm_devid(xe);
 	int result;
 
 	igt_assert(mid->compression);
-	if (AT_LEAST_GEN(intel_get_drm_devid(xe), 20) && mid->compression) {
+	if (AT_LEAST_GEN(devid, 20) && mid->compression) {
 		comp_pat_index  = intel_get_pat_idx_uc_comp(xe);
 		cpu_caching = DRM_XE_GEM_CPU_CACHING_WC;
 	}
@@ -162,8 +163,24 @@ static void surf_copy(int xe,
 						      (void *)mid->ptr, mid->size);
 
 		munmap(ccsmap2, ccssize);
-		igt_assert(!strcmp(orig, newsum));
-		igt_assert(!strcmp(orig2, newsum2));
+		if (blt_platform_has_flat_ccs_enabled(xe)) {
+			if (IS_GEN(devid, 12) && is_intel_dgfx(xe)) {
+				igt_assert(!strcmp(orig, newsum));
+				igt_assert(!strcmp(orig2, newsum2));
+			} else if (AT_LEAST_GEN(devid, 20)) {
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
@@ -193,10 +210,18 @@ static void surf_copy(int xe,
 	intel_ctx_xe_sync(ctx, true);
 	WRITE_PNG(xe, run_id, "corrupted", &blt.dst, dst->x2, dst->y2, bpp);
 	result = memcmp(src->ptr, dst->ptr, src->size);
-	igt_assert(result != 0);
+	if (!blt_platform_has_flat_ccs_enabled(xe))
+		igt_assert(result != 0);
 
-	/* retrieve back ccs */
-	memcpy(ccsmap, ccscopy, ccssize);
+	/* In case of suspend_resume, buffer object would become
+	 * uncompressed in xe2+ dgfx, and therefore retrieve the
+	 * ccs by copying 0 to ccsmap
+	 */
+	if (suspend_resume && AT_LEAST_GEN(devid, 20) && is_intel_dgfx(xe))
+		memset(ccsmap, 0, ccssize);
+	else
+		/* retrieve back ccs */
+		memcpy(ccsmap, ccscopy, ccssize);
 	blt_ctrl_surf_copy(xe, ctx, NULL, ahnd, &surf);
 
 	blt_block_copy(xe, ctx, NULL, ahnd, &blt, &ext);
@@ -365,7 +390,8 @@ static void block_copy(int xe,
 	 * occurs and ctrl surface will be filled with some not-zeroed values.
 	 */
 	if (mid->compression && FROM_EXP_WH(width, height))
-		igt_assert(blt_surface_is_compressed(xe, ctx, NULL, ahnd, mid));
+		if (!blt_platform_has_flat_ccs_enabled(xe))
+			igt_assert(blt_surface_is_compressed(xe, ctx, NULL, ahnd, mid));
 
 	WRITE_PNG(xe, run_id, "mid", &blt.dst, width, height, bpp);
 
-- 
2.34.1

