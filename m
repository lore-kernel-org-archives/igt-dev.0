Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C48A6E7716C
	for <igt-dev@archiver.kernel.org>; Thu,  5 Dec 2024 14:10:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 838AE10E124;
	Thu,  5 Dec 2024 14:10:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JQy6e7Ow";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F40C10E124
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Dec 2024 14:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733407822; x=1764943822;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Db0XjfB46OSGV2Nxu1ArXa2egpeZSCXaBFeGLx5uWbw=;
 b=JQy6e7OwMSWX5oan1ZI7FNwSgYT9u7n9Jj3MEMex2zaqs1W4N0WQqx41
 weq/WVgW7WPbIqQz+Gs4ofVGHkqlFCOWSmGFVxC61R/LWuN3Gryp9rnsu
 s0YbWDvsOdq1nHVwtJJkvMoZ2/qRO62Ag82wQvVgudIq/eqVIssjXooTy
 MMCF5nhEnEIiXFw2902wWs5X3opHj4NvJ1KK7dV3hhPJgpGnQm0N9q4ak
 8rkv44hLyAItfl1t0BGeTGBxZJYJ9E0h9XxrYztyE0Ba5eNdwu/OgF7Kb
 159ciI0ZbvV/c146Qvs+L3+9ZeN92LjcQXGlmjO0hFwFlcu9g+ig6nAFn A==;
X-CSE-ConnectionGUID: YDumBzl2Sk+l0SSjKAln/w==
X-CSE-MsgGUID: 04Jw8YUZThWeHqwPJ55eNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="36560404"
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="36560404"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 06:10:21 -0800
X-CSE-ConnectionGUID: HbEGoY03ScKhu4snEUf0VQ==
X-CSE-MsgGUID: cJu/+pA6Rxa5N+WHlr/PUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="94180632"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 06:10:20 -0800
Date: Thu, 5 Dec 2024 15:10:07 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Pravalika Gurram <pravalika.gurram@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v2] tests/intel: Don't abort the test on the
 unavailability of sysnode
Message-ID: <20241205141007.m5of5iwr3mh3ceqf@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Pravalika Gurram <pravalika.gurram@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20241205074609.538879-1-pravalika.gurram@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241205074609.538879-1-pravalika.gurram@intel.com>
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
On 2024-12-05 at 13:16:09 +0530, Pravalika Gurram wrote:

few nits left, first about subject, add test name to it
and also make it shorter, for example:

[PATCH i-g-t v2] tests/intel/perf_pmu: Skip frequency test on older platforms

> Use calloc to have zeros for sysnodes not present.
> it will restore the zeros instead of garbage.
> test should not be abort on the unavailability of sysnode.

Drop above description and write something like:

On a few old platforms like BLB, ELK, ILK or PNV the following
sysfs node "rps_min_freq_mhz" is not present which cause
frequency test to abort. Make it skip those cases.

> 

Add here:

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12728
> Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>

Regards,
Kamil

> ---
>  tests/intel/perf_pmu.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/tests/intel/perf_pmu.c b/tests/intel/perf_pmu.c
> index bfa2d501a..5d0467c02 100644
> --- a/tests/intel/perf_pmu.c
> +++ b/tests/intel/perf_pmu.c
> @@ -1786,7 +1786,7 @@ test_frequency_idle(int gem_fd, unsigned int gt)
>  	sysfs = igt_sysfs_gt_open(gem_fd, gt);
>  	igt_require(sysfs >= 0);
>  
> -	min_freq = igt_sysfs_get_u32(sysfs, "rps_RPn_freq_mhz");
> +	igt_require(__igt_sysfs_get_u32(sysfs, "rps_RPn_freq_mhz", &min_freq));
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
