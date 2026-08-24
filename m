Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EACAC5DF81
	for <igt-dev@archiver.kernel.org>; Mon, 24 Aug 2026 19:12:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B0CA10E196;
	Mon, 24 Aug 2026 19:12:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IkjNXUvw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4852A10E085
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Aug 2026 19:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787598705; x=1819134705;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8emb7GnWjulQNoZmocleHL3B1tA+G50buT+6dA4y0s0=;
 b=IkjNXUvwuHhIGm1erpEE5jnjkMFAUvA0sv4Oagbz6Fv7NHIpZ/iJhbVz
 hqQMU0z08IvdStSAfdO6JoubUmnjPZGg7vijOyl2GvhmmlFgwgWZeeD6m
 ++7SkNa+bxpV3XPOASFLg4JaugmVbUqV3v0VumDLCnqesRvvgysztUiRL
 1+GJy6JyYluDtmh/KFbFG6jXZSezCUAyqaQXcgqSm9D/NZ3Nuq46ob+73
 KrTvbGNk2ARIwuLs9zeDQ50gS4VIQif1HhLafSU9rgaHGQd8HHUwc3BJg
 uuJKNnp7oYkh/gc+Rg1UwgCsekZSCZ2HJNx7nnQMgicpFyVMuITDVo9Ej Q==;
X-CSE-ConnectionGUID: I+rVX4lmTPm/9R6GoV+ndg==
X-CSE-MsgGUID: DlskOQZoQR6ykqXrP3ZOFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="99583071"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="99583071"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 12:11:45 -0700
X-CSE-ConnectionGUID: cfosaej5RiOhNYyF8vhg8g==
X-CSE-MsgGUID: 4iVK1fs+TRmCJ1bZISZWAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="263355576"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 12:11:44 -0700
Date: Mon, 24 Aug 2026 21:11:41 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com
Subject: Re: [PATCH v2 9/9] tests/intel/xe_exec_reset: add
 gt-stress-reset-engine-hang subtest
Message-ID: <20260824191141.ubk7spjyd7umeldr@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 nishit.sharma@intel.com, igt-dev@lists.freedesktop.org,
 kamil.konieczny@intel.com
References: <20260818040845.548727-1-nishit.sharma@intel.com>
 <20260818040845.548727-10-nishit.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260818040845.548727-10-nishit.sharma@intel.com>
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
On 2026-08-18 at 04:08:45 +0000, nishit.sharma@intel.com wrote:
> From: Nishit Sharma <nishit.sharma@intel.com>
> 
> Add a dedicated GT reset stress subtest that triggers reset while a long
> spinner workload is active.
> 
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tests/intel/xe_exec_reset.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
> index 42c2a7efd..6eda71c32 100644
> --- a/tests/intel/xe_exec_reset.c
> +++ b/tests/intel/xe_exec_reset.c
> @@ -887,6 +887,10 @@ static void *gt_reset_thread(void *data)
>   * Description: Stress concurrent GT resets and job submissions during PM transition windows
>   * Test category: stress test
>   *
> + * SUBTEST: gt-stress-reset-engine-hang
> + * Description: Test GT reset while long spinner workload is active
> + * Test category: stress test
> + *
>   */
>  static void
>  gt_reset(int fd, int gt, int n_threads, int n_sec, unsigned int flags)
> @@ -1314,6 +1318,14 @@ int igt_main()
>  			gt_reset(fd, 0, 8, 2, s->flags);
>  	}
>  
> +	igt_subtest("gt-stress-reset-engine-hang")
> +		xe_for_each_engine(fd, hwe) {
> +			xe_legacy_test_mode(fd, hwe, 2, 4,
> +					    GT_RESET | LONG_SPIN,
> +					    LEGACY_MODE_ADDR, false);
> +			break;
> +		}
> +
>  	igt_subtest("gt-mocs-reset")
>  		xe_for_each_gt(fd, gt)
>  			gt_mocs_reset(fd, gt);
> -- 
> 2.43.0
> 
