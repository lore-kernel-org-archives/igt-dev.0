Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04157C3DA49
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jul 2024 09:52:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A623210E53C;
	Tue, 23 Jul 2024 09:52:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UIq13sHB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97A3610E53C
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jul 2024 09:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721728373; x=1753264373;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=YVPtjnwIPM9v4V0dZztVwxj+ZbL+Waa2Y4JTEMV4wkQ=;
 b=UIq13sHBW7KJxCJTCAOL/rX0u2RafbGmvbMZAANTk4sDSppE0LhCtBwQ
 NqlMSDG8ca0yUbLw1aC8CwJsRKoRXh1f6vJ2SoWfTpP6dDMPWQRMZ+xzC
 eqreCQee4aFJo/eULqJML4w3cJX8pZTvvQsTyYb03mzCPC/v22yJOBsZg
 Tq6TInszfrkqgq5gINHUbAYBvxSy56BqfSwC/UsDk2HIIymvPsMukbes+
 PwfRRv0eGHSkzIfHWAE+xNnyhs+zO0sKG4O/0BLlb75HurVhs+R2RlurB
 puZvz27vWfh38qHLy/15RAnlTL9fC+ntObBTQ3yw1XJdfSM/N8oxtDarQ g==;
X-CSE-ConnectionGUID: jXaYY7TlSESk/cG54IWkIg==
X-CSE-MsgGUID: 7QqYkyk7QEaGkyiRvw1qYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="30492600"
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; d="scan'208";a="30492600"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2024 02:52:53 -0700
X-CSE-ConnectionGUID: JGrYc4OWQPGvi96eoI5/eQ==
X-CSE-MsgGUID: 6Ig6dJPiSz63ClZX/CR1RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; d="scan'208";a="83195529"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2024 02:52:50 -0700
Date: Tue, 23 Jul 2024 11:52:32 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Tvrtko Ursulin <tursulin@igalia.com>,
 zbigniew.kempczynski@intel.com, lukasz.laguna@intel.com
Subject: Re: [PATCH v2 i-g-t 1/2] benchmarks/gem_wsim: Support gens without
 relocations
Message-ID: <20240723095232.7hihfoqwwdrvgosf@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Tvrtko Ursulin <tursulin@igalia.com>,
 zbigniew.kempczynski@intel.com, lukasz.laguna@intel.com
References: <20231214201302.29844-1-marcin.bernatowicz@linux.intel.com>
 <20231214201302.29844-2-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231214201302.29844-2-marcin.bernatowicz@linux.intel.com>
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

Hi Marcin,
On 2023-12-14 at 21:13:01 +0100, Marcin Bernatowicz wrote:
> This commit adopts the approach present in lib/igt_dummyload
> to support generations that do not use relocations.
> The intel_allocator is leveraged to compute offsets on these generations.
> Apart of this change, the 'struct vm' is now shared by both i915 and
> Xe. It includes a 'vm_id' that the intel_allocator uses for address
> assignment.
> This modification enhances gem_wsim compatibility with newer platforms
> running i915.

Overall looks good, only few nits, see below.

> 
> v2: split mmap change to separate patch (Tvrtko)

Added new e-mails for Tvrtko: +Cc: Tvrtko Ursulin <tursulin@ursulin.net>
+Cc: Tvrtko Ursulin <tursulin@igalia.com>

> 
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> ---
>  benchmarks/gem_wsim.c | 96 ++++++++++++++++++++++++++++++++-----------
>  1 file changed, 71 insertions(+), 25 deletions(-)
> 
> diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
> index 30673da8f..a1db37d4e 100644
> --- a/benchmarks/gem_wsim.c
> +++ b/benchmarks/gem_wsim.c
> @@ -205,7 +205,7 @@ struct w_step {
>  	uint32_t bb_handle;
>  };
>  
> -struct xe_vm {
> +struct vm {
>  	uint32_t id;
>  	bool compute_mode;
>  	uint64_t ahnd;
> @@ -226,9 +226,9 @@ struct ctx {
>  	struct bond *bonds;
>  	bool load_balance;
>  	uint64_t sseu;
> +	/* reference to vm */
> +	struct vm *vm;
>  	struct {
> -		/* reference to vm */
> -		struct xe_vm *vm;
>  		/* exec queues */
>  		unsigned int nr_queues;
>  		struct xe_exec_queue *queue_list;
> @@ -256,10 +256,8 @@ struct workload {
>  	unsigned int nr_ctxs;
>  	struct ctx *ctx_list;
>  
> -	struct {
> -		unsigned int nr_vms;
> -		struct xe_vm *vm_list;
> -	} xe;
> +	unsigned int nr_vms;
> +	struct vm *vm_list;
>  
>  	struct working_set **working_sets; /* array indexed by set id */
>  	int max_working_set_id;
> @@ -1539,9 +1537,11 @@ static unsigned int create_bb(struct w_step *w, int self)
>  	/* Save delta for indirect read by COND_BBE */
>  	*cs++ = MI_STORE_REGISTER_MEM_CMD | (1 + use_64b) | MI_CS_MMIO_DST;
>  	*cs++ = CS_GPR(NOW_TS);
> +	w->i915.reloc[r].presumed_offset = w->i915.obj[self].offset;
>  	w->i915.reloc[r].target_handle = self;
>  	w->i915.reloc[r].offset = offset_in_page(cs);
> -	*cs++ = w->i915.reloc[r].delta = 4000;
> +	w->i915.reloc[r].delta = 4000;
> +	*cs++ = w->i915.reloc[r].presumed_offset + w->i915.reloc[r].delta;
>  	*cs++ = 0;
>  	r++;
>  
> @@ -1556,17 +1556,21 @@ static unsigned int create_bb(struct w_step *w, int self)
>  	*cs++ = MI_COND_BATCH_BUFFER_END | MI_DO_COMPARE | (1 + use_64b);
>  	w->i915.bb_duration = cs;
>  	*cs++ = 0;
> +	w->i915.reloc[r].presumed_offset = w->i915.obj[self].offset;
>  	w->i915.reloc[r].target_handle = self;
>  	w->i915.reloc[r].offset = offset_in_page(cs);
> -	*cs++ = w->i915.reloc[r].delta = 4000;
> +	w->i915.reloc[r].delta = 4000;
> +	*cs++ = w->i915.reloc[r].presumed_offset + w->i915.reloc[r].delta;
>  	*cs++ = 0;
>  	r++;
>  
>  	/* Otherwise back to recalculating delta */
>  	*cs++ = MI_BATCH_BUFFER_START | 1 << 8 | use_64b;
> +	w->i915.reloc[r].presumed_offset = w->i915.obj[self].offset;
>  	w->i915.reloc[r].target_handle = self;
>  	w->i915.reloc[r].offset = offset_in_page(cs);
> -	*cs++ = w->i915.reloc[r].delta = offset_in_page(jmp);
> +	w->i915.reloc[r].delta = offset_in_page(jmp);
> +	*cs++ = w->i915.reloc[r].presumed_offset + w->i915.reloc[r].delta;
>  	*cs++ = 0;
>  	r++;
>  
> @@ -1648,10 +1652,10 @@ xe_get_eq(struct workload *wrk, const struct w_step *w)
>  	return eq;
>  }
>  
> -static struct xe_vm *
> -xe_get_vm(struct workload *wrk, const struct w_step *w)
> +static struct vm *
> +get_vm(struct workload *wrk, const struct w_step *w)

You don't use 'w' here so maybe drop this param?

>  {
> -	return wrk->xe.vm_list;
> +	return wrk->vm_list;
>  }
>  
>  static uint32_t alloc_bo(int i915, unsigned long *size)
> @@ -1673,6 +1677,16 @@ alloc_step_batch(struct workload *wrk, struct w_step *w)
>  	struct dep_entry *dep;
>  	unsigned int j = 0;
>  	unsigned int nr_obj = 2 + w->data_deps.nr;
> +	unsigned int objflags = 0;
> +	uint64_t addr;
> +	struct vm *vm = get_vm(wrk, w);
> +
> +	addr = gem_aperture_size(fd) / 2;
> +	if (addr >> 32)
> +		objflags |= EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
> +
> +	if (vm->ahnd)
> +		objflags |= EXEC_OBJECT_PINNED;
>  
>  	w->i915.obj = calloc(nr_obj, sizeof(*w->i915.obj));
>  	igt_assert(w->i915.obj);
> @@ -1680,11 +1694,18 @@ alloc_step_batch(struct workload *wrk, struct w_step *w)
>  	w->bb_size = PAGE_SIZE;
>  	w->i915.obj[j].handle = alloc_bo(fd, &w->bb_size);
>  	w->i915.obj[j].flags = EXEC_OBJECT_WRITE;
> +	if (vm->ahnd) {
> +		addr = get_offset(vm->ahnd, w->i915.obj[j].handle, w->bb_size, 0);
> +		w->i915.obj[j].offset = CANONICAL(addr);
> +		w->i915.obj[j].flags |= objflags;
> +	}
> +
>  	j++;
>  	igt_assert(j < nr_obj);
>  
>  	for_each_dep(dep, w->data_deps) {
>  		uint32_t dep_handle;
> +		uint64_t dep_size;
>  
>  		if (dep->working_set == -1) {
>  			int dep_idx = w->idx + dep->target;
> @@ -1694,6 +1715,7 @@ alloc_step_batch(struct workload *wrk, struct w_step *w)
>  			igt_assert(wrk->steps[dep_idx].type == BATCH);
>  
>  			dep_handle = wrk->steps[dep_idx].i915.obj[0].handle;
> +			dep_size = w->bb_size;
>  		} else {
>  			struct working_set *set;
>  
> @@ -1707,18 +1729,33 @@ alloc_step_batch(struct workload *wrk, struct w_step *w)
>  			igt_assert(set->sizes[dep->target].size);
>  
>  			dep_handle = set->handles[dep->target];
> +			dep_size = set->sizes[dep->target].size;
>  		}
>  
>  		w->i915.obj[j].flags = dep->write ? EXEC_OBJECT_WRITE : 0;
>  		w->i915.obj[j].handle = dep_handle;
> +		if (vm->ahnd) {
> +			addr = get_offset(vm->ahnd, w->i915.obj[j].handle, dep_size, 0);
> +			w->i915.obj[j].offset = CANONICAL(addr);
> +			w->i915.obj[j].flags |= objflags;
> +		}
>  		j++;
>  		igt_assert(j < nr_obj);
>  	}
>  
>  	w->bb_handle = w->i915.obj[j].handle = alloc_bo(fd, &w->bb_size);
> +	if (vm->ahnd) {
> +		addr = get_offset(vm->ahnd, w->i915.obj[j].handle, w->bb_size, 0);
> +		w->i915.obj[j].offset = CANONICAL(addr);
> +		w->i915.obj[j].flags |= objflags;
> +	}
>  	w->i915.obj[j].relocation_count = create_bb(w, j);
> -	igt_assert(w->i915.obj[j].relocation_count <= ARRAY_SIZE(w->i915.reloc));
> -	w->i915.obj[j].relocs_ptr = to_user_pointer(&w->i915.reloc);
> +	if (vm->ahnd) {
> +		w->i915.obj[j].relocation_count = 0;
> +	} else {
> +		igt_assert(w->i915.obj[j].relocation_count <= ARRAY_SIZE(w->i915.reloc));
> +		w->i915.obj[j].relocs_ptr = to_user_pointer(&w->i915.reloc);
> +	}
>  
>  	w->i915.eb.buffers_ptr = to_user_pointer(w->i915.obj);
>  	w->i915.eb.buffer_count = j + 1;
> @@ -1738,7 +1775,7 @@ alloc_step_batch(struct workload *wrk, struct w_step *w)
>  static void
>  xe_alloc_step_batch(struct workload *wrk, struct w_step *w)
>  {
> -	struct xe_vm *vm = xe_get_vm(wrk, w);
> +	struct vm *vm = get_vm(wrk, w);
>  	struct xe_exec_queue *eq = xe_get_eq(wrk, w);
>  	struct dep_entry *dep;
>  	int i;
> @@ -2032,7 +2069,7 @@ static void measure_active_set(struct workload *wrk)
>  
>  #define alloca0(sz) ({ size_t sz__ = (sz); memset(alloca(sz__), 0, sz__); })
>  
> -static void xe_vm_create_(struct xe_vm *vm)
> +static void xe_vm_create_(struct vm *vm)
>  {
>  	uint32_t flags = 0;
>  
> @@ -2046,7 +2083,7 @@ static void xe_vm_create_(struct xe_vm *vm)
>  static void xe_exec_queue_create_(struct ctx *ctx, struct xe_exec_queue *eq)
>  {
>  	struct drm_xe_exec_queue_create create = {
> -		.vm_id = ctx->xe.vm->id,
> +		.vm_id = ctx->vm->id,
>  		.width = 1,
>  		.num_placements = eq->nr_hwes,
>  		.instances = to_user_pointer(eq->hwe_list),
> @@ -2159,6 +2196,13 @@ static int prepare_contexts(unsigned int id, struct workload *wrk)
>  				gem_context_get_param(fd, &param);
>  				igt_assert(param.value);
>  				share_vm = param.value;
> +				wrk->nr_vms = 1;
> +				wrk->vm_list = calloc(wrk->nr_vms, sizeof(struct vm));
> +				igt_assert(wrk->vm_list);
> +				wrk->vm_list->id = share_vm;
> +				wrk->vm_list->ahnd = intel_allocator_open(fd, share_vm,
> +								INTEL_ALLOCATOR_RELOC);
--------------------------------^
Align to 'fd'

> +				ctx2->vm = wrk->vm_list;
>  				break;
>  			}
>  
> @@ -2174,6 +2218,7 @@ static int prepare_contexts(unsigned int id, struct workload *wrk)
>  		ctx_id = args.ctx_id;
>  		ctx->id = ctx_id;
>  		ctx->sseu = device_sseu.slice_mask;
> +		ctx->vm = wrk->vm_list;
>  
>  		__configure_context(ctx_id, wrk->prio);
>  
> @@ -2267,16 +2312,17 @@ static int xe_prepare_contexts(unsigned int id, struct workload *wrk)
>  	unsigned int i;
>  
>  	/* shortcut, create one vm */
> -	wrk->xe.nr_vms = 1;
> -	wrk->xe.vm_list = calloc(wrk->xe.nr_vms, sizeof(struct xe_vm));
> -	wrk->xe.vm_list->compute_mode = false;
> -	xe_vm_create_(wrk->xe.vm_list);
> -	wrk->xe.vm_list->ahnd = intel_allocator_open(fd, wrk->xe.vm_list->id,
> +	wrk->nr_vms = 1;
> +	wrk->vm_list = calloc(wrk->nr_vms, sizeof(struct vm));
> +	igt_assert(wrk->vm_list);
> +	wrk->vm_list->compute_mode = false;
> +	xe_vm_create_(wrk->vm_list);
> +	wrk->vm_list->ahnd = intel_allocator_open(fd, wrk->vm_list->id,
>  						     INTEL_ALLOCATOR_RELOC);

Same here, align.

>  
>  	__for_each_ctx(ctx, wrk, ctx_idx) {
>  		/* link with vm */
> -		ctx->xe.vm = wrk->xe.vm_list;
> +		ctx->vm = wrk->vm_list;

Why do you treat vm_list as actual vm? Why not changing s/vm_list/vm/

With above aligning fixed
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

>  		for_each_w_step(w, wrk) {
>  			if (w->context != ctx_idx)
>  				continue;
> @@ -2846,7 +2892,7 @@ static void *run_workload(void *data)
>  				w_step_sync(w);
>  				syncobj_destroy(fd, w->xe.syncs[0].handle);
>  				free(w->xe.syncs);
> -				xe_vm_unbind_sync(fd, xe_get_vm(wrk, w)->id, 0, w->xe.exec.address,
> +				xe_vm_unbind_sync(fd, get_vm(wrk, w)->id, 0, w->xe.exec.address,
>  						  w->bb_size);
>  				gem_munmap(w->xe.data, w->bb_size);
>  				gem_close(fd, w->bb_handle);
> -- 
> 2.31.1
> 
