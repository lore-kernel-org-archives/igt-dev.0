Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CD0AE8FDB1
	for <igt-dev@archiver.kernel.org>; Mon, 29 Dec 2025 10:51:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E509010E3CE;
	Mon, 29 Dec 2025 10:51:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EJLmGP9x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D9E410E3CD;
 Mon, 29 Dec 2025 10:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767005517; x=1798541517;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vcm5PaEe6rAuuWIV6nbysguKu4XqnqB10+o94NFPdMk=;
 b=EJLmGP9xwTJgAf1PIWjRAceauA3jIM+nKVReVlbW+2LHqGvVt+AxS/i6
 kdDcDKcm7E48Q98kQHVZUvpoCpHLsvAE6s/UF42lWplgW+MtfEsGfY/B9
 fCQ8/POMMgFGfvvAdyOzJRxNgSTwdiLlWucyJDJcTYHiP+MwbiKhIEQvH
 xSWIALi+xrVR1AjHQFHt17cDAv8QJeKXeglCtFyBKRJTPwJvqwGZwRmdS
 pwKq85V/FskJg22LfiPDUN4i6diAClCYyvT0qAQ0oiZWMTwsst1HR6hO9
 3P1JASns2R5q8CFl7X55hMTKs/oXO9mg4yiPfzyTW89YhoEc3cTip4fZf Q==;
X-CSE-ConnectionGUID: ymKfmIhJQZSaDaQ/XDkCJA==
X-CSE-MsgGUID: lAg2Z9NETXaz1oL/p7Romw==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="68590863"
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; d="scan'208";a="68590863"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Dec 2025 02:51:57 -0800
X-CSE-ConnectionGUID: x8GV+oEsQ5SA8AFhHht3AA==
X-CSE-MsgGUID: G0XdHZKpQgaavW56MMxEeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; d="scan'208";a="201814834"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.152])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Dec 2025 02:51:56 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: I915-ci-infra@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Subject: Re: =?UTF-8?B?4pyX?= i915.CI.Full: failure for
 tests/intel/gem_lmem_swapping:
 Avoid false failures from oom-killer (rev3)
Date: Mon, 29 Dec 2025 11:51:53 +0100
Message-ID: <12806311.O9o76ZdvQC@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <176657608912.116264.9171844662520960439@a3b018990fe9>
References: <20251219100218.334117-2-janusz.krzysztofik@linux.intel.com>
 <176657608912.116264.9171844662520960439@a3b018990fe9>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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

Hi I915-ci-infra@lists.freedesktop.org,

On Wednesday, 24 December 2025 12:34:49 CET Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/gem_lmem_swapping: Avoid false failures from oom-killer 
(rev3)
> URL   : https://patchwork.freedesktop.org/series/159160/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_17732_full -> IGTPW_14265_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_14265_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_14265_full, please notify your bug team (I915-ci-
infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in 
CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14265/
index.html
> 
> Participating hosts (9 -> 9)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in 
IGTPW_14265_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@perf_pmu@all-busy-idle-check-all:
>     - shard-dg2:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17732/shard-dg2-8/
igt@perf_pmu@all-busy-idle-check-all.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14265/shard-dg2-4/
igt@perf_pmu@all-busy-idle-check-all.html

The change under this pre-merge testing can only affect gem_lmem_swapping 
test, not others, then the above is not related.  Please update filters and 
re-report.

Thanks,
Janusz

> 
>   
> New tests
> ---------
...


