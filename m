Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2446CD1284
	for <igt-dev@archiver.kernel.org>; Tue,  9 Apr 2024 08:57:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ADA2112BCE;
	Tue,  9 Apr 2024 08:57:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CKDX+VjS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13F0E112BCE
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Apr 2024 08:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712653026; x=1744189026;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=q8EDttFwAZsTpZy78QmcRJNdC4Niu5h1cgvZwY6lk44=;
 b=CKDX+VjSY7fM9fk1SUvpGWWNp77BG7o915Kb/VVaOmHOamNOIPujmEca
 ZAgZerhJMFsXxE+0t8qeRFgGazWPF8HcfjDZCZdEuaoPhBdVSmYHBv20u
 293FXNw8rdi5osGh0a+YlkeZcso9+ybBK7xdnHjY7E6b8CN2Yo9aqYaTd
 aRp7n/fN6YJGHmrYEoKLAaEJlcOHyIGAmBS/VP/7WE0S2k1Fc9VveyNjy
 uL7BXjk5LIR8HR/ULPp33W8GrHBoHCTnAMsaLWtq/b+NBuFyByDYuPyKq
 BH5SnB+26QOcDC3l/OQL605uirb6KX3KQf8m5tKGsyamiU2J8Lax8UcXn w==;
X-CSE-ConnectionGUID: tz0W2yxVSgKaAhi7TiBXJw==
X-CSE-MsgGUID: +qlWIHMqTEKFP9LDnSg4XQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="33364835"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; d="scan'208";a="33364835"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 01:57:03 -0700
X-CSE-ConnectionGUID: xILWOvcgT96mTn07BH9xVQ==
X-CSE-MsgGUID: U85+0R+HQ6SrGREqJB2Cqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; d="scan'208";a="24941926"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 01:56:59 -0700
Date: Tue, 9 Apr 2024 10:56:41 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVDogZmFpbHVy?= =?utf-8?Q?e?= for
 tests/intel/xe_compute_preempt: Run it on only CCS engine
Message-ID: <20240409085641.yrpoekds4od4rrk7@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>
References: <20240404102901.18803-1-nirmoy.das@intel.com>
 <171231628840.1228986.10698426581519506355@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171231628840.1228986.10698426581519506355@8e613ede5ea5>
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

Hi igt-dev,
On 2024-04-05 at 11:24:48 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/xe_compute_preempt: Run it on only CCS engine
> URL   : https://patchwork.freedesktop.org/series/132026/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14523_full -> IGTPW_10976_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10976_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10976_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10976/index.html
> 
> Participating hosts (9 -> 9)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10976_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@api_intel_allocator@two-level-inception-interruptible:
>     - shard-dg1:          [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14523/shard-dg1-13/igt@api_intel_allocator@two-level-inception-interruptible.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10976/shard-dg1-14/igt@api_intel_allocator@two-level-inception-interruptible.html
> 

This is unrelated to Xe test, no need for respin.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_10976_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@object-reloc-keep-cache:
>     - shard-rkl:          NOTRUN -> [SKIP][3] ([i915#8411]) +2 other tests skip
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10976/shard-rkl-1/igt@api_intel_bb@object-reloc-keep-cache.html
>     - shard-dg1:          NOTRUN -> [SKIP][4] ([i915#8411])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10976/shard-dg1-17/igt@api_intel_bb@object-reloc-keep-cache.html
>     - shard-mtlp:         NOTRUN -> [SKIP][5] ([i915#8411])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10976/shard-mtlp-8/igt@api_intel_bb@object-reloc-keep-cache.html
>     - shard-dg2:          NOTRUN -> [SKIP][6] ([i915#8411])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10976/shard-dg2-10/igt@api_intel_bb@object-reloc-keep-cache.html
> 
>   * igt@device_reset@cold-reset-bound:
>     - shard-dg1:          NOTRUN -> [SKIP][7] ([i915#7701])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10976/shard-dg1-16/igt@device_reset@cold-reset-bound.html
> 
>   * igt@drm_fdinfo@idle@rcs0:
>     - shard-rkl:          NOTRUN -> [FAIL][8] ([i915#7742])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10976/shard-rkl-3/igt@drm_fdinfo@idle@rcs0.html

...cut...

> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10976/index.html
