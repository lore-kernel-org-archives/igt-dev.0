Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA42BD1037C
	for <igt-dev@archiver.kernel.org>; Wed, 26 Nov 2025 03:50:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60E2210E507;
	Wed, 26 Nov 2025 03:50:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KHQoHZq8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8901010E0F7
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Nov 2025 03:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764129020; x=1795665020;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=liJ6ZYXlmqWNiHynr3kK1CXsxIlg2cbX8B34f5jUuxU=;
 b=KHQoHZq8UpQ+aCsu3ehUFMCEHJs9LoXSWvfyRSUnXKyeSjsZdCVttJ4I
 A+z3aXjU8hvwOF4M3QdjviyPIQsY7Tq3hphOdIDANnSDDKtvonfsXUAtp
 SeCBENwrLqQxNLs0T+T9hqAni3jZvoPv08IkOnOU3tLhm19Sr1dYP9qs/
 lzWgdSpGGNxtwpf236k9/cYWNWJtZamX2LH8hwkaG8Y52hdplFrZAKQkC
 55xyQ626dF9Gfp1T+rCjg8zziM3mHmLTwuX2Vjz0m1taunPdUUU8tMRe3
 YIlg3GRkDcDqlPo8RHeKtAOKlgjdJFt5eOtt3JHRUC96VrGRC/aPG5Rgt w==;
X-CSE-ConnectionGUID: 5FgYgPFMQU2IBaJZTTMqMQ==
X-CSE-MsgGUID: w4alLT83R5WWLbPRO/9xrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="76840037"
X-IronPort-AV: E=Sophos;i="6.20,227,1758610800"; d="scan'208";a="76840037"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 19:50:19 -0800
X-CSE-ConnectionGUID: Jw+B5NJ1Rf+F4oGLwAh/EA==
X-CSE-MsgGUID: 0ZKqN03HSPm8jiC/Kh17PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,227,1758610800"; d="scan'208";a="193639491"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 19:50:19 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 2/5] drm-uapi/xe: Sync with DRM_XE_OA_CAPS_OA_UNIT_GT_ID
 definition
Date: Tue, 25 Nov 2025 19:50:09 -0800
Message-ID: <20251126035012.12967-3-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251126035012.12967-1-ashutosh.dixit@intel.com>
References: <20251126035012.12967-1-ashutosh.dixit@intel.com>
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

This patch will be replaced by the actual kernel commit which defines
DRM_XE_OA_CAPS_OA_UNIT_GT_ID in xe_drm.h, after that commit is merged into
the kernel.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 include/drm-uapi/xe_drm.h | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 89ab549354..b94e03487d 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -771,7 +771,11 @@ struct drm_xe_device_query {
  *    until the object is either bound to a virtual memory region via
  *    VM_BIND or accessed by the CPU. As a result, no backing memory is
  *    reserved at the time of GEM object creation.
- *  - %DRM_XE_GEM_CREATE_FLAG_SCANOUT
+ *  - %DRM_XE_GEM_CREATE_FLAG_SCANOUT - Indicates that the GEM object is
+ *    intended for scanout via the display engine. When set, kernel ensures
+ *    that the allocation is placed in a memory region compatible with the
+ *    display engine requirements. This may impose restrictions on tiling,
+ *    alignment, and memory placement to guarantee proper display functionality.
  *  - %DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM - When using VRAM as a
  *    possible placement, ensure that the corresponding VRAM allocation
  *    will always use the CPU accessible part of VRAM. This is important
@@ -1013,6 +1017,20 @@ struct drm_xe_vm_destroy {
  *    valid on VMs with DRM_XE_VM_CREATE_FLAG_FAULT_MODE set. The CPU address
  *    mirror flag are only valid for DRM_XE_VM_BIND_OP_MAP operations, the BO
  *    handle MBZ, and the BO offset MBZ.
+ *  - %DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET - Can be used in combination with
+ *    %DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR to reset madvises when the underlying
+ *    CPU address space range is unmapped (typically with munmap(2) or brk(2)).
+ *    The madvise values set with &DRM_IOCTL_XE_MADVISE are reset to the values
+ *    that were present immediately after the &DRM_IOCTL_XE_VM_BIND.
+ *    The reset GPU virtual address range is the intersection of the range bound
+ *    using &DRM_IOCTL_XE_VM_BIND and the virtual CPU address space range
+ *    unmapped.
+ *    This functionality is present to mimic the behaviour of CPU address space
+ *    madvises set using madvise(2), which are typically reset on unmap.
+ *    Note: free(3) may or may not call munmap(2) and/or brk(2), and may thus
+ *    not invoke autoreset. Neither will stack variables going out of scope.
+ *    Therefore it's recommended to always explicitly reset the madvises when
+ *    freeing the memory backing a region used in a &DRM_IOCTL_XE_MADVISE call.
  *
  * The @prefetch_mem_region_instance for %DRM_XE_VM_BIND_OP_PREFETCH can also be:
  *  - %DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC, which ensures prefetching occurs in
@@ -1119,6 +1137,7 @@ struct drm_xe_vm_bind_op {
 #define DRM_XE_VM_BIND_FLAG_DUMPABLE	(1 << 3)
 #define DRM_XE_VM_BIND_FLAG_CHECK_PXP	(1 << 4)
 #define DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR	(1 << 5)
+#define DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET	(1 << 6)
 	/** @flags: Bind flags */
 	__u32 flags;
 
@@ -1657,12 +1676,16 @@ struct drm_xe_oa_unit {
 #define DRM_XE_OA_CAPS_OA_BUFFER_SIZE	(1 << 2)
 #define DRM_XE_OA_CAPS_WAIT_NUM_REPORTS	(1 << 3)
 #define DRM_XE_OA_CAPS_OAM		(1 << 4)
+#define DRM_XE_OA_CAPS_OA_UNIT_GT_ID	(1 << 5)
 
 	/** @oa_timestamp_freq: OA timestamp freq */
 	__u64 oa_timestamp_freq;
 
+	/** @gt_id: gt id for this OA unit */
+	__u64 gt_id;
+
 	/** @reserved: MBZ */
-	__u64 reserved[4];
+	__u64 reserved[3];
 
 	/** @num_engines: number of engines in @eci array */
 	__u64 num_engines;
-- 
2.48.1

