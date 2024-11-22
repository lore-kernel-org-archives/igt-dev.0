Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19056E69183
	for <igt-dev@archiver.kernel.org>; Fri, 22 Nov 2024 16:47:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC83B10EBFE;
	Fri, 22 Nov 2024 16:47:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c0DK/EUe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2E4810EBFE
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Nov 2024 16:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732294075; x=1763830075;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QR5UZeoxj7nraBZnj1Ljo3kKBCS7XHbaKhAGp884Zrs=;
 b=c0DK/EUeFOgRy5/G+1XTAQoeiTcTqYDHt+RiP9NYrYzj9i1ZMSs71fql
 A/+MbXNkkibIVpls/MreI5J3Li0SV3sXSyh6ESiiFWLGfi55sIqWCUpbQ
 /ieIppds193pB7RhcWkgliG0z3hXuh/mzkXFyXoN4Yid/bkyvb8/g0d2P
 Gu3kvM+Klc7090pd5KH66KDrnmDuBEO2B+eu346FygQzbnHlR87K/F4Iy
 aOXIjErzDekyvdBKF1rltXhNjCsHM6D5syY2dTmSoQ0lDxFAI0VHdNbxI
 xM3tjbacPdeGOD+xb8KYzfrktJ2TouSuYta/lqk/dxiPx+Z93Yf84d78F Q==;
X-CSE-ConnectionGUID: Q2IEEOk1QGOHxdWtJ0vAMw==
X-CSE-MsgGUID: p3zgyc0mQSmXMGfTD2tIng==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="32615199"
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; d="scan'208";a="32615199"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2024 08:47:42 -0800
X-CSE-ConnectionGUID: QBkmPcVdSaSspCAKnvUyeQ==
X-CSE-MsgGUID: /k6fMpPjSI2FFlJtEETYLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; d="scan'208";a="121482731"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.10])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2024 08:47:41 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_mmap: fix assert_caching on small-bar
Date: Fri, 22 Nov 2024 16:47:30 +0000
Message-ID: <20241122164730.326543-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.47.0
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

Make sure we ask for DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM to avoid
sigbus here.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 tests/intel/xe_mmap.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/tests/intel/xe_mmap.c b/tests/intel/xe_mmap.c
index fc5d73d59..d818cc2f8 100644
--- a/tests/intel/xe_mmap.c
+++ b/tests/intel/xe_mmap.c
@@ -207,7 +207,8 @@ static void test_small_bar(int fd)
 	gem_close(fd, bo);
 }
 
-static void assert_caching(int fd, uint64_t placement, uint16_t cpu_caching, bool fail)
+static void assert_caching(int fd, uint64_t placement, uint32_t flags,
+			   uint16_t cpu_caching, bool fail)
 {
 	uint64_t size = xe_get_default_alignment(fd);
 	uint64_t mmo;
@@ -215,7 +216,7 @@ static void assert_caching(int fd, uint64_t placement, uint16_t cpu_caching, boo
 	uint32_t *map;
 	bool ret;
 
-	ret = __xe_bo_create_caching(fd, 0, size, placement, 0, cpu_caching, &handle);
+	ret = __xe_bo_create_caching(fd, 0, size, placement, flags, cpu_caching, &handle);
 	igt_assert(ret == fail);
 
 	if (fail)
@@ -237,22 +238,26 @@ static void test_cpu_caching(int fd)
 {
 	if (vram_memory(fd, 0)) {
 		assert_caching(fd, vram_memory(fd, 0),
+			       DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
 			       DRM_XE_GEM_CPU_CACHING_WC, false);
 		assert_caching(fd, vram_memory(fd, 0) | system_memory(fd),
+			       DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
 			       DRM_XE_GEM_CPU_CACHING_WC, false);
 
 		assert_caching(fd, vram_memory(fd, 0),
+			       DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
 			       DRM_XE_GEM_CPU_CACHING_WB, true);
 		assert_caching(fd, vram_memory(fd, 0) | system_memory(fd),
+			       DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
 			       DRM_XE_GEM_CPU_CACHING_WB, true);
 	}
 
-	assert_caching(fd, system_memory(fd), DRM_XE_GEM_CPU_CACHING_WB, false);
-	assert_caching(fd, system_memory(fd), DRM_XE_GEM_CPU_CACHING_WC, false);
+	assert_caching(fd, system_memory(fd), 0, DRM_XE_GEM_CPU_CACHING_WB, false);
+	assert_caching(fd, system_memory(fd), 0, DRM_XE_GEM_CPU_CACHING_WC, false);
 
-	assert_caching(fd, system_memory(fd), -1, true);
-	assert_caching(fd, system_memory(fd), 0, true);
-	assert_caching(fd, system_memory(fd), DRM_XE_GEM_CPU_CACHING_WC + 1, true);
+	assert_caching(fd, system_memory(fd), 0, -1, true);
+	assert_caching(fd, system_memory(fd), 0, 0, true);
+	assert_caching(fd, system_memory(fd), 0, DRM_XE_GEM_CPU_CACHING_WC + 1, true);
 }
 
 igt_main
-- 
2.47.0

