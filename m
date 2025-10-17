Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A837CCD195
	for <igt-dev@archiver.kernel.org>; Fri, 17 Oct 2025 10:21:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACB7710EBA0;
	Fri, 17 Oct 2025 10:21:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vfs/3rBN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAEA510EBA0;
 Fri, 17 Oct 2025 10:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760696483; x=1792232483;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=f/Wahnq3ekaGKhz516ifw4tXTmqgpjVAOfJiDfWZUJI=;
 b=Vfs/3rBNOmzakxpos99bB2CoNbK+KD0LZWNpzofDJzCFZnqV52Vz6Lmw
 rqbP8k+8bFry2IMgCcV6y44+K18Krx5LxHgCre3C7UiPnfTVIDFiaZLSn
 VzoHh1XzVXX2l0MyEAVGz6M1Pt78/8hGupmYt/O6UWwdWGZhnBqYfVNRh
 dDNsn1V4h/2mYtdYI6oF3M84bVtKe43kTW8U5pEXaqhEmmISFlK4rUbMU
 J2pW6eAwyC5Y/nMgTNCY0DindDVYrgCxW0en4yw/Y9dRIU5lI8k1JR1Vz
 YvG/v+mJ+KAiQA0QOCZpwBjIoGfH/H+tmB0yyrRGRpNYkMuLlmi1kaqq5 g==;
X-CSE-ConnectionGUID: ZGuMPBTKRcWBq+3AiaApmQ==
X-CSE-MsgGUID: ZkcvJPrGTVSK5+pGZHzarg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62813994"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62813994"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 03:21:23 -0700
X-CSE-ConnectionGUID: SV4d2g3PRhmZiOOch3NeNQ==
X-CSE-MsgGUID: yDXWcZS3Rha/KBGP4XdVUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; d="scan'208";a="182692379"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2025 03:21:23 -0700
Date: Fri, 17 Oct 2025 12:21:10 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbA==?= =?utf-8?Q?=3A?= failure for
 tools/intel_gpu_top: Add iteration option -n
Message-ID: <20251017102110.u6jox2hejfyfdre7@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20251016095649.31446-1-kamil.konieczny@linux.intel.com>
 <176064203726.23601.9559717205120983091@97596180aaec>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <176064203726.23601.9559717205120983091@97596180aaec>
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
On 2025-10-16 at 19:13:57 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tools/intel_gpu_top: Add iteration option -n
> URL   : https://patchwork.freedesktop.org/series/156053/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_17371_full -> IGTPW_13912_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_13912_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_13912_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13912/index.html
> 
> Participating hosts (11 -> 11)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_13912_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@fbdev@write:
>     - shard-glk:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17371/shard-glk5/igt@fbdev@write.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13912/shard-glk6/igt@fbdev@write.html
>     - shard-dg2:          [PASS][3] -> [FAIL][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17371/shard-dg2-8/igt@fbdev@write.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13912/shard-dg2-3/igt@fbdev@write.html
> 
>   * igt@gem_lmem_swapping@smem-oom@lmem0:
>     - shard-dg1:          [PASS][5] -> [ABORT][6] +1 other test abort
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17371/shard-dg1-17/igt@gem_lmem_swapping@smem-oom@lmem0.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13912/shard-dg1-17/igt@gem_lmem_swapping@smem-oom@lmem0.html
> 
>   * igt@i915_suspend@fence-restore-tiled2untiled:
>     - shard-rkl:          [PASS][7] -> [ABORT][8]
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17371/shard-rkl-6/igt@i915_suspend@fence-restore-tiled2untiled.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13912/shard-rkl-4/igt@i915_suspend@fence-restore-tiled2untiled.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
>     - shard-tglu:         NOTRUN -> [INCOMPLETE][9]
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13912/shard-tglu-8/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create:
>     - shard-dg1:          [FAIL][10] ([i915#15119]) -> [ABORT][11]
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17371/shard-dg1-12/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create.html
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13912/shard-dg1-17/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create.html
> 

This is not related to change in tools. No need for respin.

Regards,
Kamil

>   
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_17371_full and IGTPW_13912_full:
> 
> ### New IGT tests (3) ###
> 
>   * igt@kms_vblank@query-busy@pipe-d-hdmi-a-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.34] s
> 
>   * igt@kms_vblank@query-forked-busy@pipe-d-hdmi-a-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.43] s
> 
>   * igt@kms_vblank@wait-forked-busy-hang@pipe-d-hdmi-a-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [24.99] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_13912_full that come from known issues:

...cut...

