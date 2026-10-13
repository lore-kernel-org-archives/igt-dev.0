Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF25BCA9ED0
	for <igt-dev@archiver.kernel.org>; Tue, 13 Oct 2026 04:12:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 767BB10E66E;
	Tue, 13 Oct 2026 04:11:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40E6610E66E
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Oct 2026 04:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791864668; x=1823400668;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rG+nRR4UnXFK/j1utu9IqIXmYCsXyx6vnUx1imXfjBc=;
 b=DenGPHHR/lzDF4MvNuHBrC4LQ+W42F53o963kEhCgNUDRr+04gb8yzY0
 IKkQcMGZFggL0CAbGRIYu+w74U8cKISQt6Km0zfF+EwpOwz38JRffM0NK
 Z3RVaPUVUgg5Gho69w0rESX531Bj8SXWLBZeW6nx31ikr1gon+PSUD9i3
 uxQfYFUF4Jng8hwHEo4KOhNfL6VzQyRX5DUFVntyMVMPu4Ag4O3fWDY5o
 YexLP+Aq9V9MqHsCrF9ZKGu2nggeUphJ/LkA/VBOv35vHmR2IGs4dVzcM
 Q6/SFFKTda7ltVoCuXdDcW6oowCfQSg1ygOFHFS99/0UyiqWJb+kfDC4Z Q==;
X-CSE-ConnectionGUID: bXEeLeHxRjy8l8g2lx8ugg==
X-CSE-MsgGUID: jlymrAcxRza6pEhZB8/KbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="571147"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="571147"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 21:11:07 -0700
X-CSE-ConnectionGUID: Uedstdi5Tw2wyli+26HsAw==
X-CSE-MsgGUID: 1wbsoI0USPeqlN1HeoRVJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="2823640"
Received: from dut2116bmgfrd.iind.intel.com ([10.223.34.13])
 by fmviesa013.fm.intel.com with ESMTP; 12 Oct 2026 21:11:05 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	kamil.konieczny@intel.com
Subject: [PATCH] tests/intel/xe_ccs: free CCS snapshot buffer in surf_copy
Date: Tue, 13 Oct 2026 04:11:04 +0000
Message-ID: <20261013041104.1107303-1-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.43.0
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

From: Nishit Sharma <nishit.sharma@intel.com>

Check the CCS snapshot allocation before using it, and release the
buffer in surf_copy() cleanup to avoid leaking memory across calls.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_ccs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
index 4c5fe0311..574f6c06d 100644
--- a/tests/intel/xe_ccs.c
+++ b/tests/intel/xe_ccs.c
@@ -252,6 +252,7 @@ static void surf_copy(int xe,
 		cpu_caching = DRM_XE_GEM_CPU_CACHING_WC;
 	}
 	ccscopy = (uint32_t *) malloc(ccssize);
+	igt_assert(ccscopy);
 	ccs = xe_bo_create_caching(xe, 0, ccs_bo_size, sysmem, 0, cpu_caching);
 	ccs2 = xe_bo_create_caching(xe, 0, ccs_bo_size, sysmem, 0, cpu_caching);
 
@@ -361,6 +362,7 @@ static void surf_copy(int xe,
 		blt_dump_corruption_info_32b(src, dst);
 
 	munmap(ccsmap, ccssize);
+	free(ccscopy);
 	gem_close(xe, ccs);
 	gem_close(xe, ccs2);
 	gem_close(xe, bb1);
-- 
2.43.0

