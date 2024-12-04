Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2503E7716E
	for <igt-dev@archiver.kernel.org>; Wed,  4 Dec 2024 14:50:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F31710E0A9;
	Wed,  4 Dec 2024 14:50:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZqB8iVUd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DC3510E0A9
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Dec 2024 14:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733323801; x=1764859801;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=BbMwef52wYmAy5I6nlq2SX5rNpVoDartX5QYum1JuaM=;
 b=ZqB8iVUd448tuW7HiThdyKe5w4dPALdaBtYLOibJn382O8D5tDJrYGQk
 awIa2LfOHlTzktYmOOc8nnbjqcdLHahALdGblm01R8MDQXeBrik7gLrIq
 GefhJylpyX9hDylnEaumWpJLgL0jRBcIPycuJiLPUBbzOkkph60XDYIKz
 2ZTQWtEz7DQ5XXYKpNMupzADZ/1E0H2Hiwj/TMYiTi7vitHvpEXPwma9u
 onJfQq6RYYuDd9/QtJ8A0/VyjNe+3o0XxWB/xf6BSXRxeWwym/b5KFYxf
 2toUG44NOI6s7Lv1cIyAlLDmn5OGJOvY/KSgCqPQrYazPalnIrEC7gavn Q==;
X-CSE-ConnectionGUID: RSEFwyfpTHiPJC3FmpTOag==
X-CSE-MsgGUID: gLkumSPoRo++isKrP2R0YA==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33841004"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="33841004"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 06:50:00 -0800
X-CSE-ConnectionGUID: B1sy6h7CQ7qCJQdwUnF/hg==
X-CSE-MsgGUID: wYRac+RHSyq89KLbqdI9sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="98210150"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 06:49:59 -0800
Date: Wed, 4 Dec 2024 15:49:42 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Pravalika Gurram <pravalika.gurram@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] tests/intel: Don't abort the test on the
 unavailability of sysnode
Message-ID: <20241204144942.65qaoh6s7xezmrhl@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Pravalika Gurram <pravalika.gurram@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20241203140626.514454-1-pravalika.gurram@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241203140626.514454-1-pravalika.gurram@intel.com>
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

Hi Pravalika,
On 2024-12-03 at 19:36:26 +0530, Pravalika Gurram wrote:
> use calloc to assign NULL value in false case, because in restore case
> it will restore the NULL value instead of garbage.
> test should not be abort/skip on the unavailability of sysnode
> 
> Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
> ---
>  tests/intel/perf_pmu.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/tests/intel/perf_pmu.c b/tests/intel/perf_pmu.c
> index bfa2d501a..87ddfe1a9 100644
> --- a/tests/intel/perf_pmu.c
> +++ b/tests/intel/perf_pmu.c
> @@ -1786,7 +1786,7 @@ test_frequency_idle(int gem_fd, unsigned int gt)
>  	sysfs = igt_sysfs_gt_open(gem_fd, gt);
>  	igt_require(sysfs >= 0);
>  
> -	min_freq = igt_sysfs_get_u32(sysfs, "rps_RPn_freq_mhz");
> +	__igt_sysfs_get_u32(sysfs, "rps_RPn_freq_mhz", &min_freq);

imho here you need igt_require(...)

Rest looks ok as I assume that when reading fails, setting also
will fail and that will be catched in appropriate igt_require()
in subtest beginning.

Regards,
Kamil

>  	close(sysfs);
>  
>  	/* While parked, our convention is to report the GPU at 0Hz */
> @@ -2403,23 +2403,23 @@ static void save_sysfs_freq(int i915)
>  
>  	num_gts = igt_sysfs_get_num_gt(i915);
>  
> -	stash_min = (uint32_t *)malloc(sizeof(uint32_t) * num_gts);
> -	stash_max = (uint32_t *)malloc(sizeof(uint32_t) * num_gts);
> -	stash_boost = (uint32_t *)malloc(sizeof(uint32_t) * num_gts);
> +	stash_min = (uint32_t *)calloc(num_gts, sizeof(uint32_t) * num_gts);
> +	stash_max = (uint32_t *)calloc(num_gts, sizeof(uint32_t) * num_gts);
> +	stash_boost = (uint32_t *)calloc(num_gts, sizeof(uint32_t) * num_gts);
>  
>  	/* Save boost, min and max across GTs */
>  	i915_for_each_gt(i915, tmp, gt) {
>  		sysfs = igt_sysfs_gt_open(i915, gt);
>  		igt_require(sysfs >= 0);
>  
> -		stash_min[gt] = igt_sysfs_get_u32(sysfs, "rps_min_freq_mhz");
> -		stash_max[gt] = igt_sysfs_get_u32(sysfs, "rps_max_freq_mhz");
> -		stash_boost[gt] = igt_sysfs_get_u32(sysfs, "rps_boost_freq_mhz");
> +		__igt_sysfs_get_u32(sysfs, "rps_min_freq_mhz", &stash_min[gt]);
> +		__igt_sysfs_get_u32(sysfs, "rps_max_freq_mhz", &stash_max[gt]);
> +		__igt_sysfs_get_u32(sysfs, "rps_boost_freq_mhz", &stash_boost[gt]);
>  		igt_debug("GT: %d, min: %d, max: %d, boost:%d\n",
>  			  gt, stash_min[gt], stash_max[gt], stash_boost[gt]);
>  
> -		rpn_freq = igt_sysfs_get_u32(sysfs, "rps_RPn_freq_mhz");
> -		rp0_freq = igt_sysfs_get_u32(sysfs, "rps_RP0_freq_mhz");
> +		__igt_sysfs_get_u32(sysfs, "rps_RPn_freq_mhz", &rpn_freq);
> +		__igt_sysfs_get_u32(sysfs, "rps_RP0_freq_mhz", &rp0_freq);
>  
>  		/* Set pre-conditions, in case frequencies are in non-default state */
>  		igt_require(__igt_sysfs_set_u32(sysfs, "rps_max_freq_mhz", rp0_freq));
> -- 
> 2.34.1
> 
