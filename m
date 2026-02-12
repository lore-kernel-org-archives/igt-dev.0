Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23540EB48EE
	for <igt-dev@archiver.kernel.org>; Thu, 12 Feb 2026 09:09:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD21510E702;
	Thu, 12 Feb 2026 09:09:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I7OGlj9B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14BAD10E702
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Feb 2026 09:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770887381; x=1802423381;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MszE4h/rIp09Fes0tlVfsIVfr9Uy8D8vVY1VFgBVh3c=;
 b=I7OGlj9BqlX2r//dpJy4qMW8eKYAeP07/jFDNM5VNtSpybF4XhmHYguL
 VNF38KaZ6H6zYj4zGvlOQKv5TTXKnhZ5tx6QLA3stj2uedt6OOtf9RqZg
 zenOkBXz+Ra9qfgZJvlvRlGzYab3il+8Ru2EGN1XT4Ms2oC3fdWip0rRt
 0LEggLjbQ8qDwI/AZMG0Yu2tFsswhPJD7G4kDoOTFYkPeZqaB1VXXWmQc
 oZI+NZ2es0Tm395zbjX2eIihZIcZCwqqF/9DcVd9ytUbKGjB8U5wnoTk2
 k3ZNvV/rFbL8bfIWTLAv8MAWp+3VGlUvqC772kHkkjw693Y+ssyWtZDws A==;
X-CSE-ConnectionGUID: CrrzUGoGTQeiotTSQFp86A==
X-CSE-MsgGUID: f7Z1Nr90Q0uKZPRS8Q2JvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="74653264"
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="74653264"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 01:09:40 -0800
X-CSE-ConnectionGUID: GvDN2Ih9QBSWGN+grnb5Lw==
X-CSE-MsgGUID: es6o6ZadTFCWDhSJWpBi2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="212636908"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 01:09:38 -0800
From: Arvind Yadav <arvind.yadav@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, nishit.sharma@intel.com,
 pravalika.gurram@intel.com
Subject: [PATCH i-g-t v2 2/3] lib/xe: Add purgeable memory ioctl support
Date: Thu, 12 Feb 2026 14:39:16 +0530
Message-ID: <20260212090921.2079711-3-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260212090921.2079711-1-arvind.yadav@intel.com>
References: <20260212090921.2079711-1-arvind.yadav@intel.com>
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
Cc: Pravalika Gurram <pravalika.gurram@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
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

