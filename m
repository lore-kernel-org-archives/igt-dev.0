Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F69CA0FF0
	for <igt-dev@archiver.kernel.org>; Mon,  1 Sep 2025 16:40:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70CF610E4EE;
	Mon,  1 Sep 2025 16:40:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hEb3P89L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5832A10E4EE
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Sep 2025 16:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756744855; x=1788280855;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=5acApuVOohMrw2bCn8tmKz1e/aIQr9s/RJrvBES5bAA=;
 b=hEb3P89LcX0zEtG1ZuJC+oigBWFVYjT1BK7MZe7N5QiIzSZzIXT9zdJS
 BF3Nu8IqOqb6lOXYqmEnoWoecT6H05s1KdOI5cktIPZTNtDiKxCa+zzw3
 oOhWdf6CAO9FXTGvpdVmjnalZNfXU5/I1zz5RMTN/+HC3Fgy8vWWDkPMg
 H1HqkKYFghRr5psmiJKkymeeST/oawn2u4GM9rCDNi/6J1zNhHje8IE/h
 1EgTCfvkdO2MtR6HsgD/cjoH5ppoWZM4Qx0gUo9my4F2nolpJGzOIT7fu
 mtxan23/Woi6CYK/fKTM7/JJTDwnoOFk2Fs4JgtW2kY0ayaL8VYSytcTS A==;
X-CSE-ConnectionGUID: ydaSumkWQIqtJxcbUilHaw==
X-CSE-MsgGUID: EqMemTsrTJCZ2S/h08Nhqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="61641004"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; d="scan'208";a="61641004"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2025 09:40:55 -0700
X-CSE-ConnectionGUID: M44n6A+jR62AWc1Mjlry/g==
X-CSE-MsgGUID: hgzw0fEvR5yZz/vtcdzI+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; d="scan'208";a="171508889"
Received: from dut2051bmgfrd.iind.intel.com ([10.190.232.68])
 by fmviesa009.fm.intel.com with ESMTP; 01 Sep 2025 09:40:53 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, pravalika.gurram@intel.com,
 himal.prasad.ghimiray@intel.com, matthew.brost@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH i-g-t 4/5] tests/intel/xe_exec_system_allocator: Add
 madvise-swizzle test
Date: Mon,  1 Sep 2025 16:40:43 +0000
Message-ID: <20250901164044.1028046-5-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250901164044.1028046-1-nishit.sharma@intel.com>
References: <20250901164044.1028046-1-nishit.sharma@intel.com>
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
system memory. MADVISE ioctl is called with preferred_loc attribute and
migration policy.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 40 ++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index e7f3d423a..6c00719bf 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -778,6 +778,10 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
 #define PREFETCH_BENCHMARK	(0x1 << 25)
 #define PREFETCH_SYS_BENCHMARK	(0x1 << 26)
 
+#define MADVISE_SWIZZLE		(0x1 << 0)
+#define MADVISE_OP		(0x2 << 0)
+
+
 #define N_MULTI_FAULT		4
 
 /**
@@ -885,7 +889,9 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
  * arg[1]:
  *
  * @malloc:				malloc single buffer for all execs, issue a command which will trigger multiple faults
+ * @malloc-madvise:			malloc single buffer for all execs, issue a command which will trigger multiple faults, perfoems madvise operation
  * @malloc-prefetch:			malloc single buffer for all execs, prefetch buffer before each exec
+ * @malloc-prefetch-madvise:		malloc single buffer for all execs, prefetch buffer before each exec, performs madvise operation
  * @malloc-multi-fault:			malloc single buffer for all execs
  * @malloc-fork-read:			malloc single buffer for all execs, fork a process to read test output
  * @malloc-fork-read-after:		malloc single buffer for all execs, fork a process to read test output, check again after fork returns in parent
@@ -897,6 +903,7 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
  * @mmap:				mmap single buffer for all execs
  * @mmap-prefetch:			mmap single buffer for all execs, prefetch buffer before each exec
  * @mmap-remap:				mmap and mremap a buffer for all execs
+ * @mmap-remap-madvise:			mmap and mremap a buffer for all execs, performs madvise operations
  * @mmap-remap-dontunmap:		mmap and mremap a buffer with dontunmap flag for all execs
  * @mmap-remap-ro:			mmap and mremap a read-only buffer for all execs
  * @mmap-remap-ro-dontunmap:		mmap and mremap a read-only buffer with dontunmap flag for all execs
@@ -916,8 +923,10 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
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
@@ -999,6 +1008,28 @@ static void igt_require_hugepages(void)
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
+			if (i_loc % 2 == 0)
+				preferred_loc = DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM;
+			else
+				preferred_loc = DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE;
+
+			xe_vm_madvise(fd, vm, to_user_pointer(data), bo_size, 0,
+					DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+					preferred_loc | (flags & MADVISE_SWIZZLE),
+					0);
+		}
+	}
+
+}
+
 static void
 test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	  int n_exec_queues, int n_execs, size_t bo_size,
@@ -1134,6 +1165,9 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 
 	addr = to_user_pointer(data);
 
+	if (flags & MADVISE_OP)
+		xe_vm_parse_execute_madvise(fd, vm, data, bo_size, eci, addr, flags);
+
 	if (flags & BO_UNMAP) {
 		bo_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
 		bo = xe_bo_create(fd, vm, bo_size,
@@ -1790,7 +1824,9 @@ igt_main
 	struct drm_xe_engine_class_instance *hwe;
 	const struct section sections[] = {
 		{ "malloc", 0 },
+		{ "malloc-madvise", 0 | MADVISE_OP | MADVISE_SWIZZLE },
 		{ "malloc-prefetch", PREFETCH },
+		{ "malloc-prefetch-madvise", PREFETCH | MADVISE_OP | MADVISE_SWIZZLE },
 		{ "malloc-multi-fault", MULTI_FAULT },
 		{ "malloc-fork-read", FORK_READ },
 		{ "malloc-fork-read-after", FORK_READ | FORK_READ_AFTER },
@@ -1802,6 +1838,7 @@ igt_main
 		{ "mmap", MMAP },
 		{ "mmap-prefetch", MMAP | PREFETCH },
 		{ "mmap-remap", MMAP | MREMAP },
+		{ "mmap-remap-madvise", MMAP | MREMAP | MADVISE_OP | MADVISE_SWIZZLE },
 		{ "mmap-remap-dontunmap", MMAP | MREMAP | DONTUNMAP },
 		{ "mmap-remap-ro", MMAP | MREMAP | READ_ONLY_REMAP },
 		{ "mmap-remap-ro-dontunmap", MMAP | MREMAP | DONTUNMAP |
@@ -1828,13 +1865,16 @@ igt_main
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

