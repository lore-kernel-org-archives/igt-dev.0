Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 289DCC98302
	for <igt-dev@archiver.kernel.org>; Tue, 22 Sep 2026 16:55:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9572310E6E9;
	Tue, 22 Sep 2026 16:55:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fl4619Pw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA5E110E6E9
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Sep 2026 16:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790096108; x=1821632108;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Ry4HVSf0r22bUSU9c4WBYxExOmRuTcpXNqhp9cdi9mg=;
 b=Fl4619PwCB8XZpKpbMHCWJIgRktDQWC1TLssb9gRmzLtPjp2zZWR1boh
 M6RaPN13lGTPPdWVbQmjTj5wuihR6ZbtOSnEoV2nXUYOi8KM3/zzAqvxz
 7aCM/hQ6h/9Sgzrr6QIccvLFQwXLmIrsa/DFaCr2mHj9nQcVhtGDoFuVa
 vR/YFC1VPQsBg94WLVkT4YwYLSTziBQYDoGtys7HLSCndGJ9fXXTzrPJU
 mw90rk9upnbSzZq5fd87c8LxbNoAQhI3Z891w4LQENhT7zgmdD9R7KxsT
 GKrR5l1f6Q0+dzH0GfU3M6AcQt9HPGvZlcxElD3CXr2CFQRMKnLBAGEtc g==;
X-CSE-ConnectionGUID: xiT/anWtQcC1Fib8hqSFiQ==
X-CSE-MsgGUID: wgv8/Tq4SmytOMK9G/z+ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="94547144"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="94547144"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 09:55:07 -0700
X-CSE-ConnectionGUID: lyM1CcS1RYWMhUqBBakwQg==
X-CSE-MsgGUID: CUq9jPSAQdah888OtjGkZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="4501061"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 09:55:06 -0700
Date: Tue, 22 Sep 2026 18:55:03 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Robert Mazur <robert.mazur@imgtec.com>
Cc: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>, 
 Alessio Belle <alessio.belle@imgtec.com>,
 Brajesh Gupta <brajesh.gupta@imgtec.com>,
 Luigi Santivetti <luigi.santivetti@imgtec.com>,
 Donald Robson <donald.robson@imgtec.com>
Subject: Re: [PATCH i-g-t v2 3/3] tests/imagination: Add SUBMIT_JOBS tests
Message-ID: <20260922165503.qgwcnaqmrcvxpr2j@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Robert Mazur <robert.mazur@imgtec.com>,
 Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>,
 Alessio Belle <alessio.belle@imgtec.com>,
 Brajesh Gupta <brajesh.gupta@imgtec.com>,
 Luigi Santivetti <luigi.santivetti@imgtec.com>,
 Donald Robson <donald.robson@imgtec.com>
References: <20260922-b4-imagination-submit-test-v2-0-974e93be5de7@imgtec.com>
 <20260922-b4-imagination-submit-test-v2-3-974e93be5de7@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260922-b4-imagination-submit-test-v2-3-974e93be5de7@imgtec.com>
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

Hi Robert,
On 2026-09-22 at 11:43:27 +0200, Robert Mazur wrote:
> From: Donald Robson <donald.robson@imgtec.com>
> 
> Add tests covering the SUBMIT_JOBS UAPI.
> The tests exercise common submission paths and validate ioctl
> parameter handling.
> 
> Signed-off-by: Donald Robson <donald.robson@imgtec.com>
> Signed-off-by: Robert Mazur <robert.mazur@imgtec.com>
> ---
>  lib/igt_pvr.c                       | 232 +++++++++++++
>  lib/igt_pvr.h                       |  20 ++
>  tests/imagination/meson.build       |   1 +
>  tests/imagination/pvr_submit_jobs.c | 655 ++++++++++++++++++++++++++++++++++++
>  4 files changed, 908 insertions(+)
> 
> diff --git a/lib/igt_pvr.c b/lib/igt_pvr.c
> index f3190fa29..0bda29df5 100644
> --- a/lib/igt_pvr.c
> +++ b/lib/igt_pvr.c
> @@ -295,6 +295,146 @@ void igt_pvr_ioctl_vm_unmap(int fd, uint32_t vm_ctx_handle,
>  	do_ioctl(fd, DRM_IOCTL_PVR_VM_UNMAP, &arg);
>  }
>  
> +/**
> + * init_compute_context_state_stream:
> + * @stream: Pointer to the memory where the context state stream will be initialized.
> + *
> + * Function to initialize the compute context state stream.
> + *
> + * Returns: The length of the initialized stream.
> + */
> +static uint32_t init_compute_context_state_stream(uint8_t *stream)
> +{
> +	uint8_t *stream_start = stream;
> +	uint32_t stream_len;
> +
> +	STREAM_ADD_ITEM(true, uint32_t, 0, stream); // length
> +	STREAM_ADD_ITEM(true, uint32_t, 0, stream);
> +	STREAM_ADD_ITEM(true, uint64_t, 0, stream); // cdmreg_cdm_context_pds0
> +	STREAM_ADD_ITEM(true, uint64_t, 0, stream); // cdmreg_cdm_context_pds1
> +	STREAM_ADD_ITEM(true, uint64_t, 0, stream); // cdmreg_cdm_terminate_pds
> +	STREAM_ADD_ITEM(true, uint64_t, 0, stream); // cdmreg_cdm_terminate_pds1
> +	STREAM_ADD_ITEM(true, uint64_t, 0, stream); // cdmreg_cdm_resume_pds0
> +	STREAM_ADD_ITEM(true, uint64_t, 0, stream); // cdmreg_cdm_context_pds0_b
> +	STREAM_ADD_ITEM(true, uint64_t, 0, stream); // cdmreg_cdm_resume_pds0_b
> +
> +	stream_len = stream - stream_start;
> +	STREAM_ADD_ITEM(true, uint32_t, stream_len, stream_start); // update length
> +
> +	return stream_len;
> +}
> +
> +/**
> + * init_render_context_state_stream:
> + * @stream: Pointer to the memory where the context state stream will be initialized.
> + *
> + * Function to initialize the render context state stream.
> + *
> + * Returns: The length of the initialized stream.
> + */
> +static uint32_t init_render_context_state_stream(uint8_t *stream)
> +{
> +	uint8_t *stream_start = stream;
> +	uint32_t stream_len;
> +
> +	STREAM_ADD_ITEM(true, uint32_t, 0, stream); // length
> +	STREAM_ADD_ITEM(true, uint32_t, 0, stream);
> +	STREAM_ADD_ITEM(true, uint64_t, 0, stream); // geom_reg_vdm_context_state_base_addr
> +	STREAM_ADD_ITEM(true, uint64_t, 0, stream); // geom_reg_vdm_context_state_resume_addr
> +	STREAM_ADD_ITEM(true, uint64_t, 0, stream); // geom_reg_ta_context_state_base_addr
> +	STREAM_ADD_ITEM(true, uint64_t, 0, stream); // state[0].geom_reg_vdm_context_store_task0
> +	STREAM_ADD_ITEM(true, uint64_t, 0, stream); // state[0].geom_reg_vdm_context_store_task1
> +	STREAM_ADD_ITEM(true, uint64_t, 0, stream); // state[0].geom_reg_vdm_context_store_task2
> +	STREAM_ADD_ITEM(true, uint64_t, 0, stream); // state[0].geom_reg_vdm_context_store_task3
> +	STREAM_ADD_ITEM(true, uint64_t, 0, stream); // state[0].geom_reg_vdm_context_store_task4
> +	STREAM_ADD_ITEM(true, uint64_t, 0, stream); // state[0].geom_reg_vdm_context_resume_task0
> +	STREAM_ADD_ITEM(true, uint64_t, 0, stream); // state[0].geom_reg_vdm_context_resume_task1
> +	STREAM_ADD_ITEM(true, uint64_t, 0, stream); // state[0].geom_reg_vdm_context_resume_task2
> +	STREAM_ADD_ITEM(true, uint64_t, 0, stream); // state[0].geom_reg_vdm_context_resume_task3
> +	STREAM_ADD_ITEM(true, uint64_t, 0, stream); // state[0].geom_reg_vdm_context_resume_task4
> +	STREAM_ADD_ITEM(true, uint64_t, 0, stream); // state[1].geom_reg_vdm_context_store_task0
> +	STREAM_ADD_ITEM(true, uint64_t, 0, stream); // state[1].geom_reg_vdm_context_store_task1
> +	STREAM_ADD_ITEM(true, uint64_t, 0, stream); // state[1].geom_reg_vdm_context_store_task2
> +	STREAM_ADD_ITEM(true, uint64_t, 0, stream); // state[1].geom_reg_vdm_context_store_task3
> +	STREAM_ADD_ITEM(true, uint64_t, 0, stream); // state[1].geom_reg_vdm_context_store_task4
> +	STREAM_ADD_ITEM(true, uint64_t, 0, stream); // state[1].geom_reg_vdm_context_resume_task0
> +	STREAM_ADD_ITEM(true, uint64_t, 0, stream); // state[1].geom_reg_vdm_context_resume_task1
> +	STREAM_ADD_ITEM(true, uint64_t, 0, stream); // state[1].geom_reg_vdm_context_resume_task2
> +	STREAM_ADD_ITEM(true, uint64_t, 0, stream); // state[1].geom_reg_vdm_context_resume_task3
> +	STREAM_ADD_ITEM(true, uint64_t, 0, stream); // state[1].geom_reg_vdm_context_resume_task4
> +
> +	stream_len = stream - stream_start;
> +	STREAM_ADD_ITEM(true, uint32_t, stream_len, stream_start); // update length
> +
> +	return stream_len;
> +}
> +
> +/**
> + * igt_pvr_ioctl_create_context:
> + * @fd: File descriptor of the DRM device.
> + * @type: Type of the context to create.
> + * @vm_ctx_handle: Handle to the VM context.
> + *
> + * Function to create a device context.
> + *
> + * Returns: Handle to the created context.
> + */
> +uint32_t igt_pvr_ioctl_create_context(int fd, enum drm_pvr_ctx_type type,
> +				      uint32_t vm_ctx_handle)
> +{
> +	#define CONTEXT_INIT_STREAM_SIZE 1024
> +
> +	struct drm_pvr_ioctl_create_context_args create_context_args = {
> +		.type = type,
> +		.priority = DRM_PVR_CTX_PRIORITY_NORMAL,
> +		.vm_context_handle = vm_ctx_handle,
> +	};
> +
> +	uint8_t init_render_context_stream[CONTEXT_INIT_STREAM_SIZE] __attribute__((aligned(8)));
> +	uint8_t init_compute_context_stream[CONTEXT_INIT_STREAM_SIZE] __attribute__((aligned(8)));
> +
> +	switch (type) {
> +	case DRM_PVR_CTX_TYPE_RENDER:
> +		create_context_args.callstack_addr =
> +			igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd,
> +								      vm_ctx_handle,
> +								      POWERVR_GPU_PAGE_SIZE));
> +		create_context_args.static_context_state = (uint64_t)init_render_context_stream;

Use function to_user_pointer() here:

		create_context_args.static_context_state = to_user_pointer(init_render_context_stream);

> +		create_context_args.static_context_state_len =
> +			init_render_context_state_stream(init_render_context_stream);
> +		break;
> +
> +	case DRM_PVR_CTX_TYPE_COMPUTE:
> +		create_context_args.static_context_state = (uint64_t)init_compute_context_stream;

Same here.

> +		create_context_args.static_context_state_len =
> +			init_compute_context_state_stream(init_compute_context_stream);
> +		break;
> +
> +	case DRM_PVR_CTX_TYPE_TRANSFER_FRAG:
> +		break;
> +	}
> +
> +	do_ioctl(fd, DRM_IOCTL_PVR_CREATE_CONTEXT, &create_context_args);
> +
> +	return create_context_args.handle;
> +}
> +
> +/**
> + * igt_pvr_ioctl_destroy_context:
> + * @fd: File descriptor of the DRM device.
> + * @ctx_handle: Handle of the context to destroy.
> + *
> + * Function to destroy a device context.
> + */
> +void igt_pvr_ioctl_destroy_context(int fd, uint32_t ctx_handle)
> +{
> +	struct drm_pvr_ioctl_destroy_context_args destroy_context_args = {
> +		.handle = ctx_handle,
> +	};
> +
> +	do_ioctl(fd, DRM_IOCTL_PVR_DESTROY_CONTEXT, &destroy_context_args);
> +}
> +
>  /**
>   * igt_pvr_ioctl_create_free_list:
>   * @fd: The file descriptor of the DRM device.
> @@ -662,3 +802,95 @@ struct pvr_device_info *igt_pvr_get_device_info(int fd)
>  	return &info;
>  }
>  
> +/**
> + * igt_pvr_create_hwrt_geom_data_args:
> + * @fd: The file descriptor of the DRM device.
> + * @vm_ctx: The VM context.
> + * @geom_data_args: The geometry data arguments structure to initialize.
> + *
> + * Function to create hardware render target ioctl geometry data arguments.
> + *
> + */
> +static void igt_pvr_create_hwrt_geom_data_args(int fd, uint32_t vm_ctx,
> +					       struct drm_pvr_create_hwrt_geom_data_args
> +					       *geom_data_args)
> +{
> +	geom_data_args->rtc_dev_addr =
> +		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_PAGE_SIZE));
> +	geom_data_args->tpc_dev_addr =
> +		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_PAGE_SIZE));
> +	geom_data_args->vheap_table_dev_addr =
> +		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_PAGE_SIZE));
> +	geom_data_args->tpc_size = POWERVR_GPU_PAGE_SIZE;
> +	geom_data_args->tpc_stride = 0x1;
> +}
> +
> +/**
> + * igt_pvr_create_hwrt_rt_data_args:
> + * @fd: The file descriptor of the DRM device.
> + * @vm_ctx: The VM context.
> + * @rt_data_args: The render target data arguments structure to initialize.
> + *
> + * Function to create hardware render target ioctl render target data arguments.
> + *
> + */
> +static void igt_pvr_create_hwrt_rt_data_args(int fd, uint32_t vm_ctx,
> +					     struct drm_pvr_create_hwrt_rt_data_args *rt_data_args)
> +{
> +	rt_data_args->pm_mlist_dev_addr =
> +		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_PAGE_SIZE));
> +	rt_data_args->macrotile_array_dev_addr =
> +		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_PAGE_SIZE));
> +	rt_data_args->region_header_dev_addr =
> +		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_PAGE_SIZE));
> +}
> +
> +/**
> + * igt_pvr_ioctl_create_hwrt_dataset:
> + * @fd: The file descriptor of the DRM device.
> + * @vm_ctx: The VM context.
> + * @free_list_handles: Array of free list handles.
> + * @num_free_lists: Number of free list handles.
> + *
> + * Function to create a hardware render target dataset.
> + *
> + * Returns: Handle of the created hardware render target dataset.
> + */
> +uint32_t igt_pvr_ioctl_create_hwrt_dataset(int fd, uint32_t vm_ctx, uint32_t *free_list_handles,
> +					   uint32_t num_free_lists)
> +{
> +	struct drm_pvr_ioctl_create_hwrt_dataset_args create_hwrt_args = {
> +		.width = 256,
> +		.height = 256,
> +		.samples = 1,
> +		.layers = 1,
> +		.region_header_size = 64,
> +	};
> +
> +	igt_pvr_create_hwrt_geom_data_args(fd, vm_ctx, &create_hwrt_args.geom_data_args);
> +	igt_pvr_create_hwrt_rt_data_args(fd, vm_ctx, &create_hwrt_args.rt_data_args[0]);
> +	igt_pvr_create_hwrt_rt_data_args(fd, vm_ctx, &create_hwrt_args.rt_data_args[1]);
> +
> +	for (uint32_t i = 0; i < num_free_lists; i++)
> +		create_hwrt_args.free_list_handles[i] = free_list_handles[i];
> +
> +	do_ioctl(fd, DRM_IOCTL_PVR_CREATE_HWRT_DATASET, &create_hwrt_args);
> +
> +	return create_hwrt_args.handle;
> +}
> +
> +/**
> + * igt_pvr_ioctl_destroy_hwrt_dataset:
> + * @fd: The file descriptor of the DRM device.
> + * @hwrt_handle: The handle of the hardware render target dataset to destroy.
> + *
> + * Function to destroy a hardware render target dataset.
> + */
> +void igt_pvr_ioctl_destroy_hwrt_dataset(int fd, uint32_t hwrt_handle)
> +{
> +	struct drm_pvr_ioctl_destroy_hwrt_dataset_args destroy_hwrt_args = {
> +		.handle = hwrt_handle,
> +	};
> +
> +	do_ioctl(fd, DRM_IOCTL_PVR_DESTROY_HWRT_DATASET, &destroy_hwrt_args);
> +}
> diff --git a/lib/igt_pvr.h b/lib/igt_pvr.h
> index aa022c158..b6e3dd676 100644
> --- a/lib/igt_pvr.h
> +++ b/lib/igt_pvr.h
> @@ -11,6 +11,18 @@
>  #include "imagination/pvr_device_info.h"
>  #include "pvr_drm.h"
>  
> +#define DRM_PVR_EMPTY_OBJ_ARRAY(type) \
> +	{ .stride = sizeof(type), .count = 0, .array = 0 }
> +
> +#define STREAM_ADD_ITEM(condition, type, data, stream) \
> +	do { \
> +		if (condition) { \
> +			type *item = (type *)(stream); \
> +			*item = data; \
> +			stream += sizeof(type); \
> +		} \
> +	} while (0)
> +
>  struct igt_pvr_allocation {
>  	uint32_t bo_handle;
>  	size_t size;
> @@ -42,6 +54,10 @@ void igt_pvr_ioctl_vm_map(int fd, uint32_t vm_ctx_handle, uint32_t handle,
>  void igt_pvr_ioctl_vm_unmap(int fd, uint32_t vm_ctx_handle,
>  			    uint64_t device_addr, uint64_t size);
>  
> +uint32_t igt_pvr_ioctl_create_context(int fd, enum drm_pvr_ctx_type type,
> +				      uint32_t vm_ctx_handle);
> +void igt_pvr_ioctl_destroy_context(int fd, uint32_t ctx_handle);
> +
>  uint32_t igt_pvr_ioctl_create_free_list(int fd, uint32_t vm_ctx_handle,
>  					uint64_t gpu_addr);
>  void igt_pvr_ioctl_destroy_free_list(int fd, uint32_t free_list_handle);
> @@ -59,4 +75,8 @@ void igt_pvr_free_all(int fd);
>  
>  struct pvr_device_info *igt_pvr_get_device_info(int fd);
>  
> +uint32_t igt_pvr_ioctl_create_hwrt_dataset(int fd, uint32_t vm_ctx, uint32_t *free_list_handles,
> +					   uint32_t num_free_lists);
> +void igt_pvr_ioctl_destroy_hwrt_dataset(int fd, uint32_t hwrt_handle);
> +
>  #endif /* IGT_PVR_H */
> diff --git a/tests/imagination/meson.build b/tests/imagination/meson.build
> index 59749b51e..7ae8ddd0a 100644
> --- a/tests/imagination/meson.build
> +++ b/tests/imagination/meson.build
> @@ -6,6 +6,7 @@ pvr_progs = [ 'pvr_dev_query',
>  	      'pvr_hwrt',
>  	      'pvr_quirks_enhancements',
>  	      'pvr_runtime_info',
> +	      'pvr_submit_jobs',
>  	      'pvr_vm_context',
>  	    ]
>  
> diff --git a/tests/imagination/pvr_submit_jobs.c b/tests/imagination/pvr_submit_jobs.c
> new file mode 100644
> index 000000000..f4298966c
> --- /dev/null
> +++ b/tests/imagination/pvr_submit_jobs.c
> @@ -0,0 +1,655 @@
> +// SPDX-License-Identifier: GPL-2.0 or MIT
> +/* Copyright (c) 2026 Imagination Technologies Ltd. All Rights Reserved */
> +
> +#include "igt.h"
> +#include "igt_pvr.h"
> +
> +#include "pvr_drm.h"
> +
> +#include <errno.h>
> +#include <sys/mman.h>
> +#include <stdbool.h>
> +#include <stdint.h>
> +#include <time.h>
> +
> +#define PVR_JOB_STREAM_SIZE 256
> +#define PVR_SYNCOBJ_WAIT_TIMEOUT_NS NSEC_PER_SEC
> +
> +#define PVR_BO_SIZE 0x2000
> +#define PVR_NUM_FREE_LISTS 2
> +#define PVR_INVALID_HANDLE 999
> +#define PVR_STREAM_TERMINATE_BLOCK_TYPE 0xc0000000
> +#define PVR_CDM_STREAM_TERMINATE_BLOCK_TYPE 0x80000000
> +#define PVR_UNUSED_JOB_FLAG (1u << 15)
> +
> +#define ROGUE_PDSINST_OPCODEC_SP            (0x0000000dU)
> +#define ROGUE_PDSINST_HALT_OPCODE_SHIFT     (28U)
> +#define ROGUE_PDSINST_OPCODESP_HALT         (0x00000006U)
> +#define ROGUE_PDSINST_HALT_OP_SHIFT         (23U)
> +
> +#define TRUNCATE_64BITS_TO_32BITS(expr) ((uint32_t)(expr))
> +#define ROGUE_VDMCTRL_BLOCK_HEADER_BLOCK_TYPE_PPP_STATE_UPDATE                        (0x00000000U)
> +#define ROGUE_VDMCTRL_PPP_STATE0_WORD_COUNT_SHIFT                                     (8U)
> +#define ROGUE_VDMCTRL_PPP_STATE0_ADDRMSB_ALIGNSHIFT                                   (32U)
> +#define ROGUE_VDMCTRL_PPP_STATE0_ADDRMSB_SHIFT                                        (0U)
> +#define ROGUE_VDMCTRL_PPP_STATE1_ADDRLSB_ALIGNSHIFT                                   (2U)
> +#define ROGUE_VDMCTRL_PPP_STATE1_ADDRLSB_SHIFT                                        (2U)
> +#define ROGUE_VDMCTRL_PPP_STATE1_ADDRLSB_CLRMSK                                       (0x00000003U)
> +
> +#define ROGUE_TA_STATE_HEADER_PRES_TERMINATE_EN                                       (0x02000000U)
> +
> +#define ROGUE_TA_STATE_TERMINATE1_CLIP_LEFT_SHIFT           (23U)
> +#define ROGUE_TA_STATE_TERMINATE0_CLIP_RIGHT_SHIFT          (18U)
> +#define ROGUE_TA_STATE_TERMINATE0_CLIP_TOP_SHIFT            (9U)
> +#define ROGUE_TA_STATE_TERMINATE0_CLIP_BOTTOM_SHIFT         (0U)
> +
> +static uint32_t init_compute_cmd_stream(int fd, uint32_t vm_ctx,
> +					uint8_t *stream,
> +					struct pvr_device_info *device_info)
> +{
> +	uint8_t *stream_start = stream;
> +	uint64_t cdm_stream_gpu_addr;
> +	void *cdm_stream_map;
> +	uint32_t stream_length;
> +
> +	struct igt_pvr_allocation *cdm_stream_alloc = igt_pvr_allocate_general(fd, vm_ctx, 0x1000);
> +
> +	cdm_stream_gpu_addr = igt_pvr_get_gpu_addr(cdm_stream_alloc);
> +
> +	STREAM_ADD_ITEM(true, uint32_t, 0, stream); // length
> +	STREAM_ADD_ITEM(true, uint32_t, 0, stream); // padding
> +
> +	STREAM_ADD_ITEM(true, uint64_t, 0, stream); // tpu_border_colour_table
> +	STREAM_ADD_ITEM(true, uint64_t, cdm_stream_gpu_addr, stream); // cdm_ctrl_stream_base
> +	STREAM_ADD_ITEM(true, uint64_t, 0, stream); // cdm_context_state_base_addr
> +	STREAM_ADD_ITEM(device_info->quirks.has_brn49927, uint32_t, 0, stream); // tpu
> +	STREAM_ADD_ITEM(true, uint32_t, 0, stream); // cdm_resume_pds1
> +	STREAM_ADD_ITEM(device_info->features.has_compute_morton_capable,
> +			uint32_t, 0, stream); // cdm_item
> +	STREAM_ADD_ITEM(device_info->features.has_cluster_grouping,
> +			uint32_t, 0, stream); // compute_cluster
> +	STREAM_ADD_ITEM(device_info->features.has_tpu_dm_global_registers,
> +			uint32_t, 0, stream); // tpu_tag_cdm_ctrl
> +	STREAM_ADD_ITEM(device_info->features.has_gpu_multicore_support,
> +			uint32_t, 0, stream); // execute_count
> +	STREAM_ADD_ITEM(true, uint32_t, 0, stream); // padding
> +
> +	stream_length = stream - stream_start;
> +
> +	STREAM_ADD_ITEM(true, uint32_t, stream_length, stream_start); // update length
> +
> +	cdm_stream_map = igt_pvr_get_cpu_addr(fd, cdm_stream_alloc);
> +
> +	((uint32_t *)cdm_stream_map)[0] =
> +			PVR_CDM_STREAM_TERMINATE_BLOCK_TYPE;
> +	return stream_length;
> +}
> +
> +static int64_t syncobj_wait_timeout(void)
> +{
> +	struct timespec now;
> +
> +	igt_assert_eq(clock_gettime(CLOCK_MONOTONIC, &now), 0);
> +
> +	return (int64_t)now.tv_sec * NSEC_PER_SEC + now.tv_nsec +
> +	       PVR_SYNCOBJ_WAIT_TIMEOUT_NS;
> +}
> +
> +static uint32_t init_geometry_cmd_stream(uint8_t *stream, struct pvr_device_info *device_info,
> +					 uint64_t vdm_gpu_addr)
> +{
> +	uint8_t *stream_start = stream;
> +	uint32_t stream_length;
> +
> +	STREAM_ADD_ITEM(true, uint32_t, 0, stream); // length
> +	STREAM_ADD_ITEM(true, uint32_t, 0, stream); // padding
> +
> +	STREAM_ADD_ITEM(true, uint64_t, vdm_gpu_addr, stream); // vdm_ctrl_stream_base
> +	STREAM_ADD_ITEM(true, uint64_t, 0, stream); // tpu_border_colour_table
> +	STREAM_ADD_ITEM(true, uint32_t, 0, stream); // ppp_ctrl
> +	STREAM_ADD_ITEM(true, uint32_t, 0, stream); // te_psg
> +	STREAM_ADD_ITEM(device_info->quirks.has_brn49927, uint32_t, 0, stream); // tpu
> +	STREAM_ADD_ITEM(true, uint32_t, 0, stream); // vdm_context_resume_task0_size
> +	STREAM_ADD_ITEM(true, uint32_t, 0, stream); // view_idx
> +	STREAM_ADD_ITEM(true, uint32_t, 0, stream); // padding
> +
> +	stream_length = stream - stream_start;
> +
> +	STREAM_ADD_ITEM(true, uint32_t, stream_length, stream_start); // update length
> +	return stream_length;
> +}
> +
> +static uint32_t pds_inst_encode_halt(void)
> +{
> +	uint32_t encoded = 0;
> +
> +	encoded |=
> +		(uint32_t)((uint32_t)ROGUE_PDSINST_OPCODEC_SP << ROGUE_PDSINST_HALT_OPCODE_SHIFT);
> +	encoded |=
> +		(uint32_t)((uint32_t)ROGUE_PDSINST_OPCODESP_HALT << ROGUE_PDSINST_HALT_OP_SHIFT);
> +	return encoded;
> +}
> +
> +int igt_main()
> +{
> +	const uint32_t num_free_lists = PVR_NUM_FREE_LISTS;
> +	uint32_t free_list_handles[num_free_lists];
> +	uint8_t compute_cmd_stream[PVR_JOB_STREAM_SIZE]	__attribute__((aligned(8)));
> +	uint8_t geometry_cmd_stream[PVR_JOB_STREAM_SIZE] __attribute__((aligned(8)));
> +
> +	uint32_t compute_vm_ctx_handle;
> +	uint32_t render_vm_ctx_handle;
> +	uint32_t transfer_vm_ctx_handle;
> +
> +	uint32_t compute_stream_length;
> +	uint32_t geometry_stream_length;
> +
> +	uint32_t compute_ctx_handle;
> +	uint32_t render_ctx_handle;
> +	uint32_t transfer_ctx_handle;
> +
> +	size_t size = PVR_BO_SIZE;
> +	uint32_t hwrt_handle;
> +	int fd;
> +
> +	struct pvr_device_info *device_info;
> +
> +	struct igt_pvr_allocation *free_lists_obj_alloc;
> +	struct igt_pvr_allocation *ppp_alloc;
> +	struct igt_pvr_allocation *vdm_alloc;
> +	struct igt_pvr_allocation *compute_pds_alloc;
> +
> +	uint32_t *ppp_buffer_base;
> +	uint32_t *vdm_buffer;
> +	uint64_t *pds_buffer_base;
> +
> +	igt_fixture()
> +	{
> +		fd = drm_open_driver(DRIVER_POWERVR);
> +
> +		igt_pvr_init_allocators(fd);
> +
> +		device_info = igt_pvr_get_device_info(fd);
> +
> +		compute_vm_ctx_handle = igt_pvr_ioctl_create_vm_context(fd, 0);
> +		igt_assert(compute_vm_ctx_handle);
> +
> +		render_vm_ctx_handle = igt_pvr_ioctl_create_vm_context(fd, 0);
> +		igt_assert(render_vm_ctx_handle);
> +
> +		transfer_vm_ctx_handle = igt_pvr_ioctl_create_vm_context(fd, 0);
> +		igt_assert(transfer_vm_ctx_handle);
> +
> +		compute_ctx_handle =
> +			igt_pvr_ioctl_create_context(fd,
> +						     DRM_PVR_CTX_TYPE_COMPUTE,
> +						     compute_vm_ctx_handle);
> +		igt_assert(compute_ctx_handle);
> +
> +		transfer_ctx_handle =
> +			igt_pvr_ioctl_create_context(fd,
> +						     DRM_PVR_CTX_TYPE_TRANSFER_FRAG,
> +						     transfer_vm_ctx_handle);
> +		igt_assert(transfer_ctx_handle);
> +
> +		render_ctx_handle =
> +			igt_pvr_ioctl_create_context(fd,
> +						     DRM_PVR_CTX_TYPE_RENDER,
> +						     render_vm_ctx_handle);
> +		igt_assert(render_ctx_handle);
> +
> +		compute_stream_length =
> +			init_compute_cmd_stream(fd, compute_vm_ctx_handle,
> +						(uint8_t *)&compute_cmd_stream, device_info);
> +
> +		/* PDS for compute */
> +		compute_pds_alloc =
> +			igt_pvr_allocate(fd, compute_vm_ctx_handle, 0x4000,
> +					 DRM_PVR_BO_ALLOW_CPU_USERSPACE_ACCESS,
> +					 DRM_PVR_HEAP_PDS_CODE_DATA);
> +		pds_buffer_base = igt_pvr_get_cpu_addr(fd, compute_pds_alloc);
> +
> +		pds_buffer_base[0x20] = pds_inst_encode_halt();
> +
> +		vdm_alloc =
> +			igt_pvr_allocate_general(fd, render_vm_ctx_handle, size);
> +
> +		vdm_buffer = igt_pvr_get_cpu_addr(fd, vdm_alloc);
> +
> +		size = PVR_BO_SIZE;
> +
> +		ppp_alloc =
> +			igt_pvr_allocate_general(fd, render_vm_ctx_handle, size);
> +
> +		ppp_buffer_base = igt_pvr_get_cpu_addr(fd, ppp_alloc);
> +
> +		/* PPP state for terminate */
> +		ppp_buffer_base[0] = ROGUE_TA_STATE_HEADER_PRES_TERMINATE_EN;
> +		ppp_buffer_base[1] = (256 << ROGUE_TA_STATE_TERMINATE0_CLIP_RIGHT_SHIFT) |
> +					(0 << ROGUE_TA_STATE_TERMINATE0_CLIP_TOP_SHIFT) |
> +					(256 << ROGUE_TA_STATE_TERMINATE0_CLIP_BOTTOM_SHIFT);
> +		ppp_buffer_base[2] = (0 << ROGUE_TA_STATE_TERMINATE1_CLIP_LEFT_SHIFT);
> +
> +		*vdm_buffer++ =
> +			ROGUE_VDMCTRL_BLOCK_HEADER_BLOCK_TYPE_PPP_STATE_UPDATE |
> +			(3 << ROGUE_VDMCTRL_PPP_STATE0_WORD_COUNT_SHIFT) |
> +			((igt_pvr_get_gpu_addr(ppp_alloc)
> +			>> ROGUE_VDMCTRL_PPP_STATE0_ADDRMSB_ALIGNSHIFT)
> +			<< ROGUE_VDMCTRL_PPP_STATE0_ADDRMSB_SHIFT);
> +		*vdm_buffer++ =
> +			TRUNCATE_64BITS_TO_32BITS(((igt_pvr_get_gpu_addr(ppp_alloc)
> +						  >> ROGUE_VDMCTRL_PPP_STATE1_ADDRLSB_ALIGNSHIFT)
> +						  << ROGUE_VDMCTRL_PPP_STATE1_ADDRLSB_SHIFT) &
> +						  ~ROGUE_VDMCTRL_PPP_STATE1_ADDRLSB_CLRMSK);
> +
> +		*vdm_buffer++ =	PVR_STREAM_TERMINATE_BLOCK_TYPE;
> +		geometry_stream_length =
> +			init_geometry_cmd_stream((uint8_t *)&geometry_cmd_stream,
> +						 device_info,
> +						 igt_pvr_get_gpu_addr(vdm_alloc));
> +
> +		/* Also need free lists and hwrt data for render jobs. */
> +		free_lists_obj_alloc =
> +			igt_pvr_allocate(fd, render_vm_ctx_handle,
> +					 size * 4, DRM_PVR_BO_PM_FW_PROTECT,
> +					 DRM_PVR_HEAP_GENERAL);
> +
> +		for (int i = 0; i < num_free_lists; i++) {
> +			uint64_t free_list_gpu_addr = igt_pvr_get_gpu_addr(free_lists_obj_alloc);
> +
> +			free_list_handles[i] =
> +				igt_pvr_ioctl_create_free_list(fd,
> +							       render_vm_ctx_handle,
> +							       free_list_gpu_addr + i * size);
> +		}
> +
> +		hwrt_handle =
> +			igt_pvr_ioctl_create_hwrt_dataset(fd, render_vm_ctx_handle,
> +							  free_list_handles,
> +							  num_free_lists);
> +		igt_assert(hwrt_handle);
> +	}
> +
> +	/* Invalid job and context combinations. */
> +	igt_subtest_group() {
> +		igt_subtest("submit-jobs-fail-zero-length")
> +		{
> +			struct drm_pvr_ioctl_submit_jobs_args args = {0};
> +
> +			do_ioctl_err(fd, DRM_IOCTL_PVR_SUBMIT_JOBS, &args, EINVAL);
> +		}
> +
> +		igt_subtest("submit-jobs-fail-compute-no-cmd-stream")
> +		{
> +			struct drm_pvr_job job = {
> +				.type = DRM_PVR_JOB_TYPE_COMPUTE,
> +				.context_handle = compute_ctx_handle,
> +				.flags = 0,
> +				.cmd_stream_len = 0,
> +				.cmd_stream = (uint64_t)&compute_cmd_stream,

Same here, use to_user_pointer():

.cmd_stream =  to_user_pointer(&compute_cmd_stream);

Repeat this for all other places with this type of cast.

> +			};
> +			struct drm_pvr_ioctl_submit_jobs_args args = {
> +				.jobs = DRM_PVR_OBJ_ARRAY(1, &job),
> +			};
> +
> +			do_ioctl_err(fd, DRM_IOCTL_PVR_SUBMIT_JOBS, &args, EINVAL);
> +
> +			job.cmd_stream = 0;
> +			job.cmd_stream_len = sizeof(compute_cmd_stream);
> +			do_ioctl_err(fd, DRM_IOCTL_PVR_SUBMIT_JOBS, &args, EINVAL);
> +		}
> +
> +		igt_subtest("submit-jobs-fail-compute-with-hwrt")
> +		{
> +			struct drm_pvr_job job = {
> +				.type = DRM_PVR_JOB_TYPE_COMPUTE,
> +				.context_handle = compute_ctx_handle,
> +				.flags = 0,
> +				.cmd_stream_len = compute_stream_length,
> +				.cmd_stream = (uint64_t)&compute_cmd_stream,
> +				.hwrt.set_handle = 1,
> +			};
> +			struct drm_pvr_ioctl_submit_jobs_args args = {
> +				.jobs = DRM_PVR_OBJ_ARRAY(1, &job),
> +			};
> +
> +			do_ioctl_err(fd, DRM_IOCTL_PVR_SUBMIT_JOBS, &args, EINVAL);
> +
> +			job.hwrt.set_handle = 0;
> +			job.hwrt.data_index = 1;
> +			do_ioctl_err(fd, DRM_IOCTL_PVR_SUBMIT_JOBS, &args, EINVAL);
> +		}
> +
> +		igt_subtest("submit-jobs-fail-compute-bad-context")
> +		{
> +			struct drm_pvr_job job = {
> +				.type = DRM_PVR_JOB_TYPE_COMPUTE,
> +				.context_handle = PVR_INVALID_HANDLE,
> +				.flags = 0,
> +				.cmd_stream_len = compute_stream_length,
> +				.cmd_stream = (uint64_t)&compute_cmd_stream,
> +			};
> +			struct drm_pvr_ioctl_submit_jobs_args args = {
> +				.jobs = DRM_PVR_OBJ_ARRAY(1, &job),
> +			};
> +
> +			do_ioctl_err(fd, DRM_IOCTL_PVR_SUBMIT_JOBS, &args, EINVAL);
> +
> +			job.context_handle = 0;
> +			do_ioctl_err(fd, DRM_IOCTL_PVR_SUBMIT_JOBS, &args, EINVAL);
> +		}
> +
> +		igt_subtest("submit-jobs-fail-bad-flags")
> +		{
> +			struct drm_pvr_job job = {
> +				.type = DRM_PVR_JOB_TYPE_COMPUTE,
> +				.context_handle = compute_ctx_handle,
> +				.flags = PVR_UNUSED_JOB_FLAG,
> +				.cmd_stream_len = compute_stream_length,
> +				.cmd_stream = (uint64_t)&compute_cmd_stream,
> +			};
> +			struct drm_pvr_ioctl_submit_jobs_args args = {
> +				.jobs = DRM_PVR_OBJ_ARRAY(1, &job),
> +			};
> +
> +			/* Check the invalid flag is still unused! */
> +			igt_assert(job.flags & ~DRM_PVR_SUBMIT_JOB_GEOM_CMD_FLAGS_MASK);
> +			igt_assert(job.flags & ~DRM_PVR_SUBMIT_JOB_FRAG_CMD_FLAGS_MASK);
> +			igt_assert(job.flags & ~DRM_PVR_SUBMIT_JOB_COMPUTE_CMD_FLAGS_MASK);
> +			igt_assert(job.flags & ~DRM_PVR_SUBMIT_JOB_TRANSFER_CMD_FLAGS_MASK);
> +
> +			do_ioctl_err(fd, DRM_IOCTL_PVR_SUBMIT_JOBS, &args, EINVAL);
> +
> +			job.context_handle = transfer_ctx_handle;
> +			job.type = DRM_PVR_JOB_TYPE_TRANSFER_FRAG;
> +			do_ioctl_err(fd, DRM_IOCTL_PVR_SUBMIT_JOBS, &args, EINVAL);
> +
> +			job.hwrt.set_handle = hwrt_handle;
> +			job.context_handle = render_ctx_handle;
> +			job.type = DRM_PVR_JOB_TYPE_GEOMETRY;
> +			do_ioctl_err(fd, DRM_IOCTL_PVR_SUBMIT_JOBS, &args, EINVAL);
> +			job.type = DRM_PVR_JOB_TYPE_FRAGMENT;
> +			do_ioctl_err(fd, DRM_IOCTL_PVR_SUBMIT_JOBS, &args, EINVAL);
> +		}
> +
> +		igt_subtest("submit-jobs-fail-compute-wrong-context")
> +		{
> +			struct drm_pvr_job job = {
> +				.type = DRM_PVR_JOB_TYPE_COMPUTE,
> +				.context_handle = transfer_ctx_handle,
> +				.cmd_stream_len = compute_stream_length,
> +				.cmd_stream = (uint64_t)&compute_cmd_stream,
> +			};
> +			struct drm_pvr_ioctl_submit_jobs_args args = {
> +				.jobs = DRM_PVR_OBJ_ARRAY(1, &job),
> +			};
> +
> +			do_ioctl_err(fd, DRM_IOCTL_PVR_SUBMIT_JOBS, &args, EINVAL);
> +			job.context_handle = render_ctx_handle;
> +			do_ioctl_err(fd, DRM_IOCTL_PVR_SUBMIT_JOBS, &args, EINVAL);
> +		}
> +
> +		igt_subtest("submit-jobs-fail-transfer-wrong-context")
> +		{
> +			struct drm_pvr_job job = {
> +				.type = DRM_PVR_JOB_TYPE_TRANSFER_FRAG,
> +				.context_handle = compute_ctx_handle,
> +				.cmd_stream_len = compute_stream_length,
> +				.cmd_stream = (uint64_t)&compute_cmd_stream,
> +			};
> +			struct drm_pvr_ioctl_submit_jobs_args args = {
> +				.jobs = DRM_PVR_OBJ_ARRAY(1, &job),
> +			};
> +
> +			do_ioctl_err(fd, DRM_IOCTL_PVR_SUBMIT_JOBS, &args, EINVAL);
> +			job.context_handle = render_ctx_handle;
> +			do_ioctl_err(fd, DRM_IOCTL_PVR_SUBMIT_JOBS, &args, EINVAL);
> +		}
> +
> +		igt_subtest("submit-jobs-fail-compute-too-big")
> +		{
> +			struct drm_pvr_job job = {
> +				.type = DRM_PVR_JOB_TYPE_COMPUTE,
> +				.context_handle = compute_ctx_handle,
> +				.flags = 0,
> +				.cmd_stream_len = UINT32_MAX,
> +				.cmd_stream = (uint64_t)&compute_cmd_stream,
> +			};
> +			struct drm_pvr_ioctl_submit_jobs_args args = {
> +				.jobs = DRM_PVR_OBJ_ARRAY(1, &job),
> +			};
> +
> +			do_ioctl_err(fd, DRM_IOCTL_PVR_SUBMIT_JOBS, &args, ENOMEM);
> +		}
> +	}
> +
> +	/* Compute jobs with sync operations. */
> +	igt_subtest_group() {
> +		igt_subtest("submit-jobs-compute-single-wait")
> +		{
> +			struct drm_pvr_sync_op wait = {
> +				.flags = DRM_PVR_SYNC_OP_FLAG_WAIT |
> +					DRM_PVR_SYNC_OP_FLAG_HANDLE_TYPE_SYNCOBJ,
> +			};
> +			struct drm_pvr_job job = {
> +				.type = DRM_PVR_JOB_TYPE_COMPUTE,
> +				.context_handle = compute_ctx_handle,
> +				.flags = 0,
> +				.cmd_stream_len = compute_stream_length,
> +				.cmd_stream = (uint64_t)&compute_cmd_stream,
> +				.sync_ops = DRM_PVR_OBJ_ARRAY(1, &wait),
> +			};
> +			struct drm_pvr_ioctl_submit_jobs_args args = {
> +				.jobs = DRM_PVR_OBJ_ARRAY(1, &job),
> +			};
> +
> +			drmSyncobjCreate(fd, 0, &wait.handle);
> +			igt_assert_neq(wait.handle, 0);
> +
> +			/* Clear the wait! */
> +			drmSyncobjSignal(fd, &wait.handle, 1);
> +
> +			do_ioctl(fd, DRM_IOCTL_PVR_SUBMIT_JOBS, &args);
> +		}
> +
> +		igt_subtest("submit-jobs-fail-compute-no-syncop-handle")
> +		{
> +			struct drm_pvr_sync_op wait = {
> +				.flags = DRM_PVR_SYNC_OP_FLAG_WAIT |
> +					DRM_PVR_SYNC_OP_FLAG_HANDLE_TYPE_SYNCOBJ,
> +			};
> +			struct drm_pvr_job job = {
> +				.type = DRM_PVR_JOB_TYPE_COMPUTE,
> +				.context_handle = compute_ctx_handle,
> +				.flags = 0,
> +				.cmd_stream_len = compute_stream_length,
> +				.cmd_stream = (uint64_t)&compute_cmd_stream,
> +				.sync_ops = DRM_PVR_OBJ_ARRAY(1, &wait),
> +			};
> +			struct drm_pvr_ioctl_submit_jobs_args args = {
> +				.jobs = DRM_PVR_OBJ_ARRAY(1, &job),
> +			};
> +
> +			do_ioctl_err(fd, DRM_IOCTL_PVR_SUBMIT_JOBS, &args, ENOENT);
> +		}
> +
> +		igt_subtest("submit-jobs-fail-compute-bad-syncop-handle")
> +		{
> +			struct drm_pvr_sync_op wait = {
> +				.flags = DRM_PVR_SYNC_OP_FLAG_WAIT |
> +					DRM_PVR_SYNC_OP_FLAG_HANDLE_TYPE_SYNCOBJ,
> +				.handle = PVR_INVALID_HANDLE,
> +			};
> +			struct drm_pvr_job job = {
> +				.type = DRM_PVR_JOB_TYPE_COMPUTE,
> +				.context_handle = compute_ctx_handle,
> +				.flags = 0,
> +				.cmd_stream_len = compute_stream_length,
> +				.cmd_stream = (uint64_t)&compute_cmd_stream,
> +				.sync_ops = DRM_PVR_OBJ_ARRAY(1, &wait),
> +			};
> +			struct drm_pvr_ioctl_submit_jobs_args args = {
> +				.jobs = DRM_PVR_OBJ_ARRAY(1, &job),
> +			};
> +
> +			do_ioctl_err(fd, DRM_IOCTL_PVR_SUBMIT_JOBS, &args, ENOENT);
> +		}
> +
> +		igt_subtest("submit-jobs-compute-single")
> +		{
> +			struct drm_pvr_job job = {
> +				.type = DRM_PVR_JOB_TYPE_COMPUTE,
> +				.context_handle = compute_ctx_handle,
> +				.flags = 0,
> +				.cmd_stream_len = compute_stream_length,
> +				.cmd_stream = (uint64_t)&compute_cmd_stream,
> +				.sync_ops = DRM_PVR_EMPTY_OBJ_ARRAY(struct drm_pvr_sync_op),
> +			};
> +			struct drm_pvr_ioctl_submit_jobs_args args = {
> +				.jobs = DRM_PVR_OBJ_ARRAY(1, &job),
> +			};
> +
> +			do_ioctl(fd, DRM_IOCTL_PVR_SUBMIT_JOBS, &args);
> +		}
> +
> +		igt_subtest("submit-jobs-compute-single-signal")
> +		{
> +			struct drm_pvr_sync_op signal = {
> +				.flags = DRM_PVR_SYNC_OP_FLAG_SIGNAL |
> +					DRM_PVR_SYNC_OP_FLAG_HANDLE_TYPE_SYNCOBJ,
> +			};
> +			struct drm_pvr_job job = {
> +				.type = DRM_PVR_JOB_TYPE_COMPUTE,
> +				.context_handle = compute_ctx_handle,
> +				.flags = 0,
> +				.cmd_stream_len = compute_stream_length,
> +				.cmd_stream = (uint64_t)&compute_cmd_stream,
> +				.sync_ops = DRM_PVR_OBJ_ARRAY(1, &signal),
> +			};
> +			struct drm_pvr_ioctl_submit_jobs_args args = {
> +				.jobs = DRM_PVR_OBJ_ARRAY(1, &job),
> +			};
> +
> +			drmSyncobjCreate(fd, 0, &signal.handle);
> +			igt_assert_neq(signal.handle, 0);
> +
> +			do_ioctl(fd, DRM_IOCTL_PVR_SUBMIT_JOBS, &args);
> +			igt_assert_eq(drmSyncobjWait(fd, &signal.handle, 1, syncobj_wait_timeout(),
> +						     0, NULL), 0);
> +		}
> +
> +		igt_subtest("submit-jobs-compute-single-wait-and-signal")
> +		{
> +			struct drm_pvr_sync_op syncs[] = {
> +				{
> +					.flags = DRM_PVR_SYNC_OP_FLAG_WAIT |
> +						DRM_PVR_SYNC_OP_FLAG_HANDLE_TYPE_SYNCOBJ,
> +				},
> +				{
> +					.flags = DRM_PVR_SYNC_OP_FLAG_SIGNAL |
> +						DRM_PVR_SYNC_OP_FLAG_HANDLE_TYPE_SYNCOBJ,
> +				},
> +			};
> +			struct drm_pvr_job job = {
> +				.type = DRM_PVR_JOB_TYPE_COMPUTE,
> +				.context_handle = compute_ctx_handle,
> +				.flags = 0,
> +				.cmd_stream_len = compute_stream_length,
> +				.cmd_stream = (uint64_t)&compute_cmd_stream,
> +				.sync_ops = DRM_PVR_OBJ_ARRAY(ARRAY_SIZE(syncs), syncs),
> +			};
> +			struct drm_pvr_ioctl_submit_jobs_args args = {
> +				.jobs = DRM_PVR_OBJ_ARRAY(1, &job),
> +			};
> +
> +			drmSyncobjCreate(fd, 0, &syncs[0].handle);
> +			igt_assert_neq(syncs[0].handle, 0);
> +			drmSyncobjCreate(fd, 0, &syncs[1].handle);
> +			igt_assert_neq(syncs[1].handle, 0);
> +
> +			/* Clear the wait! */
> +			drmSyncobjSignal(fd, &syncs[0].handle, 1);
> +
> +			do_ioctl(fd, DRM_IOCTL_PVR_SUBMIT_JOBS, &args);
> +			igt_assert_eq(drmSyncobjWait(fd, &syncs[1].handle,
> +						     1, syncobj_wait_timeout(),
> +						     0, NULL), 0);
> +		}
> +	}
> +
> +	/* Graphics-specific jobs and contexts. */
> +	igt_subtest_group() {
> +		igt_subtest("submit-jobs-fail-render-without-hwrt")
> +		{
> +			struct drm_pvr_job job = {
> +				.type = DRM_PVR_JOB_TYPE_GEOMETRY,
> +				.context_handle = render_ctx_handle,
> +				.flags = DRM_PVR_SUBMIT_JOB_GEOM_CMD_FIRST |
> +						DRM_PVR_SUBMIT_JOB_GEOM_CMD_LAST,
> +				.cmd_stream_len = geometry_stream_length,
> +				.cmd_stream = (uint64_t)&geometry_cmd_stream,

Same here, use to_user_pointer():
.cmd_stream =  to_user_pointer(&geometry_cmd_stream);

This is also present in few other places, please correct all.

Regards,
Kamil


> +			};
> +			struct drm_pvr_ioctl_submit_jobs_args args = {
> +				.jobs = DRM_PVR_OBJ_ARRAY(1, &job),
> +			};
> +
> +			do_ioctl_err(fd, DRM_IOCTL_PVR_SUBMIT_JOBS, &args, EINVAL);
> +		}
> +
> +		igt_subtest("submit-jobs-fail-geometry-wrong-context")
> +		{
> +			struct drm_pvr_job job = {
> +				.type = DRM_PVR_JOB_TYPE_GEOMETRY,
> +				.context_handle = compute_ctx_handle,
> +				.hwrt.set_handle = hwrt_handle,
> +				.cmd_stream_len = geometry_stream_length,
> +				.cmd_stream = (uint64_t)&geometry_cmd_stream,
> +			};
> +			struct drm_pvr_ioctl_submit_jobs_args args = {
> +				.jobs = DRM_PVR_OBJ_ARRAY(1, &job),
> +			};
> +
> +			do_ioctl_err(fd, DRM_IOCTL_PVR_SUBMIT_JOBS, &args, EINVAL);
> +			job.context_handle = transfer_ctx_handle;
> +			do_ioctl_err(fd, DRM_IOCTL_PVR_SUBMIT_JOBS, &args, EINVAL);
> +		}
> +
> +		igt_subtest("submit-jobs-fail-fragment-wrong-context")
> +		{
> +			struct drm_pvr_job job = {
> +				.type = DRM_PVR_JOB_TYPE_FRAGMENT,
> +				.context_handle = compute_ctx_handle,
> +				.hwrt.set_handle = hwrt_handle,
> +				.cmd_stream_len = geometry_stream_length,
> +				.cmd_stream = (uint64_t)&geometry_cmd_stream,
> +			};
> +			struct drm_pvr_ioctl_submit_jobs_args args = {
> +				.jobs = DRM_PVR_OBJ_ARRAY(1, &job),
> +			};
> +
> +			do_ioctl_err(fd, DRM_IOCTL_PVR_SUBMIT_JOBS, &args, EINVAL);
> +			job.context_handle = transfer_ctx_handle;
> +			do_ioctl_err(fd, DRM_IOCTL_PVR_SUBMIT_JOBS, &args, EINVAL);
> +		}
> +	}
> +
> +	igt_fixture()
> +	{
> +		igt_pvr_ioctl_destroy_hwrt_dataset(fd, hwrt_handle);
> +
> +		for (int i = 0; i < num_free_lists; i++)
> +			igt_pvr_ioctl_destroy_free_list(fd, free_list_handles[i]);
> +
> +		igt_pvr_free_all(fd);
> +
> +		igt_pvr_ioctl_destroy_context(fd, compute_ctx_handle);
> +		igt_pvr_ioctl_destroy_context(fd, render_ctx_handle);
> +		igt_pvr_ioctl_destroy_context(fd, transfer_ctx_handle);
> +
> +		igt_pvr_ioctl_destroy_vm_context(fd, compute_vm_ctx_handle, 0);
> +		igt_pvr_ioctl_destroy_vm_context(fd, render_vm_ctx_handle, 0);
> +		igt_pvr_ioctl_destroy_vm_context(fd, transfer_vm_ctx_handle, 0);
> +
> +		drm_close_driver(fd);
> +	}
> +}
> 
> -- 
> 2.43.0
> 
