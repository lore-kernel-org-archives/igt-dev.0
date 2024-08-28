Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABE35C5B548
	for <igt-dev@archiver.kernel.org>; Wed, 28 Aug 2024 14:44:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 526C110E558;
	Wed, 28 Aug 2024 14:44:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fZnTv4xJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FD1410E551
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Aug 2024 14:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724856253; x=1756392253;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=BopIKooM8r8IiAPF0lvVn/+QLLC/zkoF3AFb11rzb8c=;
 b=fZnTv4xJ++EybnFV4bMRVyXkac7ZOmoR8cdUKegS9Ne/GaQxbL0d37K0
 sSTQIXttMZmqSj74oXtDsUD7bxeWLHafdaPZ3Irp2eiSjTA5N+8Z2hUOn
 BLu4xLv4XSnv/8plftYl3X6jl6RZ1bIDId5IYyIirhh8Fb2VsdhlgCFwK
 aK+swa5rYfXNbOi+G8JGwuLGkBBT+4Qg228xwYAUSvfLm/E7dzZrJWHY+
 NbFlrtgWXzi+RqzSEnIriBOrnn0UT8Jqy8LsFiPsli+2OeBn8ZejSELZM
 1SMexbhWqshe6CD1tfaN4AOA7kI5zH1Ydky10UpDDIoySvB0mSyw1vEEp A==;
X-CSE-ConnectionGUID: SS2pdtMGT86iVNRfPLuJ5g==
X-CSE-MsgGUID: 8C2uR6iVS4aLi4C188jydg==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="27156291"
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="27156291"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 07:44:12 -0700
X-CSE-ConnectionGUID: CAs9/OT3SZePVtjGt5Ysdg==
X-CSE-MsgGUID: KUMek36pQluN80J4acmNUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="63308504"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.192.103])
 ([10.245.192.103])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 07:44:11 -0700
Message-ID: <6782e176-4a04-4f98-85be-871fc3967a33@linux.intel.com>
Date: Wed, 28 Aug 2024 16:44:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 01/10] tests/intel/xe_drm_fdinfo: Extend mercy to
 the upper end
To: Lucas De Marchi <lucas.demarchi@intel.com>, igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20240827165449.1706784-1-lucas.demarchi@intel.com>
 <20240827165449.1706784-2-lucas.demarchi@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240827165449.1706784-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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


On 8/27/2024 6:54 PM, Lucas De Marchi wrote:
> When we are processing the fdinfo of each client, the gpu time is read
> first, and then later all the exec queues are accumulated. It's thus
> possible that the total gpu time is smaller than the time reported in
> the exec queues. A preemption in the middle of second sample would
> exaggerate the problem:
> 				  total_cycles	      cycles
> 	s1: read exec queues times			*
> 	s1: read gpu time		|		*
> 	.				|		*
> 	.				|		*
> 	.				|		*
> 	-> xe_spin_end()		|		*
> 	s2: read exec queues times	|
> 	s2: read gpu time		|
>
> There's nothing guaranteeing and atomic read between the gpu time and
> exec_queue time in either s1 or s2. Due to the call to xe_spin_end(),
> in which exec_queue tick stops and gpu tick continues, it's much more
> likely delta_total_cycles > cycles. However, if there was any additional
> delay between the readout in s1, it could also go the other way.
>
> In a more realistic situation, as reported in CI:
>
> 	(xe_drm_fdinfo:1072) DEBUG: rcs: sample 1: cycles 29223333, total_cycles 5801623069
> 	(xe_drm_fdinfo:1072) DEBUG: rcs: sample 2: cycles 38974256, total_cycles 5811276365
> 	(xe_drm_fdinfo:1072) DEBUG: rcs: percent: 101.000000
>
> Extend the same mercy to the upper end as we did to the lower end.
> This also matches the tolerance applied on the i915 side in
> tests/intel/drm_fdinfo.c:__assert_within_epsilon().
>
> v2: Fix the commit message since the problem is actually on sample1, not
>      sample2
>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

LGTM thanks for the detailed description.

Reviewed-by: Nirmoy.das@intel.com

> ---
>   tests/intel/xe_drm_fdinfo.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
> index 4696c6495..e3a99a2dc 100644
> --- a/tests/intel/xe_drm_fdinfo.c
> +++ b/tests/intel/xe_drm_fdinfo.c
> @@ -484,7 +484,7 @@ check_results(struct pceu_cycles *s1, struct pceu_cycles *s2,
>   	igt_debug("%s: percent: %f\n", engine_map[class], percent);
>   
>   	if (flags & TEST_BUSY)
> -		igt_assert(percent >= 95 && percent <= 100);
> +		igt_assert(percent >= 95 && percent <= 105);
>   	else
>   		igt_assert(!percent);
>   }
