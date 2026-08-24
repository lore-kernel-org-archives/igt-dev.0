Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3335C5DF81
	for <igt-dev@archiver.kernel.org>; Mon, 24 Aug 2026 19:11:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5659910E085;
	Mon, 24 Aug 2026 19:11:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iFKJ+zHE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3602710E085
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Aug 2026 19:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787598648; x=1819134648;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=QEi+jPw9cKH/17GUfCuH59SlvsM/wbkgJylxyPZn/so=;
 b=iFKJ+zHEsd9T4GIZa4v8vANYnFbI95lLUBINVq+sPgbRCnj1kV2VsQFI
 f+RXb+w5O+TT/949+c70FGaricKUTb03S7vp8Wtck9B5CiK/h5UTUnozh
 aGVhP6jk8rmNYVDCKt5DpyJ6ZwI+ICc5uPx3PezDEHk1Ay9e1t0Ryqn5y
 fgOicZ3n0nlcmgZSQK338uj8HMpXXEhjZJuTMkV1mr2i8LzFNka2qPjWy
 A60uQ+54lBMciJ9lY7yXNKwmuXvGZjqSPAn1MD8LKKDooQu01Djy404+w
 0TMWcnggyZOR8UFmVgQ9BxSzwKv8F7z/+Ar94upKhlQsb9No3tnTvmwYX A==;
X-CSE-ConnectionGUID: uoGX7sUPQOSZl2oG+kny3Q==
X-CSE-MsgGUID: Q2jl4uMCRvOoByjQC+6/XA==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="91736723"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="91736723"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 12:10:47 -0700
X-CSE-ConnectionGUID: 7/LJOs6FRAuviETEstioPg==
X-CSE-MsgGUID: eJAYtxDfRsqfP6GOTmu/qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="263802805"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 12:10:46 -0700
Date: Mon, 24 Aug 2026 21:10:44 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com
Subject: Re: [PATCH v2 8/9] tests/intel/xe_exec_reset: add
 gt-stress-reset-pm-transition subtest
Message-ID: <20260824191044.njycjum2kggy477n@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 nishit.sharma@intel.com, igt-dev@lists.freedesktop.org,
 kamil.konieczny@intel.com
References: <20260818040845.548727-1-nishit.sharma@intel.com>
 <20260818040845.548727-9-nishit.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260818040845.548727-9-nishit.sharma@intel.com>
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
On 2026-08-18 at 04:08:44 +0000, nishit.sharma@intel.com wrote:
> From: Nishit Sharma <nishit.sharma@intel.com>
> 
> This test creates a short idle/transition window before VM/context
> teardown-recreate, approximating PM transition timing while
> reset+submit pressure is active.
> 
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tests/intel/xe_exec_reset.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
> index d818173c2..42c2a7efd 100644
> --- a/tests/intel/xe_exec_reset.c
> +++ b/tests/intel/xe_exec_reset.c
> @@ -139,6 +139,7 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci,
>  #define RAPID_RESET_STRESS		(0x1 << 19)
>  #define DESTROY_VM_CTX_STRESS		(0x1 << 20)
>  #define MIXED_ENGINE_STRESS		(0x1 << 21)
> +#define PM_TRANSITION_STRESS		(0x1 << 22)
>  
>  /**
>   * SUBTEST: %s-cat-error
> @@ -804,7 +805,11 @@ static void submit_jobs(struct gt_thread_data *t)
>  		}
>  
>  		if (((t->flags & INVALIDATE_BO_STRESS) && !(i % 96)) ||
> -		    ((t->flags & DESTROY_VM_CTX_STRESS) && !(i % 128))) {
> +		    ((t->flags & DESTROY_VM_CTX_STRESS) && !(i % 128)) ||
> +		     ((t->flags & PM_TRANSITION_STRESS) && !(i % 160))) {
> +			if (t->flags & PM_TRANSITION_STRESS)
> +				usleep(20000);
> +
>  			if (t->flags & MEM_PRESSURE_STRESS) {
>  				pressure_bo_destroy(fd, pressure_bos, pressure_count);
>  				pressure_count = 0;
> @@ -878,6 +883,10 @@ static void *gt_reset_thread(void *data)
>   * Description: Stress concurrent GT resets and mixed-engine job submissions
>   * Test category: stress test
>   *
> + * SUBTEST: gt-stress-reset-pm-transition
> + * Description: Stress concurrent GT resets and job submissions during PM transition windows
> + * Test category: stress test
> + *
>   */
>  static void
>  gt_reset(int fd, int gt, int n_threads, int n_sec, unsigned int flags)
> @@ -1103,6 +1112,7 @@ int igt_main()
>  		{ "reset-rapid-cycle", RAPID_RESET_STRESS },
>  		{ "reset-destroy-vm-context", DESTROY_VM_CTX_STRESS },
>  		{ "reset-mixed-engine-usage", MIXED_ENGINE_STRESS | RAPID_RESET_STRESS },
> +		{ "reset-pm-transition", PM_TRANSITION_STRESS | DESTROY_VM_CTX_STRESS },
>  		{ NULL },
>  	};
>  	int gt;
> -- 
> 2.43.0
> 
