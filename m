Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 497B5C282DE
	for <igt-dev@archiver.kernel.org>; Mon, 10 Mar 2025 21:03:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 026DD10E4E3;
	Mon, 10 Mar 2025 21:03:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A84bgfLU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 869D110E31E
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Mar 2025 21:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741640625; x=1773176625;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qv7zjkWwhdFUnBWbZcEHIPbjnRoZfSP7cA0hF6LE1VE=;
 b=A84bgfLUTMoz68LZKSKMwHG4dnVDVPlx1zBEKCtsW6iYWEiECsLHqbUR
 YhAqs2soKEoMv3/ORr9zwemo7Xoh3eWsWX7t53V78Yu2ftF0LiHfMXbNb
 XisZ19eKFLY20pl0hpHgP2Xf2/OZesq4KACMGsthlDW4YIZpuTLYQclL6
 Ntr2SGu9gpqB1Vn0VCUGD9pJGer/pBpRfVBTcWdeKrYG33AQ5vp8bvCod
 xqZWo5v2A1qewS3DECtZT0j+BHMqv9IhS1C8dXGksIC66imOdOaGelBlA
 ClfyLhgCNZb8gCcz9xj2VUQ89ieuIaQy/V7FyeWJ4PWKDUuMGKR3L6PGO g==;
X-CSE-ConnectionGUID: zNzXrpk/TDebKy0CTgyzOg==
X-CSE-MsgGUID: MmArMamTR+GdmwMHRmLzpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="60061545"
X-IronPort-AV: E=Sophos;i="6.14,237,1736841600"; d="scan'208";a="60061545"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 14:03:44 -0700
X-CSE-ConnectionGUID: t+rb90Q9QauODfL9a3IY+A==
X-CSE-MsgGUID: kp9/HfuHT86DRH8EuPa0+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,237,1736841600"; d="scan'208";a="120630400"
Received: from dut4432lnl.fm.intel.com ([10.105.10.85])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 14:03:45 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, shuicheng.lin@intel.com
Subject: [PATCH 1/4] drm-uapi/xe: Declare xe_vm_get_faults_ioctl
Date: Mon, 10 Mar 2025 21:03:40 +0000
Message-ID: <20250310210343.204246-2-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250310210343.204246-1-jonathan.cavitt@intel.com>
References: <20250310210343.204246-1-jonathan.cavitt@intel.com>
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

Align with 20250310171834.78299-1-jonathan.cavitt@intel.com

Add initial declarations for the xe_vm_get_faults_ioctl call, including
necessary structures and IOCTL macros.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 include/drm-uapi/xe_drm.h | 49 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 154f947ef0..c73052e050 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -81,6 +81,7 @@ extern "C" {
  *  - &DRM_IOCTL_XE_EXEC
  *  - &DRM_IOCTL_XE_WAIT_USER_FENCE
  *  - &DRM_IOCTL_XE_OBSERVATION
+ *  - &DRM_IOCTL_XE_VM_GET_FAULTS
  */
 
 /*
@@ -102,6 +103,7 @@ extern "C" {
 #define DRM_XE_EXEC			0x09
 #define DRM_XE_WAIT_USER_FENCE		0x0a
 #define DRM_XE_OBSERVATION		0x0b
+#define DRM_XE_VM_GET_FAULTS		0x0c
 
 /* Must be kept compact -- no holes */
 
@@ -117,6 +119,7 @@ extern "C" {
 #define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
 #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
 #define DRM_IOCTL_XE_OBSERVATION		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSERVATION, struct drm_xe_observation_param)
+#define DRM_IOCTL_XE_VM_GET_FAULTS		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_GET_FAULTS, struct drm_xe_vm_get_faults)
 
 /**
  * DOC: Xe IOCTL Extensions
@@ -1166,6 +1169,52 @@ struct drm_xe_vm_bind {
 	__u64 reserved[2];
 };
 
+struct xe_vm_fault {
+	/** @address: Address of the fault, if relevant */
+	__u64 address;
+#define DRM_XE_FAULT_ADDRESS_TYPE_NONE_EXT              0
+#define DRM_XE_FAULT_ADDRESS_TYPE_READ_INVALID_EXT      1
+#define DRM_XE_FAULT_ADDRESS_TYPE_WRITE_INVALID_EXT     2
+	/** @address_type: , if relevant */
+	__u32 address_type;
+	/**
+	 * @address_precision: Precision of faulted address, if relevant.
+	 * Currently only 1.
+	 */
+	__u32 address_precision;
+	/** @reserved: MBZ */
+	__u64 reserved[3];
+};
+
+/**
+ * struct drm_xe_vm_get_faults - Input of &DRM_IOCTL_XE_VM_GET_FAULTS
+ *
+ * The user provides a VM ID, and the ioctl will
+ *
+ */
+struct drm_xe_vm_get_faults {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
+	/** @vm_id: The ID of the VM to query the properties of */
+	__u32 vm_id;
+
+	/** @size: Size to allocate for @ptr */
+	__u32 size;
+
+	/** @fault_count: Number of faults to be returned */
+	__u32 fault_count;
+
+	/** @pad: MBZ */
+	__u32 pad;
+
+	/** @reserved: MBZ */
+	__u64 reserved[2];
+
+	/** @faults: Pointer to user-defined array of xe_vm_fault of flexible size */
+	__u64 faults;
+};
+
 /**
  * struct drm_xe_exec_queue_create - Input of &DRM_IOCTL_XE_EXEC_QUEUE_CREATE
  *
-- 
2.43.0

