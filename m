Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 481CFC5DF9C
	for <igt-dev@archiver.kernel.org>; Mon, 24 Aug 2026 18:59:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF6B910E0F5;
	Mon, 24 Aug 2026 18:59:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XZsCAUra";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5286110E0F5
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Aug 2026 18:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787597920; x=1819133920;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Xj1hFMtP2tnKLmdVhYdlDy2+JD6IJ7mIKAXVwCz4RxY=;
 b=XZsCAUrafDO2oJBImWHLic2SQBMWcOBNEh4I9z3lx0djb0s+sZ7f1oIE
 wnjKN2ZNy/o29kI3UvZVwE5bpTSnBOWYo8563h4qA+MHmpwJ4W1mJK2Uc
 tak8ktyOOFtyOIBnHr3OuI1B6XN9FRsFK9tCJWIuVmKvxYf1RkvSdH9BP
 M/R4bUYiPDhckZds1p2ay5PaPo86gpy3n6yBugjpQsQEMeGz/EedTutb/
 YoeDcAaLQ2DyTGOvyWgpazQ4xT5N9UbDQ9dm6PCXDURP5ySeK/ou7DNer
 aLHEbjyKvln/3kb054i/N1X+UfNm8gEgOEtUjO1NzJsR6Y3A91feeH1DC w==;
X-CSE-ConnectionGUID: 4OVkrlQcQG+akTsD5paJmQ==
X-CSE-MsgGUID: 1jIJVACjTveR4rc8X6J8IQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="87180574"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="87180574"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 11:58:40 -0700
X-CSE-ConnectionGUID: vzYGligoRsegQw1mAm2VUg==
X-CSE-MsgGUID: z4ATx+I+Rz6w79BsNwNkMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="290605408"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 11:58:39 -0700
Date: Mon, 24 Aug 2026 20:58:36 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com
Subject: Re: [PATCH v2 2/9] tests/intel/xe_exec_reset: add sync concurrent
 reset submit subtest
Message-ID: <20260824185836.4vvapjuc6xh5zxw5@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 nishit.sharma@intel.com, igt-dev@lists.freedesktop.org,
 kamil.konieczny@intel.com
References: <20260818040845.548727-1-nishit.sharma@intel.com>
 <20260818040845.548727-3-nishit.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260818040845.548727-3-nishit.sharma@intel.com>
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
On 2026-08-18 at 04:08:38 +0000, nishit.sharma@intel.com wrote:
> From: Nishit Sharma <nishit.sharma@intel.com>
> 
> Add gt-reset-concurrent-submit-sync to xe_exec_reset to stress concurrent
> job submission while issuing synchronous GT resets.
> 
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tests/intel/xe_exec_reset.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
> index 134378974..407775cfc 100644
> --- a/tests/intel/xe_exec_reset.c
> +++ b/tests/intel/xe_exec_reset.c
> @@ -132,6 +132,7 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci,
>  #define COMPRESSION			(0x1 << 13)
>  #define MULTI_QUEUE			(0x1 << 14)
>  #define SECONDARY_QUEUE			(0x1 << 15)
> +#define RESET_SYNC_MODE			(0x1 << 16)
>  
>  /**
>   * SUBTEST: %s-cat-error
> @@ -661,7 +662,10 @@ static void do_resets(struct gt_thread_data *t)
>  	while (!*(t->exit)) {
>  		usleep(250000);	/* 250 ms */
>  		(*t->num_reset)++;
> -		xe_force_gt_reset_async(t->fd, t->gt);
> +		if (t->flags & RESET_SYNC_MODE)
> +			xe_force_gt_reset_sync(t->fd, t->gt);
> +		else
> +			xe_force_gt_reset_async(t->fd, t->gt);
>  	}
>  }
>  
> @@ -736,6 +740,10 @@ static void *gt_reset_thread(void *data)
>   * Description: Stress concurrent GT resets and job submissions
>   * Test category: stress test
>   *
> + * SUBTEST: gt-stress-reset-concurrent-submit-sync
> + * Description: Stress concurrent GT resets and job submissions with sync resets
> + * Test category: stress test
> + *
>   */
>  static void
>  gt_reset(int fd, int gt, int n_threads, int n_sec, unsigned int flags)
> @@ -953,6 +961,7 @@ int igt_main()
>  	};
>  	const struct section ssections[] = {
>  		{ "reset-concurrent-submit", 0 },
> +		{ "reset-concurrent-submit-sync", RESET_SYNC_MODE },
>  		{ NULL },
>  	};
>  	int gt;
> @@ -1151,7 +1160,7 @@ int igt_main()
>  
>  	for (const struct section *s = ssections; s->name; s++) {
>  		igt_subtest_f("gt-stress-%s", s->name)
> -			gt_reset(fd, 0, 8, 2, 0);
> +			gt_reset(fd, 0, 8, 2, s->flags);
>  	}
>  
>  	igt_subtest("gt-mocs-reset")
> -- 
> 2.43.0
> 
