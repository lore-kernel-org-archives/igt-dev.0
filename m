Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F5DAC021AD
	for <igt-dev@archiver.kernel.org>; Thu, 20 Feb 2025 07:15:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C1D910E0AD;
	Thu, 20 Feb 2025 07:15:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zkg95Izf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0531910E0AD
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Feb 2025 07:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740035720; x=1771571720;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=F5LoaAfWnLWFhfubbwMSEhqrvu1O3DPBD5vjdp0BXxc=;
 b=Zkg95IzfSM/tQtJ8TfBlXRoya5G3GRKYXCgF7/Omn+vjHpj1n8Phxyu2
 i9jnECHgdjeIzcl7iQ1HUAx6B9+3sCPET7jSoezZgNhCr8SDXX9jNSwsn
 i2Ojg12gca8F2rsEGxsvRlZyVrmutiqpGU2vKE2++4oSNKeFeQCjuNLyF
 UdCKwl14JX2ULntMlVZ714gd7xOqrIw0mcHZN8YTI0xzMbJ6C/EKX3Sag
 +bxJB6zgIsB4AAKxy58CSsZG1zKcC7SnEu/9bmvc5vVnly95xsonq1hfR
 v9/oFLp0hS2TIi4dJBTa63LnU/gZ82GaUDLHQmgqH53geae7m69n151hs g==;
X-CSE-ConnectionGUID: GbMUCruBRCyF1rY41GyWlQ==
X-CSE-MsgGUID: WTisr6RyT1+9ixyWTs6eew==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="41059153"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; d="scan'208";a="41059153"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 23:15:20 -0800
X-CSE-ConnectionGUID: DCKCjZkwQuyTJ9uGX94scg==
X-CSE-MsgGUID: XpKJaVcIRO+MorDeOaPcMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; d="scan'208";a="114939624"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.190])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 23:15:17 -0800
Date: Thu, 20 Feb 2025 08:15:13 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Oak Zeng <oak.zeng@intel.com>
Cc: igt-dev@lists.freedesktop.org, Thomas.Hellstrom@linux.intel.com,
 matthew.brost@intel.com, kamil.konieczny@intel.com,
 ashutosh.dixit@intel.com, juha-pekka.heikkila@intel.com,
 rodrigo.vivi@intel.com
Subject: Re: [i-g-t v3 2/4] lib/xe/xe_util: Introduce helper functions
Message-ID: <20250220071513.m2ciqo4a36wdjhdy@zkempczy-mobl2>
References: <20250218235755.360264-1-oak.zeng@intel.com>
 <20250218235755.360264-3-oak.zeng@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218235755.360264-3-oak.zeng@intel.com>
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

On Tue, Feb 18, 2025 at 06:57:53PM -0500, Oak Zeng wrote:
> From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> 
> Introduce helper functions for buffer creation, binding,
> destruction and command submission etc. With those helpers,
> writing a xe igt test will be much easier, which will be
> showed in a coming example.
> 
> v2: use to_user_pointer to cast a pointer (Kamil)
>     s/insert_store/xe_insert_store (Kamil)
>     s/cmdbuf_fill_func_t/xe_cmdbuf_fill_func_t (Kamil)
> v3: refactor command buffer fill interface (Zbigniew)
> 
> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  lib/xe/xe_util.c | 239 +++++++++++++++++++++++++++++++++++++++++++++++
>  lib/xe/xe_util.h |  47 ++++++++++
>  2 files changed, 286 insertions(+)
> 
> diff --git a/lib/xe/xe_util.c b/lib/xe/xe_util.c
> index 06b378ce0..891316ecd 100644
> --- a/lib/xe/xe_util.c
> +++ b/lib/xe/xe_util.c
> @@ -13,6 +13,245 @@
>  #include "xe/xe_query.h"
>  #include "xe/xe_util.h"
>  
> +/**
> + * xe_cmdbuf_exec_ufence_gpuva:
> + * @cmdbuf Pointer to the xe_cmdbuf structure representing the command buffer.
> + *
> + * Returns the GPU virtual address of the execution user fence located at the
> + * end of the command buffer.
> + */
> +static uint64_t xe_cmdbuf_exec_ufence_gpuva(struct xe_cmdbuf *cmdbuf)
> +{
> +	/* the last 8 bytes of the cmd buffer is used as ufence */
> +	return cmdbuf->buf.gpu_addr + cmdbuf->buf.size - UFENCE_LENGTH;

I think instead of hardcoding 8 as length of the fence you should use
sizeof() of timeline_value from drm_xe_sync.

> +}
> +
> +/**
> + * xe_cmdbuf_exec_ufence_cpuva:
> + * @cmdbuf Pointer to the xe_cmdbuf structure representing the command buffer.
> + *
> + * Returns the CPU virtual address of the execution user fence located at the
> + * end of the command buffer.
> + */
> +static void *xe_cmdbuf_exec_ufence_cpuva(struct xe_cmdbuf *cmdbuf)
> +{
> +	/* the last 8 bytes of the cmd buffer is used as ufence */
> +	return (char *)cmdbuf->buf.cpu_addr + cmdbuf->buf.size - UFENCE_LENGTH;
> +}
> +
> +
> +/**
> + * __xe_submit_cmd:
> + * @cmdbuf Pointer to the command buffer structure
> + *
> + * Submits a command buffer to the GPU, waits for its completion, and verifies
> + * the user fence value
> + *
> + * Return: The result of waiting for the user fence value
> + */
> +int64_t __xe_submit_cmd(struct xe_cmdbuf *cmdbuf)
> +{
> +	int64_t timeout = NSEC_PER_SEC;
> +	int ret;
> +

You should assert if cmdbuf is null.

> +	struct drm_xe_sync sync[1] = {
> +		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE,
> +			.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +			.timeline_value = USER_FENCE_VALUE,
> +			.addr = xe_cmdbuf_exec_ufence_gpuva(cmdbuf),},
> +	};
> +	struct drm_xe_exec exec = {
> +		.num_batch_buffer = 1,
> +		.num_syncs = 1,
> +		.syncs = to_user_pointer(sync),
> +		.exec_queue_id = cmdbuf->exec_queue,
> +		.address = cmdbuf->buf.gpu_addr,
> +	};
> +
> +	xe_exec(cmdbuf->buf.fd, &exec);

This might assert, shouldn't it be sth like:

ret = __xe_exec(...);
if (ret)
	return ret;

xe_submit_cmd() is asserting, so it might assert from both
reasons - unsuccessful exec or unsuccessful wait.

My personal preference is to not assert in underscore functions
giving caller chance to handle errors. Only exception is to
checking input parameters.

> +	ret = __xe_wait_ufence(cmdbuf->buf.fd,
> +			       (uint64_t *)xe_cmdbuf_exec_ufence_cpuva(cmdbuf),
> +			       USER_FENCE_VALUE, cmdbuf->exec_queue, &timeout);
> +	/* Reset the fence so the exec ufence can be reused */
> +	memset((char *)xe_cmdbuf_exec_ufence_cpuva(cmdbuf), 0, UFENCE_LENGTH);

Cosmetic, please add line before return.

> +	return ret;
> +}
> +
> +/**
> + * xe_submit_cmd:
> + * @cmdbuf Pointer to the command buffer structure
> + *
> + * Wrapper function to submit a command buffer and assert its successful
> + * execution.
> + */
> +void xe_submit_cmd(struct xe_cmdbuf *cmdbuf)
> +{
> +	int64_t ret;
> +

Assert if cmdbuf is not null.

> +	ret = __xe_submit_cmd(cmdbuf);
> +	igt_assert_eq(ret, 0);
> +}
> +
> +/**
> + *xe_create_buffer:
> + * @buffer Pointer to the xe_buf structure containing buffer details.
> + *
> + * Creates a buffer, maps it to both CPU and GPU address spaces, and binds it
> + * to a virtual memory (VM) space.
> + */
> +void xe_create_buffer(struct xe_buf *buffer)
> +{
> +	struct drm_xe_sync sync[1] = {
> +		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE,
> +		  .flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +		  .timeline_value = USER_FENCE_VALUE },
> +	};
> +

Ditto.

This function should check if all necessary fields are set in buffer
structure before proceed - fd, vm, size, placement.
Calling this function on not properly initialized buffer likely will
lead to segfault.

> +	buffer->bind_queue = xe_bind_exec_queue_create(buffer->fd,
> +						       buffer->vm, 0);
> +	buffer->bind_ufence = aligned_alloc(xe_get_default_alignment(buffer->fd),
> +					    PAGE_ALIGN_UFENCE);
> +	sync->addr = to_user_pointer(buffer->bind_ufence);
> +
> +

Unnecessary double newline.

> +	/* create and bind the buffer->bo */
> +	buffer->bo = xe_bo_create(buffer->fd, 0, buffer->size,
> +				  buffer->placement, buffer->flag);
> +	buffer->cpu_addr = xe_bo_map(buffer->fd, buffer->bo, buffer->size);
> +	xe_vm_bind_async(buffer->fd, buffer->vm, buffer->bind_queue,
> +			 buffer->bo, 0, buffer->gpu_addr,
> +			 buffer->size, sync, 1);
> +
> +	xe_wait_ufence(buffer->fd, buffer->bind_ufence,
> +		       USER_FENCE_VALUE, buffer->bind_queue, NSEC_PER_SEC);
> +	memset(buffer->bind_ufence, 0, PAGE_ALIGN_UFENCE);
> +}
> +
> +/**
> + * xe_destroy_buffer:
> + * @buffer Pointer to the xe_buf structure containing buffer details
> + *
> + * Destroys a buffer created by xe_create_buffer and releases associated
> + * resources.
> + */
> +void xe_destroy_buffer(struct xe_buf *buffer)
> +{
> +	struct drm_xe_sync sync[1] = {
> +		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE,
> +		  .flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +		  .timeline_value = USER_FENCE_VALUE },
> +	};

Assert if buffer is null

> +	sync->addr = to_user_pointer(buffer->bind_ufence);
> +
> +	xe_vm_unbind_async(buffer->fd, buffer->vm, buffer->bind_queue,
> +			   0, buffer->gpu_addr, buffer->size, sync, 1);
> +	xe_wait_ufence(buffer->fd, buffer->bind_ufence,
> +		       USER_FENCE_VALUE, buffer->bind_queue, NSEC_PER_SEC);
> +	memset(buffer->bind_ufence, 0, PAGE_ALIGN_UFENCE);
> +
> +	munmap(buffer->cpu_addr, buffer->size);
> +	gem_close(buffer->fd, buffer->bo);
> +
> +	free(buffer->bind_ufence);
> +	xe_exec_queue_destroy(buffer->fd, buffer->bind_queue);
> +}
> +
> +/**
> + * xe_cmdbuf_insert_store:
> + * @cmdbuf: command buffer where commands will be inserted.
> + * @dst_va Destination virtual address to store the value.
> + * @val Value to be stored.
> + *
> + * Inserts a MI_STORE_DWORD_IMM_GEN4 command into a command  buffer, which stores
> + * an immediate value to a given destination virtual address.
> + */
> +void xe_cmdbuf_insert_store(struct xe_cmdbuf *cmdbuf,
> +			    uint64_t dst_va, uint32_t val)
> +{
> +	uint32_t *batch = cmdbuf->buf.cpu_addr;
> +
> +	igt_assert(!cmdbuf->closed);

You may check if cmdbuf->write_index + length of store-dword (4 dwords).
As xe_bb_size() adds additional page you won't overwrite memory, just
assert due to lack of space for BBE.

> +
> +	batch[cmdbuf->write_index++] = MI_STORE_DWORD_IMM_GEN4;
> +	batch[cmdbuf->write_index++] = dst_va;
> +	batch[cmdbuf->write_index++] = dst_va >> 32;
> +	batch[cmdbuf->write_index++] = val;
> +
> +	/* Leaves at least one dword for MI_BATCH_BUFFER_END */
> +	igt_assert(cmdbuf->write_index <= cmdbuf->cmd_size/sizeof(uint32_t) - 2);
> +}
> +
> +/**
> + * xe_create_cmdbuf:
> + * @cmdbuf Pointer to the xe_cmdbuf structure representing the command buffer.
> + * @eci Pointer to the engine class instance for execution.
> + *
> + * Creates a command buffer, fills it with commands using the provided fill
> + * function, and sets up the execution queue for submission.
> + */
> +void xe_create_cmdbuf(struct xe_cmdbuf *cmdbuf,
> +		       struct drm_xe_engine_class_instance *eci)
> +{
> +	struct xe_buf *buf = &cmdbuf->buf;
> +	/*
> +	 * make some room for a exec_ufence, which will be used to sync the
> +	 * submission of this command....
> +	 */
> +	buf->size = xe_bb_size(buf->fd,
> +			       cmdbuf->cmd_size + PAGE_ALIGN_UFENCE);
> +	xe_create_buffer(buf);
> +	cmdbuf->exec_queue = xe_exec_queue_create(buf->fd, buf->vm, eci, 0);
> +	cmdbuf->write_index = 0;
> +	cmdbuf->closed = false;
> +}
> +
> +/**
> + * xe_fill_cmdbuf:
> + * @cmdbuf Pointer to the xe_cmdbuf structure representing the command buffer.
> + * @fill_func Pointer to the function that fills the command buffer.
> + * @dst_gpu_va Destination GPU virtual address to store the value.
> + * @val Value to be stored.
> + *
> + * Fills the command buffer with commands using the provided fill function.
> + */
> +void xe_fill_cmdbuf(struct xe_cmdbuf *cmdbuf,
> +			xe_cmdbuf_fill_func_t fill_func,
> +			uint64_t dst_gpu_va, uint32_t val)
> +{
> +	igt_assert(!cmdbuf->closed);
> +	fill_func(cmdbuf, dst_gpu_va, val);

I don't like this function and I vote for it's removal. You should
just operate directly on cmdbuf (it already have everything you need).
xe_cmdbuf_fill_func_t is not generic (limited to gpu_va/val) so what's
for defining it?

So instead:

	xe_create_cmdbuf(&cmdbuf, eci);
	xe_fill_cmdbuf(&cmdbuf, xe_cmdbuf_insert_store,
		       dst_buf.gpu_addr, 0xc0ffee);
	xe_close_cmdbuf(&cmdbuf);
	xe_submit_cmd(&cmdbuf);

I would imagine:

	xe_create_cmdbuf(&cmdbuf, eci);
	xe_cmdbuf_insert_store(&cmdbuf, dst_buf.gpu_addr, 0xc0ffee);
	xe_cmdbuf_insert_bbe(&cmdbuf, ...)
	xe_submit_cmd(&cmdbuf);

Any additional commands might be added by generic calls:

	xe_cmdbuf_insert_dw(&cmdbuf, 0xc0de);
	xe_cmdbuf_insert_dw(&cmdbuf, 0xc0de2);

You may even drop xe_cmdbuf_insert_bbe() by:

	xe_cmdbuf_insert_dw(&cmdbuf, MI_BATCH_BUFFER_END);


> +}
> +
> +/**
> + * xe_close_cmdbuf:
> + * @cmdbuf command buffer to be closed.
> + *
> + * After this function is called, no more commands can be added to the
> + * command buffer.
> + */
> +void xe_close_cmdbuf(struct xe_cmdbuf *cmdbuf)
> +{
> +	uint32_t *batch = cmdbuf->buf.cpu_addr;
> +
> +	igt_assert(!cmdbuf->closed);
> +	batch[cmdbuf->write_index++] = MI_BATCH_BUFFER_END;
> +	cmdbuf->closed = true;

Please drop this function. You don't need to keep any logic
regarding if buffer has bbe or not.

--
Zbigniew

> +	igt_assert(cmdbuf->write_index <= cmdbuf->cmd_size/sizeof(uint32_t) - 1);
> +}
> +
> +/**
> + * xe_destroy_cmdbuf:
> + * @cmdbuf Pointer to the xe_buf structure representing the command buffer.
> + *
> + * Destroys a command buffer created by xe_create_cmdbuf and releases
> + * associated resources.
> + */
> +void xe_destroy_cmdbuf(struct xe_cmdbuf *cmdbuf)
> +{
> +	xe_exec_queue_destroy(cmdbuf->buf.fd, cmdbuf->exec_queue);
> +	xe_destroy_buffer(&cmdbuf->buf);
> +}
> +
>  static bool __region_belongs_to_regions_type(struct drm_xe_mem_region *region,
>  					     uint32_t *mem_regions_type,
>  					     int num_regions)
> diff --git a/lib/xe/xe_util.h b/lib/xe/xe_util.h
> index 06ebd3c2a..26321f957 100644
> --- a/lib/xe/xe_util.h
> +++ b/lib/xe/xe_util.h
> @@ -14,6 +14,53 @@
>  
>  #include "xe_query.h"
>  
> +#define USER_FENCE_VALUE        0xdeadbeefdeadbeefull
> +#define PAGE_ALIGN_UFENCE	4096
> +#define UFENCE_LENGTH		8
> +
> +struct xe_buf {
> +	void *cpu_addr;
> +	uint64_t gpu_addr;
> +	/*the user fence used to vm bind this buffer*/
> +	uint64_t *bind_ufence;
> +	uint64_t size;
> +	uint32_t flag;
> +	uint32_t vm;
> +	uint32_t bo;
> +	uint32_t placement;
> +	uint32_t bind_queue;
> +	int fd;
> +	bool is_userptr;
> +};
> +
> +struct xe_cmdbuf {
> +	struct xe_buf buf;
> +	/* command size in bytes, not including exec_ufence */
> +	uint64_t cmd_size;
> +	uint32_t exec_queue;
> +	/* Dword index to writ to command buffer */
> +	uint32_t write_index;
> +	bool closed;
> +};
> +
> +typedef void (*xe_cmdbuf_fill_func_t) (struct xe_cmdbuf *cmdbuf,
> +				       uint64_t dst_gpu_va, uint32_t val);
> +
> +void xe_create_buffer(struct xe_buf *buffer);
> +void xe_destroy_buffer(struct xe_buf *buffer);
> +
> +void xe_create_cmdbuf(struct xe_cmdbuf *cmdbuf,
> +		      struct drm_xe_engine_class_instance *eci);
> +void xe_fill_cmdbuf(struct xe_cmdbuf *cmdbuf,
> +			xe_cmdbuf_fill_func_t fill_func,
> +			uint64_t dst_gpu_va, uint32_t val);
> +void xe_close_cmdbuf(struct xe_cmdbuf *cmdbuf);
> +void xe_cmdbuf_insert_store(struct xe_cmdbuf *cmdbuf, uint64_t dst_va,
> +			    uint32_t val);
> +void xe_submit_cmd(struct xe_cmdbuf *cmdbuf);
> +int64_t __xe_submit_cmd(struct xe_cmdbuf *cmdbuf);
> +void xe_destroy_cmdbuf(struct xe_cmdbuf *cmdbuf);
> +
>  #define XE_IS_SYSMEM_MEMORY_REGION(fd, region) \
>  	(xe_region_class(fd, region) == DRM_XE_MEM_REGION_CLASS_SYSMEM)
>  #define XE_IS_VRAM_MEMORY_REGION(fd, region) \
> -- 
> 2.26.3
> 
