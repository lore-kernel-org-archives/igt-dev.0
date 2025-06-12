Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46C42C61CE8
	for <igt-dev@archiver.kernel.org>; Thu, 12 Jun 2025 09:17:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEEF710E7C2;
	Thu, 12 Jun 2025 09:17:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EPPWEs3Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8F0A10E7C0;
 Thu, 12 Jun 2025 09:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749719843; x=1781255843;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=MP+Qy01qRrZEvLe9sQOBjtrAj1iYnklg/p23j/5aqLs=;
 b=EPPWEs3ZDZOI1Wksk7ull59mdU5PNv9u5vrJ7dEQJrNgjyt51Z/9jSgG
 xEA0F540ZdbUvq2nTfp4Jmr3hb3NE2LFLHgN+gTsjNd9Gc0w7xdxIcCI/
 QylSREa+H2CyLR2XxWtuNrKYEexXodvoV9Gq5TOlZz5y+oLu//cZDYUPz
 sggQwWtgJX4xeR28b3Dw0YzRoxGIWxtpQ4HZTiZBsTEQtec7kPzAKLI0E
 ozS8y800tsvP5oKFGrymRXGerZH+QrY9eub/lXWJPofDMK8aUPIWOhRUo
 UAZfhFPLpGi5/x3lm9rWUvKkvfM99gbZDQc0P/ZW64D3Vk+1I2vTMjqNh w==;
X-CSE-ConnectionGUID: 86YI0RYPS6ORyuKIBJAppw==
X-CSE-MsgGUID: RvoDkeZKSy+RgyND9RcbRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="39502034"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="39502034"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 02:17:22 -0700
X-CSE-ConnectionGUID: dXaGgUISSw+uXiWTt9I76w==
X-CSE-MsgGUID: fNeIcmIzRqW5G+lg4F9nvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="170631554"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 02:17:21 -0700
Date: Thu, 12 Jun 2025 11:17:19 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbDogZmFpbHVy?= =?utf-8?Q?e?= for
 tests/amdgpu: Fix compilation warnings for USERQ (rev3)
Message-ID: <20250612091719.oxy2xbolb7rme22g@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250611212500.1940399-1-kamil.konieczny@linux.intel.com>
 <174970372026.69723.7334186871565395175@1538d3639d33>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <174970372026.69723.7334186871565395175@1538d3639d33>
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
On 2025-06-12 at 04:48:40 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/amdgpu: Fix compilation warnings for USERQ (rev3)
> URL   : https://patchwork.freedesktop.org/series/150105/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_16687_full -> IGTPW_13278_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_13278_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_13278_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13278/index.html
> 
> Participating hosts (10 -> 10)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_13278_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_pm_lpsp@kms-lpsp:
>     - shard-mtlp:         [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16687/shard-mtlp-2/igt@kms_pm_lpsp@kms-lpsp.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13278/shard-mtlp-4/igt@kms_pm_lpsp@kms-lpsp.html
> 
>   * igt@kms_psr@psr2-sprite-render@edp-1:
>     - shard-mtlp:         NOTRUN -> [FAIL][3] +1 other test fail
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13278/shard-mtlp-7/igt@kms_psr@psr2-sprite-render@edp-1.html
> 

Unrelated, changes are only in amdgpu tests.

Regrads,
Kamil

>   
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_16687_full and IGTPW_13278_full:
> 
> ### New IGT tests (48) ###
> 
>   * igt@kms_pm_lpsp@128x128-left-edge:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_pm_lpsp@2x-plain-flip:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_pm_lpsp@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_pm_lpsp@basic-forked:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_pm_lpsp@capture-recoverable:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_pm_lpsp@crc-primary-basic-y-tiled-gen12-rc-ccs:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_pm_lpsp@create-ext-set-pat:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_pm_lpsp@cursor-onscreen-256x85:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_pm_lpsp@cursor-sliding-32x32:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_pm_lpsp@cursorb-vs-flipa-legacy:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_pm_lpsp@drm_dp_mst_helper:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_pm_lpsp@etime-multi-wait-for-submit-available-unsubmitted:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_pm_lpsp@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_pm_lpsp@fbc-pr-primary-render:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_pm_lpsp@fbc-psr-cursor-plane-move:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_pm_lpsp@fbcpsr-1p-offscren-pri-shrfb-draw-render:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_pm_lpsp@fbcpsr-2p-primscrn-shrfb-plflip-blt:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_pm_lpsp@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_pm_lpsp@flip-vs-cursor-atomic-transitions-varying-size:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_pm_lpsp@full-batch:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_pm_lpsp@global-sseu-config-invalid:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_pm_lpsp@info:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_pm_lpsp@invalid-modeset-force-big-joiner:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_pm_lpsp@invalid-oa-exponent:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_pm_lpsp@master-drop-set-root:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_pm_lpsp@min-max-config-loaded:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_pm_lpsp@modeset-lpsp:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_pm_lpsp@most-busy-check-all:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_pm_lpsp@no-blt:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_pm_lpsp@plain-flip-ts-check:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_pm_lpsp@plane-all-transition-nonblocking-fencing:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_pm_lpsp@preempt-hang:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_pm_lpsp@preservation-reset:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_pm_lpsp@probe:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_pm_lpsp@psr-1p-offscren-pri-shrfb-draw-mmap-cpu:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_pm_lpsp@psr-1p-primscrn-cur-indfb-draw-render:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_pm_lpsp@psr-1p-primscrn-spr-indfb-move:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_pm_lpsp@psr-2p-primscrn-spr-indfb-move:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_pm_lpsp@psr-2p-scndscrn-shrfb-pgflip-blt:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_pm_lpsp@read-crc:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_pm_lpsp@render-node-busy-idle:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_pm_lpsp@single-wait-signaled:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_pm_lpsp@test_correct_cpu_write:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_pm_lpsp@unwedge-stress:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_pm_lpsp@wait-zero-handles:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_pm_lpsp@x-tiled-32bpp-rotate-270:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_pm_lpsp@y-tiled-ccs-to-y-tiled:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_pm_lpsp@y-tiled-ccs-to-y-tiled-ccs:
>     - Statuses :
>     - Exec time: [None] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_13278_full that come from known issues:

...cut...

> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8405 -> IGTPW_13278
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_16687: 03848f8a962392d602e7f2a6a22f2a7e3efa4a3b @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_13278: 2894da8046e1bec113ef83f0e170df4172ac194e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8405: 8405
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13278/index.html
