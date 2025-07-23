Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3DF1C83F1A
	for <igt-dev@archiver.kernel.org>; Wed, 23 Jul 2025 09:36:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57BDF10E149;
	Wed, 23 Jul 2025 09:36:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A2FE/Bqd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DE4D10E12D;
 Wed, 23 Jul 2025 09:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753263386; x=1784799386;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=CQV35gFdcbLd7EeaKC0x+kozA1wgqWlEVHkOJd3aTkA=;
 b=A2FE/BqdlrjfQQS7fsDF4CCudxeQvfMMDarheXn0WFQAZnew7DglxMr0
 +CaE20T4ETIgHjrkrA0NE21S+42LEdH3NydFNOid5xOOvaGqD27e/l0oN
 Q8sI6vjoQymo91OSi7giyHUqjDC++HkJx4z3aboAYhoL8BjOJP0l1hXZr
 wFV8FM0ijRT4TlJ4x0nFts5u+JpDePbofvAJRdegul4OyXrbPPOkIy5++
 XEQBbnZYnhNBTm4DGFpheYVMRaZPwP1xGtw4vkLJYrHZEiAa8yCu9LOUx
 +rKPOZVb8pGjTdCmIFZUv8pFmHZaCU12XJs6g6RpuH9FGm4SB+OYshRin Q==;
X-CSE-ConnectionGUID: ZBDcyILaQ7+1Toiew751eQ==
X-CSE-MsgGUID: AcNPxn/JSS2BxB89hGkIgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="58154644"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="58154644"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 02:36:26 -0700
X-CSE-ConnectionGUID: N0DVRtAXTrS0z8zhJEDvXg==
X-CSE-MsgGUID: MNbOVyCiQZy+fJnKVj58YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="159968195"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 02:36:25 -0700
Date: Wed, 23 Jul 2025 11:36:10 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbA==?= =?utf-8?Q?=3A?= failure for
 intel-ci: Block VKMS for i915 and Xe runs
Message-ID: <20250723093610.ge6m5oyvbsioey2f@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250722123920.78238-1-kamil.konieczny@linux.intel.com>
 <175320806723.181092.5502566211577658343@1538d3639d33>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <175320806723.181092.5502566211577658343@1538d3639d33>
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
On 2025-07-22 at 18:14:27 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: intel-ci: Block VKMS for i915 and Xe runs
> URL   : https://patchwork.freedesktop.org/series/151940/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_16907_full -> IGTPW_13506_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_13506_full absolutely need to be
>   verified manually.

Unrelated, only new non-Intel tests were blocked, no need for respin.

Regards,
Kamil

>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_13506_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13506/index.html
> 
> Participating hosts (13 -> 12)
> ------------------------------
> 
>   Missing    (1): shard-dg2-set2 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_13506_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_lmem_swapping@smem-oom:
>     - shard-dg2:          [PASS][1] -> [WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16907/shard-dg2-4/igt@gem_lmem_swapping@smem-oom.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13506/shard-dg2-4/igt@gem_lmem_swapping@smem-oom.html
> 
>   * igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0:
>     - shard-mtlp:         [PASS][3] -> [FAIL][4] +3 other tests fail
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16907/shard-mtlp-1/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13506/shard-mtlp-1/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1:
>     - shard-glk:          NOTRUN -> [FAIL][5] +1 other test fail
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13506/shard-glk5/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1.html
> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_16907_full and IGTPW_13506_full:
> 
> ### New IGT tests (40) ###
> 
>   * igt@i915_pm_rps@basic-force-big-joiner:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@i915_pm_rps@basic-write-cpu-read-gtt:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@i915_pm_rps@fbc-1p-primscrn-shrfb-pgflip-blt:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@i915_pm_rps@timeline-wait:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@i915_pm_rps@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_psr@2x-flip-vs-panning-vs-hang:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_psr@2x-flip-vs-suspend-interruptible:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_psr@4-tiled-8bpp-rotate-270:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_psr@alloc-simple:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_psr@bonded-pair:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_psr@crc-primary-suspend-4-tiled-lnl-ccs:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_psr@crc-primary-suspend-y-tiled-gen12-rc-ccs:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_psr@cursor-random-512x512:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_psr@cursor-size-hints:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_psr@degamma:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_psr@dp-mst-lic-type-0:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_psr@empty-nonblock:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_psr@extended-pageflip-modeset-hang-oldfb:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_psr@fbc-1p-offscren-pri-indfb-draw-blt:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_psr@fbc-1p-primscrn-indfb-msflip-blt:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_psr@fbc-2p-primscrn-shrfb-pgflip-blt:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_psr@fbc-pr-primary-plane-update-sf-dmg-area:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_psr@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_psr@fbcpsr-2p-primscrn-cur-indfb-move:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_psr@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-cpu:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_psr@flip-32bpp-linear-to-64bpp-linear-upscaling:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_psr@invalid-create:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_psr@invalid-engines:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_psr@ioctl-errors:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_psr@linear-32bpp-rotate-0:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_psr@persistence:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_psr@plane-use-after-nonblocking-unbind:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_psr@preempt-self:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_psr@psr-2p-primscrn-cur-indfb-draw-mmap-cpu:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_psr@psr-2p-primscrn-spr-indfb-fullscreen:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_psr@sync-unmap-after-close:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_psr@two-level-inception-interruptible:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_psr@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_psr@yf-tiled-addfb-size-overflow:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_psr@zero:
>     - Statuses :
>     - Exec time: [None] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_13506_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@blit-reloc-purge-cache:
>     - shard-dg2:          NOTRUN -> [SKIP][6] ([i915#8411]) +1 other test skip
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13506/shard-dg2-8/igt@api_intel_bb@blit-reloc-purge-cache.html
>     - shard-rkl:          NOTRUN -> [SKIP][7] ([i915#8411]) +1 other test skip
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13506/shard-rkl-8/igt@api_intel_bb@blit-reloc-purge-cache.html
> 

...cut...

