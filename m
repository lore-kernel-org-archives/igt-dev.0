Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E4B9C9830B
	for <igt-dev@archiver.kernel.org>; Wed, 23 Sep 2026 15:09:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 435DB10E158;
	Wed, 23 Sep 2026 15:09:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mFzfG0u8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95DF910E158
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Sep 2026 15:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790176107; x=1821712107;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=arfZkzZJ54CInjqqiKZzvHBOdDV1ZHmS3vlj4WUcess=;
 b=mFzfG0u88xhXypY9QZ2Z6kkxD2XydaxUlSLIlGHFb6EyaPQbUOcEwfhb
 XvorttjCR5FJ8bWOF+TPhmB+GApOLaLK+e/8Kk8oYEis21KtLlBoE5FWc
 TRcRcxUMkNmSQ0RgbxFmiuF+vdU6qf6k9an5oQcPRV9sDUMTrtvTYJ84x
 0mhmrvCjVYRkGGZhKXtqzgrtsgv82u92WJdEdOMO5t2eJJUQuSKhO77lF
 TrFbQJMlQPpBNmhK+Y56IhyqWgGjcCILKM6tzXQnnSyqiDWpHTZBV38gu
 PQGIDAmAinFDIXH1iliwiutyMv7L9+izBUSdKKdHkXYvC0OTjyRfcvJ12 w==;
X-CSE-ConnectionGUID: 8WKBKJrxSFi73YWm7IRl0w==
X-CSE-MsgGUID: qvknTAURR9y7138i2w1eOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="1395980"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="1395980"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 08:08:27 -0700
X-CSE-ConnectionGUID: +2BZFusqSoW2q7y6aGD1gw==
X-CSE-MsgGUID: EhN+HYBMTD+hmmJNGM2ZRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; d="scan'208";a="278373687"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 08:08:24 -0700
Date: Wed, 23 Sep 2026 17:08:22 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Robert Mazur <robert.mazur@imgtec.com>
Cc: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>, 
 Alessio Belle <alessio.belle@imgtec.com>,
 Brajesh Gupta <brajesh.gupta@imgtec.com>,
 Luigi Santivetti <luigi.santivetti@imgtec.com>
Subject: Re: [PATCH i-g-t v3 2/3] lib/imagination: add GPU memory allocation
 helpers
Message-ID: <20260923150822.s3vlxlifaukxvi3u@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Robert Mazur <robert.mazur@imgtec.com>,
 Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>,
 Alessio Belle <alessio.belle@imgtec.com>,
 Brajesh Gupta <brajesh.gupta@imgtec.com>,
 Luigi Santivetti <luigi.santivetti@imgtec.com>
References: <20260923-b4-imagination-submit-test-v3-0-d70b50b54cdb@imgtec.com>
 <20260923-b4-imagination-submit-test-v3-2-d70b50b54cdb@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260923-b4-imagination-submit-test-v3-2-d70b50b54cdb@imgtec.com>
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
On 2026-09-23 at 15:01:50 +0200, Robert Mazur wrote:
> Add helper functions for allocating and mapping GPU memory objects.
> 
> The helpers manage virtual address allocation and tracking of mapped
> objects, and provide cleanup of all allocations and mappings at the
> end of a test.
> 
> This simplifies test code and ensures consistent resource management.
> 
> Signed-off-by: Robert Mazur <robert.mazur@imgtec.com>
LGTM
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  lib/igt_pvr.c | 310 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_pvr.h |  19 ++++
>  2 files changed, 329 insertions(+)
> 
> diff --git a/lib/igt_pvr.c b/lib/igt_pvr.c
> index f05f23057..a28b11f92 100644
> --- a/lib/igt_pvr.c
> +++ b/lib/igt_pvr.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0 or MIT
>  /* Copyright (c) 2026 Imagination Technologies Ltd. All Rights Reserved */
>  
> +#include <inttypes.h>
>  #include <limits.h>
>  #include <stddef.h>
>  #include <stdint.h>
> @@ -13,6 +14,8 @@
>  
>  #include "pvr_drm.h"
>  
> +#define POWERVR_GPU_PAGE_SIZE 4096
> +
>  /**
>   * SECTION:igt_pvr
>   * @short_description: PowerVR support library
> @@ -334,6 +337,313 @@ void igt_pvr_ioctl_destroy_free_list(int fd, uint32_t free_list_handle)
>  	do_ioctl(fd, DRM_IOCTL_PVR_DESTROY_FREE_LIST, &destroy_free_list_args);
>  }
>  
> +struct heap_allocator {
> +	uint64_t base;
> +	uint64_t size;
> +	uint64_t offset;
> +};
> +
> +/**
> + * igt_pvr_init_heap_allocator:
> + * @allocator: Heap allocator to initialize.
> + * @heap: Heap information.
> + *
> + * Function to initialize heap allocator using information from the kernel.
> + */
> +static void init_heap_allocator(struct heap_allocator *allocator, struct drm_pvr_heap *heap)
> +{
> +	igt_log("igt-pvr", IGT_LOG_DEBUG,
> +		"Initializing heap allocator: base=0x%llx, size=%llu\n", heap->base, heap->size);
> +	allocator->base = heap->base;
> +	allocator->size = heap->size;
> +	allocator->offset = 0;
> +}
> +
> +/*
> + * Common allocators for all vm contexts in the application
> + * This implies no overlap in virtual address between different vm contexts.
> + */
> +
> +static struct heap_allocator heap_allocators[DRM_PVR_HEAP_COUNT];
> +
> +/**
> + * igt_pvr_init_heap_allocators:
> + * @fd: The file descriptor of the DRM device.
> + *
> + * Function to initialize heap allocators using information retrieved from the kernel.
> + *
> + * Returns: 0 on success, -1 on failure.
> + */
> +static int igt_pvr_init_heap_allocators(int fd)
> +{
> +	uint32_t heap_count;
> +	struct drm_pvr_heap *heaps = igt_pvr_get_heap_info(fd, &heap_count);
> +
> +	igt_assert(heap_count == DRM_PVR_HEAP_COUNT);
> +
> +	for (int i = 0; i < heap_count; i++) {
> +		struct drm_pvr_heap *heap_info = &heaps[i];
> +
> +		if (heap_info)
> +			init_heap_allocator(&heap_allocators[i], heap_info);
> +		else
> +			return -1; // Failed to get heap info
> +	}
> +	return 0;
> +}
> +
> +/**
> + * allocate_from_heap:
> + * @heap_index: Index of the heap to allocate from.
> + * @size: Size of the allocation.
> + *
> + * Function to allocate address range from a specific heap.
> + *
> + * Returns: Allocated GPU address on success, 0 on failure.
> + */
> +static uint64_t allocate_from_heap(uint32_t heap_index, uint64_t size)
> +{
> +	struct heap_allocator *allocator;
> +	uint64_t allocatedAddress;
> +
> +	if (heap_index >= DRM_PVR_HEAP_COUNT) {
> +		igt_log("igt-pvr", IGT_LOG_CRITICAL,
> +			"Error: Invalid heap index %u. Must be between 0 and %u.\n",
> +			heap_index, DRM_PVR_HEAP_COUNT - 1);
> +		return 0; // Invalid heap index
> +	}
> +	size = ALIGN(size, POWERVR_GPU_PAGE_SIZE);
> +	allocator = &heap_allocators[heap_index];
> +	if (allocator->offset + size > allocator->size) {
> +		igt_log("igt-pvr", IGT_LOG_CRITICAL,
> +			"Error: Not enough space in heap %u. Requested size: %" PRIu64 ", Available size: %" PRIu64 ".\n",
> +			heap_index, size, allocator->size - allocator->offset);
> +		return 0; // Not enough space
> +	}
> +	allocatedAddress = allocator->base + allocator->offset;
> +	allocator->offset += size;
> +	igt_log("igt-pvr", IGT_LOG_DEBUG,
> +		"Allocated %" PRIu64 " bytes from heap %u. Allocated address: 0x%" PRIx64 ", New offset: 0x%" PRIx64 ".\n",
> +		size, heap_index, allocatedAddress, allocator->offset);
> +	return allocatedAddress;
> +}
> +
> +#define MAX_ALLOCATIONS 1024
> +
> +/**
> + * struct igt_pvr_allocations:
> + * @allocations: Array of allocations.
> + * @count: Number of allocations.
> + *
> + * Structure to keep track of all allocations.
> + */
> +struct igt_pvr_allocations {
> +	struct igt_pvr_allocation allocations[MAX_ALLOCATIONS];
> +	uint32_t count;
> +} igt_pvr_allocations;
> +
> +/**
> + * get_allocation:
> + *
> + * Function to get a new allocation structure from the global allocations array.
> + *
> + * Returns: Pointer to the empty allocation structure.
> + */
> +static struct igt_pvr_allocation *get_allocation(void)
> +{
> +	struct igt_pvr_allocation *alloc;
> +
> +	if (igt_pvr_allocations.count >= MAX_ALLOCATIONS) {
> +		igt_log("igt-pvr", IGT_LOG_CRITICAL,
> +			"Error: Maximum number of allocations reached (%d).\n", MAX_ALLOCATIONS);
> +		igt_assert(0); // Max allocations reached
> +	}
> +	alloc = &igt_pvr_allocations.allocations[igt_pvr_allocations.count++];
> +	alloc->bo_handle = 0;
> +	alloc->size = 0;
> +	alloc->cpu_addr = NULL;
> +	alloc->gpu_addr = 0;
> +	return alloc;
> +}
> +
> +/**
> + * igt_pvr_init_allocators:
> + * @fd: The file descriptor of the DRM device.
> + *
> + * Function to initialize heap allocators and reset the global allocations array.
> + */
> +void igt_pvr_init_allocators(int fd)
> +{
> +	igt_pvr_init_heap_allocators(fd);
> +	igt_pvr_allocations.count = 0;
> +}
> +
> +/**
> + * igt_pvr_allocate_addr:
> + * @fd: The file descriptor of the DRM device.
> + * @vm_ctx: The virtual memory context.
> + * @size: The size of the allocation.
> + * @flags: Allocation flags.
> + * @gpu_addr: The GPU address for the allocation.
> + *
> + * Function to allocate and map GPU memory at a specific address.
> + *
> + * Returns: Pointer to the allocation structure.
> + */
> +struct igt_pvr_allocation *igt_pvr_allocate_addr(int fd, uint32_t vm_ctx, size_t size,
> +						 uint64_t flags, uint64_t gpu_addr)
> +{
> +	struct igt_pvr_allocation *alloc = get_allocation();
> +	size_t out_size = size;
> +
> +	alloc->gpu_addr = gpu_addr;
> +	igt_assert(alloc->gpu_addr != 0);
> +
> +	alloc->bo_handle = igt_pvr_ioctl_create_bo_ex(fd, &out_size, flags);
> +	igt_assert(alloc->bo_handle);
> +
> +	igt_pvr_ioctl_vm_map(fd, vm_ctx, alloc->bo_handle, alloc->gpu_addr, 0, size);
> +
> +	alloc->size = size;
> +	alloc->vm_ctx = vm_ctx;
> +
> +	return alloc;
> +}
> +
> +/**
> + * igt_pvr_allocate:
> + * @fd: The file descriptor of the DRM device.
> + * @vm_ctx: The virtual memory context.
> + * @size: The size of the allocation.
> + * @flags: Allocation flags.
> + * @heap_index: The index of the heap to allocate from.
> + *
> + * Function to allocate and map GPU memory from a specific heap.
> + *
> + * Returns: Pointer to the allocation structure.
> + */
> +struct igt_pvr_allocation *igt_pvr_allocate(int fd, uint32_t vm_ctx, size_t size, uint64_t flags,
> +					    uint32_t heap_index)
> +{
> +	return igt_pvr_allocate_addr(fd, vm_ctx, size, flags, allocate_from_heap(heap_index, size));
> +}
> +
> +/**
> + * igt_pvr_allocate_general:
> + * @fd: The file descriptor of the DRM device.
> + * @vm_ctx: The virtual memory context.
> + * @size: The size of the allocation.
> + *
> + * Function to allocate and map GPU memory from the general heap.
> + *
> + * Returns: Pointer to the allocation structure.
> + */
> +struct igt_pvr_allocation *igt_pvr_allocate_general(int fd, uint32_t vm_ctx, size_t size)
> +{
> +	return igt_pvr_allocate(fd, vm_ctx, size,
> +				DRM_PVR_BO_ALLOW_CPU_USERSPACE_ACCESS |
> +				DRM_PVR_BO_BYPASS_DEVICE_CACHE,
> +				DRM_PVR_HEAP_GENERAL);
> +}
> +
> +/**
> + * igt_pvr_get_cpu_addr:
> + * @fd: The file descriptor of the DRM device.
> + * @alloc: The allocation structure.
> + *
> + * Function to get the CPU address of the allocation.
> + * If the CPU address is not already mapped, it will be mapped using mmap.
> + *
> + * Returns: Pointer to the CPU address.
> + */
> +void *igt_pvr_get_cpu_addr(int fd, struct igt_pvr_allocation *alloc)
> +{
> +	igt_assert(alloc);
> +	igt_assert(alloc->bo_handle != 0);
> +	igt_assert(alloc->size != 0);
> +	if (!alloc->cpu_addr) {
> +		off_t mmap_offset = igt_pvr_ioctl_get_bo_mmap_offset(fd, alloc->bo_handle);
> +
> +		alloc->cpu_addr = mmap(NULL, alloc->size, PROT_READ | PROT_WRITE, MAP_SHARED,
> +				       fd, mmap_offset);
> +		igt_assert(alloc->cpu_addr != MAP_FAILED);
> +	}
> +	return alloc->cpu_addr;
> +}
> +
> +/**
> + * igt_pvr_get_gpu_addr:
> + * @alloc: The allocation structure.
> + *
> + * Function to get the GPU virtual address of the allocation.
> + *
> + * Returns: The GPU virtual address.
> + */
> +uint64_t igt_pvr_get_gpu_addr(struct igt_pvr_allocation *alloc)
> +{
> +	igt_assert(alloc);
> +	igt_assert(alloc->gpu_addr != 0);
> +	return alloc->gpu_addr;
> +}
> +
> +/**
> + * igt_pvr_get_size:
> + * @alloc: The allocation structure.
> + *
> + * Function to get the size of the allocation.
> + *
> + * Returns: The size of the allocation.
> + */
> +size_t igt_pvr_get_size(struct igt_pvr_allocation *alloc)
> +{
> +	igt_assert(alloc);
> +	igt_assert(alloc->size != 0);
> +	return alloc->size;
> +}
> +
> +/**
> + * igt_pvr_free:
> + * @fd: The file descriptor of the DRM device.
> + * @alloc: The allocation structure.
> + *
> + * Function to free the allocation and unmap it from the VM context.
> + */
> +static void igt_pvr_free(int fd, struct igt_pvr_allocation *alloc)
> +{
> +	igt_assert(alloc);
> +	if (alloc->bo_handle == 0)
> +		return;
> +
> +	if (alloc->cpu_addr) {
> +		munmap(alloc->cpu_addr, alloc->size);
> +		alloc->cpu_addr = NULL;
> +	}
> +	igt_pvr_ioctl_vm_unmap(fd, alloc->vm_ctx, alloc->gpu_addr, alloc->size);
> +	gem_close(fd, alloc->bo_handle);
> +
> +	alloc->bo_handle = 0;
> +	alloc->size = 0;
> +	alloc->gpu_addr = 0;
> +	alloc->vm_ctx = 0;
> +}
> +
> +/**
> + * igt_pvr_free_all:
> + * @fd: The file descriptor of the DRM device.
> + *
> + * Function to free all allocations.
> + */
> +void igt_pvr_free_all(int fd)
> +{
> +	for (uint32_t i = 0; i < igt_pvr_allocations.count; i++) {
> +		struct igt_pvr_allocation *alloc = &igt_pvr_allocations.allocations[i];
> +
> +		if (alloc->bo_handle != 0)
> +			igt_pvr_free(fd, alloc);
> +	}
> +	igt_pvr_allocations.count = 0;
> +}
> +
>  /**
>   * igt_pvr_get_device_info:
>   * @fd: The file descriptor of the DRM device.
> diff --git a/lib/igt_pvr.h b/lib/igt_pvr.h
> index 214a429ab..aa022c158 100644
> --- a/lib/igt_pvr.h
> +++ b/lib/igt_pvr.h
> @@ -11,6 +11,14 @@
>  #include "imagination/pvr_device_info.h"
>  #include "pvr_drm.h"
>  
> +struct igt_pvr_allocation {
> +	uint32_t bo_handle;
> +	size_t size;
> +	void *cpu_addr;
> +	uint64_t gpu_addr;
> +	uint32_t vm_ctx;
> +};
> +
>  uint32_t igt_pvr_ioctl_create_bo(int fd, size_t *size);
>  uint32_t igt_pvr_ioctl_create_bo_ex(int fd, size_t *size, uint64_t flags);
>  off_t igt_pvr_ioctl_get_bo_mmap_offset(int fd, uint32_t handle);
> @@ -38,6 +46,17 @@ uint32_t igt_pvr_ioctl_create_free_list(int fd, uint32_t vm_ctx_handle,
>  					uint64_t gpu_addr);
>  void igt_pvr_ioctl_destroy_free_list(int fd, uint32_t free_list_handle);
>  
> +void igt_pvr_init_allocators(int fd);
> +struct igt_pvr_allocation *igt_pvr_allocate_addr(int fd, uint32_t vm_ctx, size_t size,
> +						 uint64_t flags, uint64_t gpu_addr);
> +struct igt_pvr_allocation *igt_pvr_allocate(int fd, uint32_t vm_ctx, size_t size, uint64_t flags,
> +					    uint32_t heap_index);
> +struct igt_pvr_allocation *igt_pvr_allocate_general(int fd, uint32_t vm_ctx, size_t size);
> +void *igt_pvr_get_cpu_addr(int fd, struct igt_pvr_allocation *alloc);
> +uint64_t igt_pvr_get_gpu_addr(struct igt_pvr_allocation *alloc);
> +size_t igt_pvr_get_size(struct igt_pvr_allocation *alloc);
> +void igt_pvr_free_all(int fd);
> +
>  struct pvr_device_info *igt_pvr_get_device_info(int fd);
>  
>  #endif /* IGT_PVR_H */
> 
> -- 
> 2.43.0
> 
