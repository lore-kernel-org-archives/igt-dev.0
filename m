Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9847D73EA8
	for <igt-dev@archiver.kernel.org>; Fri, 30 Jan 2026 00:01:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4963E10E169;
	Fri, 30 Jan 2026 00:01:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B3zlndLc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B31110E169
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Jan 2026 00:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769731278; x=1801267278;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6nSJpVOZN/hSqD4HVWDDnpUQfPu6Gd+V1Y2jtmi7Jxk=;
 b=B3zlndLcnSz7L5px5tttHLtfzyssllzw/vTcovsBDmOeJ9lBFEW7gFwf
 DRQIuR5/ob1pKMARC+U6tb2OHTxJalFnXM/ZWSviyHMqNnCsYjx+1YZ8D
 BMODM4u/NMwdroyJqcEWatHxd56X+od+5Y8EVpPoUGcZdr65EHLpzudnK
 hEWiVu2Fgpvqqa8E0I52b8NYyCSXwWR4/hekq7oOmAVJnHpVJlNsfLA4O
 LdCcafCY0i5nUTbVVxRAxy4QOfY1XqzKWVlC097rgsrO+a7FQJ1+QneHZ
 o3zcHM4pe9vVISkON1jzNQhbAqqYgtpG+f7H7BbqsV9NhADWM2KVJXKn5 Q==;
X-CSE-ConnectionGUID: /MoGNvE7RpuPsYXk0YLYFA==
X-CSE-MsgGUID: RkXROmpATuSWxoIKsj+rsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="69999463"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="69999463"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 16:01:17 -0800
X-CSE-ConnectionGUID: JWUdLkx3RaGgDWu9SqXl9Q==
X-CSE-MsgGUID: P/P7srdNQBybLH+EqPmGsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="207845167"
Received: from dut6094bmgfrd.fm.intel.com ([10.80.55.45])
 by orviesa006.jf.intel.com with ESMTP; 29 Jan 2026 16:01:13 -0800
From: Jia Yao <jia.yao@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jia Yao <jia.yao@intel.com>,
	Xin Wang <x.wang@intel.com>
Subject: [PATCH v3] tests/intel/xe_exec_system_allocator: Expect UC PAT
 madvise rejection
Date: Fri, 30 Jan 2026 00:01:08 +0000
Message-ID: <20260130000108.551105-1-jia.yao@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260129003146.340181-1-jia.yao@intel.com>
References: <20260129003146.340181-1-jia.yao@intel.com>
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

UC PAT index with CPU cached memory (system allocator) is now rejected
by kernel to prevent security issues where GPU could bypass CPU cache
and read stale sensitive data from DRAM.

Modify UC PAT index tests to verify kernel correctly rejects the madvise
call with -EINVAL, instead of attempting to execute batch buffers.

v2(Xin Wang)
- Put madvise rejection in a function

v3:
- Add multi-vma check in the function

Cc: Xin Wang <x.wang@intel.com>
Signed-off-by: Jia Yao <jia.yao@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 72 ++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index 412ad0384..b88d8662b 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -2246,6 +2246,70 @@ test_compute(int fd, size_t size, unsigned int flags)
 	xe_vm_destroy(fd, vm);
 }
 
+/**
+ * test_uc_pat_madvise_rejected - Verify UC PAT madvise is rejected for CPU cached memory
+ * @fd: file descriptor
+ * @pat_index: UC PAT index to test
+ * @is_multi_vma: Is multi vma or not
+ *
+ * UC PAT index with CPU cached memory (system allocator) is rejected by kernel
+ * to prevent security issues where GPU could bypass CPU cache and read stale
+ * sensitive data from DRAM.
+ */
+static void
+test_uc_pat_madvise_rejected(int fd, uint8_t pat_index, bool is_multi_vma)
+{
+	struct drm_xe_sync sync[1] = {
+		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
+	};
+	uint64_t addr, bind_sync = 0;
+	uint64_t bo_size = SZ_4M;
+	uint64_t alloc_size = is_multi_vma ? bo_size * 2 : bo_size;
+	uint32_t vm;
+	void *data;
+	int err;
+
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
+			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+	data = aligned_alloc(SZ_4K, alloc_size);
+	igt_assert(data);
+	memset(data, 0, alloc_size);
+	addr = to_user_pointer(data);
+
+	/* Bind memory to create VMA first */
+	sync[0].addr = to_user_pointer(&bind_sync);
+	sync[0].timeline_value = 1;
+	__xe_vm_bind_assert(fd, vm, 0, 0, 0, addr, alloc_size,
+			    DRM_XE_VM_BIND_OP_MAP,
+			    DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR,
+			    sync, 1, 0, 0);
+	xe_wait_ufence(fd, &bind_sync, 1, 0, FIVE_SEC);
+
+	/* Madvise should fail with -EINVAL for UC PAT */
+	if (is_multi_vma) {
+		/* Test multiple ranges like original test_exec does */
+		err = __xe_vm_madvise(fd, vm, addr + bo_size, bo_size / 2,
+				      0, DRM_XE_MEM_RANGE_ATTR_PAT, pat_index, 0, 0);
+		igt_assert_eq(err, -EINVAL);
+
+		err = __xe_vm_madvise(fd, vm, addr, bo_size,
+				      0, DRM_XE_MEM_RANGE_ATTR_PAT, pat_index, 0, 0);
+		igt_assert_eq(err, -EINVAL);
+
+		err = __xe_vm_madvise(fd, vm, addr + bo_size / 2, bo_size / 4,
+				      0, DRM_XE_MEM_RANGE_ATTR_PAT, pat_index, 0, 0);
+		igt_assert_eq(err, -EINVAL);
+	} else {
+		err = __xe_vm_madvise(fd, vm, addr, bo_size,
+				      0, DRM_XE_MEM_RANGE_ATTR_PAT, pat_index, 0, 0);
+		igt_assert_eq(err, -EINVAL);
+	}
+
+	free(data);
+	xe_vm_destroy(fd, vm);
+}
+
 struct section {
 	const char *name;
 	unsigned long long flags;
@@ -2633,6 +2697,14 @@ int igt_main()
 			     !xe_has_vram(fd)) {
 				igt_skip("Skipping compression-related PAT index\n");
 			}
+
+		if (strstr(s->name, "madvise-pat-idx-uc-")) {
+			bool is_multi = !!(s->flags & MADVISE_MULTI_VMA);
+
+			test_uc_pat_madvise_rejected(fd, s->fn(fd), is_multi);
+			continue;
+		}
+
 			xe_for_each_engine(fd, hwe)
 				test_exec(fd, hwe, 1, 1, SZ_4M, 0, 0, NULL, NULL, s->flags, s->fn);
 		}
-- 
2.43.0

