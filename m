Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D47C3DA60
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jul 2024 12:18:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F03E910E7E1;
	Thu, 18 Jul 2024 12:18:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ffLf8K+S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A69610E7E1;
 Thu, 18 Jul 2024 12:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721305104; x=1752841104;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7oY7yHlyb06DqNq2s5kNO2EOWQtUKwuKJc2AT3Mip4I=;
 b=ffLf8K+Szaa2pTjMi4iS8mlLYO3b5OST9TjdWVsU+JVt9EiNyEQDbZAy
 A8ItsXr2AZZ7bhEba9mgxsbT3/xpXWTBwd1PuXW7Lw0+5vwwFl5PgzvsW
 AqhaujF9oD8miMgOAbHYUAI2uORIR4v4ruTYhLdzaEgqyCU4cE2ZmtYAC
 q+3bWR2WOywadKbcUbvozPfOZsIJeIIKq5xFaAvASI5pWjjAlANC0bnOQ
 UfqIfix1QqV4u++jJIHqUfaOwVRF2V3PS6uJurtgO70Jqp8vJevH4VCDz
 /UpI19mhlZmE0ytenOEQ6jbnH116iS793vQ/5i76Huh9LKsjM8taEtJt2 A==;
X-CSE-ConnectionGUID: fDHpCa3xQ5K+ZCP07XEWsA==
X-CSE-MsgGUID: JOkPybjISdyOw8+XRpOKYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="12607362"
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; d="scan'208";a="12607362"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 05:18:24 -0700
X-CSE-ConnectionGUID: BXnkpOTARzWuYAU+mLPb9g==
X-CSE-MsgGUID: te/AGoznQROihAb2ui2irQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; d="scan'208";a="50467176"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2024 05:18:23 -0700
Date: Thu, 18 Jul 2024 14:18:20 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLkJBVDogZmFpbHVy?= =?utf-8?Q?e?= for
 tests/gem_ctx_exec: Fix failing preempt timeout updates
Message-ID: <20240718121820.lny3lsa7sjkm52gg@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20240718085912.15434-7-janusz.krzysztofik@linux.intel.com>
 <172129657548.272469.2481043233133080953@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <172129657548.272469.2481043233133080953@2413ebb6fbb6>
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
On 2024-07-18 at 09:56:15 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/gem_ctx_exec: Fix failing preempt timeout updates
> URL   : https://patchwork.freedesktop.org/series/136228/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_15090 -> IGTPW_11425
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11425 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11425, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11425/index.html
> 
> Participating hosts (37 -> 35)
> ------------------------------
> 
>   Missing    (2): fi-snb-2520m fi-bsw-n3050 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11425:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@active:
>     - bat-apl-1:          [PASS][1] -> [DMESG-FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15090/bat-apl-1/igt@i915_selftest@live@active.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11425/bat-apl-1/igt@i915_selftest@live@active.html
> 

This is unrelated.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_11425 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@i915_selftest@live@hangcheck:
>     - bat-mtlp-8:         [PASS][3] -> [DMESG-FAIL][4] ([i915#9500])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15090/bat-mtlp-8/igt@i915_selftest@live@hangcheck.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11425/bat-mtlp-8/igt@i915_selftest@live@hangcheck.html
> 
>   * igt@kms_frontbuffer_tracking@basic:
>     - bat-arls-2:         [PASS][5] -> [DMESG-WARN][6] ([i915#7507])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15090/bat-arls-2/igt@kms_frontbuffer_tracking@basic.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11425/bat-arls-2/igt@kms_frontbuffer_tracking@basic.html
> 
>   
>   [i915#7507]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7507
>   [i915#9500]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9500
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7929 -> IGTPW_11425
> 
>   CI-20190529: 20190529
>   CI_DRM_15090: 66d3fbb024886f8fbbc15fe79222f046cccd18c7 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_11425: eac9ea37cf3260872513fc310dde1efb3c2fdd0f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_7929: 7929
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11425/index.html
