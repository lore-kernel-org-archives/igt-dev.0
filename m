Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9273D60D0A
	for <igt-dev@archiver.kernel.org>; Mon, 18 Nov 2024 23:36:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3C2410E575;
	Mon, 18 Nov 2024 23:36:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M0lSHe6A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B25B10E56A
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Nov 2024 23:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731972958; x=1763508958;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=W3SqTgfgG3QPnrc77lM8aiyB5CANE1eeVgHOl+hET5E=;
 b=M0lSHe6AWDljvRSmb4EDNB7RptJM+/bwZShVt225TKXfafT80cdbYnPo
 ZL7jqSi4I2WTJnC3eWPm5KuMy1OlFK991kb0F0duwpE3gCo99qQSjhgJn
 HSgy1A8wt2X3H3zcTlOaOwl7iv6XNX3yYCXGdqdyRnhgq1NgVOo9Icqiy
 6OoilkJ6W9ciKOLAZqVHL3xNMd8NAt8WNG2NOgnQ04dvLV5UEyEZ2GjXa
 Dakxfm8HG1pr9WA5EiDW5HpODCU94bfRy7kE/63p8N6Bj8eN35ZADzx9G
 OPpaOox3HrJpJ3U+yYcjbx6zLFbkCMZlZu/1xbvXrEbxMCD1eN1XEzSyu Q==;
X-CSE-ConnectionGUID: ksaFcaEgRcaW7Sig76jXYg==
X-CSE-MsgGUID: K6weAuEnS9uYHN8v5xXyjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="54451234"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="54451234"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:35:53 -0800
X-CSE-ConnectionGUID: cRw3YI9JRiq6Lu8wiQekwQ==
X-CSE-MsgGUID: aTqreX27S0uXD0QWKhEAaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="120245232"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:35:49 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [RFC PATCH 14/29] drm/xe: Add support for mmapping doorbells to user
 space
Date: Mon, 18 Nov 2024 15:36:05 -0800
Message-Id: <20241118233620.2373819-15-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241118233620.2373819-1-matthew.brost@intel.com>
References: <20241118233620.2373819-1-matthew.brost@intel.com>
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

Doorbells need to be mapped to user space for UMD direct submisssion,
add support for this.

FIXME: Wildly insecure as anyone can pick MMIO doorbell offset, will
need to randomize and tie unique offset to FD. Can be done in later revs
before upstreaming.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.h     |  3 ++
 drivers/gpu/drm/xe/xe_device.c | 73 ++++++++++++++++++++++++++++++++++
 2 files changed, 76 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index e7724965d3f1..2772d42ac057 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -64,6 +64,9 @@
 #define XE_BO_PROPS_INVALID	(-1)
 
 #define XE_PCI_BARRIER_MMAP_OFFSET	(0x50 << XE_PTE_SHIFT)
+#define XE_MMIO_DOORBELL_MMAP_OFFSET	(0x100 << XE_PTE_SHIFT)
+#define XE_MMIO_DOORBELL_PFN_START	(SZ_4M >> XE_PTE_SHIFT)
+#define XE_MMIO_DOORBELL_PFN_COUNT	(256)
 
 struct sg_table;
 
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index f6069db795e7..bbdff4308b2e 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -316,6 +316,75 @@ static int xe_pci_barrier_mmap(struct file *filp,
 	return 0;
 }
 
+static vm_fault_t doorbell_fault(struct vm_fault *vmf)
+{
+	struct drm_device *dev = vmf->vma->vm_private_data;
+	struct vm_area_struct *vma = vmf->vma;
+	vm_fault_t ret = VM_FAULT_NOPAGE;
+	pgprot_t prot;
+	int idx;
+
+	prot = vm_get_page_prot(vma->vm_flags);
+
+	if (drm_dev_enter(dev, &idx)) {
+		unsigned long pfn;
+
+		pfn = PHYS_PFN(pci_resource_start(to_pci_dev(dev->dev), 0) +
+			       (XE_MMIO_DOORBELL_PFN_START << XE_PTE_SHIFT));
+		pfn += vma->vm_pgoff & (XE_MMIO_DOORBELL_PFN_COUNT - 1);
+
+		ret = vmf_insert_pfn_prot(vma, vma->vm_start, pfn,
+					  pgprot_noncached(prot));
+		drm_dev_exit(idx);
+	} else {
+		struct page *page;
+
+		/* Allocate new dummy page to map all the VA range in this VMA to it*/
+		page = alloc_page(GFP_KERNEL | __GFP_ZERO);
+		if (!page)
+			return VM_FAULT_OOM;
+
+		/* Set the page to be freed using drmm release action */
+		if (drmm_add_action_or_reset(dev, barrier_release_dummy_page, page))
+			return VM_FAULT_OOM;
+
+		ret = vmf_insert_pfn_prot(vma, vma->vm_start, page_to_pfn(page),
+					  prot);
+	}
+
+	return ret;
+}
+
+static const struct vm_operations_struct vm_ops_doorbell = {
+	.open = barrier_open,
+	.close = barrier_close,
+	.fault = doorbell_fault,
+};
+
+static int xe_mmio_doorbell_mmap(struct file *filp,
+				 struct vm_area_struct *vma)
+{
+	struct drm_file *priv = filp->private_data;
+	struct drm_device *dev = priv->minor->dev;
+
+	if (vma->vm_end - vma->vm_start > SZ_4K)
+		return -EINVAL;
+
+	if (is_cow_mapping(vma->vm_flags))
+		return -EINVAL;
+
+	if (vma->vm_flags & VM_EXEC)
+		return -EINVAL;
+
+	vm_flags_clear(vma, VM_MAYEXEC);
+	vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP | VM_IO);
+	vma->vm_ops = &vm_ops_doorbell;
+	vma->vm_private_data = dev;
+	drm_dev_get(vma->vm_private_data);
+
+	return 0;
+}
+
 static int xe_mmap(struct file *filp, struct vm_area_struct *vma)
 {
 	struct drm_file *priv = filp->private_data;
@@ -327,6 +396,10 @@ static int xe_mmap(struct file *filp, struct vm_area_struct *vma)
 	switch (vma->vm_pgoff) {
 	case XE_PCI_BARRIER_MMAP_OFFSET >> XE_PTE_SHIFT:
 		return xe_pci_barrier_mmap(filp, vma);
+	case (XE_MMIO_DOORBELL_MMAP_OFFSET >> XE_PTE_SHIFT) ...
+		((XE_MMIO_DOORBELL_MMAP_OFFSET >> XE_PTE_SHIFT) +
+		XE_MMIO_DOORBELL_PFN_COUNT - 1):
+		return xe_mmio_doorbell_mmap(filp, vma);
 	}
 
 	return drm_gem_mmap(filp, vma);
-- 
2.34.1

