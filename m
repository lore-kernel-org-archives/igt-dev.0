Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A7DBC021B3
	for <igt-dev@archiver.kernel.org>; Thu, 20 Feb 2025 12:45:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A40B010E959;
	Thu, 20 Feb 2025 12:45:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PoxASaYT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 935BF10E959;
 Thu, 20 Feb 2025 12:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740055517; x=1771591517;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=jH/7qT3sKjj26LkKoFlTm99DArai/MlWO3peACqrwyM=;
 b=PoxASaYTX8Vf+qwLGq97GFQWeyH/nikjJa61rQn0gD/aDIQc5g1Mt99O
 PJOaNoZxloRGl2YWzdmF8PX0fzZy0d7QUcO9VBEcJEu1l/EAqO55n0Ka2
 44pz5X3ZEBhecE0BRV+AIOzFaepNKQR3r24N+JreQFt1tzy9cZpbip/jy
 Jklkud457eY71aYCKWjnwiS2mcuwIehuOX1O5SsEnju2YIJjRIpVEcXAI
 bbarADnz2PzDVZyxB+5ODawWqSoyUrgnAMzsmP45DX303c6tghP3F266p
 6tYhTQYafy/xXETxGEEDr9YM5VPYw/+0Bx/+4lTs4LPwya16BaunVt1pc w==;
X-CSE-ConnectionGUID: YeYQvR50S8+RuChWNzR72Q==
X-CSE-MsgGUID: sIhz5AJyRdmPM/Nv1IR2cA==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="63304541"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; d="scan'208";a="63304541"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 04:45:17 -0800
X-CSE-ConnectionGUID: 4/X+w3A4QJWXScPLw4pL/w==
X-CSE-MsgGUID: GrW33FsVTL6uZuwdUYVDEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="114884828"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 04:45:17 -0800
Date: Thu, 20 Feb 2025 13:45:13 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbA==?= =?utf-8?Q?=3A?= failure for
 tools/intel_reg: Add --pci-slot option (rev2)
Message-ID: <20250220124513.sbskimkj7vrjahr7@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250219121050.71831-1-kamil.konieczny@linux.intel.com>
 <174005493217.180587.11559353189787353210@b555e5b46a47>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <174005493217.180587.11559353189787353210@b555e5b46a47>
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
On 2025-02-20 at 12:35:32 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tools/intel_reg: Add --pci-slot option (rev2)
> URL   : https://patchwork.freedesktop.org/series/144206/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8240_full -> IGTPW_12637_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_12637_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12637_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12637/index.html

Unrelated to tools change, no test nor lib changed in this patch.

Regards,
Kamil

> 
> Participating hosts (10 -> 10)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12637_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1:
>     - shard-snb:          [PASS][1] -> [FAIL][2] +3 other tests fail
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8240/shard-snb5/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12637/shard-snb6/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1.html
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank:
>     - shard-mtlp:         [PASS][3] -> [FAIL][4] +3 other tests fail
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8240/shard-mtlp-4/igt@kms_flip@flip-vs-absolute-wf_vblank.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12637/shard-mtlp-6/igt@kms_flip@flip-vs-absolute-wf_vblank.html
>     - shard-rkl:          NOTRUN -> [FAIL][5] +1 other test fail
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12637/shard-rkl-4/igt@kms_flip@flip-vs-absolute-wf_vblank.html
> 
>   * igt@kms_flip@plain-flip-fb-recreate:
>     - shard-tglu:         [PASS][6] -> [FAIL][7] +4 other tests fail
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8240/shard-tglu-5/igt@kms_flip@plain-flip-fb-recreate.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12637/shard-tglu-4/igt@kms_flip@plain-flip-fb-recreate.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
>     - shard-rkl:          [PASS][8] -> [FAIL][9] +1 other test fail
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8240/shard-rkl-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12637/shard-rkl-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@perf_pmu@module-unload:
>     - shard-dg1:          [PASS][10] -> [INCOMPLETE][11]
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8240/shard-dg1-12/igt@perf_pmu@module-unload.html
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12637/shard-dg1-17/igt@perf_pmu@module-unload.html
>     - shard-tglu:         [PASS][12] -> [INCOMPLETE][13]
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8240/shard-tglu-10/igt@perf_pmu@module-unload.html
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12637/shard-tglu-8/igt@perf_pmu@module-unload.html
>     - shard-mtlp:         [PASS][14] -> [INCOMPLETE][15]
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8240/shard-mtlp-2/igt@perf_pmu@module-unload.html
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12637/shard-mtlp-7/igt@perf_pmu@module-unload.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_12637_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@blit-reloc-keep-cache:
>     - shard-dg2:          NOTRUN -> [SKIP][16] ([i915#8411])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12637/shard-dg2-7/igt@api_intel_bb@blit-reloc-keep-cache.html
> 
...cut...

> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8240 -> IGTPW_12637
> 
>   CI-20190529: 20190529
>   CI_DRM_16161: e19eb43c82480789a93ce0c452e22bbd851b93c6 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_12637: 8bb0f4666cbeb80bf4139a6bfb9e1580e22450bf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8240: aa097b2264d0eae71f718791f83097d979ddf8b7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12637/index.html
