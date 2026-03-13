Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E914107BCD0
	for <igt-dev@archiver.kernel.org>; Fri, 13 Mar 2026 17:59:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED6BE10E432;
	Fri, 13 Mar 2026 17:59:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="f+c0TeuD";
	dkim-atps=neutral
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A83C10E373
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Mar 2026 17:59:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1773424770; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=BP2vloNwH3kV++m6TNA8+zcOE2md/RfTF/SA7GfhZgv95XnzrBflDmjiynyZ2sjyoWb8CkYg24s0jxPbxsXMQpzxn4fXMgQhTfRXugyxRq8LJ/iKAKsUSWDZn89ColvVWRDB4JXvwNE45hnNYT2o16svY/qYJ2G/ArJp+ZlGoUA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1773424770;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=ecwNd/1ZRoG4rnFDPNSsdeNDnSjMHzWWxCdw0ojg8sY=; 
 b=dm3uMjE8MudlePgqemExjCDBx49hYrwRfMsacIKicTv2xON/wM5QJMH0mUL0TZO8Vn9b9CAeZTsdpx0a2O0yENv+JyO9/xCFMZU1EFocMCa39TKimR9QhSogYQnE/YJaxksirVbRkYx4gfGiNn+Kae8bMuwOxS60WfCreYm18fw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773424770; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=ecwNd/1ZRoG4rnFDPNSsdeNDnSjMHzWWxCdw0ojg8sY=;
 b=f+c0TeuDNn2zKX0QypSYwk214YV4Ed6zaoEBW1yzr/PcNMAZKDg91KqxaYj+Hehu
 Jrq9N13zp5e/7fMVZD47ECzNqYgkvTA8hKqC61ToxHjZ1WwzUQTB+EpxOK/EZtxJH6p
 nH7eMRxOXtqXHAn9yhD0VldTfivSlsVrfu8CvE6Q=
Received: by mx.zohomail.com with SMTPS id 1773424769816542.3318762439777;
 Fri, 13 Mar 2026 10:59:29 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: igt-dev@lists.freedesktop.org, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, Janne Grunau <j@jannau.net>,
 Danilo Krummrich <dakr@kernel.org>, kernel@collabora.com
Subject: [PATCH v1 1/4] drm-uapi/panthor: Sync panthor uapi
Date: Fri, 13 Mar 2026 17:58:28 +0000
Message-ID: <20260313175908.1752151-2-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260313175908.1752151-1-adrian.larumbe@collabora.com>
References: <20260313175908.1752151-1-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Pull it from drm-misc-next.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 include/drm-uapi/panthor_drm.h | 190 ++++++++++++++++++++++++++++++++-
 1 file changed, 187 insertions(+), 3 deletions(-)

diff --git a/include/drm-uapi/panthor_drm.h b/include/drm-uapi/panthor_drm.h
index 467d365ed7ba..46217ce2c0f5 100644
--- a/include/drm-uapi/panthor_drm.h
+++ b/include/drm-uapi/panthor_drm.h
@@ -144,6 +144,16 @@ enum drm_panthor_ioctl_id {
 	 * pgoff_t size.
 	 */
 	DRM_PANTHOR_SET_USER_MMIO_OFFSET,
+
+	/** @DRM_PANTHOR_BO_SYNC: Sync BO data to/from the device */
+	DRM_PANTHOR_BO_SYNC,
+
+	/**
+	 * @DRM_PANTHOR_BO_QUERY_INFO: Query information about a BO.
+	 *
+	 * This is useful for imported BOs.
+	 */
+	DRM_PANTHOR_BO_QUERY_INFO,
 };
 
 /**
@@ -236,6 +246,9 @@ enum drm_panthor_dev_query_type {
 	/** @DRM_PANTHOR_DEV_QUERY_CSIF_INFO: Query command-stream interface information. */
 	DRM_PANTHOR_DEV_QUERY_CSIF_INFO,
 
+	/** @DRM_PANTHOR_DEV_QUERY_MMU_INFO: Query MMU information. */
+	DRM_PANTHOR_DEV_QUERY_MMU_INFO,
+
 	/** @DRM_PANTHOR_DEV_QUERY_TIMESTAMP_INFO: Query timestamp information. */
 	DRM_PANTHOR_DEV_QUERY_TIMESTAMP_INFO,
 
@@ -245,6 +258,26 @@ enum drm_panthor_dev_query_type {
 	DRM_PANTHOR_DEV_QUERY_GROUP_PRIORITIES_INFO,
 };
 
+/**
+ * enum drm_panthor_gpu_coherency: Type of GPU coherency
+ */
+enum drm_panthor_gpu_coherency {
+	/**
+	 * @DRM_PANTHOR_GPU_COHERENCY_ACE_LITE: ACE Lite coherency.
+	 */
+	DRM_PANTHOR_GPU_COHERENCY_ACE_LITE = 0,
+
+	/**
+	 * @DRM_PANTHOR_GPU_COHERENCY_ACE: ACE coherency.
+	 */
+	DRM_PANTHOR_GPU_COHERENCY_ACE = 1,
+
+	/**
+	 * @DRM_PANTHOR_GPU_COHERENCY_NONE: No coherency.
+	 */
+	DRM_PANTHOR_GPU_COHERENCY_NONE = 31,
+};
+
 /**
  * struct drm_panthor_gpu_info - GPU information
  *
@@ -301,7 +334,16 @@ struct drm_panthor_gpu_info {
 	 */
 	__u32 thread_max_barrier_size;
 
-	/** @coherency_features: Coherency features. */
+	/**
+	 * @coherency_features: Coherency features.
+	 *
+	 * Combination of drm_panthor_gpu_coherency flags.
+	 *
+	 * Note that this is just what the coherency protocols supported by the
+	 * GPU, but the actual coherency in place depends on the SoC
+	 * integration and is reflected by
+	 * drm_panthor_gpu_info::selected_coherency.
+	 */
 	__u32 coherency_features;
 
 	/** @texture_features: Texture features. */
@@ -310,8 +352,12 @@ struct drm_panthor_gpu_info {
 	/** @as_present: Bitmask encoding the number of address-space exposed by the MMU. */
 	__u32 as_present;
 
-	/** @pad0: MBZ. */
-	__u32 pad0;
+	/**
+	 * @selected_coherency: Coherency selected for this device.
+	 *
+	 * One of drm_panthor_gpu_coherency.
+	 */
+	__u32 selected_coherency;
 
 	/** @shader_present: Bitmask encoding the shader cores exposed by the GPU. */
 	__u64 shader_present;
@@ -366,6 +412,16 @@ struct drm_panthor_csif_info {
 	__u32 pad;
 };
 
+/**
+ * struct drm_panthor_mmu_info - MMU information
+ *
+ * Structure grouping all queryable information relating to the MMU.
+ */
+struct drm_panthor_mmu_info {
+	/** @page_size_bitmap: Allowed page sizes */
+	__u64 page_size_bitmap;
+};
+
 /**
  * struct drm_panthor_timestamp_info - Timestamp information
  *
@@ -499,6 +555,17 @@ enum drm_panthor_vm_bind_op_flags {
 	 */
 	DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED = 1 << 2,
 
+	/**
+	 * @DRM_PANTHOR_VM_BIND_OP_MAP_REPEAT: Repeat a BO range
+	 *
+	 * Only valid with DRM_PANTHOR_VM_BIND_OP_TYPE_MAP.
+	 *
+	 * When this is set, a BO range is repeated over the VA range.
+	 * drm_panthor_vm_bind_op::bo_repeat_range defines the size of the
+	 * BO range to repeat.
+	 */
+	DRM_PANTHOR_VM_BIND_OP_MAP_REPEAT = 1 << 3,
+
 	/**
 	 * @DRM_PANTHOR_VM_BIND_OP_TYPE_MASK: Mask used to determine the type of operation.
 	 */
@@ -563,6 +630,15 @@ struct drm_panthor_vm_bind_op {
 	 */
 	struct drm_panthor_obj_array syncs;
 
+	/**
+	 * @bo_repeat_range: The size of the range to be repeated.
+	 *
+	 * Must be zero if DRM_PANTHOR_VM_BIND_OP_MAP_REPEAT is not set in
+	 * flags.
+	 *
+	 * Size must be a multiple of bo_repeat_range.
+	 */
+	__u64 bo_repeat_range;
 };
 
 /**
@@ -638,6 +714,15 @@ struct drm_panthor_vm_get_state {
 enum drm_panthor_bo_flags {
 	/** @DRM_PANTHOR_BO_NO_MMAP: The buffer object will never be CPU-mapped in userspace. */
 	DRM_PANTHOR_BO_NO_MMAP = (1 << 0),
+
+	/**
+	 * @DRM_PANTHOR_BO_WB_MMAP: Force "Write-Back Cacheable" CPU mapping.
+	 *
+	 * CPU map the buffer object in userspace by forcing the "Write-Back
+	 * Cacheable" cacheability attribute. The mapping otherwise uses the
+	 * "Non-Cacheable" attribute if the GPU is not IO coherent.
+	 */
+	DRM_PANTHOR_BO_WB_MMAP = (1 << 1),
 };
 
 /**
@@ -1040,6 +1125,101 @@ struct drm_panthor_set_user_mmio_offset {
 	__u64 offset;
 };
 
+/**
+ * enum drm_panthor_bo_sync_op_type - BO sync type
+ */
+enum drm_panthor_bo_sync_op_type {
+	/** @DRM_PANTHOR_BO_SYNC_CPU_CACHE_FLUSH: Flush CPU caches. */
+	DRM_PANTHOR_BO_SYNC_CPU_CACHE_FLUSH = 0,
+
+	/** @DRM_PANTHOR_BO_SYNC_CPU_CACHE_FLUSH_AND_INVALIDATE: Flush and invalidate CPU caches. */
+	DRM_PANTHOR_BO_SYNC_CPU_CACHE_FLUSH_AND_INVALIDATE = 1,
+};
+
+/**
+ * struct drm_panthor_bo_sync_op - BO map sync op
+ */
+struct drm_panthor_bo_sync_op {
+	/** @handle: Handle of the buffer object to sync. */
+	__u32 handle;
+
+	/** @type: Type of operation. */
+	__u32 type;
+
+	/**
+	 * @offset: Offset into the BO at which the sync range starts.
+	 *
+	 * This will be rounded down to the nearest cache line as needed.
+	 */
+	__u64 offset;
+
+	/**
+	 * @size: Size of the range to sync
+	 *
+	 * @size + @offset will be rounded up to the nearest cache line as
+	 * needed.
+	 */
+	__u64 size;
+};
+
+/**
+ * struct drm_panthor_bo_sync - BO map sync request
+ */
+struct drm_panthor_bo_sync {
+	/**
+	 * @ops: Array of struct drm_panthor_bo_sync_op sync operations.
+	 */
+	struct drm_panthor_obj_array ops;
+};
+
+/**
+ * enum drm_panthor_bo_extra_flags - Set of flags returned on a BO_QUERY_INFO request
+ *
+ * Those are flags reflecting BO properties that are not directly coming from the flags
+ * passed are creation time, or information on BOs that were imported from other drivers.
+ */
+enum drm_panthor_bo_extra_flags {
+	/**
+	 * @DRM_PANTHOR_BO_IS_IMPORTED: BO has been imported from an external driver.
+	 *
+	 * Note that imported dma-buf handles are not flagged as imported if they
+	 * where exported by panthor. Only buffers that are coming from other drivers
+	 * (dma heaps, other GPUs, display controllers, V4L, ...).
+	 *
+	 * It's also important to note that all imported BOs are mapped cached and can't
+	 * be considered IO-coherent even if the GPU is. This means they require explicit
+	 * syncs that must go through the DRM_PANTHOR_BO_SYNC ioctl (userland cache
+	 * maintenance is not allowed in that case, because extra operations might be
+	 * needed to make changes visible to the CPU/device, like buffer migration when the
+	 * exporter is a GPU with its own VRAM).
+	 */
+	DRM_PANTHOR_BO_IS_IMPORTED = (1 << 0),
+};
+
+/**
+ * struct drm_panthor_bo_query_info - Query BO info
+ */
+struct drm_panthor_bo_query_info {
+	/** @handle: Handle of the buffer object to query flags on. */
+	__u32 handle;
+
+	/**
+	 * @extra_flags: Combination of enum drm_panthor_bo_extra_flags flags.
+	 */
+	__u32 extra_flags;
+
+	/**
+	 * @create_flags: Flags passed at creation time.
+	 *
+	 * Combination of enum drm_panthor_bo_flags flags.
+	 * Will be zero if the buffer comes from a different driver.
+	 */
+	__u32 create_flags;
+
+	/** @pad: Will be zero on return. */
+	__u32 pad;
+};
+
 /**
  * DRM_IOCTL_PANTHOR() - Build a Panthor IOCTL number
  * @__access: Access type. Must be R, W or RW.
@@ -1086,6 +1266,10 @@ enum {
 		DRM_IOCTL_PANTHOR(WR, BO_SET_LABEL, bo_set_label),
 	DRM_IOCTL_PANTHOR_SET_USER_MMIO_OFFSET =
 		DRM_IOCTL_PANTHOR(WR, SET_USER_MMIO_OFFSET, set_user_mmio_offset),
+	DRM_IOCTL_PANTHOR_BO_SYNC =
+		DRM_IOCTL_PANTHOR(WR, BO_SYNC, bo_sync),
+	DRM_IOCTL_PANTHOR_BO_QUERY_INFO =
+		DRM_IOCTL_PANTHOR(WR, BO_QUERY_INFO, bo_query_info),
 };
 
 #if defined(__cplusplus)
-- 
2.53.0

