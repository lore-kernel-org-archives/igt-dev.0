Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B063CA0FFE
	for <igt-dev@archiver.kernel.org>; Tue,  2 Sep 2025 16:31:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 505BE10E7F0;
	Tue,  2 Sep 2025 16:31:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CFQRwQLe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BF6810E7F0
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Sep 2025 16:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756830664; x=1788366664;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=eTZOKex8O6qMJKTsnh+dYpPW2B9Cx/aik4hIQwKlr2E=;
 b=CFQRwQLeC58SiPFWLhGpGJel2lK9wL/oJiFbje2DvUIdiSJd9Yz8emuR
 vRus5RlK9dKUzk2H9RXuwdGhQrvsKIzJILg+/L+BKrF1+dlCbbbYqg+w/
 97e7dVMk3UZwo3jSboxQMLeYdRR3e4qMYlCoktF8KupLh57NuRwh6jTGR
 Sf5DrTMPJA8D3DdQfrlsnIpZEcM2IvN48xr+/7q38Eluo5k3h/C3xpIR2
 3eaBECvRvzfoxGzZhCJFOKD9Ugg6DEu3HuveIN8SjlYH24l/TGIutXv3X
 EqqkLYaGNnJiS3ZdxUiVaI6AXI96tVcfTsoe5EUg14x3bWG98vegSf5v5 g==;
X-CSE-ConnectionGUID: uUuiN6I1TWSWOScXm/Upbg==
X-CSE-MsgGUID: K70TcRxnRDaLjRpy487yKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="58814606"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="58814606"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 09:31:03 -0700
X-CSE-ConnectionGUID: sfUJVfU+SU6+seP1LNR6Pg==
X-CSE-MsgGUID: 1XvWbfItSm29qqG3fTOlGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="171288468"
Received: from dut2051bmgfrd.iind.intel.com ([10.190.232.68])
 by fmviesa006.fm.intel.com with ESMTP; 02 Sep 2025 09:31:01 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, pravalika.gurram@intel.com,
 himal.prasad.ghimiray@intel.com, matthew.brost@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH i-g-t v8 4/5] tests/intel/xe_exec_system_allocator: Add
 madvise-swizzle test
Date: Tue,  2 Sep 2025 16:30:50 +0000
Message-ID: <20250902163051.1470191-5-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250902163051.1470191-1-nishit.sharma@intel.com>
References: <20250902163051.1470191-1-nishit.sharma@intel.com>
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
system memory.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 39 ++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index e7f3d423a..16f907ab5 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -777,6 +777,8 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
 #define PROCESSES		(0x1 << 24)
 #define PREFETCH_BENCHMARK	(0x1 << 25)
 #define PREFETCH_SYS_BENCHMARK	(0x1 << 26)
+#define MADVISE_SWIZZLE			(0x1 << 27)
+#define MADVISE_OP			(0x1 << 28)
 
 #define N_MULTI_FAULT		4
 
@@ -885,7 +887,9 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
  * arg[1]:
  *
  * @malloc:				malloc single buffer for all execs, issue a command which will trigger multiple faults
+ * @malloc-madvise:			malloc single buffer for all execs, issue a command which will trigger multiple faults, perfoems madvise operation
  * @malloc-prefetch:			malloc single buffer for all execs, prefetch buffer before each exec
+ * @malloc-prefetch-madvise:		malloc single buffer for all execs, prefetch buffer before each exec, performs madvise operation
  * @malloc-multi-fault:			malloc single buffer for all execs
  * @malloc-fork-read:			malloc single buffer for all execs, fork a process to read test output
  * @malloc-fork-read-after:		malloc single buffer for all execs, fork a process to read test output, check again after fork returns in parent
@@ -897,6 +901,7 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
  * @mmap:				mmap single buffer for all execs
  * @mmap-prefetch:			mmap single buffer for all execs, prefetch buffer before each exec
  * @mmap-remap:				mmap and mremap a buffer for all execs
+ * @mmap-remap-madvise:			mmap and mremap a buffer for all execs, performs madvise operations
  * @mmap-remap-dontunmap:		mmap and mremap a buffer with dontunmap flag for all execs
  * @mmap-remap-ro:			mmap and mremap a read-only buffer for all execs
  * @mmap-remap-ro-dontunmap:		mmap and mremap a read-only buffer with dontunmap flag for all execs
@@ -916,8 +921,10 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
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
@@ -999,6 +1006,29 @@ static void igt_require_hugepages(void)
 		      "No huge pages available!\n");
 }
 
+static void
+xe_vm_parse_execute_madvise(int fd, uint32_t vm, struct test_exec_data * data,
+			    size_t bo_size, struct drm_xe_engine_class_instance *eci,
+			    uint64_t addr, unsigned int flags)
+{
+	if (flags & MADVISE_SWIZZLE) {
+		for (int i_loc = 0; i_loc < 2; i_loc++) {
+			uint64_t preferred_loc;
+
+			if (i_loc % 2 == 0)
+				preferred_loc = DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM;
+			else
+				preferred_loc = DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE;
+
+			xe_vm_madvise(fd, vm, to_user_pointer(data), bo_size, 0,
+					DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+					preferred_loc,
+					0);
+		}
+	}
+
+}
+
 static void
 test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	  int n_exec_queues, int n_execs, size_t bo_size,
@@ -1134,6 +1164,9 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 
 	addr = to_user_pointer(data);
 
+	if (flags & MADVISE_OP)
+		xe_vm_parse_execute_madvise(fd, vm, data, bo_size, eci, addr, flags);
+
 	if (flags & BO_UNMAP) {
 		bo_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
 		bo = xe_bo_create(fd, vm, bo_size,
@@ -1790,7 +1823,9 @@ igt_main
 	struct drm_xe_engine_class_instance *hwe;
 	const struct section sections[] = {
 		{ "malloc", 0 },
+		{ "malloc-madvise", MADVISE_OP | MADVISE_SWIZZLE },
 		{ "malloc-prefetch", PREFETCH },
+		{ "malloc-prefetch-madvise", PREFETCH | MADVISE_OP | MADVISE_SWIZZLE },
 		{ "malloc-multi-fault", MULTI_FAULT },
 		{ "malloc-fork-read", FORK_READ },
 		{ "malloc-fork-read-after", FORK_READ | FORK_READ_AFTER },
@@ -1802,6 +1837,7 @@ igt_main
 		{ "mmap", MMAP },
 		{ "mmap-prefetch", MMAP | PREFETCH },
 		{ "mmap-remap", MMAP | MREMAP },
+		{ "mmap-remap-madvise", MMAP | MREMAP | MADVISE_OP | MADVISE_SWIZZLE },
 		{ "mmap-remap-dontunmap", MMAP | MREMAP | DONTUNMAP },
 		{ "mmap-remap-ro", MMAP | MREMAP | READ_ONLY_REMAP },
 		{ "mmap-remap-ro-dontunmap", MMAP | MREMAP | DONTUNMAP |
@@ -1828,13 +1864,16 @@ igt_main
 		{ "mmap-file-mlock", MMAP | LOCK | FILE_BACKED },
 		{ "mmap-race", MMAP | RACE },
 		{ "free", NEW | FREE },
+		{ "free-madvise", NEW | FREE | MADVISE_OP | MADVISE_SWIZZLE },
 		{ "free-race", NEW | FREE | RACE },
 		{ "new", NEW },
+		{ "new-madvise", NEW | MADVISE_OP | MADVISE_SWIZZLE },
 		{ "new-prefetch", NEW | PREFETCH },
 		{ "new-race", NEW | RACE },
 		{ "new-bo-map", NEW | BO_MAP },
 		{ "new-busy", NEW | BUSY },
 		{ "mmap-free", MMAP | NEW | FREE },
+		{ "mmap-free", MMAP | NEW | FREE | MADVISE_OP | MADVISE_SWIZZLE },
 		{ "mmap-free-huge", MMAP | NEW | FREE | HUGE_PAGE },
 		{ "mmap-free-race", MMAP | NEW | FREE | RACE },
 		{ "mmap-new", MMAP | NEW },
-- 
2.43.0

