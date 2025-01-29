Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61BE9C02192
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jan 2025 05:42:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A29C10E0B6;
	Wed, 29 Jan 2025 05:42:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C7+f0eTg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4F3A10E0B6
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jan 2025 05:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738129344; x=1769665344;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=HBRYWNIPKRPB+Rk7Sw3u3GDizO3abaesvLvogPFcqRs=;
 b=C7+f0eTgOaTVwOiDl1RaH1BM6ccFQOGqunqK9NlWWFTKbkJunabTbHPY
 SmmPDZyHTqLt6YDdrSLWnatUct8kB3QNayvS6dO3XAq3ZPOdxUy81BtmS
 bCtiDooT8PvmCSjX5qdJu8zM+8y6ZMENHM+pfPelo85CJuap3yAeGpCcx
 WigthRwxKl+B9qfcCjHzTDvpumkT5JMa8qbJncL1lBskqzHtjgpEtI7At
 89n2xCfg5+8FjOtk4jBBKUSXbZMi9b41WID+oWxHjvej3u8CDLAK3DBOl
 c3UcooiRf8bvCk1MWIjG+BqGOC+kwJYadYV3+EIK3wD1m2vUnBmr46gBe Q==;
X-CSE-ConnectionGUID: iJYGQYw9RsuoGbdl0fT6nQ==
X-CSE-MsgGUID: ET/qXVnwQhC9r/Gv13oQqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="38772043"
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; d="scan'208";a="38772043"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 21:42:24 -0800
X-CSE-ConnectionGUID: Y+NsptI6QZW++tu3AFPUdA==
X-CSE-MsgGUID: QGJlVnDYRpS839IUqI7P+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; d="scan'208";a="113972919"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.197])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 21:42:22 -0800
Date: Wed, 29 Jan 2025 06:42:17 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t, v2] lib/intel_compute: Use LR mode for compute
 when using Xe
Message-ID: <20250129054217.6mmwewqlcgmtjvzc@zkempczy-mobl2>
References: <20250124113140.2525323-1-francois.dugast@intel.com>
 <20250127051329.a6dkqga5g5uycjkq@zkempczy-mobl2>
 <Z5i1IhJnCmVDaJrc@fdugast-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z5i1IhJnCmVDaJrc@fdugast-desk>
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

On Tue, Jan 28, 2025 at 11:44:50AM +0100, Francois Dugast wrote:
> On Mon, Jan 27, 2025 at 06:13:29AM +0100, Zbigniew Kempczyński wrote:
> > On Fri, Jan 24, 2025 at 12:31:40PM +0100, Francois Dugast wrote:
> > > When Xe is used, create the VM in LR mode as this is what the
> > > compute UMD does to run compute kernels. This makes those tests
> > > more representative of real world scenarios. A side effect is
> > > that user fences must be used.
> > > 
> > > v2: Minimize changes, stick to xe_vm_bind_userptr_async()
> > > 
> > > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > > ---
> > >  lib/intel_compute.c | 98 +++++++++++++++++++++++++++++++++++++--------
> > >  1 file changed, 81 insertions(+), 17 deletions(-)
> > > 
> > > diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> > > index f1520aad4..a7d5d3e0d 100644
> > > --- a/lib/intel_compute.c
> > > +++ b/lib/intel_compute.c
> > > @@ -27,6 +27,7 @@
> > >  #define SIZE_BATCH			0x1000
> > >  #define SIZE_BUFFER_INPUT		MAX(sizeof(float) * SIZE_DATA, 0x1000)
> > >  #define SIZE_BUFFER_OUTPUT		MAX(sizeof(float) * SIZE_DATA, 0x1000)
> > > +#define ADDR_SYNC			0x010000ULL
> > >  #define ADDR_BATCH			0x100000ULL
> > >  #define ADDR_INPUT			0x200000ULL
> > >  #define ADDR_OUTPUT			0x300000ULL
> > > @@ -43,6 +44,8 @@
> > >  #define XE2_ADDR_STATE_CONTEXT_DATA_BASE	0x900000ULL
> > >  #define OFFSET_STATE_SIP			0xFFFF0000
> > >  
> > > +#define USER_FENCE_VALUE			0xdeadbeefdeadbeefull
> > > +
> > >  /*
> > >   * TGP  - ThreadGroup Preemption
> > >   * WMTP - Walker Mid Thread Preemption
> > > @@ -58,6 +61,10 @@ struct bo_dict_entry {
> > >  	uint32_t handle;
> > >  };
> > >  
> > > +struct bo_sync {
> > > +	uint64_t sync;
> > > +};
> > > +
> > >  struct bo_execenv {
> > >  	int fd;
> > >  	enum intel_driver driver;
> > > @@ -81,7 +88,7 @@ static void bo_execenv_create(int fd, struct bo_execenv *execenv,
> > >  	execenv->driver = get_intel_driver(fd);
> > >  
> > >  	if (execenv->driver == INTEL_DRIVER_XE) {
> > > -		execenv->vm = xe_vm_create(fd, 0, 0);
> > > +		execenv->vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
> > >  
> > >  		if (eci) {
> > >  			execenv->exec_queue = xe_exec_queue_create(fd, execenv->vm,
> > > @@ -107,8 +114,8 @@ static void bo_execenv_destroy(struct bo_execenv *execenv)
> > >  	igt_assert(execenv);
> > >  
> > >  	if (execenv->driver == INTEL_DRIVER_XE) {
> > > -		xe_vm_destroy(execenv->fd, execenv->vm);
> > >  		xe_exec_queue_destroy(execenv->fd, execenv->exec_queue);
> > > +		xe_vm_destroy(execenv->fd, execenv->vm);
> > >  	}
> > 
> > What's for this reorder?
> 
> Sorry I sent v3 before answering your question. The exec queue is created
> with a vm, see above in bo_execenv_create():
> 
>     vm = xe_vm_create(...)
>     exec_queue = xe_exec_queue_create(vm, ...)
> 
> So the resources must be destroyed in reverse order to prevent this error:
> 
>     Test assertion failure function xe_vm_destroy, file ../lib/xe/xe_ioctl.c:241:
>     Last errno: 16, Device or resource busy
> 
> The sequence:
> 
>     xe_exec_queue_destroy()
>     xe_vm_destroy()
> 
> 
> ...is consistent with what we have in other tests, see:
> 
>     grep xe_exec_queue_destroy tests/intel -r -A 1

Thanks, you're right. Exec queue is created on top of vm so reverse
order is correct.

--
Zbigniew

> 
> Francois
> 
> > 
> > --
> > Zbigniew
> > 
> > >  }
> > >  
> > > @@ -119,18 +126,30 @@ static void bo_execenv_bind(struct bo_execenv *execenv,
> > >  
> > >  	if (execenv->driver == INTEL_DRIVER_XE) {
> > >  		uint32_t vm = execenv->vm;
> > > +		uint32_t exec_queue = execenv->exec_queue;
> > >  		uint64_t alignment = xe_get_default_alignment(fd);
> > > -		struct drm_xe_sync sync = { 0 };
> > > -
> > > -		sync.type = DRM_XE_SYNC_TYPE_SYNCOBJ;
> > > -		sync.flags = DRM_XE_SYNC_FLAG_SIGNAL;
> > > -		sync.handle = syncobj_create(fd, 0);
> > > +		struct bo_sync *bo_sync;
> > > +		size_t bo_size = sizeof(*bo_sync);
> > > +		uint32_t bo = 0;
> > > +		struct drm_xe_sync sync = {
> > > +			.type = DRM_XE_SYNC_TYPE_USER_FENCE,
> > > +			.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> > > +			.timeline_value = USER_FENCE_VALUE,
> > > +		};
> > > +
> > > +		bo_size = xe_bb_size(fd, bo_size);
> > > +		bo = xe_bo_create(fd, execenv->vm, bo_size, vram_if_possible(fd, 0),
> > > +				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > > +		bo_sync = xe_bo_map(fd, bo, bo_size);
> > > +		sync.addr = to_user_pointer(&bo_sync->sync);
> > >  
> > >  		for (int i = 0; i < entries; i++) {
> > > +			bo_sync->sync = 0;
> > >  			bo_dict[i].data = aligned_alloc(alignment, bo_dict[i].size);
> > >  			xe_vm_bind_userptr_async(fd, vm, 0, to_user_pointer(bo_dict[i].data),
> > >  						 bo_dict[i].addr, bo_dict[i].size, &sync, 1);
> > > -			syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL);
> > > +			xe_wait_ufence(fd, &bo_sync->sync, USER_FENCE_VALUE, exec_queue,
> > > +				       NSEC_PER_SEC);
> > >  			memset(bo_dict[i].data, 0, bo_dict[i].size);
> > >  
> > >  			igt_debug("[i: %2d name: %20s] data: %p, addr: %16llx, size: %llx\n",
> > > @@ -139,7 +158,8 @@ static void bo_execenv_bind(struct bo_execenv *execenv,
> > >  				  (long long)bo_dict[i].size);
> > >  		}
> > >  
> > > -		syncobj_destroy(fd, sync.handle);
> > > +		munmap(bo_sync, bo_size);
> > > +		gem_close(fd, bo);
> > >  	} else {
> > >  		struct drm_i915_gem_execbuffer2 *execbuf = &execenv->execbuf;
> > >  		struct drm_i915_gem_exec_object2 *obj;
> > > @@ -177,19 +197,32 @@ static void bo_execenv_unbind(struct bo_execenv *execenv,
> > >  
> > >  	if (execenv->driver == INTEL_DRIVER_XE) {
> > >  		uint32_t vm = execenv->vm;
> > > -		struct drm_xe_sync sync = { 0 };
> > > -
> > > -		sync.type = DRM_XE_SYNC_TYPE_SYNCOBJ;
> > > -		sync.flags = DRM_XE_SYNC_FLAG_SIGNAL;
> > > -		sync.handle = syncobj_create(fd, 0);
> > > +		uint32_t exec_queue = execenv->exec_queue;
> > > +		struct bo_sync *bo_sync;
> > > +		size_t bo_size = sizeof(*bo_sync);
> > > +		uint32_t bo = 0;
> > > +		struct drm_xe_sync sync = {
> > > +			.type = DRM_XE_SYNC_TYPE_USER_FENCE,
> > > +			.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> > > +			.timeline_value = USER_FENCE_VALUE,
> > > +		};
> > > +
> > > +		bo_size = xe_bb_size(fd, bo_size);
> > > +		bo = xe_bo_create(fd, execenv->vm, bo_size, vram_if_possible(fd, 0),
> > > +				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > > +		bo_sync = xe_bo_map(fd, bo, bo_size);
> > > +		sync.addr = to_user_pointer(&bo_sync->sync);
> > >  
> > >  		for (int i = 0; i < entries; i++) {
> > > +			bo_sync->sync = 0;
> > >  			xe_vm_unbind_async(fd, vm, 0, 0, bo_dict[i].addr, bo_dict[i].size, &sync, 1);
> > > -			syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL);
> > > +			xe_wait_ufence(fd, &bo_sync->sync, USER_FENCE_VALUE, exec_queue,
> > > +				       NSEC_PER_SEC);
> > >  			free(bo_dict[i].data);
> > >  		}
> > >  
> > > -		syncobj_destroy(fd, sync.handle);
> > > +		munmap(bo_sync, bo_size);
> > > +		gem_close(fd, bo);
> > >  	} else {
> > >  		for (int i = 0; i < entries; i++) {
> > >  			gem_close(fd, bo_dict[i].handle);
> > > @@ -204,7 +237,38 @@ static void bo_execenv_exec(struct bo_execenv *execenv, uint64_t start_addr)
> > >  	int fd = execenv->fd;
> > >  
> > >  	if (execenv->driver == INTEL_DRIVER_XE) {
> > > -		xe_exec_wait(fd, execenv->exec_queue, start_addr);
> > > +		uint32_t exec_queue = execenv->exec_queue;
> > > +		struct bo_sync *bo_sync;
> > > +		size_t bo_size = sizeof(*bo_sync);
> > > +		uint32_t bo = 0;
> > > +		struct drm_xe_sync sync = {
> > > +			.type = DRM_XE_SYNC_TYPE_USER_FENCE,
> > > +			.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> > > +			.timeline_value = USER_FENCE_VALUE,
> > > +		};
> > > +		struct drm_xe_exec exec = {
> > > +			.num_batch_buffer = 1,
> > > +			.num_syncs = 1,
> > > +			.syncs = to_user_pointer(&sync),
> > > +			.exec_queue_id = exec_queue,
> > > +			.address = start_addr,
> > > +		};
> > > +
> > > +		bo_size = xe_bb_size(fd, bo_size);
> > > +		bo = xe_bo_create(fd, execenv->vm, bo_size, vram_if_possible(fd, 0),
> > > +				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > > +		bo_sync = xe_bo_map(fd, bo, bo_size);
> > > +		sync.addr = to_user_pointer(&bo_sync->sync);
> > > +		xe_vm_bind_async(fd, execenv->vm, 0, bo, 0, ADDR_SYNC, bo_size, &sync, 1);
> > > +		xe_wait_ufence(fd, &bo_sync->sync, USER_FENCE_VALUE, exec_queue, NSEC_PER_SEC);
> > > +
> > > +		sync.addr = ADDR_SYNC;
> > > +		bo_sync->sync = 0;
> > > +		xe_exec(fd, &exec);
> > > +		xe_wait_ufence(fd, &bo_sync->sync, USER_FENCE_VALUE, exec_queue, NSEC_PER_SEC);
> > > +
> > > +		munmap(bo_sync, bo_size);
> > > +		gem_close(fd, bo);
> > >  	} else {
> > >  		struct drm_i915_gem_execbuffer2 *execbuf = &execenv->execbuf;
> > >  		struct drm_i915_gem_exec_object2 *obj = execenv->obj;
> > > -- 
> > > 2.43.0
> > > 
