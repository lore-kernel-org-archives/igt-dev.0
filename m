Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02EE6C67861
	for <igt-dev@archiver.kernel.org>; Tue,  9 Apr 2024 22:41:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87285112FD9;
	Tue,  9 Apr 2024 22:41:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fyQ8IRwX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B656910E30D
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Apr 2024 22:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712702476; x=1744238476;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RQ5IuhSmgWZh2ikricNaumbhPYda2F+zUePafj/A7Js=;
 b=fyQ8IRwXv7zXR0WudilLJDSrWyQoyAblSZf242gU7ZavXwxT27rqYOOY
 mz/XoqpqjRdiT+Otz2thTBeyfDnwiY/QzvQGPqhg09sStA/QNheCYG3IP
 XHLzIhbkSaXLdueybDqy+WJCWxtJ3Ak5LWShWH7+lPxmHZzgBhT7RnoTG
 WRP3pzr9/vBQ+JNn271m5AyxgWZz+w2bjHGkjQ5n6kWcHxOATJjOmn5cr
 jXcTeHh2/ynCiET50kdhjovvVxHsFFQfvZRKULqEe1SIBSQIZOxhXfAC+
 Ca3u7bpMaR3e+ZIlw80PxBUVLl4tt5rQw6U9r0M8e9j4OSKpD81V6SXyh w==;
X-CSE-ConnectionGUID: IsfEZTt6SUmtA/OEwtfqMQ==
X-CSE-MsgGUID: 04+/rAsjQE2+GUSUxK1aIQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="25487807"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="25487807"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 15:41:16 -0700
X-CSE-ConnectionGUID: Tcz2Avm+SbeCnmnB2JQnUQ==
X-CSE-MsgGUID: 7+1xepa8T/GRS3KXtUYUtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="57808237"
Received: from saurabhg-nuc10i5fnh.jf.intel.com ([10.165.21.145])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 15:41:16 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: 
Cc: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 jonathan.cavitt@intel.com,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Subject: [PATCH i-g-t v3 2/2] tests/xe_ccs: Update compression check based on
 flat-ccs enablement
Date: Wed, 10 Apr 2024 03:39:14 -0700
Message-Id: <bbebf1515e69ccb5cd21e609d4a4a1df4d0d8843.1712745305.git.akshata.jahagirdar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1712745305.git.akshata.jahagirdar@intel.com>
References: <cover.1712745305.git.akshata.jahagirdar@intel.com>
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
---
 tests/intel/xe_ccs.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
index 725495dc9..645995b4a 100644
--- a/tests/intel/xe_ccs.c
+++ b/tests/intel/xe_ccs.c
@@ -162,8 +162,11 @@ static void surf_copy(int xe,
 						      (void *)mid->ptr, mid->size);
 
 		munmap(ccsmap2, ccssize);
-		igt_assert(!strcmp(orig, newsum));
-		igt_assert(!strcmp(orig2, newsum2));
+		if (AT_LEAST_GEN(xe, 20) && is_intel_dgfx(xe) &&
+			!blt_platform_has_flat_ccs_enabled(xe)) {
+				igt_assert(!strcmp(orig, newsum));
+				igt_assert(!strcmp(orig2, newsum2));
+			}
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
@@ -365,8 +369,9 @@ static void block_copy(int xe,
 	 * xmajor.
 	 */
 	if (mid->compression && MIN_EXP_WH(width, height)) {
-		if (mid_tiling != T_LINEAR || FROM_EXP_WH(width, height))
-			igt_assert(memcmp(src->ptr, mid->ptr, src->size) != 0);
+		if (AT_LEAST_GEN(xe, 20) && !blt_platform_has_flat_ccs_enabled(xe))
+			if (mid_tiling != T_LINEAR || FROM_EXP_WH(width, height))
+				igt_assert(memcmp(src->ptr, mid->ptr, src->size) != 0);
 	}
 
 	WRITE_PNG(xe, run_id, "mid", &blt.dst, width, height, bpp);
-- 
2.34.1

