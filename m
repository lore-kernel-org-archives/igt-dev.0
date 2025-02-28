Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2047C282C1
	for <igt-dev@archiver.kernel.org>; Fri, 28 Feb 2025 15:54:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61D9A10ECE0;
	Fri, 28 Feb 2025 15:54:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="COet3LPB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8416E10ECE0;
 Fri, 28 Feb 2025 15:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740758047; x=1772294047;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=MWJX5G4yMCmpRhOMq+nbJmR7MIwCgVRcmV2tzU/eYSg=;
 b=COet3LPBxPS6PM5DDFQkyJmP10Vg/asoWwWX7qUQjB4fiPg9gOfEwx4c
 ckYI3pb2+9JfhBcSUGhbq4cmxAW3Tf+riZ7KARdA5+5ncUU95YdpXOoGk
 Bp9yPQEHL10g0czdNF23sa8jTSfur6ZcpWjDe4P2C/1sYd6n5fMv+TueS
 mvw3au31INOc/Bv7iwzvXs6oyQstVJiFMniRci2UEmgkr5Y/7NQs+vb93
 Ga4vHOHXWazU1WfOFUqjbjneBsNxUCPnGWYlBdVIDFOv8gV7pfIPzhmZR
 +m56m3mgpieuYP3dETfl4lUx1kQOjQbvl6k+nEGfNOWV8mV27FnkpCz7l A==;
X-CSE-ConnectionGUID: VtzoVgr+THergYRHYAt4og==
X-CSE-MsgGUID: Au41j2ioRd2aCnwq31iQ0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="41818617"
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; d="scan'208";a="41818617"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 07:54:05 -0800
X-CSE-ConnectionGUID: g3pYf1g+TrqlUyo8a0/CtA==
X-CSE-MsgGUID: jl7M/0blS46kvcngm/PNyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="118282898"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 07:54:02 -0800
Date: Fri, 28 Feb 2025 16:53:58 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbA==?= =?utf-8?Q?=3A?= failure for
 runner: Parse results harder
Message-ID: <20250228155358.xrcj3mtaqvvfp45h@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250226193328.132817-1-kamil.konieczny@linux.intel.com>
 <174074036946.3189672.4722311932605274854@b555e5b46a47>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <174074036946.3189672.4722311932605274854@b555e5b46a47>
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
On 2025-02-28 at 10:59:29 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: runner: Parse results harder
> URL   : https://patchwork.freedesktop.org/series/145520/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_16198_full -> IGTPW_12673_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_12673_full absolutely need to be
>   verified manually.

Unrelated to change in igt_runner

Regards,
Kamil

>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12673_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12673/index.html
> 
> Participating hosts (10 -> 9)
> ------------------------------
> 
>   Missing    (1): shard-glk-0 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12673_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_exec_suspend@basic-s4-devices:
>     - shard-glk:          NOTRUN -> [ABORT][1] +1 other test abort
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12673/shard-glk2/igt@gem_exec_suspend@basic-s4-devices.html
> 
>   * igt@gem_mmap_gtt@close-race:
>     - shard-snb:          [PASS][2] -> [INCOMPLETE][3]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16198/shard-snb1/igt@gem_mmap_gtt@close-race.html
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12673/shard-snb1/igt@gem_mmap_gtt@close-race.html
> 
>   * igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-2:
>     - shard-rkl:          [PASS][4] -> [INCOMPLETE][5] +1 other test incomplete
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16198/shard-rkl-1/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-2.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12673/shard-rkl-5/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-2.html
> 
>   * igt@perf_pmu@all-busy-check-all:
>     - shard-dg2-9:        NOTRUN -> [ABORT][6]
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12673/shard-dg2-9/igt@perf_pmu@all-busy-check-all.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_12673_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@object-reloc-keep-cache:
>     - shard-rkl:          NOTRUN -> [SKIP][7] ([i915#8411]) +1 other test skip
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12673/shard-rkl-5/igt@api_intel_bb@object-reloc-keep-cache.html
>     - shard-dg1:          NOTRUN -> [SKIP][8] ([i915#8411])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12673/shard-dg1-18/igt@api_intel_bb@object-reloc-keep-cache.html
>     - shard-mtlp:         NOTRUN -> [SKIP][9] ([i915#8411])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12673/shard-mtlp-1/igt@api_intel_bb@object-reloc-keep-cache.html
> 
>   * igt@api_intel_bb@object-reloc-purge-cache:
>     - shard-dg2:          NOTRUN -> [SKIP][10] ([i915#8411]) +2 other tests skip
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12673/shard-dg2-5/igt@api_intel_bb@object-reloc-purge-cache.html
> 

...cut...

>   * igt@drm_fdinfo@all-busy-check-all:
>     - shard-dg2-9:        NOTRUN -> [SKIP][11] ([i915#8414])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12673/shard-dg2-9/igt@drm_fdinfo@all-busy-check-all.html
> 

...cut...

>   [i915#9917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917
>   [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8251 -> IGTPW_12673
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_16198: e03a2fbda18fa9e3df6fc7bb0c6359f0ccddf9d4 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_12673: 12673
>   IGT_8251: f0b66883398b4a07bb8fcaa3663a2140129d9a58 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12673/index.html
