Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C998BC624D3
	for <igt-dev@archiver.kernel.org>; Tue,  1 Sep 2026 14:34:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5729910ED1F;
	Tue,  1 Sep 2026 14:34:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EPce3Mwu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77B3010ED1F
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Sep 2026 14:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788273213; x=1819809213;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=QWYlKQO0c3d+KCfCvjO2XfZK0uGjsPG91DYrRIIOBXM=;
 b=EPce3MwuGjlPfW01XgEV0FLODSgACnz5vzyPv1B1KdtnTDezy89eHFYs
 buAIzw//GdcA2kGgMMe8/w12TbdN4TqV594DSh5SvNmVSonryCry5JXRf
 36/p87hyGWl9PTJJmdT/ES3d7BX3mixY6hMA4cTu+za0j7odryw12SMV0
 RKOjsoMJAOrfj/pINdIPF6GifWeD+T03DeRnqzCL5KnxuqrpmHX43xOMw
 1FQVNEPNuw9NI3aJnVv0YFvS2bLEfv0lqPqo1aSk40rqkBJU9uDnN/Pd1
 30T8rdJc1QiO7SWJky0ZL1uisN0+SnPthJuOBtsG19+4tTjkFOQgpXxtG Q==;
X-CSE-ConnectionGUID: WCWPLCFzSl2yOaP36O7GEA==
X-CSE-MsgGUID: yajDsocZRxavXLX+RNxsuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="100057776"
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; d="scan'208";a="100057776"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 07:33:21 -0700
X-CSE-ConnectionGUID: 0Nitv56fTl+uNIQEEOud6w==
X-CSE-MsgGUID: o7txGhdxReGhL7n2qw4e6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; d="scan'208";a="269153041"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 07:33:19 -0700
Date: Tue, 1 Sep 2026 16:33:01 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com
Subject: Re: [PATCH] tests/intel/xe_sysfs_scheduler: fix save/restore array
 indexing
Message-ID: <20260901143301.d6bxdrpqbzl6a2oh@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 nishit.sharma@intel.com, igt-dev@lists.freedesktop.org,
 kamil.konieczny@intel.com
References: <20260901035902.222919-1-nishit.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260901035902.222919-1-nishit.sharma@intel.com>
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

Hi Nishit,
On 2026-09-01 at 03:59:02 +0000, nishit.sharma@intel.com wrote:
> From: Nishit Sharma <nishit.sharma@intel.com>
> 
> The scheduler property save/restore array was declared as
> store[MAX_GTS][3][3] but indexed with the per-GT engine index in the
> first (GT) dimension:
> 
> This drops the GT dimension completely: on multi-GT systems every GT
> overwrites the same slots, so teardown restores each engine's
> preempt_timeout/timeslice_duration/job_timeout with values from the
> last GT that was saved, tripping the "not restored!" abort. It also
> overflows the array whenever a GT exposes more than MAX_GTS engines.
> 

Do you have any GitLab work items this patch fixes? If yes please
add here Closes: tags.

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  tests/intel/xe_sysfs_scheduler.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/intel/xe_sysfs_scheduler.c b/tests/intel/xe_sysfs_scheduler.c
> index 383625064..cbf25762a 100644
> --- a/tests/intel/xe_sysfs_scheduler.c
> +++ b/tests/intel/xe_sysfs_scheduler.c
> @@ -237,7 +237,7 @@ int igt_main()
>  				      {"job_timeout_ms", "job_timeout_min", "job_timeout_max"},
>  	};
>  
> -	unsigned int store[MAX_GTS][3][3];
> +	unsigned int store[MAX_GTS][XE_MAX_ENGINE_INSTANCE][3][3];
>  	int count = sizeof(property) / sizeof(property[0]);
>  	int gt_count = 0;
>  	int xe = -1;
> @@ -271,7 +271,7 @@ int igt_main()
>  					const char **pl = property[j];
>  
>  					for (int k = 0; k < 3; k++) {
> -						unsigned int *loc = &store[i][j][k];
> +						unsigned int *loc = &store[gt_count][i][j][k];
>  
>  						igt_require(igt_sysfs_scanf(list[i], pl[k],
>  									    "%u", loc) == 1);
> @@ -314,7 +314,7 @@ int igt_main()
>  
>  					for (int k = 2; k >= 0; k--) {
>  						unsigned int read = UINT_MAX;
> -						unsigned int val = store[i][j][k];
> +						unsigned int val = store[gtn][i][j][k];
>  
>  						igt_sysfs_printf(e, pl[k], "%u", val);
>  						igt_sysfs_scanf(e, pl[k], "%u", &read);
> -- 
> 2.43.0
> 
