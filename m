Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEF08F4645F
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 12:21:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64D3610E51C;
	Mon, 16 Mar 2026 12:21:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CmBSlHoQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99CDE10E51C
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 12:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773663684; x=1805199684;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=916VyzubclLYi35Bv6EVkcwOKFckzoP87XnY7al7W38=;
 b=CmBSlHoQryiUJ8SlEk2KUbGPViVWiAAeLQ5JkTxmvAbSSoVSK/4dQq0/
 ShfD+aIJm6Lia0rrWwFDvxoEktp/Ak0pN3Q8YAHo1/rAtj5i2Vs56G9VH
 aXG+1aTc3t6O6Jto9yySik1c5w0/TMktdFWTM6BQM2Obw+21r/TtBH1Cz
 YATG/cwdSFVHSrUNPvct7i9fborosq4ZSVw0CSvddmRnSg/eF8/kFJhm4
 At8H9N0Ej98pocs62gkq5v62JhXwrLX1zTF3RXNvi2+ed/CEo0PqrS82t
 AJ0DvmC2JEyv5YXo2DGUmwaaQPu2l6Tb4sJyji+EEkPhWqWNKNbpqY6jm w==;
X-CSE-ConnectionGUID: uJVdm8XARHyw6D1tQ3t2ZA==
X-CSE-MsgGUID: 6RzBUhVdRDOQBLkzpC0ISQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="74650211"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="74650211"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 05:21:24 -0700
X-CSE-ConnectionGUID: P6MDmJCtRte3KPGF8wx8+A==
X-CSE-MsgGUID: Omzv9qLsQviiBfvKscoYJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="222110376"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 05:21:20 -0700
Date: Mon, 16 Mar 2026 13:21:01 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Janne Grunau <j@jannau.net>, Danilo Krummrich <dakr@kernel.org>,
 kernel@collabora.com
Subject: Re: [PATCH v1 1/4] drm-uapi/panthor: Sync panthor uapi
Message-ID: <20260316122101.fymyjpuylzivcvrw@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
 igt-dev@lists.freedesktop.org,
 Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Janne Grunau <j@jannau.net>, Danilo Krummrich <dakr@kernel.org>,
 kernel@collabora.com
References: <20260313175908.1752151-1-adrian.larumbe@collabora.com>
 <20260313175908.1752151-2-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260313175908.1752151-2-adrian.larumbe@collabora.com>
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
On 2026-03-13 at 17:58:28 +0000, Adrián Larumbe wrote:
> Pull it from drm-misc-next.

Please bring it from drm-next, I see there are more commits, so write
here something like:

Synchronize panthor uapi with drm-next kernel up to 5c3c3e7b654d,
which includes the following changes:

commit 5c3c3e7b654d ("drm/panthor: Fix kerneldoc in uAPI header")
commit cd2c9c3015e6 ("drm/panthor: Add flag to map GEM object Write-Back Cacheable")
commit c146c82f862e ("drm/panthor: Add an ioctl to query BO flags")
commit e06177ec7a36 ("drm/panthor: Add a PANTHOR_BO_SYNC ioctl")
commit ea78ec982653 ("drm/panthor: Expose the selected coherency protocol to the UMD")

Also, please sync it with latest commit ("drm/panthor: Fix kerneldoc in uAPI header")
so subject would be like:

Subject: Re: [PATCH v1 1/4] drm-uapi/panthor: Sync panthor uapi with kernel up to 5c3c3e7b654d

Regards,
Kamil

> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> ---
>  include/drm-uapi/panthor_drm.h | 190 ++++++++++++++++++++++++++++++++-
>  1 file changed, 187 insertions(+), 3 deletions(-)
> 
> diff --git a/include/drm-uapi/panthor_drm.h b/include/drm-uapi/panthor_drm.h
> index 467d365ed7ba..46217ce2c0f5 100644
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
> @@ -236,6 +246,9 @@ enum drm_panthor_dev_query_type {
>  	/** @DRM_PANTHOR_DEV_QUERY_CSIF_INFO: Query command-stream interface information. */
>  	DRM_PANTHOR_DEV_QUERY_CSIF_INFO,
>  
> +	/** @DRM_PANTHOR_DEV_QUERY_MMU_INFO: Query MMU information. */
> +	DRM_PANTHOR_DEV_QUERY_MMU_INFO,
> +
>  	/** @DRM_PANTHOR_DEV_QUERY_TIMESTAMP_INFO: Query timestamp information. */
>  	DRM_PANTHOR_DEV_QUERY_TIMESTAMP_INFO,
>  
> @@ -245,6 +258,26 @@ enum drm_panthor_dev_query_type {
>  	DRM_PANTHOR_DEV_QUERY_GROUP_PRIORITIES_INFO,
>  };
>  
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
> +};
> +
>  /**
>   * struct drm_panthor_gpu_info - GPU information
>   *
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
> @@ -366,6 +412,16 @@ struct drm_panthor_csif_info {
>  	__u32 pad;
>  };
>  
> +/**
> + * struct drm_panthor_mmu_info - MMU information
> + *
> + * Structure grouping all queryable information relating to the MMU.
> + */
> +struct drm_panthor_mmu_info {
> +	/** @page_size_bitmap: Allowed page sizes */
> +	__u64 page_size_bitmap;
> +};
> +
>  /**
>   * struct drm_panthor_timestamp_info - Timestamp information
>   *
> @@ -499,6 +555,17 @@ enum drm_panthor_vm_bind_op_flags {
>  	 */
>  	DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED = 1 << 2,
>  
> +	/**
> +	 * @DRM_PANTHOR_VM_BIND_OP_MAP_REPEAT: Repeat a BO range
> +	 *
> +	 * Only valid with DRM_PANTHOR_VM_BIND_OP_TYPE_MAP.
> +	 *
> +	 * When this is set, a BO range is repeated over the VA range.
> +	 * drm_panthor_vm_bind_op::bo_repeat_range defines the size of the
> +	 * BO range to repeat.
> +	 */
> +	DRM_PANTHOR_VM_BIND_OP_MAP_REPEAT = 1 << 3,
> +
>  	/**
>  	 * @DRM_PANTHOR_VM_BIND_OP_TYPE_MASK: Mask used to determine the type of operation.
>  	 */
> @@ -563,6 +630,15 @@ struct drm_panthor_vm_bind_op {
>  	 */
>  	struct drm_panthor_obj_array syncs;
>  
> +	/**
> +	 * @bo_repeat_range: The size of the range to be repeated.
> +	 *
> +	 * Must be zero if DRM_PANTHOR_VM_BIND_OP_MAP_REPEAT is not set in
> +	 * flags.
> +	 *
> +	 * Size must be a multiple of bo_repeat_range.
> +	 */
> +	__u64 bo_repeat_range;
>  };
>  
>  /**
> @@ -638,6 +714,15 @@ struct drm_panthor_vm_get_state {
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
> @@ -1040,6 +1125,101 @@ struct drm_panthor_set_user_mmio_offset {
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
> @@ -1086,6 +1266,10 @@ enum {
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
> -- 
> 2.53.0
> 
