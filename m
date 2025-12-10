Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0A6CD3B9BE
	for <igt-dev@archiver.kernel.org>; Wed, 10 Dec 2025 00:39:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FFB410E641;
	Wed, 10 Dec 2025 00:39:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QF+esc9y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D13F410E641
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Dec 2025 00:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765327184; x=1796863184;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Br2OSPfIqVt/6671pENI6L6vkpJoyY0FAKYmoKzlSi0=;
 b=QF+esc9ynVvKRqaRHpLJI7DaIZXpHYm/U2al5dtyxVfR6HrQehvQj7Ce
 6Bo3Kwe2IwfpQiOU2OjFd9L5HGCuUi7td4tMS9+AWBFWXftDIaTIksjOF
 wtjTl5naLGeQopbK/yoDL71NlJHCG5hcf+iYSO8OG1Wq/F1nI6uFx5XJm
 UBYLK86+OeWFgFpsBlHQR12lGQhdvs7/LcKgI4iuej3PyFG/CbmT0MFVV
 YBjlBBUZftlVOJCyALMsuup5wisB4Mjnl1kvNUUx0GUY1iq2NoKZFGFfV
 55zltJOYGfykid9nidA8boAqZY3DEZ9XyCPQHeACuP1IoormE5qGzginx A==;
X-CSE-ConnectionGUID: p1/zxOfHT9Oh0owaU+1cfA==
X-CSE-MsgGUID: g7As/5JrR2uBw3qTzM9EJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67180394"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="67180394"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 16:39:44 -0800
X-CSE-ConnectionGUID: HpA5wtfARKS+O4xzhBkfwg==
X-CSE-MsgGUID: /f+UDznGTUiKhDAkbFzkQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="196421597"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 16:39:44 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: sai.gowtham.ch@intel.com, priyanka.dandamudi@intel.com,
 kamil.konieczny@linux.intel.com, stuart.summers@intel.com
Subject: [PATCH v4 01/18] drm-uapi/xe: Sync with Multi-Queue uapi
Date: Tue,  9 Dec 2025 16:39:36 -0800
Message-ID: <20251210003936.1613078-21-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210003936.1613078-20-niranjana.vishwanathapura@intel.com>
References: <20251210003936.1613078-20-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Sync kernel header to get Multi-Queue uapi definitions.

v3: uapi change as per kernel rebase,
    properly import kernel uapi documentation changes (Stuart)

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
---
 include/drm-uapi/xe_drm.h | 44 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 62e3221f5..756643c6f 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -106,6 +106,7 @@ extern "C" {
 #define DRM_XE_OBSERVATION		0x0b
 #define DRM_XE_MADVISE			0x0c
 #define DRM_XE_VM_QUERY_MEM_RANGE_ATTRS	0x0d
+#define DRM_XE_EXEC_QUEUE_SET_PROPERTY	0x0e
 
 /* Must be kept compact -- no holes */
 
@@ -123,6 +124,7 @@ extern "C" {
 #define DRM_IOCTL_XE_OBSERVATION		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSERVATION, struct drm_xe_observation_param)
 #define DRM_IOCTL_XE_MADVISE			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_MADVISE, struct drm_xe_madvise)
 #define DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_QUERY_MEM_RANGE_ATTRS, struct drm_xe_vm_query_mem_range_attr)
+#define DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY	DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_SET_PROPERTY, struct drm_xe_exec_queue_set_property)
 
 /**
  * DOC: Xe IOCTL Extensions
@@ -1272,6 +1274,20 @@ struct drm_xe_vm_bind {
  *    Given that going into a power-saving state kills PXP HWDRM sessions,
  *    runtime PM will be blocked while queues of this type are alive.
  *    All PXP queues will be killed if a PXP invalidation event occurs.
+ *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP - Create a multi-queue group
+ *    or add secondary queues to a multi-queue group.
+ *    If the extension's 'value' field has %DRM_XE_MULTI_GROUP_CREATE flag set,
+ *    then a new multi-queue group is created with this queue as the primary queue
+ *    (Q0). Otherwise, the queue gets added to the multi-queue group whose primary
+ *    queue's exec_queue_id is specified in the lower 32 bits of the 'value' field.
+ *    If the extension's 'value' field has %DRM_XE_MULTI_GROUP_KEEP_ACTIVE flag
+ *    set, then the multi-queue group is kept active after the primary queue is
+ *    destroyed.
+ *    All the other non-relevant bits of extension's 'value' field while adding the
+ *    primary or the secondary queues of the group must be set to 0.
+ *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY - Set the queue
+ *    priority within the multi-queue group. Current valid priority values are 0–2
+ *    (default is 1), with higher values indicating higher priority.
  *
  * The example below shows how to use @drm_xe_exec_queue_create to create
  * a simple exec_queue (no parallel submission) of class
@@ -1313,6 +1329,10 @@ struct drm_xe_exec_queue_create {
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE		2
 #define   DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE		3
+#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP		4
+#define     DRM_XE_MULTI_GROUP_CREATE				(1ull << 63)
+#define     DRM_XE_MULTI_GROUP_KEEP_ACTIVE			(1ull << 62)
+#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY	5
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
@@ -2301,6 +2321,30 @@ struct drm_xe_vm_query_mem_range_attr {
 
 };
 
+/**
+ * struct drm_xe_exec_queue_set_property - exec queue set property
+ *
+ * Sets execution queue properties dynamically.
+ * Currently only %DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY
+ * property can be dynamically set.
+ */
+struct drm_xe_exec_queue_set_property {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
+	/** @exec_queue_id: Exec queue ID */
+	__u32 exec_queue_id;
+
+	/** @property: property to set */
+	__u32 property;
+
+	/** @value: property value */
+	__u64 value;
+
+	/** @reserved: Reserved */
+	__u64 reserved[2];
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.43.0

