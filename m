Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 632FFD5E149
	for <igt-dev@archiver.kernel.org>; Fri,  8 Nov 2024 09:01:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27D9510E943;
	Fri,  8 Nov 2024 09:01:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rko+sh2w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEC3A10E943
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Nov 2024 09:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731056506; x=1762592506;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=lCxc+SXmlGrm2kYcqsM0RnOwHx6PbIBKCB+yVwnP18Y=;
 b=Rko+sh2wPySViyYi89lvN3k8v2e/e/o+H/tM4bFBuAOjVHxIcFy7cQEu
 LZRh/wbnctTyTV3KPcloJ5tXIpC2sivHyEIwqrsaO+zsps9VtF4hP6FCy
 gsB5rAncjLcCQonskNiv7QFFsumFm45dH+DwuW7JmKZXZrqtlqPj+7UC5
 X1EiL87RElhZAzzMdZUv8hNRSRsJsSey6qBaLGxQi1tr4UHJqgvZYC7Wv
 kCtxUHFeiigWo1xeaM1OEBHO9kpRydEtDDcLlRnYvsv1YWwumzMpKrtz6
 LG7ogtnwj/v+HkU5kNeZ8xw2+aWTX22AIs8bKn0LHA2NX6JSmmyu+zVga w==;
X-CSE-ConnectionGUID: JDxolA1nSbu0pAnHM+XxZA==
X-CSE-MsgGUID: i9ZO8CuQTiesdOUQbLYv6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="53492271"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="53492271"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 01:01:46 -0800
X-CSE-ConnectionGUID: rgiHzhxwTtyhOndfxqxy2w==
X-CSE-MsgGUID: uT+C3x2WSQWYST27fTPiRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; d="scan'208";a="90338039"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.236])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 01:01:44 -0800
Date: Fri, 8 Nov 2024 10:01:41 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Pravalika Gurram <pravalika.gurram@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH 1/2] lib/xe/xe_spin: move the spinner related functions
 to lib
Message-ID: <20241108090141.yppjx5ilbwkw2lmi@zkempczy-mobl2>
References: <20241108074403.366318-1-pravalika.gurram@intel.com>
 <20241108074403.366318-2-pravalika.gurram@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241108074403.366318-2-pravalika.gurram@intel.com>
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

+Lucas

On Fri, Nov 08, 2024 at 01:14:02PM +0530, Pravalika Gurram wrote:
> move spin_ctx_init,spin_ctx_start,spin_ctx_end,spin_ctx_destroy
> to xe spin lib to avoid code redundancy.
> 
> v2: use allocator based on developer preference.
>     change spin_ctx to xe_spin_ctx to avoid name clashes [Zbigniew]
> 
> Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
> ---
>  lib/xe/xe_spin.c            | 115 +++++++++++++++++++++
>  lib/xe/xe_spin.h            |  22 ++++
>  tests/intel/xe_drm_fdinfo.c | 197 +++++++-----------------------------
>  3 files changed, 172 insertions(+), 162 deletions(-)
> 
> diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
> index 3adacc3a8..b611ac5c1 100644
> --- a/lib/xe/xe_spin.c
> +++ b/lib/xe/xe_spin.c
> @@ -292,6 +292,121 @@ void xe_spin_free(int fd, struct igt_spin *spin)
>  	free(spin);
>  }
>  
> +struct xe_spin_ctx *
> +xe_spin_ctx_init(int fd, struct drm_xe_engine_class_instance *hwe, uint64_t ahnd, uint32_t vm,
> +	      uint16_t width, uint16_t num_placements)
> +{
> +	struct xe_spin_ctx *ctx = calloc(1, sizeof(*ctx));
> +
> +	igt_assert(width && num_placements &&
> +		   (width == 1 || num_placements == 1));
> +	igt_assert_lt(width, XE_MAX_ENGINE_INSTANCE);
> +
> +	ctx->class = hwe->engine_class;
> +	ctx->width = width;
> +	ctx->num_placements = num_placements;
> +	ctx->vm = vm;
> +
> +	ctx->exec.num_batch_buffer = width;
> +	ctx->exec.num_syncs = 2;
> +	ctx->exec.syncs = to_user_pointer(ctx->sync);
> +
> +	ctx->sync[0].type = DRM_XE_SYNC_TYPE_SYNCOBJ;
> +	ctx->sync[0].flags = DRM_XE_SYNC_FLAG_SIGNAL;
> +	ctx->sync[0].handle = syncobj_create(fd, 0);
> +
> +	ctx->sync[1].type = DRM_XE_SYNC_TYPE_SYNCOBJ;
> +	ctx->sync[1].flags = DRM_XE_SYNC_FLAG_SIGNAL;
> +	ctx->sync[1].handle = syncobj_create(fd, 0);
> +
> +	ctx->bo_size = sizeof(struct xe_spin);
> +	ctx->bo_size = xe_bb_size(fd, ctx->bo_size);
> +	ctx->bo = xe_bo_create(fd, ctx->vm, ctx->bo_size,
> +			       vram_if_possible(fd, hwe->gt_id),
> +			       DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +	if (ahnd) {
> +		for (unsigned int i = 0; i < width; i++)
> +			ctx->addr[i] = intel_allocator_alloc_with_strategy(ahnd,
> +					ctx->bo, ctx->bo_size, 0,
> +					ALLOC_STRATEGY_LOW_TO_HIGH);
> +	} else {
> +		for (unsigned int i = 0; i < width; i++)
> +			ctx->addr[i] = 0x100000 + 0x100000 * hwe->engine_class;
> +	}
> +
> +	ctx->spin = xe_bo_map(fd, ctx->bo, ctx->bo_size);
> +
> +	igt_assert_eq(__xe_exec_queue_create(fd, ctx->vm, width, num_placements,
> +					     hwe, 0, &ctx->exec_queue), 0);
> +
> +	xe_vm_bind_async(fd, ctx->vm, 0, ctx->bo, 0, ctx->addr[0], ctx->bo_size,
> +			 ctx->sync, 1);

@Lucas

I'm looking here and I've doubts what's going on in 'utilization_multi'
subtest where width > 1. I mean we bind only addr[0], but according
to exec with width > 1 I assume addr[1] should be bound as well.

What I'm missing here?

--
Zbigniew

> +
> +	return ctx;
> +}
> +
> +void xe_spin_sync_start(int fd, struct xe_spin_ctx *ctx)
> +{
> +	if (!ctx)
> +		return;
> +
> +	ctx->spin_opts.addr = ctx->addr[0];
> +	ctx->spin_opts.write_timestamp = true;
> +	ctx->spin_opts.preempt = true;
> +	xe_spin_init(ctx->spin, &ctx->spin_opts);
> +
> +	/* re-use sync[0] for exec */
> +	ctx->sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
> +
> +	ctx->exec.exec_queue_id = ctx->exec_queue;
> +
> +	if (ctx->width > 1)
> +		ctx->exec.address = to_user_pointer(ctx->addr);
> +	else
> +		ctx->exec.address = ctx->addr[0];
> +
> +	xe_exec(fd, &ctx->exec);
> +
> +	xe_spin_wait_started(ctx->spin);
> +	igt_assert(!syncobj_wait(fd, &ctx->sync[1].handle, 1, 1, 0, NULL));
> +
> +	igt_debug("%d: spinner started\n", ctx->class);
> +}
> +
> +void xe_spin_sync_end(int fd, struct xe_spin_ctx *ctx)
> +{
> +	if (!ctx || ctx->ended)
> +		return;
> +
> +	xe_spin_end(ctx->spin);
> +
> +	igt_assert(syncobj_wait(fd, &ctx->sync[1].handle, 1, INT64_MAX, 0, NULL));
> +	igt_assert(syncobj_wait(fd, &ctx->sync[0].handle, 1, INT64_MAX, 0, NULL));
> +
> +	ctx->sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
> +	xe_vm_unbind_async(fd, ctx->vm, 0, 0, ctx->addr[0], ctx->bo_size, ctx->sync, 1);
> +	igt_assert(syncobj_wait(fd, &ctx->sync[0].handle, 1, INT64_MAX, 0, NULL));
> +
> +	ctx->ended = true;
> +	igt_debug("%d: spinner ended (timestamp=%u)\n", ctx->class,
> +		  ctx->spin->timestamp);
> +}
> +
> +void xe_spin_ctx_destroy(int fd, struct xe_spin_ctx *ctx)
> +{
> +	if (!ctx)
> +		return;
> +
> +	syncobj_destroy(fd, ctx->sync[0].handle);
> +	syncobj_destroy(fd, ctx->sync[1].handle);
> +	xe_exec_queue_destroy(fd, ctx->exec_queue);
> +
> +	munmap(ctx->spin, ctx->bo_size);
> +	gem_close(fd, ctx->bo);
> +
> +	free(ctx);
> +}
> +
>  void xe_cork_init(int fd, struct drm_xe_engine_class_instance *hwe,
>  		  struct xe_cork *cork)
>  {
> diff --git a/lib/xe/xe_spin.h b/lib/xe/xe_spin.h
> index d65adb05c..18706dcdf 100644
> --- a/lib/xe/xe_spin.h
> +++ b/lib/xe/xe_spin.h
> @@ -43,9 +43,29 @@ struct xe_spin {
>  	uint32_t timestamp;
>  };
>  
> +struct xe_spin_ctx {
> +	uint32_t vm;
> +	uint64_t addr[XE_MAX_ENGINE_INSTANCE];
> +	struct drm_xe_sync sync[2];
> +	struct drm_xe_exec exec;
> +	uint32_t exec_queue;
> +	size_t bo_size;
> +	uint32_t bo;
> +	struct xe_spin *spin;
> +	struct xe_spin_opts spin_opts;
> +	bool ended;
> +	uint16_t class;
> +	uint16_t width;
> +	uint16_t num_placements;
> +};
> +
>  igt_spin_t *xe_spin_create(int fd, const struct igt_spin_factory *opt);
>  uint32_t duration_to_ctx_ticks(int fd, int gt_id, uint64_t ns);
>  void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts);
> +struct xe_spin_ctx *
> +xe_spin_ctx_init(int fd, struct drm_xe_engine_class_instance *hwe, uint64_t ahnd, uint32_t vm,
> +	      uint16_t width, uint16_t num_placements);
> +void xe_spin_ctx_destroy(int fd, struct xe_spin_ctx *ctx);
>  
>  #define xe_spin_init_opts(fd, ...) \
>  	xe_spin_init(fd, &((struct xe_spin_opts){__VA_ARGS__}))
> @@ -55,6 +75,8 @@ void xe_spin_sync_wait(int fd, struct igt_spin *spin);
>  void xe_spin_wait_started(struct xe_spin *spin);
>  void xe_spin_end(struct xe_spin *spin);
>  void xe_spin_free(int fd, struct igt_spin *spin);
> +void xe_spin_sync_start(int fd, struct xe_spin_ctx *ctx);
> +void xe_spin_sync_end(int fd, struct xe_spin_ctx *ctx);
>  
>  struct xe_cork {
>  	struct xe_spin *spin;
> diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
> index 5fd7c0416..91ff4a5af 100644
> --- a/tests/intel/xe_drm_fdinfo.c
> +++ b/tests/intel/xe_drm_fdinfo.c
> @@ -367,133 +367,6 @@ static void basic_engine_utilization(int xe)
>  	igt_require(info.num_engines);
>  }
>  
> -struct spin_ctx {
> -	uint32_t vm;
> -	uint64_t addr[XE_MAX_ENGINE_INSTANCE];
> -	struct drm_xe_sync sync[2];
> -	struct drm_xe_exec exec;
> -	uint32_t exec_queue;
> -	size_t bo_size;
> -	uint32_t bo;
> -	struct xe_spin *spin;
> -	struct xe_spin_opts spin_opts;
> -	bool ended;
> -	uint16_t class;
> -	uint16_t width;
> -	uint16_t num_placements;
> -};
> -
> -static struct spin_ctx *
> -spin_ctx_init(int fd, struct drm_xe_engine_class_instance *hwe, uint32_t vm,
> -	      uint16_t width, uint16_t num_placements)
> -{
> -	struct spin_ctx *ctx = calloc(1, sizeof(*ctx));
> -
> -	igt_assert(width && num_placements &&
> -		   (width == 1 || num_placements == 1));
> -	igt_assert_lt(width, XE_MAX_ENGINE_INSTANCE);
> -
> -	ctx->class = hwe->engine_class;
> -	ctx->width = width;
> -	ctx->num_placements = num_placements;
> -	ctx->vm = vm;
> -
> -	for (unsigned int i = 0; i < width; i++)
> -		ctx->addr[i] = 0x100000 + 0x100000 * hwe->engine_class;
> -
> -	ctx->exec.num_batch_buffer = width;
> -	ctx->exec.num_syncs = 2;
> -	ctx->exec.syncs = to_user_pointer(ctx->sync);
> -
> -	ctx->sync[0].type = DRM_XE_SYNC_TYPE_SYNCOBJ;
> -	ctx->sync[0].flags = DRM_XE_SYNC_FLAG_SIGNAL;
> -	ctx->sync[0].handle = syncobj_create(fd, 0);
> -
> -	ctx->sync[1].type = DRM_XE_SYNC_TYPE_SYNCOBJ;
> -	ctx->sync[1].flags = DRM_XE_SYNC_FLAG_SIGNAL;
> -	ctx->sync[1].handle = syncobj_create(fd, 0);
> -
> -	ctx->bo_size = sizeof(struct xe_spin);
> -	ctx->bo_size = xe_bb_size(fd, ctx->bo_size);
> -	ctx->bo = xe_bo_create(fd, ctx->vm, ctx->bo_size,
> -			       vram_if_possible(fd, hwe->gt_id),
> -			       DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> -	ctx->spin = xe_bo_map(fd, ctx->bo, ctx->bo_size);
> -
> -	igt_assert_eq(__xe_exec_queue_create(fd, ctx->vm, width, num_placements,
> -					     hwe, 0, &ctx->exec_queue), 0);
> -
> -	xe_vm_bind_async(fd, ctx->vm, 0, ctx->bo, 0, ctx->addr[0], ctx->bo_size,
> -			 ctx->sync, 1);
> -
> -	return ctx;
> -}
> -
> -static void
> -spin_sync_start(int fd, struct spin_ctx *ctx)
> -{
> -	if (!ctx)
> -		return;
> -
> -	ctx->spin_opts.addr = ctx->addr[0];
> -	ctx->spin_opts.write_timestamp = true;
> -	ctx->spin_opts.preempt = true;
> -	xe_spin_init(ctx->spin, &ctx->spin_opts);
> -
> -	/* re-use sync[0] for exec */
> -	ctx->sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
> -
> -	ctx->exec.exec_queue_id = ctx->exec_queue;
> -
> -	if (ctx->width > 1)
> -		ctx->exec.address = to_user_pointer(ctx->addr);
> -	else
> -		ctx->exec.address = ctx->addr[0];
> -
> -	xe_exec(fd, &ctx->exec);
> -
> -	xe_spin_wait_started(ctx->spin);
> -	igt_assert(!syncobj_wait(fd, &ctx->sync[1].handle, 1, 1, 0, NULL));
> -
> -	igt_debug("%s: spinner started\n", engine_map[ctx->class]);
> -}
> -
> -static void
> -spin_sync_end(int fd, struct spin_ctx *ctx)
> -{
> -	if (!ctx || ctx->ended)
> -		return;
> -
> -	xe_spin_end(ctx->spin);
> -
> -	igt_assert(syncobj_wait(fd, &ctx->sync[1].handle, 1, INT64_MAX, 0, NULL));
> -	igt_assert(syncobj_wait(fd, &ctx->sync[0].handle, 1, INT64_MAX, 0, NULL));
> -
> -	ctx->sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
> -	xe_vm_unbind_async(fd, ctx->vm, 0, 0, ctx->addr[0], ctx->bo_size, ctx->sync, 1);
> -	igt_assert(syncobj_wait(fd, &ctx->sync[0].handle, 1, INT64_MAX, 0, NULL));
> -
> -	ctx->ended = true;
> -	igt_debug("%s: spinner ended (timestamp=%u)\n", engine_map[ctx->class],
> -		  ctx->spin->timestamp);
> -}
> -
> -static void
> -spin_ctx_destroy(int fd, struct spin_ctx *ctx)
> -{
> -	if (!ctx)
> -		return;
> -
> -	syncobj_destroy(fd, ctx->sync[0].handle);
> -	syncobj_destroy(fd, ctx->sync[1].handle);
> -	xe_exec_queue_destroy(fd, ctx->exec_queue);
> -
> -	munmap(ctx->spin, ctx->bo_size);
> -	gem_close(fd, ctx->bo);
> -
> -	free(ctx);
> -}
> -
>  static void
>  check_results(struct pceu_cycles *s1, struct pceu_cycles *s2,
>  	      int class, int width, enum expected_load expected_load)
> @@ -535,7 +408,7 @@ utilization_single(int fd, struct drm_xe_engine_class_instance *hwe, unsigned in
>  {
>  	struct pceu_cycles pceu1[2][DRM_XE_ENGINE_CLASS_COMPUTE + 1];
>  	struct pceu_cycles pceu2[2][DRM_XE_ENGINE_CLASS_COMPUTE + 1];
> -	struct spin_ctx *ctx = NULL;
> +	struct xe_spin_ctx *ctx = NULL;
>  	enum expected_load expected_load;
>  	uint32_t vm;
>  	int new_fd;
> @@ -545,8 +418,8 @@ utilization_single(int fd, struct drm_xe_engine_class_instance *hwe, unsigned in
>  
>  	vm = xe_vm_create(fd, 0, 0);
>  	if (flags & TEST_BUSY) {
> -		ctx = spin_ctx_init(fd, hwe, vm, 1, 1);
> -		spin_sync_start(fd, ctx);
> +		ctx = xe_spin_ctx_init(fd, hwe, 0, vm, 1, 1);
> +		xe_spin_sync_start(fd, ctx);
>  	}
>  
>  	read_engine_cycles(fd, pceu1[0]);
> @@ -555,7 +428,7 @@ utilization_single(int fd, struct drm_xe_engine_class_instance *hwe, unsigned in
>  
>  	usleep(batch_duration_usec);
>  	if (flags & TEST_TRAILING_IDLE)
> -		spin_sync_end(fd, ctx);
> +		xe_spin_sync_end(fd, ctx);
>  
>  	read_engine_cycles(fd, pceu2[0]);
>  	if (flags & TEST_ISOLATION)
> @@ -574,8 +447,8 @@ utilization_single(int fd, struct drm_xe_engine_class_instance *hwe, unsigned in
>  		close(new_fd);
>  	}
>  
> -	spin_sync_end(fd, ctx);
> -	spin_ctx_destroy(fd, ctx);
> +	xe_spin_sync_end(fd, ctx);
> +	xe_spin_ctx_destroy(fd, ctx);
>  	xe_vm_destroy(fd, vm);
>  }
>  
> @@ -584,19 +457,19 @@ utilization_single_destroy_queue(int fd, struct drm_xe_engine_class_instance *hw
>  {
>  	struct pceu_cycles pceu1[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
>  	struct pceu_cycles pceu2[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
> -	struct spin_ctx *ctx = NULL;
> +	struct xe_spin_ctx *ctx = NULL;
>  	uint32_t vm;
>  
>  	vm = xe_vm_create(fd, 0, 0);
> -	ctx = spin_ctx_init(fd, hwe, vm, 1, 1);
> -	spin_sync_start(fd, ctx);
> +	ctx = xe_spin_ctx_init(fd, hwe, 0, vm, 1, 1);
> +	xe_spin_sync_start(fd, ctx);
>  
>  	read_engine_cycles(fd, pceu1);
>  	usleep(batch_duration_usec);
>  
>  	/* destroy queue before sampling again */
> -	spin_sync_end(fd, ctx);
> -	spin_ctx_destroy(fd, ctx);
> +	xe_spin_sync_end(fd, ctx);
> +	xe_spin_ctx_destroy(fd, ctx);
>  
>  	read_engine_cycles(fd, pceu2);
>  
> @@ -610,18 +483,18 @@ utilization_others_idle(int fd, struct drm_xe_engine_class_instance *hwe)
>  {
>  	struct pceu_cycles pceu1[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
>  	struct pceu_cycles pceu2[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
> -	struct spin_ctx *ctx = NULL;
> +	struct xe_spin_ctx *ctx = NULL;
>  	uint32_t vm;
>  	int class;
>  
>  	vm = xe_vm_create(fd, 0, 0);
>  
> -	ctx = spin_ctx_init(fd, hwe, vm, 1, 1);
> -	spin_sync_start(fd, ctx);
> +	ctx = xe_spin_ctx_init(fd, hwe, 0, vm, 1, 1);
> +	xe_spin_sync_start(fd, ctx);
>  
>  	read_engine_cycles(fd, pceu1);
>  	usleep(batch_duration_usec);
> -	spin_sync_end(fd, ctx);
> +	xe_spin_sync_end(fd, ctx);
>  	read_engine_cycles(fd, pceu2);
>  
>  	xe_for_each_engine_class(class) {
> @@ -631,8 +504,8 @@ utilization_others_idle(int fd, struct drm_xe_engine_class_instance *hwe)
>  		check_results(pceu1, pceu2, class, 1, expected_load);
>  	}
>  
> -	spin_sync_end(fd, ctx);
> -	spin_ctx_destroy(fd, ctx);
> +	xe_spin_sync_end(fd, ctx);
> +	xe_spin_ctx_destroy(fd, ctx);
>  	xe_vm_destroy(fd, vm);
>  }
>  
> @@ -641,7 +514,7 @@ utilization_others_full_load(int fd, struct drm_xe_engine_class_instance *hwe)
>  {
>  	struct pceu_cycles pceu1[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
>  	struct pceu_cycles pceu2[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
> -	struct spin_ctx *ctx[DRM_XE_ENGINE_CLASS_COMPUTE + 1] = {};
> +	struct xe_spin_ctx *ctx[DRM_XE_ENGINE_CLASS_COMPUTE + 1] = {};
>  	struct drm_xe_engine_class_instance *_hwe;
>  	uint32_t vm;
>  	int class;
> @@ -655,14 +528,14 @@ utilization_others_full_load(int fd, struct drm_xe_engine_class_instance *hwe)
>  		if (_class == hwe->engine_class || ctx[_class])
>  			continue;
>  
> -		ctx[_class] = spin_ctx_init(fd, _hwe, vm, 1, 1);
> -		spin_sync_start(fd, ctx[_class]);
> +		ctx[_class] = xe_spin_ctx_init(fd, _hwe, 0, vm, 1, 1);
> +		xe_spin_sync_start(fd, ctx[_class]);
>  	}
>  
>  	read_engine_cycles(fd, pceu1);
>  	usleep(batch_duration_usec);
>  	xe_for_each_engine_class(class)
> -		spin_sync_end(fd, ctx[class]);
> +		xe_spin_sync_end(fd, ctx[class]);
>  	read_engine_cycles(fd, pceu2);
>  
>  	xe_for_each_engine_class(class) {
> @@ -673,8 +546,8 @@ utilization_others_full_load(int fd, struct drm_xe_engine_class_instance *hwe)
>  			continue;
>  
>  		check_results(pceu1, pceu2, class, 1, expected_load);
> -		spin_sync_end(fd, ctx[class]);
> -		spin_ctx_destroy(fd, ctx[class]);
> +		xe_spin_sync_end(fd, ctx[class]);
> +		xe_spin_ctx_destroy(fd, ctx[class]);
>  	}
>  
>  	xe_vm_destroy(fd, vm);
> @@ -685,7 +558,7 @@ utilization_all_full_load(int fd)
>  {
>  	struct pceu_cycles pceu1[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
>  	struct pceu_cycles pceu2[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
> -	struct spin_ctx *ctx[DRM_XE_ENGINE_CLASS_COMPUTE + 1] = {};
> +	struct xe_spin_ctx *ctx[DRM_XE_ENGINE_CLASS_COMPUTE + 1] = {};
>  	struct drm_xe_engine_class_instance *hwe;
>  	uint32_t vm;
>  	int class;
> @@ -698,14 +571,14 @@ utilization_all_full_load(int fd)
>  		if (ctx[class])
>  			continue;
>  
> -		ctx[class] = spin_ctx_init(fd, hwe, vm, 1, 1);
> -		spin_sync_start(fd, ctx[class]);
> +		ctx[class] = xe_spin_ctx_init(fd, hwe, 0, vm, 1, 1);
> +		xe_spin_sync_start(fd, ctx[class]);
>  	}
>  
>  	read_engine_cycles(fd, pceu1);
>  	usleep(batch_duration_usec);
>  	xe_for_each_engine_class(class)
> -		spin_sync_end(fd, ctx[class]);
> +		xe_spin_sync_end(fd, ctx[class]);
>  	read_engine_cycles(fd, pceu2);
>  
>  	xe_for_each_engine_class(class) {
> @@ -713,8 +586,8 @@ utilization_all_full_load(int fd)
>  			continue;
>  
>  		check_results(pceu1, pceu2, class, 1, EXPECTED_LOAD_FULL);
> -		spin_sync_end(fd, ctx[class]);
> -		spin_ctx_destroy(fd, ctx[class]);
> +		xe_spin_sync_end(fd, ctx[class]);
> +		xe_spin_ctx_destroy(fd, ctx[class]);
>  	}
>  
>  	xe_vm_destroy(fd, vm);
> @@ -741,7 +614,7 @@ utilization_multi(int fd, int gt, int class, unsigned int flags)
>  	struct pceu_cycles pceu[2][DRM_XE_ENGINE_CLASS_COMPUTE + 1];
>  	struct pceu_cycles pceu_spill[2][DRM_XE_ENGINE_CLASS_COMPUTE + 1];
>  	struct drm_xe_engine_class_instance eci[XE_MAX_ENGINE_INSTANCE];
> -	struct spin_ctx *ctx = NULL;
> +	struct xe_spin_ctx *ctx = NULL;
>  	enum expected_load expected_load;
>  	int fd_spill, num_placements;
>  	uint32_t vm;
> @@ -767,8 +640,8 @@ utilization_multi(int fd, int gt, int class, unsigned int flags)
>  
>  	vm = xe_vm_create(fd, 0, 0);
>  	if (flags & TEST_BUSY) {
> -		ctx = spin_ctx_init(fd, eci, vm, width, num_placements);
> -		spin_sync_start(fd, ctx);
> +		ctx = xe_spin_ctx_init(fd, eci, 0, vm, width, num_placements);
> +		xe_spin_sync_start(fd, ctx);
>  	}
>  
>  	read_engine_cycles(fd, pceu[0]);
> @@ -777,7 +650,7 @@ utilization_multi(int fd, int gt, int class, unsigned int flags)
>  
>  	usleep(batch_duration_usec);
>  	if (flags & TEST_TRAILING_IDLE)
> -		spin_sync_end(fd, ctx);
> +		xe_spin_sync_end(fd, ctx);
>  
>  	read_engine_cycles(fd, pceu[1]);
>  	if (flags & TEST_ISOLATION)
> @@ -797,8 +670,8 @@ utilization_multi(int fd, int gt, int class, unsigned int flags)
>  		close(fd_spill);
>  	}
>  
> -	spin_sync_end(fd, ctx);
> -	spin_ctx_destroy(fd, ctx);
> +	xe_spin_sync_end(fd, ctx);
> +	xe_spin_ctx_destroy(fd, ctx);
>  
>  	xe_vm_destroy(fd, vm);
>  }
> -- 
> 2.34.1
> 
