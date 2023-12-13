Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3632F10E2B4
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Dec 2023 13:47:26 +0000 (UTC)
Message-ID: <1de0993e-22dc-4952-b024-1b4022d0a8c5@linux.intel.com>
Date: Wed, 13 Dec 2023 13:47:22 +0000
MIME-Version: 1.0
Subject: Re: [PATCH i-g-t] benchmarks/gem_wsim: Support gens without
 relocations
Content-Language: en-US
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20231212113449.26800-1-marcin.bernatowicz@linux.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20231212113449.26800-1-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


On 12/12/2023 11:34, Marcin Bernatowicz wrote:
> This commit adopts the approach present in lib/igt_dummyload
> to support generations that do not use relocations.
> The intel_allocator is leveraged to compute offsets on these generations.
> Apart of this change, the 'struct vm' is now shared by both i915 and
> Xe. It includes a 'vm_id' that the intel_allocator uses for address
> assignment.
> This modification enhances gem_wsim compatibility with newer platforms
> running i915.
> 
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> ---
>   benchmarks/gem_wsim.c | 106 +++++++++++++++++++++++++++++++-----------
>   1 file changed, 80 insertions(+), 26 deletions(-)
> 
> diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
> index 30673da8f..7455cd6a1 100644
> --- a/benchmarks/gem_wsim.c
> +++ b/benchmarks/gem_wsim.c
> @@ -205,7 +205,7 @@ struct w_step {
>   	uint32_t bb_handle;
>   };
>   
> -struct xe_vm {
> +struct vm {
>   	uint32_t id;
>   	bool compute_mode;
>   	uint64_t ahnd;
> @@ -226,9 +226,9 @@ struct ctx {
>   	struct bond *bonds;
>   	bool load_balance;
>   	uint64_t sseu;
> +	/* reference to vm */
> +	struct vm *vm;
>   	struct {
> -		/* reference to vm */
> -		struct xe_vm *vm;
>   		/* exec queues */
>   		unsigned int nr_queues;
>   		struct xe_exec_queue *queue_list;
> @@ -256,10 +256,8 @@ struct workload {
>   	unsigned int nr_ctxs;
>   	struct ctx *ctx_list;
>   
> -	struct {
> -		unsigned int nr_vms;
> -		struct xe_vm *vm_list;
> -	} xe;
> +	unsigned int nr_vms;
> +	struct vm *vm_list;
>   
>   	struct working_set **working_sets; /* array indexed by set id */
>   	int max_working_set_id;
> @@ -1504,7 +1502,16 @@ static unsigned int create_bb(struct w_step *w, int self)
>   	gem_set_domain(fd, w->bb_handle,
>   		       I915_GEM_DOMAIN_WC, I915_GEM_DOMAIN_WC);
>   
> -	cs = ptr = gem_mmap__wc(fd, w->bb_handle, 0, w->bb_size, PROT_WRITE);
> +	if (__gem_set_caching(fd, w->bb_handle,
> +			      I915_CACHING_CACHED) == 0) {
> +		cs = ptr = gem_mmap__cpu(fd, w->bb_handle,
> +					   0, w->bb_size,
> +					   PROT_READ | PROT_WRITE);
> +	} else
> +		cs = ptr = gem_mmap__device_coherent(fd,
> +						       w->bb_handle,
> +						       0, w->bb_size,
> +						       PROT_READ | PROT_WRITE);

How is this hink related I did not get it? Should it be a separate patch?

>   
>   	/* Store initial 64b timestamp: start */
>   	*cs++ = MI_LOAD_REGISTER_IMM(1) | MI_CS_MMIO_DST;
> @@ -1539,9 +1546,11 @@ static unsigned int create_bb(struct w_step *w, int self)
>   	/* Save delta for indirect read by COND_BBE */
>   	*cs++ = MI_STORE_REGISTER_MEM_CMD | (1 + use_64b) | MI_CS_MMIO_DST;
>   	*cs++ = CS_GPR(NOW_TS);
> +	w->i915.reloc[r].presumed_offset = w->i915.obj[self].offset;
>   	w->i915.reloc[r].target_handle = self;
>   	w->i915.reloc[r].offset = offset_in_page(cs);
> -	*cs++ = w->i915.reloc[r].delta = 4000;
> +	w->i915.reloc[r].delta = 4000;
> +	*cs++ = w->i915.reloc[r].presumed_offset + w->i915.reloc[r].delta;
>   	*cs++ = 0;
>   	r++;
>   
> @@ -1556,17 +1565,21 @@ static unsigned int create_bb(struct w_step *w, int self)
>   	*cs++ = MI_COND_BATCH_BUFFER_END | MI_DO_COMPARE | (1 + use_64b);
>   	w->i915.bb_duration = cs;
>   	*cs++ = 0;
> +	w->i915.reloc[r].presumed_offset = w->i915.obj[self].offset;
>   	w->i915.reloc[r].target_handle = self;
>   	w->i915.reloc[r].offset = offset_in_page(cs);
> -	*cs++ = w->i915.reloc[r].delta = 4000;
> +	w->i915.reloc[r].delta = 4000;
> +	*cs++ = w->i915.reloc[r].presumed_offset + w->i915.reloc[r].delta;
>   	*cs++ = 0;
>   	r++;
>   
>   	/* Otherwise back to recalculating delta */
>   	*cs++ = MI_BATCH_BUFFER_START | 1 << 8 | use_64b;
> +	w->i915.reloc[r].presumed_offset = w->i915.obj[self].offset;
>   	w->i915.reloc[r].target_handle = self;
>   	w->i915.reloc[r].offset = offset_in_page(cs);
> -	*cs++ = w->i915.reloc[r].delta = offset_in_page(jmp);
> +	w->i915.reloc[r].delta = offset_in_page(jmp);
> +	*cs++ = w->i915.reloc[r].presumed_offset + w->i915.reloc[r].delta;
>   	*cs++ = 0;
>   	r++;
>   
> @@ -1648,10 +1661,10 @@ xe_get_eq(struct workload *wrk, const struct w_step *w)
>   	return eq;
>   }
>   
> -static struct xe_vm *
> -xe_get_vm(struct workload *wrk, const struct w_step *w)
> +static struct vm *
> +get_vm(struct workload *wrk, const struct w_step *w)
>   {
> -	return wrk->xe.vm_list;
> +	return wrk->vm_list;

Why does this have 'w' as an argument but doesn't use it?

>   }
>   
>   static uint32_t alloc_bo(int i915, unsigned long *size)
> @@ -1673,6 +1686,16 @@ alloc_step_batch(struct workload *wrk, struct w_step *w)
>   	struct dep_entry *dep;
>   	unsigned int j = 0;
>   	unsigned int nr_obj = 2 + w->data_deps.nr;
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
>   	w->i915.obj = calloc(nr_obj, sizeof(*w->i915.obj));
>   	igt_assert(w->i915.obj);
> @@ -1680,11 +1703,18 @@ alloc_step_batch(struct workload *wrk, struct w_step *w)
>   	w->bb_size = PAGE_SIZE;
>   	w->i915.obj[j].handle = alloc_bo(fd, &w->bb_size);
>   	w->i915.obj[j].flags = EXEC_OBJECT_WRITE;
> +	if (vm->ahnd) {
> +		addr = get_offset(vm->ahnd, w->i915.obj[j].handle, w->bb_size, 0);
> +		w->i915.obj[j].offset = CANONICAL(addr);
> +		w->i915.obj[j].flags |= objflags;
> +	}
> +
>   	j++;
>   	igt_assert(j < nr_obj);
>   
>   	for_each_dep(dep, w->data_deps) {
>   		uint32_t dep_handle;
> +		uint64_t dep_size;

w->bb_size is unsigned long, the two should probably match.

>   
>   		if (dep->working_set == -1) {
>   			int dep_idx = w->idx + dep->target;
> @@ -1694,6 +1724,7 @@ alloc_step_batch(struct workload *wrk, struct w_step *w)
>   			igt_assert(wrk->steps[dep_idx].type == BATCH);
>   
>   			dep_handle = wrk->steps[dep_idx].i915.obj[0].handle;
> +			dep_size = w->bb_size;
>   		} else {
>   			struct working_set *set;
>   
> @@ -1707,18 +1738,33 @@ alloc_step_batch(struct workload *wrk, struct w_step *w)
>   			igt_assert(set->sizes[dep->target].size);
>   
>   			dep_handle = set->handles[dep->target];
> +			dep_size = set->sizes[dep->target].size;
>   		}
>   
>   		w->i915.obj[j].flags = dep->write ? EXEC_OBJECT_WRITE : 0;
>   		w->i915.obj[j].handle = dep_handle;
> +		if (vm->ahnd) {
> +			addr = get_offset(vm->ahnd, w->i915.obj[j].handle, dep_size, 0);
> +			w->i915.obj[j].offset = CANONICAL(addr);
> +			w->i915.obj[j].flags |= objflags;
> +		}
>   		j++;
>   		igt_assert(j < nr_obj);
>   	}
>   
>   	w->bb_handle = w->i915.obj[j].handle = alloc_bo(fd, &w->bb_size);
> +	if (vm->ahnd) {
> +		addr = get_offset(vm->ahnd, w->i915.obj[j].handle, w->bb_size, 0);
> +		w->i915.obj[j].offset = CANONICAL(addr);
> +		w->i915.obj[j].flags |= objflags;
> +	}
>   	w->i915.obj[j].relocation_count = create_bb(w, j);
> -	igt_assert(w->i915.obj[j].relocation_count <= ARRAY_SIZE(w->i915.reloc));
> -	w->i915.obj[j].relocs_ptr = to_user_pointer(&w->i915.reloc);
> +	if (vm->ahnd) {
> +		w->i915.obj[j].relocation_count = 0;
> +	} else {
> +		igt_assert(w->i915.obj[j].relocation_count <= ARRAY_SIZE(w->i915.reloc));
> +		w->i915.obj[j].relocs_ptr = to_user_pointer(&w->i915.reloc);
> +	}
>   
>   	w->i915.eb.buffers_ptr = to_user_pointer(w->i915.obj);
>   	w->i915.eb.buffer_count = j + 1;
> @@ -1738,7 +1784,7 @@ alloc_step_batch(struct workload *wrk, struct w_step *w)
>   static void
>   xe_alloc_step_batch(struct workload *wrk, struct w_step *w)
>   {
> -	struct xe_vm *vm = xe_get_vm(wrk, w);
> +	struct vm *vm = get_vm(wrk, w);
>   	struct xe_exec_queue *eq = xe_get_eq(wrk, w);
>   	struct dep_entry *dep;
>   	int i;
> @@ -2032,7 +2078,7 @@ static void measure_active_set(struct workload *wrk)
>   
>   #define alloca0(sz) ({ size_t sz__ = (sz); memset(alloca(sz__), 0, sz__); })
>   
> -static void xe_vm_create_(struct xe_vm *vm)
> +static void xe_vm_create_(struct vm *vm)
>   {
>   	uint32_t flags = 0;
>   
> @@ -2046,7 +2092,7 @@ static void xe_vm_create_(struct xe_vm *vm)
>   static void xe_exec_queue_create_(struct ctx *ctx, struct xe_exec_queue *eq)
>   {
>   	struct drm_xe_exec_queue_create create = {
> -		.vm_id = ctx->xe.vm->id,
> +		.vm_id = ctx->vm->id,
>   		.width = 1,
>   		.num_placements = eq->nr_hwes,
>   		.instances = to_user_pointer(eq->hwe_list),
> @@ -2159,6 +2205,12 @@ static int prepare_contexts(unsigned int id, struct workload *wrk)
>   				gem_context_get_param(fd, &param);
>   				igt_assert(param.value);
>   				share_vm = param.value;
> +				wrk->nr_vms = 1;
> +				wrk->vm_list = calloc(wrk->nr_vms, sizeof(struct vm));
> +				igt_assert(wrk->vm_list);
> +				wrk->vm_list->id = share_vm;
> +				wrk->vm_list->ahnd = get_reloc_ahnd(fd, share_vm);
> +				ctx2->vm = wrk->vm_list;
>   				break;
>   			}
>   
> @@ -2174,6 +2226,7 @@ static int prepare_contexts(unsigned int id, struct workload *wrk)
>   		ctx_id = args.ctx_id;
>   		ctx->id = ctx_id;
>   		ctx->sseu = device_sseu.slice_mask;
> +		ctx->vm = wrk->vm_list;
>   
>   		__configure_context(ctx_id, wrk->prio);
>   
> @@ -2267,16 +2320,17 @@ static int xe_prepare_contexts(unsigned int id, struct workload *wrk)
>   	unsigned int i;
>   
>   	/* shortcut, create one vm */
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
>   						     INTEL_ALLOCATOR_RELOC)

Can some of this go to common, now that struct vm is common? Maybe not.. 
remind me, plan is for xe backend to support more than one vm? That's 
why get_vm has w_step as argument?

Regards,

Tvrtko

>   
>   	__for_each_ctx(ctx, wrk, ctx_idx) {
>   		/* link with vm */
> -		ctx->xe.vm = wrk->xe.vm_list;
> +		ctx->vm = wrk->vm_list;
>   		for_each_w_step(w, wrk) {
>   			if (w->context != ctx_idx)
>   				continue;
> @@ -2846,7 +2900,7 @@ static void *run_workload(void *data)
>   				w_step_sync(w);
>   				syncobj_destroy(fd, w->xe.syncs[0].handle);
>   				free(w->xe.syncs);
> -				xe_vm_unbind_sync(fd, xe_get_vm(wrk, w)->id, 0, w->xe.exec.address,
> +				xe_vm_unbind_sync(fd, get_vm(wrk, w)->id, 0, w->xe.exec.address,
>   						  w->bb_size);
>   				gem_munmap(w->xe.data, w->bb_size);
>   				gem_close(fd, w->bb_handle);
