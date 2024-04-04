Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A694CD1297
	for <igt-dev@archiver.kernel.org>; Thu,  4 Apr 2024 05:54:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C133110E3E4;
	Thu,  4 Apr 2024 05:54:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mFZmrqGM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D65A10E3E4
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Apr 2024 05:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712210073; x=1743746073;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+fQMQk+jAKwtAVqDubvY0S62pF8X9/5T/XJiy6b9ohM=;
 b=mFZmrqGMHR7pzfWsDpY6t676KFslR5vf98bP3UfyAwuieKqBWLEniMaM
 5gEW7xfmsj33+C6EYgMHqPqafY94sm9eLVosPDP772vFfSTsRozwdamsn
 GccnKXHOqsOi7gsC99tY8egzWQ+H+OPS2zLC0AAJhYYjijrd3lZI9iwCf
 Zb0wNH++BZndbJil6izsgdIPHplJbCLa6HSRb9u9vp0LuDPzz0KPUUwv/
 Ezrd4q24e+a0Lry8frPRc9cyLhOasnw7Sx3M8res6yrjn4dC5aA7w+2L2
 aKwSRamZlj/QaXmMb+lSJIdvUAlyXlluVmdgGs9FOZf7Boghxpj9UH6DG g==;
X-CSE-ConnectionGUID: k8gVJ5HiSbCGzjq1W3jqmA==
X-CSE-MsgGUID: J6OomkruSHW3I3DO4DVThA==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7342805"
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="7342805"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 22:54:32 -0700
X-CSE-ConnectionGUID: Va8KzGPaRcOAPFqzeERvRg==
X-CSE-MsgGUID: KdFpBgCkTH+p2UUPXaB47g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; d="scan'208";a="18707582"
Received: from saurabhg-nuc10i5fnh.jf.intel.com ([10.165.21.145])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 22:54:31 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: 
Cc: igt-dev@lists.freedesktop.org, matthew.auld@intel.com,
 zbigniew.kempczynski@intel.com,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Subject: [PATCH i-g-t 2/2] tests/xe_ccs: Update compression check based on
 flat-ccs enablement
Date: Thu,  4 Apr 2024 10:52:35 -0700
Message-Id: <29b77a27daca05acdbfb9397166eab98380ab8f0.1712252787.git.akshata.jahagirdar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1712252787.git.akshata.jahagirdar@intel.com>
References: <cover.1712252787.git.akshata.jahagirdar@intel.com>
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

Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
---
 tests/intel/xe_ccs.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
index ad2eeb259..befbbe605 100644
--- a/tests/intel/xe_ccs.c
+++ b/tests/intel/xe_ccs.c
@@ -193,7 +193,8 @@ static void surf_copy(int xe,
 	intel_ctx_xe_sync(ctx, true);
 	WRITE_PNG(xe, run_id, "corrupted", &blt.dst, dst->x2, dst->y2, bpp);
 	result = memcmp(src->ptr, dst->ptr, src->size);
-	igt_assert(result != 0);
+	if (AT_LEAST_GEN(xe, 20) && !blt_platform_has_flat_ccs_enabled(xe))
+		igt_assert(result != 0);
 
 	/* retrieve back ccs */
 	memcpy(ccsmap, ccscopy, ccssize);
@@ -365,8 +366,9 @@ static void block_copy(int xe,
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

