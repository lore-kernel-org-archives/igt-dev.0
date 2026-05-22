Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C301CD5BB0
	for <igt-dev@archiver.kernel.org>; Fri, 22 May 2026 13:01:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CB5410F55C;
	Fri, 22 May 2026 13:01:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CX8xeZho";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2B4910F55C
 for <igt-dev@lists.freedesktop.org>; Fri, 22 May 2026 13:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779454845; x=1810990845;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=dwIuvWDKU6GXZUD48DUkyEL75tU8v6asikzKhbS2Z7Y=;
 b=CX8xeZhoWYcqsBe5Z01H+9ttFgrVfUoW7GC1LBdZVIYQ1jrn7FQqC6dC
 nK7UMc7zY0GtKuAcATZKCrabRIraVtrb1Vj5X7Ld4KsLa5YR0ivRIpOS1
 Dnpliy625lT3pRcIM0C4iHG0gegl8WfkClxuryv+0u0jwNTv9WzmqS20b
 /keh/aue18x76xAyb6Dx9g4g3HE/K/lmEA2eqK89DA0oev87O/fX40kAv
 FoxM4hGWlUclF8YBtiUKB6oefojnOzwDOe7gMVKzcoQnwzeymwDFQX3KH
 POep0dXqDaAev3OcZ248eix6A+IVVqAXxiz4XG6AVXYfjair7WjfeK7fE A==;
X-CSE-ConnectionGUID: f5DO+rCXRI2ONcCM3apurg==
X-CSE-MsgGUID: HGS+whrgSrmOVjLZgjvwvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="91491588"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="91491588"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 06:00:45 -0700
X-CSE-ConnectionGUID: sGpW+tf+TY6qWNXc51XtuA==
X-CSE-MsgGUID: 0Zu4QeYvTE2Rm+od4XIB9w==
X-ExtLoop1: 1
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.245.22])
 ([10.245.245.22])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 06:00:42 -0700
Message-ID: <cadf1fcb-182d-471f-aa33-26ff08437025@intel.com>
Date: Fri, 22 May 2026 14:00:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] drm/xe/xe_pm: Have high VRAM usage during system
 suspend
To: Karthik Poosa <karthik.poosa@intel.com>, igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com, 
 rodrigo.vivi@intel.com
References: <20260522042443.1055111-1-karthik.poosa@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260522042443.1055111-1-karthik.poosa@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 22/05/2026 05:24, Karthik Poosa wrote:
> Create high VRAM usage by allocating multiple BOs prior to system suspend.
> This increases eviction time, helping to expose any unknown issues in the
> suspend‑resume flow.
> 
> v2:
>   - Split large BO into 8MB chunks and map jobs per chunk. (Matthew)
>   - Use SZ_1M for buffer size. (Zbigniew)
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> Assisted-by: GitHub Copilot (GPT-5.3-Codex)

Looks reasonable to me. With the commit title fix, and assuming CI is happy,

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   tests/intel/xe_pm.c | 171 ++++++++++++++++++++++++++++++--------------
>   1 file changed, 119 insertions(+), 52 deletions(-)
> 
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index 54f2e9d18..14c51a0d1 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -234,9 +234,15 @@ static void*
>   child_exec(void *arguments)
>   {
>   	child_exec_args *args = (child_exec_args *)arguments;
> +	struct job_data {
> +		uint32_t batch[16];
> +		uint64_t pad;
> +		uint32_t data;
> +	};
>   
>   	uint32_t vm;
>   	uint64_t addr = 0x1a0000;
> +	const size_t bo_chunk_size = 8 * SZ_1M;
>   	struct drm_xe_sync sync[2] = {
>   		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
>   		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
> @@ -250,13 +256,15 @@ child_exec(void *arguments)
>   	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
>   	uint32_t bind_exec_queues[MAX_N_EXEC_QUEUES];
>   	uint32_t syncobjs[MAX_N_EXEC_QUEUES];
> -	size_t bo_size;
> -	uint32_t bo = 0;
> -	struct {
> -		uint32_t batch[16];
> -		uint64_t pad;
> -		uint32_t data;
> -	} *data;
> +	size_t total_bo_size;
> +	size_t *bo_sizes = NULL;
> +	uint64_t *bo_offsets = NULL;
> +	uint32_t *bos = NULL;
> +	struct job_data *userptr_data = NULL;
> +	struct job_data **bo_data = NULL;
> +	int entries_per_bo = args->n_execs;
> +	int n_bos = 1;
> +	bool use_bo = !(args->flags & USERPTR);
>   	int i, b;
>   	uint64_t active_time;
>   	bool check_rpm = (args->d_state == IGT_ACPI_D3Hot ||
> @@ -276,24 +284,49 @@ child_exec(void *arguments)
>   		igt_assert(igt_pm_get_runtime_active_time(args->device.pci_xe) >
>   			   active_time);
>   
> -	bo_size = sizeof(*data) * args->n_execs;
> -	bo_size = xe_bb_size(args->device.fd_xe, bo_size);
> +	total_bo_size = sizeof(struct job_data) * args->n_execs;
> +	total_bo_size = xe_bb_size(args->device.fd_xe, total_bo_size);
>   
> -	if (args->flags & USERPTR) {
> -		data = aligned_alloc(xe_get_default_alignment(args->device.fd_xe),
> -				     bo_size);
> -		memset(data, 0, bo_size);
> +	if (!use_bo) {
> +		userptr_data = aligned_alloc(xe_get_default_alignment(args->device.fd_xe),
> +					 total_bo_size);
> +		memset(userptr_data, 0, total_bo_size);
>   	} else {
> -		if (args->flags & PREFETCH)
> -			bo = xe_bo_create(args->device.fd_xe, 0, bo_size,
> -					  all_memory_regions(args->device.fd_xe) |
> -					  vram_if_possible(args->device.fd_xe, 0),
> -					  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> -		else
> -			bo = xe_bo_create(args->device.fd_xe, vm, bo_size,
> -					  vram_if_possible(args->device.fd_xe, args->eci->gt_id),
> -					  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> -		data = xe_bo_map(args->device.fd_xe, bo, bo_size);
> +		size_t bo_8mb = ALIGN(bo_chunk_size,
> +					     xe_get_default_alignment(args->device.fd_xe));
> +		size_t offset = 0;
> +
> +		entries_per_bo = bo_8mb / sizeof(struct job_data);
> +		igt_assert(entries_per_bo > 0);
> +		n_bos = DIV_ROUND_UP(args->n_execs, entries_per_bo);
> +
> +		bo_sizes = calloc(n_bos, sizeof(*bo_sizes));
> +		bo_offsets = calloc(n_bos, sizeof(*bo_offsets));
> +		bos = calloc(n_bos, sizeof(*bos));
> +		bo_data = calloc(n_bos, sizeof(*bo_data));
> +		igt_assert(bo_sizes && bo_offsets && bos && bo_data);
> +
> +		for (i = 0; i < n_bos; i++) {
> +			int entries = min(entries_per_bo, args->n_execs - i * entries_per_bo);
> +
> +			bo_sizes[i] = xe_bb_size(args->device.fd_xe,
> +						 sizeof(struct job_data) * entries);
> +			bo_offsets[i] = offset;
> +			offset += bo_sizes[i];
> +
> +			if (args->flags & PREFETCH)
> +				bos[i] = xe_bo_create(args->device.fd_xe, 0, bo_sizes[i],
> +						all_memory_regions(args->device.fd_xe) |
> +						vram_if_possible(args->device.fd_xe, 0),
> +						DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +			else
> +				bos[i] = xe_bo_create(args->device.fd_xe, vm, bo_sizes[i],
> +						vram_if_possible(args->device.fd_xe, args->eci->gt_id),
> +						DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +			bo_data[i] = xe_bo_map(args->device.fd_xe, bos[i], bo_sizes[i]);
> +		}
> +
> +		total_bo_size = offset;
>   	}
>   
>   	for (i = 0; i < args->n_exec_queues; i++) {
> @@ -305,18 +338,27 @@ child_exec(void *arguments)
>   
>   	sync[0].handle = syncobj_create(args->device.fd_xe, 0);
>   
> -	if (bo) {
> -		for (i = 0; i < n_vmas; i++)
> -			xe_vm_bind_async(args->device.fd_xe, vm, bind_exec_queues[0], bo,
> -					 0, addr + i * bo_size, bo_size, sync, 1);
> +	if (use_bo) {
> +		int j;
> +
> +		for (i = 0; i < n_vmas; i++) {
> +			for (j = 0; j < n_bos; j++)
> +				xe_vm_bind_async(args->device.fd_xe, vm, bind_exec_queues[0], bos[j],
> +						 0, addr + i * total_bo_size + bo_offsets[j],
> +						 bo_sizes[j], sync, 1);
> +		}
>   	} else {
>   		xe_vm_bind_userptr_async(args->device.fd_xe, vm, bind_exec_queues[0],
> -					 to_user_pointer(data), addr, bo_size, sync, 1);
> +					 to_user_pointer(userptr_data), addr, total_bo_size, sync, 1);
>   	}
>   
> -	if (args->flags & PREFETCH)
> -		xe_vm_prefetch_async(args->device.fd_xe, vm, bind_exec_queues[0], 0,
> -				     addr, bo_size, sync, 1, 0);
> +	if (args->flags & PREFETCH) {
> +		int j;
> +
> +		for (j = 0; j < n_bos; j++)
> +			xe_vm_prefetch_async(args->device.fd_xe, vm, bind_exec_queues[0], 0,
> +					     addr + bo_offsets[j], bo_sizes[j], sync, 1, 0);
> +	}
>   
>   	if (check_rpm) {
>   		igt_assert(in_d3(args->device, args->d_state));
> @@ -324,19 +366,23 @@ child_exec(void *arguments)
>   	}
>   
>   	for (i = 0; i < args->n_execs; i++) {
> -		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
> -		uint64_t batch_addr = addr + batch_offset;
> -		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
> -		uint64_t sdi_addr = addr + sdi_offset;
> +		int bo_idx = i / entries_per_bo;
> +		int bo_entry = i % entries_per_bo;
> +		struct job_data *job = use_bo ? &bo_data[bo_idx][bo_entry] : &userptr_data[i];
> +		uint64_t bo_base = use_bo ? bo_offsets[bo_idx] : 0;
> +		uint64_t batch_offset = (char *)&job->batch - (char *)(use_bo ? bo_data[bo_idx] : userptr_data);
> +		uint64_t batch_addr = addr + bo_base + batch_offset;
> +		uint64_t sdi_offset = (char *)&job->data - (char *)(use_bo ? bo_data[bo_idx] : userptr_data);
> +		uint64_t sdi_addr = addr + bo_base + sdi_offset;
>   		int e = i % args->n_exec_queues;
>   
>   		b = 0;
> -		data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
> -		data[i].batch[b++] = sdi_addr;
> -		data[i].batch[b++] = sdi_addr >> 32;
> -		data[i].batch[b++] = 0xc0ffee;
> -		data[i].batch[b++] = MI_BATCH_BUFFER_END;
> -		igt_assert(b <= ARRAY_SIZE(data[i].batch));
> +		job->batch[b++] = MI_STORE_DWORD_IMM_GEN4;
> +		job->batch[b++] = sdi_addr;
> +		job->batch[b++] = sdi_addr >> 32;
> +		job->batch[b++] = 0xc0ffee;
> +		job->batch[b++] = MI_BATCH_BUFFER_END;
> +		igt_assert(b <= ARRAY_SIZE(job->batch));
>   
>   		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
>   		sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
> @@ -352,7 +398,7 @@ child_exec(void *arguments)
>   
>   		igt_assert(syncobj_wait(args->device.fd_xe, &syncobjs[e], 1,
>   					INT64_MAX, 0, NULL));
> -		igt_assert_eq(data[i].data, 0xc0ffee);
> +		igt_assert_eq(job->data, 0xc0ffee);
>   
>   		if (i == args->n_execs / 2 && args->s_state != NO_SUSPEND) {
>   			/* Until this point, only one thread runs at a given time. Signal
> @@ -377,16 +423,31 @@ child_exec(void *arguments)
>   				INT64_MAX, 0, NULL));
>   
>   	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
> -	if (n_vmas > 1)
> -		xe_vm_unbind_all_async(args->device.fd_xe, vm, 0, bo, sync, 1);
> -	else
> +	if (use_bo) {
> +		int j;
> +
> +		if (n_vmas > 1) {
> +			for (j = 0; j < n_bos; j++)
> +				xe_vm_unbind_all_async(args->device.fd_xe, vm, 0, bos[j], sync, 1);
> +		} else {
> +			for (j = 0; j < n_bos; j++)
> +				xe_vm_unbind_async(args->device.fd_xe, vm, bind_exec_queues[0], 0,
> +					   addr + bo_offsets[j], bo_sizes[j], sync, 1);
> +		}
> +	} else {
>   		xe_vm_unbind_async(args->device.fd_xe, vm, bind_exec_queues[0], 0,
> -				   addr, bo_size, sync, 1);
> +				   addr, total_bo_size, sync, 1);
> +	}
>   	igt_assert(syncobj_wait(args->device.fd_xe, &sync[0].handle, 1,
>   				INT64_MAX, 0, NULL));
>   
> -	for (i = 0; i < args->n_execs; i++)
> -		igt_assert_eq(data[i].data, 0xc0ffee);
> +	for (i = 0; i < args->n_execs; i++) {
> +		int bo_idx = i / entries_per_bo;
> +		int bo_entry = i % entries_per_bo;
> +		struct job_data *job = use_bo ? &bo_data[bo_idx][bo_entry] : &userptr_data[i];
> +
> +		igt_assert_eq(job->data, 0xc0ffee);
> +	}
>   
>   	syncobj_destroy(args->device.fd_xe, sync[0].handle);
>   	for (i = 0; i < args->n_exec_queues; i++) {
> @@ -396,11 +457,17 @@ child_exec(void *arguments)
>   			xe_exec_queue_destroy(args->device.fd_xe, bind_exec_queues[i]);
>   	}
>   
> -	if (bo) {
> -		munmap(data, bo_size);
> -		gem_close(args->device.fd_xe, bo);
> +	if (use_bo) {
> +		for (i = 0; i < n_bos; i++) {
> +			munmap(bo_data[i], bo_sizes[i]);
> +			gem_close(args->device.fd_xe, bos[i]);
> +		}
> +		free(bo_data);
> +		free(bos);
> +		free(bo_offsets);
> +		free(bo_sizes);
>   	} else {
> -		free(data);
> +		free(userptr_data);
>   	}
>   
>   	xe_vm_destroy(args->device.fd_xe, vm);

