Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D01CC28B20
	for <igt-dev@archiver.kernel.org>; Fri, 28 Mar 2025 08:24:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FF6310E99B;
	Fri, 28 Mar 2025 08:24:30 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CD3F10E2F3
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Mar 2025 08:24:29 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 52S8OPDh1469919; Fri, 28 Mar 2025 13:54:25 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 52S8OP7W1469918;
 Fri, 28 Mar 2025 13:54:25 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: igt-dev@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v3 02/19] drm-uapi/amdgpu: sync with drm-next
Date: Fri, 28 Mar 2025 13:53:59 +0530
Message-Id: <20250328082416.1469810-2-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250328082416.1469810-1-sunil.khatri@amd.com>
References: <20250328082416.1469810-1-sunil.khatri@amd.com>
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

Sync with drm-next commit ("866fc4f7e772c4a397f9459754ed1b1872b3a3c6")

Added support of UAPI for user queue secure semaphore.
The semaphore is used to synchronize between the caller and
the gpu hw and user wait for the semaphore.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 include/drm-uapi/amdgpu_drm.h | 117 ++++++++++++++++++++++++++++++++++
 1 file changed, 117 insertions(+)

diff --git a/include/drm-uapi/amdgpu_drm.h b/include/drm-uapi/amdgpu_drm.h
index d780e1f2a..fed39c9b4 100644
--- a/include/drm-uapi/amdgpu_drm.h
+++ b/include/drm-uapi/amdgpu_drm.h
@@ -55,6 +55,8 @@ extern "C" {
 #define DRM_AMDGPU_FENCE_TO_HANDLE	0x14
 #define DRM_AMDGPU_SCHED		0x15
 #define DRM_AMDGPU_USERQ		0x16
+#define DRM_AMDGPU_USERQ_SIGNAL		0x17
+#define DRM_AMDGPU_USERQ_WAIT		0x18
 
 #define DRM_IOCTL_AMDGPU_GEM_CREATE	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_GEM_CREATE, union drm_amdgpu_gem_create)
 #define DRM_IOCTL_AMDGPU_GEM_MMAP	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_GEM_MMAP, union drm_amdgpu_gem_mmap)
@@ -73,6 +75,8 @@ extern "C" {
 #define DRM_IOCTL_AMDGPU_FENCE_TO_HANDLE DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_FENCE_TO_HANDLE, union drm_amdgpu_fence_to_handle)
 #define DRM_IOCTL_AMDGPU_SCHED		DRM_IOW(DRM_COMMAND_BASE + DRM_AMDGPU_SCHED, union drm_amdgpu_sched)
 #define DRM_IOCTL_AMDGPU_USERQ		DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_USERQ, union drm_amdgpu_userq)
+#define DRM_IOCTL_AMDGPU_USERQ_SIGNAL	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_USERQ_SIGNAL, struct drm_amdgpu_userq_signal)
+#define DRM_IOCTL_AMDGPU_USERQ_WAIT	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_USERQ_WAIT, struct drm_amdgpu_userq_wait)
 
 /**
  * DOC: memory domains
@@ -442,6 +446,119 @@ struct drm_amdgpu_userq_mqd_compute_gfx11 {
 	__u64   eop_va;
 };
 
+/* userq signal/wait ioctl */
+struct drm_amdgpu_userq_signal {
+	/**
+	 * @queue_id: Queue handle used by the userq fence creation function
+	 * to retrieve the WPTR.
+	 */
+	__u32	queue_id;
+	__u32	pad;
+	/**
+	 * @syncobj_handles: The list of syncobj handles submitted by the user queue
+	 * job to be signaled.
+	 */
+	__u64	syncobj_handles;
+	/**
+	 * @num_syncobj_handles: A count that represents the number of syncobj handles in
+	 * @syncobj_handles.
+	 */
+	__u64	num_syncobj_handles;
+	/**
+	 * @bo_read_handles: The list of BO handles that the submitted user queue job
+	 * is using for read only. This will update BO fences in the kernel.
+	 */
+	__u64	bo_read_handles;
+	/**
+	 * @bo_write_handles: The list of BO handles that the submitted user queue job
+	 * is using for write only. This will update BO fences in the kernel.
+	 */
+	__u64	bo_write_handles;
+	/**
+	 * @num_bo_read_handles: A count that represents the number of read BO handles in
+	 * @bo_read_handles.
+	 */
+	__u32	num_bo_read_handles;
+	/**
+	 * @num_bo_write_handles: A count that represents the number of write BO handles in
+	 * @bo_write_handles.
+	 */
+	__u32	num_bo_write_handles;
+};
+
+struct drm_amdgpu_userq_fence_info {
+	/**
+	 * @va: A gpu address allocated for each queue which stores the
+	 * read pointer (RPTR) value.
+	 */
+	__u64	va;
+	/**
+	 * @value: A 64 bit value represents the write pointer (WPTR) of the
+	 * queue commands which compared with the RPTR value to signal the
+	 * fences.
+	 */
+	__u64	value;
+};
+
+struct drm_amdgpu_userq_wait {
+	/**
+	 * @syncobj_handles: The list of syncobj handles submitted by the user queue
+	 * job to get the va/value pairs.
+	 */
+	__u64	syncobj_handles;
+	/**
+	 * @syncobj_timeline_handles: The list of timeline syncobj handles submitted by
+	 * the user queue job to get the va/value pairs at given @syncobj_timeline_points.
+	 */
+	__u64	syncobj_timeline_handles;
+	/**
+	 * @syncobj_timeline_points: The list of timeline syncobj points submitted by the
+	 * user queue job for the corresponding @syncobj_timeline_handles.
+	 */
+	__u64	syncobj_timeline_points;
+	/**
+	 * @bo_read_handles: The list of read BO handles submitted by the user queue
+	 * job to get the va/value pairs.
+	 */
+	__u64	bo_read_handles;
+	/**
+	 * @bo_write_handles: The list of write BO handles submitted by the user queue
+	 * job to get the va/value pairs.
+	 */
+	__u64	bo_write_handles;
+	/**
+	 * @num_syncobj_timeline_handles: A count that represents the number of timeline
+	 * syncobj handles in @syncobj_timeline_handles.
+	 */
+	__u16	num_syncobj_timeline_handles;
+	/**
+	 * @num_fences: This field can be used both as input and output. As input it defines
+	 * the maximum number of fences that can be returned and as output it will specify
+	 * how many fences were actually returned from the ioctl.
+	 */
+	__u16	num_fences;
+	/**
+	 * @num_syncobj_handles: A count that represents the number of syncobj handles in
+	 * @syncobj_handles.
+	 */
+	__u32	num_syncobj_handles;
+	/**
+	 * @num_bo_read_handles: A count that represents the number of read BO handles in
+	 * @bo_read_handles.
+	 */
+	__u32	num_bo_read_handles;
+	/**
+	 * @num_bo_write_handles: A count that represents the number of write BO handles in
+	 * @bo_write_handles.
+	 */
+	__u32	num_bo_write_handles;
+	/**
+	 * @out_fences: The field is a return value from the ioctl containing the list of
+	 * address/value pairs to wait for.
+	 */
+	__u64	out_fences;
+};
+
 /* vm ioctl */
 #define AMDGPU_VM_OP_RESERVE_VMID	1
 #define AMDGPU_VM_OP_UNRESERVE_VMID	2
-- 
2.43.0

