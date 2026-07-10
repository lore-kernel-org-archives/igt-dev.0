Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF1FC43458
	for <igt-dev@archiver.kernel.org>; Fri, 10 Jul 2026 11:35:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0238010E18F;
	Fri, 10 Jul 2026 11:35:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KB9lzJwu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A69310E18F
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jul 2026 11:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783683312; x=1815219312;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=PgXexjMlVZkAot/fgasK+X+XK1e/GJVNNHrRT2lHrTM=;
 b=KB9lzJwu0ffH+0P6nw7/EzmymKae61fQiRbYjw5/VHHxdmOFT1mddgKq
 +24GJ5G3HzV1gyuBG7b/HAGcvuVvfa51+Z2qqTA2fsKu8+viPh8Ot/Z2e
 yrW3P8A916ND7JVf3ppyzV5FzlkiU3xcx1DlkGYp0KhGPFo0jPzZw1h1s
 EKdVjsouyFXwMDklgtOIXmmVsEcBDtHgS5J1H9oAy1b3aDRt666Iu+8tQ
 x+cNNJGEt5pvncKhrl13noaYIV6hN1HvCN85Or/FtQDNs9zepxVTX+kxV
 Q3H3vEoZk3caXO9y26NHcdfup27Pf/tQehiMI3U5v5Gfexhdh6Dek75SA w==;
X-CSE-ConnectionGUID: ooYvRvieQNm9X5Jm+YpQtw==
X-CSE-MsgGUID: pErQ07AaSRyKwY+OBvTKqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="83498949"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="83498949"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2026 04:35:11 -0700
X-CSE-ConnectionGUID: W8YRFFcWSvSdkfsb35z+Lw==
X-CSE-MsgGUID: N08tTDOxTm6wEKnDHh/TgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="254361545"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 04:35:09 -0700
Date: Fri, 10 Jul 2026 13:34:52 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
Cc: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 igt-dev@lists.freedesktop.org, kernel@collabora.com,
 Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v4 1/3] drm-uapi/panthor: sync with kernel 12cf826bf1dd
Message-ID: <20260710113452.yh3qak7qdjnd6cmb@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
 Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 igt-dev@lists.freedesktop.org, kernel@collabora.com,
 Steven Price <steven.price@arm.com>
References: <20260707-panthor-sparse-mappings-v4-0-fac6061f5adf@collabora.com>
 <20260707-panthor-sparse-mappings-v4-1-fac6061f5adf@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260707-panthor-sparse-mappings-v4-1-fac6061f5adf@collabora.com>
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

Hi Adrián,
On 2026-07-07 at 22:36:26 +0100, Adrián Larumbe wrote:
> Sync Panthor drm uapi with drm-misc-next up to commit 5731bca6a656, this

This is now in drm-next with commit 12cf8..., so I will fix it
during merge.

> will bring in the following changes:
> 
> commit 12cf826bf1dd ("drm/panthor: Support sparse mappings")
> commit 8e54aac5af6a ("drm/panthor: Delete spurious whitespace from uAPI header")
> commit 6c1427fd03d8 ("drm/panthor: Expose GPU page sizes to UM")
> commit 1dfa2fd98f17 ("drm/panthor: extend timestamp query with flags")
> commit 5c3c3e7b654d ("drm/panthor: Fix kerneldoc in uAPI header")
> commit cd2c9c3015e6 ("drm/panthor: Add flag to map GEM object Write-Back Cacheable")
> commit c146c82f862e ("drm/panthor: Add an ioctl to query BO flags")
> commit e06177ec7a36 ("drm/panthor: Add a PANTHOR_BO_SYNC ioctl")
> commit ea78ec982653 ("drm/panthor: Expose the selected coherency protocol to the UMD")
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

PS. I will merge this series today.

> ---
>  include/drm-uapi/panthor_drm.h | 246 ++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 240 insertions(+), 6 deletions(-)
> 
> diff --git a/include/drm-uapi/panthor_drm.h b/include/drm-uapi/panthor_drm.h
> index 467d365ed7ba..a2ff0f4ec691 100644
> --- a/include/drm-uapi/panthor_drm.h
> +++ b/include/drm-uapi/panthor_drm.h
> @@ -144,6 +144,16 @@ enum drm_panthor_ioctl_id {
>  	 * pgoff_t size.
>  	 */
>  	DRM_PANTHOR_SET_USER_MMIO_OFFSET,
> +
> +	/** @DRM_PANTHOR_BO_SYNC: Sync BO data to/from the device */
> +	DRM_PANTHOR_BO_SYNC,
> +
> +	/**
> +	 * @DRM_PANTHOR_BO_QUERY_INFO: Query information about a BO.
> +	 *
> +	 * This is useful for imported BOs.
> +	 */
> +	DRM_PANTHOR_BO_QUERY_INFO,
>  };
>  
>  /**
> @@ -243,6 +253,29 @@ enum drm_panthor_dev_query_type {
>  	 * @DRM_PANTHOR_DEV_QUERY_GROUP_PRIORITIES_INFO: Query allowed group priorities information.
>  	 */
>  	DRM_PANTHOR_DEV_QUERY_GROUP_PRIORITIES_INFO,
> +
> +	/** @DRM_PANTHOR_DEV_QUERY_MMU_INFO: Query MMU information. */
> +	DRM_PANTHOR_DEV_QUERY_MMU_INFO,
> +};
> +
> +/**
> + * enum drm_panthor_gpu_coherency: Type of GPU coherency
> + */
> +enum drm_panthor_gpu_coherency {
> +	/**
> +	 * @DRM_PANTHOR_GPU_COHERENCY_ACE_LITE: ACE Lite coherency.
> +	 */
> +	DRM_PANTHOR_GPU_COHERENCY_ACE_LITE = 0,
> +
> +	/**
> +	 * @DRM_PANTHOR_GPU_COHERENCY_ACE: ACE coherency.
> +	 */
> +	DRM_PANTHOR_GPU_COHERENCY_ACE = 1,
> +
> +	/**
> +	 * @DRM_PANTHOR_GPU_COHERENCY_NONE: No coherency.
> +	 */
> +	DRM_PANTHOR_GPU_COHERENCY_NONE = 31,
>  };
>  
>  /**
> @@ -301,7 +334,16 @@ struct drm_panthor_gpu_info {
>  	 */
>  	__u32 thread_max_barrier_size;
>  
> -	/** @coherency_features: Coherency features. */
> +	/**
> +	 * @coherency_features: Coherency features.
> +	 *
> +	 * Combination of drm_panthor_gpu_coherency flags.
> +	 *
> +	 * Note that this is just what the coherency protocols supported by the
> +	 * GPU, but the actual coherency in place depends on the SoC
> +	 * integration and is reflected by
> +	 * drm_panthor_gpu_info::selected_coherency.
> +	 */
>  	__u32 coherency_features;
>  
>  	/** @texture_features: Texture features. */
> @@ -310,8 +352,12 @@ struct drm_panthor_gpu_info {
>  	/** @as_present: Bitmask encoding the number of address-space exposed by the MMU. */
>  	__u32 as_present;
>  
> -	/** @pad0: MBZ. */
> -	__u32 pad0;
> +	/**
> +	 * @selected_coherency: Coherency selected for this device.
> +	 *
> +	 * One of drm_panthor_gpu_coherency.
> +	 */
> +	__u32 selected_coherency;
>  
>  	/** @shader_present: Bitmask encoding the shader cores exposed by the GPU. */
>  	__u64 shader_present;
> @@ -366,6 +412,38 @@ struct drm_panthor_csif_info {
>  	__u32 pad;
>  };
>  
> +/**
> + * enum drm_panthor_timestamp_info_flags - drm_panthor_timestamp_info.flags
> + */
> +enum drm_panthor_timestamp_info_flags {
> +	/** @DRM_PANTHOR_TIMESTAMP_GPU: Query GPU time. */
> +	DRM_PANTHOR_TIMESTAMP_GPU = 1 << 0,
> +
> +	/** @DRM_PANTHOR_TIMESTAMP_CPU_NONE: Don't query CPU time. */
> +	DRM_PANTHOR_TIMESTAMP_CPU_NONE = 0 << 1,
> +
> +	/** @DRM_PANTHOR_TIMESTAMP_CPU_MONOTONIC: Query CPU time using CLOCK_MONOTONIC. */
> +	DRM_PANTHOR_TIMESTAMP_CPU_MONOTONIC = 1 << 1,
> +
> +	/** @DRM_PANTHOR_TIMESTAMP_CPU_MONOTONIC_RAW: Query CPU time using CLOCK_MONOTONIC_RAW. */
> +	DRM_PANTHOR_TIMESTAMP_CPU_MONOTONIC_RAW = 2 << 1,
> +
> +	/** @DRM_PANTHOR_TIMESTAMP_CPU_TYPE_MASK: Space reserved for CPU clock type. */
> +	DRM_PANTHOR_TIMESTAMP_CPU_TYPE_MASK = 7 << 1,
> +
> +	/** @DRM_PANTHOR_TIMESTAMP_GPU_OFFSET: Query GPU offset. */
> +	DRM_PANTHOR_TIMESTAMP_GPU_OFFSET = 1 << 4,
> +
> +	/** @DRM_PANTHOR_TIMESTAMP_GPU_CYCLE_COUNT: Query GPU cycle count. */
> +	DRM_PANTHOR_TIMESTAMP_GPU_CYCLE_COUNT = 1 << 5,
> +
> +	/** @DRM_PANTHOR_TIMESTAMP_FREQ: Query timestamp frequency. */
> +	DRM_PANTHOR_TIMESTAMP_FREQ = 1 << 6,
> +
> +	/** @DRM_PANTHOR_TIMESTAMP_DURATION: Return duration of time query. */
> +	DRM_PANTHOR_TIMESTAMP_DURATION = 1 << 7,
> +};
> +
>  /**
>   * struct drm_panthor_timestamp_info - Timestamp information
>   *
> @@ -378,11 +456,48 @@ struct drm_panthor_timestamp_info {
>  	 */
>  	__u64 timestamp_frequency;
>  
> -	/** @current_timestamp: The current timestamp. */
> +	/** @current_timestamp: The current GPU timestamp. */
>  	__u64 current_timestamp;
>  
> -	/** @timestamp_offset: The offset of the timestamp timer. */
> +	/** @timestamp_offset: The offset of the GPU timestamp timer. */
>  	__u64 timestamp_offset;
> +
> +	/**
> +	 * @flags: Bitmask of drm_panthor_timestamp_info_flags.
> +	 *
> +	 * If set to 0, then it is interpreted as:
> +	 *  DRM_PANTHOR_TIMESTAMP_GPU |
> +	 *  DRM_PANTHOR_TIMESTAMP_GPU_OFFSET |
> +	 *  DRM_PANTHOR_TIMESTAMP_FREQ
> +	 *
> +	 * Note: these flags are exclusive to each other (only one can be used):
> +	 * - DRM_PANTHOR_TIMESTAMP_CPU_NONE
> +	 * - DRM_PANTHOR_TIMESTAMP_CPU_MONOTONIC
> +	 * - DRM_PANTHOR_TIMESTAMP_CPU_MONOTONIC_RAW
> +	 */
> +	__u32 flags;
> +
> +	/** @duration_nsec: Duration of time query. */
> +	__u32 duration_nsec;
> +
> +	/** @cycle_count: Value of GPU_CYCLE_COUNT. */
> +	__u64 cycle_count;
> +
> +	/** @cpu_timestamp_sec: Seconds part of CPU timestamp. */
> +	__u64 cpu_timestamp_sec;
> +
> +	/** @cpu_timestamp_nsec: Nanseconds part of CPU timestamp. */
> +	__u64 cpu_timestamp_nsec;
> +};
> +
> +/**
> + * struct drm_panthor_mmu_info - MMU information
> + *
> + * Structure grouping all queryable information relating to the MMU.
> + */
> +struct drm_panthor_mmu_info {
> +	/** @page_size_bitmap: Allowed page sizes */
> +	__u64 page_size_bitmap;
>  };
>  
>  /**
> @@ -499,6 +614,18 @@ enum drm_panthor_vm_bind_op_flags {
>  	 */
>  	DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED = 1 << 2,
>  
> +	/**
> +	 * @DRM_PANTHOR_VM_BIND_OP_MAP_SPARSE: Sparsely map a virtual memory range
> +	 *
> +	 * Only valid with DRM_PANTHOR_VM_BIND_OP_TYPE_MAP.
> +	 *
> +	 * When this flag is set, the whole vm_bind range is mapped over a dummy object in a cyclic
> +	 * fashion, and all GPU reads from addresses in the range return undefined values. This flag
> +	 * being set means drm_panthor_vm_bind_op::bo_offset and drm_panthor_vm_bind_op::bo_handle
> +	 * must both be set to 0. DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC must also be set.
> +	 */
> +	DRM_PANTHOR_VM_BIND_OP_MAP_SPARSE = 1 << 3,
> +
>  	/**
>  	 * @DRM_PANTHOR_VM_BIND_OP_TYPE_MASK: Mask used to determine the type of operation.
>  	 */
> @@ -562,7 +689,6 @@ struct drm_panthor_vm_bind_op {
>  	 * This array shall not be empty for sync-only operations.
>  	 */
>  	struct drm_panthor_obj_array syncs;
> -
>  };
>  
>  /**
> @@ -638,6 +764,15 @@ struct drm_panthor_vm_get_state {
>  enum drm_panthor_bo_flags {
>  	/** @DRM_PANTHOR_BO_NO_MMAP: The buffer object will never be CPU-mapped in userspace. */
>  	DRM_PANTHOR_BO_NO_MMAP = (1 << 0),
> +
> +	/**
> +	 * @DRM_PANTHOR_BO_WB_MMAP: Force "Write-Back Cacheable" CPU mapping.
> +	 *
> +	 * CPU map the buffer object in userspace by forcing the "Write-Back
> +	 * Cacheable" cacheability attribute. The mapping otherwise uses the
> +	 * "Non-Cacheable" attribute if the GPU is not IO coherent.
> +	 */
> +	DRM_PANTHOR_BO_WB_MMAP = (1 << 1),
>  };
>  
>  /**
> @@ -1040,6 +1175,101 @@ struct drm_panthor_set_user_mmio_offset {
>  	__u64 offset;
>  };
>  
> +/**
> + * enum drm_panthor_bo_sync_op_type - BO sync type
> + */
> +enum drm_panthor_bo_sync_op_type {
> +	/** @DRM_PANTHOR_BO_SYNC_CPU_CACHE_FLUSH: Flush CPU caches. */
> +	DRM_PANTHOR_BO_SYNC_CPU_CACHE_FLUSH = 0,
> +
> +	/** @DRM_PANTHOR_BO_SYNC_CPU_CACHE_FLUSH_AND_INVALIDATE: Flush and invalidate CPU caches. */
> +	DRM_PANTHOR_BO_SYNC_CPU_CACHE_FLUSH_AND_INVALIDATE = 1,
> +};
> +
> +/**
> + * struct drm_panthor_bo_sync_op - BO map sync op
> + */
> +struct drm_panthor_bo_sync_op {
> +	/** @handle: Handle of the buffer object to sync. */
> +	__u32 handle;
> +
> +	/** @type: Type of operation. */
> +	__u32 type;
> +
> +	/**
> +	 * @offset: Offset into the BO at which the sync range starts.
> +	 *
> +	 * This will be rounded down to the nearest cache line as needed.
> +	 */
> +	__u64 offset;
> +
> +	/**
> +	 * @size: Size of the range to sync
> +	 *
> +	 * @size + @offset will be rounded up to the nearest cache line as
> +	 * needed.
> +	 */
> +	__u64 size;
> +};
> +
> +/**
> + * struct drm_panthor_bo_sync - BO map sync request
> + */
> +struct drm_panthor_bo_sync {
> +	/**
> +	 * @ops: Array of struct drm_panthor_bo_sync_op sync operations.
> +	 */
> +	struct drm_panthor_obj_array ops;
> +};
> +
> +/**
> + * enum drm_panthor_bo_extra_flags - Set of flags returned on a BO_QUERY_INFO request
> + *
> + * Those are flags reflecting BO properties that are not directly coming from the flags
> + * passed are creation time, or information on BOs that were imported from other drivers.
> + */
> +enum drm_panthor_bo_extra_flags {
> +	/**
> +	 * @DRM_PANTHOR_BO_IS_IMPORTED: BO has been imported from an external driver.
> +	 *
> +	 * Note that imported dma-buf handles are not flagged as imported if they
> +	 * where exported by panthor. Only buffers that are coming from other drivers
> +	 * (dma heaps, other GPUs, display controllers, V4L, ...).
> +	 *
> +	 * It's also important to note that all imported BOs are mapped cached and can't
> +	 * be considered IO-coherent even if the GPU is. This means they require explicit
> +	 * syncs that must go through the DRM_PANTHOR_BO_SYNC ioctl (userland cache
> +	 * maintenance is not allowed in that case, because extra operations might be
> +	 * needed to make changes visible to the CPU/device, like buffer migration when the
> +	 * exporter is a GPU with its own VRAM).
> +	 */
> +	DRM_PANTHOR_BO_IS_IMPORTED = (1 << 0),
> +};
> +
> +/**
> + * struct drm_panthor_bo_query_info - Query BO info
> + */
> +struct drm_panthor_bo_query_info {
> +	/** @handle: Handle of the buffer object to query flags on. */
> +	__u32 handle;
> +
> +	/**
> +	 * @extra_flags: Combination of enum drm_panthor_bo_extra_flags flags.
> +	 */
> +	__u32 extra_flags;
> +
> +	/**
> +	 * @create_flags: Flags passed at creation time.
> +	 *
> +	 * Combination of enum drm_panthor_bo_flags flags.
> +	 * Will be zero if the buffer comes from a different driver.
> +	 */
> +	__u32 create_flags;
> +
> +	/** @pad: Will be zero on return. */
> +	__u32 pad;
> +};
> +
>  /**
>   * DRM_IOCTL_PANTHOR() - Build a Panthor IOCTL number
>   * @__access: Access type. Must be R, W or RW.
> @@ -1086,6 +1316,10 @@ enum {
>  		DRM_IOCTL_PANTHOR(WR, BO_SET_LABEL, bo_set_label),
>  	DRM_IOCTL_PANTHOR_SET_USER_MMIO_OFFSET =
>  		DRM_IOCTL_PANTHOR(WR, SET_USER_MMIO_OFFSET, set_user_mmio_offset),
> +	DRM_IOCTL_PANTHOR_BO_SYNC =
> +		DRM_IOCTL_PANTHOR(WR, BO_SYNC, bo_sync),
> +	DRM_IOCTL_PANTHOR_BO_QUERY_INFO =
> +		DRM_IOCTL_PANTHOR(WR, BO_QUERY_INFO, bo_query_info),
>  };
>  
>  #if defined(__cplusplus)
> 
> -- 
> 2.55.0
> 
