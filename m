Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE16C4453C
	for <igt-dev@archiver.kernel.org>; Wed, 22 Jul 2026 14:42:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AD7E10EE19;
	Wed, 22 Jul 2026 14:42:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GEbBnu0W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D5F010EE19
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jul 2026 14:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784731291; x=1816267291;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=VoE+4DMhGUimXaS9IgG0V2rtzhZlXdFhM2qJgfZH/C8=;
 b=GEbBnu0WuPjGQjTqacIL9uL/N8RWns8nJ0EUIbXAj45wbim6LuLB/v8x
 QFgQgGz5lHEYdqsfUtL8cQd8EG7FMHrw9G/PLApv3n0DI44vZiFY363lB
 X9WRUNuqG1IsG7PWIaG9UT+H7xhNRY7pS2055mvcb0fuARw8MYB8pBqp9
 GG2DhG3M9rLB5X9N4j0HXVYm4QJMkHAYnoe5NKBavNBOT4QlPToedcFrl
 ouzvKgktVESssg3jg/QuihZz/btZCxxpM4RZcuu9AI9s2NtIcuv2y3UNB
 SKUAJCuKwKMazHkn7WrjABeKYLHfJ2/ZhvKr9A9wIWUtHSRXxGJBt5D4y w==;
X-CSE-ConnectionGUID: zztcwUBWRjijrecFUdyGsA==
X-CSE-MsgGUID: kmYbK7vySQme+c5AVnaBCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="89044887"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="89044887"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 07:41:30 -0700
X-CSE-ConnectionGUID: pmi19lLqTEWd4+h+oQF0zw==
X-CSE-MsgGUID: +Eg54J+tRYqWT4ZI+Djhpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="258781886"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 07:41:28 -0700
Date: Wed, 22 Jul 2026 16:41:26 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Robert Mazur <robert.mazur@imgtec.com>
Cc: igt-dev@lists.freedesktop.org, Alessio Belle <alessio.belle@imgtec.com>,
 Luigi Santivetti <luigi.santivetti@imgtec.com>,
 Brajesh Gupta <brajesh.gupta@imgtec.com>,
 Sarah Walker <sarah.walker@imgtec.com>
Subject: Re: [PATCH i-g-t v3 08/10] tests/imagination: Add tests for free
 list and hwrt creation ioctls
Message-ID: <20260722144126.6zjzgmd6vditjqu6@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Robert Mazur <robert.mazur@imgtec.com>,
 igt-dev@lists.freedesktop.org,
 Alessio Belle <alessio.belle@imgtec.com>,
 Luigi Santivetti <luigi.santivetti@imgtec.com>,
 Brajesh Gupta <brajesh.gupta@imgtec.com>,
 Sarah Walker <sarah.walker@imgtec.com>
References: <20260717-test-imagination-add-support-v3-0-ce69f9ad330c@imgtec.com>
 <20260717-test-imagination-add-support-v3-8-ce69f9ad330c@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260717-test-imagination-add-support-v3-8-ce69f9ad330c@imgtec.com>
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
On 2026-07-17 at 16:21:40 +0200, Robert Mazur wrote:
> From: Sarah Walker <sarah.walker@imgtec.com>
> 
> Add subtests for free list and HWRT creation/destruction ioctls,
> covering valid usage and error paths for invalid parameters.
> 
> Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>
> Signed-off-by: Robert Mazur <robert.mazur@imgtec.com>
> ---
>  lib/igt_pvr.c                     | 130 ++++++++++++++++++++++-
>  lib/igt_pvr.h                     |  13 +++
>  tests/imagination/meson.build     |   2 +
>  tests/imagination/pvr_free_list.c | 218 ++++++++++++++++++++++++++++++++++++++
>  tests/imagination/pvr_hwrt.c      | 168 +++++++++++++++++++++++++++++
>  5 files changed, 529 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/igt_pvr.c b/lib/igt_pvr.c
> index b97349044..4400b1e70 100644
> --- a/lib/igt_pvr.c
> +++ b/lib/igt_pvr.c
> @@ -24,19 +24,21 @@
>   */
>  
>  /**
> - * igt_pvr_ioctl_create_bo:
> + * igt_pvr_ioctl_create_bo_ex:
>   * @fd: The file descriptor of the DRM device.
>   * @size: On entry, the requested size of the buffer object. On return, the
>   *        actual size of the buffer object.
> + * @flags: Flags to control the behaviour of the buffer object.
>   *
>   * Function to create a buffer object.
>   *
>   * Returns: The handle of the created buffer object.
>   */
> -uint32_t igt_pvr_ioctl_create_bo(int fd, size_t *size)
> +uint32_t igt_pvr_ioctl_create_bo_ex(int fd, size_t *size, uint64_t flags)
>  {
>  	struct drm_pvr_ioctl_create_bo_args arg = {
>  		.size = *size,
> +		.flags = flags,
>  	};
>  
>  	do_ioctl(fd, DRM_IOCTL_PVR_CREATE_BO, &arg);
> @@ -47,6 +49,21 @@ uint32_t igt_pvr_ioctl_create_bo(int fd, size_t *size)
>  	return arg.handle;
>  }
>  
> +/**
> + * igt_pvr_ioctl_create_bo:
> + * @fd: The file descriptor of the DRM device.
> + * @size: On entry, the requested size of the buffer object. On return, the
> + *        actual size of the buffer object.
> + *
> + * Function to create a buffer object with default flags.
> + *
> + * Returns: The handle of the created buffer object.
> + */
> +uint32_t igt_pvr_ioctl_create_bo(int fd, size_t *size)
> +{
> +	return igt_pvr_ioctl_create_bo_ex(fd, size,
> +					  DRM_PVR_BO_ALLOW_CPU_USERSPACE_ACCESS);
> +}
>  
>  /**
>   * igt_pvr_ioctl_get_bo_mmap_offset:
> @@ -135,6 +152,27 @@ igt_pvr_get_heap_info(int fd, uint32_t *array_len_out)
>  	return heaps;
>  }
>  
> +/**
> + * igt_pvr_find_general_heap:
> + * @fd: The file descriptor of the DRM device.
> + * 

Remove space after '*'

> + * Function to find the general heap of the device.
> + *
> + * Returns: The drm_pvr_heap structure representing the general heap.
> + */
> +struct drm_pvr_heap igt_pvr_find_general_heap(int fd)
> +{
> +	struct drm_pvr_heap *heaps = igt_pvr_get_heap_info(fd, NULL);
> +	struct drm_pvr_heap general_heap;
> +
> +	igt_assert(heaps);
> +
> +	general_heap = heaps[DRM_PVR_HEAP_GENERAL];
> +	free(heaps);
> +
> +	return general_heap;
> +}
> +
>  /**
>   * igt_pvr_get_static_data_areas:
>   * @fd: The file descriptor of the DRM device.
> @@ -207,3 +245,91 @@ void igt_pvr_ioctl_destroy_vm_context(int fd, uint32_t handle, int expect_err)
>  	else
>  		do_ioctl(fd, DRM_IOCTL_PVR_DESTROY_VM_CONTEXT, &args);
>  }
> +
> +/**
> + * igt_pvr_ioctl_vm_map:
> + * @fd: The file descriptor of the DRM device.
> + * @vm_ctx_handle: The handle of the VM context.
> + * @handle: The handle of the target buffer object to map.
> + * @device_addr: Requested virtual address in the device's address space.
> + * @offset: The offset within the buffer object.
> + * @size: The size of the mapping.
> + *
> + * Function to map a buffer object into a VM context.
> + */
> +void igt_pvr_ioctl_vm_map(int fd, uint32_t vm_ctx_handle, uint32_t handle,
> +			  uint64_t device_addr, uint64_t offset, uint64_t size)
> +{
> +	struct drm_pvr_ioctl_vm_map_args arg = {
> +		.vm_context_handle = vm_ctx_handle,
> +		.flags = 0,
> +		.device_addr = device_addr,
> +		.handle = handle,
> +		.offset = offset,
> +		.size = size,
> +	};
> +
> +	do_ioctl(fd, DRM_IOCTL_PVR_VM_MAP, &arg);
> +}
> +
> +/**
> + * igt_pvr_ioctl_vm_unmap:
> + * @fd: The file descriptor of the DRM device.
> + * @vm_ctx_handle: The handle of the VM context.
> + * @device_addr: The device virtual address of the mapping to unmap.
> + * @size: The size of the mapping.
> + *
> + * Function to unmap a buffer object from a VM context.
> + */
> +void igt_pvr_ioctl_vm_unmap(int fd, uint32_t vm_ctx_handle,
> +			    uint64_t device_addr, uint64_t size)
> +{
> +	struct drm_pvr_ioctl_vm_unmap_args arg = {
> +		.vm_context_handle = vm_ctx_handle,
> +		.device_addr = device_addr,
> +		.size = size,
> +	};
> +
> +	do_ioctl(fd, DRM_IOCTL_PVR_VM_UNMAP, &arg);
> +}
> +
> +/**
> + * igt_pvr_ioctl_create_free_list:
> + * @fd: The file descriptor of the DRM device.
> + * @vm_ctx_handle: The handle of the VM context.
> + * @gpu_addr: The GPU address for the free list.
> + *
> + * Function to create a free list.
> + */
> +uint32_t igt_pvr_ioctl_create_free_list(int fd, uint32_t vm_ctx_handle,
> +					uint64_t gpu_addr)
> +{
> +	struct drm_pvr_ioctl_create_free_list_args create_free_list_args = {
> +		.free_list_gpu_addr = gpu_addr,
> +		.initial_num_pages = 64,
> +		.max_num_pages = 256,
> +		.grow_num_pages = 16,
> +		.grow_threshold = 50,
> +		.vm_context_handle = vm_ctx_handle,
> +	};
> +
> +	do_ioctl(fd, DRM_IOCTL_PVR_CREATE_FREE_LIST, &create_free_list_args);
> +
> +	return create_free_list_args.handle;
> +}
> +
> +/**
> + * igt_pvr_ioctl_destroy_free_list:
> + * @fd: The file descriptor of the DRM device.
> + * @free_list_handle: The handle of the free list to destroy.
> + *
> + * Function to destroy a free list.
> + */
> +void igt_pvr_ioctl_destroy_free_list(int fd, uint32_t free_list_handle)
> +{
> +	struct drm_pvr_ioctl_destroy_free_list_args destroy_free_list_args = {
> +		.handle = free_list_handle,
> +	};
> +
> +	do_ioctl(fd, DRM_IOCTL_PVR_DESTROY_FREE_LIST, &destroy_free_list_args);
> +}
> diff --git a/lib/igt_pvr.h b/lib/igt_pvr.h
> index 871c8a48e..744d7c12f 100644
> --- a/lib/igt_pvr.h
> +++ b/lib/igt_pvr.h
> @@ -11,17 +11,30 @@
>  #include "pvr_drm.h"
>  
>  uint32_t igt_pvr_ioctl_create_bo(int fd, size_t *size);
> +uint32_t igt_pvr_ioctl_create_bo_ex(int fd, size_t *size, uint64_t flags);
>  off_t igt_pvr_ioctl_get_bo_mmap_offset(int fd, uint32_t handle);
>  
>  struct drm_pvr_ioctl_dev_query_args
>  igt_pvr_ioctl_dev_query(int fd, enum drm_pvr_dev_query type, uint64_t size,
>  			void *pointer, int expect_err);
> +
>  struct drm_pvr_heap *
>  igt_pvr_get_heap_info(int fd, uint32_t *array_len_out);
> +struct drm_pvr_heap igt_pvr_find_general_heap(int fd);
> +
>  struct drm_pvr_static_data_area *
>  igt_pvr_get_static_data_areas(int fd, uint32_t *array_len_out);
>  
>  uint32_t igt_pvr_ioctl_create_vm_context(int fd, int expect_err);
>  void igt_pvr_ioctl_destroy_vm_context(int fd, uint32_t handle, int expect_err);
>  
> +void igt_pvr_ioctl_vm_map(int fd, uint32_t vm_ctx_handle, uint32_t handle,
> +			  uint64_t device_addr, uint64_t offset, uint64_t size);
> +void igt_pvr_ioctl_vm_unmap(int fd, uint32_t vm_ctx_handle,
> +			    uint64_t device_addr, uint64_t size);
> +
> +uint32_t igt_pvr_ioctl_create_free_list(int fd, uint32_t vm_ctx_handle,
> +					uint64_t gpu_addr);
> +void igt_pvr_ioctl_destroy_free_list(int fd, uint32_t free_list_handle);
> +
>  #endif /* IGT_PVR_H */
> diff --git a/tests/imagination/meson.build b/tests/imagination/meson.build
> index ffacce1fb..69ef0a8c6 100644
> --- a/tests/imagination/meson.build
> +++ b/tests/imagination/meson.build
> @@ -1,7 +1,9 @@
>  pvr_progs = [ 'pvr_dev_query',
> +	      'pvr_free_list',
>  	      'pvr_gem',
>  	      'pvr_gpu_info',
>  	      'pvr_heap_info',
> +	      'pvr_hwrt',
>  	      'pvr_vm_context',
>  	    ]
>  
> diff --git a/tests/imagination/pvr_free_list.c b/tests/imagination/pvr_free_list.c
> new file mode 100644
> index 000000000..9784e4120
> --- /dev/null
> +++ b/tests/imagination/pvr_free_list.c
> @@ -0,0 +1,218 @@
> +// SPDX-License-Identifier: GPL-2.0 or MIT
> +/* Copyright (c) 2026 Imagination Technologies Ltd. All Rights Reserved */
> +
> +#include <errno.h>
> +#include <stdbool.h>
> +#include <stdint.h>
> +
> +#include "igt.h"
> +#include "igt_pvr.h"
> +
> +#include "pvr_drm.h"
> +
> +#define INVALID_ADDRESS 0xdeadbee0
> +#define INVALID_HANDLE 0
> +
> +static void build_create_free_list_args(

Please do not end line with '(' and add at least one parameter after.
This is static function so you can name it short.
Do you have other list args, other than 'free'?

> +	struct drm_pvr_ioctl_create_free_list_args *create_free_list_args,
> +	uint32_t vm_ctx_handle,

Then align to first param above.

> +	uint64_t gpu_addr)
> +{
> +	memset(create_free_list_args, 0, sizeof(*create_free_list_args));
> +	create_free_list_args->free_list_gpu_addr = gpu_addr;
> +	create_free_list_args->initial_num_pages = 32;
> +	create_free_list_args->max_num_pages = 256;
> +	create_free_list_args->grow_num_pages = 16;
> +	create_free_list_args->grow_threshold = 50;
> +	create_free_list_args->vm_context_handle = vm_ctx_handle;
> +}
> +
> +static void build_destroy_free_list_args(

Same here, do not end line with '('

> +	struct drm_pvr_ioctl_destroy_free_list_args *destroy_free_list_args,
> +	uint32_t handle)
> +{
> +	memset(destroy_free_list_args, 0, sizeof(*destroy_free_list_args));
> +	destroy_free_list_args->handle = handle;
> +}
> +
> +int igt_main()
> +{
> +	struct drm_pvr_ioctl_create_free_list_args create_free_list_args;
> +	struct drm_pvr_ioctl_destroy_free_list_args destroy_free_list_args;
> +	uint64_t gem_obj_gpu_addr;
> +	uint32_t gem_obj_handle;
> +	uint32_t vm_ctx_handle;
> +	size_t size = 4096;
> +	int fd;
> +
> +	igt_fixture()
> +	{
> +		struct drm_pvr_heap general_heap_info;
> +
> +		fd = drm_open_driver(DRIVER_POWERVR);
> +		vm_ctx_handle = igt_pvr_ioctl_create_vm_context(fd, 0);
> +		gem_obj_handle =
> +			igt_pvr_ioctl_create_bo_ex(fd, &size,
> +						   DRM_PVR_BO_PM_FW_PROTECT);
> +		general_heap_info = igt_pvr_find_general_heap(fd);
> +		gem_obj_gpu_addr = general_heap_info.base;
> +
> +		igt_pvr_ioctl_vm_map(fd, vm_ctx_handle, gem_obj_handle,
> +				     gem_obj_gpu_addr, 0, size);
> +	}
> +
> +	igt_describe("Test valid free list creation and destruction");
> +	igt_subtest("create-free-list")
> +	{
> +		build_create_free_list_args(&create_free_list_args,
> +					    vm_ctx_handle, gem_obj_gpu_addr);
> +		do_ioctl(fd, DRM_IOCTL_PVR_CREATE_FREE_LIST,
> +			 &create_free_list_args);
> +
> +		igt_assert_neq(create_free_list_args.handle, 0);
> +
> +		build_destroy_free_list_args(&destroy_free_list_args,
> +					     create_free_list_args.handle);
> +		do_ioctl(fd, DRM_IOCTL_PVR_DESTROY_FREE_LIST,
> +			 &destroy_free_list_args);
> +	}
> +
> +	igt_describe("Test free list destruction with bad padding");
> +	igt_subtest("destroy-free-list-bad-padding")
> +	{
> +		build_create_free_list_args(&create_free_list_args,
> +					    vm_ctx_handle, gem_obj_gpu_addr);
> +		do_ioctl(fd, DRM_IOCTL_PVR_CREATE_FREE_LIST,
> +			 &create_free_list_args);
> +
> +		igt_assert_neq(create_free_list_args.handle, 0);
> +
> +		build_destroy_free_list_args(&destroy_free_list_args,
> +					     create_free_list_args.handle);
> +		destroy_free_list_args._padding_4 = 1;
> +		do_ioctl_err(fd, DRM_IOCTL_PVR_DESTROY_FREE_LIST,
> +			     &destroy_free_list_args, EINVAL);
> +
> +		destroy_free_list_args._padding_4 = 0;
> +		do_ioctl(fd, DRM_IOCTL_PVR_DESTROY_FREE_LIST,
> +			 &destroy_free_list_args);
> +	}
> +
> +	igt_describe("Test creation and destruction of multiple free lists");
> +	igt_subtest("create-multiple-free-lists")
> +	{
> +		uint32_t free_list_handles[2];
> +
> +		build_create_free_list_args(&create_free_list_args,
> +					    vm_ctx_handle, gem_obj_gpu_addr);
> +
> +		do_ioctl(fd, DRM_IOCTL_PVR_CREATE_FREE_LIST,
> +			 &create_free_list_args);
> +		free_list_handles[0] = create_free_list_args.handle;
> +		do_ioctl(fd, DRM_IOCTL_PVR_CREATE_FREE_LIST,
> +			 &create_free_list_args);
> +		free_list_handles[1] = create_free_list_args.handle;
> +
> +		igt_assert_neq(free_list_handles[0], 0);
> +		igt_assert_neq(free_list_handles[1], 0);
> +		igt_assert_neq(free_list_handles[0], free_list_handles[1]);
> +
> +		build_destroy_free_list_args(&destroy_free_list_args,
> +					     free_list_handles[1]);
> +		do_ioctl(fd, DRM_IOCTL_PVR_DESTROY_FREE_LIST,
> +			 &destroy_free_list_args);
> +		build_destroy_free_list_args(&destroy_free_list_args,
> +					     free_list_handles[0]);
> +		do_ioctl(fd, DRM_IOCTL_PVR_DESTROY_FREE_LIST,
> +			 &destroy_free_list_args);
> +	}
> +
> +	igt_describe("Test free list creation with invalid object address");
> +	igt_subtest("invalid-free-list-object-addr")
> +	{
> +		build_create_free_list_args(&create_free_list_args,
> +					    vm_ctx_handle, 0);
> +		do_ioctl_err(fd, DRM_IOCTL_PVR_CREATE_FREE_LIST,
> +			     &create_free_list_args, EINVAL);
> +	}
> +
> +	igt_describe("Test free list creation with initial pages greater than max pages");
> +	igt_subtest("initial-pages-greater-than-max")
> +	{
> +		build_create_free_list_args(&create_free_list_args,
> +					    vm_ctx_handle, gem_obj_gpu_addr);
> +		create_free_list_args.initial_num_pages =
> +			create_free_list_args.max_num_pages + 1;
> +		do_ioctl_err(fd, DRM_IOCTL_PVR_CREATE_FREE_LIST,
> +			     &create_free_list_args, EINVAL);
> +	}
> +
> +	igt_describe("Test free list creation with grow pages greater than max pages");
> +	igt_subtest("grow-pages-greater-than-max")
> +	{
> +		build_create_free_list_args(&create_free_list_args,
> +					    vm_ctx_handle, gem_obj_gpu_addr);
> +		create_free_list_args.grow_num_pages =
> +			create_free_list_args.max_num_pages + 1;
> +		do_ioctl_err(fd, DRM_IOCTL_PVR_CREATE_FREE_LIST,
> +			     &create_free_list_args, EINVAL);
> +	}
> +
> +	igt_describe("Test free list creation with invalid grow threshold");
> +	igt_subtest("invalid-grow-threshold")
> +	{
> +		build_create_free_list_args(&create_free_list_args,
> +					    vm_ctx_handle, gem_obj_gpu_addr);
> +		create_free_list_args.grow_threshold = 101;
> +		do_ioctl_err(fd, DRM_IOCTL_PVR_CREATE_FREE_LIST,
> +			     &create_free_list_args, EINVAL);
> +	}
> +
> +	igt_describe("Test free list creation with zero max pages");
> +	igt_subtest("zero-max-pages")
> +	{
> +		build_create_free_list_args(&create_free_list_args,
> +					    vm_ctx_handle, gem_obj_gpu_addr);
> +		create_free_list_args.initial_num_pages = 0;
> +		create_free_list_args.max_num_pages = 0;
> +		create_free_list_args.grow_num_pages = 0;
> +		do_ioctl_err(fd, DRM_IOCTL_PVR_CREATE_FREE_LIST,
> +			     &create_free_list_args, EINVAL);
> +	}
> +
> +	igt_describe("Test free list creation with zero grow pages and initial pages less than max pages");
> +	igt_subtest("zero-grow-pages-initial-less-than-max")
> +	{
> +		build_create_free_list_args(&create_free_list_args,
> +					    vm_ctx_handle, gem_obj_gpu_addr);
> +		create_free_list_args.grow_num_pages = 0;
> +		do_ioctl_err(fd, DRM_IOCTL_PVR_CREATE_FREE_LIST,
> +			     &create_free_list_args, EINVAL);
> +	}
> +
> +	igt_describe("Test free list creation with zero grow pages and initial pages equal to max pages");
> +	igt_subtest("zero-grow-pages-initial-equals-max")
> +	{
> +		build_create_free_list_args(&create_free_list_args,
> +					    vm_ctx_handle, gem_obj_gpu_addr);
> +		create_free_list_args.initial_num_pages =
> +			create_free_list_args.max_num_pages;
> +		create_free_list_args.grow_num_pages = 0;
> +		do_ioctl(fd, DRM_IOCTL_PVR_CREATE_FREE_LIST,
> +			 &create_free_list_args);
> +
> +		igt_assert_neq(create_free_list_args.handle, 0);
> +
> +		destroy_free_list_args.handle = create_free_list_args.handle;
> +		do_ioctl(fd, DRM_IOCTL_PVR_DESTROY_FREE_LIST,
> +			 &destroy_free_list_args);
> +	}
> +
> +	igt_fixture()
> +	{
> +		igt_pvr_ioctl_vm_unmap(fd, vm_ctx_handle, gem_obj_gpu_addr, size);
> +		gem_close(fd, gem_obj_handle);
> +		igt_pvr_ioctl_destroy_vm_context(fd, vm_ctx_handle, 0);
> +		drm_close_driver(fd);
> +	}
> +}
> diff --git a/tests/imagination/pvr_hwrt.c b/tests/imagination/pvr_hwrt.c
> new file mode 100644
> index 000000000..f7be3c344
> --- /dev/null
> +++ b/tests/imagination/pvr_hwrt.c
> @@ -0,0 +1,168 @@
> +// SPDX-License-Identifier: GPL-2.0 or MIT
> +/* Copyright (c) 2026 Imagination Technologies Ltd. All Rights Reserved */
> +
> +#include <errno.h>
> +#include <stdbool.h>
> +#include <stdint.h>
> +
> +#include "igt.h"
> +#include "igt_pvr.h"
> +
> +#include "pvr_drm.h"
> +
> +#define INVALID_ADDRESS 0xdeadbee0
> +
> +static void build_create_hwrt_args(

Same here, do not end line with '('

> +	struct drm_pvr_ioctl_create_hwrt_dataset_args *create_hwrt_args,
> +	const struct drm_pvr_create_hwrt_geom_data_args *geom_data_args,
> +	const struct drm_pvr_create_hwrt_rt_data_args *rt_data_args,
> +	uint32_t *free_list_handles,
> +	uint32_t num_rt_data,
> +	uint32_t num_free_lists)
> +{
> +	memset(create_hwrt_args, 0, sizeof(*create_hwrt_args));
> +	memcpy(&create_hwrt_args->geom_data_args, geom_data_args,
> +	       sizeof(*geom_data_args));
> +
> +	for (uint32_t i = 0; i < num_rt_data; i++) {
> +		memcpy(&create_hwrt_args->rt_data_args[i], rt_data_args,
> +		       sizeof(*rt_data_args) * num_rt_data);
> +	}
> +
> +	for (uint32_t i = 0; i < num_free_lists; i++)
> +		create_hwrt_args->free_list_handles[i] = free_list_handles[i];
> +
> +	create_hwrt_args->width = 256;
> +	create_hwrt_args->height = 256;
> +	create_hwrt_args->samples = 1;
> +	create_hwrt_args->layers = 1;
> +	create_hwrt_args->region_header_size = 64;
> +}
> +
> +static void build_destroy_hwrt_args(

Same here.

Rest looks good.

Regards,
Kamil

> +	struct drm_pvr_ioctl_destroy_hwrt_dataset_args *destroy_hwrt_args,
> +	uint32_t handle)
> +{
> +	memset(destroy_hwrt_args, 0, sizeof(*destroy_hwrt_args));
> +	destroy_hwrt_args->handle = handle;
> +}
> +
> +int igt_main()
> +{
> +	struct drm_pvr_ioctl_create_hwrt_dataset_args create_hwrt_args;
> +	struct drm_pvr_create_hwrt_geom_data_args geom_data_args = {0};
> +	struct drm_pvr_create_hwrt_rt_data_args rt_data_args[2] = {0};
> +	struct drm_pvr_ioctl_destroy_hwrt_dataset_args destroy_hwrt_args;
> +
> +	const uint32_t num_free_lists =
> +		ARRAY_SIZE(create_hwrt_args.free_list_handles);
> +	uint32_t free_list_handles[num_free_lists];
> +	uint32_t gem_obj_handle;
> +	uint32_t gem_obj_handle_ml;
> +	uint32_t vm_ctx_handle;
> +	const uint32_t num_rt_data = ARRAY_SIZE(create_hwrt_args.rt_data_args);
> +	uint64_t gem_obj_gpu_addr;
> +	uint64_t gem_obj_gpu_addr_ml;
> +	size_t size = 2 << 20;
> +	int fd;
> +
> +	igt_fixture()
> +	{
> +		struct drm_pvr_heap general_heap_info;
> +
> +		fd = drm_open_driver(DRIVER_POWERVR);
> +		general_heap_info = igt_pvr_find_general_heap(fd);
> +		vm_ctx_handle = igt_pvr_ioctl_create_vm_context(fd, 0);
> +
> +		gem_obj_gpu_addr = general_heap_info.base;
> +		gem_obj_handle =
> +			igt_pvr_ioctl_create_bo_ex(fd, &size,
> +						   DRM_PVR_BO_PM_FW_PROTECT);
> +		igt_pvr_ioctl_vm_map(fd, vm_ctx_handle, gem_obj_handle,
> +				     gem_obj_gpu_addr, 0, size);
> +
> +		for (int i = 0; i < num_free_lists; i++)
> +			free_list_handles[i] =
> +				igt_pvr_ioctl_create_free_list(fd,
> +							       vm_ctx_handle,
> +							       gem_obj_gpu_addr);
> +
> +		gem_obj_gpu_addr_ml = general_heap_info.base + size;
> +		gem_obj_handle_ml =
> +			igt_pvr_ioctl_create_bo_ex(fd, &size,
> +						   DRM_PVR_BO_PM_FW_PROTECT);
> +		igt_pvr_ioctl_vm_map(fd, vm_ctx_handle, gem_obj_handle_ml,
> +				     gem_obj_gpu_addr_ml, 0, size);
> +
> +		for (int i = 0; i < num_rt_data; i++)
> +			rt_data_args[i].pm_mlist_dev_addr = gem_obj_gpu_addr_ml;
> +	}
> +
> +	igt_describe("Test valid HWRT creation and destruction");
> +	igt_subtest("create-hwrt")
> +	{
> +		build_create_hwrt_args(&create_hwrt_args, &geom_data_args,
> +				       rt_data_args, free_list_handles,
> +				       num_rt_data, num_free_lists);
> +		do_ioctl(fd, DRM_IOCTL_PVR_CREATE_HWRT_DATASET, &create_hwrt_args);
> +
> +		igt_assert_neq(create_hwrt_args.handle, 0);
> +
> +		build_destroy_hwrt_args(&destroy_hwrt_args, create_hwrt_args.handle);
> +		do_ioctl(fd, DRM_IOCTL_PVR_DESTROY_HWRT_DATASET, &destroy_hwrt_args);
> +	}
> +
> +	igt_describe("Test HWRT creation with bad padding");
> +	igt_subtest("destroy-hwrt-bad-padding")
> +	{
> +		build_create_hwrt_args(&create_hwrt_args, &geom_data_args,
> +				       rt_data_args, free_list_handles,
> +				       num_rt_data, num_free_lists);
> +		do_ioctl(fd, DRM_IOCTL_PVR_CREATE_HWRT_DATASET, &create_hwrt_args);
> +
> +		igt_assert_neq(create_hwrt_args.handle, 0);
> +
> +		build_destroy_hwrt_args(&destroy_hwrt_args, create_hwrt_args.handle);
> +		destroy_hwrt_args._padding_4 = 1;
> +		do_ioctl_err(fd, DRM_IOCTL_PVR_DESTROY_HWRT_DATASET, &destroy_hwrt_args,
> +			     EINVAL);
> +
> +		destroy_hwrt_args._padding_4 = 0;
> +		do_ioctl(fd, DRM_IOCTL_PVR_DESTROY_HWRT_DATASET, &destroy_hwrt_args);
> +	}
> +
> +	igt_describe("Test HWRT creation with invalid free list handle");
> +	igt_subtest("invalid-free-list-handle")
> +	{
> +		build_create_hwrt_args(&create_hwrt_args, &geom_data_args,
> +				       rt_data_args, free_list_handles,
> +				       num_rt_data, num_free_lists);
> +		create_hwrt_args.free_list_handles[0] = INVALID_ADDRESS;
> +		do_ioctl_err(fd, DRM_IOCTL_PVR_CREATE_HWRT_DATASET,
> +			     &create_hwrt_args, EINVAL);
> +	}
> +
> +	igt_describe("Test HWRT creation with missing free list");
> +	igt_subtest("missing-free-list")
> +	{
> +		build_create_hwrt_args(&create_hwrt_args, &geom_data_args,
> +				       rt_data_args, free_list_handles,
> +				       num_rt_data, num_free_lists);
> +		create_hwrt_args.free_list_handles[0] = 0;
> +		do_ioctl_err(fd, DRM_IOCTL_PVR_CREATE_HWRT_DATASET,
> +			     &create_hwrt_args, EINVAL);
> +	}
> +
> +	igt_fixture()
> +	{
> +		for (int i = 0; i < num_free_lists; i++)
> +			igt_pvr_ioctl_destroy_free_list(fd, free_list_handles[i]);
> +
> +		igt_pvr_ioctl_vm_unmap(fd, vm_ctx_handle, gem_obj_gpu_addr,
> +				       size);
> +		gem_close(fd, gem_obj_handle);
> +		igt_pvr_ioctl_destroy_vm_context(fd, vm_ctx_handle, 0);
> +
> +		drm_close_driver(fd);
> +	}
> +}
> 
> -- 
> 2.43.0
> 
