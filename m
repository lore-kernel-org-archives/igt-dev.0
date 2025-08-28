Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B75CCA0EED
	for <igt-dev@archiver.kernel.org>; Thu, 28 Aug 2025 16:58:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD78910EA5A;
	Thu, 28 Aug 2025 16:58:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nOvEM+S5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B9BC10EA5A
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Aug 2025 16:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756400306; x=1787936306;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=wdtF0DdJQtsLZ48aQ2s9c2P0HhoBaYwnTexWuj65dRM=;
 b=nOvEM+S5vf65y5NDNuzLJtvlViOk2n+MTXXCmyo2jjG1iLpKUwlntjC/
 kOBPvb7go+9vdVBL95lIm2nQmz8XFknLhirGn4Mamd7nwb9s3v8ET/hMF
 ENbSNeRduYuBVVnR6xcN3wVU4yKEJZF3zeXy1h8vecZGWQY4V+csiUeBe
 i2u0TM+PV5wLKMP9j8vkUd73EfEjZQsCPyKVW2RwWCqQPoZ0griLDV4VW
 rzH5H6+orUOJPTTrwG+VtpuCojoh1oCy+/OLadXXktJuLqp4C2P5yKZ/e
 H3ywl03AJxM4LpXoRsNgAIz7xDIZaJvTWMKWfLwQ2vvI8I4fFP6zySnHP w==;
X-CSE-ConnectionGUID: xjueeN5xQyCIaRkdKNBaEQ==
X-CSE-MsgGUID: aQVG6kfLTZuInnmss1kxiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="58388089"
X-IronPort-AV: E=Sophos;i="6.18,220,1751266800"; d="scan'208";a="58388089"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 09:58:26 -0700
X-CSE-ConnectionGUID: EmscqCQAT5maqgcnBLyA0w==
X-CSE-MsgGUID: 6aiG0YkyQMKYprgdm/AFgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,220,1751266800"; d="scan'208";a="169685237"
Received: from dut2051bmgfrd.iind.intel.com ([10.190.232.68])
 by fmviesa007.fm.intel.com with ESMTP; 28 Aug 2025 09:58:24 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, pravalika.gurram@intel.com,
 himal.prasad.ghimiray@intel.com, matthew.brost@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH i-g-t 3/5] lib/xe: Add Helper to get memory attributes
Date: Thu, 28 Aug 2025 16:58:15 +0000
Message-ID: <20250828165817.97661-4-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250828165817.97661-1-nishit.sharma@intel.com>
References: <20250828165817.97661-1-nishit.sharma@intel.com>
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

xe_vm_print_mem_attr_values_in_range() function added which calls
QUERY_MEM_RANGES_ATTRS ioctl to get different memory attributes from KMD
and then prints memory attributes returned by KMD for different access
policies like atomic access, preferred loc and pat index.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 lib/xe/xe_ioctl.c | 92 +++++++++++++++++++++++++++++++++++++++++++++++
 lib/xe/xe_ioctl.h |  4 +++
 2 files changed, 96 insertions(+)

diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index 43bad8452..4ab2ef39c 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -57,6 +57,98 @@ uint64_t xe_bb_size(int fd, uint64_t reqsize)
 	             xe_get_default_alignment(fd));
 }
 
+int xe_vm_number_vmas_in_range(int fd, struct drm_xe_vm_query_mem_range_attr *vmas_attr)
+{
+	if (igt_ioctl(fd, DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS, vmas_attr))
+		return -errno;
+	return 0;
+}
+
+int xe_vm_vma_attrs(int fd, struct drm_xe_vm_query_mem_range_attr *vmas_attr,
+		    struct drm_xe_mem_range_attr *mem_attr)
+{
+	if (!mem_attr)
+		return -EINVAL;
+
+	vmas_attr->vector_of_mem_attr = (uintptr_t)mem_attr;
+
+	if (igt_ioctl(fd, DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS, vmas_attr))
+		return -errno;
+
+	return 0;
+}
+
+/**
+ * xe_vm_print_mem_attr_values_in_range:
+ * @fd: xe device fd
+ * @vm: vm_id of the virtual range
+ * @start: start of the virtual address range
+ * @range: size of the virtual address range
+ *
+ * Calls QUERY_MEM_RANGES_ATTRS ioctl to get memory attributes for different
+ * memory ranges from KMD. prints memory attributes as returned by KMD for
+ * atomic, prefrred loc and pat index types.
+ *
+ * Returns 0 for success or error for failure
+ */
+
+int xe_vm_print_mem_attr_values_in_range(int fd, uint32_t vm, uint64_t start, uint64_t range)
+{
+
+	void *ptr_start, *ptr;
+	int err;
+	struct drm_xe_vm_query_mem_range_attr query = {
+		.vm_id = vm,
+		.start = start,
+		.range = range,
+		.num_mem_ranges = 0,
+		.sizeof_mem_range_attr = 0,
+		.vector_of_mem_attr = (uintptr_t)NULL,
+	};
+
+	igt_debug("mem_attr_values_in_range called start = %"PRIu64"\n range = %"PRIu64"\n",
+		  start, range);
+
+	err  = xe_vm_number_vmas_in_range(fd, &query);
+	if (err || !query.num_mem_ranges || !query.sizeof_mem_range_attr) {
+		igt_warn("ioctl failed for xe_vm_number_vmas_in_range\n");
+		igt_debug("vmas_in_range err = %d query.num_mem_ranges = %u query.sizeof_mem_range_attr=%lld\n",
+			 err, query.num_mem_ranges, query.sizeof_mem_range_attr);
+		return err;
+	}
+
+	/* Allocate buffer for the memory region attributes */
+	ptr = malloc(query.num_mem_ranges * query.sizeof_mem_range_attr);
+	ptr_start = ptr;
+
+	if (!ptr)
+		return -ENOMEM;
+
+	err = xe_vm_vma_attrs(fd, &query, ptr);
+	if (err) {
+		igt_warn("ioctl failed for vma_attrs err = %d\n", err);
+		return err;
+	}
+
+	/* Iterate over the returned memory region attributes */
+	for (unsigned int i = 0; i < query.num_mem_ranges; ++i) {
+		struct drm_xe_mem_range_attr *mem_attrs = (struct drm_xe_mem_range_attr *)ptr;
+
+		igt_info("vma_id = %d\nvma_start = 0x%016llx\nvma_end = 0x%016llx\n"
+				"vma:atomic = %d\nvma:pat_index = %d\nvma:preferred_loc_region = %d\n"
+				"vma:preferred_loc_devmem_fd = %d\n\n\n", i, mem_attrs->start,
+				mem_attrs->end,
+				mem_attrs->atomic.val, mem_attrs->pat_index.val,
+				mem_attrs->preferred_mem_loc.migration_policy,
+				mem_attrs->preferred_mem_loc.devmem_fd);
+
+		ptr += query.sizeof_mem_range_attr;
+	}
+
+	free(ptr_start);
+	return 0;
+}
+
 uint32_t xe_vm_create(int fd, uint32_t flags, uint64_t ext)
 {
 	struct drm_xe_vm_create create = {
diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
index a5996cf65..ae16af233 100644
--- a/lib/xe/xe_ioctl.h
+++ b/lib/xe/xe_ioctl.h
@@ -103,4 +103,8 @@ int __xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range, uint64_t
 		    uint32_t type, uint32_t op_val, uint16_t policy);
 int xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range, uint64_t ext,
 		  uint32_t type, uint32_t op_val, uint16_t policy);
+int xe_vm_number_vmas_in_range(int fd, struct drm_xe_vm_query_mem_range_attr *vmas_attr);
+int xe_vm_vma_attrs(int fd, struct drm_xe_vm_query_mem_range_attr *vmas_attr,
+		    struct drm_xe_mem_range_attr *mem_attr);
+int xe_vm_print_mem_attr_values_in_range(int fd, uint32_t vm, uint64_t start, uint64_t range);
 #endif /* XE_IOCTL_H */
-- 
2.43.0

