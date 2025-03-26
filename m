Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17311C36012
	for <igt-dev@archiver.kernel.org>; Wed, 26 Mar 2025 12:07:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3663110E6B9;
	Wed, 26 Mar 2025 12:07:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="focexUPY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6881F10E6B5
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Mar 2025 12:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742990840; x=1774526840;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ofC5YWP3rdSi+YSRQ23ojhwO0MUEHAUBZExy0G2f87c=;
 b=focexUPYWOPbnRZWFIBJIc0Ly+xVKknW7CFluCRhCALmZ+7uO+UwaK21
 h83QPHNzjxUQtEEuqJs6rHwYwsvMfhZgLGybsd1tvnFFoWO1b1AwHztPR
 xt1mV63dicW7zf2/mXG0TnUY3xLND9mBCw/ll5GBcxadpaErJAs0kJGro
 lFL61voN6rbaM5S6r5y5kCqcFqA62sxes45ahUnCO7XmC2zy9wsLwTxI5
 9kLPXxx9vvn1lhJlUzg/8rRPcRX/d2Ls3GarC+sd67qgGDxnRm0K3drn6
 sQGnAdBo5ExdhN779loOzsIxwxZe/hkVJKYVboS/17f9iZTEweu+EWq/2 A==;
X-CSE-ConnectionGUID: 9Pk7eLrESraF6FYl8oeIXA==
X-CSE-MsgGUID: KwZvvdcZS9CK39Te3+i/sg==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="44162021"
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; d="scan'208";a="44162021"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 05:07:15 -0700
X-CSE-ConnectionGUID: +ua74VShRi2hrhMJHmnDsA==
X-CSE-MsgGUID: BoKOdR3qRxSMf6m0Oq9nJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; d="scan'208";a="155756717"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 05:07:14 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t,
 v3 3/5] lib/xe/xe_util: Control ncopies in xe_blt_mem_copy()
Date: Wed, 26 Mar 2025 13:02:58 +0100
Message-ID: <20250326120623.124595-4-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250326120623.124595-1-francois.dugast@intel.com>
References: <20250326120623.124595-1-francois.dugast@intel.com>
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

The new xe_blt_mem_copy() argument ncopies is handed over to the
underlying function blt_mem_copy() which actually runs the copy,
so that the caller of xe_blt_mem_copy() can use it to stress the
hardware copy functions.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 lib/xe/xe_util.c            | 5 +++--
 lib/xe/xe_util.h            | 2 +-
 tests/intel/xe_copy_basic.c | 2 +-
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/lib/xe/xe_util.c b/lib/xe/xe_util.c
index 2d9e67955..420f77640 100644
--- a/lib/xe/xe_util.c
+++ b/lib/xe/xe_util.c
@@ -288,11 +288,12 @@ uint32_t xe_nsec_to_ticks(int fd, int gt_id, uint64_t nsec)
  * @width: width
  * @height: height
  * @region: memory region
+ * @ncopies: how many times copy is run, > 1 can be used to stress the copy function
  *
  * Copy BO with mem blit from @src_handle into @dst_handle.
  */
 void xe_blt_mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_ctx_t *ctx,
-		     uint32_t size, uint32_t width, uint32_t height, uint32_t region)
+		     uint32_t size, uint32_t width, uint32_t height, uint32_t region, int ncopies)
 {
 	struct blt_mem_data mem = {};
 	uint64_t bb_size = xe_bb_size(fd, SZ_4K);
@@ -319,7 +320,7 @@ void xe_blt_mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const int
 	blt_set_batch(&mem.bb, bb, bb_size, region);
 	igt_assert(mem.src.width == mem.dst.width);
 
-	blt_mem_copy(fd, ctx, NULL, ahnd, &mem, 1);
+	blt_mem_copy(fd, ctx, NULL, ahnd, &mem, ncopies);
 	result = memcmp(mem.src.ptr, mem.dst.ptr, mem.src.size);
 
 	intel_allocator_bind(ahnd, 0, 0);
diff --git a/lib/xe/xe_util.h b/lib/xe/xe_util.h
index 550c62101..bf532a385 100644
--- a/lib/xe/xe_util.h
+++ b/lib/xe/xe_util.h
@@ -50,6 +50,6 @@ void xe_bind_unbind_async(int fd, uint32_t vm, uint32_t bind_engine,
 uint32_t xe_nsec_to_ticks(int fd, int gt_id, uint64_t ns);
 
 void xe_blt_mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_ctx_t *ctx,
-		     uint32_t size, uint32_t width, uint32_t height, uint32_t region);
+		     uint32_t size, uint32_t width, uint32_t height, uint32_t region, int ncopies);
 
 #endif /* XE_UTIL_H */
diff --git a/tests/intel/xe_copy_basic.c b/tests/intel/xe_copy_basic.c
index b7cee6f62..a6b2e9d27 100644
--- a/tests/intel/xe_copy_basic.c
+++ b/tests/intel/xe_copy_basic.c
@@ -44,7 +44,7 @@ static void
 mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_ctx_t *ctx,
 	 uint32_t size, uint32_t width, uint32_t height, uint32_t region)
 {
-	xe_blt_mem_copy(fd, src_handle, dst_handle, ctx, size, width, height, region);
+	xe_blt_mem_copy(fd, src_handle, dst_handle, ctx, size, width, height, region, 1);
 }
 
 /**
-- 
2.43.0

