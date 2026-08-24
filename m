Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4080C5DF9C
	for <igt-dev@archiver.kernel.org>; Mon, 24 Aug 2026 19:09:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65F3710E085;
	Mon, 24 Aug 2026 19:09:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J2SK/rqd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F4D310E085
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Aug 2026 19:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787598564; x=1819134564;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=l04n7IeG6GBnJG8dmEJs51TGXZluc9V3lanWr8A7l9c=;
 b=J2SK/rqd5uW2QXJ1bQONchfaWWHt7szwSPcaaUE+XgFzkUEOSuo42b/U
 UalUGe5U4HM3fQRbxw7IC46wAzbxIB2wMt18Dk9MOmyFJ3rQVJP7xXmu/
 UMxSoV4dpZMdUzF15RHGbyGCHH0HVbWTGFSz8HDL1cs5ZsmfKtp3TCyLz
 Rk4Qyjsb9MMm5cHSqpaBZjF3+sMz3KLzAFF1QCadkxi7eN9BPYNhCHKHL
 rGrMnHYCDwqX9mw6hBJTUUFrcZ0nBH0ACKLjuLe+yc/bM9ggV2kjmc+EO
 WVgVvM6EoFC7YRaLt0gtZeTAnTT4HiiSrdurrfnug/baPQZAVkUIAJ9yk g==;
X-CSE-ConnectionGUID: 5rHEaEw7R9muwqH6VA8rTw==
X-CSE-MsgGUID: WsZ9dytbTxCRQp/OTGThWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="105436876"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="105436876"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 12:09:23 -0700
X-CSE-ConnectionGUID: u0xkUNvHRA6WGNUp9JUOcA==
X-CSE-MsgGUID: I4Z1DQXxT/G0a/96MBSgrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="266558125"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 12:09:22 -0700
Date: Mon, 24 Aug 2026 21:09:19 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com
Subject: Re: [PATCH v2 7/9] tests/intel/xe_exec_reset: add
 gt-stress-reset-mixed-engine-usage subtest
Message-ID: <20260824190919.e6zrqv3ppvhfyhhu@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 nishit.sharma@intel.com, igt-dev@lists.freedesktop.org,
 kamil.konieczny@intel.com
References: <20260818040845.548727-1-nishit.sharma@intel.com>
 <20260818040845.548727-8-nishit.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260818040845.548727-8-nishit.sharma@intel.com>
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

Hi nishit.sharma,
On 2026-08-18 at 04:08:43 +0000, nishit.sharma@intel.com wrote:
> From: Nishit Sharma <nishit.sharma@intel.com>
> 
> This extends concurrent reset/submission stress to mixed engine class
> traffic while preserving default single-engine behavior for existing
> subtests. It is combined with rapid reset mode as requested to increase
> reset/submit overlap pressure.
> 
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tests/intel/xe_exec_reset.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
> index 8fac53180..d818173c2 100644
> --- a/tests/intel/xe_exec_reset.c
> +++ b/tests/intel/xe_exec_reset.c
> @@ -138,6 +138,7 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci,
>  #define INVALIDATE_BO_STRESS		(0x1 << 18)
>  #define RAPID_RESET_STRESS		(0x1 << 19)
>  #define DESTROY_VM_CTX_STRESS		(0x1 << 20)
> +#define MIXED_ENGINE_STRESS		(0x1 << 21)
>  
>  /**
>   * SUBTEST: %s-cat-error
> @@ -653,6 +654,7 @@ struct gt_thread_data {
>  	pthread_cond_t *cond;
>  	int fd;
>  	int gt;
> +	int id;
>  	int *go;
>  	int *exit;
>  	int *num_reset;
> @@ -693,6 +695,22 @@ static void bo_ctx_create(int fd, int gt, uint64_t addr, size_t bo_size,
>  	xe_vm_bind_sync(fd, *vm, *bo, 0, addr, bo_size);
>  }
>  
> +static void fill_mixed_engine(struct gt_thread_data *t, int iter,
> +			      struct drm_xe_engine_class_instance *instance)
> +{
> +	const uint16_t classes[] = {
> +		DRM_XE_ENGINE_CLASS_COPY,
> +		DRM_XE_ENGINE_CLASS_RENDER,
> +		DRM_XE_ENGINE_CLASS_COMPUTE,
> +		DRM_XE_ENGINE_CLASS_VIDEO_DECODE,
> +		DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE,
> +	};
> +
> +	instance->gt_id = t->gt;
> +	instance->engine_instance = 0;
> +	instance->engine_class = classes[(iter + t->id) % ARRAY_SIZE(classes)];
> +}
> +
>  static void pressure_bo_create(int fd, uint32_t vm, int gt,
>  			       uint32_t *bos, int *count)
>  {
> @@ -765,6 +783,9 @@ static void submit_jobs(struct gt_thread_data *t)
>  		};
>  		int ret;
>  
> +		if (t->flags & MIXED_ENGINE_STRESS)
> +			fill_mixed_engine(t, i, &instance);
> +
>  		/* GuC IDs can get exhausted */
>  		ret = __xe_exec_queue_create(fd, vm, 1, 1, &instance, 0, &exec.exec_queue_id);
>  		if (ret) {
> @@ -853,6 +874,10 @@ static void *gt_reset_thread(void *data)
>   * Description: Stress concurrent GT resets and job submissions while destroying and recreating VM context
>   * Test category: stress test
>   *
> + * SUBTEST: gt-stress-reset-mixed-engine-usage
> + * Description: Stress concurrent GT resets and mixed-engine job submissions
> + * Test category: stress test
> + *
>   */
>  static void
>  gt_reset(int fd, int gt, int n_threads, int n_sec, unsigned int flags)
> @@ -874,6 +899,7 @@ gt_reset(int fd, int gt, int n_threads, int n_sec, unsigned int flags)
>  		threads[i].cond = &cond;
>  		threads[i].fd = fd;
>  		threads[i].gt = gt;
> +		threads[i].id = i;
>  		threads[i].flags = flags;
>  		threads[i].go = &go;
>  		threads[i].exit = &exit;
> @@ -1076,6 +1102,7 @@ int igt_main()
>  		{ "reset-bo-invalidation", INVALIDATE_BO_STRESS },
>  		{ "reset-rapid-cycle", RAPID_RESET_STRESS },
>  		{ "reset-destroy-vm-context", DESTROY_VM_CTX_STRESS },
> +		{ "reset-mixed-engine-usage", MIXED_ENGINE_STRESS | RAPID_RESET_STRESS },
>  		{ NULL },
>  	};
>  	int gt;
> -- 
> 2.43.0
> 
