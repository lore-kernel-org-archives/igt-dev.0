Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D974EE7719C
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jan 2025 21:08:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F60610E37B;
	Thu,  9 Jan 2025 21:08:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WOpnMNa6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C580F10E10B;
 Thu,  9 Jan 2025 21:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736456887; x=1767992887;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=vZPfmtnDFyNMVIYbantdKGXgtLpSHECIx1oC7o/SEAE=;
 b=WOpnMNa6hjfLfJgpCjYdOUDTFhWVrxLo854v5fska2sqYFKds7HSGz8L
 1uA2MWt1I+JrgMygvn4R8Bb3Ogd7KzPvp4uYNtymzsNnxoKHrP4k+5tQt
 9ns71gAMVJnirsS8ulwEh9rgal+0VghCPdJfS7U8uMYcl1fTkLaATl7n2
 pnLGwOmzQpmZjiFmtmcNLtmim7JPXTJyobt0PCO7wLrNJlUWx38uSNKAd
 dhIt7ts2CvVtZekuTR1v+ydSgKlG7W84II4XySztXG9PcgB0bI1zfO8m7
 bj6JrtXBQHQJoOXn/vxyzbWu4451K93Y6ks7r9IbJVl0e4UsJZLLf/wcm w==;
X-CSE-ConnectionGUID: OWj8h0ZqTHC3bSdgohqXBw==
X-CSE-MsgGUID: hK/rzy/rQGCjvo77m6H4WA==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="48153464"
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; d="scan'208";a="48153464"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 13:08:07 -0800
X-CSE-ConnectionGUID: JUhnz9uBQ6O8dOui2PG4Dw==
X-CSE-MsgGUID: n46460w2TDWTxpv9uaDKKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="107564520"
Received: from sjoudeh-mobl.ger.corp.intel.com (HELO [10.245.83.54])
 ([10.245.83.54])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 13:08:06 -0800
Message-ID: <ad4db798-13a4-4dae-b904-ab4ab682eb8a@linux.intel.com>
Date: Thu, 9 Jan 2025 22:08:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBpOTE1LkNJLkJBVDogZmFpbHVyZSBmb3IgbGliL2lndF9r?=
 =?UTF-8?Q?memleak=3A_library_to_interact_with_kmemleak_=28rev2=29?=
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250109181027.90402-1-peter.senna@linux.intel.com>
 <173645503540.1723339.14281937234503972914@b555e5b46a47>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <173645503540.1723339.14281937234503972914@b555e5b46a47>
Content-Type: text/plain; charset=UTF-8
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

Dear I915,

On 09.01.2025 21:37, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/igt_kmemleak: library to interact with kmemleak (rev2)
> URL   : https://patchwork.freedesktop.org/series/142673/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8184 -> IGTPW_12421
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_12421 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12421, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12421/index.html
> 
> Participating hosts (38 -> 37)
> ------------------------------
> 
>   Missing    (1): fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12421:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@gt_mocs:
>     - bat-adlp-11:        [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8184/bat-adlp-11/igt@i915_selftest@live@gt_mocs.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12421/bat-adlp-11/igt@i915_selftest@live@gt_mocs.html
> 
This is unrelated to my change. Please fix and re-run.

Thank you!

[...]
