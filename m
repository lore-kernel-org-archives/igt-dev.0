Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A70A8D0EE12
	for <igt-dev@archiver.kernel.org>; Fri, 11 Oct 2024 16:36:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D1CC10EB49;
	Fri, 11 Oct 2024 16:36:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RcuwcN//";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB7E810EB49
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Oct 2024 16:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728664594; x=1760200594;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0zfySWA2T59O6pNyY7u56vRp6B6Jc3tkPSozUrM9boY=;
 b=RcuwcN//yja+t95j7IkaV6Jkj4uy0BVyfajEtA1OYsFv9a1XkQ0mONHt
 inlnmaiDP9/ApTs3Z2sZZjaxJmoxtopA03Kh4ql5yLeZsNwKw51X4ttPA
 iHgWmp8TlUCWpWfQ2qSyGpOl9vygd8/1I6TOprbuFR9O2NanUY1aJSIAK
 a7q0ujHtrkwIAlUS9ujV3EZxg2qphLTjQcwhziEOLET5epS8q5tdv0Epx
 1WaBACPcYi40keChD9V+Lu/HvByF3/z6+tl5xAyfiu6TBb5FsVohUbHYV
 QKj1kiLwotMo7E4hoqfsd9Dj+EaWyF53fvk2yVUYLQhrqs0FLuK91I6YA A==;
X-CSE-ConnectionGUID: jpV+rRquQJS8x6bwi/6EBw==
X-CSE-MsgGUID: h+q6oBsVSSu1DF57uRkQjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="27941358"
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; d="scan'208";a="27941358"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 09:36:34 -0700
X-CSE-ConnectionGUID: r9C9fbmaRwGvrgZsXTBBCg==
X-CSE-MsgGUID: brkUQA3qQyWRggTUOxFrQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; d="scan'208";a="77057568"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 09:36:33 -0700
Date: Fri, 11 Oct 2024 18:36:31 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t 1/3] tests/intel/xe_query: Stop getting refclock
 multiple times
Message-ID: <20241011163631.smytsyqozw5v2dat@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20241011030507.321961-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241011030507.321961-1-lucas.demarchi@intel.com>
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

Hi Lucas,
On 2024-10-10 at 22:05:05 -0500, Lucas De Marchi wrote:
> In theory it could be different per hwe (but in practice isn't). In any
> case, it shouldn't change on multiple invocations of the query. So stop
> doing it twice per loop.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel/xe_query.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
> index 4c79a02b0..9e0fa93dd 100644
> --- a/tests/intel/xe_query.c
> +++ b/tests/intel/xe_query.c
> @@ -713,7 +713,7 @@ __engine_cycles(int fd, struct drm_xe_engine_class_instance *hwe)
>  	int i, usable = 0;
>  	igt_spin_t *spin;
>  	uint64_t ahnd;
> -	uint32_t vm, eng_ref_clock1, eng_ref_clock2;
> +	uint32_t vm, eng_ref_clock;
>  	struct {
>  		int32_t id;
>  		const char *name;
> @@ -746,31 +746,31 @@ __engine_cycles(int fd, struct drm_xe_engine_class_instance *hwe)
>  		ts2.clockid = clock[index].id;
>  
>  		query_engine_cycles(fd, &ts1);
> -		eng_ref_clock1 = __engine_reference_clock(fd, hwe->gt_id);
>  		query_engine_cycles(fd, &ts2);
> -		eng_ref_clock2 = __engine_reference_clock(fd, hwe->gt_id);
> +		eng_ref_clock = __engine_reference_clock(fd, hwe->gt_id);
>  
>  		igt_debug("[1] cpu_ts before %llu, reg read time %llu\n",
>  			  ts1.cpu_timestamp,
>  			  ts1.cpu_delta);
> -		igt_debug("[1] engine_ts %llu, freq %u Hz, width %u\n",
> -			  ts1.engine_cycles, eng_ref_clock1, ts1.width);
> +		igt_debug("[1] engine_ts %llu, width %u\n",
> +			  ts1.engine_cycles, ts1.width);
>  
>  		igt_debug("[2] cpu_ts before %llu, reg read time %llu\n",
>  			  ts2.cpu_timestamp,
>  			  ts2.cpu_delta);
> -		igt_debug("[2] engine_ts %llu, freq %u Hz, width %u\n",
> -			  ts2.engine_cycles, eng_ref_clock2, ts2.width);
> +		igt_debug("[2] engine_ts %llu, width %u\n",
> +			  ts2.engine_cycles, ts2.width);
>  
>  		delta_cpu = ts2.cpu_timestamp - ts1.cpu_timestamp;
>  
>  		if (ts2.engine_cycles >= ts1.engine_cycles)
>  			delta_cs = (ts2.engine_cycles - ts1.engine_cycles) *
> -				   NSEC_PER_SEC / eng_ref_clock1;
> +				   NSEC_PER_SEC / eng_ref_clock;
>  		else
>  			delta_cs = (((1 << ts2.width) - ts2.engine_cycles) + ts1.engine_cycles) *
> -				   NSEC_PER_SEC / eng_ref_clock1;
> +				   NSEC_PER_SEC / eng_ref_clock;
>  
> +		igt_debug("freq %u Hz\n", eng_ref_clock);
>  		igt_debug("delta_cpu[%"PRIu64"], delta_cs[%"PRIu64"]\n",
>  			  delta_cpu, delta_cs);
>  
> -- 
> 2.46.2
> 
