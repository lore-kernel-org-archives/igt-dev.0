Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC3A8CD1296
	for <igt-dev@archiver.kernel.org>; Wed, 10 Apr 2024 08:42:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FA2210E3CF;
	Wed, 10 Apr 2024 08:42:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bEOTUlid";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E16E010E9A4
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Apr 2024 08:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712738564; x=1744274564;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=f+e3T9/tltvK3UkyijBhtQtDWRrYjn5QG1CO8BZKYxc=;
 b=bEOTUlidESJeide1CwhhQqEP0kloPOmnsowH5pAPyeNdJ1k2zfB837bZ
 BjZ4ENGjH1kdrCwbt59AyDTeIUJW/rHHjDCYVO1kmpSXtA2nNYk8uipRF
 S6RiFai0VRmja6n/n3FsI2unV2/mV4zJONRPA7cj5402Qo0pvKs4SI4Yg
 8ingDc2H4RCg9qi86pQvjFy6AxULb6iqSlTeXVNxhf/+dLzfIvvFElBb/
 B+KUlmKAJKNSQjYbW4/GvEY1il2DG55dNdgXPk7aLkspt5tVcXU04biEx
 m3Oo5L42sndBWcfZt9eWaBPqwACKeD44CeqwcVeejIEBCqXmSAqHEBZE9 w==;
X-CSE-ConnectionGUID: dBZLI57MSu2l+kZHecBImw==
X-CSE-MsgGUID: FOmuopMBR1ib6tAuIsaMUg==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="7944627"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="7944627"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 01:42:40 -0700
X-CSE-ConnectionGUID: K67cWEmDSE2NBgEhSAe1IA==
X-CSE-MsgGUID: I6tGzJxKShGmrndqGea61Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="43734403"
Received: from unknown (HELO [10.245.245.250]) ([10.245.245.250])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 01:42:39 -0700
Message-ID: <165db5d9-b43a-45dc-bb66-4fc6436fb648@intel.com>
Date: Wed, 10 Apr 2024 09:42:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tests/intel/xe_vm: Always have at least 2 pages bound
 in hammer sections
To: Matthew Brost <matthew.brost@intel.com>, igt-dev@lists.freedesktop.org
References: <20240410012148.409170-1-matthew.brost@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240410012148.409170-1-matthew.brost@intel.com>
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

On 10/04/2024 02:21, Matthew Brost wrote:
> If the prefetch buffer is 2k or larger the hammer sections will prefetch
> the next page, if the page is unbound a fault will occur. Account for
> larger prefetchs by always having at least 2 pages bound for the hammer
> thread.

Is this referring to bb_start pre-fetch? It should be + 4K at most for 
xe2. Is it possible to make the test consider xe_cs_prefetch_size() 
somehow instead of hardcoding? Or perhaps that is tricky here? Otherwise 
maybe we can add an assert that xe_cs_prefetch_size() remains <= 4K for 
this test, with comment explaining what needs to change if we start 
triggering the assert? Thinking is that would be easier to debug and fix 
than seeing CAT errors, faults etc. if the pre-fetch changes again.

> 
> v2:
>   - Missed table entry
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   tests/intel/xe_vm.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> index bd4973cc38..9f9f61b7ef 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -1843,12 +1843,12 @@ igt_main
>   		{ "all", 4, 2, 0, 4, 0 },
>   		{ "one-partial", 4, 1, 1, 2, 0 },
>   		{ "either-side-partial", 4, 2, 1, 2, 0 },
> -		{ "either-side-partial-hammer", 4, 2, 1, 2,
> +		{ "either-side-partial-hammer", 6, 2, 2, 2,
>   			MAP_FLAG_HAMMER_FIRST_PAGE },
> -		{ "either-side-partial-split-page-hammer", 4, 2, 1, 2,
> +		{ "either-side-partial-split-page-hammer", 6, 2, 2, 2,
>   			MAP_FLAG_HAMMER_FIRST_PAGE |
>   			MAP_FLAG_LARGE_PAGE },
> -		{ "either-side-partial-large-page-hammer", 4, 2, 1, 2,
> +		{ "either-side-partial-large-page-hammer", 6, 2, 2, 2,
>   			MAP_FLAG_HAMMER_FIRST_PAGE |
>   			MAP_FLAG_LARGE_PAGE |
>   			MAP_FLAG_LARGE_PAGE_NO_SPLIT },
> @@ -1857,7 +1857,7 @@ igt_main
>   		{ "front", 4, 2, 1, 3, 0 },
>   		{ "many-all", 4 * 8, 2 * 8, 0 * 8, 4 * 8, 0 },
>   		{ "many-either-side-partial", 4 * 8, 2 * 8, 1, 4 * 8 - 2, 0 },
> -		{ "many-either-side-partial-hammer", 4 * 8, 2 * 8, 1, 4 * 8 - 2,
> +		{ "many-either-side-partial-hammer", 4 * 8, 2 * 8, 2, 4 * 8 - 4,
>   			MAP_FLAG_HAMMER_FIRST_PAGE },
>   		{ "many-either-side-full", 4 * 8, 4 * 8, 1 * 8, 2 * 8, 0 },
>   		{ "many-end", 4 * 8, 4, 0 * 8, 3 * 8 + 2, 0 },
> @@ -1902,12 +1902,12 @@ igt_main
>   		{ "one-partial", 4, 1, 1, 2, 0 },
>   		{ "either-side-partial", 4, 2, 1, 2, 0 },
>   		{ "either-side-full", 4, 4, 1, 2, 0 },
> -		{ "either-side-partial-hammer", 4, 2, 1, 2,
> +		{ "either-side-partial-hammer", 6, 2, 2, 2,
>   			MAP_FLAG_HAMMER_FIRST_PAGE },
> -		{ "either-side-partial-split-page-hammer", 4, 2, 1, 2,
> +		{ "either-side-partial-split-page-hammer", 6, 2, 2, 2,
>   			MAP_FLAG_HAMMER_FIRST_PAGE |
>   			MAP_FLAG_LARGE_PAGE },
> -		{ "either-side-partial-large-page-hammer", 4, 2, 1, 2,
> +		{ "either-side-partial-large-page-hammer", 6, 2, 2, 2,
>   			MAP_FLAG_HAMMER_FIRST_PAGE |
>   			MAP_FLAG_LARGE_PAGE |
>   			MAP_FLAG_LARGE_PAGE_NO_SPLIT },
> @@ -1915,7 +1915,7 @@ igt_main
>   		{ "front", 4, 2, 1, 3, 0 },
>   		{ "many-all", 4 * 8, 2 * 8, 0 * 8, 4 * 8, 0 },
>   		{ "many-either-side-partial", 4 * 8, 2 * 8, 1, 4 * 8 - 2, 0 },
> -		{ "many-either-side-partial-hammer", 4 * 8, 2 * 8, 1, 4 * 8 - 2,
> +		{ "many-either-side-partial-hammer", 4 * 8, 2 * 8, 2, 4 * 8 - 4,
>   			MAP_FLAG_HAMMER_FIRST_PAGE },
>   		{ "userptr-all", 4, 2, 0, 4, MAP_FLAG_USERPTR },
>   		{ "userptr-one-partial", 4, 1, 1, 2, MAP_FLAG_USERPTR },
