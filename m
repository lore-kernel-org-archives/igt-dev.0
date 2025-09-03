Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F09B5CA1009
	for <igt-dev@archiver.kernel.org>; Wed,  3 Sep 2025 10:37:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A708510E742;
	Wed,  3 Sep 2025 10:37:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ga9qaZA+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4EB610E742
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Sep 2025 10:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756895850; x=1788431850;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=WXG7aCaZY2km0f62oUhfJLmWNTR3OMPtO1Rki9a6xdk=;
 b=Ga9qaZA+TEHxi2z0djEpmu+tSPg7orutTcPCur2Scl7EOomoreqPQKsT
 PygQ54MSt1kA9Y5F+m6Py0Lz2aDk4kzmE6SMVe+VKLii12Ic+GFsL23JT
 CPtqp10eKSDe36ezd56L6fslFLsu91AfdPxa44q6rOkXaFsVjE3BWpI93
 nyMDZfK7S91MpfFzgz19aFkhw8xIdh5sWYDs/MyL7jw4Dr8NTU63Y7V0g
 7/SO5amlwn4ZABLccSqOFASA0IflP2vvkNAn/dTGZRGqbhur0445PS8g1
 S9GYTXyBQupBNKZQBjBQFSCIzkuxmf1ukZH69gprlLOgYbc4PQwcB5Yhp w==;
X-CSE-ConnectionGUID: +QRZncvORhCm81oHLU519Q==
X-CSE-MsgGUID: 1kjrArcLT5Go3nZsk+nQsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="70582221"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="70582221"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 03:37:29 -0700
X-CSE-ConnectionGUID: VXaeUXZqQcuv2qlzQwNyPg==
X-CSE-MsgGUID: FpFo1dOuQ6GiQ7IBj2J79Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="171436759"
Received: from dut2051bmgfrd.iind.intel.com ([10.190.232.68])
 by orviesa007.jf.intel.com with ESMTP; 03 Sep 2025 03:37:27 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, pravalika.gurram@intel.com,
 himal.prasad.ghimiray@intel.com, matthew.brost@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH i-g-t v9 4/5] tests/intel/xe_exec_system_allocator: Add
 madvise-swizzle test
Date: Wed,  3 Sep 2025 10:37:15 +0000
Message-ID: <20250903103716.1780404-5-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250903103716.1780404-1-nishit.sharma@intel.com>
References: <20250903103716.1780404-1-nishit.sharma@intel.com>
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
 tests/intel/xe_exec_system_allocator.c | 32 ++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index e7f3d423a..4a208f6d8 100644
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
@@ -916,8 +920,10 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
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
@@ -999,6 +1005,23 @@ static void igt_require_hugepages(void)
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
@@ -1210,6 +1233,9 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		if (barrier)
 			pthread_barrier_wait(barrier);
 
+		if (flags & MADVISE_SWIZZLE)
+			madvise_swizzle_op_exec(fd, vm, data, bo_size, addr, i);
+
 		if (flags & MULTI_FAULT) {
 			b = 0;
 			for (j = 0; j < N_MULTI_FAULT - 1; ++j)
@@ -1790,7 +1816,9 @@ igt_main
 	struct drm_xe_engine_class_instance *hwe;
 	const struct section sections[] = {
 		{ "malloc", 0 },
+		{ "malloc-madvise", MADVISE_SWIZZLE },
 		{ "malloc-prefetch", PREFETCH },
+		{ "malloc-prefetch-madvise", PREFETCH | MADVISE_SWIZZLE },
 		{ "malloc-multi-fault", MULTI_FAULT },
 		{ "malloc-fork-read", FORK_READ },
 		{ "malloc-fork-read-after", FORK_READ | FORK_READ_AFTER },
@@ -1802,6 +1830,7 @@ igt_main
 		{ "mmap", MMAP },
 		{ "mmap-prefetch", MMAP | PREFETCH },
 		{ "mmap-remap", MMAP | MREMAP },
+		{ "mmap-remap-madvise", MMAP | MREMAP | MADVISE_SWIZZLE },
 		{ "mmap-remap-dontunmap", MMAP | MREMAP | DONTUNMAP },
 		{ "mmap-remap-ro", MMAP | MREMAP | READ_ONLY_REMAP },
 		{ "mmap-remap-ro-dontunmap", MMAP | MREMAP | DONTUNMAP |
@@ -1828,13 +1857,16 @@ igt_main
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
+		{ "mmap-free", MMAP | NEW | FREE | MADVISE_SWIZZLE },
 		{ "mmap-free-huge", MMAP | NEW | FREE | HUGE_PAGE },
 		{ "mmap-free-race", MMAP | NEW | FREE | RACE },
 		{ "mmap-new", MMAP | NEW },
-- 
2.43.0

