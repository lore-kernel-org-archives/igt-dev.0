Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40E7FC36017
	for <igt-dev@archiver.kernel.org>; Tue,  1 Apr 2025 19:10:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C67C410E0F0;
	Tue,  1 Apr 2025 19:10:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bVqtTv4a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 220E010E0F0
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Apr 2025 19:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743534599; x=1775070599;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=nK8+BYRExk3FAEa3/i+rjtBEdUboHGX4dE7xOb0Ae/k=;
 b=bVqtTv4aiuxmPZmABNsTswYE9lXhWdSIRQEov1bIrbcpsww9Ga+CG3gz
 34p0MLg1iHiUI5Nv7qoUetmbwjFOqAaTEer85hfFy3bwhx5J2h45zQbp6
 mcqEcKL/oyqmNM62uOExPCy0hQVmR31EfVEzhxKi9Me3siDeakD1i3HCK
 dUtmLNTQX9BID+kEJAsLCQ7kyNpJif5OyY/1iOsk0Nlr6tM0U38cfuRPA
 8HGB4p1Fhx5QwIBjITCkY3aRSEn3fJgIH711TtQwPNHQT98ei8wMRMy6x
 jDACbey/lMh5rDMb1bJ5TNg1ze5jgcmVf6F7VBD9me7hD8GwkTFPPHv/M A==;
X-CSE-ConnectionGUID: 88bNyj5LQE2uoeLDTaxGbw==
X-CSE-MsgGUID: l7IedAQ8TTC6fbDuczBcbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="62276423"
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; d="scan'208";a="62276423"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 12:09:59 -0700
X-CSE-ConnectionGUID: NJEvUCl7R4C8JtPTjv5Tuw==
X-CSE-MsgGUID: inBhFr09SVCaMpO6F1HIHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; d="scan'208";a="126373615"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.192])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 12:09:57 -0700
Date: Tue, 1 Apr 2025 21:09:54 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t, v4 2/5] lib/xe/xe_spin: Add mem copy capability to
 spinner
Message-ID: <20250401190954.bzbl7ynyb4xxjqup@zkempczy-mobl2>
References: <20250401140510.38142-1-francois.dugast@intel.com>
 <20250401140510.38142-3-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250401140510.38142-3-francois.dugast@intel.com>
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

On Tue, Apr 01, 2025 at 04:00:57PM +0200, Francois Dugast wrote:
> Add the option to perform a copy while spinning. The existing struct
> blt_mem_object is reused as it contains the information required for
> the copy.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  lib/xe/xe_spin.c | 14 ++++++++++++++
>  lib/xe/xe_spin.h | 19 +++++++++++++++++++
>  2 files changed, 33 insertions(+)
> 
> diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
> index 0de0b1f2e..5a9d51575 100644
> --- a/lib/xe/xe_spin.c
> +++ b/lib/xe/xe_spin.c
> @@ -125,6 +125,20 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
>  		spin->batch[b++] = ticks_delta_addr >> 32;
>  	}
>  
> +	if (opts->mem_copy) {
> +		spin->batch[b++] = MEM_COPY_CMD;
> +		spin->batch[b++] = opts->mem_copy->src->width - 1;
> +		spin->batch[b++] = opts->mem_copy->src->height - 1;
> +		spin->batch[b++] = opts->mem_copy->src->pitch - 1;
> +		spin->batch[b++] = opts->mem_copy->dst->pitch - 1;
> +		spin->batch[b++] = opts->mem_copy->src_offset;
> +		spin->batch[b++] = opts->mem_copy->src_offset << 32;
> +		spin->batch[b++] = opts->mem_copy->dst_offset;
> +		spin->batch[b++] = opts->mem_copy->dst_offset << 32;
> +		spin->batch[b++] = opts->mem_copy->src->mocs_index << MEM_COPY_MOCS_SHIFT |
> +				   opts->mem_copy->dst->mocs_index;
> +	}
> +
>  	spin->batch[b++] = MI_COND_BATCH_BUFFER_END | MI_DO_COMPARE | 2;
>  	spin->batch[b++] = 0;
>  	spin->batch[b++] = end_addr;
> diff --git a/lib/xe/xe_spin.h b/lib/xe/xe_spin.h
> index 7c95996c3..c4110469b 100644
> --- a/lib/xe/xe_spin.h
> +++ b/lib/xe/xe_spin.h
> @@ -14,6 +14,7 @@
>  
>  #include "xe_query.h"
>  #include "lib/igt_dummyload.h"
> +#include "lib/intel_blt.h"
>  
>  /* Wrapper to integrate with igt_dummyload, aka igt_spin */
>  igt_spin_t *xe_spin_create(int fd, const struct igt_spin_factory *opt);
> @@ -24,11 +25,28 @@ void xe_spin_free(int fd, struct igt_spin *spin);
>   * engine in which it's exec'ed
>   */
>  
> +/**
> + * struct xe_spin_mem_copy
> + * @src: source BLT object
> + * @dst: destination BLT object
> + * @src_offset: source offset
> + * @dst_offset: destination offset
> + *
> + * Used to perform memory copy with the spinner.
> + */
> +struct xe_spin_mem_copy {
> +	struct blt_mem_object *src;
> +	struct blt_mem_object *dst;
> +	uint64_t src_offset;
> +	uint64_t dst_offset;
> +};
> +
>  /**
>   * struct xe_spin_opts
>   * @addr: offset of spinner within vm
>   * @preempt: allow spinner to be preempted or not
>   * @ctx_ticks: number of ticks after which spinner is stopped, applied if > 0
> + * @mem_copy: todo

Just fill it, other things lgtm. With this field filled, the patch is:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>


--
Zbigniew

>   *
>   * Used to initialize struct xe_spin spinner behavior.
>   */
> @@ -37,6 +55,7 @@ struct xe_spin_opts {
>  	bool preempt;
>  	uint32_t ctx_ticks;
>  	bool write_timestamp;
> +	struct xe_spin_mem_copy *mem_copy;
>  };
>  
>  /* Mapped GPU object */
> -- 
> 2.43.0
> 
