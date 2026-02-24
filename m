Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 711F6F3C997
	for <igt-dev@archiver.kernel.org>; Tue, 24 Feb 2026 15:28:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23F2F10E5B0;
	Tue, 24 Feb 2026 15:28:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kI7roL9b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9722F10E5B0
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Feb 2026 15:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771946912; x=1803482912;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xCYOqcgOr6wLnK8xsw9MaX6hs191AxpE/Y2CM19lfYQ=;
 b=kI7roL9b2lloEYVcnZw1qUnArorNRjYUjeJF9ckdweDxZQ5f9xxBzDkb
 ztfJnokQjZpaGtJQLfbsNnBA5/MtonRX3zJbISM9n8QvBQxMYuHtsFtmj
 Pyus1DClGQhVFRoE+3T1zdxxm9QNgDK7ZY+o7SZ9CYM0U/yeUfpYBBjdm
 l6HdBGjxr1Hg2pKTrGO55BYGE1Syn5f3ZVDwsg5VExPWAweYzoQMWhiMN
 ktRgexXzhGeSiUljGzYtzJSNTABb+w0t74K+KaP66w8RaLOL5ez2DsqS8
 UNaWi25n21CB/TT2WMlrObGS2KtrBIw8TOn3glf2JXIZvRiHMLZVp0mRB g==;
X-CSE-ConnectionGUID: mlqrtzCzQ3Kiyq/7SISa7g==
X-CSE-MsgGUID: kcse7BHMSWa8xNBcnkhJtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="72868263"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="72868263"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 07:28:32 -0800
X-CSE-ConnectionGUID: ZgzS6diZTmqQog5AIgSVhA==
X-CSE-MsgGUID: 8LsiQaj9Rv29xwAlT8eGug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="213165916"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 07:28:30 -0800
From: Arvind Yadav <arvind.yadav@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, nishit.sharma@intel.com,
 pravalika.gurram@intel.com
Subject: [PATCH i-g-t v4 2/8] lib/xe: Add purgeable memory ioctl support
Date: Tue, 24 Feb 2026 20:57:50 +0530
Message-ID: <20260224152804.1940820-3-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260224152804.1940820-1-arvind.yadav@intel.com>
References: <20260224152804.1940820-1-arvind.yadav@intel.com>
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

Add xe_vm_madvise_purgeable() helper function to support purgeable
memory management through the XE madvise ioctl. This allows applications
to hint to the kernel about buffer object usage patterns for better
memory management under pressure.

The function provides a clean interface to:
- Mark buffer objects as DONTNEED (purgeable)
- Mark buffer objects as WILLNEED (not purgeable)

Returns the retained value directly (1 if backing store exists, 0 if
purged).

Also update __xe_vm_madvise() to reject purgeable state operations
and direct users to the dedicated helper.

v2:
  - retained must be initialized to 0(Thomas)

Cc: Nishit Sharma <nishit.sharma@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Pravalika Gurram <pravalika.gurram@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 lib/xe/xe_ioctl.c | 33 +++++++++++++++++++++++++++++++++
 lib/xe/xe_ioctl.h |  2 ++
 2 files changed, 35 insertions(+)

diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index 16aae05c9..b61f85b7b 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -739,6 +739,9 @@ int __xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range,
 	case DRM_XE_MEM_RANGE_ATTR_PAT:
 		madvise.pat_index.val = op_val;
 		break;
+	case DRM_XE_VMA_ATTR_PURGEABLE_STATE:
+		/* Purgeable state handled by xe_vm_madvise_purgeable */
+		return -EINVAL;
 	default:
 		igt_warn("Unknown attribute\n");
 		return -EINVAL;
@@ -775,6 +778,36 @@ void xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range,
 				      instance), 0);
 }
 
+/**
+ * xe_vm_madvise_purgeable:
+ * @fd: xe device fd
+ * @vm_id: vm_id of the virtual range
+ * @start: start of the virtual address range
+ * @range: size of the virtual address range
+ * @state: purgeable state (DRM_XE_VMA_PURGEABLE_STATE_WILLNEED or DONTNEED)
+ *
+ * Sets the purgeable state for a virtual memory range. This allows applications
+ * to hint to the kernel about buffer object usage patterns for better memory management.
+ *
+ * Returns: retained value (1 if backing store exists, 0 if purged)
+ */
+uint32_t xe_vm_madvise_purgeable(int fd, uint32_t vm_id, uint64_t start,
+				 uint64_t range, uint32_t state)
+{
+	uint32_t retained_val = 0;
+	struct drm_xe_madvise madvise = {
+		.vm_id = vm_id,
+		.start = start,
+		.range = range,
+		.type = DRM_XE_VMA_ATTR_PURGEABLE_STATE,
+		.purge_state_val.val = state,
+		.purge_state_val.retained = (uint64_t)(uintptr_t)&retained_val,
+	};
+
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_MADVISE, &madvise), 0);
+	return retained_val;
+}
+
 #define	BIND_SYNC_VAL	0x686868
 void xe_vm_bind_lr_sync(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
 			uint64_t addr, uint64_t size, uint32_t flags)
diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
index 3ea651063..8eb506915 100644
--- a/lib/xe/xe_ioctl.h
+++ b/lib/xe/xe_ioctl.h
@@ -107,6 +107,8 @@ int __xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range, uint64_t
 		    uint32_t type, uint32_t op_val, uint16_t policy, uint16_t instance);
 void xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range, uint64_t ext,
 		   uint32_t type, uint32_t op_val, uint16_t policy, uint16_t instance);
+uint32_t xe_vm_madvise_purgeable(int fd, uint32_t vm_id, uint64_t start,
+				 uint64_t range, uint32_t state);
 int xe_vm_number_vmas_in_range(int fd, struct drm_xe_vm_query_mem_range_attr *vmas_attr);
 int xe_vm_vma_attrs(int fd, struct drm_xe_vm_query_mem_range_attr *vmas_attr,
 		    struct drm_xe_mem_range_attr *mem_attr);
-- 
2.43.0

