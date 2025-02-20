Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0E1DC021AD
	for <igt-dev@archiver.kernel.org>; Thu, 20 Feb 2025 05:41:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A10F10E8BB;
	Thu, 20 Feb 2025 05:41:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fVYSSHS9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1366110E8BB
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Feb 2025 05:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740030085; x=1771566085;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=MxcyN0GNhOD+qf0E1Hv60CqvZ6PM9DGBY0Ws3mkpVj0=;
 b=fVYSSHS9Soec/w2c+xm5g6HwuWxZaa4c1DgUfzA2oQ3wtX00oQI3HdOm
 eJCvBuN9TxrUF3xMM6yt+b6D0vCf7HJ/Gizvw1vFE0tP0brgxC70gTTVI
 v/sPW89BKj+ljUW10IGoqACZtr0xhrcN7tOlnb0GxgCXMcxlcaH6pfwVQ
 mUYn59pOyJ454kIbpTOzuu++ODm0qm847jeJFRDBroLbr2l5lewtvEvj9
 qgUcfV5MqIn+wVOMwPnJpbkqxGufP0nGxclz6W+NBSOvf6uAkKfj682HU
 bwmBbL6kH0vMRzzQaxZVAMh9M9QK69YlDL+J4OpIdR5fePgsBH0p0uCF5 w==;
X-CSE-ConnectionGUID: NagA16GvR9GugDdQfV+CuQ==
X-CSE-MsgGUID: xWXR2zjJRGmGKhZvM0SLcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="51412753"
X-IronPort-AV: E=Sophos;i="6.13,300,1732608000"; d="scan'208";a="51412753"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 21:41:10 -0800
X-CSE-ConnectionGUID: BxpDTXO4Se2rqKk8qJGxJA==
X-CSE-MsgGUID: hOxEPAKXQr+sQ37NFWAqZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,300,1732608000"; d="scan'208";a="114886453"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.190])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 21:41:07 -0800
Date: Thu, 20 Feb 2025 06:41:03 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Thomas.Hellstrom@linux.intel.com" <Thomas.Hellstrom@linux.intel.com>,
 "Brost, Matthew" <matthew.brost@intel.com>,
 "Konieczny, Kamil" <kamil.konieczny@intel.com>,
 "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 "Heikkila, Juha-pekka" <juha-pekka.heikkila@intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [i-g-t v2 2/4] lib/xe/xe_util: Introduce helper functions
Message-ID: <20250220054103.jkocvuzob37xq3kp@zkempczy-mobl2>
References: <20250214215920.282425-1-oak.zeng@intel.com>
 <20250214215920.282425-3-oak.zeng@intel.com>
 <20250218065831.zdxx3aqmdnorzo4l@zkempczy-mobl2>
 <MW3PR11MB4731087A0BBBA655D0FC44D492FA2@MW3PR11MB4731.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MW3PR11MB4731087A0BBBA655D0FC44D492FA2@MW3PR11MB4731.namprd11.prod.outlook.com>
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

On Tue, Feb 18, 2025 at 05:38:57PM +0100, Zeng, Oak wrote:
> Hi Zbigniew,
> 
> > -----Original Message-----
> > From: Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>
> > Sent: February 18, 2025 1:59 AM
> > To: Zeng, Oak <oak.zeng@intel.com>
> > Cc: igt-dev@lists.freedesktop.org; Thomas.Hellstrom@linux.intel.com;
> > Brost, Matthew <matthew.brost@intel.com>; Konieczny, Kamil
> > <kamil.konieczny@intel.com>; Dixit, Ashutosh
> > <ashutosh.dixit@intel.com>; Heikkila, Juha-pekka <juha-
> > pekka.heikkila@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > Subject: Re: [i-g-t v2 2/4] lib/xe/xe_util: Introduce helper functions
> > 
> > On Fri, Feb 14, 2025 at 04:59:18PM -0500, Oak Zeng wrote:
> > > From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> > >
> > > Introduce helper functions for buffer creation, binding,
> > > destruction and command submission etc. With those helpers,
> > > writing a xe igt test will be much easier, which will be
> > > showed in a coming example.
> > >
> > > v2: use to_user_pointer to cast a pointer (Kamil)
> > >     s/insert_store/xe_insert_store (Kamil)
> > >     s/cmdbuf_fill_func_t/xe_cmdbuf_fill_func_t (Kamil)
> > >
> > > Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> > > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > > Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > > ---
> > >  lib/xe/xe_util.c | 201
> > +++++++++++++++++++++++++++++++++++++++++++++++
> > >  lib/xe/xe_util.h |  33 ++++++++
> > >  2 files changed, 234 insertions(+)
> > >
> > > diff --git a/lib/xe/xe_util.c b/lib/xe/xe_util.c
> > > index 06b378ce0..fcb904ce7 100644
> > > --- a/lib/xe/xe_util.c
> > > +++ b/lib/xe/xe_util.c
> > > @@ -13,6 +13,207 @@
> > >  #include "xe/xe_query.h"
> > >  #include "xe/xe_util.h"
> > >
> > > +/**
> > > + * __xe_submit_cmd:
> > > + * @cmdbuf Pointer to the command buffer structure
> > > + *
> > > + * Submits a command buffer to the GPU, waits for its completion,
> > and verifies
> > > + * the user fence value
> > > + *
> > > + * Return: The result of waiting for the user fence value
> > > + */
> > > +int64_t __xe_submit_cmd(struct xe_buffer *cmdbuf)
> > > +{
> > > +	int64_t timeout = NSEC_PER_SEC;
> > > +	int ret;
> > > +
> > > +	struct drm_xe_sync sync[1] = {
> > > +		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE,
> > > +			.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> > > +			.timeline_value = USER_FENCE_VALUE,
> > > +			.addr =
> > xe_cmdbuf_exec_ufence_gpuva(cmdbuf),},
> > > +	};
> > > +	struct drm_xe_exec exec = {
> > > +		.num_batch_buffer = 1,
> > > +		.num_syncs = 1,
> > > +		.syncs = to_user_pointer(&sync),
> > > +		.exec_queue_id = cmdbuf->exec_queue,
> > > +		.address = cmdbuf->gpu_addr,
> > > +	};
> > > +
> > > +	xe_exec(cmdbuf->fd, &exec);
> > > +	ret = __xe_wait_ufence(cmdbuf->fd,
> > xe_cmdbuf_exec_ufence_cpuva(cmdbuf),
> > > +			       USER_FENCE_VALUE, cmdbuf-
> > >exec_queue, &timeout);
> > > +	/* Reset the fence so next fence wait won't return
> > immediately */
> > > +	memset(xe_cmdbuf_exec_ufence_cpuva(cmdbuf), 0,
> > UFENCE_LENGTH);
> > > +	return ret;
> > > +}
> > > +
> > > +/**
> > > + * xe_submit_cmd:
> > > + * @cmdbuf Pointer to the command buffer structure
> > > + *
> > > + * Wrapper function to submit a command buffer and assert its
> > successful
> > > + * execution.
> > > + */
> > > +void xe_submit_cmd(struct xe_buffer *cmdbuf)
> > > +{
> > > +	int64_t ret;
> > > +
> > > +	ret = __xe_submit_cmd(cmdbuf);
> > > +	igt_assert_eq(ret, 0);
> > > +}
> > > +
> > > +/**
> > > + *xe_create_buffer:
> > > + * @buffer Pointer to the xe_buffer structure containing buffer
> > details.
> > > + *
> > > + * Creates a buffer, maps it to both CPU and GPU address spaces,
> > and binds it
> > > + * to a virtual memory (VM) space.
> > > + */
> > > +void xe_create_buffer(struct xe_buffer *buffer)
> > > +{
> > > +	struct drm_xe_sync sync[1] = {
> > > +		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE,
> > > +		  .flags = DRM_XE_SYNC_FLAG_SIGNAL,
> > > +		  .timeline_value = USER_FENCE_VALUE },
> > > +	};
> > > +
> > > +	buffer->bind_queue = xe_bind_exec_queue_create(buffer-
> > >fd,
> > > +						       buffer->vm, 0);
> > > +	buffer->bind_ufence =
> > aligned_alloc(xe_get_default_alignment(buffer->fd),
> > > +					    PAGE_ALIGN_UFENCE);
> > > +	sync->addr = to_user_pointer(buffer->bind_ufence);
> > > +
> > > +
> > > +	/* create and bind the buffer->bo */
> > > +	buffer->bo = xe_bo_create(buffer->fd, 0, buffer->size,
> > > +				  buffer->placement, buffer->flag);
> > > +	buffer->cpu_addr = xe_bo_map(buffer->fd, buffer->bo,
> > buffer->size);
> > > +	xe_vm_bind_async(buffer->fd, buffer->vm, buffer-
> > >bind_queue,
> > > +			 buffer->bo, 0, buffer->gpu_addr,
> > > +			 buffer->size, sync, 1);
> > > +
> > > +	xe_wait_ufence(buffer->fd, buffer->bind_ufence,
> > > +		       USER_FENCE_VALUE, buffer->bind_queue,
> > NSEC_PER_SEC);
> > > +	memset(buffer->bind_ufence, 0, PAGE_ALIGN_UFENCE);
> > > +}
> > > +
> > > +/**
> > > + * xe_destroy_buffer:
> > > + * @buffer Pointer to the xe_buffer structure containing buffer
> > details
> > > + *
> > > + * Destroys a buffer created by xe_create_buffer and releases
> > associated
> > > + * resources.
> > > + */
> > > +void xe_destroy_buffer(struct xe_buffer *buffer)
> > > +{
> > > +	struct drm_xe_sync sync[1] = {
> > > +		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE,
> > > +		  .flags = DRM_XE_SYNC_FLAG_SIGNAL,
> > > +		  .timeline_value = USER_FENCE_VALUE },
> > > +	};
> > > +	sync->addr = to_user_pointer(buffer->bind_ufence);
> > > +
> > > +	xe_vm_unbind_async(buffer->fd, buffer->vm, buffer-
> > >bind_queue,
> > > +			   0, buffer->gpu_addr, buffer->size, sync, 1);
> > > +	xe_wait_ufence(buffer->fd, buffer->bind_ufence,
> > > +		       USER_FENCE_VALUE, buffer->bind_queue,
> > NSEC_PER_SEC);
> > > +	memset(buffer->bind_ufence, 0, PAGE_ALIGN_UFENCE);
> > > +
> > > +	munmap(buffer->cpu_addr, buffer->size);
> > > +	gem_close(buffer->fd, buffer->bo);
> > > +
> > > +	free(buffer->bind_ufence);
> > > +	xe_exec_queue_destroy(buffer->fd, buffer->bind_queue);
> > > +}
> > > +
> > > +/**
> > > + * xe_insert_store:
> > > + * @batch Pointer to the batch buffer where commands will be
> > inserted.
> > > + * @dst_va Destination virtual address to store the value.
> > > + * @val Value to be stored.
> > > + *
> > > + * Inserts a MI_STORE_DWORD_IMM_GEN4 command into a
> > batch buffer, which stores
> > > + * an immediate value to a given destination virtual address.
> > > + */
> > > +void xe_insert_store(uint32_t *batch, uint64_t dst_va, uint32_t
> > val)
> > > +{
> > > +	int i = 0;
> > > +
> > > +	batch[i] = MI_STORE_DWORD_IMM_GEN4;
> > > +	batch[++i] = dst_va;
> > > +	batch[++i] = dst_va >> 32;
> > > +	batch[++i] = val;
> > > +	batch[++i] = MI_BATCH_BUFFER_END;
> > 
> > What BBE is doing here? Function name is confusing, you can't
> > glued this with something else. I would suggest to at least
> > return index of last written dword, to allow adding other
> > commands to same batch (I mean passing &batch[last_index]
> > to other functions).
> 
> Good point. I agree the interface should allow appending multiple
> Commands to one batch buffer. It will make this library more flexible.
> Here is what I plan to do:
> 
> 1) remove the BBE from above xe_insert_store function. This basically
> Leave the command buffer open to add more command
> 2) introduce a new class xe_cmd_buffer, inherit from xe_buffer. Xe_cmd_buffer
> Has a private member to store the last_index. Obviously last_index doesn't belong
> To xe_buffer. Plus xec_queue also doesn't belong to xe_buffer, only belong to 
> Xe_cmd_buffer. This give us enough reason to create new xe_cmd_buffer class.
> 3) reparameter/repurpose the xe_create_cmdbuf function: only create buffer and
> Initialize class members, but not fill commands to command buffer yet.
> 4) introduce separate interface to stuff commands to command buffer
> 5) introduce separate interface to close command buffer by add a BBE command
> To the end of command buffer.
> 
> With this refactor, we do requires extra codes in writing a test. With the current
> Interface, we can create and fill command buffer calling one API. With above refactor
> We would need call 3 APIs (create_cmd_buffer, fill_cmd_buffer, close_cmd_buffer).
> But the new approach does look more flexible.
> 
> I will implement above. Please let me know whether this is a ideal plan for you.

+Matt Brost

Be aware this is second time these helpers come to igt. First time
Matt wasn't happy because handcrafting everything gives him more
control. I have no strong preference, for me if this is useful
for writing tests it's fine. Especially if this will simplify the
code. From the other hand we already have intel-bb, which allows
you to create batch buffer and fill it with commands (it was made
as a replacement for previously used libdrm and its widely used
in rendercopy/gpgpu fill/other tests - it supports both drivers
- i915 and xe). So before you'll decide to send this please check
if your test can use already existing infrastructure.

--
Zbigniew


> 
> Thanks for the review Zbigniew!
> 
> Oak
> 
> > 
> > --
> > Zbigniew
> > 
> > > +}
> > > +
> > > +/**
> > > + * xe_create_cmdbuf:
> > > + * @cmd_buf Pointer to the xe_buffer structure representing the
> > command buffer.
> > > + * @fill_func Pointer to the function that fills the command buffer.
> > > + * @dst_va Virtual address of the memory location where val need
> > to store.
> > > + * @val Value to be written to the memory locations.
> > > + * @eci Pointer to the engine class instance for execution.
> > > + *
> > > + * Creates a command buffer, fills it with commands using the
> > provided fill
> > > + * function, and sets up the execution queue for submission.
> > > + */
> > > +void xe_create_cmdbuf(struct xe_buffer *cmd_buf,
> > xe_cmdbuf_fill_func_t fill_func,
> > > +		      uint64_t dst_va, uint32_t val,
> > > +		      struct drm_xe_engine_class_instance *eci)
> > > +{
> > > +	/*
> > > +	 * make some room for a exec_ufence, which will be used to
> > sync the
> > > +	 * submission of this command....
> > > +	 */
> > > +	cmd_buf->size = xe_bb_size(cmd_buf->fd,
> > > +				   cmd_buf->size +
> > PAGE_ALIGN_UFENCE);
> > > +	xe_create_buffer(cmd_buf);
> > > +	cmd_buf->exec_queue = xe_exec_queue_create(cmd_buf-
> > >fd,
> > > +						   cmd_buf->vm, eci,
> > 0);
> > > +	fill_func(cmd_buf->cpu_addr, dst_va, val);
> > > +}
> > > +
> > > +/**
> > > + * xe_destroy_cmdbuf:
> > > + * @cmd_buf Pointer to the xe_buffer structure representing the
> > command buffer.
> > > + *
> > > + * Destroys a command buffer created by xe_create_cmdbuf and
> > releases
> > > + * associated resources.
> > > + */
> > > +void xe_destroy_cmdbuf(struct xe_buffer *cmd_buf)
> > > +{
> > > +	xe_exec_queue_destroy(cmd_buf->fd, cmd_buf-
> > >exec_queue);
> > > +	xe_destroy_buffer(cmd_buf);
> > > +}
> > > +
> > > +/**
> > > + * xe_cmdbuf_exec_ufence_gpuva:
> > > + * @cmd_buf Pointer to the xe_buffer structure representing the
> > command buffer.
> > > + *
> > > + * Returns the GPU virtual address of the execution user fence
> > located at the
> > > + * end of the command buffer.
> > > + */
> > > +uint64_t xe_cmdbuf_exec_ufence_gpuva(struct xe_buffer
> > *cmd_buf)
> > > +{
> > > +	/* the last 8 bytes of the cmd buffer is used as ufence */
> > > +	return (uint64_t)cmd_buf->gpu_addr + cmd_buf->size -
> > UFENCE_LENGTH;
> > > +}
> > > +
> > > +/**
> > > + * xe_cmdbuf_exec_ufence_cpuva:
> > > + * @cmd_buf Pointer to the xe_buffer structure representing the
> > command buffer.
> > > + *
> > > + * Returns the CPU virtual address of the execution user fence
> > located at the
> > > + * end of the command buffer.
> > > + */
> > > +uint64_t *xe_cmdbuf_exec_ufence_cpuva(struct xe_buffer
> > *cmd_buf)
> > > +{
> > > +	/* the last 8 bytes of the cmd buffer is used as ufence */
> > > +	return cmd_buf->cpu_addr + cmd_buf->size -
> > UFENCE_LENGTH;
> > > +}
> > > +
> > >  static bool __region_belongs_to_regions_type(struct
> > drm_xe_mem_region *region,
> > >  					     uint32_t
> > *mem_regions_type,
> > >  					     int num_regions)
> > > diff --git a/lib/xe/xe_util.h b/lib/xe/xe_util.h
> > > index 06ebd3c2a..df3d81801 100644
> > > --- a/lib/xe/xe_util.h
> > > +++ b/lib/xe/xe_util.h
> > > @@ -14,6 +14,39 @@
> > >
> > >  #include "xe_query.h"
> > >
> > > +#define USER_FENCE_VALUE        0xdeadbeefdeadbeefull
> > > +#define PAGE_ALIGN_UFENCE	4096
> > > +#define UFENCE_LENGTH		8
> > > +
> > > +struct xe_buffer {
> > > +	void *cpu_addr;
> > > +	uint64_t gpu_addr;
> > > +	/*the user fence used to vm bind this buffer*/
> > > +	uint64_t *bind_ufence;
> > > +	uint64_t size;
> > > +	uint32_t flag;
> > > +	uint32_t vm;
> > > +	uint32_t bo;
> > > +	uint32_t placement;
> > > +	uint32_t bind_queue;
> > > +	/*only a cmd buffer has a exec queue*/
> > > +	uint32_t exec_queue;
> > > +	int fd;
> > > +	bool is_userptr;
> > > +};
> > > +
> > > +typedef void (*xe_cmdbuf_fill_func_t) (uint32_t *batch, uint64_t
> > dst_gpu_va, uint32_t val);
> > > +void xe_create_buffer(struct xe_buffer *buffer);
> > > +void xe_create_cmdbuf(struct xe_buffer *cmd_buf,
> > xe_cmdbuf_fill_func_t fill_func,
> > > +		uint64_t dst_va, uint32_t val, struct
> > drm_xe_engine_class_instance *eci);
> > > +uint64_t xe_cmdbuf_exec_ufence_gpuva(struct xe_buffer
> > *cmd_buf);
> > > +uint64_t *xe_cmdbuf_exec_ufence_cpuva(struct xe_buffer
> > *cmd_buf);
> > > +void xe_insert_store(uint32_t *batch, uint64_t dst_va, uint32_t
> > val);
> > > +void xe_submit_cmd(struct xe_buffer *cmdbuf);
> > > +int64_t __xe_submit_cmd(struct xe_buffer *cmdbuf);
> > > +void xe_destroy_buffer(struct xe_buffer *buffer);
> > > +void xe_destroy_cmdbuf(struct xe_buffer *cmd_buf);
> > > +
> > >  #define XE_IS_SYSMEM_MEMORY_REGION(fd, region) \
> > >  	(xe_region_class(fd, region) ==
> > DRM_XE_MEM_REGION_CLASS_SYSMEM)
> > >  #define XE_IS_VRAM_MEMORY_REGION(fd, region) \
> > > --
> > > 2.26.3
> > >
