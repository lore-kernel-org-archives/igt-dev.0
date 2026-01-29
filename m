Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10266D73E9E
	for <igt-dev@archiver.kernel.org>; Thu, 29 Jan 2026 22:51:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98B7910E1EA;
	Thu, 29 Jan 2026 22:51:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cMlpyCNt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8162610E1EA
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jan 2026 22:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769727071; x=1801263071;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7zQX8fiCF4HNct5kFwYMKysoBKc91LkLnC0DXovWbAg=;
 b=cMlpyCNtbGn2MouHPPdXeRTUxRxT8VmUFKSEjHopj6HEm8DtCFlVyNob
 2FECqudfu+TUekCvh7OxQUVWdoG2abWMzgTXIJ2ocXhw5CDWF/4AGsT4U
 bwd8E8qB80TUnz0tgq/G2nCq7hNHytZWAjMG8YGKD9oc9Hur5TkSub37G
 FNylISvtLQsx8FI5qFVpDZZ3R2knK0U/rRGQ4EoCxlJlXYzdDLvRWWDsA
 lrObmtnJu2oice3bUOmQxmBK+PfcmfoMkTv8yGdRiwcgfoX0vjk31vhTS
 rGYARQjoWvoidbkc1siO1oIoLZ5yaGM9Z+4wlmYUBhW5K9b99TjxLvrDv A==;
X-CSE-ConnectionGUID: ICylbtY4TNuqZM1gSMPeOQ==
X-CSE-MsgGUID: cKiKJPCYTRW36NBbnYm4ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="69995725"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="69995725"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 14:51:11 -0800
X-CSE-ConnectionGUID: Gerhakw5SKmvXwryU+Ugiw==
X-CSE-MsgGUID: sjj/pysLREqOlRZTHkC7Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="209054786"
Received: from dut6094bmgfrd.fm.intel.com ([10.80.55.45])
 by fmviesa010.fm.intel.com with ESMTP; 29 Jan 2026 14:51:11 -0800
From: Jia Yao <jia.yao@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jia Yao <jia.yao@intel.com>,
	Xin Wang <x.wang@intel.com>
Subject: [PATCH v2] tests/intel/xe_exec_system_allocator: Expect UC PAT
 madvise rejection
Date: Thu, 29 Jan 2026 22:51:07 +0000
Message-ID: <20260129225107.541292-1-jia.yao@intel.com>
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

UC_COMP tests are not affected as they require VRAM which uses different
caching.

v2(Xin Wang)
- Put madvise rejection in a function

Cc: Xin Wang <x.wang@intel.com>
Signed-off-by: Jia Yao <jia.yao@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 53 ++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index 412ad0384..d59748ec0 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -2246,6 +2246,53 @@ test_compute(int fd, size_t size, unsigned int flags)
 	xe_vm_destroy(fd, vm);
 }
 
+/**
+ * test_uc_pat_madvise_rejected - Verify UC PAT madvise is rejected for CPU cached memory
+ * @fd: file descriptor
+ * @pat_index: UC PAT index to test
+ *
+ * UC PAT index with CPU cached memory (system allocator) is rejected by kernel
+ * to prevent security issues where GPU could bypass CPU cache and read stale
+ * sensitive data from DRAM.
+ */
+static void
+test_uc_pat_madvise_rejected(int fd, uint8_t pat_index)
+{
+	struct drm_xe_sync sync[1] = {
+		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
+	};
+	uint64_t addr;
+	uint32_t vm;
+	void *data;
+	int err;
+	uint64_t bind_sync = 0;
+
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
+			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+	data = aligned_alloc(SZ_4K, SZ_4M);
+	igt_assert(data);
+	memset(data, 0, SZ_4M);
+	addr = to_user_pointer(data);
+
+	/* Bind memory to create VMA first */
+	sync[0].addr = to_user_pointer(&bind_sync);
+	sync[0].timeline_value = 1;
+	__xe_vm_bind_assert(fd, vm, 0, 0, 0, addr, SZ_4M,
+			    DRM_XE_VM_BIND_OP_MAP,
+			    DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR,
+			    sync, 1, 0, 0);
+	xe_wait_ufence(fd, &bind_sync, 1, 0, FIVE_SEC);
+
+	/* Madvise should fail with -EINVAL */
+	err = __xe_vm_madvise(fd, vm, addr, SZ_4M, 0,
+			      DRM_XE_MEM_RANGE_ATTR_PAT, pat_index, 0, 0);
+	igt_assert_eq(err, -EINVAL);
+
+	free(data);
+	xe_vm_destroy(fd, vm);
+}
+
 struct section {
 	const char *name;
 	unsigned long long flags;
@@ -2633,6 +2680,12 @@ int igt_main()
 			     !xe_has_vram(fd)) {
 				igt_skip("Skipping compression-related PAT index\n");
 			}
+
+		if (strstr(s->name, "madvise-pat-idx-uc-")) {
+			test_uc_pat_madvise_rejected(fd, s->fn(fd));
+			continue;
+		}
+
 			xe_for_each_engine(fd, hwe)
 				test_exec(fd, hwe, 1, 1, SZ_4M, 0, 0, NULL, NULL, s->flags, s->fn);
 		}
-- 
2.43.0

