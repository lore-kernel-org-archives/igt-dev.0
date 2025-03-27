Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5678C3600B
	for <igt-dev@archiver.kernel.org>; Thu, 27 Mar 2025 16:32:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79F0710E178;
	Thu, 27 Mar 2025 16:32:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j6b2RcFv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02F3810E178
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Mar 2025 16:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743093172; x=1774629172;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6p7LnqLy/kIxwJLUzBT56lgpX95Ck9ZCv+d4Me9U7nA=;
 b=j6b2RcFvjsByn9y5nHRO6b3p1+mnFu6+8LGRiHJe67XHhBSXyJzyjbuE
 FU1NAd82ElNyjUEiaGngCD/sS+Oha/Tntbsc1cQ3bXUFlvNV0jgt+zuSj
 LML7kpsLgWYgmMtvEZBaQp/JcQl3ULhlZA8DPBdJdvBYCFdDQtiZjmFBl
 U1KJXIm0Ti24i3QaBXjMhym5EK/N3Kx0LBsuuo0GoqzLqZmbQ6KwfLk5h
 rtfaUxFn/SVhNqiOGiR5DX+/IE5hkGQoGnXtgLxiZYDICtKaVKOOIgW8A
 zctZ62z/KBMb7fWsXSWQp6Jz5W92ITtP0GWizctxECHabtuQl9FB8blLM Q==;
X-CSE-ConnectionGUID: aKNiDD4GQFSttPge0lCBcQ==
X-CSE-MsgGUID: BKbbOpmHQg2TfjFpo/gRUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="48097334"
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; d="scan'208";a="48097334"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 09:32:52 -0700
X-CSE-ConnectionGUID: uQfO5ygXSCCmlKAHVdYlxg==
X-CSE-MsgGUID: T2vpmAjTThm34Zyeu2QC/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; d="scan'208";a="126119379"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 09:32:50 -0700
Date: Thu, 27 Mar 2025 17:32:33 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
Cc: igt-dev@lists.freedesktop.org, Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
Subject: Re: [PATCH i-g-t] test/amdgpu: add user queue test
Message-ID: <20250327163233.4x3ymh4ao4nf4q5b@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Jesse.zhang@amd.com" <jesse.zhang@amd.com>,
 igt-dev@lists.freedesktop.org,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
References: <20250327071744.412284-1-jesse.zhang@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250327071744.412284-1-jesse.zhang@amd.com>
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

Hi Jesse.zhang,
On 2025-03-27 at 15:17:44 +0800, Jesse.zhang@amd.com wrote:
> From: "Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>"
> 

I have two small nits, first about subject:

[PATCH i-g-t] test/amdgpu: add user queue test

s/test/tests/

so it will be:

[PATCH i-g-t] tests/amdgpu: add user queue test

> This patch introduces a new test for AMDGPU user queues, which provides
> functionality for userspace to manage GPU queues directly. The test covers:
> 
> 1. Basic user queue operations for GFX, COMPUTE and SDMA IP blocks
> 2. Synchronization between user queues using syncobjs
> 3. Timeline-based synchronization
> 4. Multi-threaded signaling and waiting scenarios
> 
> Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
> Signed-off-by: Jesse.zhang <Jesse.zhang@amd.com>
> ---
>  include/drm-uapi/amdgpu_drm.h  |  254 +++++

This is second nit: please make such changes in a separate patch,
please consult README.md for a guide how to do it (a note: you could
also use drm-tip for a changes, just give link to lore.kernel.org
and quote a subject with relevant commit).

>  tests/amdgpu/amd_userq_basic.c | 1706 ++++++++++++++++++++++++++++++++
>  tests/amdgpu/meson.build       |    8 +-
>  3 files changed, 1967 insertions(+), 1 deletion(-)
>  create mode 100644 tests/amdgpu/amd_userq_basic.c
> 
> diff --git a/include/drm-uapi/amdgpu_drm.h b/include/drm-uapi/amdgpu_drm.h
> index efe5de6ce..d83216a59 100644
> --- a/include/drm-uapi/amdgpu_drm.h
> +++ b/include/drm-uapi/amdgpu_drm.h
> @@ -54,6 +54,9 @@ extern "C" {
>  #define DRM_AMDGPU_VM			0x13
>  #define DRM_AMDGPU_FENCE_TO_HANDLE	0x14
>  #define DRM_AMDGPU_SCHED		0x15
> +#define DRM_AMDGPU_USERQ		0x16
> +#define DRM_AMDGPU_USERQ_SIGNAL		0x17
> +#define DRM_AMDGPU_USERQ_WAIT		0x18
>  
>  #define DRM_IOCTL_AMDGPU_GEM_CREATE	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_GEM_CREATE, union drm_amdgpu_gem_create)
>  #define DRM_IOCTL_AMDGPU_GEM_MMAP	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_GEM_MMAP, union drm_amdgpu_gem_mmap)
> @@ -71,6 +74,9 @@ extern "C" {
>  #define DRM_IOCTL_AMDGPU_VM		DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_VM, union drm_amdgpu_vm)
>  #define DRM_IOCTL_AMDGPU_FENCE_TO_HANDLE DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_FENCE_TO_HANDLE, union drm_amdgpu_fence_to_handle)
>  #define DRM_IOCTL_AMDGPU_SCHED		DRM_IOW(DRM_COMMAND_BASE + DRM_AMDGPU_SCHED, union drm_amdgpu_sched)
> +#define DRM_IOCTL_AMDGPU_USERQ		DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_USERQ, union drm_amdgpu_userq)
> +#define DRM_IOCTL_AMDGPU_USERQ_SIGNAL	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_USERQ_SIGNAL, struct drm_amdgpu_userq_signal)
> +#define DRM_IOCTL_AMDGPU_USERQ_WAIT	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_USERQ_WAIT, struct drm_amdgpu_userq_wait)
>  
>  /**
>   * DOC: memory domains
> @@ -319,6 +325,241 @@ union drm_amdgpu_ctx {
>  	union drm_amdgpu_ctx_out out;
>  };
>  
> +/* user queue IOCTL operations */
> +#define AMDGPU_USERQ_OP_CREATE	1
> +#define AMDGPU_USERQ_OP_FREE	2
> +
> +/*
> + * This structure is a container to pass input configuration
> + * info for all supported userqueue related operations.
> + * For operation AMDGPU_USERQ_OP_CREATE: user is expected
> + *  to set all fields, excep the parameter 'queue_id'.
> + * For operation AMDGPU_USERQ_OP_FREE: the only input parameter expected
> + *  to be set is 'queue_id', eveything else is ignored.
> + */
> +struct drm_amdgpu_userq_in {
> +	/** AMDGPU_USERQ_OP_* */
> +	__u32	op;
> +	/** Queue id passed for operation USERQ_OP_FREE */
> +	__u32	queue_id;
> +	/** the target GPU engine to execute workload (AMDGPU_HW_IP_*) */
> +	__u32   ip_type;
> +	/**
> +	 * @doorbell_handle: the handle of doorbell GEM object
> +	 * associated to this userqueue client.
> +	 */
> +	__u32   doorbell_handle;
> +	/**
> +	 * @doorbell_offset: 32-bit offset of the doorbell in the doorbell bo.
> +	 * Kernel will generate absolute doorbell offset using doorbell_handle
> +	 * and doorbell_offset in the doorbell bo.
> +	 */
> +	__u32   doorbell_offset;
> +	__u32   _pad;
> +	/**
> +	 * @queue_va: Virtual address of the GPU memory which holds the queue
> +	 * object. The queue holds the workload packets.
> +	 */
> +	__u64   queue_va;
> +	/**
> +	 * @queue_size: Size of the queue in bytes, this needs to be 256-byte
> +	 * aligned.
> +	 */
> +	__u64   queue_size;
> +	/**
> +	 * @rptr_va : Virtual address of the GPU memory which holds the ring RPTR.
> +	 * This object must be at least 8 byte in size and aligned to 8-byte offset.
> +	 */
> +	__u64   rptr_va;
> +	/**
> +	 * @wptr_va : Virtual address of the GPU memory which holds the ring WPTR.
> +	 * This object must be at least 8 byte in size and aligned to 8-byte offset.
> +	 *
> +	 * Queue, RPTR and WPTR can come from the same object, as long as the size
> +	 * and alignment related requirements are met.
> +	 */
> +	__u64   wptr_va;
> +	/**
> +	 * @mqd: MQD (memory queue descriptor) is a set of parameters which allow
> +	 * the GPU to uniquely define and identify a usermode queue.
> +	 *
> +	 * MQD data can be of different size for different GPU IP/engine and
> +	 * their respective versions/revisions, so this points to a __u64 *
> +	 * which holds IP specific MQD of this usermode queue.
> +	 */
> +	__u64 mqd;
> +	/**
> +	 * @size: size of MQD data in bytes, it must match the MQD structure
> +	 * size of the respective engine/revision defined in UAPI for ex, for
> +	 * gfx11 workloads, size = sizeof(drm_amdgpu_userq_mqd_gfx11).
> +	 */
> +	__u64 mqd_size;
> +};
> +
> +/* The structure to carry output of userqueue ops */
> +struct drm_amdgpu_userq_out {
> +	/**
> +	 * For operation AMDGPU_USERQ_OP_CREATE: This field contains a unique
> +	 * queue ID to represent the newly created userqueue in the system, otherwise
> +	 * it should be ignored.
> +	 */
> +	__u32	queue_id;
> +	__u32	_pad;
> +};
> +
> +union drm_amdgpu_userq {
> +	struct drm_amdgpu_userq_in in;
> +	struct drm_amdgpu_userq_out out;
> +};
> +
> +/* GFX V11 IP specific MQD parameters */
> +struct drm_amdgpu_userq_mqd_gfx11 {
> +	/**
> +	 * @shadow_va: Virtual address of the GPU memory to hold the shadow buffer.
> +	 * Use AMDGPU_INFO_IOCTL to find the exact size of the object.
> +	 */
> +	__u64   shadow_va;
> +	/**
> +	 * @csa_va: Virtual address of the GPU memory to hold the CSA buffer.
> +	 * Use AMDGPU_INFO_IOCTL to find the exact size of the object.
> +	 */
> +	__u64   csa_va;
> +};
> +
> +/* GFX V11 SDMA IP specific MQD parameters */
> +struct drm_amdgpu_userq_mqd_sdma_gfx11 {
> +	/**
> +	 * @csa_va: Virtual address of the GPU memory to hold the CSA buffer.
> +	 * This must be a from a separate GPU object, and use AMDGPU_INFO IOCTL
> +	 * to get the size.
> +	 */
> +	__u64   csa_va;
> +};
> +
> +/* GFX V11 Compute IP specific MQD parameters */
> +struct drm_amdgpu_userq_mqd_compute_gfx11 {
> +	/**
> +	 * @eop_va: Virtual address of the GPU memory to hold the EOP buffer.
> +	 * This must be a from a separate GPU object, and use AMDGPU_INFO IOCTL
> +	 * to get the size.
> +	 */
> +	__u64   eop_va;
> +};
> +
> +/* userq signal/wait ioctl */
> +struct drm_amdgpu_userq_signal {
> +	/**
> +	 * @queue_id: Queue handle used by the userq fence creation function
> +	 * to retrieve the WPTR.
> +	 */
> +	__u32	queue_id;
> +	__u32	pad;
> +	/**
> +	 * @syncobj_handles: The list of syncobj handles submitted by the user queue
> +	 * job to be signaled.
> +	 */
> +	__u64	syncobj_handles;
> +	/**
> +	 * @num_syncobj_handles: A count that represents the number of syncobj handles in
> +	 * @syncobj_handles.
> +	 */
> +	__u64	num_syncobj_handles;
> +	/**
> +	 * @bo_read_handles: The list of BO handles that the submitted user queue job
> +	 * is using for read only. This will update BO fences in the kernel.
> +	 */
> +	__u64	bo_read_handles;
> +	/**
> +	 * @bo_write_handles: The list of BO handles that the submitted user queue job
> +	 * is using for write only. This will update BO fences in the kernel.
> +	 */
> +	__u64	bo_write_handles;
> +	/**
> +	 * @num_bo_read_handles: A count that represents the number of read BO handles in
> +	 * @bo_read_handles.
> +	 */
> +	__u32	num_bo_read_handles;
> +	/**
> +	 * @num_bo_write_handles: A count that represents the number of write BO handles in
> +	 * @bo_write_handles.
> +	 */
> +	__u32	num_bo_write_handles;
> +
> +};
> +
> +struct drm_amdgpu_userq_fence_info {
> +	/**
> +	 * @va: A gpu address allocated for each queue which stores the
> +	 * read pointer (RPTR) value.
> +	 */
> +	__u64	va;
> +	/**
> +	 * @value: A 64 bit value represents the write pointer (WPTR) of the
> +	 * queue commands which compared with the RPTR value to signal the
> +	 * fences.
> +	 */
> +	__u64	value;
> +};
> +
> +struct drm_amdgpu_userq_wait {
> +	/**
> +	 * @syncobj_handles: The list of syncobj handles submitted by the user queue
> +	 * job to get the va/value pairs.
> +	 */
> +	__u64	syncobj_handles;
> +	/**
> +	 * @syncobj_timeline_handles: The list of timeline syncobj handles submitted by
> +	 * the user queue job to get the va/value pairs at given @syncobj_timeline_points.
> +	 */
> +	__u64	syncobj_timeline_handles;
> +	/**
> +	 * @syncobj_timeline_points: The list of timeline syncobj points submitted by the
> +	 * user queue job for the corresponding @syncobj_timeline_handles.
> +	 */
> +	__u64	syncobj_timeline_points;
> +	/**
> +	 * @bo_read_handles: The list of read BO handles submitted by the user queue
> +	 * job to get the va/value pairs.
> +	 */
> +	__u64	bo_read_handles;
> +	/**
> +	 * @bo_write_handles: The list of write BO handles submitted by the user queue
> +	 * job to get the va/value pairs.
> +	 */
> +	__u64	bo_write_handles;
> +	/**
> +	 * @num_syncobj_timeline_handles: A count that represents the number of timeline
> +	 * syncobj handles in @syncobj_timeline_handles.
> +	 */
> +	__u16	num_syncobj_timeline_handles;
> +	/**
> +	 * @num_fences: This field can be used both as input and output. As input it defines
> +	 * the maximum number of fences that can be returned and as output it will specify
> +	 * how many fences were actually returned from the ioctl.
> +	 */
> +	__u16	num_fences;
> +	/**
> +	 * @num_syncobj_handles: A count that represents the number of syncobj handles in
> +	 * @syncobj_handles.
> +	 */
> +	__u32	num_syncobj_handles;
> +	/**
> +	 * @num_bo_read_handles: A count that represents the number of read BO handles in
> +	 * @bo_read_handles.
> +	 */
> +	__u32	num_bo_read_handles;
> +	/**
> +	 * @num_bo_write_handles: A count that represents the number of write BO handles in
> +	 * @bo_write_handles.
> +	 */
> +	__u32	num_bo_write_handles;
> +	/**
> +	 * @out_fences: The field is a return value from the ioctl containing the list of
> +	 * address/value pairs to wait for.
> +	 */
> +	__u64	out_fences;
> +};
> +
>  /* vm ioctl */
>  #define AMDGPU_VM_OP_RESERVE_VMID	1
>  #define AMDGPU_VM_OP_UNRESERVE_VMID	2
> @@ -592,6 +833,19 @@ struct drm_amdgpu_gem_va {
>  	__u64 offset_in_bo;
>  	/** Specify mapping size. Must be correctly aligned. */
>  	__u64 map_size;
> +	/**
> +	 * vm_timeline_point is a sequence number used to add new timeline point.
> +	 */
> +	__u64 vm_timeline_point;
> +	/**
> +	 * The vm page table update fence is installed in given vm_timeline_syncobj_out
> +	 * at vm_timeline_point.
> +	 */
> +	__u32 vm_timeline_syncobj_out;
> +	/** the number of syncobj handles in @input_fence_syncobj_handles */
> +	__u32 num_syncobj_handles;
> +	/** Array of sync object handle to wait for given input fences */
> +	__u64 input_fence_syncobj_handles;
>  };
>  
>  #define AMDGPU_HW_IP_GFX          0
> diff --git a/tests/amdgpu/amd_userq_basic.c b/tests/amdgpu/amd_userq_basic.c
> new file mode 100644
> index 000000000..b010fed7a
> --- /dev/null
> +++ b/tests/amdgpu/amd_userq_basic.c
> @@ -0,0 +1,1706 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright 2014 Advanced Micro Devices, Inc.
> + * Copyright 2022 Advanced Micro Devices, Inc.
> + * Copyright 2023 Advanced Micro Devices, Inc.
> + */

Why three different Copyrights above? Why none of them have 2025 year?
This is new file and a new test so imho this should be:

/*
 * Copyright 2025 Advanced Micro Devices, Inc.
 */

> + #include <pthread.h>
> + #include <time.h>

Add newline here.

Regards,
Kamil

> + #include "lib/amdgpu/amd_memory.h"
> + #include "lib/amdgpu/amd_sdma.h"
> + #include "lib/amdgpu/amd_PM4.h"
> + #include "lib/amdgpu/amd_command_submission.h"
> + #include "lib/amdgpu/amd_compute.h"
> + #include "lib/amdgpu/amd_gfx.h"
> + #include "lib/amdgpu/amd_shaders.h"
> + #include "lib/amdgpu/amd_dispatch.h"
> + #include "include/drm-uapi/amdgpu_drm.h"
> + #include "lib/amdgpu/amd_cs_radv.h"

Sort this alphabetically.


> +
> + #define BUFFER_SIZE (8 * 1024)
> +
> +/* Flag to indicate secure buffer related workload, unused for now */
> + #define AMDGPU_USERQ_MQD_FLAGS_SECURE   (1 << 0)
> +/* Flag to indicate AQL workload, unused for now */
> + #define AMDGPU_USERQ_MQD_FLAGS_AQL      (1 << 1)
> +
> + #define PACKET_TYPE3			3
> + #define PACKET3(op, n)			((PACKET_TYPE3 << 30) |  \
> +					(((op) & 0xFF) << 8)  |  \
> +					((n) & 0x3FFF) << 16)
> +
> + #define PACKET3_NOP			0x10
> + #define PACKET3_PROTECTED_FENCE_SIGNAL	0xd0
> + #define PACKET3_FENCE_WAIT_MULTI	0xd1
> + #define PACKET3_WRITE_DATA		0x37
> +
> + #define PACKET3_WAIT_REG_MEM		0x3C
> + #define WAIT_REG_MEM_FUNCTION(x)	((x) << 0)
> + #define WAIT_REG_MEM_MEM_SPACE(x)	((x) << 4)
> + #define WAIT_REG_MEM_OPERATION(x)	((x) << 6)
> + #define WAIT_REG_MEM_ENGINE(x)		((x) << 8)
> +
> + #define WR_CONFIRM			(1 << 20)
> + #define WRITE_DATA_DST_SEL(x)		((x) << 8)
> + #define WRITE_DATA_ENGINE_SEL(x)	((x) << 30)
> + #define WRITE_DATA_CACHE_POLICY(x)	((x) << 25)
> + #define WAIT_MEM_ENGINE_SEL(x)		((x) << 0)
> + #define WAIT_MEM_WAIT_PREEMPTABLE(x)	((x) << 1)
> + #define WAIT_MEM_CACHE_POLICY(x)	((x) << 2)
> + #define WAIT_MEM_POLL_INTERVAL(x)	((x) << 16)
> +
> + #define DOORBELL_INDEX			4
> + #define AMDGPU_USERQ_BO_WRITE		1
> +
> + #define	PACKET3_RELEASE_MEM				0x49
> + #define		PACKET3_RELEASE_MEM_CACHE_POLICY(x)	((x) << 25)
> + #define		PACKET3_RELEASE_MEM_DATA_SEL(x)		((x) << 29)
> + #define		PACKET3_RELEASE_MEM_INT_SEL(x)		((x) << 24)
> + #define		CACHE_FLUSH_AND_INV_TS_EVENT		0x00000014
> +
> + #define		PACKET3_RELEASE_MEM_EVENT_TYPE(x)	((x) << 0)
> + #define		PACKET3_RELEASE_MEM_EVENT_INDEX(x)	((x) << 8)
> + #define		PACKET3_RELEASE_MEM_GCR_GLM_WB		(1 << 12)
> + #define		PACKET3_RELEASE_MEM_GCR_GLM_INV		(1 << 13)
> + #define		PACKET3_RELEASE_MEM_GCR_GLV_INV		(1 << 14)
> + #define		PACKET3_RELEASE_MEM_GCR_GL1_INV		(1 << 15)
> + #define		PACKET3_RELEASE_MEM_GCR_GL2_US		(1 << 16)
> + #define		PACKET3_RELEASE_MEM_GCR_GL2_RANGE	(1 << 17)
> + #define		PACKET3_RELEASE_MEM_GCR_GL2_DISCARD	(1 << 19)
> + #define		PACKET3_RELEASE_MEM_GCR_GL2_INV		(1 << 20)
> + #define		PACKET3_RELEASE_MEM_GCR_GL2_WB		(1 << 21)
> + #define		PACKET3_RELEASE_MEM_GCR_SEQ		(1 << 22)
> +
> +//SDMA related
> + #define SDMA_OPCODE_COPY		1
> + #define SDMA_OPCODE_WRITE		2
> + #define SDMA_COPY_SUB_OPCODE_LINEAR	0
> + #define SDMA_PACKET(op, sub_op, e)      ((((e) & 0xFFFF) << 16) |       \
> +					(((sub_op) & 0xFF) << 8) |      \
> +					(((op) & 0xFF) << 0))
> + #define upper_32_bits(n) ((uint32_t)(((n) >> 16) >> 16))
> + #define lower_32_bits(n) ((uint32_t)((n) & 0xfffffffc))
> +
> +/* user queue IOCTL */
> + #define AMDGPU_USERQ_OP_CREATE  1
> + #define AMDGPU_USERQ_OP_FREE    2
> +
> +/* Flag to indicate secure buffer related workload, unused for now */
> + #define AMDGPU_USERQ_MQD_FLAGS_SECURE   (1 << 0)
> +/* Flag to indicate AQL workload, unused for now */
> + #define AMDGPU_USERQ_MQD_FLAGS_AQL      (1 << 1)
> +
> +//#define WORKLOAD_COUNT				7
> + #define WORKLOAD_COUNT				1
> + #define DEBUG_USERQUEUE				1
> +
> + #define PAGE_SIZE			4096
> + #define USERMODE_QUEUE_SIZE		(PAGE_SIZE * 256)
> + #define ALIGNMENT			4096
> +
> +struct amdgpu_userq_bo {
> +	amdgpu_bo_handle handle;
> +	amdgpu_va_handle va_handle;
> +	uint64_t mc_addr;
> +	uint64_t size;
> +	void *ptr;
> +};
> +
> +static struct amdgpu_userq_bo shared_userq_bo;
> +static int shared_syncobj_fd1;
> +static int shared_syncobj_fd2;
> +
> +pthread_cond_t cond = PTHREAD_COND_INITIALIZER;
> +pthread_mutex_t lock = PTHREAD_MUTEX_INITIALIZER;
> +
> + #if DEBUG_USERQUEUE
> +static void packet_dump(uint32_t *ptr, int start, int end)
> +{
> +	int i;
> +
> +	igt_info("\n============PACKET==============\n");
> +	for (i = start; i < end; i++)
> +		igt_info("pkt[%d] = 0x%x\n", i - start, ptr[i]);
> +
> +	igt_info("=================================\n");
> +}
> + #endif
> +
> +static void validation(uint32_t *workload)
> +{
> +	int i = 0;
> +
> +	while (workload[0] != 0xdeadbeaf) {
> +		if (i++ > 100)
> +			break;
> +		usleep(100);
> +	}
> +
> +	igt_info("\n========OUTPUT==========\n");
> +	for (i = 0; i < 5; i++)
> +		igt_info("worklod[%d] = %x\n", i, workload[i]);
> +
> +	igt_info("===========================\n");
> +}
> +
> +static void create_relmem_workload(uint32_t *ptr, int *npkt, int data,
> +			    uint64_t *wptr_cpu, uint64_t *doorbell_ptr,
> +			    uint32_t q_id, uint64_t addr)
> +{
> +	ptr[(*npkt)++] = (PACKET3(PACKET3_RELEASE_MEM, 6));
> +	ptr[(*npkt)++] = 0x0030e514;
> +	ptr[(*npkt)++] = 0x23010000;
> +	ptr[(*npkt)++] = lower_32_bits(addr);
> +	ptr[(*npkt)++] = upper_32_bits(addr);
> +	ptr[(*npkt)++] = 0xffffffff & data;
> +	ptr[(*npkt)++] = 0;
> +	ptr[(*npkt)++] = q_id;
> +	*wptr_cpu = *npkt;
> +	doorbell_ptr[DOORBELL_INDEX] = *npkt;
> +}
> +
> +static int create_submit_workload(uint32_t *ptr, int *npkt, uint32_t data,
> +			   uint64_t *wptr_cpu, uint64_t *doorbell_ptr,
> +			   uint32_t q_id, struct amdgpu_userq_bo *dstptr)
> +{
> + #if DEBUG_USERQUEUE
> +	int start = *npkt;
> + #endif
> +	ptr[(*npkt)++] = PACKET3(PACKET3_WRITE_DATA, 7);
> +	ptr[(*npkt)++] =
> +	    WRITE_DATA_DST_SEL(5) | WR_CONFIRM | WRITE_DATA_CACHE_POLICY(3);
> +
> +	ptr[(*npkt)++] = 0xfffffffc & (dstptr->mc_addr);
> +	ptr[(*npkt)++] = (0xffffffff00000000 & (dstptr->mc_addr)) >> 32;
> +	ptr[(*npkt)++] = data;
> +	ptr[(*npkt)++] = data;
> +	ptr[(*npkt)++] = data;
> +	ptr[(*npkt)++] = data;
> +	ptr[(*npkt)++] = data;
> +	create_relmem_workload(ptr, npkt, 0xdeadbeaf, wptr_cpu,
> +			       doorbell_ptr, q_id, dstptr->mc_addr);
> + #if DEBUG_USERQUEUE
> +	packet_dump(ptr, start, *npkt);
> + #endif
> +	return 0;
> +}
> +
> +static void alloc_doorbell(amdgpu_device_handle device_handle, struct amdgpu_userq_bo *doorbell_bo,
> +			   unsigned int size, unsigned int domain)
> +{
> +	struct amdgpu_bo_alloc_request req = {0};
> +	amdgpu_bo_handle buf_handle;
> +	int r;
> +
> +	req.alloc_size = ALIGN(size, PAGE_SIZE);
> +	req.preferred_heap = domain;
> +
> +	r = amdgpu_bo_alloc(device_handle, &req, &buf_handle);
> +	igt_assert_eq(r, 0);
> +
> +	doorbell_bo->handle = buf_handle;
> +	doorbell_bo->size = req.alloc_size;
> +
> +	r = amdgpu_bo_cpu_map(doorbell_bo->handle,
> +			      (void **)&doorbell_bo->ptr);
> +	igt_assert_eq(r, 0);
> +}
> +
> +static int timeline_syncobj_wait(amdgpu_device_handle device_handle, uint32_t timeline_syncobj_handle)
> +{
> +	uint64_t point, signaled_point;
> +	uint64_t timeout;
> +	struct timespec tp;
> +	uint32_t flags = DRM_SYNCOBJ_QUERY_FLAGS_LAST_SUBMITTED;
> +	int r;
> +
> +	do {
> +		r = amdgpu_cs_syncobj_query2(device_handle, &timeline_syncobj_handle,
> +					     (uint64_t *)&point, 1, flags);
> +		if (r)
> +			return r;
> +
> +		timeout = 0;
> +		clock_gettime(CLOCK_MONOTONIC, &tp);
> +		timeout = tp.tv_sec * 1000000000ULL + tp.tv_nsec;
> +		timeout += 100000000; //100 millisec
> +		r = amdgpu_cs_syncobj_timeline_wait(device_handle, &timeline_syncobj_handle,
> +						    (uint64_t *)&point, 1, timeout,
> +						    DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL |
> +						    DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT,
> +						    NULL);
> +		if (r)
> +			return r;
> +
> +		r = amdgpu_cs_syncobj_query(device_handle, &timeline_syncobj_handle, &signaled_point, 1);
> +		if (r)
> +			return r;
> +	} while (point != signaled_point);
> +
> +	return r;
> +}
> +
> +static int
> +amdgpu_bo_unmap_and_free_uq(amdgpu_device_handle dev, amdgpu_bo_handle bo,
> +			    amdgpu_va_handle va_handle, uint64_t mc_addr, uint64_t size,
> +			    uint32_t timeline_syncobj_handle, uint16_t point)
> +{
> +	amdgpu_bo_cpu_unmap(bo);
> +	amdgpu_bo_va_op_raw2(dev, bo, 0, size, mc_addr, 0, AMDGPU_VA_OP_UNMAP, timeline_syncobj_handle, point, 0, 0);
> +
> +	amdgpu_va_range_free(va_handle);
> +	amdgpu_bo_free(bo);
> +
> +	return 0;
> +}
> +
> +static int amdgpu_bo_alloc_and_map_uq(amdgpu_device_handle dev,
> +					      uint64_t size,
> +					      uint64_t alignment,
> +					      uint64_t heap,
> +					      uint64_t alloc_flags,
> +					      uint64_t mapping_flags,
> +					      amdgpu_bo_handle *bo,
> +					      void **cpu,
> +					      uint64_t *mc_address,
> +					      amdgpu_va_handle *va_handle,
> +					      uint32_t timeline_syncobj_handle,
> +					      uint64_t point)
> +{
> +	struct amdgpu_bo_alloc_request request = {};
> +	amdgpu_bo_handle buf_handle;
> +	amdgpu_va_handle handle;
> +	uint64_t vmc_addr;
> +	int r;
> +
> +	request.alloc_size = size;
> +	request.phys_alignment = alignment;
> +	request.preferred_heap = heap;
> +	request.flags = alloc_flags;
> +
> +	r = amdgpu_bo_alloc(dev, &request, &buf_handle);
> +	if (r)
> +		return r;
> +
> +	r = amdgpu_va_range_alloc(dev,
> +				  amdgpu_gpu_va_range_general,
> +				  size, alignment, 0, &vmc_addr,
> +				  &handle, 0);
> +	if (r)
> +		goto error_va_alloc;
> +
> +	r = amdgpu_bo_va_op_raw2(dev, buf_handle, 0,  ALIGN(size, getpagesize()), vmc_addr,
> +				   AMDGPU_VM_PAGE_READABLE |
> +				   AMDGPU_VM_PAGE_WRITEABLE |
> +				   AMDGPU_VM_PAGE_EXECUTABLE |
> +				   mapping_flags,
> +				   AMDGPU_VA_OP_MAP,
> +				   timeline_syncobj_handle,
> +				   point, 0, 0);
> +	if (r) {
> +		goto error_va_map;
> +	}
> +
> +	r = amdgpu_bo_cpu_map(buf_handle, cpu);
> +	if (r)
> +		goto error_cpu_map;
> +
> +	*bo = buf_handle;
> +	*mc_address = vmc_addr;
> +	*va_handle = handle;
> +
> +	return 0;
> +
> + error_cpu_map:
> +	amdgpu_bo_cpu_unmap(buf_handle);
> + error_va_map:
> +	amdgpu_bo_va_op(buf_handle, 0, size, vmc_addr, 0, AMDGPU_VA_OP_UNMAP);
> + error_va_alloc:
> +	amdgpu_bo_free(buf_handle);
> +	return r;
> +}
> +
> +static void free_workload(amdgpu_device_handle device_handle, struct amdgpu_userq_bo *dstptr,
> +		   uint32_t timeline_syncobj_handle, uint64_t point,
> +		   uint64_t syncobj_handles_array, uint32_t num_syncobj_handles)
> +{
> +	int r;
> +
> +	r = amdgpu_bo_unmap_and_free_uq(device_handle, dstptr->handle, dstptr->va_handle,
> +				     dstptr->mc_addr, PAGE_SIZE,
> +				     timeline_syncobj_handle, point);
> +	igt_assert_eq(r, 0);
> +}
> +
> +static int allocate_workload(amdgpu_device_handle device_handle, struct amdgpu_userq_bo *dstptr,
> +		      uint32_t timeline_syncobj_handle, uint64_t point)
> +{
> +
> +	uint64_t gtt_flags = AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED;
> +
> +	int r;
> +
> +	r = amdgpu_bo_alloc_and_map_uq(device_handle, PAGE_SIZE,
> +				       PAGE_SIZE,
> +				       AMDGPU_GEM_DOMAIN_VRAM,
> +				       gtt_flags,
> +				       AMDGPU_VM_MTYPE_UC,
> +				       &dstptr->handle, &dstptr->ptr,
> +				       &dstptr->mc_addr, &dstptr->va_handle,
> +				       timeline_syncobj_handle, point);
> +	memset(&dstptr->ptr, 0x0, sizeof(*dstptr->ptr));
> +	return r;
> +}
> +
> +static int create_sync_objects(int fd, uint32_t *timeline_syncobj_handle,
> +			       uint32_t *timeline_syncobj_handle2)
> +{
> +	int r;
> +
> +	r = drmSyncobjCreate(fd, 0, timeline_syncobj_handle);
> +	if (r)
> +		return r;
> +
> +	r = drmSyncobjCreate(fd, 0, timeline_syncobj_handle2);
> +
> +	return r;
> +}
> +
> +static void *userq_signal(void *data)
> +{
> +	struct  amdgpu_userq_bo queue, shadow, doorbell, wptr_bo, rptr;
> +	uint32_t q_id, syncobj_handle, syncobj_handle1, db_handle;
> +	uint64_t gtt_flags = 0, *doorbell_ptr, *wptr;
> +	struct drm_amdgpu_userq_mqd_gfx11 mqd;
> +	struct  amdgpu_userq_bo gds, csa;
> +	uint32_t syncarray[2];
> +	uint32_t *ptr;
> +	int r, i;
> +	uint32_t timeline_syncobj_handle;
> +	uint64_t point = 0;
> +	uint32_t timeline_syncobj_handle2;
> +	uint64_t point2 = 0;
> +	struct drm_amdgpu_userq_signal signal_data;
> +	uint32_t bo_read_handles[1], bo_write_handles[1];
> +	uint32_t read_handle, write_handle;
> +
> +
> +	amdgpu_device_handle device = (amdgpu_device_handle)data;
> +
> +	int fd = amdgpu_device_get_fd(device);
> +
> +	r = drmSyncobjCreate(fd, 0, &timeline_syncobj_handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = drmSyncobjCreate(fd, 0, &timeline_syncobj_handle2);
> +	igt_assert_eq(r, 0);
> +
> +	amdgpu_bo_alloc_and_map_raw(device, USERMODE_QUEUE_SIZE,
> +				ALIGNMENT,
> +				AMDGPU_GEM_DOMAIN_GTT,
> +				gtt_flags,
> +				AMDGPU_VM_MTYPE_UC,
> +				&queue.handle, &queue.ptr,
> +				&queue.mc_addr, &queue.va_handle);
> +	igt_assert_eq(r, 0);
> +
> +	amdgpu_bo_alloc_and_map_raw(device, PAGE_SIZE,
> +				PAGE_SIZE,
> +				AMDGPU_GEM_DOMAIN_GTT,
> +				gtt_flags,
> +				AMDGPU_VM_MTYPE_UC,
> +				&wptr_bo.handle, &wptr_bo.ptr,
> +				&wptr_bo.mc_addr, &wptr_bo.va_handle);
> +	igt_assert_eq(r, 0);
> +
> +	amdgpu_bo_alloc_and_map_raw(device, PAGE_SIZE,
> +				PAGE_SIZE,
> +				AMDGPU_GEM_DOMAIN_GTT,
> +				gtt_flags,
> +				AMDGPU_VM_MTYPE_UC,
> +				&rptr.handle, &rptr.ptr,
> +				&rptr.mc_addr, &rptr.va_handle);
> +	igt_assert_eq(r, 0);
> +
> +	amdgpu_bo_alloc_and_map_uq(device, PAGE_SIZE * 4, PAGE_SIZE,
> +				AMDGPU_GEM_DOMAIN_GTT,
> +				gtt_flags,
> +				AMDGPU_VM_MTYPE_UC,
> +				&shadow.handle, &shadow.ptr,
> +				&shadow.mc_addr, &shadow.va_handle,
> +				timeline_syncobj_handle, ++point);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_alloc_and_map_uq(device, PAGE_SIZE, PAGE_SIZE,
> +				AMDGPU_GEM_DOMAIN_VRAM,
> +				gtt_flags,
> +				0,
> +				&gds.handle, &gds.ptr,
> +				&gds.mc_addr, &gds.va_handle,
> +				timeline_syncobj_handle, ++point);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_alloc_and_map_uq(device, PAGE_SIZE, PAGE_SIZE,
> +				AMDGPU_GEM_DOMAIN_VRAM,
> +				gtt_flags,
> +				0,
> +				&csa.handle, &csa.ptr,
> +				&csa.mc_addr, &csa.va_handle,
> +				timeline_syncobj_handle, ++point);
> +	igt_assert_eq(r, 0);
> +
> +	r = timeline_syncobj_wait(device, timeline_syncobj_handle);
> +	igt_assert_eq(r, 0);
> +
> +	alloc_doorbell(device, &doorbell, PAGE_SIZE, AMDGPU_GEM_DOMAIN_DOORBELL);
> +
> +	mqd.shadow_va = shadow.mc_addr;
> +	//mqd.gds_va = gds.mc_addr;
> +	mqd.csa_va = csa.mc_addr;
> +
> +	doorbell_ptr = (uint64_t *)doorbell.ptr;
> +
> +	ptr = (uint32_t *)queue.ptr;
> +	memset(ptr, 0, sizeof(*ptr));
> +
> +	wptr = (uint64_t *)wptr_bo.ptr;
> +	memset(wptr, 0, sizeof(*wptr));
> +
> +	//amdgpu_userqueue_get_bo_handle(doorbell.handle, &db_handle);
> +	amdgpu_bo_export(doorbell.handle, amdgpu_bo_handle_type_kms, &db_handle);
> +
> +	/* Create the Usermode Queue */
> +	r = amdgpu_create_userqueue(device, AMDGPU_HW_IP_GFX,
> +				    db_handle, DOORBELL_INDEX,
> +				    queue.mc_addr, USERMODE_QUEUE_SIZE,
> +				    wptr_bo.mc_addr, rptr.mc_addr, &mqd, &q_id);
> +	igt_assert_eq(r, 0);
> +	if (r)
> +		goto err_free_queue;
> +
> +	r = drmSyncobjCreate(fd, 0, &syncobj_handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = drmSyncobjCreate(fd, 0, &syncobj_handle1);
> +	igt_assert_eq(r, 0);
> +
> +	r = drmSyncobjHandleToFD(fd, syncobj_handle, &shared_syncobj_fd2);
> +	igt_assert_eq(r, 0);
> +
> +	r = drmSyncobjHandleToFD(fd, syncobj_handle1, &shared_syncobj_fd1);
> +	igt_assert_eq(r, 0);
> +
> +	syncarray[0] = syncobj_handle;
> +	syncarray[1] = syncobj_handle1;
> +
> +	ptr[0] = PACKET3(PACKET3_WRITE_DATA, 7);
> +	ptr[1] = WRITE_DATA_DST_SEL(5) | WR_CONFIRM | WRITE_DATA_CACHE_POLICY(3);
> +	ptr[2] = 0xfffffffc & (shared_userq_bo.mc_addr);
> +	ptr[3] = (0xffffffff00000000 & (shared_userq_bo.mc_addr)) >> 32;
> +	ptr[4] = 0xdeadbeaf;
> +	ptr[5] = 0xdeadbeaf;
> +	ptr[6] = 0xdeadbeaf;
> +	ptr[7] = 0xdeadbeaf;
> +	ptr[8] = 0xdeadbeaf;
> +
> +	for (i = 9; i <= 60; i++)
> +		ptr[i] = PACKET3(PACKET3_NOP, 0x3fff);
> +
> +	ptr[i++] = PACKET3(PACKET3_PROTECTED_FENCE_SIGNAL, 0);
> +
> +	*wptr = ++i;
> +	r = amdgpu_bo_export(queue.handle, amdgpu_bo_handle_type_kms, &read_handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_export(shadow.handle, amdgpu_bo_handle_type_kms, &write_handle);
> +	igt_assert_eq(r, 0);
> +	// Assign the exported handles to the arrays
> +	bo_read_handles[0] = read_handle;
> +	bo_write_handles[0] = write_handle;
> +
> +	signal_data.queue_id = q_id;
> +	signal_data.syncobj_handles = (uint64_t)&syncarray;
> +	signal_data.num_syncobj_handles = 2;
> +	signal_data.bo_write_handles = (uint64_t)bo_write_handles;
> +	signal_data.num_bo_write_handles = 1;
> +	signal_data.bo_read_handles = (uint64_t)bo_read_handles;
> +	signal_data.num_bo_read_handles = 1;
> +
> +	r = amdgpu_userq_signal(device, &signal_data);
> +	igt_assert_eq(r, 0);
> +
> +	doorbell_ptr[DOORBELL_INDEX]  = i;
> +
> +	/* Free the Usermode Queue */
> +	r = amdgpu_free_userqueue(device, q_id);
> +	igt_assert_eq(r, 0);
> +	if (!r)
> +		pthread_cond_signal(&cond);
> +
> +err_free_queue:
> +	r = amdgpu_bo_unmap_and_free_uq(device, csa.handle,
> +					csa.va_handle,
> +					csa.mc_addr, PAGE_SIZE,
> +					timeline_syncobj_handle2, ++point2);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_unmap_and_free_uq(device, gds.handle,
> +					gds.va_handle,
> +					gds.mc_addr, PAGE_SIZE,
> +					timeline_syncobj_handle2, ++point2);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_unmap_and_free_uq(device, shadow.handle,
> +					shadow.va_handle,
> +					shadow.mc_addr, PAGE_SIZE * 4,
> +					timeline_syncobj_handle2, ++point2);
> +	igt_assert_eq(r, 0);
> +
> +	r = timeline_syncobj_wait(device, timeline_syncobj_handle2);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_cpu_unmap(doorbell.handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_free(doorbell.handle);
> +	igt_assert_eq(r, 0);
> +
> +	amdgpu_bo_unmap_and_free(rptr.handle, rptr.va_handle,
> +				     rptr.mc_addr, PAGE_SIZE);
> +
> +	amdgpu_bo_unmap_and_free(wptr_bo.handle, wptr_bo.va_handle,
> +				     wptr_bo.mc_addr, PAGE_SIZE);
> +
> +	amdgpu_bo_unmap_and_free(queue.handle, queue.va_handle,
> +				     queue.mc_addr, USERMODE_QUEUE_SIZE);
> +
> +	drmSyncobjDestroy(fd, timeline_syncobj_handle);
> +	drmSyncobjDestroy(fd, timeline_syncobj_handle2);
> +
> +	return (void *)(long)r;
> +}
> +
> +static void *userq_wait(void *data)
> +{
> +	struct  amdgpu_userq_bo queue, shadow, doorbell, wptr_bo, rptr;
> +	struct  amdgpu_userq_bo gds, csa;
> +	struct drm_amdgpu_userq_fence_info *fence_info = NULL;
> +	uint32_t syncobj_handle, syncobj_handle1, db_handle;
> +	uint64_t num_fences;
> +	uint64_t gtt_flags = 0, *doorbell_ptr, *wptr;
> +	struct drm_amdgpu_userq_mqd_gfx11 mqd;
> +	uint64_t gpu_addr, reference_val;
> +	uint32_t *ptr;
> +	uint32_t q_id;
> +	int i, r, fd;
> +	uint32_t timeline_syncobj_handle;
> +	uint64_t point = 0;
> +	uint32_t timeline_syncobj_handle2;
> +	uint64_t point2 = 0;
> +	struct drm_amdgpu_userq_wait wait_data;
> +	uint32_t bo_read_handles[1], bo_write_handles[1];
> +	uint32_t read_handle, write_handle;
> +	uint32_t syncarray[3], points[3];
> +	amdgpu_device_handle device;
> +
> +	pthread_mutex_lock(&lock);
> +	pthread_cond_wait(&cond, &lock);
> +	pthread_mutex_unlock(&lock);
> +
> +	device = (amdgpu_device_handle)data;
> +	fd = amdgpu_device_get_fd(device);
> +
> +	r = drmSyncobjCreate(fd, 0, &timeline_syncobj_handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = drmSyncobjCreate(fd, 0, &timeline_syncobj_handle2);
> +	igt_assert_eq(r, 0);
> +
> +	amdgpu_bo_alloc_and_map_raw(device, USERMODE_QUEUE_SIZE,
> +				ALIGNMENT,
> +				AMDGPU_GEM_DOMAIN_GTT,
> +				gtt_flags,
> +				AMDGPU_VM_MTYPE_UC,
> +				&queue.handle, &queue.ptr,
> +				&queue.mc_addr, &queue.va_handle);
> +	igt_assert_eq(r, 0);
> +
> +	amdgpu_bo_alloc_and_map_raw(device, PAGE_SIZE,
> +				PAGE_SIZE,
> +				AMDGPU_GEM_DOMAIN_GTT,
> +				gtt_flags,
> +				AMDGPU_VM_MTYPE_UC,
> +				&wptr_bo.handle, &wptr_bo.ptr,
> +				&wptr_bo.mc_addr, &wptr_bo.va_handle);
> +	igt_assert_eq(r, 0);
> +
> +	amdgpu_bo_alloc_and_map_raw(device, PAGE_SIZE,
> +				PAGE_SIZE,
> +				AMDGPU_GEM_DOMAIN_GTT,
> +				gtt_flags,
> +				AMDGPU_VM_MTYPE_UC,
> +				&rptr.handle, &rptr.ptr,
> +				&rptr.mc_addr, &rptr.va_handle);
> +	igt_assert_eq(r, 0);
> +
> +	amdgpu_bo_alloc_and_map_uq(device, PAGE_SIZE * 4, PAGE_SIZE,
> +				AMDGPU_GEM_DOMAIN_GTT,
> +				gtt_flags,
> +				AMDGPU_VM_MTYPE_UC,
> +				&shadow.handle, &shadow.ptr,
> +				&shadow.mc_addr, &shadow.va_handle,
> +				timeline_syncobj_handle, ++point);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_alloc_and_map_uq(device, PAGE_SIZE, PAGE_SIZE,
> +				AMDGPU_GEM_DOMAIN_VRAM,
> +				gtt_flags,
> +				0,
> +				&gds.handle, &gds.ptr,
> +				&gds.mc_addr, &gds.va_handle,
> +				timeline_syncobj_handle, ++point);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_alloc_and_map_uq(device, PAGE_SIZE, PAGE_SIZE,
> +				AMDGPU_GEM_DOMAIN_VRAM,
> +				gtt_flags,
> +				0,
> +				&csa.handle, &csa.ptr,
> +				&csa.mc_addr, &csa.va_handle,
> +				timeline_syncobj_handle, ++point);
> +	igt_assert_eq(r, 0);
> +
> +	r = timeline_syncobj_wait(device, timeline_syncobj_handle);
> +	igt_assert_eq(r, 0);
> +
> +	alloc_doorbell(device, &doorbell, PAGE_SIZE, AMDGPU_GEM_DOMAIN_DOORBELL);
> +
> +	mqd.shadow_va = shadow.mc_addr;
> +	mqd.csa_va = csa.mc_addr;
> +
> +	doorbell_ptr = (uint64_t *)doorbell.ptr;
> +
> +	ptr = (uint32_t *)queue.ptr;
> +	memset(ptr, 0, sizeof(*ptr));
> +
> +	wptr = (uint64_t *)wptr_bo.ptr;
> +	memset(wptr, 0, sizeof(*wptr));
> +
> +	amdgpu_bo_export(doorbell.handle, amdgpu_bo_handle_type_kms, &db_handle);
> +
> +	/* Create the Usermode Queue */
> +	r = amdgpu_create_userqueue(device, AMDGPU_HW_IP_GFX,
> +				    db_handle, DOORBELL_INDEX,
> +				    queue.mc_addr, USERMODE_QUEUE_SIZE,
> +				    wptr_bo.mc_addr, rptr.mc_addr, &mqd, &q_id);
> +	igt_assert_eq(r, 0);
> +	if (r)
> +		goto err_free_queue;
> +
> +	r = drmSyncobjFDToHandle(fd, shared_syncobj_fd1, &syncobj_handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = drmSyncobjFDToHandle(fd, shared_syncobj_fd2, &syncobj_handle1);
> +	igt_assert_eq(r, 0);
> +
> +	syncarray[0] = syncobj_handle;
> +	syncarray[1] = syncobj_handle1;
> +
> +	points[0] = 0;
> +	points[1] = 0;
> +	num_fences = 0;
> +	 r = amdgpu_bo_export(queue.handle, amdgpu_bo_handle_type_kms, &read_handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_export(shadow.handle, amdgpu_bo_handle_type_kms, &write_handle);
> +	igt_assert_eq(r, 0);
> +
> +	// Assign the exported handles to the arrays
> +	bo_read_handles[0] = read_handle;
> +	bo_write_handles[0] = write_handle;
> +
> +	wait_data.syncobj_handles = (uint64_t)syncarray;
> +	wait_data.num_syncobj_handles = 2;
> +	wait_data.syncobj_timeline_handles = (uint64_t)syncarray;
> +	wait_data.syncobj_timeline_points = (uint64_t)points;
> +	wait_data.num_syncobj_timeline_handles = 2;
> +	wait_data.bo_read_handles =  (uint64_t)bo_read_handles;
> +	wait_data.num_bo_read_handles = 1;
> +	wait_data.bo_write_handles = (uint64_t)bo_write_handles;
> +	wait_data.num_bo_write_handles = 1;
> +	wait_data.out_fences = (uint64_t)fence_info;
> +	wait_data.num_fences = num_fences;
> +
> +	igt_assert_eq(r, 0);
> +
> +	num_fences = wait_data.num_fences;
> +	fence_info = malloc(num_fences * sizeof(struct drm_amdgpu_userq_fence_info));
> +	if (!fence_info)
> +		goto err_free_queue;
> +	memset(fence_info, 0, num_fences * sizeof(struct drm_amdgpu_userq_fence_info));
> +	wait_data.out_fences = (uint64_t)fence_info;
> +	r = amdgpu_userq_wait(device, &wait_data);
> +	igt_assert_eq(r, 0);
> +
> +	for (i = 0; i < num_fences; i++) {
> +		igt_info("num_fences = %lu fence_info.va=0x%llx fence_info.value=%llu\n",
> +			num_fences, (fence_info + i)->va, (fence_info + i)->value);
> +
> +		gpu_addr = (fence_info + i)->va;
> +		reference_val = (fence_info + i)->value;
> +		ptr[0] = PACKET3(PACKET3_FENCE_WAIT_MULTI, 4);
> +		ptr[1] = WAIT_MEM_ENGINE_SEL(1) | WAIT_MEM_WAIT_PREEMPTABLE(0) | WAIT_MEM_CACHE_POLICY(3) | WAIT_MEM_POLL_INTERVAL(2);
> +		ptr[2] = 0xffffffff & (gpu_addr);
> +		ptr[3] = (0xffffffff00000000 & (gpu_addr)) >> 16;
> +		ptr[4] = 0xffffffff & (reference_val);
> +		ptr[5] = (0xffffffff00000000 & (reference_val)) >> 32;
> +		*wptr = 6;
> +		doorbell_ptr[DOORBELL_INDEX]  = 6;
> +	}
> +	/* Free the Usermode Queue */
> +	r = amdgpu_free_userqueue(device, q_id);
> +	igt_assert_eq(r, 0);
> +
> +err_free_queue:
> +	r = amdgpu_bo_unmap_and_free_uq(device, csa.handle,
> +					csa.va_handle,
> +					csa.mc_addr, PAGE_SIZE,
> +					timeline_syncobj_handle2, ++point2);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_unmap_and_free_uq(device, gds.handle,
> +					gds.va_handle,
> +					gds.mc_addr, PAGE_SIZE,
> +					timeline_syncobj_handle2, ++point2);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_unmap_and_free_uq(device, shadow.handle,
> +					shadow.va_handle,
> +					shadow.mc_addr, PAGE_SIZE * 4,
> +					timeline_syncobj_handle2, ++point2);
> +	igt_assert_eq(r, 0);
> +
> +	r = timeline_syncobj_wait(device, timeline_syncobj_handle2);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_cpu_unmap(doorbell.handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_free(doorbell.handle);
> +	igt_assert_eq(r, 0);
> +
> +	amdgpu_bo_unmap_and_free(rptr.handle, rptr.va_handle,
> +				     rptr.mc_addr, PAGE_SIZE);
> +	//igt_assert_eq(r, 0);
> +
> +	amdgpu_bo_unmap_and_free(wptr_bo.handle, wptr_bo.va_handle,
> +				     wptr_bo.mc_addr, PAGE_SIZE);
> +	//igt_assert_eq(r, 0);
> +
> +	amdgpu_bo_unmap_and_free(queue.handle, queue.va_handle,
> +				     queue.mc_addr, USERMODE_QUEUE_SIZE);
> +	//igt_assert_eq(r, 0);
> +
> +	r = drmSyncobjDestroy(fd, syncobj_handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = drmSyncobjDestroy(fd, syncobj_handle1);
> +	igt_assert_eq(r, 0);
> +
> +	r = drmSyncobjDestroy(fd, timeline_syncobj_handle);
> +	igt_assert_eq(r, 0);
> +	r = drmSyncobjDestroy(fd, timeline_syncobj_handle2);
> +	igt_assert_eq(r, 0);
> +	free(fence_info);
> +	return (void *)(long)r;
> +}
> +
> +static void amdgpu_command_submission_umq_synchronize_test(amdgpu_device_handle device,
> +					      bool ce_avails)
> +{
> +	int r;
> +	static pthread_t signal_thread, wait_thread;
> +	uint64_t gtt_flags = 0;
> +	uint16_t point = 0;
> +	uint16_t point2 = 0;
> +	uint32_t timeline_syncobj_handle;
> +	uint32_t timeline_syncobj_handle2;
> +
> +
> +	int fd = amdgpu_device_get_fd(device);
> +
> +	r = drmSyncobjCreate(fd, 0, &timeline_syncobj_handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_alloc_and_map_uq(device, PAGE_SIZE,
> +				       ALIGNMENT,
> +				       AMDGPU_GEM_DOMAIN_GTT,
> +				       gtt_flags,
> +				       AMDGPU_VM_MTYPE_UC,
> +				       &shared_userq_bo.handle, &shared_userq_bo.ptr,
> +				       &shared_userq_bo.mc_addr, &shared_userq_bo.va_handle,
> +				       timeline_syncobj_handle, ++point);
> +	igt_assert_eq(r, 0);
> +
> +	r = timeline_syncobj_wait(device, timeline_syncobj_handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = pthread_create(&signal_thread, NULL, userq_signal, device);
> +	igt_assert_eq(r, 0);
> +
> +	r = pthread_create(&wait_thread, NULL, userq_wait, device);
> +	igt_assert_eq(r, 0);
> +
> +	r = pthread_join(signal_thread, NULL);
> +	igt_assert_eq(r, 0);
> +
> +	r = pthread_join(wait_thread, NULL);
> +	igt_assert_eq(r, 0);
> +
> +	r = drmSyncobjCreate(fd, 0, &timeline_syncobj_handle2);
> +	igt_assert_eq(r, 0);
> +
> +	amdgpu_bo_unmap_and_free_uq(device, shared_userq_bo.handle,
> +				    shared_userq_bo.va_handle,
> +				    shared_userq_bo.mc_addr,
> +				    PAGE_SIZE, timeline_syncobj_handle2,
> +				    ++point2);
> +
> +	r = timeline_syncobj_wait(device, timeline_syncobj_handle2);
> +	igt_assert_eq(r, 0);
> +
> +}
> +
> +static void amdgpu_command_submission_umq_timeline_test(amdgpu_device_handle device,
> +					      bool ce_avails)
> +{
> +	struct  amdgpu_userq_bo queue, shadow, doorbell, wptr, rptr;
> +	struct  amdgpu_userq_bo gds, csa;
> +	struct drm_amdgpu_userq_fence_info *fence_info = NULL;
> +	uint64_t num_fences;
> +	uint64_t gtt_flags = 0, *doorbell_ptr, *wptr_cpu;
> +	struct drm_amdgpu_userq_mqd_gfx11 mqd;
> +	struct  amdgpu_userq_bo dstptrs[WORKLOAD_COUNT];
> +	uint32_t q_id, db_handle, *ptr;
> +	uint32_t timeline_syncobj_handle;
> +	uint64_t point = 0;
> +	uint32_t timeline_syncobj_handle2;
> +	uint64_t point2 = 0;
> +	uint32_t syncarray[3], points[3];
> +	uint32_t test_timeline_syncobj_handle;
> +	uint32_t test_timeline_syncobj_handle2;
> +	uint64_t signal_point, payload;
> +	struct drm_amdgpu_userq_wait wait_data;
> +	int i, r, npkt = 0;
> +	uint32_t bo_read_handles[1], bo_write_handles[1];
> +	uint32_t read_handle, write_handle;
> +	int fd = amdgpu_device_get_fd(device);
> +
> +	r = create_sync_objects(fd, &timeline_syncobj_handle,
> +				&timeline_syncobj_handle2);
> +	igt_assert_eq(r, 0);
> +
> +	r = drmSyncobjCreate(fd, 0, &test_timeline_syncobj_handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = drmSyncobjCreate(fd, 0, &test_timeline_syncobj_handle2);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_alloc_and_map_raw(device, USERMODE_QUEUE_SIZE,
> +					ALIGNMENT,
> +					AMDGPU_GEM_DOMAIN_GTT,
> +					gtt_flags,
> +					AMDGPU_VM_MTYPE_UC,
> +					&queue.handle, &queue.ptr,
> +					&queue.mc_addr, &queue.va_handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_alloc_and_map_raw(device, 8,
> +					ALIGNMENT,
> +					AMDGPU_GEM_DOMAIN_GTT,
> +					gtt_flags,
> +					AMDGPU_VM_MTYPE_UC,
> +					&wptr.handle, &wptr.ptr,
> +					&wptr.mc_addr, &wptr.va_handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_alloc_and_map_raw(device, 8,
> +					ALIGNMENT,
> +					AMDGPU_GEM_DOMAIN_GTT,
> +					gtt_flags,
> +					AMDGPU_VM_MTYPE_UC,
> +					&rptr.handle, &rptr.ptr,
> +					&rptr.mc_addr, &rptr.va_handle);
> +	igt_assert_eq(r, 0);
> +
> +	r =  amdgpu_bo_alloc_and_map_uq(device, PAGE_SIZE * 4, PAGE_SIZE,
> +				AMDGPU_GEM_DOMAIN_GTT,
> +				gtt_flags,
> +				AMDGPU_VM_MTYPE_UC,
> +				&shadow.handle, &shadow.ptr,
> +				&shadow.mc_addr, &shadow.va_handle,
> +				timeline_syncobj_handle, ++point);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_alloc_and_map_uq(device, PAGE_SIZE, PAGE_SIZE,
> +				AMDGPU_GEM_DOMAIN_VRAM,
> +				gtt_flags,
> +				0,
> +				&gds.handle, &gds.ptr,
> +				&gds.mc_addr, &gds.va_handle,
> +				timeline_syncobj_handle, ++point);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_alloc_and_map_uq(device, PAGE_SIZE, PAGE_SIZE,
> +				AMDGPU_GEM_DOMAIN_VRAM,
> +				gtt_flags,
> +				0,
> +				&csa.handle, &csa.ptr,
> +				&csa.mc_addr, &csa.va_handle,
> +				timeline_syncobj_handle, ++point);
> +	igt_assert_eq(r, 0);
> +
> +	r = timeline_syncobj_wait(device, timeline_syncobj_handle);
> +	igt_assert_eq(r, 0);
> +
> +	alloc_doorbell(device, &doorbell, PAGE_SIZE, AMDGPU_GEM_DOMAIN_DOORBELL);
> +
> +	mqd.shadow_va = shadow.mc_addr;
> +	mqd.csa_va = csa.mc_addr;
> +
> +	doorbell_ptr = (uint64_t *) doorbell.ptr;
> +
> +	ptr = (uint32_t *)queue.ptr;
> +	memset(ptr, 0, sizeof(*ptr));
> +
> +	wptr_cpu = (uint64_t *)wptr.ptr;
> +
> +	amdgpu_bo_export(doorbell.handle, amdgpu_bo_handle_type_kms, &db_handle);
> +
> +
> +	/* Create the Usermode Queue */
> +	r = amdgpu_create_userqueue(device, AMDGPU_HW_IP_GFX,
> +				    db_handle, DOORBELL_INDEX,
> +				    queue.mc_addr, USERMODE_QUEUE_SIZE,
> +				    wptr.mc_addr, rptr.mc_addr, &mqd, &q_id);
> +	igt_assert_eq(r, 0);
> +	if (r)
> +		goto err_free_queue;
> +
> +	for (i = 0; i < WORKLOAD_COUNT; i++) {
> +		r = allocate_workload(device, &dstptrs[i], timeline_syncobj_handle, ++point);
> +		igt_assert_eq(r, 0);
> +	}
> +
> +	/* wait */
> +	r = timeline_syncobj_wait(device, timeline_syncobj_handle);
> +	igt_assert_eq(r, 0);
> +
> +	for (i = 0; i < WORKLOAD_COUNT; i++) {
> +		r = create_submit_workload(ptr, &npkt, 0x1111*(i+1),
> +					   wptr_cpu, doorbell_ptr, q_id,
> +					   &dstptrs[i]);
> +		igt_assert_eq(r, 0);
> +	}
> +
> +	for (i = 0; i < WORKLOAD_COUNT; i++)
> +		validation((uint32_t *)dstptrs[i].ptr);
> +	signal_point = 5;
> +	r = amdgpu_cs_syncobj_timeline_signal(device, &test_timeline_syncobj_handle,
> +					      &signal_point, 1);
> +	igt_assert_eq(r, 0);
> +	r = amdgpu_cs_syncobj_query(device, &test_timeline_syncobj_handle,
> +				    &payload, 1);
> +	igt_assert_eq(r, 0);
> +	igt_assert_eq(payload, 5);
> +
> +	for (i = 0; i < WORKLOAD_COUNT; i++) {
> +		r = allocate_workload(device, &dstptrs[i], timeline_syncobj_handle, ++point);
> +		igt_assert_eq(r, 0);
> +	}
> +
> +	/* wait */
> +	r = timeline_syncobj_wait(device, timeline_syncobj_handle);
> +	igt_assert_eq(r, 0);
> +
> +	for (i = 0; i < WORKLOAD_COUNT; i++) {
> +		r = create_submit_workload(ptr, &npkt, 0x1111*(i+1),
> +					   wptr_cpu, doorbell_ptr, q_id,
> +					   &dstptrs[i]);
> +		igt_assert_eq(r, 0);
> +	}
> +
> +	for (i = 0; i < WORKLOAD_COUNT; i++)
> +		validation((uint32_t *)dstptrs[i].ptr);
> +
> +	signal_point = 10;
> +	r = amdgpu_cs_syncobj_timeline_signal(device, &test_timeline_syncobj_handle,
> +					      &signal_point, 1);
> +	igt_assert_eq(r, 0);
> +	r = amdgpu_cs_syncobj_query(device, &test_timeline_syncobj_handle,
> +				    &payload, 1);
> +	igt_assert_eq(r, 0);
> +	igt_assert_eq(payload, 10);
> +
> +	syncarray[0] = test_timeline_syncobj_handle;
> +	syncarray[1] = test_timeline_syncobj_handle;
> +
> +	points[0] = 5;
> +	points[1] = 10;
> +
> +	num_fences = 0;
> +
> +	// Export the buffer object handles
> +	r = amdgpu_bo_export(queue.handle, amdgpu_bo_handle_type_kms, &read_handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_export(shadow.handle, amdgpu_bo_handle_type_kms, &write_handle);
> +	igt_assert_eq(r, 0);
> +
> +	// Assign the exported handles to the arrays
> +	bo_read_handles[0] = read_handle;
> +	bo_write_handles[0] = write_handle;
> +
> +	wait_data.syncobj_handles = (uint64_t)syncarray;
> +	wait_data.num_syncobj_handles = 2;
> +	wait_data.syncobj_timeline_handles = (uint64_t)syncarray;
> +	wait_data.syncobj_timeline_points = (uint64_t)points;
> +	wait_data.num_syncobj_timeline_handles = 2;
> +	wait_data.bo_read_handles =  (uint64_t)bo_read_handles;
> +	wait_data.num_bo_read_handles = 1;
> +	wait_data.bo_write_handles = (uint64_t)bo_write_handles;
> +	wait_data.num_bo_write_handles = 1;
> +	wait_data.out_fences = (uint64_t)fence_info;
> +	wait_data.num_fences = num_fences;
> +	r = amdgpu_userq_wait(device, &wait_data);
> +	igt_assert_eq(r, 0);
> +
> +	fence_info = malloc(num_fences * sizeof(struct drm_amdgpu_userq_fence_info));
> +	r = amdgpu_userq_wait(device, &wait_data);
> +	igt_assert_eq(r, 0);
> +
> +	for (i = 0; i < num_fences; i++)
> +		igt_info("num_fences = %lu fence_info.va=0x%llx fence_info.value=%llu\n",
> +			num_fences, (fence_info + i)->va, (fence_info + i)->value);
> +
> +	/* Free the Usermode Queue */
> +	r = amdgpu_free_userqueue(device, q_id);
> +	igt_assert_eq(r, 0);
> +
> +	/* Free workload*/
> +	for (i = 0; i < WORKLOAD_COUNT; i++)
> +		free_workload(device, &dstptrs[i], timeline_syncobj_handle2, ++point2,
> +			      0, 0);
> +
> +	r = timeline_syncobj_wait(device, timeline_syncobj_handle2);
> +	igt_assert_eq(r, 0);
> +
> +err_free_queue:
> +	r = amdgpu_bo_unmap_and_free_uq(device, csa.handle,
> +					csa.va_handle,
> +					csa.mc_addr, PAGE_SIZE,
> +					timeline_syncobj_handle2, ++point2);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_unmap_and_free_uq(device, gds.handle,
> +					gds.va_handle,
> +					gds.mc_addr, PAGE_SIZE,
> +					timeline_syncobj_handle2, ++point2);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_unmap_and_free_uq(device, shadow.handle,
> +					shadow.va_handle,
> +					shadow.mc_addr, PAGE_SIZE * 4,
> +					timeline_syncobj_handle2, ++point2);
> +	igt_assert_eq(r, 0);
> +
> +	r = timeline_syncobj_wait(device, timeline_syncobj_handle2);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_cpu_unmap(doorbell.handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_free(doorbell.handle);
> +	igt_assert_eq(r, 0);
> +
> +	amdgpu_bo_unmap_and_free(rptr.handle, rptr.va_handle,
> +				     rptr.mc_addr, 8);
> +
> +	amdgpu_bo_unmap_and_free(wptr.handle, wptr.va_handle,
> +				     wptr.mc_addr, 8);
> +
> +	amdgpu_bo_unmap_and_free(queue.handle, queue.va_handle,
> +				     queue.mc_addr, USERMODE_QUEUE_SIZE);
> +
> +	r = drmSyncobjDestroy(fd, timeline_syncobj_handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = drmSyncobjDestroy(fd, timeline_syncobj_handle2);
> +	igt_assert_eq(r, 0);
> +
> +	r = drmSyncobjDestroy(fd, test_timeline_syncobj_handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = drmSyncobjDestroy(fd, test_timeline_syncobj_handle2);
> +	igt_assert_eq(r, 0);
> +}
> +
> +/**
> + * AMDGPU_HW_IP_DMA
> + * @param device
> + */
> +static void amdgpu_command_submission_umq_sdma(amdgpu_device_handle device,
> +					      bool ce_avails)
> +{
> +	int r, i = 0, j = 0;
> +	uint64_t gtt_flags = 0;
> +	uint16_t point = 0;
> +	uint16_t point2 = 0;
> +	uint32_t *ptr, *dstptr;
> +	uint32_t q_id, db_handle;
> +	uint32_t timeline_syncobj_handle;
> +	uint32_t timeline_syncobj_handle2;
> +	uint64_t *doorbell_ptr, *wptr_cpu;
> +	const int sdma_write_length = WORKLOAD_COUNT;
> +	struct drm_amdgpu_userq_mqd_sdma_gfx11 mqd;
> +	struct amdgpu_userq_bo queue, doorbell, rptr, wptr, dst;
> +	int fd = amdgpu_device_get_fd(device);
> +
> +	r = create_sync_objects(fd, &timeline_syncobj_handle,
> +				&timeline_syncobj_handle2);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_alloc_and_map_raw(device, USERMODE_QUEUE_SIZE,
> +					ALIGNMENT,
> +					AMDGPU_GEM_DOMAIN_GTT,
> +					gtt_flags,
> +					AMDGPU_VM_MTYPE_UC,
> +					&queue.handle, &queue.ptr,
> +					&queue.mc_addr, &queue.va_handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_alloc_and_map_raw(device, 8,
> +					ALIGNMENT,
> +					AMDGPU_GEM_DOMAIN_GTT,
> +					gtt_flags,
> +					AMDGPU_VM_MTYPE_UC,
> +					&wptr.handle, &wptr.ptr,
> +					&wptr.mc_addr, &wptr.va_handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_alloc_and_map_raw(device, 8,
> +					ALIGNMENT,
> +					AMDGPU_GEM_DOMAIN_GTT,
> +					gtt_flags,
> +					AMDGPU_VM_MTYPE_UC,
> +					&rptr.handle, &rptr.ptr,
> +					&rptr.mc_addr, &rptr.va_handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_alloc_and_map_uq(device, PAGE_SIZE * 10,
> +				       ALIGNMENT,
> +				       AMDGPU_GEM_DOMAIN_VRAM,
> +				       gtt_flags | AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED,
> +				       AMDGPU_VM_MTYPE_UC,
> +				       &dst.handle, &dst.ptr,
> +				       &dst.mc_addr, &dst.va_handle,
> +				       timeline_syncobj_handle, ++point);
> +	igt_assert_eq(r, 0);
> +
> +	r = timeline_syncobj_wait(device, timeline_syncobj_handle);
> +	igt_assert_eq(r, 0);
> +
> +	alloc_doorbell(device, &doorbell, PAGE_SIZE * 2, AMDGPU_GEM_DOMAIN_DOORBELL);
> +
> +	doorbell_ptr = (uint64_t *) doorbell.ptr;
> +
> +	wptr_cpu = (uint64_t *) wptr.ptr;
> +
> +	ptr = (uint32_t *) queue.ptr;
> +	memset(ptr, 0, sizeof(*ptr));
> +
> +	dstptr = (uint32_t *)dst.ptr;
> +	memset(dstptr, 0, sizeof(*dstptr) * sdma_write_length);
> +
> +	amdgpu_bo_export(doorbell.handle, amdgpu_bo_handle_type_kms, &db_handle);
> +
> +	/* Create the Usermode Queue */
> +	r = amdgpu_create_userqueue(device, AMDGPU_HW_IP_DMA,
> +				    db_handle, DOORBELL_INDEX,
> +				    queue.mc_addr, USERMODE_QUEUE_SIZE,
> +				    wptr.mc_addr, rptr.mc_addr, &mqd, &q_id);
> +	igt_assert_eq(r, 0);
> +	if (r)
> +		goto err_free_queue;
> +
> +	ptr[i++] = SDMA_PACKET(SDMA_OPCODE_WRITE, 0, 0);
> +	ptr[i++] = lower_32_bits(dst.mc_addr);
> +	ptr[i++] = upper_32_bits(dst.mc_addr);
> +	ptr[i++] = sdma_write_length - 1;
> +	while (j++ < sdma_write_length)
> +		ptr[i++] = 0xdeadbeaf;
> +
> +	*wptr_cpu = i << 2;
> +
> +	doorbell_ptr[DOORBELL_INDEX] = i << 2;
> +
> +	i = 0;
> +	while (dstptr[0] != 0xdeadbeaf) {
> +		if (i++ > 100)
> +			break;
> +		usleep(100);
> +	}
> +
> +	for (int k = 0; k < sdma_write_length; k++) {
> +		igt_assert_eq(dstptr[k], 0xdeadbeaf);
> +	}
> +
> +	/* Free the Usermode Queue */
> +	r = amdgpu_free_userqueue(device, q_id);
> +	igt_assert_eq(r, 0);
> +
> +
> + err_free_queue:
> +	r = amdgpu_bo_unmap_and_free_uq(device, dst.handle,
> +					dst.va_handle, dst.mc_addr,
> +					PAGE_SIZE * 10,
> +					timeline_syncobj_handle2, ++point2);
> +	igt_assert_eq(r, 0);
> +
> +	r = timeline_syncobj_wait(device, timeline_syncobj_handle2);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_cpu_unmap(doorbell.handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_free(doorbell.handle);
> +	igt_assert_eq(r, 0);
> +
> +	amdgpu_bo_unmap_and_free(rptr.handle, rptr.va_handle, rptr.mc_addr, 8);
> +
> +	amdgpu_bo_unmap_and_free(wptr.handle, wptr.va_handle, wptr.mc_addr, 8);
> +
> +	amdgpu_bo_unmap_and_free(queue.handle, queue.va_handle,
> +				 queue.mc_addr, USERMODE_QUEUE_SIZE);
> +
> +	drmSyncobjDestroy(fd, timeline_syncobj_handle);
> +	drmSyncobjDestroy(fd, timeline_syncobj_handle2);
> +}
> +
> +/**
> + * AMDGPU_HW_IP_COMPUTE
> + * @param device
> + */
> +static void amdgpu_command_submission_umq_compute(amdgpu_device_handle device,
> +					      bool ce_avails)
> +{
> +	int r, i = 0, npkt = 0;
> +	uint64_t gtt_flags = 0;
> +	uint16_t point = 0;
> +	uint16_t point2 = 0;
> +	uint32_t *ptr;
> +	uint32_t q_id, db_handle;
> +	uint32_t timeline_syncobj_handle;
> +	uint32_t timeline_syncobj_handle2;
> +	uint64_t *doorbell_ptr, *wptr_cpu;
> +	struct amdgpu_userq_bo dstptrs[WORKLOAD_COUNT];
> +	struct drm_amdgpu_userq_mqd_compute_gfx11 mqd;
> +	struct amdgpu_userq_bo queue, doorbell, rptr, wptr, eop;
> +	int fd = amdgpu_device_get_fd(device);
> +
> +
> +	r = create_sync_objects(fd, &timeline_syncobj_handle,
> +				&timeline_syncobj_handle2);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_alloc_and_map_raw(device, USERMODE_QUEUE_SIZE,
> +					ALIGNMENT,
> +					AMDGPU_GEM_DOMAIN_GTT,
> +					gtt_flags,
> +					AMDGPU_VM_MTYPE_UC,
> +					&queue.handle, &queue.ptr,
> +					&queue.mc_addr, &queue.va_handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_alloc_and_map_raw(device, 8,
> +					ALIGNMENT,
> +					AMDGPU_GEM_DOMAIN_GTT,
> +					gtt_flags,
> +					AMDGPU_VM_MTYPE_UC,
> +					&wptr.handle, &wptr.ptr,
> +					&wptr.mc_addr, &wptr.va_handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_alloc_and_map_raw(device, 8,
> +					ALIGNMENT,
> +					AMDGPU_GEM_DOMAIN_GTT,
> +					gtt_flags,
> +					AMDGPU_VM_MTYPE_UC,
> +					&rptr.handle, &rptr.ptr,
> +					&rptr.mc_addr, &rptr.va_handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_alloc_and_map_uq(device, 256,
> +					       PAGE_SIZE, AMDGPU_GEM_DOMAIN_GTT,
> +					       gtt_flags, AMDGPU_VM_MTYPE_UC,
> +					       &eop.handle, &eop.ptr,
> +					       &eop.mc_addr, &eop.va_handle,
> +					       timeline_syncobj_handle,
> +					       ++point);
> +	igt_assert_eq(r, 0);
> +
> +	r = timeline_syncobj_wait(device, timeline_syncobj_handle);
> +	igt_assert_eq(r, 0);
> +
> +	alloc_doorbell(device, &doorbell, PAGE_SIZE, AMDGPU_GEM_DOMAIN_DOORBELL);
> +
> +	mqd.eop_va = eop.mc_addr;
> +
> +	doorbell_ptr = (uint64_t *) doorbell.ptr;
> +
> +	wptr_cpu = (uint64_t *) wptr.ptr;
> +
> +	ptr = (uint32_t *) queue.ptr;
> +	memset(ptr, 0, sizeof(*ptr));
> +
> +	amdgpu_bo_export(doorbell.handle, amdgpu_bo_handle_type_kms, &db_handle);
> +
> +	/* Create the Usermode Queue */
> +	r = amdgpu_create_userqueue(device, AMDGPU_HW_IP_COMPUTE,
> +				    db_handle, DOORBELL_INDEX,
> +				    queue.mc_addr, USERMODE_QUEUE_SIZE,
> +				    wptr.mc_addr, rptr.mc_addr, &mqd, &q_id);
> +	igt_assert_eq(r, 0);
> +	if (r)
> +		goto err_free_queue;
> +
> +	/* allocate workload */
> +	for (i = 0; i < WORKLOAD_COUNT; i++) {
> +		r = allocate_workload(device, &dstptrs[i], timeline_syncobj_handle,
> +				      ++point);
> +		igt_assert_eq(r, 0);
> +	}
> +
> +	/* wait */
> +	r = timeline_syncobj_wait(device, timeline_syncobj_handle);
> +	igt_assert_eq(r, 0);
> +
> +	/* create workload pkt */
> +	for (i = 0; i < WORKLOAD_COUNT; i++) {
> +		r = create_submit_workload(ptr, &npkt, 0x1111 * (i + 1),
> +					   wptr_cpu, doorbell_ptr, q_id,
> +					   &dstptrs[i]);
> +		igt_assert_eq(r, 0);
> +	}
> +
> +	/* validation 0f workload pkt */
> +	for (i = 0; i < WORKLOAD_COUNT; i++)
> +		validation((uint32_t *) dstptrs[i].ptr);
> +
> +	/* Free the Usermode Queue */
> +	r = amdgpu_free_userqueue(device, q_id);
> +	igt_assert_eq(r, 0);
> +
> +	/* Free workload */
> +	for (i = 0; i < WORKLOAD_COUNT; i++)
> +		free_workload(device, &dstptrs[i], timeline_syncobj_handle2, ++point2,
> +			      0, 0);
> +
> +	r = timeline_syncobj_wait(device, timeline_syncobj_handle2);
> +	igt_assert_eq(r, 0);
> +
> +
> + err_free_queue:
> +	r = amdgpu_bo_unmap_and_free_uq(device, eop.handle,
> +					     eop.va_handle, eop.mc_addr,
> +					     256,
> +					     timeline_syncobj_handle2, ++point2);
> +	igt_assert_eq(r, 0);
> +
> +	r = timeline_syncobj_wait(device, timeline_syncobj_handle2);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_cpu_unmap(doorbell.handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_free(doorbell.handle);
> +	igt_assert_eq(r, 0);
> +
> +	amdgpu_bo_unmap_and_free(rptr.handle, rptr.va_handle, rptr.mc_addr, 8);
> +
> +	amdgpu_bo_unmap_and_free(wptr.handle, wptr.va_handle, wptr.mc_addr, 8);
> +
> +	amdgpu_bo_unmap_and_free(queue.handle, queue.va_handle,
> +				 queue.mc_addr, USERMODE_QUEUE_SIZE);
> +
> +	drmSyncobjDestroy(fd, timeline_syncobj_handle);
> +	drmSyncobjDestroy(fd, timeline_syncobj_handle2);
> +}
> +
> +/**
> + * AMDGPU_HW_IP_GFX
> + * @param device
> + */
> +static void amdgpu_command_submission_umq_gfx(amdgpu_device_handle device,
> +					      bool ce_avails)
> +{
> +	int r, i = 0, npkt = 0;
> +	uint64_t gtt_flags = 0;
> +	uint16_t point = 0;
> +	uint16_t point2 = 0;
> +	uint32_t *ptr;
> +	uint32_t q_id, db_handle;
> +	uint32_t timeline_syncobj_handle;
> +	uint32_t timeline_syncobj_handle2;
> +	uint64_t *doorbell_ptr, *wptr_cpu;
> +	struct amdgpu_userq_bo dstptrs[WORKLOAD_COUNT];
> +	struct drm_amdgpu_userq_mqd_gfx11 mqd;
> +	struct amdgpu_userq_bo queue, shadow, doorbell, rptr, wptr, gds, csa;
> +	int fd = amdgpu_device_get_fd(device);
> +
> +	r = create_sync_objects(fd, &timeline_syncobj_handle,
> +				&timeline_syncobj_handle2);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_alloc_and_map_raw(device, USERMODE_QUEUE_SIZE,
> +					ALIGNMENT,
> +					AMDGPU_GEM_DOMAIN_GTT,
> +					gtt_flags,
> +					AMDGPU_VM_MTYPE_UC,
> +					&queue.handle, &queue.ptr,
> +					&queue.mc_addr, &queue.va_handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_alloc_and_map_raw(device, 8,
> +					ALIGNMENT,
> +					AMDGPU_GEM_DOMAIN_GTT,
> +					gtt_flags,
> +					AMDGPU_VM_MTYPE_UC,
> +					&wptr.handle, &wptr.ptr,
> +					&wptr.mc_addr, &wptr.va_handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_alloc_and_map_raw(device, 8,
> +					ALIGNMENT,
> +					AMDGPU_GEM_DOMAIN_GTT,
> +					gtt_flags,
> +					AMDGPU_VM_MTYPE_UC,
> +					&rptr.handle, &rptr.ptr,
> +					&rptr.mc_addr, &rptr.va_handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_alloc_and_map_uq(device, PAGE_SIZE * 18,
> +					       PAGE_SIZE, AMDGPU_GEM_DOMAIN_GTT,
> +					       gtt_flags, AMDGPU_VM_MTYPE_UC,
> +					       &shadow.handle, &shadow.ptr,
> +					       &shadow.mc_addr,
> +					       &shadow.va_handle,
> +					       timeline_syncobj_handle,
> +					       ++point);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_alloc_and_map_uq(device, PAGE_SIZE * 4,
> +					       PAGE_SIZE, AMDGPU_GEM_DOMAIN_GTT,
> +					       gtt_flags, AMDGPU_VM_MTYPE_UC,
> +					       &gds.handle, &gds.ptr,
> +					       &gds.mc_addr, &gds.va_handle,
> +					       timeline_syncobj_handle,
> +					       ++point);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_alloc_and_map_uq(device, PAGE_SIZE * 20,
> +					       PAGE_SIZE, AMDGPU_GEM_DOMAIN_GTT,
> +					       gtt_flags, AMDGPU_VM_MTYPE_UC,
> +					       &csa.handle, &csa.ptr,
> +					       &csa.mc_addr, &csa.va_handle,
> +					       timeline_syncobj_handle,
> +					       ++point);
> +	igt_assert_eq(r, 0);
> +
> +	r = timeline_syncobj_wait(device, timeline_syncobj_handle);
> +	igt_assert_eq(r, 0);
> +
> +	alloc_doorbell(device, &doorbell, PAGE_SIZE, AMDGPU_GEM_DOMAIN_DOORBELL);
> +
> +	mqd.shadow_va = shadow.mc_addr;
> +	mqd.csa_va = csa.mc_addr;
> +
> +	doorbell_ptr = (uint64_t *) doorbell.ptr;
> +
> +	wptr_cpu = (uint64_t *) wptr.ptr;
> +
> +	ptr = (uint32_t *) queue.ptr;
> +	memset(ptr, 0, sizeof(*ptr));
> +
> +	amdgpu_bo_export(doorbell.handle, amdgpu_bo_handle_type_kms, &db_handle);
> +
> +
> +	/* Create the Usermode Queue */
> +	r = amdgpu_create_userqueue(device, AMDGPU_HW_IP_GFX,
> +				    db_handle, DOORBELL_INDEX,
> +				    queue.mc_addr, USERMODE_QUEUE_SIZE,
> +				    wptr.mc_addr, rptr.mc_addr, &mqd, &q_id);
> +	igt_assert_eq(r, 0);
> +	if (r)
> +		goto err_free_queue;
> +
> +	/* allocate workload */
> +	for (i = 0; i < WORKLOAD_COUNT; i++) {
> +		r = allocate_workload(device, &dstptrs[i], timeline_syncobj_handle,
> +				      ++point);
> +		igt_assert_eq(r, 0);
> +	}
> +
> +	/* wait */
> +	r = timeline_syncobj_wait(device, timeline_syncobj_handle);
> +	igt_assert_eq(r, 0);
> +
> +	/* create workload pkt */
> +	for (i = 0; i < WORKLOAD_COUNT; i++) {
> +		r = create_submit_workload(ptr, &npkt, 0x1111 * (i + 1),
> +					   wptr_cpu, doorbell_ptr, q_id,
> +					   &dstptrs[i]);
> +		igt_assert_eq(r, 0);
> +	}
> +
> +	/* validation 0f workload pkt */
> +	for (i = 0; i < WORKLOAD_COUNT; i++)
> +		validation((uint32_t *) dstptrs[i].ptr);
> +
> +	/* Free the Usermode Queue */
> +	r = amdgpu_free_userqueue(device, q_id);
> +	igt_assert_eq(r, 0);
> +
> +	/* Free workload */
> +	for (i = 0; i < WORKLOAD_COUNT; i++)
> +		free_workload(device, &dstptrs[i], timeline_syncobj_handle2, ++point2,
> +			      0, 0);
> +
> +	r = timeline_syncobj_wait(device, timeline_syncobj_handle2);
> +	igt_assert_eq(r, 0);
> +
> +
> + err_free_queue:
> +	r = amdgpu_bo_unmap_and_free_uq(device, csa.handle,
> +					     csa.va_handle, csa.mc_addr,
> +					     PAGE_SIZE,
> +					     timeline_syncobj_handle2, ++point2);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_unmap_and_free_uq(device, gds.handle,
> +					     gds.va_handle, gds.mc_addr, PAGE_SIZE,
> +					     timeline_syncobj_handle2, ++point2);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_unmap_and_free_uq(device, shadow.handle,
> +					     shadow.va_handle, shadow.mc_addr,
> +					     PAGE_SIZE * 4,
> +					     timeline_syncobj_handle2, ++point2);
> +	igt_assert_eq(r, 0);
> +
> +	r = timeline_syncobj_wait(device, timeline_syncobj_handle2);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_cpu_unmap(doorbell.handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_free(doorbell.handle);
> +	igt_assert_eq(r, 0);
> +
> +	amdgpu_bo_unmap_and_free(rptr.handle, rptr.va_handle, rptr.mc_addr, 8);
> +
> +	amdgpu_bo_unmap_and_free(wptr.handle, wptr.va_handle, wptr.mc_addr, 8);
> +
> +	amdgpu_bo_unmap_and_free(queue.handle, queue.va_handle,
> +				 queue.mc_addr, USERMODE_QUEUE_SIZE);
> +
> +	drmSyncobjDestroy(fd, timeline_syncobj_handle);
> +	drmSyncobjDestroy(fd, timeline_syncobj_handle2);
> +}
> +
> +igt_main
> +{
> +	amdgpu_device_handle device;
> +	struct amdgpu_gpu_info gpu_info = {0};
> +	struct drm_amdgpu_info_hw_ip info = {0};
> +	int fd = -1;
> +	int r;
> +	bool arr_cap[AMD_IP_MAX] = {0};
> +
> +	igt_fixture {
> +		uint32_t major, minor;
> +		int err;
> +
> +		fd = drm_open_driver(DRIVER_AMDGPU);
> +
> +		err = amdgpu_device_initialize(fd, &major, &minor, &device);
> +		igt_require(err == 0);
> +		r = amdgpu_query_gpu_info(device, &gpu_info);
> +		igt_assert_eq(r, 0);
> +		r = amdgpu_query_hw_ip_info(device, AMDGPU_HW_IP_GFX, 0, &info);
> +		igt_assert_eq(r, 0);
> +		r = setup_amdgpu_ip_blocks(major, minor,  &gpu_info, device);
> +		igt_assert_eq(r, 0);
> +		asic_rings_readness(device, 1, arr_cap);
> +	}
> +
> +	igt_describe("Check-GFX-UMQ-for-every-available-ring-works-for-write-const-fill-and-copy-operation-using-more-than-one-IB-and-shared-IB");
> +	igt_subtest_with_dynamic("umq-gfx-with-IP-GFX") {
> +		if (arr_cap[AMD_IP_GFX]) {
> +			igt_dynamic_f("umq-gfx")
> +			    amdgpu_command_submission_umq_gfx(device,
> +							      info.
> +							      hw_ip_version_major
> +							      < 11);
> +		}
> +	}
> +
> +	igt_describe("Check-COMPUTE-UMQ-for-every-available-ring-works-for-write-const-fill-and-copy-operation-using-more-than-one-IB-and-shared-IB");
> +	igt_subtest_with_dynamic("umq-gfx-with-IP-COMPUTE") {
> +		if (arr_cap[AMD_IP_COMPUTE]) {
> +			igt_dynamic_f("umq-compute")
> +			    amdgpu_command_submission_umq_compute(device,
> +							      info.
> +							      hw_ip_version_major
> +							      < 11);
> +		}
> +	}
> +
> +	igt_describe("Check-SDMA-UMQ-for-every-available-ring-works-for-write-const-fill-and-copy-operation-using-more-than-one-IB-and-shared-IB");
> +	igt_subtest_with_dynamic("umq-gfx-with-IP-SDMA") {
> +		if (arr_cap[AMD_IP_DMA]) {
> +			igt_dynamic_f("umq-sdma")
> +			    amdgpu_command_submission_umq_sdma(device,
> +							      info.
> +							      hw_ip_version_major
> +							      < 11);
> +		}
> +	}
> +
> +	igt_describe("Check-amdgpu_command_submission_umq_timeline_test");
> +	igt_subtest_with_dynamic("umq-Syncobj-timeline") {
> +		if (arr_cap[AMD_IP_DMA]) {
> +			igt_dynamic_f("umq_timeline")
> +			    amdgpu_command_submission_umq_timeline_test(device,
> +							      info.
> +							      hw_ip_version_major
> +							      < 11);
> +		}
> +	}
> +
> +	igt_describe("Check-amdgpu_command_submission_umq_synchronize_test");
> +	igt_subtest_with_dynamic("umq-Synchronize") {
> +		if (arr_cap[AMD_IP_DMA]) {
> +			igt_dynamic_f("umq_synchronize")
> +			    amdgpu_command_submission_umq_synchronize_test(device,
> +							      info.
> +							      hw_ip_version_major
> +							      < 11);
> +		}
> +	}
> +
> +	igt_fixture {
> +		amdgpu_device_deinitialize(device);
> +		drm_close_driver(fd);
> +	}
> +}
> diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
> index 7d40f788b..a15a3884c 100644
> --- a/tests/amdgpu/meson.build
> +++ b/tests/amdgpu/meson.build
> @@ -63,7 +63,13 @@ if libdrm_amdgpu.found()
>  	else
>  		warning('libdrm <= 2.4.104 found, amd_queue_reset test not applicable')
>  	endif
> -	amdgpu_deps += libdrm_amdgpu
> +	 # Check for amdgpu_create_userqueue function
> +        if cc.has_function('amdgpu_create_userqueue', dependencies: libdrm_amdgpu)
> +                amdgpu_progs += [ 'amd_userq_basic' ]
> +        else
> +                warning('amdgpu_create_userqueue not found in libdrm_amdgpu, skipping amd userq test')
> +        endif
> +        amdgpu_deps += libdrm_amdgpu
>  endif
>  
>  foreach prog : amdgpu_progs
> -- 
> 2.25.1
> 
