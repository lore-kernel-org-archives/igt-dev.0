Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BCD4EF4EC9
	for <igt-dev@archiver.kernel.org>; Mon,  6 Apr 2026 09:54:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF1CB10E13B;
	Mon,  6 Apr 2026 09:54:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XLCEk2HE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E78C10E13B
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Apr 2026 09:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775469278; x=1807005278;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MFKu3R9etk1ueLuwrKvtTWQS8EMbkJee5bqnbZMIiGs=;
 b=XLCEk2HEGcdQGKTz9Ob6Uq9F1/uf3OcAJjG3SB4iclN4vx9V6mguf0z3
 kQoVpclgN2Pk3Dm/60kzDsK/B1MTp9kPXmuigg6Bqi0xcVhEaEzi87UWV
 HgnY0srZEgVOSv3hV6iSHUftA+g4M8WSlqKYEbo9MGCW2/MDEjcjNLlwz
 wFyCA5YHn1BuU2d8SfCEsvWBnQdqyqNlrCCimkX/h4lva7jTgjpTCDVlC
 5fGfWbX86wP6vQ6PnQS9hL6daMqaxI+MLn2et3BO5hd9Lh7TbW6iz/LK9
 u7prw/Uv0H2trQuPTnnBxCOrvj+CfXT8eN1npkT/Z0f+o9OpfB6JloCUN A==;
X-CSE-ConnectionGUID: 29K+XsceTgqFcr2MqDBEiQ==
X-CSE-MsgGUID: 8csWmvXHThmDILbGKkKw0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11750"; a="79011524"
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="79011524"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 02:54:38 -0700
X-CSE-ConnectionGUID: fCARP1LRS8afC82en3U9Pw==
X-CSE-MsgGUID: IhI5BwVtQ/SUs+gii/ACIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="231893900"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 02:54:36 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, nishit.sharma@intel.com,
 pravalika.gurram@intel.com
Subject: [i-g-t 2/3] tests/intel/xe_madvise: Add single-vma-full-unmap-no-gpu
 subtest
Date: Mon,  6 Apr 2026 15:24:07 +0530
Message-ID: <20260406095410.1274177-3-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260406095410.1274177-1-arvind.yadav@intel.com>
References: <20260406095410.1274177-1-arvind.yadav@intel.com>
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

Verify PAT reset after full unmap without GPU access.

Set PAT=UC on a 1MB VMA, fully unmap it, and verify the attribute
resets to default.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Nishit Sharma <nishit.sharma@intel.com>
Cc: Pravalika Gurram <pravalika.gurram@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 tests/intel/xe_madvise.c | 112 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
index 37411f342..2c8c00f79 100644
--- a/tests/intel/xe_madvise.c
+++ b/tests/intel/xe_madvise.c
@@ -910,6 +910,115 @@ test_multi_region_partial_unmap_no_gpu(int fd)
 	xe_vm_destroy(fd, vm);
 }
 
+/**
+ * SUBTEST: single-vma-full-unmap-no-gpu
+ * Description: Verify PAT resets on full unmap without GPU access.
+ * Test category: functionality test
+ */
+static void
+test_single_vma_full_unmap_no_gpu(int fd)
+{
+	const size_t total_size = SZ_1M;
+	struct drm_xe_sync sync[1] = {
+		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		  .timeline_value = USER_FENCE_VALUE },
+	};
+	struct drm_xe_mem_range_attr *attrs;
+	struct drm_xe_madvise madvise;
+	uint32_t num_ranges;
+	uint64_t vm_sync = 0;
+	uint8_t pat_uc, pat_wb;
+	uint32_t va_bits;
+	void *base_addr;
+	bool reset_done;
+	uint32_t vm;
+	int i;
+
+	pat_uc = intel_get_pat_idx_uc(fd);
+	pat_wb = intel_get_pat_idx_wb(fd);
+	va_bits = xe_va_bits(fd);
+
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
+			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+
+	base_addr = mmap(NULL, total_size, PROT_READ | PROT_WRITE,
+			 MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	igt_assert(base_addr != MAP_FAILED);
+
+	/* Bind address space with CPU_ADDR_MIRROR and MADVISE_AUTORESET */
+	sync[0].addr = to_user_pointer(&vm_sync);
+	__xe_vm_bind_assert(fd, vm, 0,
+			    0, 0, 0, 0x1ull << va_bits,
+			    DRM_XE_VM_BIND_OP_MAP,
+			    DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR |
+			    DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET,
+			    sync, 1, 0, 0);
+	xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0, FIVE_SEC);
+
+	/* Set PAT=UC on the entire 1MB region */
+	memset(&madvise, 0, sizeof(madvise));
+	madvise.vm_id = vm;
+	madvise.start = to_user_pointer(base_addr);
+	madvise.range = total_size;
+	madvise.type = DRM_XE_MEM_RANGE_ATTR_PAT;
+	madvise.pat_index.val = pat_uc;
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_MADVISE, &madvise), 0);
+
+	/* Verify PAT=UC is applied before unmap */
+	attrs = xe_vm_get_mem_attr_values_in_range(fd, vm,
+						   to_user_pointer(base_addr),
+						   total_size, &num_ranges);
+	igt_assert_f(attrs && num_ranges > 0,
+		     "Expected at least 1 range after setting PAT\n");
+	for (i = 0; i < num_ranges; i++) {
+		uint8_t got = attrs[i].pat_index.val;
+
+		if (got != pat_uc) {
+			free(attrs);
+			igt_assert_f(false, "range[%d]: expected UC=%u got %u\n",
+				     i, pat_uc, got);
+		}
+	}
+	free(attrs);
+
+	/* Full unmap — MADVISE_AUTORESET must reset the attribute */
+	igt_assert_eq(munmap(base_addr, total_size), 0);
+
+	/* Reset is asynchronous; poll for up to 5 seconds. */
+	reset_done = false;
+
+	for (i = 0; i < 5; i++) {
+		int j;
+
+		sleep(1);
+		attrs = xe_vm_get_mem_attr_values_in_range(fd, vm,
+							   to_user_pointer(base_addr),
+							   total_size, &num_ranges);
+		if (!attrs) {
+			reset_done = true; /* no ranges — reset complete */
+			break;
+		}
+
+		reset_done = true;
+		for (j = 0; j < num_ranges; j++) {
+			if (attrs[j].pat_index.val != pat_wb) {
+				reset_done = false;
+				break;
+			}
+		}
+		free(attrs);
+
+		if (reset_done)
+			break;
+	}
+
+	igt_assert_f(reset_done,
+		     "PAT not reset to WB=%u within 5s after full unmap\n", pat_wb);
+
+	xe_vm_destroy(fd, vm);
+}
+
 int igt_main()
 {
 	struct drm_xe_engine_class_instance *hwe;
@@ -967,6 +1076,9 @@ int igt_main()
 	igt_subtest("multi-region-partial-unmap-no-gpu")
 		test_multi_region_partial_unmap_no_gpu(fd);
 
+	igt_subtest("single-vma-full-unmap-no-gpu")
+		test_single_vma_full_unmap_no_gpu(fd);
+
 	igt_fixture() {
 		xe_device_put(fd);
 		drm_close_driver(fd);
-- 
2.43.0

