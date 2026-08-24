Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 804EEC5DF81
	for <igt-dev@archiver.kernel.org>; Mon, 24 Aug 2026 19:07:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B14410E085;
	Mon, 24 Aug 2026 19:07:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kVRHgv5L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A68D10E0F5
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Aug 2026 19:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787598433; x=1819134433;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=PBanBcurWqGOLALkohmyJHDGijlq8t+fD4Jx9svg0CA=;
 b=kVRHgv5L0xvhc4gUemHGOSkz0Drzkp+kQJ/8MuN2hBayrHL5F2UuZTss
 In/OgqBMh/SWtHBBvK4ua3LXbjlfcZsnHx1nYexVv+CndC/xXCzwlDpcO
 akliKJftYsBhOojy09J0ja0BTb+JSz+WBUOxEt7VvPF/xgtODnVFkWffb
 uHM1CIuxAdHuxmXIAXRvJIU+whcPoIxbVcxQcs61Lc/Hiw/5mVRycQDZq
 WrCzdMf8scULr2ykRJo9mTTV1DkqItad3yeHl+PZKmMFbFb9K5Dr9u7OY
 7pG3wb9gvlEzhhftBKXZJw47cKO0St5pPApfFcpXFDT1kwfli/xVlhV6Y Q==;
X-CSE-ConnectionGUID: uOa6maxnQCi7IA34mAC/Gg==
X-CSE-MsgGUID: EvsFFMefRM6XYqvxTSbV9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="88072405"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="88072405"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 12:07:13 -0700
X-CSE-ConnectionGUID: BQICJd5zQvKtVZ0BtaZNrg==
X-CSE-MsgGUID: 8zQlVAmzQ/6th+leH7yPcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="265770067"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 12:07:11 -0700
Date: Mon, 24 Aug 2026 21:07:09 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com
Subject: Re: [PATCH v2 5/9] tests/intel/xe_exec_reset: add
 gt-stress-reset-rapid-cycle subtest
Message-ID: <20260824190709.xrsf6i4bs3t7y56j@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 nishit.sharma@intel.com, igt-dev@lists.freedesktop.org,
 kamil.konieczny@intel.com
References: <20260818040845.548727-1-nishit.sharma@intel.com>
 <20260818040845.548727-6-nishit.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260818040845.548727-6-nishit.sharma@intel.com>
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
On 2026-08-18 at 04:08:41 +0000, nishit.sharma@intel.com wrote:
> From: Nishit Sharma <nishit.sharma@intel.com>
> 
> This extends concurrent reset and submission stress coverage to a
> high-frequency reset scenario while keeping the existing stress harness
> unchanged for other subtests.
> 
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tests/intel/xe_exec_reset.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
> index 2a822b29b..a9c3b593d 100644
> --- a/tests/intel/xe_exec_reset.c
> +++ b/tests/intel/xe_exec_reset.c
> @@ -136,6 +136,7 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci,
>  #define RESET_SYNC_MODE			(0x1 << 16)
>  #define MEM_PRESSURE_STRESS		(0x1 << 17)
>  #define INVALIDATE_BO_STRESS		(0x1 << 18)
> +#define RAPID_RESET_STRESS		(0x1 << 19)
>  
>  /**
>   * SUBTEST: %s-cat-error
> @@ -717,8 +718,10 @@ static void pressure_bo_destroy(int fd, uint32_t *bos, int count)
>  
>  static void do_resets(struct gt_thread_data *t)
>  {
> +	int interval_us = (t->flags & RAPID_RESET_STRESS) ? 1000 : 250000;
> +
>  	while (!*(t->exit)) {
> -		usleep(250000);	/* 250 ms */
> +		usleep(interval_us);
>  		(*t->num_reset)++;
>  		if (t->flags & RESET_SYNC_MODE)
>  			xe_force_gt_reset_sync(t->fd, t->gt);
> @@ -840,6 +843,10 @@ static void *gt_reset_thread(void *data)
>   * Description: Stress concurrent GT resets and job submissions while invalidating BO CPU mappings
>   * Test category: stress test
>   *
> + * SUBTEST: gt-stress-reset-rapid-cycle
> + * Description: Stress concurrent GT resets and job submissions with rapid-cycle resets
> + * Test category: stress test
> + *
>   */
>  static void
>  gt_reset(int fd, int gt, int n_threads, int n_sec, unsigned int flags)
> @@ -1061,6 +1068,7 @@ int igt_main()
>  		{ "reset-concurrent-submit-sync", RESET_SYNC_MODE },
>  		{ "reset-memory-pressure", MEM_PRESSURE_STRESS },
>  		{ "reset-bo-invalidation", INVALIDATE_BO_STRESS },
> +		{ "reset-rapid-cycle", RAPID_RESET_STRESS },
>  		{ NULL },
>  	};
>  	int gt;
> -- 
> 2.43.0
> 
