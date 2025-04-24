Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0273EC369D7
	for <igt-dev@archiver.kernel.org>; Thu, 24 Apr 2025 20:42:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A6C110E866;
	Thu, 24 Apr 2025 20:42:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a2zqg4I2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3562C10E866
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Apr 2025 20:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745527368; x=1777063368;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rPOwCrOjxUb2jRutSS9LLAM+XDL+ip1E2tXlHcdBl3M=;
 b=a2zqg4I26M9rDmSl3amZO6l59QqSNE2g4nBzScVwHlFxmfzHf9DbTeMx
 0l5hO9godlNIl5lMNaSjdm6VD1VrBBv3Xx/Jl8/s/UK6l/lLywT31E6u4
 DhYFcQ/Xcq1Ya/j3cfJakaxSM5n9p4QI3vbdvA3LxreA+5FlzLDmtqveB
 rVp6Ko902OH1U8f+U/FwlAyqjECoby5Y+N6CQCw6/9A7QbUMqXeMg2xIy
 zG4f12eKeBWIxojK96R5SLoWnUyDDKAaSaoV+OovpDxI7XlKTPfJM6AQj
 6NpguRe005QSB/c/bsw53BaY7JmClg38z5q6beb6z/tBgLcL2JybDrBbA g==;
X-CSE-ConnectionGUID: siwnhIHkRNytY9c77uRMWQ==
X-CSE-MsgGUID: zPZT1PQfSY+UaTGZd7DMRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="57820398"
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; d="scan'208";a="57820398"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 13:42:47 -0700
X-CSE-ConnectionGUID: gYaf1T1PQnmRmAKDE6e/dw==
X-CSE-MsgGUID: giPLBKnCQcO9b6CrA59pxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; d="scan'208";a="132458195"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 13:42:46 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: francois.dugast@intel.com
Subject: [PATCH v3 1/2] uapi/xe: Sync latest uAPI KMD headers
Date: Thu, 24 Apr 2025 13:44:05 -0700
Message-Id: <20250424204406.656794-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250424204406.656794-1-matthew.brost@intel.com>
References: <20250424204406.656794-1-matthew.brost@intel.com>
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

Pull in latest uAPI KMD headers to enable testing of new features.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 include/drm-uapi/xe_drm.h | 49 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 46 insertions(+), 3 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 154f947ef0..c90fab1b00 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -393,6 +393,10 @@ struct drm_xe_query_mem_regions {
  *
  *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM - Flag is set if the device
  *      has usable VRAM
+ *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY - Flag is set if the device
+ *      has low latency hint support
+ *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR - Flag is set if the
+ *      device has CPU address mirroring support
  *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory alignment
  *    required by this device, typically SZ_4K or SZ_64K
  *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address
@@ -409,6 +413,8 @@ struct drm_xe_query_config {
 #define DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
 #define DRM_XE_QUERY_CONFIG_FLAGS			1
 	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 << 0)
+	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY	(1 << 1)
+	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR	(1 << 2)
 #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
 #define DRM_XE_QUERY_CONFIG_VA_BITS			3
 #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
@@ -911,7 +917,11 @@ struct drm_xe_gem_mmap_offset {
  * struct drm_xe_vm_create - Input of &DRM_IOCTL_XE_VM_CREATE
  *
  * The @flags can be:
- *  - %DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE
+ *  - %DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE - Map the whole virtual address
+ *    space of the VM to scratch page. A vm_bind would overwrite the scratch
+ *    page mapping. This flag is mutually exclusive with the
+ *    %DRM_XE_VM_CREATE_FLAG_FAULT_MODE flag, with an exception of on x2 and
+ *    xe3 platform.
  *  - %DRM_XE_VM_CREATE_FLAG_LR_MODE - An LR, or Long Running VM accepts
  *    exec submissions to its exec_queues that don't have an upper time
  *    limit on the job execution time. But exec submissions to these
@@ -987,6 +997,12 @@ struct drm_xe_vm_destroy {
  *  - %DRM_XE_VM_BIND_FLAG_CHECK_PXP - If the object is encrypted via PXP,
  *    reject the binding if the encryption key is no longer valid. This
  *    flag has no effect on BOs that are not marked as using PXP.
+ *  - %DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR - When the CPU address mirror flag is
+ *    set, no mappings are created rather the range is reserved for CPU address
+ *    mirroring which will be populated on GPU page faults or prefetches. Only
+ *    valid on VMs with DRM_XE_VM_CREATE_FLAG_FAULT_MODE set. The CPU address
+ *    mirror flag are only valid for DRM_XE_VM_BIND_OP_MAP operations, the BO
+ *    handle MBZ, and the BO offset MBZ.
  */
 struct drm_xe_vm_bind_op {
 	/** @extensions: Pointer to the first extension struct, if any */
@@ -1039,7 +1055,9 @@ struct drm_xe_vm_bind_op {
 	 * on the @pat_index. For such mappings there is no actual memory being
 	 * mapped (the address in the PTE is invalid), so the various PAT memory
 	 * attributes likely do not apply.  Simply leaving as zero is one
-	 * option (still a valid pat_index).
+	 * option (still a valid pat_index). Same applies to
+	 * DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR bindings as for such mapping
+	 * there is no actual memory being mapped.
 	 */
 	__u16 pat_index;
 
@@ -1055,6 +1073,14 @@ struct drm_xe_vm_bind_op {
 
 		/** @userptr: user pointer to bind on */
 		__u64 userptr;
+
+		/**
+		 * @cpu_addr_mirror_offset: Offset from GPU @addr to create
+		 * CPU address mirror mappings. MBZ with current level of
+		 * support (e.g. 1 to 1 mapping between GPU and CPU mappings
+		 * only supported).
+		 */
+		__s64 cpu_addr_mirror_offset;
 	};
 
 	/**
@@ -1078,6 +1104,7 @@ struct drm_xe_vm_bind_op {
 #define DRM_XE_VM_BIND_FLAG_NULL	(1 << 2)
 #define DRM_XE_VM_BIND_FLAG_DUMPABLE	(1 << 3)
 #define DRM_XE_VM_BIND_FLAG_CHECK_PXP	(1 << 4)
+#define DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR	(1 << 5)
 	/** @flags: Bind flags */
 	__u32 flags;
 
@@ -1205,6 +1232,21 @@ struct drm_xe_vm_bind {
  *     };
  *     ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &exec_queue_create);
  *
+ *     Allow users to provide a hint to kernel for cases demanding low latency
+ *     profile. Please note it will have impact on power consumption. User can
+ *     indicate low latency hint with flag while creating exec queue as
+ *     mentioned below,
+ *
+ *     struct drm_xe_exec_queue_create exec_queue_create = {
+ *          .flags = DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT,
+ *          .extensions = 0,
+ *          .vm_id = vm,
+ *          .num_bb_per_exec = 1,
+ *          .num_eng_per_bb = 1,
+ *          .instances = to_user_pointer(&instance),
+ *     };
+ *     ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &exec_queue_create);
+ *
  */
 struct drm_xe_exec_queue_create {
 #define DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY		0
@@ -1223,7 +1265,8 @@ struct drm_xe_exec_queue_create {
 	/** @vm_id: VM to use for this exec queue */
 	__u32 vm_id;
 
-	/** @flags: MBZ */
+#define DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT	(1 << 0)
+	/** @flags: flags to use for this exec queue */
 	__u32 flags;
 
 	/** @exec_queue_id: Returned exec queue ID */
-- 
2.34.1

