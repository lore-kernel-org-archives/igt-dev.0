Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B502DE77180
	for <igt-dev@archiver.kernel.org>; Thu, 12 Dec 2024 00:18:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 718D710E1DB;
	Thu, 12 Dec 2024 00:18:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pu9uyEMM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21BD810E053
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Dec 2024 00:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733962720; x=1765498720;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B4heS7QLpVcNM+RTcFVem7NU3PINHFW85lvCEVrMh+M=;
 b=Pu9uyEMMvJaGOifH6g954Ryh3ZSL7hZXzfRX916LG8iT55g+iMi1l7Wi
 JvajtU8qmvOx9g35hMV0FDvDharPuufbUTVT3gcI7iZhCBen7qIZPEGli
 hJGn3CYkQAOXZ9Tg0sas1+3jlIj59do8a4kzdQWwFXptRIT2vlY1kLodv
 9o9liO0KCwi8hqx2O0DrUY9pq157TNZhbvtMn1R4EeaF0PVh0CdLdeNj1
 DisTQ4ivr5aYtRb0x6XKqgDX1+nhvl/qUv46zfXT7IDl5rhTC/XYwkRYc
 rI6kRiVO8UYnUvT1T2d0MfrIoCTo0svLfqabMUEuWZ1dKgNBaZcuu4M3T g==;
X-CSE-ConnectionGUID: cMzLwje2SOizoiPQiXxAMg==
X-CSE-MsgGUID: 4FbiGouiQxeEImdNZAwDew==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="45040479"
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; d="scan'208";a="45040479"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 16:18:40 -0800
X-CSE-ConnectionGUID: ZpjX6vBCTVyL9nIIEUytEQ==
X-CSE-MsgGUID: 7cavG8B4SCaJQj0JDGk5Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; d="scan'208";a="126840863"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 16:18:39 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH i-g-t 1/7] drm-uapi/xe: Sync PXP uapi updates
Date: Wed, 11 Dec 2024 16:18:22 -0800
Message-ID: <20241212001829.2082490-2-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241212001829.2082490-1-daniele.ceraolospurio@intel.com>
References: <20241212001829.2082490-1-daniele.ceraolospurio@intel.com>
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

Based on the kernel series still in review:
https://patchwork.freedesktop.org/series/136052/

DO NOT MERGE: will respin with the final version once the kernel side is
merged

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 include/drm-uapi/xe_drm.h | 94 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 93 insertions(+), 1 deletion(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 56163eb91..5b288af1f 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -629,6 +629,39 @@ struct drm_xe_query_uc_fw_version {
 	__u64 reserved;
 };
 
+/**
+ * struct drm_xe_query_pxp_status - query if PXP is ready
+ *
+ * If PXP is enabled and no fatal error as occurred, the status will be set to
+ * one of the following values:
+ * 0: PXP init still in progress
+ * 1: PXP init complete
+ *
+ * If PXP is not enabled or something has gone wrong, the query will be failed
+ * with one of the following error codes:
+ * -ENODEV: PXP not supported or disabled;
+ * -EIO: fatal error occurred during init, so PXP will never be enabled;
+ * -EINVAL: incorrect value provided as part of the query;
+ * -EFAULT: error copying the memory between kernel and userspace.
+ *
+ * The status can only be 0 in the first few seconds after driver load. If
+ * everything works as expected, the status will transition to init complete in
+ * less than 1 second, while in case of errors the driver might take longer to
+ * start returning an error code, but it should still take less than 10 seconds.
+ *
+ * The supported session type bitmask is based on the values in
+ * enum drm_xe_pxp_session_type. TYPE_NONE is always supported and therefore
+ * is not reported in the bitmask.
+ *
+ */
+struct drm_xe_query_pxp_status {
+	/** @status: current PXP status */
+	__u32 status;
+
+	/** @supported_session_types: bitmask of supported PXP session types */
+	__u32 supported_session_types;
+};
+
 /**
  * struct drm_xe_device_query - Input of &DRM_IOCTL_XE_DEVICE_QUERY - main
  * structure to query device information
@@ -648,6 +681,7 @@ struct drm_xe_query_uc_fw_version {
  *    attributes.
  *  - %DRM_XE_DEVICE_QUERY_GT_TOPOLOGY
  *  - %DRM_XE_DEVICE_QUERY_ENGINE_CYCLES
+ *  - %DRM_XE_DEVICE_QUERY_PXP_STATUS
  *
  * If size is set to 0, the driver fills it with the required size for
  * the requested type of data to query. If size is equal to the required
@@ -700,6 +734,7 @@ struct drm_xe_device_query {
 #define DRM_XE_DEVICE_QUERY_ENGINE_CYCLES	6
 #define DRM_XE_DEVICE_QUERY_UC_FW_VERSION	7
 #define DRM_XE_DEVICE_QUERY_OA_UNITS		8
+#define DRM_XE_DEVICE_QUERY_PXP_STATUS		9
 	/** @query: The type of data to query */
 	__u32 query;
 
@@ -743,8 +778,23 @@ struct drm_xe_device_query {
  *  - %DRM_XE_GEM_CPU_CACHING_WC - Allocate the pages as write-combined. This
  *    is uncached. Scanout surfaces should likely use this. All objects
  *    that can be placed in VRAM must use this.
+ *
+ * This ioctl supports setting the following properties via the
+ * %DRM_XE_GEM_CREATE_EXTENSION_SET_PROPERTY extension, which uses the
+ * generic @drm_xe_ext_set_property struct:
+ *
+ *  - %DRM_XE_GEM_CREATE_SET_PROPERTY_PXP_TYPE - set the type of PXP session
+ *    this object will be used with. Valid values are listed in enum
+ *    drm_xe_pxp_session_type. %DRM_XE_PXP_TYPE_NONE is the default behavior, so
+ *    there is no need to explicitly set that. Objects used with session of type
+ *    %DRM_XE_PXP_TYPE_HWDRM will be marked as invalid if a PXP invalidation
+ *    event occurs after their creation. Attempting to flip an invalid object
+ *    will cause a black frame to be displayed instead. Submissions with invalid
+ *    objects mapped in the VM will be rejected.
  */
 struct drm_xe_gem_create {
+#define DRM_XE_GEM_CREATE_EXTENSION_SET_PROPERTY	0
+#define   DRM_XE_GEM_CREATE_SET_PROPERTY_PXP_TYPE	0
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
@@ -906,6 +956,9 @@ struct drm_xe_vm_destroy {
  *    will only be valid for DRM_XE_VM_BIND_OP_MAP operations, the BO
  *    handle MBZ, and the BO offset MBZ. This flag is intended to
  *    implement VK sparse bindings.
+ *  - %DRM_XE_VM_BIND_FLAG_CHECK_PXP - If the object is encrypted via PXP,
+ *    reject the binding if the encryption key is no longer valid. This
+ *    flag has no effect on BOs that are not marked as using PXP.
  */
 struct drm_xe_vm_bind_op {
 	/** @extensions: Pointer to the first extension struct, if any */
@@ -996,6 +1049,7 @@ struct drm_xe_vm_bind_op {
 #define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(1 << 1)
 #define DRM_XE_VM_BIND_FLAG_NULL	(1 << 2)
 #define DRM_XE_VM_BIND_FLAG_DUMPABLE	(1 << 3)
+#define DRM_XE_VM_BIND_FLAG_CHECK_PXP	(1 << 4)
 	/** @flags: Bind flags */
 	__u32 flags;
 
@@ -1087,6 +1141,24 @@ struct drm_xe_vm_bind {
 /**
  * struct drm_xe_exec_queue_create - Input of &DRM_IOCTL_XE_EXEC_QUEUE_CREATE
  *
+ * This ioctl supports setting the following properties via the
+ * %DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY extension, which uses the
+ * generic @drm_xe_ext_set_property struct:
+ *
+ *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY - set the queue priority.
+ *    CAP_SYS_NICE is required to set a value above normal.
+ *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE - set the queue timeslice
+ *    duration.
+ *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE - set the type of PXP session
+ *    this queue will be used with. Valid values are listed in enum
+ *    drm_xe_pxp_session_type. %DRM_XE_PXP_TYPE_NONE is the default behavior, so
+ *    there is no need to explicitly set that. When a queue of type
+ *    %DRM_XE_PXP_TYPE_HWDRM is created, the PXP default HWDRM session
+ *    (%XE_PXP_HWDRM_DEFAULT_SESSION) will be started, if isn't already running.
+ *    Given that going into a power-saving state kills PXP HWDRM sessions,
+ *    runtime PM will be blocked while queues of this type are alive.
+ *    All PXP queues will be killed if a PXP invalidation event occurs.
+ *
  * The example below shows how to use @drm_xe_exec_queue_create to create
  * a simple exec_queue (no parallel submission) of class
  * &DRM_XE_ENGINE_CLASS_RENDER.
@@ -1110,7 +1182,7 @@ struct drm_xe_exec_queue_create {
 #define DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY		0
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
-
+#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE		2
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
@@ -1713,6 +1785,26 @@ struct drm_xe_oa_stream_info {
 	__u64 reserved[3];
 };
 
+/**
+ * enum drm_xe_pxp_session_type - Supported PXP session types.
+ *
+ * We currently only support HWDRM sessions, which are used for protected
+ * content that ends up being displayed, but the HW supports multiple types, so
+ * we might extend support in the future.
+ */
+enum drm_xe_pxp_session_type {
+	/** @DRM_XE_PXP_TYPE_NONE: PXP not used */
+	DRM_XE_PXP_TYPE_NONE = 0,
+	/**
+	 * @DRM_XE_PXP_TYPE_HWDRM: HWDRM sessions are used for content that ends
+	 * up on the display.
+	 */
+	DRM_XE_PXP_TYPE_HWDRM = 1,
+};
+
+/* ID of the protected content session managed by Xe when PXP is active */
+#define DRM_XE_PXP_HWDRM_DEFAULT_SESSION 0xf
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.43.0

