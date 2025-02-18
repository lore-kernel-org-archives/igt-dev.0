Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 644E2C021AA
	for <igt-dev@archiver.kernel.org>; Tue, 18 Feb 2025 15:56:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0199C10E3CB;
	Tue, 18 Feb 2025 15:56:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e3FUTSKV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 100BD10E3C0;
 Tue, 18 Feb 2025 15:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739894201; x=1771430201;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=YsVj0HtspH/H1LkscS1dG4IJNnLHCYhWh/W31nyO8q0=;
 b=e3FUTSKVqnEeSq/5qhE2iwHwWZzlyHUGEu4aNZUcml7mdAx0TApIt3k8
 P7/7WtxmsrnVVxVifNYBh5oOg55++UX+9StlUqjBj+2VXIKE1UfRGUntJ
 AOkORjXrQ+GY2pQNNoqYc5vLMsTMge3UPvZm3daUPtMcIqdScsavRxyOW
 zXLf1rA0iNFjokHmWkJpY2vPdqv+bdiYqMrzI56fTqSGLN55MK9e2WyGO
 BaG21GIrvjOabeG7UZG2WrbwCYMqNceEHdB+TPSMCEV3Kp7Ku1KVJnd7E
 +qqphlZcG8jNPRz3Fn7I5qYWI4Yq9qeS3D0JfsRPgCS1j8TCTVdCR1zZv w==;
X-CSE-ConnectionGUID: GzZ0rpGMQ5GI7ZEh8nbjEQ==
X-CSE-MsgGUID: kRtvE+CoS7yN+uOQzrEjtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="51583878"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="51583878"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 07:56:40 -0800
X-CSE-ConnectionGUID: nhNz4NKBRRmFK89I8yIIUg==
X-CSE-MsgGUID: Qx39Zt0LRKS45Z3HsXSrQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="115094009"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 07:56:40 -0800
Date: Tue, 18 Feb 2025 16:56:37 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_fo?=
 =?utf-8?Q?r?= tests/intel/i915_fb_tiling: convert to subtest basic-x-tiling
Message-ID: <20250218155637.lhchpgftjzwxg2el@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250217173149.157360-1-kamil.konieczny@linux.intel.com>
 <173984561499.3432207.932647278218351599@b555e5b46a47>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <173984561499.3432207.932647278218351599@b555e5b46a47>
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
On 2025-02-18 at 02:26:54 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/i915_fb_tiling: convert to subtest basic-x-tiling
> URL   : https://patchwork.freedesktop.org/series/144971/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_16146_full -> IGTPW_12616_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_12616_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12616_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12616/index.html
> 
> Participating hosts (11 -> 11)
> ------------------------------
> 
>   Additional (1): shard-dg2-set2 
>   Missing    (1): pig-kbl-iris 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12616_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_softpin@noreloc-s3:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12616/shard-glk9/igt@gem_softpin@noreloc-s3.html

Not related.

> 
>   * {igt@i915_fb_tiling@basic-x-tiling} (NEW):
>     - shard-mtlp:         NOTRUN -> [SKIP][2]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12616/shard-mtlp-2/igt@i915_fb_tiling@basic-x-tiling.html
>     - shard-dg2:          NOTRUN -> [SKIP][3]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12616/shard-dg2-6/igt@i915_fb_tiling@basic-x-tiling.html
>     - shard-dg1:          NOTRUN -> [SKIP][4]
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12616/shard-dg1-19/igt@i915_fb_tiling@basic-x-tiling.html
> 

Expected skips as this is test rename from
	igt@i915_fb_tiling
into
	igt@i915_fb_tiling@basic-x-tiling


>   * igt@kms_cursor_crc@cursor-suspend@pipe-d-dp-3:
>     - shard-dg2:          NOTRUN -> [INCOMPLETE][5]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12616/shard-dg2-11/igt@kms_cursor_crc@cursor-suspend@pipe-d-dp-3.html
> 
>   * igt@kms_dp_linktrain_fallback@dp-fallback:
>     - shard-rkl:          NOTRUN -> [SKIP][6] +1 other test skip
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12616/shard-rkl-4/igt@kms_dp_linktrain_fallback@dp-fallback.html
> 
>   * igt@kms_dp_linktrain_fallback@dsc-fallback:
>     - shard-tglu-1:       NOTRUN -> [SKIP][7]
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12616/shard-tglu-1/igt@kms_dp_linktrain_fallback@dsc-fallback.html
> 
>   
> #### Warnings ####
> 
>   * igt@gem_pxp@hw-rejects-pxp-buffer:
>     - shard-rkl:          [TIMEOUT][8] ([i915#12917] / [i915#12964]) -> [FAIL][9]
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16146/shard-rkl-1/igt@gem_pxp@hw-rejects-pxp-buffer.html
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12616/shard-rkl-1/igt@gem_pxp@hw-rejects-pxp-buffer.html
> 

Not related.

>   
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_16146_full and IGTPW_12616_full:
> 
> ### New IGT tests (1) ###
> 
>   * igt@i915_fb_tiling@basic-x-tiling:
>     - Statuses : 4 pass(s) 3 skip(s)
>     - Exec time: [0.0, 0.00] s
> 
>   

Expected result - skips where still present in old code.

Regards,
Kamil

> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_12616_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@blit-reloc-purge-cache:
>     - shard-dg2:          NOTRUN -> [SKIP][10] ([i915#8411])
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12616/shard-dg2-5/igt@api_intel_bb@blit-reloc-purge-cache.html
> 

...cut...

> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8235 -> IGTPW_12616
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_16146: c282b8face163244076dac30e4c9ffd74dc89044 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_12616: 12616
>   IGT_8235: e7e14eff66bc42329903ee579f019094cf1fdfce @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12616/index.html
