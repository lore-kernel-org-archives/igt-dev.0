Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6193C109B492
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 15:57:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0604410EA26;
	Tue, 31 Mar 2026 15:57:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RigbBfA1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B809B10EA8E
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 15:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774972622; x=1806508622;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lmNfmS3NpiH3ATydPkC68fLEF+SEVM5tMatkTyXNKqQ=;
 b=RigbBfA1Ma0f8SQO9GoxlZYK2rumMGN+07ZZXmQ3fD9Md2YhhqcvEg5Z
 T7mTko8RKDbq9Dm5MXpDl8ILs5t0YPnFxA5G+ea7dhvEzdQ0Jxhp7vNU2
 RoneT2nPapPrg80lskWYmkYQohAFPPxGWzcr86LH3np5F/FwMOkLx2VTR
 WEgEE6Oirt9et+dBMvY7BRHr3AS8n2gmDNxKW35JRaIihqypElDiHseo+
 /CeMn4e0QOq9eI2K9MUa4TfP7YoAE3JnAvYNlpftAMM1l8xJVSNDMdNK8
 34MbEw8h+qActdk/+XB+49JxbTU6Gbv14lNmBP5JtfSOMwlzA16gHQToC Q==;
X-CSE-ConnectionGUID: eHTZMrsoT+aC5GREvsnUxw==
X-CSE-MsgGUID: w4+ZpqHLQ4ulcQ/gGpUzuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="75026170"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="75026170"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 08:57:01 -0700
X-CSE-ConnectionGUID: UAtK5orJTzyT9O1EFTvlsA==
X-CSE-MsgGUID: 8Cnn7fGNS3q/IcBnOR776w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="219744542"
Received: from dut4449lnl.fm.intel.com ([10.105.8.75])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 08:57:01 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, stuart.summers@intel.com, shuicheng.lin@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH v8 1/4] drm-uapi/xe: Declare xe_vm_get_property_ioctl
Date: Tue, 31 Mar 2026 15:57:02 +0000
Message-ID: <20260331155700.7245-7-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260331155700.7245-6-jonathan.cavitt@intel.com>
References: <20260331155700.7245-6-jonathan.cavitt@intel.com>
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

Align with 20250403173614.67195-4-jonathan.cavitt@intel.com

Add initial declarations for the xe_vm_get_property_ioctl call, including
necessary structures and IOCTL macros.

v2:
- Remove engine class and instance (Ivan)

v3:
- Add declares for fault type, access type, and fault level (Matt Brost,
  Ivan)

v4:
- Rebase (jcavitt)

v5:
- Clarify canonicity of fault address

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Reviewed-by: Nishit Sharma <nishit.sharma@intel.com>
Cc: Ivan Briano <ivan.briano@intel.com>
---
 include/drm-uapi/xe_drm.h | 86 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 077e66a682..f5de148257 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -83,6 +83,7 @@ extern "C" {
  *  - &DRM_IOCTL_XE_OBSERVATION
  *  - &DRM_IOCTL_XE_MADVISE
  *  - &DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS
+ *  - &DRM_IOCTL_XE_VM_GET_PROPERTY
  */
 
 /*
@@ -107,6 +108,7 @@ extern "C" {
 #define DRM_XE_MADVISE			0x0c
 #define DRM_XE_VM_QUERY_MEM_RANGE_ATTRS	0x0d
 #define DRM_XE_EXEC_QUEUE_SET_PROPERTY	0x0e
+#define DRM_XE_VM_GET_PROPERTY		0x0f
 
 /* Must be kept compact -- no holes */
 
@@ -125,6 +127,7 @@ extern "C" {
 #define DRM_IOCTL_XE_MADVISE			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_MADVISE, struct drm_xe_madvise)
 #define DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_QUERY_MEM_RANGE_ATTRS, struct drm_xe_vm_query_mem_range_attr)
 #define DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY	DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_SET_PROPERTY, struct drm_xe_exec_queue_set_property)
+#define DRM_IOCTL_XE_VM_GET_PROPERTY		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_GET_PROPERTY, struct drm_xe_vm_get_property)
 
 /**
  * DOC: Xe IOCTL Extensions
@@ -1249,6 +1252,89 @@ struct drm_xe_vm_bind {
 	__u64 reserved[2];
 };
 
+/** struct xe_vm_fault - Describes faults for %DRM_XE_VM_GET_PROPERTY_FAULTS */
+struct xe_vm_fault {
+	/** @address: Canonical address of the fault */
+	__u64 address;
+	/** @address_precision: Precision of faulted address */
+	__u32 address_precision;
+	/** @access_type: Type of address access that resulted in fault */
+#define FAULT_ACCESS_TYPE_READ		0
+#define FAULT_ACCESS_TYPE_WRITE		1
+#define FAULT_ACCESS_TYPE_ATOMIC	2
+	__u8 access_type;
+	/** @fault_type: Type of fault reported */
+#define FAULT_TYPE_NOT_PRESENT		0
+#define FAULT_TYPE_WRITE_ACCESS		1
+#define FAULT_TYPE_ATOMIC_ACCESS	2
+	__u8 fault_type;
+	/** @fault_level: fault level of the fault */
+#define FAULT_LEVEL_PTE		0
+#define FAULT_LEVEL_PDE		1
+#define FAULT_LEVEL_PDP		2
+#define FAULT_LEVEL_PML4	3
+#define FAULT_LEVEL_PML5	4
+	__u8 fault_level;
+	/** @pad: MBZ */
+	__u8 pad;
+	/** @reserved: MBZ */
+	__u64 reserved[4];
+};
+
+/**
+ * struct drm_xe_vm_get_property - Input of &DRM_IOCTL_XE_VM_GET_PROPERTY
+ *
+ * The user provides a VM and a property to query among DRM_XE_VM_GET_PROPERTY_*,
+ * and sets the values in the vm_id and property members, respectively.  This
+ * determines both the VM to get the property of, as well as the property to
+ * report.
+ *
+ * If size is set to 0, the driver fills it with the required size for the
+ * requested property.  The user is expected here to allocate memory for the
+ * property structure and to provide a pointer to the allocated memory using the
+ * data member.  For some properties, this may be zero, in which case, the
+ * value of the property will be saved to the value member and size will remain
+ * zero on return.
+ *
+ * If size is not zero, then the IOCTL will attempt to copy the requested
+ * property into the data member.
+ *
+ * The IOCTL will return -ENOENT if the VM could not be identified from the
+ * provided VM ID, or -EINVAL if the IOCTL fails for any other reason, such as
+ * providing an invalid size for the given property or if the property data
+ * could not be copied to the memory allocated to the data member.
+ *
+ * The property member can be:
+ *  - %DRM_XE_VM_GET_PROPERTY_FAULTS
+ */
+struct drm_xe_vm_get_property {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
+	/** @vm_id: The ID of the VM to query the properties of */
+	__u32 vm_id;
+
+#define DRM_XE_VM_GET_PROPERTY_FAULTS           0
+	/** @property: property to get */
+	__u32 property;
+
+	/** @size: Size to allocate for @data */
+	__u32 size;
+
+	/** @pad: MBZ */
+	__u32 pad;
+
+	union {
+		/** @data: Pointer to user-defined array of flexible size and type */
+		__u64 data;
+		/** @value: Return value for scalar queries */
+		__u64 value;
+	};
+
+	/** @reserved: MBZ */
+	__u64 reserved[3];
+};
+
 /**
  * struct drm_xe_exec_queue_create - Input of &DRM_IOCTL_XE_EXEC_QUEUE_CREATE
  *
-- 
2.43.0

