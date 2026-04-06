Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA79EF4EC8
	for <igt-dev@archiver.kernel.org>; Mon,  6 Apr 2026 09:55:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CB0810E13B;
	Mon,  6 Apr 2026 09:55:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FS2WL1Ex";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79A5A10E13B
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Apr 2026 09:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775469281; x=1807005281;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=L44kLYYhPVaqy/FXWVOAiR8t8Uxci/ACIUooR/S2p1g=;
 b=FS2WL1ExtRX5O9nRFv/7AZ1LbcVzHYCGyOOVm48Ag2LwOp7j3nhahP1t
 Aw3DN+R5m8/iW0jDE0gknPk5BxQucPc6aSxiS/JAWwCE/Gx1VKpBidG9A
 BsNmlWFowMvJD+NoA6tI+KIXouot9YfcKY8HGylLWR49GtcgeqP8wL0qg
 q75PhAGQZFlQxF6VIZ+nsWxeH8fcd3Tzbm7RgVVRXFt51lTcPouJIyGaF
 LAqI6Q++8+R/QrfleYUe/Szke27hSrhdWPXJtjWXWaXmha1NxS0BAcCC3
 i/Y1TMDccHyeZeJSzvILCCbJZWdwlo76FC4u1xWoWfQLeo3EjhRYNcXAp A==;
X-CSE-ConnectionGUID: G3shi9b+QPWwchRoVHxHTA==
X-CSE-MsgGUID: 5EcI0HvuSYWE5igVbtn6FQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11750"; a="79011528"
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="79011528"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 02:54:40 -0700
X-CSE-ConnectionGUID: XNBhycr6R9aLSgRY1FxhKg==
X-CSE-MsgGUID: AZqheoycSv6ntgb2i5v3Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="231893906"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 02:54:38 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, nishit.sharma@intel.com,
 pravalika.gurram@intel.com
Subject: [i-g-t 3/3] tests/intel/xe_madvise: Add multi-region-partial-unmap
 subtest
Date: Mon,  6 Apr 2026 15:24:08 +0530
Message-ID: <20260406095410.1274177-4-arvind.yadav@intel.com>
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

Verify that madvise PAT attributes are preserved on mapped regions
after partial unmap.

Run GPU access on all regions and set PAT=UC on multiple regions,
unmap a subset, and verify that remaining mapped regions retain PAT=UC.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Nishit Sharma <nishit.sharma@intel.com>
Cc: Pravalika Gurram <pravalika.gurram@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 tests/intel/xe_madvise.c | 185 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 185 insertions(+)

diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
index 2c8c00f79..82ec4d99c 100644
--- a/tests/intel/xe_madvise.c
+++ b/tests/intel/xe_madvise.c
@@ -1019,6 +1019,185 @@ test_single_vma_full_unmap_no_gpu(int fd)
 	xe_vm_destroy(fd, vm);
 }
 
+/**
+ * SUBTEST: multi-region-partial-unmap
+ * Description: Verify only unmapped regions are reset on partial unmap
+ *              after GPU access.
+ * Test category: functionality test
+ */
+static void
+test_multi_region_partial_unmap(int fd, struct drm_xe_engine_class_instance *hwe)
+{
+	static const int unmap_regions[] = {2, 5, 8};
+	static const int num_regions = 10;
+	const size_t region_size = SZ_1M;
+	const size_t total_size = num_regions * region_size;
+	const int num_unmap = ARRAY_SIZE(unmap_regions);
+	struct drm_xe_sync sync[1] = {
+		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		  .timeline_value = USER_FENCE_VALUE },
+	};
+	struct region_work {
+		uint32_t batch[16];
+		uint64_t exec_sync;
+		uint32_t data;
+	} *rw;
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 1,
+		.syncs = to_user_pointer(sync),
+	};
+	struct drm_xe_mem_range_attr *attrs;
+	struct drm_xe_madvise madvise;
+	uint32_t num_ranges;
+	uint64_t vm_sync = 0;
+	uint32_t exec_queue;
+	uint8_t pat_uc;
+	uint32_t va_bits;
+	void *base_addr;
+	uint32_t vm;
+	int i, j;
+
+	/* Require dGPU with visible VRAM for CPU-mirror page faults. */
+	igt_require(xe_visible_vram_size(fd, 0));
+
+	pat_uc = intel_get_pat_idx_uc(fd);
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
+	/* Set PAT=UC on the entire 10MB region */
+	memset(&madvise, 0, sizeof(madvise));
+	madvise.vm_id = vm;
+	madvise.start = to_user_pointer(base_addr);
+	madvise.range = total_size;
+	madvise.type = DRM_XE_MEM_RANGE_ATTR_PAT;
+	madvise.pat_index.val = pat_uc;
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_MADVISE, &madvise), 0);
+
+	/* Verify PAT=UC across all regions */
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
+	/* Touch every region to trigger GPU page faults */
+	exec_queue = xe_exec_queue_create(fd, vm, hwe, 0);
+
+	for (i = 0; i < num_regions; i++) {
+		uint64_t data_addr;
+		int b = 0;
+
+		rw = base_addr + (i * region_size);
+		memset(rw, 0, sizeof(*rw));
+
+		data_addr = to_user_pointer(&rw->data);
+
+		rw->batch[b++] = MI_STORE_DWORD_IMM_GEN4;
+		rw->batch[b++] = (uint32_t)data_addr;
+		rw->batch[b++] = (uint32_t)(data_addr >> 32);
+		rw->batch[b++] = 0xc0de0000 | i;
+		rw->batch[b++] = MI_BATCH_BUFFER_END;
+
+		rw->exec_sync = 0;
+		sync[0].addr = to_user_pointer(&rw->exec_sync);
+
+		exec.exec_queue_id = exec_queue;
+		exec.address = to_user_pointer(rw->batch);
+
+		xe_exec(fd, &exec);
+		xe_wait_ufence(fd, &rw->exec_sync, USER_FENCE_VALUE,
+			       exec_queue, FIVE_SEC);
+		igt_assert_eq_u32(rw->data, 0xc0de0000 | i);
+	}
+
+	xe_exec_queue_destroy(fd, exec_queue);
+
+	/* Partially unmap non-sequential regions: 2, 5, 8 */
+	for (i = 0; i < num_unmap; i++)
+		igt_assert_eq(munmap(base_addr + (unmap_regions[i] * region_size), region_size), 0);
+
+	/*
+	 * Remaining mapped regions must still have PAT=UC.
+	 * A partial unmap must not reset attributes on untouched VMAs.
+	 */
+	for (i = 0; i < num_regions; i++) {
+		bool is_unmapped = false;
+
+		for (j = 0; j < num_unmap; j++) {
+			if (unmap_regions[j] == i) {
+				is_unmapped = true;
+				break;
+			}
+		}
+
+		if (is_unmapped)
+			continue;
+
+		attrs = xe_vm_get_mem_attr_values_in_range(fd, vm,
+							   to_user_pointer(base_addr +
+							   (i * region_size)),
+							   region_size, &num_ranges);
+		igt_assert_f(attrs && num_ranges > 0,
+			     "Region %d: mapped region lost attributes after partial unmap\n", i);
+		for (j = 0; j < num_ranges; j++) {
+			uint8_t got = attrs[j].pat_index.val;
+
+			if (got != pat_uc) {
+				free(attrs);
+				igt_assert_f(false,
+					     "Region %d range[%d]: PAT changed to %u after partial unmap, expected UC=%u\n",
+					     i, j, got, pat_uc);
+			}
+		}
+		free(attrs);
+	}
+
+	/* Cleanup remaining mapped regions */
+	for (i = 0; i < num_regions; i++) {
+		bool is_unmapped = false;
+
+		for (j = 0; j < num_unmap; j++) {
+			if (unmap_regions[j] == i) {
+				is_unmapped = true;
+				break;
+			}
+		}
+
+		if (!is_unmapped)
+			munmap(base_addr + (i * region_size), region_size);
+	}
+
+	xe_vm_destroy(fd, vm);
+}
+
 int igt_main()
 {
 	struct drm_xe_engine_class_instance *hwe;
@@ -1079,6 +1258,12 @@ int igt_main()
 	igt_subtest("single-vma-full-unmap-no-gpu")
 		test_single_vma_full_unmap_no_gpu(fd);
 
+	igt_subtest("multi-region-partial-unmap")
+		xe_for_each_engine(fd, hwe) {
+			test_multi_region_partial_unmap(fd, hwe);
+			break;
+		}
+
 	igt_fixture() {
 		xe_device_put(fd);
 		drm_close_driver(fd);
-- 
2.43.0

