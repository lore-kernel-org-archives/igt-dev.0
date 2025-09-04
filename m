Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8782CA1012
	for <igt-dev@archiver.kernel.org>; Thu,  4 Sep 2025 08:27:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BD6210E9B5;
	Thu,  4 Sep 2025 08:27:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GyouzKFB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCA8510E9B0
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Sep 2025 08:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756974434; x=1788510434;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=KuQ58IgXrwUWSn5vKZ+/pDK7CncNswKBnSLwzqVpL2c=;
 b=GyouzKFBELt8PYEF2T9cXmbgxzthidw1aqPlDvsfd8pg+pCiS6UfzdWS
 o5Bk1QB8WqfgrxDGt3/jAi5xGAGAQmIS2MH6KjJn6BPEE2YpG/DDlOpZQ
 kb0BbrWDnLiHnrlS4LHRnYE3oAAolK/nd/l5QtjUflVr9DJgladht3zH/
 nlaEXdWsC7bwea/UZbVq2Vkr3IQ5NssL3hD0mZO+dCIX8qodLvXyDrBMd
 sGRMWBoxwBppSiD/JAmxKjPGZEyOzjAq1pA4pfTcZCMs490kuwINwLymL
 B5+3XSClXCS3E2asfzEtxq4j+KdA6h00rFKfaWUE07mJ3uy+7hD7PwMmX A==;
X-CSE-ConnectionGUID: H68SPkoWTEebSgzYBVIPGQ==
X-CSE-MsgGUID: H1zeA8GFRtCLNe/1aB4xmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="61938003"
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; d="scan'208";a="61938003"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 01:27:14 -0700
X-CSE-ConnectionGUID: SwLQMRt8SJOcg/pLnC1X1A==
X-CSE-MsgGUID: VuNqspBnTuS5xQbFku/y2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; d="scan'208";a="171945403"
Received: from dut2051bmgfrd.iind.intel.com ([10.190.232.68])
 by orviesa008.jf.intel.com with ESMTP; 04 Sep 2025 01:27:11 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, pravalika.gurram@intel.com,
 himal.prasad.ghimiray@intel.com, matthew.brost@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH v12 4/5] tests/intel/xe_exec_system_allocator: Add
 madvise-swizzle test
Date: Thu,  4 Sep 2025 08:27:00 +0000
Message-ID: <20250904082701.2154029-5-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250904082701.2154029-1-nishit.sharma@intel.com>
References: <20250904082701.2154029-1-nishit.sharma@intel.com>
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

madvise-swizzle test introduced which is called in combination with other
tests as well. In this test the buffer object preferred location is
system memory. MADVISE_SWIZZLE called in main loop to toggle between
SYSTEM/DEVICE on each pass.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 35 ++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index e7f3d423a..8d9696a33 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -777,6 +777,7 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
 #define PROCESSES		(0x1 << 24)
 #define PREFETCH_BENCHMARK	(0x1 << 25)
 #define PREFETCH_SYS_BENCHMARK	(0x1 << 26)
+#define MADVISE_SWIZZLE			(0x1 << 27)
 
 #define N_MULTI_FAULT		4
 
@@ -885,7 +886,9 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
  * arg[1]:
  *
  * @malloc:				malloc single buffer for all execs, issue a command which will trigger multiple faults
+ * @malloc-madvise:			malloc single buffer for all execs, issue a command which will trigger multiple faults, perfoems madvise operation
  * @malloc-prefetch:			malloc single buffer for all execs, prefetch buffer before each exec
+ * @malloc-prefetch-madvise:		malloc single buffer for all execs, prefetch buffer before each exec, performs madvise operation
  * @malloc-multi-fault:			malloc single buffer for all execs
  * @malloc-fork-read:			malloc single buffer for all execs, fork a process to read test output
  * @malloc-fork-read-after:		malloc single buffer for all execs, fork a process to read test output, check again after fork returns in parent
@@ -897,6 +900,7 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
  * @mmap:				mmap single buffer for all execs
  * @mmap-prefetch:			mmap single buffer for all execs, prefetch buffer before each exec
  * @mmap-remap:				mmap and mremap a buffer for all execs
+ * @mmap-remap-madvise:			mmap and mremap a buffer for all execs, performs madvise operations
  * @mmap-remap-dontunmap:		mmap and mremap a buffer with dontunmap flag for all execs
  * @mmap-remap-ro:			mmap and mremap a read-only buffer for all execs
  * @mmap-remap-ro-dontunmap:		mmap and mremap a read-only buffer with dontunmap flag for all execs
@@ -916,16 +920,20 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
  * @mmap-file-mlock:			mmap and mlock single buffer, with file backing, for all execs
  * @mmap-race:				mmap single buffer for all execs with race between cpu and gpu access
  * @free:				malloc and free buffer for each exec
+ * @free-madvise:			malloc and free buffer for each exec, performs madvise operation
  * @free-race:				malloc and free buffer for each exec with race between cpu and gpu access
  * @new:				malloc a new buffer for each exec
+ * @new-madvise:			malloc a new buffer for each exec, performs madvise operation
  * @new-prefetch:			malloc a new buffer and prefetch for each exec
  * @new-race:				malloc a new buffer for each exec with race between cpu and gpu access
  * @new-bo-map:				malloc a new buffer or map BO for each exec
  * @new-busy:				malloc a new buffer for each exec, try to unbind while buffers valid
  * @mmap-free:				mmap and free buffer for each exec
+ * @mmap-free-madvise:			mmap and free buffer for each exec, performs madvise operation
  * @mmap-free-huge:			mmap huge page and free buffer for each exec
  * @mmap-free-race:			mmap and free buffer for each exec with race between cpu and gpu access
  * @mmap-new:				mmap a new buffer for each exec
+ * @mmap-new-madvise:			mmap a new buffer for each exec and perform madvise operation
  * @mmap-new-huge:			mmap huge page a new buffer for each exec
  * @mmap-new-race:			mmap a new buffer for each exec with race between cpu and gpu access
  * @malloc-nomemset:			malloc single buffer for all execs, skip memset of buffers
@@ -999,6 +1007,23 @@ static void igt_require_hugepages(void)
 		      "No huge pages available!\n");
 }
 
+static void
+madvise_swizzle_op_exec(int fd, uint32_t vm, struct test_exec_data *data,
+		size_t bo_size, uint64_t addr, int index)
+{
+	int preferred_loc;
+
+	if (index % 2 == 0)
+		preferred_loc = DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM;
+	else
+		preferred_loc = DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE;
+
+	xe_vm_madvise(fd, vm, to_user_pointer(data), bo_size, 0,
+			DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+			preferred_loc,
+			0);
+}
+
 static void
 test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	  int n_exec_queues, int n_execs, size_t bo_size,
@@ -1210,6 +1235,9 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		if (barrier)
 			pthread_barrier_wait(barrier);
 
+		if (flags & MADVISE_SWIZZLE)
+			madvise_swizzle_op_exec(fd, vm, data, bo_size, addr, i);
+
 		if (flags & MULTI_FAULT) {
 			b = 0;
 			for (j = 0; j < N_MULTI_FAULT - 1; ++j)
@@ -1790,7 +1818,9 @@ igt_main
 	struct drm_xe_engine_class_instance *hwe;
 	const struct section sections[] = {
 		{ "malloc", 0 },
+		{ "malloc-madvise", MADVISE_SWIZZLE },
 		{ "malloc-prefetch", PREFETCH },
+		{ "malloc-prefetch-madvise", PREFETCH | MADVISE_SWIZZLE },
 		{ "malloc-multi-fault", MULTI_FAULT },
 		{ "malloc-fork-read", FORK_READ },
 		{ "malloc-fork-read-after", FORK_READ | FORK_READ_AFTER },
@@ -1802,6 +1832,7 @@ igt_main
 		{ "mmap", MMAP },
 		{ "mmap-prefetch", MMAP | PREFETCH },
 		{ "mmap-remap", MMAP | MREMAP },
+		{ "mmap-remap-madvise", MMAP | MREMAP | MADVISE_SWIZZLE },
 		{ "mmap-remap-dontunmap", MMAP | MREMAP | DONTUNMAP },
 		{ "mmap-remap-ro", MMAP | MREMAP | READ_ONLY_REMAP },
 		{ "mmap-remap-ro-dontunmap", MMAP | MREMAP | DONTUNMAP |
@@ -1828,16 +1859,20 @@ igt_main
 		{ "mmap-file-mlock", MMAP | LOCK | FILE_BACKED },
 		{ "mmap-race", MMAP | RACE },
 		{ "free", NEW | FREE },
+		{ "free-madvise", NEW | FREE | MADVISE_SWIZZLE },
 		{ "free-race", NEW | FREE | RACE },
 		{ "new", NEW },
+		{ "new-madvise", NEW | MADVISE_SWIZZLE },
 		{ "new-prefetch", NEW | PREFETCH },
 		{ "new-race", NEW | RACE },
 		{ "new-bo-map", NEW | BO_MAP },
 		{ "new-busy", NEW | BUSY },
 		{ "mmap-free", MMAP | NEW | FREE },
+		{ "mmap-free-madvise", MMAP | NEW | FREE | MADVISE_SWIZZLE },
 		{ "mmap-free-huge", MMAP | NEW | FREE | HUGE_PAGE },
 		{ "mmap-free-race", MMAP | NEW | FREE | RACE },
 		{ "mmap-new", MMAP | NEW },
+		{ "mmap-new-madvise", MMAP | NEW | MADVISE_SWIZZLE },
 		{ "mmap-new-huge", MMAP | NEW | HUGE_PAGE },
 		{ "mmap-new-race", MMAP | NEW | RACE },
 		{ "malloc-nomemset", SKIP_MEMSET },
-- 
2.43.0

