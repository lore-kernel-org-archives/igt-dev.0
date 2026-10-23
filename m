Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8EB8606A31A
	for <igt-dev@archiver.kernel.org>; Fri, 23 Oct 2026 15:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MQ5gkP6D
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77BDD10E514;
	Fri, 23 Oct 2026 15:02:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAC6410E0AA
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Oct 2026 14:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792767130; x=1824303130;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=hoYwLJLnrVDkw6P/TihTExOqVEKoBAfGQXdGPyX5TdY=;
 b=MQ5gkP6DY5LBxTTWUirpWHMmGrZEZzRtE3Gu9faTyGsqH+I3PH9zh7Oe
 uli408ImkNBJYDI/0iRaTm9BI1JiVLSldVK5SLZW3zhc6JrAmELoCUtLY
 QZUIcZsoXGCMAdhUnijb+UhjU+DKT04fS+OsCuHd4dlF02sIvCMZ9LMmH
 6eOQcgH1MvMs49wl6RDkHqqNUROLKUNw0eakP/l7ptDbHY7rA66kDcPcg
 I3FwLSBYKsvhRqM3x17fxQkIZSd/2G3/Jn/f+EQEmBX0dMPR1F6duERzy
 bqs7/FHIdHA0YsNYOqmAHSCviOV46bEAt0tyPyGTHaZmZo3e7FbMfaMfz g==;
X-CSE-ConnectionGUID: b7f4CTCeR0Cdzqmae7M+1g==
X-CSE-MsgGUID: y6gUg4+UQWqv/JZPd00T7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1548157"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1548157"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 07:52:10 -0700
X-CSE-ConnectionGUID: EDknFeh3Su+rxNk2RDB6NQ==
X-CSE-MsgGUID: +leAayMHQU2CVXXYaI4Gig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="4000777"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 07:52:08 -0700
Date: Fri, 23 Oct 2026 16:51:50 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Cc: igt-dev@lists.freedesktop.org, Soham Purkait <soham.purkait@intel.com>,
 Riana Tauro <riana.tauro@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>,
 Raag Jadav <raag.jadav@intel.com>, Badal Nilawar <badal.nilawar@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: Re: [PATCH] drm-uapi/xe_drm: sync with kernel 69183b706206
Message-ID: <20261023145150.mtwc6wvtm4tcp64b@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 igt-dev@lists.freedesktop.org,
 Soham Purkait <soham.purkait@intel.com>,
 Riana Tauro <riana.tauro@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>,
 Raag Jadav <raag.jadav@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
References: <20261023085101.978447-1-ravi.kishore.koppuravuri@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261023085101.978447-1-ravi.kishore.koppuravuri@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Ravi,
On 2026-10-23 at 14:21:01 +0530, Ravi Kishore Koppuravuri wrote:
> Sync Xe drm uapi with drm-tip up to commit 69183b706206, this will bring

s/drm-tip/drm-next/

> following changes:
> 
> 69183b706206 ("drm/xe/uapi: Expose ban reason in EXEC_QUEUE_GET_PROPERTY_BAN")
> 88064894bcce ("drm/xe/vm: Add srcid to xe_vm_get_property_ioctl fault report")
> 3a8bfa1f2af7 ("drm/xe: Documentation: fix chars used for subsection")
> cdeb5e248de1 ("drm/xe/uapi: Add additional error components to xe drm_ras")
> 5150b57dacf9 ("drm/xe/uapi: Fix doc formatting and completeness in xe_drm.h")
> 96cc9d79df5f ("drm/xe/uapi: Fix code examples in xe_drm.h documentation")
> 4bd87e7c4d46 ("drm/xe/uapi: Fix kernel-doc cross-reference syntax in xe_drm.h")
> ea842c235828 ("drm/xe/uapi: Fix wrong names and references in xe_drm.h")
> 65d53c13d43b ("drm/xe/uapi: Fix grammar errors in xe_drm.h documentation")
> 3233db7682e7 ("drm/xe/uapi: Fix typos and spelling errors in xe_drm.h documentation")
> 
> Cc: Soham Purkait <soham.purkait@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Cc: Raag Jadav <raag.jadav@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
> ---
>  include/drm-uapi/xe_drm.h | 253 +++++++++++++++++++++-----------------
>  1 file changed, 139 insertions(+), 114 deletions(-)
> 
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> index 5a96a7910..578f0c1eb 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -3,8 +3,8 @@
>   * Copyright © 2023 Intel Corporation
>   */
>  
> -#ifndef _XE_DRM_H_
> -#define _XE_DRM_H_
> +#ifndef _UAPI_XE_DRM_H_
> +#define _UAPI_XE_DRM_H_

These changes indicate you made raw copy, instead
please use procedure described in igt README.md:

# From the kernel dir with a drm/drm-next commit checked out:
$ make INSTALL_HDR_PATH=<dest-dir> headers_install
$ cp <dest-dir>/include/drm/i915_drm.h <igt-dir>/include/drm-uapi/

>  
>  #include "drm.h"
>  
> @@ -83,6 +83,7 @@ extern "C" {
>   *  - &DRM_IOCTL_XE_OBSERVATION
>   *  - &DRM_IOCTL_XE_MADVISE
>   *  - &DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS
> + *  - &DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY
>   *  - &DRM_IOCTL_XE_VM_GET_PROPERTY
>   */
>  
> @@ -145,7 +146,7 @@ extern "C" {
>   * redefine the interface more easily than an ever growing struct of
>   * increasing complexity, and for large parts of that interface to be
>   * entirely optional. The downside is more pointer chasing; chasing across
> - * the boundary with pointers encapsulated inside u64.
> + * the __user boundary with pointers encapsulated inside u64.

This '__user' should not be here, it will disappear when you
will use headers_install.

>   *
>   * Example chaining:
>   *
> @@ -167,7 +168,7 @@ extern "C" {
>   * Typically the struct drm_xe_user_extension would be embedded in some uAPI
>   * struct, and in this case we would feed it the head of the chain(i.e ext1),
>   * which would then apply all of the above extensions.
> -*/
> + */
>  
>  /**
>   * struct drm_xe_user_extension - Base class for defining a chain of extensions
> @@ -229,9 +230,9 @@ struct drm_xe_ext_set_property {
>  /**
>   * struct drm_xe_engine_class_instance - instance of an engine class
>   *
> - * It is returned as part of the @drm_xe_engine, but it also is used as
> - * the input of engine selection for both @drm_xe_exec_queue_create and
> - * @drm_xe_query_engine_cycles
> + * It is returned as part of the &struct drm_xe_engine, but it also is used as
> + * the input of engine selection for both &struct drm_xe_exec_queue_create and
> + * &struct drm_xe_query_engine_cycles
>   *
>   * The @engine_class can be:
>   *  - %DRM_XE_ENGINE_CLASS_RENDER
> @@ -264,7 +265,7 @@ struct drm_xe_engine_class_instance {
>   * struct drm_xe_engine - describe hardware engine
>   */
>  struct drm_xe_engine {
> -	/** @instance: The @drm_xe_engine_class_instance */
> +	/** @instance: The &struct drm_xe_engine_class_instance */
>  	struct drm_xe_engine_class_instance instance;
>  
>  	/** @reserved: Reserved */
> @@ -274,9 +275,9 @@ struct drm_xe_engine {
>  /**
>   * struct drm_xe_query_engines - describe engines
>   *
> - * If a query is made with a struct @drm_xe_device_query where .query
> + * If a query is made with a &struct drm_xe_device_query where .query
>   * is equal to %DRM_XE_DEVICE_QUERY_ENGINES, then the reply uses an array of
> - * struct @drm_xe_query_engines in .data.
> + * &struct drm_xe_query_engines in .data.
>   */
>  struct drm_xe_query_engines {
>  	/** @num_engines: number of engines returned in @engines */
> @@ -349,7 +350,7 @@ struct drm_xe_mem_region {
>  	 * is smaller than @total_size then this is referred to as a
>  	 * small BAR system.
>  	 *
> -	 * On systems without small BAR (full BAR), the probed_size will
> +	 * On systems without small BAR (full BAR), the @cpu_visible_size will
>  	 * always equal the @total_size, since all of it will be CPU
>  	 * accessible.
>  	 *
> @@ -410,7 +411,7 @@ struct drm_xe_query_mem_regions {
>   *      device supports the userspace hint %DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION.
>   *      This is exposed only on Xe2+.
>   *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_DISABLE_STATE_CACHE_PERF_FIX - Flag is set
> - *      if a queue can be creaed with
> + *      if a queue can be created with
>   *      %DRM_XE_EXEC_QUEUE_SET_DISABLE_STATE_CACHE_PERF_FIX
>   *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory alignment
>   *    required by this device, typically SZ_4K or SZ_64K
> @@ -705,7 +706,10 @@ struct drm_xe_query_pxp_status {
>   *    attributes.
>   *  - %DRM_XE_DEVICE_QUERY_GT_TOPOLOGY
>   *  - %DRM_XE_DEVICE_QUERY_ENGINE_CYCLES
> + *  - %DRM_XE_DEVICE_QUERY_UC_FW_VERSION
> + *  - %DRM_XE_DEVICE_QUERY_OA_UNITS
>   *  - %DRM_XE_DEVICE_QUERY_PXP_STATUS
> + *  - %DRM_XE_DEVICE_QUERY_EU_STALL
>   *
>   * If size is set to 0, the driver fills it with the required size for
>   * the requested type of data to query. If size is equal to the required
> @@ -825,7 +829,7 @@ struct drm_xe_device_query {
>   *
>   * This ioctl supports setting the following properties via the
>   * %DRM_XE_GEM_CREATE_EXTENSION_SET_PROPERTY extension, which uses the
> - * generic @drm_xe_ext_set_property struct:
> + * generic &struct drm_xe_ext_set_property:
>   *
>   *  - %DRM_XE_GEM_CREATE_SET_PROPERTY_PXP_TYPE - set the type of PXP session
>   *    this object will be used with. Valid values are listed in enum
> @@ -862,8 +866,7 @@ struct drm_xe_gem_create {
>  #define DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM	(1 << 2)
>  #define DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION		(1 << 3)
>  	/**
> -	 * @flags: Flags, currently a mask of memory instances of where BO can
> -	 * be placed
> +	 * @flags: Flags for the GEM object, see DRM_XE_GEM_CREATE_FLAG_*
>  	 */
>  	__u32 flags;
>  
> @@ -888,7 +891,7 @@ struct drm_xe_gem_create {
>  #define DRM_XE_GEM_CPU_CACHING_WC                      2
>  	/**
>  	 * @cpu_caching: The CPU caching mode to select for this object. If
> -	 * mmaping the object the mode selected here will also be used. The
> +	 * mmapping the object the mode selected here will also be used. The
>  	 * exception is when mapping system memory (including data evicted
>  	 * to system) on discrete GPUs. The caching mode selected will
>  	 * then be overridden to DRM_XE_GEM_CPU_CACHING_WB, and coherency
> @@ -931,7 +934,7 @@ struct drm_xe_gem_create {
>   *
>   *     err = ioctl(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo);
>   *     map = mmap(NULL, size, PROT_WRITE, MAP_SHARED, fd, mmo.offset);
> - *     map[i] = 0xdeadbeaf; // issue barrier
> + *     map[i] = 0xdeadbeef; // issue barrier
>   */
>  struct drm_xe_gem_mmap_offset {
>  	/** @extensions: Pointer to the first extension struct, if any */
> @@ -958,8 +961,8 @@ struct drm_xe_gem_mmap_offset {
>   *  - %DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE - Map the whole virtual address
>   *    space of the VM to scratch page. A vm_bind would overwrite the scratch
>   *    page mapping. This flag is mutually exclusive with the
> - *    %DRM_XE_VM_CREATE_FLAG_FAULT_MODE flag, with an exception of on x2 and
> - *    xe3 platform.
> + *    %DRM_XE_VM_CREATE_FLAG_FAULT_MODE flag, with an exception on Xe2 and
> + *    Xe3 platforms.
>   *  - %DRM_XE_VM_CREATE_FLAG_LR_MODE - An LR, or Long Running VM accepts
>   *    exec submissions to its exec_queues that don't have an upper time
>   *    limit on the job execution time. But exec submissions to these
> @@ -1045,7 +1048,7 @@ struct drm_xe_vm_destroy {
>   *    set, no mappings are created rather the range is reserved for CPU address
>   *    mirroring which will be populated on GPU page faults or prefetches. Only
>   *    valid on VMs with DRM_XE_VM_CREATE_FLAG_FAULT_MODE set. The CPU address
> - *    mirror flag are only valid for DRM_XE_VM_BIND_OP_MAP operations, the BO
> + *    mirror flag is only valid for DRM_XE_VM_BIND_OP_MAP operations, the BO
>   *    handle MBZ, and the BO offset MBZ.
>   *  - %DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET - Can be used in combination with
>   *    %DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR to reset madvises when the underlying
> @@ -1061,6 +1064,7 @@ struct drm_xe_vm_destroy {
>   *    not invoke autoreset. Neither will stack variables going out of scope.
>   *    Therefore it's recommended to always explicitly reset the madvises when
>   *    freeing the memory backing a region used in a &DRM_IOCTL_XE_MADVISE call.
> + *
>   *  - %DRM_XE_VM_BIND_FLAG_DECOMPRESS - Request on-device decompression for a MAP.
>   *    When set on a MAP bind operation, request the driver schedule an on-device
>   *    in-place decompression (via the migrate/resolve path) for the GPU mapping
> @@ -1109,7 +1113,7 @@ struct drm_xe_vm_bind_op {
>  	 *	ppGTT WT -> COH_NONE
>  	 *	ppGTT WB -> COH_AT_LEAST_1WAY
>  	 *
> -	 * In practice UC/WC/WT should only ever used for scanout surfaces on
> +	 * In practice UC/WC/WT should only ever be used for scanout surfaces on
>  	 * such platforms (or perhaps in general for dma-buf if shared with
>  	 * another device) since it is only the display engine that is actually
>  	 * incoherent.  Everything else should typically use WB given that we
> @@ -1199,10 +1203,10 @@ struct drm_xe_vm_bind_op {
>  /**
>   * struct drm_xe_vm_bind - Input of &DRM_IOCTL_XE_VM_BIND
>   *
> - * Below is an example of a minimal use of @drm_xe_vm_bind to
> + * Below is an example of a minimal use of &struct drm_xe_vm_bind to
>   * asynchronously bind the buffer `data` at address `BIND_ADDRESS` to
>   * illustrate `userptr`. It can be synchronized by using the example
> - * provided for @drm_xe_sync.
> + * provided for &struct drm_xe_sync.
>   *
>   * .. code-block:: C
>   *
> @@ -1290,8 +1294,8 @@ struct xe_vm_fault {
>  #define FAULT_LEVEL_PML4	3
>  #define FAULT_LEVEL_PML5	4
>  	__u8 fault_level;
> -	/** @pad: MBZ */
> -	__u8 pad;
> +	/** @srcid: ID of the faulting hardware unit */
> +	__u8 srcid;
>  	/** @reserved: MBZ */
>  	__u64 reserved[4];
>  };
> @@ -1355,7 +1359,7 @@ struct drm_xe_vm_get_property {
>   *
>   * This ioctl supports setting the following properties via the
>   * %DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY extension, which uses the
> - * generic @drm_xe_ext_set_property struct:
> + * generic &struct drm_xe_ext_set_property:
>   *
>   *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY - set the queue priority.
>   *    CAP_SYS_NICE is required to set a value above normal.
> @@ -1366,7 +1370,7 @@ struct drm_xe_vm_get_property {
>   *    drm_xe_pxp_session_type. %DRM_XE_PXP_TYPE_NONE is the default behavior, so
>   *    there is no need to explicitly set that. When a queue of type
>   *    %DRM_XE_PXP_TYPE_HWDRM is created, the PXP default HWDRM session
> - *    (%XE_PXP_HWDRM_DEFAULT_SESSION) will be started, if isn't already running.
> + *    (%DRM_XE_PXP_HWDRM_DEFAULT_SESSION) will be started, if it isn't already running.
>   *    The user is expected to query the PXP status via the query ioctl (see
>   *    %DRM_XE_DEVICE_QUERY_PXP_STATUS) and to wait for PXP to be ready before
>   *    attempting to create a queue with this property. When a queue is created
> @@ -1390,9 +1394,9 @@ struct drm_xe_vm_get_property {
>   *    enable render color cache keying on BTP+BTI instead of just BTI
>   *    (only valid for render queues).
>   *
> - * The example below shows how to use @drm_xe_exec_queue_create to create
> + * The example below shows how to use &struct drm_xe_exec_queue_create to create
>   * a simple exec_queue (no parallel submission) of class
> - * &DRM_XE_ENGINE_CLASS_RENDER.
> + * %DRM_XE_ENGINE_CLASS_RENDER.
>   *
>   * .. code-block:: C
>   *
> @@ -1402,23 +1406,25 @@ struct drm_xe_vm_get_property {
>   *     struct drm_xe_exec_queue_create exec_queue_create = {
>   *          .extensions = 0,
>   *          .vm_id = vm,
> - *          .num_bb_per_exec = 1,
> - *          .num_eng_per_bb = 1,
> + *          .width = 1,
> + *          .num_placements = 1,
>   *          .instances = to_user_pointer(&instance),
>   *     };
>   *     ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &exec_queue_create);
>   *
> - *     Allow users to provide a hint to kernel for cases demanding low latency
> - *     profile. Please note it will have impact on power consumption. User can
> - *     indicate low latency hint with flag while creating exec queue as
> - *     mentioned below,
> + * Allow users to provide a hint to kernel for cases demanding low latency
> + * profile. Please note it will have impact on power consumption. User can
> + * indicate low latency hint with flag while creating exec queue as
> + * mentioned below:
> + *
> + * .. code-block:: C
>   *
>   *     struct drm_xe_exec_queue_create exec_queue_create = {
>   *          .flags = DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT,
>   *          .extensions = 0,
>   *          .vm_id = vm,
> - *          .num_bb_per_exec = 1,
> - *          .num_eng_per_bb = 1,
> + *          .width = 1,
> + *          .num_placements = 1,
>   *          .instances = to_user_pointer(&instance),
>   *     };
>   *     ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &exec_queue_create);
> @@ -1485,6 +1491,12 @@ struct drm_xe_exec_queue_destroy {
>   *
>   * The @property can be:
>   *  - %DRM_XE_EXEC_QUEUE_GET_PROPERTY_BAN
> + *
> + * For %DRM_XE_EXEC_QUEUE_GET_PROPERTY_BAN, @value is a bitmask of ban reasons:
> + *  - %DRM_XE_EXEC_QUEUE_BAN_REASON_GPU_HANG - banned due to GPU hang/timeout
> + *  - %DRM_XE_EXEC_QUEUE_BAN_REASON_PAGE_OFFLINE - banned due to memory page offline
> + *
> + * A @value of 0 means the exec queue is not banned.
>   */
>  struct drm_xe_exec_queue_get_property {
>  	/** @extensions: Pointer to the first extension struct, if any */
> @@ -1497,7 +1509,17 @@ struct drm_xe_exec_queue_get_property {
>  	/** @property: property to get */
>  	__u32 property;
>  
> -	/** @value: property value */
> +	/**
> +	 * @value: property value
> +	 *
> +	 * For %DRM_XE_EXEC_QUEUE_GET_PROPERTY_BAN, this is a bitmask of:
> +	 *  - %DRM_XE_EXEC_QUEUE_BAN_REASON_GPU_HANG - banned due to GPU hang/timeout
> +	 *  - %DRM_XE_EXEC_QUEUE_BAN_REASON_PAGE_OFFLINE - banned due to memory page offline
> +	 *
> +	 * Value of 0 means the exec queue is not banned.
> +	 */
> +#define DRM_XE_EXEC_QUEUE_BAN_REASON_GPU_HANG		(1 << 0)
> +#define DRM_XE_EXEC_QUEUE_BAN_REASON_PAGE_OFFLINE	(1 << 1)
>  	__u64 value;
>  
>  	/** @reserved: Reserved */
> @@ -1515,7 +1537,7 @@ struct drm_xe_exec_queue_get_property {
>   * and the @flags can be:
>   *  - %DRM_XE_SYNC_FLAG_SIGNAL
>   *
> - * A minimal use of @drm_xe_sync looks like this:
> + * A minimal use of &struct drm_xe_sync looks like this:
>   *
>   * .. code-block:: C
>   *
> @@ -1546,7 +1568,7 @@ struct drm_xe_sync {
>  #define DRM_XE_SYNC_TYPE_SYNCOBJ		0x0
>  #define DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ	0x1
>  #define DRM_XE_SYNC_TYPE_USER_FENCE		0x2
> -	/** @type: Type of the this sync object */
> +	/** @type: Type of this sync object */
>  	__u32 type;
>  
>  #define DRM_XE_SYNC_FLAG_SIGNAL	(1 << 0)
> @@ -1559,9 +1581,9 @@ struct drm_xe_sync {
>  
>  		/**
>  		 * @addr: Address of user fence. When sync is passed in via exec
> -		 * IOCTL this is a GPU address in the VM. When sync passed in via
> +		 * IOCTL this is a GPU address in the VM. When sync is passed in via
>  		 * VM bind IOCTL this is a user pointer. In either case, it is
> -		 * the users responsibility that this address is present and
> +		 * the user's responsibility that this address is present and
>  		 * mapped when the user fence is signalled. Must be qword
>  		 * aligned.
>  		 */
> @@ -1581,10 +1603,10 @@ struct drm_xe_sync {
>  /**
>   * struct drm_xe_exec - Input of &DRM_IOCTL_XE_EXEC
>   *
> - * This is an example to use @drm_xe_exec for execution of the object
> - * at BIND_ADDRESS (see example in @drm_xe_vm_bind) by an exec_queue
> - * (see example in @drm_xe_exec_queue_create). It can be synchronized
> - * by using the example provided for @drm_xe_sync.
> + * This is an example to use &struct drm_xe_exec for execution of the object
> + * at BIND_ADDRESS (see example in &struct drm_xe_vm_bind) by an exec_queue
> + * (see example in &struct drm_xe_exec_queue_create). It can be synchronized
> + * by using the example provided for &struct drm_xe_sync.
>   *
>   * .. code-block:: C
>   *
> @@ -1651,7 +1673,6 @@ struct drm_xe_exec {
>   *
>   * and the @flags can be:
>   *  - %DRM_XE_UFENCE_WAIT_FLAG_ABSTIME
> - *  - %DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP
>   *
>   * The @mask values can be for example:
>   *  - 0xffu for u8
> @@ -1664,7 +1685,7 @@ struct drm_xe_wait_user_fence {
>  	__u64 extensions;
>  
>  	/**
> -	 * @addr: user pointer address to wait on, must qword aligned
> +	 * @addr: user pointer address to wait on, must be qword aligned
>  	 */
>  	__u64 addr;
>  
> @@ -1695,9 +1716,9 @@ struct drm_xe_wait_user_fence {
>  	 * Without DRM_XE_UFENCE_WAIT_FLAG_ABSTIME flag set (relative timeout)
>  	 * it contains timeout expressed in nanoseconds to wait (fence will
>  	 * expire at now() + timeout).
> -	 * When DRM_XE_UFENCE_WAIT_FLAG_ABSTIME flat is set (absolute timeout) wait
> -	 * will end at timeout (uses system MONOTONIC_CLOCK).
> -	 * Passing negative timeout leads to neverending wait.
> +	 * When DRM_XE_UFENCE_WAIT_FLAG_ABSTIME flag is set (absolute timeout) wait
> +	 * will end at timeout (uses system CLOCK_MONOTONIC).
> +	 * Passing negative timeout leads to never ending wait.
>  	 *
>  	 * On relative timeout this value is updated with timeout left
>  	 * (for restarting the call in case of signal delivery).
> @@ -1741,7 +1762,7 @@ enum drm_xe_observation_op {
>  };
>  
>  /**
> - * struct drm_xe_observation_param - Input of &DRM_XE_OBSERVATION
> + * struct drm_xe_observation_param - Input of &DRM_IOCTL_XE_OBSERVATION
>   *
>   * The observation layer enables multiplexing observation streams of
>   * multiple types. The actual params for a particular stream operation are
> @@ -1751,25 +1772,25 @@ enum drm_xe_observation_op {
>  struct drm_xe_observation_param {
>  	/** @extensions: Pointer to the first extension struct, if any */
>  	__u64 extensions;
> -	/** @observation_type: observation stream type, of enum @drm_xe_observation_type */
> +	/** @observation_type: observation stream type, of &enum drm_xe_observation_type */
>  	__u64 observation_type;
> -	/** @observation_op: observation stream op, of enum @drm_xe_observation_op */
> +	/** @observation_op: observation stream op, of &enum drm_xe_observation_op */
>  	__u64 observation_op;
>  	/** @param: Pointer to actual stream params */
>  	__u64 param;
>  };
>  
>  /**
> - * enum drm_xe_observation_ioctls - Observation stream fd ioctl's
> + * enum drm_xe_observation_ioctls - Observation stream fd ioctls
>   *
>   * Information exchanged between userspace and kernel for observation fd
> - * ioctl's is stream type specific
> + * ioctls is stream type specific
>   */
>  enum drm_xe_observation_ioctls {
>  	/** @DRM_XE_OBSERVATION_IOCTL_ENABLE: Enable data capture for an observation stream */
>  	DRM_XE_OBSERVATION_IOCTL_ENABLE = _IO('i', 0x0),
>  
> -	/** @DRM_XE_OBSERVATION_IOCTL_DISABLE: Disable data capture for a observation stream */
> +	/** @DRM_XE_OBSERVATION_IOCTL_DISABLE: Disable data capture for an observation stream */
>  	DRM_XE_OBSERVATION_IOCTL_DISABLE = _IO('i', 0x1),
>  
>  	/** @DRM_XE_OBSERVATION_IOCTL_CONFIG: Change observation stream configuration */
> @@ -1812,7 +1833,7 @@ struct drm_xe_oa_unit {
>  	/** @oa_unit_id: OA unit ID */
>  	__u32 oa_unit_id;
>  
> -	/** @oa_unit_type: OA unit type of @drm_xe_oa_unit_type */
> +	/** @oa_unit_type: OA unit type of &enum drm_xe_oa_unit_type */
>  	__u32 oa_unit_type;
>  
>  	/** @capabilities: OA capabilities bit-mask */
> @@ -1875,7 +1896,7 @@ struct drm_xe_query_oa_units {
>  	/** @pad: MBZ */
>  	__u32 pad;
>  	/**
> -	 * @oa_units: struct @drm_xe_oa_unit array returned for this device.
> +	 * @oa_units: &struct drm_xe_oa_unit array returned for this device.
>  	 * Written below as a u64 array to avoid problems with nested flexible
>  	 * arrays with some compilers
>  	 */
> @@ -1902,24 +1923,24 @@ enum drm_xe_oa_format_type {
>  };
>  
>  /**
> - * enum drm_xe_oa_property_id - OA stream property id's
> + * enum drm_xe_oa_property_id - OA stream property IDs
>   *
> - * Stream params are specified as a chain of @drm_xe_ext_set_property
> - * struct's, with @property values from enum @drm_xe_oa_property_id and
> - * @drm_xe_user_extension base.name set to @DRM_XE_OA_EXTENSION_SET_PROPERTY.
> - * @param field in struct @drm_xe_observation_param points to the first
> - * @drm_xe_ext_set_property struct.
> + * Stream params are specified as a chain of &struct drm_xe_ext_set_property
> + * structs, with property values from &enum drm_xe_oa_property_id and
> + * &struct drm_xe_user_extension base.name set to %DRM_XE_OA_EXTENSION_SET_PROPERTY.
> + * The param field in &struct drm_xe_observation_param points to the first
> + * &struct drm_xe_ext_set_property struct.
>   *
>   * Exactly the same mechanism is also used for stream reconfiguration using the
> - * @DRM_XE_OBSERVATION_IOCTL_CONFIG observation stream fd ioctl, though only a
> + * %DRM_XE_OBSERVATION_IOCTL_CONFIG observation stream fd ioctl, though only a
>   * subset of properties below can be specified for stream reconfiguration.
>   */
>  enum drm_xe_oa_property_id {
>  #define DRM_XE_OA_EXTENSION_SET_PROPERTY	0
>  	/**
>  	 * @DRM_XE_OA_PROPERTY_OA_UNIT_ID: ID of the OA unit on which to open
> -	 * the OA stream, see @oa_unit_id in 'struct
> -	 * drm_xe_query_oa_units'. Defaults to 0 if not provided.
> +	 * the OA stream, see oa_unit_id in &struct drm_xe_oa_unit.
> +	 * Defaults to 0 if not provided.
>  	 */
>  	DRM_XE_OA_PROPERTY_OA_UNIT_ID = 1,
>  
> @@ -1932,7 +1953,7 @@ enum drm_xe_oa_property_id {
>  
>  	/**
>  	 * @DRM_XE_OA_PROPERTY_OA_METRIC_SET: OA metrics defining contents of OA
> -	 * reports, previously added via @DRM_XE_OBSERVATION_OP_ADD_CONFIG.
> +	 * reports, previously added via %DRM_XE_OBSERVATION_OP_ADD_CONFIG.
>  	 */
>  	DRM_XE_OA_PROPERTY_OA_METRIC_SET,
>  
> @@ -1940,7 +1961,7 @@ enum drm_xe_oa_property_id {
>  	DRM_XE_OA_PROPERTY_OA_FORMAT,
>  	/*
>  	 * OA_FORMAT's are specified the same way as in PRM/Bspec 52198/60942,
> -	 * in terms of the following quantities: a. enum @drm_xe_oa_format_type
> +	 * in terms of the following quantities: a. &enum drm_xe_oa_format_type
>  	 * b. Counter select c. Counter size and d. BC report. Also refer to the
>  	 * oa_formats array in drivers/gpu/drm/xe/xe_oa.c.
>  	 */
> @@ -1957,19 +1978,19 @@ enum drm_xe_oa_property_id {
>  
>  	/**
>  	 * @DRM_XE_OA_PROPERTY_OA_DISABLED: A value of 1 will open the OA
> -	 * stream in a DISABLED state (see @DRM_XE_OBSERVATION_IOCTL_ENABLE).
> +	 * stream in a DISABLED state (see %DRM_XE_OBSERVATION_IOCTL_ENABLE).
>  	 */
>  	DRM_XE_OA_PROPERTY_OA_DISABLED,
>  
>  	/**
>  	 * @DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID: Open the stream for a specific
> -	 * @exec_queue_id. OA queries can be executed on this exec queue.
> +	 * exec_queue_id. OA queries can be executed on this exec queue.
>  	 */
>  	DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID,
>  
>  	/**
>  	 * @DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE: Optional engine instance to
> -	 * pass along with @DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID or will default to 0.
> +	 * pass along with %DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID or will default to 0.
>  	 */
>  	DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE,
>  
> @@ -1981,16 +2002,16 @@ enum drm_xe_oa_property_id {
>  
>  	/**
>  	 * @DRM_XE_OA_PROPERTY_NUM_SYNCS: Number of syncs in the sync array
> -	 * specified in @DRM_XE_OA_PROPERTY_SYNCS
> +	 * specified in %DRM_XE_OA_PROPERTY_SYNCS
>  	 */
>  	DRM_XE_OA_PROPERTY_NUM_SYNCS,
>  
>  	/**
> -	 * @DRM_XE_OA_PROPERTY_SYNCS: Pointer to struct @drm_xe_sync array
> -	 * with array size specified via @DRM_XE_OA_PROPERTY_NUM_SYNCS. OA
> +	 * @DRM_XE_OA_PROPERTY_SYNCS: Pointer to &struct drm_xe_sync array
> +	 * with array size specified via %DRM_XE_OA_PROPERTY_NUM_SYNCS. OA
>  	 * configuration will wait till input fences signal. Output fences
>  	 * will signal after the new OA configuration takes effect. For
> -	 * @DRM_XE_SYNC_TYPE_USER_FENCE, @addr is a user pointer, similar
> +	 * %DRM_XE_SYNC_TYPE_USER_FENCE, addr is a user pointer, similar
>  	 * to the VM bind case.
>  	 */
>  	DRM_XE_OA_PROPERTY_SYNCS,
> @@ -2013,15 +2034,15 @@ enum drm_xe_oa_property_id {
>  /**
>   * struct drm_xe_oa_config - OA metric configuration
>   *
> - * Multiple OA configs can be added using @DRM_XE_OBSERVATION_OP_ADD_CONFIG. A
> + * Multiple OA configs can be added using %DRM_XE_OBSERVATION_OP_ADD_CONFIG. A
>   * particular config can be specified when opening an OA stream using
> - * @DRM_XE_OA_PROPERTY_OA_METRIC_SET property.
> + * %DRM_XE_OA_PROPERTY_OA_METRIC_SET property.
>   */
>  struct drm_xe_oa_config {
>  	/** @extensions: Pointer to the first extension struct, if any */
>  	__u64 extensions;
>  
> -	/** @uuid: String formatted like "%\08x-%\04x-%\04x-%\04x-%\012x" */
> +	/** @uuid: String formatted like "%08x-%04x-%04x-%04x-%012x" */
>  	char uuid[36];
>  
>  	/** @n_regs: Number of regs in @regs_ptr */
> @@ -2036,7 +2057,7 @@ struct drm_xe_oa_config {
>  
>  /**
>   * struct drm_xe_oa_stream_status - OA stream status returned from
> - * @DRM_XE_OBSERVATION_IOCTL_STATUS observation stream fd ioctl. Userspace can
> + * %DRM_XE_OBSERVATION_IOCTL_STATUS observation stream fd ioctl. Userspace can
>   * call the ioctl to query stream status in response to EIO errno from
>   * observation fd read().
>   */
> @@ -2057,7 +2078,7 @@ struct drm_xe_oa_stream_status {
>  
>  /**
>   * struct drm_xe_oa_stream_info - OA stream info returned from
> - * @DRM_XE_OBSERVATION_IOCTL_INFO observation stream fd ioctl
> + * %DRM_XE_OBSERVATION_IOCTL_INFO observation stream fd ioctl
>   */
>  struct drm_xe_oa_stream_info {
>  	/** @extensions: Pointer to the first extension struct, if any */
> @@ -2094,27 +2115,27 @@ enum drm_xe_pxp_session_type {
>   * enum drm_xe_eu_stall_property_id - EU stall sampling input property ids.
>   *
>   * These properties are passed to the driver at open as a chain of
> - * @drm_xe_ext_set_property structures with @property set to these
> - * properties' enums and @value set to the corresponding values of these
> - * properties. @drm_xe_user_extension base.name should be set to
> - * @DRM_XE_EU_STALL_EXTENSION_SET_PROPERTY.
> + * &struct drm_xe_ext_set_property structures with property set to these
> + * properties' enums and value set to the corresponding values of these
> + * properties. &struct drm_xe_user_extension base.name should be set to
> + * %DRM_XE_EU_STALL_EXTENSION_SET_PROPERTY.
>   *
>   * With the file descriptor obtained from open, user space must enable
> - * the EU stall stream fd with @DRM_XE_OBSERVATION_IOCTL_ENABLE before
> + * the EU stall stream fd with %DRM_XE_OBSERVATION_IOCTL_ENABLE before
>   * calling read(). EIO errno from read() indicates HW dropped data
>   * due to full buffer.
>   */
>  enum drm_xe_eu_stall_property_id {
>  #define DRM_XE_EU_STALL_EXTENSION_SET_PROPERTY		0
>  	/**
> -	 * @DRM_XE_EU_STALL_PROP_GT_ID: @gt_id of the GT on which
> +	 * @DRM_XE_EU_STALL_PROP_GT_ID: gt_id of the GT on which
>  	 * EU stall data will be captured.
>  	 */
>  	DRM_XE_EU_STALL_PROP_GT_ID = 1,
>  
>  	/**
>  	 * @DRM_XE_EU_STALL_PROP_SAMPLE_RATE: Sampling rate in
> -	 * GPU cycles from @sampling_rates in struct @drm_xe_query_eu_stall
> +	 * GPU cycles from sampling_rates in &struct drm_xe_query_eu_stall
>  	 */
>  	DRM_XE_EU_STALL_PROP_SAMPLE_RATE,
>  
> @@ -2129,9 +2150,9 @@ enum drm_xe_eu_stall_property_id {
>  /**
>   * struct drm_xe_query_eu_stall - Information about EU stall sampling.
>   *
> - * If a query is made with a struct @drm_xe_device_query where .query
> - * is equal to @DRM_XE_DEVICE_QUERY_EU_STALL, then the reply uses
> - * struct @drm_xe_query_eu_stall in .data.
> + * If a query is made with a &struct drm_xe_device_query where .query
> + * is equal to %DRM_XE_DEVICE_QUERY_EU_STALL, then the reply uses
> + * &struct drm_xe_query_eu_stall in .data.
>   */
>  struct drm_xe_query_eu_stall {
>  	/** @extensions: Pointer to the first extension struct, if any */
> @@ -2183,7 +2204,7 @@ struct drm_xe_query_eu_stall {
>   *         .start = 0x100000,
>   *         .range = 0x2000,
>   *         .type = DRM_XE_MEM_RANGE_ATTR_ATOMIC,
> - *         .atomic_val = DRM_XE_ATOMIC_DEVICE,
> + *         .atomic.val = DRM_XE_ATOMIC_DEVICE,
>   *    };
>   *
>   *    ioctl(fd, DRM_IOCTL_XE_MADVISE, &madvise);
> @@ -2242,7 +2263,7 @@ struct drm_xe_madvise {
>  
>  			/**
>  			 * @preferred_mem_loc.region_instance : Region instance.
> -			 * MBZ if @devmem_fd <= &DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE.
> +			 * MBZ if @devmem_fd <= %DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE.
>  			 * Otherwise should point to the desired device
>  			 * VRAM instance of the device indicated by
>  			 * @preferred_mem_loc.devmem_fd.
> @@ -2369,24 +2390,19 @@ struct drm_xe_madvise {
>  };
>  
>  /**
> - * struct drm_xe_mem_range_attr - Output of &DRM_IOCTL_XE_VM_QUERY_MEM_RANGES_ATTRS
> + * struct drm_xe_mem_range_attr - Output of &DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS
>   *
>   * This structure is provided by userspace and filled by KMD in response to the
> - * DRM_IOCTL_XE_VM_QUERY_MEM_RANGES_ATTRS ioctl. It describes memory attributes of
> - * a memory ranges within a user specified address range in a VM.
> + * DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS ioctl. It describes memory attributes of
> + * memory ranges within a user specified address range in a VM.
>   *
>   * The structure includes information such as atomic access policy,
>   * page attribute table (PAT) index, and preferred memory location.
>   * Userspace allocates an array of these structures and passes a pointer to the
> - * ioctl to retrieve attributes for each memory ranges
> - *
> - * @extensions: Pointer to the first extension struct, if any
> - * @start: Start address of the memory range
> - * @end: End address of the virtual memory range
> - *
> + * ioctl to retrieve attributes for each memory range.
>   */
>  struct drm_xe_mem_range_attr {
> -	 /** @extensions: Pointer to the first extension struct, if any */
> +	/** @extensions: Pointer to the first extension struct, if any */
>  	__u64 extensions;
>  
>  	/** @start: start of the memory range */
> @@ -2413,7 +2429,7 @@ struct drm_xe_mem_range_attr {
>  		__u32 reserved;
>  	} atomic;
>  
> -	 /** @pat_index: Page attribute table index */
> +	/** @pat_index: Page attribute table index */
>  	struct {
>  		/** @pat_index.val: PAT index */
>  		__u32 val;
> @@ -2427,7 +2443,7 @@ struct drm_xe_mem_range_attr {
>  };
>  
>  /**
> - * struct drm_xe_vm_query_mem_range_attr - Input of &DRM_IOCTL_XE_VM_QUERY_MEM_ATTRIBUTES
> + * struct drm_xe_vm_query_mem_range_attr - Input of &DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS
>   *
>   * This structure is used to query memory attributes of memory regions
>   * within a user specified address range in a VM. It provides detailed
> @@ -2435,15 +2451,15 @@ struct drm_xe_mem_range_attr {
>   * page attribute table (PAT) index, and preferred memory location.
>   *
>   * Userspace first calls the ioctl with @num_mem_ranges = 0,
> - * @sizeof_mem_ranges_attr = 0 and @vector_of_vma_mem_attr = NULL to retrieve
> + * @sizeof_mem_range_attr = 0 and @vector_of_mem_attr = NULL to retrieve
>   * the number of memory regions and size of each memory range attribute.
>   * Then, it allocates a buffer of that size and calls the ioctl again to fill
>   * the buffer with memory range attributes.
>   *
>   * If second call fails with -ENOSPC, it means memory ranges changed between
>   * first call and now, retry IOCTL again with @num_mem_ranges = 0,
> - * @sizeof_mem_ranges_attr = 0 and @vector_of_vma_mem_attr = NULL followed by
> - * Second ioctl call.
> + * @sizeof_mem_range_attr = 0 and @vector_of_mem_attr = NULL followed by
> + * second ioctl call.
>   *
>   * Example:
>   *
> @@ -2537,21 +2553,21 @@ struct drm_xe_exec_queue_set_property {
>   * Refer to Documentation/netlink/specs/drm_ras.yaml for complete interface specification.
>   *
>   * Node Registration
> - * =================
> + * -----------------
>   *
>   * The driver registers DRM RAS nodes for each error severity level.
>   * enum drm_xe_ras_error_severity defines the node-id, while DRM_XE_RAS_ERROR_SEVERITY_NAMES maps
>   * node-id to node-name.
>   *
>   * Error Classification
> - * ====================
> + * --------------------
>   *
>   * Each node contains a list of error counters. Each error is identified by a error-id and
>   * an error-name. enum drm_xe_ras_error_component defines the error-id, while
>   * DRM_XE_RAS_ERROR_COMPONENT_NAMES maps error-id to error-name.
>   *
>   * User Interface
> - * ==============
> + * --------------
>   *
>   * To retrieve error values of a error counter, userspace applications should
>   * follow the below steps:
> @@ -2589,6 +2605,12 @@ enum drm_xe_ras_error_component {
>  	DRM_XE_RAS_ERR_COMP_CORE_COMPUTE = 1,
>  	/** @DRM_XE_RAS_ERR_COMP_SOC_INTERNAL: SoC Internal Error */
>  	DRM_XE_RAS_ERR_COMP_SOC_INTERNAL,
> +	/** @DRM_XE_RAS_ERR_COMP_DEVICE_MEMORY: Device Memory Error */
> +	DRM_XE_RAS_ERR_COMP_DEVICE_MEMORY,
> +	/** @DRM_XE_RAS_ERR_COMP_PCIE: PCIe Subsystem Error */
> +	DRM_XE_RAS_ERR_COMP_PCIE,
> +	/** @DRM_XE_RAS_ERR_COMP_FABRIC: Fabric Subsystem Error */
> +	DRM_XE_RAS_ERR_COMP_FABRIC,
>  	/** @DRM_XE_RAS_ERR_COMP_MAX: Max Error */
>  	DRM_XE_RAS_ERR_COMP_MAX	/* non-ABI */
>  };
> @@ -2606,11 +2628,14 @@ enum drm_xe_ras_error_component {
>   */
>  #define DRM_XE_RAS_ERROR_COMPONENT_NAMES {				\
>  	[DRM_XE_RAS_ERR_COMP_CORE_COMPUTE] = "core-compute",		\
> -	[DRM_XE_RAS_ERR_COMP_SOC_INTERNAL] = "soc-internal"		\
> +	[DRM_XE_RAS_ERR_COMP_SOC_INTERNAL] = "soc-internal",		\
> +	[DRM_XE_RAS_ERR_COMP_DEVICE_MEMORY] = "device-memory",		\
> +	[DRM_XE_RAS_ERR_COMP_PCIE] = "pcie",				\
> +	[DRM_XE_RAS_ERR_COMP_FABRIC] = "fabric",			\
>  }
>  
>  #if defined(__cplusplus)
>  }
>  #endif
>  
> -#endif /* _XE_DRM_H_ */
> +#endif /* _UAPI_XE_DRM_H_ */

Same here, this should not change. All the rest looks good,

Regards,
Kamil

> -- 
> 2.34.1
> 
