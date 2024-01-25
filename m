Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3441C47258
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jan 2024 06:12:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50C9410E199;
	Thu, 25 Jan 2024 06:12:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B56C10E199
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jan 2024 06:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706163126; x=1737699126;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=HqDlTnLYUhgpfe5QxCHnm4ETDsRfScSL2uqVh03dUdI=;
 b=SlZZtbVSEpCtv2izQL2RdcwNf7zWc78d5SFgLUzbaesoXQIMqsCQSaH7
 N+vznAKGAkLzvq0B5YzdUbeC6h8lX2pIK6f2z/mxvOgse2YvO2h9MTV5V
 HFgCrDcd2MqrCKdeU3XxW2d/U+5Ssivt0liO0R1r4V/0Nz6eA3971t+/E
 5LDU6XFU3CrmdxbFsIlQT4c+GaGXwmu+PWqDR3qxcCILDrxTrcjFtMbsP
 Ae/e079BFXliKexhU36Dt4FeT6yPwjJi+442PAQ83Ko2pSS/DUkrhd/pl
 pQkdnixBb5qUdtWiNQkkj0jZPzaTBArMJcpnxv5LEhLe2JCNcX4HWTWao A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="9183817"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="9183817"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 22:12:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="28381148"
Received: from unknown (HELO localhost) ([10.246.28.142])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 22:12:04 -0800
Date: Thu, 25 Jan 2024 07:12:00 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH i-g-t 2/5] tests/intel/xe: account for prefetch
Message-ID: <20240125061200.6p4nieb6e5yoeyil@zkempczy-mobl2>
References: <20240124180713.268843-1-matthew.auld@intel.com>
 <20240124180713.268843-2-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240124180713.268843-2-matthew.auld@intel.com>
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
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Wed, Jan 24, 2024 at 06:07:10PM +0000, Matthew Auld wrote:
> Xe2 expects an extra page after the batch to avoid prefetch hitting an
> invalid page. Not doing so can result in CAT errors. Do full audit of
> all xe_* tests where anything creating a batch should use the new
> bb helper.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  tests/intel/xe_ccs.c          | 6 +++---
>  tests/intel/xe_copy_basic.c   | 4 ++--
>  tests/intel/xe_create.c       | 2 +-
>  tests/intel/xe_evict_ccs.c    | 2 +-
>  tests/intel/xe_exec_reset.c   | 2 +-
>  tests/intel/xe_exercise_blt.c | 4 ++--
>  tests/intel/xe_pat.c          | 2 +-
>  tests/intel/xe_peer2peer.c    | 4 ++--
>  tests/intel/xe_pm_residency.c | 2 +-
>  tests/intel/xe_vm.c           | 6 ++++--
>  tests/intel/xe_waitfence.c    | 8 +++++---
>  11 files changed, 23 insertions(+), 19 deletions(-)
> 
> diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
> index 55ae0e46c..7d0e8ed7a 100644
> --- a/tests/intel/xe_ccs.c
> +++ b/tests/intel/xe_ccs.c
> @@ -119,7 +119,7 @@ static void surf_copy(int xe,
>  				 uc_mocs, comp_pat_index, BLT_INDIRECT_ACCESS);
>  	blt_set_ctrl_surf_object(&surf.dst, ccs, sysmem, ccssize, uc_mocs,
>  				 DEFAULT_PAT_INDEX, DIRECT_ACCESS);
> -	bb_size = xe_get_default_alignment(xe);
> +	bb_size = xe_bb_size(xe, SZ_4K);
>  	bb1 = xe_bo_create(xe, 0, bb_size, sysmem, 0);
>  	blt_set_batch(&surf.bb, bb1, bb_size, sysmem);
>  	blt_ctrl_surf_copy(xe, ctx, NULL, ahnd, &surf);
> @@ -295,7 +295,7 @@ static void block_copy(int xe,
>  	struct blt_block_copy_data_ext ext = {}, *pext = &ext;
>  	struct blt_copy_object *src, *mid, *dst;
>  	const uint32_t bpp = 32;
> -	uint64_t bb_size = xe_get_default_alignment(xe);
> +	uint64_t bb_size = xe_bb_size(xe, SZ_4K);
>  	uint64_t ahnd = intel_allocator_open(xe, ctx->vm, INTEL_ALLOCATOR_RELOC);
>  	uint32_t run_id = mid_tiling;
>  	uint32_t mid_region = (AT_LEAST_GEN(intel_get_drm_devid(xe), 20) &
> @@ -423,7 +423,7 @@ static void block_multicopy(int xe,
>  	struct blt_block_copy3_data_ext ext3 = {}, *pext3 = &ext3;
>  	struct blt_copy_object *src, *mid, *dst, *final;
>  	const uint32_t bpp = 32;
> -	uint64_t bb_size = xe_get_default_alignment(xe);
> +	uint64_t bb_size = xe_bb_size(xe, SZ_4K);
>  	uint64_t ahnd = intel_allocator_open(xe, ctx->vm, INTEL_ALLOCATOR_RELOC);
>  	uint32_t run_id = mid_tiling;
>  	uint32_t mid_region = (AT_LEAST_GEN(intel_get_drm_devid(xe), 20) &
> diff --git a/tests/intel/xe_copy_basic.c b/tests/intel/xe_copy_basic.c
> index 1bde876cd..66c666eac 100644
> --- a/tests/intel/xe_copy_basic.c
> +++ b/tests/intel/xe_copy_basic.c
> @@ -44,7 +44,7 @@ mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_ctx_t *ct
>  	 uint32_t size, uint32_t width, uint32_t height, uint32_t region)
>  {
>  	struct blt_mem_data mem = {};
> -	uint64_t bb_size = xe_get_default_alignment(fd);
> +	uint64_t bb_size = xe_bb_size(fd, SZ_4K);
>  	uint64_t ahnd = intel_allocator_open_full(fd, ctx->vm, 0, 0,
>  						  INTEL_ALLOCATOR_SIMPLE,
>  						  ALLOC_STRATEGY_LOW_TO_HIGH, 0);
> @@ -97,7 +97,7 @@ mem_set(int fd, uint32_t dst_handle, const intel_ctx_t *ctx, uint32_t size,
>  	uint32_t width, uint32_t height, uint8_t fill_data, uint32_t region)
>  {
>  	struct blt_mem_data mem = {};
> -	uint64_t bb_size = xe_get_default_alignment(fd);
> +	uint64_t bb_size = xe_bb_size(fd, SZ_4K);
>  	uint64_t ahnd = intel_allocator_open_full(fd, ctx->vm, 0, 0,
>  						  INTEL_ALLOCATOR_SIMPLE,
>  						  ALLOC_STRATEGY_LOW_TO_HIGH, 0);
> diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
> index 6d0670849..1d3918663 100644
> --- a/tests/intel/xe_create.c
> +++ b/tests/intel/xe_create.c
> @@ -325,7 +325,7 @@ static void create_big_vram(int fd, int gt)
>  static void create_contexts(int fd)
>  {
>  	unsigned int i, n = params.quantity ? params.quantity : 4096;
> -	uint64_t bo_size = xe_get_default_alignment(fd), bo_addr = 0x1a0000;
> +	uint64_t bo_size = xe_bb_size(fd, SZ_4K), bo_addr = 0x1a0000;
>  	uint32_t vm, bo, *batch, exec_queues[n];
>  	struct drm_xe_sync sync = {
>  		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
> diff --git a/tests/intel/xe_evict_ccs.c b/tests/intel/xe_evict_ccs.c
> index 5dd438cad..5d4720a71 100644
> --- a/tests/intel/xe_evict_ccs.c
> +++ b/tests/intel/xe_evict_ccs.c
> @@ -75,7 +75,7 @@ static void copy_obj(struct blt_copy_data *blt,
>  {
>  	struct blt_block_copy_data_ext ext = {};
>  	int fd = blt->fd;
> -	uint64_t bb_size = xe_get_default_alignment(fd);
> +	uint64_t bb_size = xe_bb_size(blt->fd, SZ_4K);
>  	uint32_t bb;
>  	uint32_t w, h;
>  
> diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
> index 168523c64..978b4d279 100644
> --- a/tests/intel/xe_exec_reset.c
> +++ b/tests/intel/xe_exec_reset.c
> @@ -675,7 +675,7 @@ static void submit_jobs(struct gt_thread_data *t)
>  	int fd = t->fd;
>  	uint32_t vm = xe_vm_create(fd, 0, 0);
>  	uint64_t addr = 0x1a0000;
> -	size_t bo_size = xe_get_default_alignment(fd);
> +	size_t bo_size = xe_bb_size(fd, SZ_4K);
>  	uint32_t bo;
>  	uint32_t *data;
>  
> diff --git a/tests/intel/xe_exercise_blt.c b/tests/intel/xe_exercise_blt.c
> index cc9060b1b..c908800cf 100644
> --- a/tests/intel/xe_exercise_blt.c
> +++ b/tests/intel/xe_exercise_blt.c
> @@ -118,7 +118,7 @@ static void fast_copy_emit(int xe, const intel_ctx_t *ctx,
>  	struct blt_fast_copy_data blt = {};
>  	struct blt_copy_object *src, *mid, *dst;
>  	const uint32_t bpp = 32;
> -	uint64_t bb_size = xe_get_default_alignment(xe);
> +	uint64_t bb_size = xe_bb_size(xe, SZ_4K);
>  	uint64_t ahnd = intel_allocator_open_full(xe, ctx->vm, 0, 0,
>  						  INTEL_ALLOCATOR_SIMPLE,
>  						  ALLOC_STRATEGY_LOW_TO_HIGH, 0);
> @@ -176,7 +176,7 @@ static void fast_copy(int xe, const intel_ctx_t *ctx,
>  	struct blt_copy_data blt = {};
>  	struct blt_copy_object *src, *mid, *dst;
>  	const uint32_t bpp = 32;
> -	uint64_t bb_size = xe_get_default_alignment(xe);
> +	uint64_t bb_size = xe_bb_size(xe, SZ_4K);
>  	uint64_t ahnd = intel_allocator_open_full(xe, ctx->vm, 0, 0,
>  						  INTEL_ALLOCATOR_SIMPLE,
>  						  ALLOC_STRATEGY_LOW_TO_HIGH, 0);
> diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
> index c5187bb94..40256bada 100644
> --- a/tests/intel/xe_pat.c
> +++ b/tests/intel/xe_pat.c
> @@ -262,7 +262,7 @@ static void pat_index_blt(struct xe_pat_param *p)
>  					 ALLOC_STRATEGY_LOW_TO_HIGH,
>  					 p->size->alignment);
>  
> -	bb_size = xe_get_default_alignment(fd);
> +	bb_size = xe_bb_size(fd, SZ_4K);
>  	bb = xe_bo_create(fd, 0, bb_size, system_memory(fd), 0);
>  
>  	size = width * height * bpp / 8;
> diff --git a/tests/intel/xe_peer2peer.c b/tests/intel/xe_peer2peer.c
> index 44fea6eb1..c63f1e4c4 100644
> --- a/tests/intel/xe_peer2peer.c
> +++ b/tests/intel/xe_peer2peer.c
> @@ -105,7 +105,7 @@ static void test_read(struct gpu_info *ex_gpu, struct gpu_info *im_gpu,
>  	struct blt_copy_object *im_src;
>  	struct blt_copy_object *src;
>  	const uint32_t bpp = 32;
> -	uint64_t im_bb_size = xe_get_default_alignment(im_gpu->fd);
> +	uint64_t im_bb_size = xe_bb_size(im_gpu->fd, SZ_4K);
>  	uint64_t ahnd;
>  	uint32_t bb;
>  	uint32_t width = 1024, height = 1024;
> @@ -187,7 +187,7 @@ static void test_write(struct gpu_info *ex_gpu, struct gpu_info *im_gpu,
>  	struct blt_copy_object *im_dst;
>  	struct blt_copy_object *src;
>  	const uint32_t bpp = 32;
> -	uint64_t im_bb_size = xe_get_default_alignment(im_gpu->fd);
> +	uint64_t im_bb_size = xe_bb_size(im_gpu->fd, SZ_4K);
>  	uint64_t ahnd;
>  	uint32_t bb;
>  	uint32_t width = 1024, height = 1024;
> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
> index 7db3cd162..3fa9abf25 100644
> --- a/tests/intel/xe_pm_residency.c
> +++ b/tests/intel/xe_pm_residency.c
> @@ -98,7 +98,7 @@ static void exec_load(int fd, struct drm_xe_engine_class_instance *hwe, unsigned
>  
>  	vm = xe_vm_create(fd, 0, 0);
>  	exec_queue = xe_exec_queue_create(fd, vm, hwe, 0);
> -	bo_size = xe_get_default_alignment(fd);
> +	bo_size = xe_bb_size(fd, SZ_4K);
>  
>  	bo = xe_bo_create(fd, vm, bo_size,
>  			  vram_if_possible(fd, hwe->gt_id),
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> index 2200040ac..ebc1ca68f 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -979,6 +979,8 @@ test_large_binds(int fd, struct drm_xe_engine_class_instance *eci,
>  	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
>  	vm = xe_vm_create(fd, 0, 0);
>  
> +	bo_size = xe_bb_size(fd, bo_size);

Ok, it comes from the caller and adjusted here.

> +
>  	if (flags & LARGE_BIND_FLAG_USERPTR) {
>  		map = aligned_alloc(xe_get_default_alignment(fd), bo_size);
>  		igt_assert(map);
> @@ -1273,7 +1275,7 @@ test_munmap_style_unbind(int fd, struct drm_xe_engine_class_instance *eci,
>  	}
>  
>  	vm = xe_vm_create(fd, 0, 0);
> -	bo_size = page_size * bo_n_pages;
> +	bo_size = xe_bb_size(fd, page_size * bo_n_pages);
>  
>  	if (flags & MAP_FLAG_USERPTR) {
>  		map = mmap(from_user_pointer(addr), bo_size, PROT_READ |
> @@ -1573,7 +1575,7 @@ test_mmap_style_bind(int fd, struct drm_xe_engine_class_instance *eci,
>  	}
>  
>  	vm = xe_vm_create(fd, 0, 0);
> -	bo_size = page_size * bo_n_pages;
> +	bo_size = xe_bb_size(fd, page_size * bo_n_pages);
>  
>  	if (flags & MAP_FLAG_USERPTR) {
>  		map0 = mmap(from_user_pointer(addr), bo_size, PROT_READ |
> diff --git a/tests/intel/xe_waitfence.c b/tests/intel/xe_waitfence.c
> index 5f7316f6e..f6f797d43 100644
> --- a/tests/intel/xe_waitfence.c
> +++ b/tests/intel/xe_waitfence.c
> @@ -212,6 +212,7 @@ exec_queue_reset_wait(int fd)
>  	uint64_t sdi_offset;
>  	uint64_t sdi_addr;
>  	uint64_t addr = 0x1a0000;
> +	uint64_t bb_size;
>  
>  	struct {
>  		uint32_t batch[16];
> @@ -236,8 +237,9 @@ exec_queue_reset_wait(int fd)
>  		.exec_queue_id = exec_queue,
>  	};
>  
> -	bo = xe_bo_create(fd, vm, 0x40000, vram_if_possible(fd, 0), 0);
> -	data = xe_bo_map(fd, bo, 0x40000);
> +	bb_size = xe_bb_size(fd, 0x40000);
> +	bo = xe_bo_create(fd, vm, bb_size, vram_if_possible(fd, 0), 0);
> +	data = xe_bo_map(fd, bo, bb_size);
>  
>  	batch_offset = (char *)&data[0].batch - (char *)data;
>  	batch_addr = addr + batch_offset;
> @@ -267,7 +269,7 @@ exec_queue_reset_wait(int fd)
>  	xe_exec_queue_destroy(fd, exec_queue);
>  
>  	if (bo) {
> -		munmap(data, 0x40000);
> +		munmap(data, bb_size);
>  		gem_close(fd, bo);
>  	}
>  }
> -- 
> 2.43.0
> 

Looks good,

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew
