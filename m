Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F3BC28B20
	for <igt-dev@archiver.kernel.org>; Fri, 28 Mar 2025 08:04:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09CB210E98C;
	Fri, 28 Mar 2025 08:04:13 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC86410E98C
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Mar 2025 08:04:11 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 52S846t41464784; Fri, 28 Mar 2025 13:34:06 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 52S846pQ1464783;
 Fri, 28 Mar 2025 13:34:06 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: igt-dev@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Strawbridge@rtg-sunil-navi33.amd.com,
 Michael <Michael.Strawbridge@amd.com>, Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v2 01/19] drm-uapi/amdgpu: sync with drm-next
Date: Fri, 28 Mar 2025 13:33:46 +0530
Message-Id: <20250328080404.1464740-1-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
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

Sync with drm-next commit ("e0400bf7d91ed477b827a674e5d64406c78ffd48")

This patch introduces new UAPI/IOCTL for usermode graphics
queue. IGT test cases fill this structure and request
the graphics driver to add a graphics work queue for it.
The output of this UAPI is a queue id.

This UAPI maps the queue into GPU, so the graphics app can start
submitting work to the queue as soon as the call returns.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 include/drm-uapi/amdgpu_drm.h | 123 ++++++++++++++++++++++++++++++++++
 1 file changed, 123 insertions(+)

diff --git a/include/drm-uapi/amdgpu_drm.h b/include/drm-uapi/amdgpu_drm.h
index efe5de6ce..d780e1f2a 100644
--- a/include/drm-uapi/amdgpu_drm.h
+++ b/include/drm-uapi/amdgpu_drm.h
@@ -54,6 +54,7 @@ extern "C" {
 #define DRM_AMDGPU_VM			0x13
 #define DRM_AMDGPU_FENCE_TO_HANDLE	0x14
 #define DRM_AMDGPU_SCHED		0x15
+#define DRM_AMDGPU_USERQ		0x16
 
 #define DRM_IOCTL_AMDGPU_GEM_CREATE	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_GEM_CREATE, union drm_amdgpu_gem_create)
 #define DRM_IOCTL_AMDGPU_GEM_MMAP	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_GEM_MMAP, union drm_amdgpu_gem_mmap)
@@ -71,6 +72,7 @@ extern "C" {
 #define DRM_IOCTL_AMDGPU_VM		DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_VM, union drm_amdgpu_vm)
 #define DRM_IOCTL_AMDGPU_FENCE_TO_HANDLE DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_FENCE_TO_HANDLE, union drm_amdgpu_fence_to_handle)
 #define DRM_IOCTL_AMDGPU_SCHED		DRM_IOW(DRM_COMMAND_BASE + DRM_AMDGPU_SCHED, union drm_amdgpu_sched)
+#define DRM_IOCTL_AMDGPU_USERQ		DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_USERQ, union drm_amdgpu_userq)
 
 /**
  * DOC: memory domains
@@ -319,6 +321,127 @@ union drm_amdgpu_ctx {
 	union drm_amdgpu_ctx_out out;
 };
 
+/* user queue IOCTL operations */
+#define AMDGPU_USERQ_OP_CREATE	1
+#define AMDGPU_USERQ_OP_FREE	2
+
+/*
+ * This structure is a container to pass input configuration
+ * info for all supported userqueue related operations.
+ * For operation AMDGPU_USERQ_OP_CREATE: user is expected
+ *  to set all fields, excep the parameter 'queue_id'.
+ * For operation AMDGPU_USERQ_OP_FREE: the only input parameter expected
+ *  to be set is 'queue_id', eveything else is ignored.
+ */
+struct drm_amdgpu_userq_in {
+	/** AMDGPU_USERQ_OP_* */
+	__u32	op;
+	/** Queue id passed for operation USERQ_OP_FREE */
+	__u32	queue_id;
+	/** the target GPU engine to execute workload (AMDGPU_HW_IP_*) */
+	__u32   ip_type;
+	/**
+	 * @doorbell_handle: the handle of doorbell GEM object
+	 * associated with this userqueue client.
+	 */
+	__u32   doorbell_handle;
+	/**
+	 * @doorbell_offset: 32-bit offset of the doorbell in the doorbell bo.
+	 * Kernel will generate absolute doorbell offset using doorbell_handle
+	 * and doorbell_offset in the doorbell bo.
+	 */
+	__u32   doorbell_offset;
+	__u32 _pad;
+	/**
+	 * @queue_va: Virtual address of the GPU memory which holds the queue
+	 * object. The queue holds the workload packets.
+	 */
+	__u64   queue_va;
+	/**
+	 * @queue_size: Size of the queue in bytes, this needs to be 256-byte
+	 * aligned.
+	 */
+	__u64   queue_size;
+	/**
+	 * @rptr_va : Virtual address of the GPU memory which holds the ring RPTR.
+	 * This object must be at least 8 byte in size and aligned to 8-byte offset.
+	 */
+	__u64   rptr_va;
+	/**
+	 * @wptr_va : Virtual address of the GPU memory which holds the ring WPTR.
+	 * This object must be at least 8 byte in size and aligned to 8-byte offset.
+	 *
+	 * Queue, RPTR and WPTR can come from the same object, as long as the size
+	 * and alignment related requirements are met.
+	 */
+	__u64   wptr_va;
+	/**
+	 * @mqd: MQD (memory queue descriptor) is a set of parameters which allow
+	 * the GPU to uniquely define and identify a usermode queue.
+	 *
+	 * MQD data can be of different size for different GPU IP/engine and
+	 * their respective versions/revisions, so this points to a __u64 *
+	 * which holds IP specific MQD of this usermode queue.
+	 */
+	__u64 mqd;
+	/**
+	 * @size: size of MQD data in bytes, it must match the MQD structure
+	 * size of the respective engine/revision defined in UAPI for ex, for
+	 * gfx11 workloads, size = sizeof(drm_amdgpu_userq_mqd_gfx11).
+	 */
+	__u64 mqd_size;
+};
+
+/* The structure to carry output of userqueue ops */
+struct drm_amdgpu_userq_out {
+	/**
+	 * For operation AMDGPU_USERQ_OP_CREATE: This field contains a unique
+	 * queue ID to represent the newly created userqueue in the system, otherwise
+	 * it should be ignored.
+	 */
+	__u32	queue_id;
+	__u32 _pad;
+};
+
+union drm_amdgpu_userq {
+	struct drm_amdgpu_userq_in in;
+	struct drm_amdgpu_userq_out out;
+};
+
+/* GFX V11 IP specific MQD parameters */
+struct drm_amdgpu_userq_mqd_gfx11 {
+	/**
+	 * @shadow_va: Virtual address of the GPU memory to hold the shadow buffer.
+	 * Use AMDGPU_INFO_IOCTL to find the exact size of the object.
+	 */
+	__u64   shadow_va;
+	/**
+	 * @csa_va: Virtual address of the GPU memory to hold the CSA buffer.
+	 * Use AMDGPU_INFO_IOCTL to find the exact size of the object.
+	 */
+	__u64   csa_va;
+};
+
+/* GFX V11 SDMA IP specific MQD parameters */
+struct drm_amdgpu_userq_mqd_sdma_gfx11 {
+	/**
+	 * @csa_va: Virtual address of the GPU memory to hold the CSA buffer.
+	 * This must be a from a separate GPU object, and use AMDGPU_INFO IOCTL
+	 * to get the size.
+	 */
+	__u64   csa_va;
+};
+
+/* GFX V11 Compute IP specific MQD parameters */
+struct drm_amdgpu_userq_mqd_compute_gfx11 {
+	/**
+	 * @eop_va: Virtual address of the GPU memory to hold the EOP buffer.
+	 * This must be a from a separate GPU object, and use AMDGPU_INFO IOCTL
+	 * to get the size.
+	 */
+	__u64   eop_va;
+};
+
 /* vm ioctl */
 #define AMDGPU_VM_OP_RESERVE_VMID	1
 #define AMDGPU_VM_OP_UNRESERVE_VMID	2
-- 
2.43.0

