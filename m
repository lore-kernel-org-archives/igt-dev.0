Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32540EF4EC9
	for <igt-dev@archiver.kernel.org>; Mon,  6 Apr 2026 09:54:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA8A210E13B;
	Mon,  6 Apr 2026 09:54:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QhfmJVlA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A18710E13B
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Apr 2026 09:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775469276; x=1807005276;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2THTK79qJinLLeC/ExSeeDu66pNaVLd7vCUfNvFP3wc=;
 b=QhfmJVlAjvftyTv7lSMT22nN4DnHUPAjFh4D1yhzXAi/96aMqMPylL14
 n9AGvYxxhhjtN1MbrtlwN50a4Z83+yBq3vV+trFoaMD7WEFR6QZs+8R9v
 ipbOLd4M8Q8IYsLhEVPsoyFvGAsN2/xbPg38MdtmcjzLOhPA5WstVo2op
 i5nSxd8grIilfqbTXJpEZeo06eYgTbO1aZp7ulmDIzCQNe+uJl2as8tc6
 ufIXl1G8xcxzmMQBFEYLE6dupk5+MqVBdJ180SMKe6wAw3x7NCVt+gnJt
 PubMsMUgPUKK8X9PpPPMnaqRbNBemfv1JOXlxfHPxTiWNIDlWNrMDBqCu w==;
X-CSE-ConnectionGUID: o+YVTfOEQsqbmk5DEu11ZQ==
X-CSE-MsgGUID: iv4mtgeiQQqrSmPNaZ1mUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11750"; a="79011523"
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="79011523"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 02:54:36 -0700
X-CSE-ConnectionGUID: fMF0VB5cTXWK+uQ1IEjZ2g==
X-CSE-MsgGUID: OVJi+7o2SDS/UeKel3h6Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="231893894"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 02:54:33 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, nishit.sharma@intel.com,
 pravalika.gurram@intel.com
Subject: [i-g-t 1/3] tests/intel/xe_madvise: Add
 multi-region-partial-unmap-no-gpu subtest
Date: Mon,  6 Apr 2026 15:24:06 +0530
Message-ID: <20260406095410.1274177-2-arvind.yadav@intel.com>
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

Verify PAT preservation on partial unmap without GPU access.

Set PAT=UC on multiple regions, unmap a subset, and verify that
remaining mapped regions retain PAT=UC.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Nishit Sharma <nishit.sharma@intel.com>
Cc: Pravalika Gurram <pravalika.gurram@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 tests/intel/xe_madvise.c | 138 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 138 insertions(+)

diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
index 2375f5475..37411f342 100644
--- a/tests/intel/xe_madvise.c
+++ b/tests/intel/xe_madvise.c
@@ -17,6 +17,11 @@
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 #include "lib/igt_syncobj.h"
+#include "intel_pat.h"
+
+/* SVM madvise test constants */
+#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
+#define FIVE_SEC		(5LL * NSEC_PER_SEC)
 
 static bool xe_has_purgeable_support(int fd)
 {
@@ -775,6 +780,136 @@ out:
 		igt_skip("Unable to induce purge on this platform/config");
 }
 
+/**
+ * SUBTEST: multi-region-partial-unmap-no-gpu
+ * Description: Verify only unmapped regions are reset on partial unmap
+ *              without GPU access.
+ * Test category: functionality test
+ */
+static void
+test_multi_region_partial_unmap_no_gpu(int fd)
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
+	struct drm_xe_mem_range_attr *attrs;
+	struct drm_xe_madvise madvise;
+	uint32_t num_ranges;
+	uint64_t vm_sync = 0;
+	uint8_t pat_uc;
+	uint32_t va_bits;
+	void *base_addr;
+	uint32_t vm;
+	int i, j;
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
+	/* Partially unmap non-sequential regions: 2, 5, 8 */
+	for (i = 0; i < num_unmap; i++)
+		igt_assert_eq(munmap(base_addr + (unmap_regions[i] * region_size), region_size), 0);
+
+	/* Remaining mapped regions must still have PAT=UC */
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
@@ -829,6 +964,9 @@ int igt_main()
 			break;
 		}
 
+	igt_subtest("multi-region-partial-unmap-no-gpu")
+		test_multi_region_partial_unmap_no_gpu(fd);
+
 	igt_fixture() {
 		xe_device_put(fd);
 		drm_close_driver(fd);
-- 
2.43.0

