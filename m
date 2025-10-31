Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB9ACCFA05
	for <igt-dev@archiver.kernel.org>; Fri, 31 Oct 2025 18:36:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C764710E30B;
	Fri, 31 Oct 2025 18:36:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G+L2NPNP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6362210E320
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Oct 2025 18:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761935762; x=1793471762;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=RteH9ZG9Wk/ndLj7TKagNRfe7vOTXwFJBUioCc5OsOE=;
 b=G+L2NPNPAl+5rPBmULPbbwUch3OCroxxScU1oiYuJl7oah7sUO1kSGFG
 GeVp2u52PMtdI1zHsMAq9V8myOUieS90+RHbAONNVr4JJVLaE4W5lkzu/
 GlRSZxUiQkZJkEKtse1KeHNotdQF8CuIPPqaQ7x4V4ScFX7eItyhfLb9O
 hOUpvhKb7LYOoZBeZshSc2W9yde1uEjrc/rgq1KNMnTUMdQ7vtWFbO3CV
 lxvQI0NRabTWg2bu4VTi78HS1n1073SRFok1VYg+43Fqm6NXlSI9AaZFN
 /B4auNWJ/Hbmbsbc6mJf2VPC3EeC/Jkm9BuJnLcsBEHRUtM+rFgj8cCdd g==;
X-CSE-ConnectionGUID: +E6UyNQWSQGYPMQa2VX8TA==
X-CSE-MsgGUID: XihI9ZwpQBOhi1zvAEI4Mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="64144722"
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="64144722"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 11:36:01 -0700
X-CSE-ConnectionGUID: QkiNLl4bSkS/nlWFYQmtSg==
X-CSE-MsgGUID: eHf6t9k+R6SdKakTVJvFiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="190650011"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.131])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 11:36:00 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH 01/18] drm-uapi/xe: Sync with Multi-Queue uapi
Date: Fri, 31 Oct 2025 11:35:38 -0700
Message-ID: <20251031183555.1882721-2-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251031183555.1882721-1-niranjana.vishwanathapura@intel.com>
References: <20251031183555.1882721-1-niranjana.vishwanathapura@intel.com>
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

Sync kernel header to get Multi-Queue uapi definitions.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 include/drm-uapi/xe_drm.h | 40 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 89ab54935..d1cb08dc7 100644
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
@@ -1233,6 +1235,18 @@ struct drm_xe_vm_bind {
  *    Given that going into a power-saving state kills PXP HWDRM sessions,
  *    runtime PM will be blocked while queues of this type are alive.
  *    All PXP queues will be killed if a PXP invalidation event occurs.
+ *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP - Create a multi-queue group
+ *    or add secondary queues to a multi-queue group.
+ *    If the extension's 'value' field has %DRM_XE_MULTI_GROUP_CREATE flag set,
+ *    then a new multi-queue group is created with this queue as the primary queue
+ *    (Q0). Otherwise, the queue gets added to the multi-queue group whose primary
+ *    queue id is specified in the 'value' field.
+ *    If the extension's 'value' field has %DRM_XE_MULTI_GROUP_KEEP_ACTIVE flag
+ *    set, then the multi-queue group is kept active after the primary queue is
+ *    destroyed.
+ *
+ *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY - Set the queue
+ *    priority within the multi-queue group.
  *
  * The example below shows how to use @drm_xe_exec_queue_create to create
  * a simple exec_queue (no parallel submission) of class
@@ -1273,6 +1287,10 @@ struct drm_xe_exec_queue_create {
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE		2
+#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP		3
+#define     DRM_XE_MULTI_GROUP_CREATE				(1ull << 63)
+#define     DRM_XE_MULTI_GROUP_KEEP_ACTIVE			(1ull << 62)
+#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY	4
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
@@ -2254,6 +2272,28 @@ struct drm_xe_vm_query_mem_range_attr {
 
 };
 
+/**
+ * struct drm_xe_exec_queue_set_property - exec queue set property
+ *
+ * Sets execution queue properties dynamically.
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

