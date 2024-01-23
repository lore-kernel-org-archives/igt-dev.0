Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0893C47258
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jan 2024 18:33:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CA0D10E44C;
	Tue, 23 Jan 2024 18:33:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1486A10E44C
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jan 2024 18:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706034821; x=1737570821;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7VUngL4HLWutk09z3DHTuKHSY1emvRWh6QTK7M8pl/U=;
 b=kKo0Qd5FLHvnM06Yk9Fx4PjROXDdlQGgazlMKEJ/GX/cwsemYuX0ojdy
 n3Y53kGC/N4agMi1ojj4FcJeHy8LsrMnCtfNBXEkjC0t8qfeH3g/RQIoN
 xiGtm5hn3mx3lfP1LJNNIU7dgo8t/Hf6QR5yglFr/bG8QQKHgA4ccrAhg
 ILpj+IBewirjiHTAPCJEJqrL5VU3notbU38ohDboDrVQ27x/TH91avDYw
 s3yvxCQFAKpG1mWvUDKqwr53UoKPqUkt9tkabZ/i2kLqu51N38kMB3Trl
 IktLB5mXOvtBIdzwMOnDaRRIbYOk9N78DouOldj1Pssx+WO1ixAsjTC/B g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="1496357"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="1496357"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 10:33:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="909392721"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="909392721"
Received: from kogorman-mobl.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.18.165])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 10:33:38 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 1/2] tests/intel/xe_copy_basic: account for prefetch
Date: Tue, 23 Jan 2024 18:33:22 +0000
Message-ID: <20240123183323.173424-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.43.0
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

Xe2 expects an extra page after the batch to avoid prefetch hitting an
invalid page. Not doing so can result in CAT errors.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/intel/xe_copy_basic.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_copy_basic.c b/tests/intel/xe_copy_basic.c
index 1bde876cd..3ae5a7291 100644
--- a/tests/intel/xe_copy_basic.c
+++ b/tests/intel/xe_copy_basic.c
@@ -44,7 +44,7 @@ mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_ctx_t *ct
 	 uint32_t size, uint32_t width, uint32_t height, uint32_t region)
 {
 	struct blt_mem_data mem = {};
-	uint64_t bb_size = xe_get_default_alignment(fd);
+	uint64_t bb_size;
 	uint64_t ahnd = intel_allocator_open_full(fd, ctx->vm, 0, 0,
 						  INTEL_ALLOCATOR_SIMPLE,
 						  ALLOC_STRATEGY_LOW_TO_HIGH, 0);
@@ -53,6 +53,8 @@ mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_ctx_t *ct
 	uint32_t bb;
 	int result;
 
+	bb_size = ALIGN(SZ_4K + xe_cs_prefetch_size(fd),
+			xe_get_default_alignment(fd));
 	bb = xe_bo_create(fd, 0, bb_size, region, 0);
 
 	blt_mem_init(fd, &mem);
@@ -97,7 +99,7 @@ mem_set(int fd, uint32_t dst_handle, const intel_ctx_t *ctx, uint32_t size,
 	uint32_t width, uint32_t height, uint8_t fill_data, uint32_t region)
 {
 	struct blt_mem_data mem = {};
-	uint64_t bb_size = xe_get_default_alignment(fd);
+	uint64_t bb_size;
 	uint64_t ahnd = intel_allocator_open_full(fd, ctx->vm, 0, 0,
 						  INTEL_ALLOCATOR_SIMPLE,
 						  ALLOC_STRATEGY_LOW_TO_HIGH, 0);
@@ -105,6 +107,8 @@ mem_set(int fd, uint32_t dst_handle, const intel_ctx_t *ctx, uint32_t size,
 	uint32_t bb;
 	uint8_t *result;
 
+	bb_size = ALIGN(SZ_4K + xe_cs_prefetch_size(fd),
+			xe_get_default_alignment(fd));
 	bb = xe_bo_create(fd, 0, bb_size, region, 0);
 	blt_mem_init(fd, &mem);
 	blt_set_mem_object(&mem.dst, dst_handle, size, 0, width, height, region,
-- 
2.43.0

