Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53B8CC48BF6
	for <igt-dev@archiver.kernel.org>; Thu, 29 Feb 2024 13:42:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB8B910E189;
	Thu, 29 Feb 2024 13:42:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZkIVBQQ4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F1A310E189
 for <IGT-Dev@lists.freedesktop.org>; Thu, 29 Feb 2024 13:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709214142; x=1740750142;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7H+CjvZacCeOx7P9t5iPs7+XUuYQqtiYb80sCZYJL0E=;
 b=ZkIVBQQ47VdWLPJSzrs/zUlyaCVan4M8/i2tK8s+Wb6YYA2nyPA3IM6T
 cDiWQIMihljum6G9PWLttUZ3gYXesEne5A12tpbzXSO+zGS52ZEGmYPDv
 j07pofa0I/GuSe+3t1kwo6JeP+Sakx3nXEu2Vx5BU3l2HSGMWcqNlwDnF
 qpuatCTBmPTq48GId4YPBE54D9LRUptV+VKyJJPEJvpkwoJp40+jK/ka+
 x7rFt86rxllzxyyJHdRNt6foY09yMceeuIeTjZFgmwadRmja0fmOfIFt0
 +DnfkeS4Vng449kPQgi4jQ4IG8+ta18onNRTnWprFfePiPAnBg3AxdZey w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="3847222"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="3847222"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 05:42:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="8251735"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 05:42:20 -0800
Date: Thu, 29 Feb 2024 14:42:16 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: IGT-Dev@Lists.FreeDesktop.Org
Cc: John.C.Harrison@Intel.com, johnharr <johnharr@invalid-email.com>
Subject: Re: [PATCH i-g-t 1/2] tests/intel/gem_spin_batch: Skip compute
 engines on MTL due to w/a
Message-ID: <20240229134216.4ut26aezfbrtunyi@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 IGT-Dev@Lists.FreeDesktop.Org, John.C.Harrison@Intel.com,
 johnharr <johnharr@invalid-email.com>
References: <20240226235737.2150915-1-John.C.Harrison@Intel.com>
 <20240226235737.2150915-2-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240226235737.2150915-2-John.C.Harrison@Intel.com>
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

Hi John.C.Harrison,
On 2024-02-26 at 15:57:35 -0800, John.C.Harrison@Intel.com wrote:
> From: johnharr <johnharr@invalid-email.com>
------- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This do not match your s-o-b:
John Harrison <John.C.Harrison@Intel.com>

Please correct and resend, rest looks ok.

Regards,
Kamil

> 
> There is a w/a on MTL that prevents concurrent execution of multiple
> processes on RCS and CCS. The 'spin-all-new' test is explicitly
> testing such execution across all engines. So either the entire test
> must be skipped on MTL or just the compute engine must be skipped. Do
> the latter as that at least leaves some test coverage in place.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>  tests/intel/gem_spin_batch.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/tests/intel/gem_spin_batch.c b/tests/intel/gem_spin_batch.c
> index ec1458e35197..a0f35b23c718 100644
> --- a/tests/intel/gem_spin_batch.c
> +++ b/tests/intel/gem_spin_batch.c
> @@ -214,6 +214,19 @@ spin_on_all_engines(int fd, const intel_ctx_t *ctx,
>  	igt_waitchildren();
>  }
>  
> +/*
> + * Wa_14019159160:
> + * An RCS/CCS workaround on MTL means that contexts from different address spaces
> + * cannot run in parallel, they must be timesliced. However, a non-preemptible
> + * spinner cannot be timesliced. Thus the PARALLEL_SPIN_NEW_CTX test cannot be run
> + * across both RCS and CCS engines, one or other must be skipped for the test to
> + * not hit a heartbeat timeout and be killed.
> + */
> +static bool skip_bad_engine(int fd, const struct intel_execution_engine2 *e)
> +{
> +	return IS_METEORLAKE(intel_get_drm_devid(fd)) && (e->class == I915_ENGINE_CLASS_COMPUTE);
> +}
> +
>  static void spin_all(int i915, const intel_ctx_t *ctx, unsigned int flags)
>  #define PARALLEL_SPIN_NEW_CTX BIT(0)
>  {
> @@ -230,6 +243,9 @@ static void spin_all(int i915, const intel_ctx_t *ctx, unsigned int flags)
>  		if (gem_engine_can_block_ggtt_binder(i915, e))
>  			continue;
>  
> +		if (skip_bad_engine(i915, e))
> +			continue;
> +
>  		if (flags & PARALLEL_SPIN_NEW_CTX)
>  			ctx = intel_ctx_create(i915, &cfg);
>  		ahnd = get_reloc_ahnd(i915, ctx->id);
> -- 
> 2.43.0
> 
