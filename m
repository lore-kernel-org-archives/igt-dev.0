Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27D2DC5DF9C
	for <igt-dev@archiver.kernel.org>; Mon, 24 Aug 2026 19:08:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C297E10E085;
	Mon, 24 Aug 2026 19:08:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Spebn4mM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26E8F10E0F5
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Aug 2026 19:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787598475; x=1819134475;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=b0WL1qqP8n2d8IsrXRN5yCxMgdBwR1iYfB1ajZ/RPqM=;
 b=Spebn4mM9Jp7Rkr3ndDX0J5ftNcRag2m+o2DJueCKbzINqxeVDuoFyKd
 6PODWRoS7/dYMRAWaU3K57rAtCK5gsJgU2tjTm6KDoH/wEuyYLdX2GMMb
 3HOd30lYof05gIC00x04lfwxQWKyuV6/O9KCvTPdxjXiR55cz/oUCea3F
 69N7fIT8O71JiD76fUaHzSrUOq6H6q1cjxzk9J3o9SuXEaDQOKlXaMb5F
 dEfnvYrtL3AJZwe1OBeguAFQMVUOeSmdZUoXzt+cdjXQEpa/eAYziNH4T
 WucNPvcVQagYuZnI7kOBW2YndMUO+o3vZEnryDdgCGrMwlH2XM3q/MIII g==;
X-CSE-ConnectionGUID: dIKa0vpRTHGNtyanwqu77Q==
X-CSE-MsgGUID: UPXaxGXJTn6DfqBRqOSx0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="88072497"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="88072497"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 12:07:54 -0700
X-CSE-ConnectionGUID: yYzB1E+0SLC49KexmWzN1w==
X-CSE-MsgGUID: 018VS27eSlCk8fLQsDtNlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="296987609"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 12:07:53 -0700
Date: Mon, 24 Aug 2026 21:07:50 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com
Subject: Re: [PATCH v2 6/9] tests/intel/xe_exec_reset: add
 gt-stress-reset-destroy-vm-context subtest
Message-ID: <20260824190750.hteyrjgt2oi3rgre@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 nishit.sharma@intel.com, igt-dev@lists.freedesktop.org,
 kamil.konieczny@intel.com
References: <20260818040845.548727-1-nishit.sharma@intel.com>
 <20260818040845.548727-7-nishit.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260818040845.548727-7-nishit.sharma@intel.com>
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
On 2026-08-18 at 04:08:42 +0000, nishit.sharma@intel.com wrote:
> From: Nishit Sharma <nishit.sharma@intel.com>
> 
> This test destroy VM context while reset/submission is active, The BO/VM
> is periodically torn down and recreated while the reset thread continues
> running.
> 
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tests/intel/xe_exec_reset.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
> index a9c3b593d..8fac53180 100644
> --- a/tests/intel/xe_exec_reset.c
> +++ b/tests/intel/xe_exec_reset.c
> @@ -137,6 +137,7 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci,
>  #define MEM_PRESSURE_STRESS		(0x1 << 17)
>  #define INVALIDATE_BO_STRESS		(0x1 << 18)
>  #define RAPID_RESET_STRESS		(0x1 << 19)
> +#define DESTROY_VM_CTX_STRESS		(0x1 << 20)
>  
>  /**
>   * SUBTEST: %s-cat-error
> @@ -781,7 +782,8 @@ static void submit_jobs(struct gt_thread_data *t)
>  			pressure_bo_create(fd, vm, t->gt, pressure_bos, &pressure_count);
>  		}
>  
> -		if (((t->flags & INVALIDATE_BO_STRESS) && !(i % 96))) {
> +		if (((t->flags & INVALIDATE_BO_STRESS) && !(i % 96)) ||
> +		    ((t->flags & DESTROY_VM_CTX_STRESS) && !(i % 128))) {
>  			if (t->flags & MEM_PRESSURE_STRESS) {
>  				pressure_bo_destroy(fd, pressure_bos, pressure_count);
>  				pressure_count = 0;
> @@ -847,6 +849,10 @@ static void *gt_reset_thread(void *data)
>   * Description: Stress concurrent GT resets and job submissions with rapid-cycle resets
>   * Test category: stress test
>   *
> + * SUBTEST: gt-stress-reset-destroy-vm-context
> + * Description: Stress concurrent GT resets and job submissions while destroying and recreating VM context
> + * Test category: stress test
> + *
>   */
>  static void
>  gt_reset(int fd, int gt, int n_threads, int n_sec, unsigned int flags)
> @@ -1069,6 +1075,7 @@ int igt_main()
>  		{ "reset-memory-pressure", MEM_PRESSURE_STRESS },
>  		{ "reset-bo-invalidation", INVALIDATE_BO_STRESS },
>  		{ "reset-rapid-cycle", RAPID_RESET_STRESS },
> +		{ "reset-destroy-vm-context", DESTROY_VM_CTX_STRESS },
>  		{ NULL },
>  	};
>  	int gt;
> -- 
> 2.43.0
> 
