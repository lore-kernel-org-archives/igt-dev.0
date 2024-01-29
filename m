Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06CCBC47422
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jan 2024 11:16:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B87CB1127FD;
	Mon, 29 Jan 2024 11:16:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 794FF1127FD;
 Mon, 29 Jan 2024 11:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706526981; x=1738062981;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=aaKZpV21F6p4lYZmj3bGXRuiJukH2XZAuHlXHE60lpQ=;
 b=S5oUMNMrKH0RGOycSZT89382jVWIxxzdY1Lx4C6WrI0+YwpfNlNiv1cF
 /7f8P1kx4/uugnmXwiaIoF3OOidnZUX4MJQmcN/yKshXAlzF+q+k3ra4D
 mrKtRVoMXYwXU2N8CCn99TnYFAyj5DkoCS8Nunw9QYA+usIRPTHGtmhAN
 T+aHJ9nr6Nba6oswHmHfXQLNc3D5BXCLfGgZWFGcJo9LA3+VkJJ1OdMlw
 YUz98CUMVdebHN5qZlvxRvP5Ew8TYRqT5/3UguEJMvG89b9BjeZSza4CD
 FdElUQfBtDQRU+oHT2P4JBfAOrYw3vJo1iE23VklFKsGd+zdeDqBAbYfd w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="16448943"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="16448943"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 03:16:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="821822222"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="821822222"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orsmga001-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2024 03:16:19 -0800
Date: Mon, 29 Jan 2024 12:16:16 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyX?= Fi.CI.IGT: failure for Add d3 mmap test (rev6)
Message-ID: <20240129111616.na3mbpn23mf6unri@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 I915-ci-infra@lists.freedesktop.org, lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
References: <20240125154114.2164080-1-anshuman.gupta@intel.com>
 <170620572173.727567.10936793679496857070@5338d5abeb45>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <170620572173.727567.10936793679496857070@5338d5abeb45>
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
Cc: lgci.bug.filing@intel.com, I915-ci-infra@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi igt-dev,
On 2024-01-25 at 18:02:01 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Add d3 mmap test (rev6)
> URL   : https://patchwork.freedesktop.org/series/124115/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14179_full -> IGTPW_10589_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10589_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10589_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10589/index.html
> 
> Participating hosts (8 -> 8)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10589_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_exec_fence@parallel@vecs0:
>     - shard-mtlp:         [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14179/shard-mtlp-4/igt@gem_exec_fence@parallel@vecs0.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10589/shard-mtlp-4/igt@gem_exec_fence@parallel@vecs0.html
> 
>   * igt@gem_exec_schedule@submit-early-slice:
>     - shard-mtlp:         NOTRUN -> [TIMEOUT][3] +1 other test timeout
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10589/shard-mtlp-6/igt@gem_exec_schedule@submit-early-slice.html
> 
>   * igt@kms_cursor_legacy@torture-bo@pipe-a:
>     - shard-tglu:         [PASS][4] -> [DMESG-WARN][5]
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14179/shard-tglu-7/igt@kms_cursor_legacy@torture-bo@pipe-a.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10589/shard-tglu-4/igt@kms_cursor_legacy@torture-bo@pipe-a.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-wc:
>     - shard-mtlp:         [PASS][6] -> [TIMEOUT][7] +1 other test timeout
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14179/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-wc.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10589/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_vblank@ts-continuation-suspend@pipe-a-edp-1:
>     - shard-mtlp:         [PASS][8] -> [FAIL][9] +1 other test fail
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14179/shard-mtlp-5/igt@kms_vblank@ts-continuation-suspend@pipe-a-edp-1.html
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10589/shard-mtlp-7/igt@kms_vblank@ts-continuation-suspend@pipe-a-edp-1.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_content_protection@atomic:
>     - shard-mtlp:         [SKIP][10] ([i915#6944]) -> [TIMEOUT][11]
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14179/shard-mtlp-7/igt@kms_content_protection@atomic.html
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10589/shard-mtlp-6/igt@kms_content_protection@atomic.html
> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * {igt@kms_psr@pr-cursor-render}:
>     - shard-mtlp:         [SKIP][12] ([i915#9688]) -> [TIMEOUT][13]
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14179/shard-mtlp-3/igt@kms_psr@pr-cursor-render.html
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10589/shard-mtlp-6/igt@kms_psr@pr-cursor-render.html
> 

Unrelated to change in Xe lib and test, no need for respin.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_10589_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@blit-reloc-purge-cache:
>     - shard-dg1:          NOTRUN -> [SKIP][14] ([i915#8411])
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10589/shard-dg1-15/igt@api_intel_bb@blit-reloc-purge-cache.html
>     - shard-mtlp:         NOTRUN -> [SKIP][15] ([i915#8411])
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10589/shard-mtlp-5/igt@api_intel_bb@blit-reloc-purge-cache.html
>     - shard-dg2:          NOTRUN -> [SKIP][16] ([i915#8411])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10589/shard-dg2-2/igt@api_intel_bb@blit-reloc-purge-cache.html
> 

...cut...

> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7692 -> IGTPW_10589
> 
>   CI-20190529: 20190529
>   CI_DRM_14179: 38a58d4231067e1b548c12ee521b73ffc0ebb73a @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_10589: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10589/index.html
>   IGT_7692: 5d9c29c620701497323bf3721146da57efa50952 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10589/index.html
