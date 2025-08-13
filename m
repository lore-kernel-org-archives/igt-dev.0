Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42334CA0EE0
	for <igt-dev@archiver.kernel.org>; Wed, 13 Aug 2025 17:51:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D932510E025;
	Wed, 13 Aug 2025 17:51:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BgTpYT79";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B9BB10E025
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Aug 2025 17:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755107498; x=1786643498;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=6anPK8u3f6K73rUuTMM7IVeV72s+OGbUS8lxSYFEDkM=;
 b=BgTpYT79+wsfBHjNy7tFBnjkPNoB9GRFoD8pr1Z20iNcbF1YnFFplmHR
 OPV/bhtKuGHYJJL2UTVe+ptZXpTFHSedRdoEj4JOFxdi/i8Lf4uey/6nY
 +wWxbrHzjqKIPnR+tv1sLpgFjmo+CYbwaBIcMM0O5izyZWjdHvesAx7+g
 xUoyCHPBVahSRZ448Z+NZ9cb5w283RsphL14uXFvFRCKnOE7PTCAxYwxz
 PdUgV3nmKtgYD2Pj29aYfDoMj35ollWbF7y84DnR1FjS2lwJB8b2LH3tz
 rxlQCX54P5Fw7XXe6SHyHv9yzrMuRjl7TGExgDLtwGKiedB6Q501hnXqs g==;
X-CSE-ConnectionGUID: CudzsS+qQdCvqWC8I7dlpw==
X-CSE-MsgGUID: 4jr/vyS8Q+e54jmGSmnkqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="68017947"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="68017947"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 10:51:38 -0700
X-CSE-ConnectionGUID: uxSeECwkQb+VaDZWVe5SHw==
X-CSE-MsgGUID: nNxlphSdRWeJ7DGSuHR3Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="166522494"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.69])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 10:51:35 -0700
Date: Wed, 13 Aug 2025 19:51:31 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: igt-dev@lists.freedesktop.org, saurabhg.gupta@intel.com, 
 alex.zuo@intel.com, niranjana.vishwanathapura@intel.com,
 matthew.brost@intel.com
Subject: Re: [PATCH] lib/xe/xe_spin: Add switch point for preemptible spinner
Message-ID: <buzrxspq2t2eoeeh2rverullk5o3qk6yfy4mgsrb6gmy52jf7r@z5h7ituni3hu>
References: <20250813155935.87329-2-jonathan.cavitt@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250813155935.87329-2-jonathan.cavitt@intel.com>
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

On Wed, Aug 13, 2025 at 03:59:36PM +0000, Jonathan Cavitt wrote:
> From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> 
> When 'preempt' option is specified, insert a MI_SEMAPHORE_WAIT
> command in the spinner batch buffer. This provides the switch
> point for preemption to happen in multi queue mode.
> 
> Additionally, allow the user to control the preempt wait condition.
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5783
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  include/intel_gpu_commands.h |  1 +
>  lib/xe/xe_spin.c             | 42 +++++++++++++++++++++++++++++++++++-
>  lib/xe/xe_spin.h             |  3 +++
>  3 files changed, 45 insertions(+), 1 deletion(-)
> 
> diff --git a/include/intel_gpu_commands.h b/include/intel_gpu_commands.h
> index cd281ba89d..5158bb0ea0 100644
> --- a/include/intel_gpu_commands.h
> +++ b/include/intel_gpu_commands.h
> @@ -123,6 +123,7 @@
>  #define MI_SEMAPHORE_WAIT	MI_INSTR(0x1c, 2) /* GEN8+ */
>  #define MI_SEMAPHORE_WAIT_TOKEN	MI_INSTR(0x1c, 3) /* GEN12+ */
>  #define   MI_SEMAPHORE_POLL		(1 << 15)
> +#define   MI_SEMAPHORE_QUEUE_SWITCH_MODE	(1 << 11)
>  #define   MI_SEMAPHORE_SAD_GT_SDD	(0 << 12)
>  #define   MI_SEMAPHORE_SAD_GTE_SDD	(1 << 12)
>  #define   MI_SEMAPHORE_SAD_LT_SDD	(2 << 12)
> diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
> index 25f7555e27..d62952b539 100644
> --- a/lib/xe/xe_spin.c
> +++ b/lib/xe/xe_spin.c
> @@ -30,7 +30,6 @@
>  
>  enum { START_TS, NOW_TS };
>  
> -
>  uint32_t xe_spin_nsec_to_ticks(int fd, int gt_id, uint64_t nsec)
>  {
>  	uint32_t ticks = xe_nsec_to_ticks(fd, gt_id, nsec);
> @@ -57,6 +56,7 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
>  
>  	spin->start = 0;
>  	spin->end = 0xffffffff;
> +	spin->wait_cond = 0;
>  	spin->ticks_delta = 0;
>  
>  	if (opts->ctx_ticks) {
> @@ -167,6 +167,24 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
>  				   opts->mem_copy->dst->mocs_index;
>  	}
>  
> +	/*
> +	 * Insert a MI_SEMAPHORE_WAIT_CMD instruction with condition controlled
> +	 * by the user. It also acts as a queue switch point in multi queue mode.
> +	 */
> +	if (opts->preempt) {
> +		uint64_t wait_addr = opts->addr + offsetof(struct xe_spin, wait_cond);
> +
> +		spin->batch[b++] = MI_SEMAPHORE_WAIT_CMD |
> +				MI_SEMAPHORE_POLL |
> +				MI_SEMAPHORE_QUEUE_SWITCH_MODE |

This bit is not documented for previous platforms so is it safe to
set it?

BTW similar effect was adding MI_ARB_CHECK (in term test is also
passing here).

If my nit is not applying here, code lgtm:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> +				MI_SEMAPHORE_SAD_EQ_SDD |
> +				3;
> +		spin->batch[b++] = 0;
> +		spin->batch[b++] = wait_addr;
> +		spin->batch[b++] = wait_addr >> 32;
> +		spin->batch[b++] = 0;
> +	}
> +
>  	spin->batch[b++] = MI_COND_BATCH_BUFFER_END | MI_DO_COMPARE | 2;
>  	spin->batch[b++] = 0;
>  	spin->batch[b++] = end_addr;
> @@ -207,6 +225,28 @@ void xe_spin_end(struct xe_spin *spin)
>  	WRITE_ONCE(spin->end, 0);
>  }
>  
> +/**
> + * xe_spin_preempt_wait:
> + * @spin: pointer to spinner mapped bo
> + *
> + * Make the spinner wait on the preemption semaphore.
> + */
> +void xe_spin_preempt_wait(struct xe_spin *spin)
> +{
> +	spin->wait_cond = 1;
> +}
> +
> +/**
> + * xe_spin_preempt_nowait:
> + * @spin: pointer to spinner mapped bo
> + *
> + * Make the spinner do not wait on the preemption semaphore.
> + */
> +void xe_spin_preempt_nowait(struct xe_spin *spin)
> +{
> +	spin->wait_cond = 0;
> +}
> +
>  /**
>   * xe_spin_create:
>   * @opt: controlling options such as allocator handle, exec_queue, vm etc
> diff --git a/lib/xe/xe_spin.h b/lib/xe/xe_spin.h
> index c2199d0aa2..eaf2a409e0 100644
> --- a/lib/xe/xe_spin.h
> +++ b/lib/xe/xe_spin.h
> @@ -64,6 +64,7 @@ struct xe_spin {
>  	uint64_t pad;
>  	uint32_t start;
>  	uint32_t end;
> +	uint32_t wait_cond;
>  	uint32_t ticks_delta;
>  	uint64_t exec_sync;
>  	uint32_t timestamp;
> @@ -76,6 +77,8 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts);
>  bool xe_spin_started(struct xe_spin *spin);
>  void xe_spin_wait_started(struct xe_spin *spin);
>  void xe_spin_end(struct xe_spin *spin);
> +void xe_spin_preempt_wait(struct xe_spin *spin);
> +void xe_spin_preempt_nowait(struct xe_spin *spin);
>  
>  /*
>   * xe_cork: higher level API that simplifies exec'ing an xe_spin by taking care
> -- 
> 2.43.0
> 
