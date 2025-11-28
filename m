Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09119CFD376
	for <igt-dev@archiver.kernel.org>; Fri, 28 Nov 2025 09:39:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45C7410E77C;
	Fri, 28 Nov 2025 09:39:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="TLs+c0iE";
	dkim-atps=neutral
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA1B510E04A
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Nov 2025 09:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1764322749;
 bh=Ue8VCj9mbv1uJ9TKQVTJMDoqTDn+N6/bfErnp64dZTk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TLs+c0iExEHVEnI9Grv23Qs5y07hgG4AhRC+Ie3eoGOOnGnPkLG+NA+8GSuLxLhWs
 aKUOE1AH7JCqD2Qzo/mtK271fMMJI3rgFm4zbAbrcWCXb1ht4/4Swx90v+xa2SIS2e
 X4LY/Zrdyl22cs4HNHWNf0GdhrV59Yn8rYgOjZkzcxrRPr8xzNuYu+uU8H7pG5fyKD
 AcZkOV03Fx4mpj8ojsa0UUC15IegPyoNZ/fDcGDWIX0ScjG5RUezk4gnFPNhZXf3/n
 7G4tRx96oZiJlyAp+7M18v9hFzj+bOEcLi3UVTz1kDvu/6HmxgWkjKMugekSjtMZNK
 +uHaH9Ako1x+w==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id EAAAF17E10E7;
 Fri, 28 Nov 2025 10:39:08 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: igt-dev@lists.freedesktop.org, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, kernel@collabora.com
Subject: [PATCH i-g-t v2 1/3] drm-uapi/panthor: Sync panthor uapi
Date: Fri, 28 Nov 2025 10:38:56 +0100
Message-ID: <20251128093858.3844420-2-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251128093858.3844420-1-boris.brezillon@collabora.com>
References: <20251128093858.3844420-1-boris.brezillon@collabora.com>
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

Align with kernel commit 3b1dc21d6d80 ("drm/panthor: Add support for
Mali-Gx15 family of GPUs"). Will be needed for the scheduler tests.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 include/drm-uapi/panthor_drm.h | 213 ++++++++++++++++++++++++++-------
 1 file changed, 171 insertions(+), 42 deletions(-)

diff --git a/include/drm-uapi/panthor_drm.h b/include/drm-uapi/panthor_drm.h
index e23a7f9b0eac..467d365ed7ba 100644
--- a/include/drm-uapi/panthor_drm.h
+++ b/include/drm-uapi/panthor_drm.h
@@ -127,50 +127,25 @@ enum drm_panthor_ioctl_id {
 
 	/** @DRM_PANTHOR_TILER_HEAP_DESTROY: Destroy a tiler heap. */
 	DRM_PANTHOR_TILER_HEAP_DESTROY,
+
+	/** @DRM_PANTHOR_BO_SET_LABEL: Label a BO. */
+	DRM_PANTHOR_BO_SET_LABEL,
+
+	/**
+	 * @DRM_PANTHOR_SET_USER_MMIO_OFFSET: Set the offset to use as the user MMIO offset.
+	 *
+	 * The default behavior is to pick the MMIO offset based on the size of the pgoff_t
+	 * type seen by the process that manipulates the FD, such that a 32-bit process can
+	 * always map the user MMIO ranges. But this approach doesn't work well for emulators
+	 * like FEX, where the emulator is an 64-bit binary which might be executing 32-bit
+	 * code. In that case, the kernel thinks it's the 64-bit process and assumes
+	 * DRM_PANTHOR_USER_MMIO_OFFSET_64BIT is in use, but the UMD library expects
+	 * DRM_PANTHOR_USER_MMIO_OFFSET_32BIT, because it can't mmap() anything above the
+	 * pgoff_t size.
+	 */
+	DRM_PANTHOR_SET_USER_MMIO_OFFSET,
 };
 
-/**
- * DRM_IOCTL_PANTHOR() - Build a Panthor IOCTL number
- * @__access: Access type. Must be R, W or RW.
- * @__id: One of the DRM_PANTHOR_xxx id.
- * @__type: Suffix of the type being passed to the IOCTL.
- *
- * Don't use this macro directly, use the DRM_IOCTL_PANTHOR_xxx
- * values instead.
- *
- * Return: An IOCTL number to be passed to ioctl() from userspace.
- */
-#define DRM_IOCTL_PANTHOR(__access, __id, __type) \
-	DRM_IO ## __access(DRM_COMMAND_BASE + DRM_PANTHOR_ ## __id, \
-			   struct drm_panthor_ ## __type)
-
-#define DRM_IOCTL_PANTHOR_DEV_QUERY \
-	DRM_IOCTL_PANTHOR(WR, DEV_QUERY, dev_query)
-#define DRM_IOCTL_PANTHOR_VM_CREATE \
-	DRM_IOCTL_PANTHOR(WR, VM_CREATE, vm_create)
-#define DRM_IOCTL_PANTHOR_VM_DESTROY \
-	DRM_IOCTL_PANTHOR(WR, VM_DESTROY, vm_destroy)
-#define DRM_IOCTL_PANTHOR_VM_BIND \
-	DRM_IOCTL_PANTHOR(WR, VM_BIND, vm_bind)
-#define DRM_IOCTL_PANTHOR_VM_GET_STATE \
-	DRM_IOCTL_PANTHOR(WR, VM_GET_STATE, vm_get_state)
-#define DRM_IOCTL_PANTHOR_BO_CREATE \
-	DRM_IOCTL_PANTHOR(WR, BO_CREATE, bo_create)
-#define DRM_IOCTL_PANTHOR_BO_MMAP_OFFSET \
-	DRM_IOCTL_PANTHOR(WR, BO_MMAP_OFFSET, bo_mmap_offset)
-#define DRM_IOCTL_PANTHOR_GROUP_CREATE \
-	DRM_IOCTL_PANTHOR(WR, GROUP_CREATE, group_create)
-#define DRM_IOCTL_PANTHOR_GROUP_DESTROY \
-	DRM_IOCTL_PANTHOR(WR, GROUP_DESTROY, group_destroy)
-#define DRM_IOCTL_PANTHOR_GROUP_SUBMIT \
-	DRM_IOCTL_PANTHOR(WR, GROUP_SUBMIT, group_submit)
-#define DRM_IOCTL_PANTHOR_GROUP_GET_STATE \
-	DRM_IOCTL_PANTHOR(WR, GROUP_GET_STATE, group_get_state)
-#define DRM_IOCTL_PANTHOR_TILER_HEAP_CREATE \
-	DRM_IOCTL_PANTHOR(WR, TILER_HEAP_CREATE, tiler_heap_create)
-#define DRM_IOCTL_PANTHOR_TILER_HEAP_DESTROY \
-	DRM_IOCTL_PANTHOR(WR, TILER_HEAP_DESTROY, tiler_heap_destroy)
-
 /**
  * DOC: IOCTL arguments
  */
@@ -260,6 +235,14 @@ enum drm_panthor_dev_query_type {
 
 	/** @DRM_PANTHOR_DEV_QUERY_CSIF_INFO: Query command-stream interface information. */
 	DRM_PANTHOR_DEV_QUERY_CSIF_INFO,
+
+	/** @DRM_PANTHOR_DEV_QUERY_TIMESTAMP_INFO: Query timestamp information. */
+	DRM_PANTHOR_DEV_QUERY_TIMESTAMP_INFO,
+
+	/**
+	 * @DRM_PANTHOR_DEV_QUERY_GROUP_PRIORITIES_INFO: Query allowed group priorities information.
+	 */
+	DRM_PANTHOR_DEV_QUERY_GROUP_PRIORITIES_INFO,
 };
 
 /**
@@ -327,6 +310,9 @@ struct drm_panthor_gpu_info {
 	/** @as_present: Bitmask encoding the number of address-space exposed by the MMU. */
 	__u32 as_present;
 
+	/** @pad0: MBZ. */
+	__u32 pad0;
+
 	/** @shader_present: Bitmask encoding the shader cores exposed by the GPU. */
 	__u64 shader_present;
 
@@ -341,6 +327,9 @@ struct drm_panthor_gpu_info {
 
 	/** @pad: MBZ. */
 	__u32 pad;
+
+	/** @gpu_features: Bitmask describing supported GPU-wide features */
+	__u64 gpu_features;
 };
 
 /**
@@ -377,6 +366,42 @@ struct drm_panthor_csif_info {
 	__u32 pad;
 };
 
+/**
+ * struct drm_panthor_timestamp_info - Timestamp information
+ *
+ * Structure grouping all queryable information relating to the GPU timestamp.
+ */
+struct drm_panthor_timestamp_info {
+	/**
+	 * @timestamp_frequency: The frequency of the timestamp timer or 0 if
+	 * unknown.
+	 */
+	__u64 timestamp_frequency;
+
+	/** @current_timestamp: The current timestamp. */
+	__u64 current_timestamp;
+
+	/** @timestamp_offset: The offset of the timestamp timer. */
+	__u64 timestamp_offset;
+};
+
+/**
+ * struct drm_panthor_group_priorities_info - Group priorities information
+ *
+ * Structure grouping all queryable information relating to the allowed group priorities.
+ */
+struct drm_panthor_group_priorities_info {
+	/**
+	 * @allowed_mask: Bitmask of the allowed group priorities.
+	 *
+	 * Each bit represents a variant of the enum drm_panthor_group_priority.
+	 */
+	__u8 allowed_mask;
+
+	/** @pad: Padding fields, MBZ. */
+	__u8 pad[3];
+};
+
 /**
  * struct drm_panthor_dev_query - Arguments passed to DRM_PANTHOR_IOCTL_DEV_QUERY
  */
@@ -698,6 +723,13 @@ enum drm_panthor_group_priority {
 	 * Requires CAP_SYS_NICE or DRM_MASTER.
 	 */
 	PANTHOR_GROUP_PRIORITY_HIGH,
+
+	/**
+	 * @PANTHOR_GROUP_PRIORITY_REALTIME: Realtime priority group.
+	 *
+	 * Requires CAP_SYS_NICE or DRM_MASTER.
+	 */
+	PANTHOR_GROUP_PRIORITY_REALTIME,
 };
 
 /**
@@ -872,6 +904,15 @@ enum drm_panthor_group_state_flags {
 	 * When a group ends up with this flag set, no jobs can be submitted to its queues.
 	 */
 	DRM_PANTHOR_GROUP_STATE_FATAL_FAULT = 1 << 1,
+
+	/**
+	 * @DRM_PANTHOR_GROUP_STATE_INNOCENT: Group was killed during a reset caused by other
+	 * groups.
+	 *
+	 * This flag can only be set if DRM_PANTHOR_GROUP_STATE_TIMEDOUT is set and
+	 * DRM_PANTHOR_GROUP_STATE_FATAL_FAULT is not.
+	 */
+	DRM_PANTHOR_GROUP_STATE_INNOCENT = 1 << 2,
 };
 
 /**
@@ -959,6 +1000,94 @@ struct drm_panthor_tiler_heap_destroy {
 	__u32 pad;
 };
 
+/**
+ * struct drm_panthor_bo_set_label - Arguments passed to DRM_IOCTL_PANTHOR_BO_SET_LABEL
+ */
+struct drm_panthor_bo_set_label {
+	/** @handle: Handle of the buffer object to label. */
+	__u32 handle;
+
+	/**  @pad: MBZ. */
+	__u32 pad;
+
+	/**
+	 * @label: User pointer to a NUL-terminated string
+	 *
+	 * Length cannot be greater than 4096
+	 */
+	__u64 label;
+};
+
+/**
+ * struct drm_panthor_set_user_mmio_offset - Arguments passed to
+ * DRM_IOCTL_PANTHOR_SET_USER_MMIO_OFFSET
+ *
+ * This ioctl is only really useful if you want to support userspace
+ * CPU emulation environments where the size of an unsigned long differs
+ * between the host and the guest architectures.
+ */
+struct drm_panthor_set_user_mmio_offset {
+	/**
+	 * @offset: User MMIO offset to use.
+	 *
+	 * Must be either DRM_PANTHOR_USER_MMIO_OFFSET_32BIT or
+	 * DRM_PANTHOR_USER_MMIO_OFFSET_64BIT.
+	 *
+	 * Use DRM_PANTHOR_USER_MMIO_OFFSET (which selects OFFSET_32BIT or
+	 * OFFSET_64BIT based on the size of an unsigned long) unless you
+	 * have a very good reason to overrule this decision.
+	 */
+	__u64 offset;
+};
+
+/**
+ * DRM_IOCTL_PANTHOR() - Build a Panthor IOCTL number
+ * @__access: Access type. Must be R, W or RW.
+ * @__id: One of the DRM_PANTHOR_xxx id.
+ * @__type: Suffix of the type being passed to the IOCTL.
+ *
+ * Don't use this macro directly, use the DRM_IOCTL_PANTHOR_xxx
+ * values instead.
+ *
+ * Return: An IOCTL number to be passed to ioctl() from userspace.
+ */
+#define DRM_IOCTL_PANTHOR(__access, __id, __type) \
+	DRM_IO ## __access(DRM_COMMAND_BASE + DRM_PANTHOR_ ## __id, \
+			   struct drm_panthor_ ## __type)
+
+enum {
+	DRM_IOCTL_PANTHOR_DEV_QUERY =
+		DRM_IOCTL_PANTHOR(WR, DEV_QUERY, dev_query),
+	DRM_IOCTL_PANTHOR_VM_CREATE =
+		DRM_IOCTL_PANTHOR(WR, VM_CREATE, vm_create),
+	DRM_IOCTL_PANTHOR_VM_DESTROY =
+		DRM_IOCTL_PANTHOR(WR, VM_DESTROY, vm_destroy),
+	DRM_IOCTL_PANTHOR_VM_BIND =
+		DRM_IOCTL_PANTHOR(WR, VM_BIND, vm_bind),
+	DRM_IOCTL_PANTHOR_VM_GET_STATE =
+		DRM_IOCTL_PANTHOR(WR, VM_GET_STATE, vm_get_state),
+	DRM_IOCTL_PANTHOR_BO_CREATE =
+		DRM_IOCTL_PANTHOR(WR, BO_CREATE, bo_create),
+	DRM_IOCTL_PANTHOR_BO_MMAP_OFFSET =
+		DRM_IOCTL_PANTHOR(WR, BO_MMAP_OFFSET, bo_mmap_offset),
+	DRM_IOCTL_PANTHOR_GROUP_CREATE =
+		DRM_IOCTL_PANTHOR(WR, GROUP_CREATE, group_create),
+	DRM_IOCTL_PANTHOR_GROUP_DESTROY =
+		DRM_IOCTL_PANTHOR(WR, GROUP_DESTROY, group_destroy),
+	DRM_IOCTL_PANTHOR_GROUP_SUBMIT =
+		DRM_IOCTL_PANTHOR(WR, GROUP_SUBMIT, group_submit),
+	DRM_IOCTL_PANTHOR_GROUP_GET_STATE =
+		DRM_IOCTL_PANTHOR(WR, GROUP_GET_STATE, group_get_state),
+	DRM_IOCTL_PANTHOR_TILER_HEAP_CREATE =
+		DRM_IOCTL_PANTHOR(WR, TILER_HEAP_CREATE, tiler_heap_create),
+	DRM_IOCTL_PANTHOR_TILER_HEAP_DESTROY =
+		DRM_IOCTL_PANTHOR(WR, TILER_HEAP_DESTROY, tiler_heap_destroy),
+	DRM_IOCTL_PANTHOR_BO_SET_LABEL =
+		DRM_IOCTL_PANTHOR(WR, BO_SET_LABEL, bo_set_label),
+	DRM_IOCTL_PANTHOR_SET_USER_MMIO_OFFSET =
+		DRM_IOCTL_PANTHOR(WR, SET_USER_MMIO_OFFSET, set_user_mmio_offset),
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.51.1

