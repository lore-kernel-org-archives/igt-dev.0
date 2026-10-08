Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39922CA6007
	for <igt-dev@archiver.kernel.org>; Thu,  8 Oct 2026 10:14:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB50A10E6DD;
	Thu,  8 Oct 2026 10:14:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eBpNMyxF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 465DC10E6DD
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Oct 2026 10:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791454414; x=1822990414;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=MnCJLBnFqjaYJdJmFNjaVViXlTjKjbeQ1byckdX4ILY=;
 b=eBpNMyxFdXROasJ29BBSfzP8TlNM9n+DdQ0AA/uAwabsr55VEeewd1wq
 QSOtqEW9FsKL51gxTKCGpGIZhDyG4Zeb3FpFA9/8PFcEg3DDyGi+hZlAF
 biaKHmCyiPwl4MXSemf1q88Ul3p3VuZuO7RGJc/BZlnKf9eckbCXhNCfL
 NB6OtqU9HTAKqJwa/oougY+XaBDrb+qn3hCAcOmg6kKw2XYv/IRostINf
 fcoD1QqQwY5DZdz2K9pdd4XrfT7JOlhKeup3mMd1Ajh6rrF8oSsgBjsvl
 fhx7nVp46iIg7RAs1PNurLaYjIUN7zYNLwR3HCw4HM+DXPeXULfu8xTBZ g==;
X-CSE-ConnectionGUID: CxMkz7LgSM6H8R8Y2rFrDw==
X-CSE-MsgGUID: BKqRiEvlRtGOa8wrCpgqJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="115749"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="115749"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 03:13:34 -0700
X-CSE-ConnectionGUID: 5ruusDppRZKX033IRDlJyg==
X-CSE-MsgGUID: KxER0Ng9RTm/FS8ffsyimA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="326103"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 03:13:33 -0700
Date: Thu, 8 Oct 2026 12:13:30 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbA==?= =?utf-8?Q?=3A?= failure for
 lib/igt_platform_filter: Fix musl build
Message-ID: <20261008101330.cqw4pstxa6nf2xwe@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20261007160847.169029-1-kamil.konieczny@linux.intel.com>
 <179141575834.250358.1832252648841613666@61270ab9df2a>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <179141575834.250358.1832252648841613666@61270ab9df2a>
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
On 2026-10-07 at 23:29:18 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/igt_platform_filter: Fix musl build
> URL   : https://patchwork.freedesktop.org/series/175702/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_9133_full -> IGTPW_15954_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_15954_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_15954_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15954/index.html
> 
> Participating hosts (10 -> 10)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_15954_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1:
>     - shard-glk10:        NOTRUN -> [INCOMPLETE][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15954/shard-glk10/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1.html
> 
>   * igt@perf_pmu@busy-double-start:
>     - shard-rkl:          [PASS][2] -> [FAIL][3] +1 other test fail
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9133/shard-rkl-8/igt@perf_pmu@busy-double-start.html
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15954/shard-rkl-3/igt@perf_pmu@busy-double-start.html
> 

Unrelated.


Regards,
Kamil

>   
> New tests
> ---------
> 
>   New tests have been introduced between IGT_9133_full and IGTPW_15954_full:
> 
> ### New IGT tests (9) ###
> 
>   * igt@gem_pxp@2x-modeset-vs-vblank-race:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_pxp@bad-rotation-90-4-tiled-bmg-ccs:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_pxp@dirty-create:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_pxp@fbchdr-1p-primscrn-cur-indfb-draw-mmap-wc:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_pxp@load:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_pxp@single-move:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_pxp@system-suspend-modeset:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_pxp@universal-setplane-primary:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_pxp@yf-tiled-8bpp-rotate-180:
>     - Statuses :
>     - Exec time: [None] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_15954_full that come from known issues:
> 
> ### IGT changes ###
[cut]
