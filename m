Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0C3FC3DA64
	for <igt-dev@archiver.kernel.org>; Tue,  6 Aug 2024 12:52:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F17110E18D;
	Tue,  6 Aug 2024 12:52:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dwrkkcRz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B9B310E0C6;
 Tue,  6 Aug 2024 12:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722948723; x=1754484723;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=QJWq15nIo11OCt8XqOKGwp9dYhZ/q73pf1LNde3kX0A=;
 b=dwrkkcRzqDcPW817z+eknZQd9uaikV0HKmouA61rFxXeatHCqf1xsnSS
 6Qps17MEr3klVHmqe6Jh33u1SPjKoMu+H0jVJyMMi/p6jehDnMp6/R1fF
 JDODKhCv8hfyVW4iPzPZ3QqF8G0SQOcWHkdvxdl8ovepG5Iy7ggWoKEjv
 7JGcVSxmOuffstJj3L1t3QNNppUEdOvFPF/KSYga+WeAqomnQu98Qa6RD
 fbrhLs7vq4RMFITMstZLCrpjj9eN9MbquuF1s3hntrMCB0cbCsGTg7/SQ
 Mn7Pz0qpv9Q/ZKEGHQvii0t+ufFCCrTc5wclN1EMhwut3L0RdX+pDazls w==;
X-CSE-ConnectionGUID: lfA/TMXFTyG684szt/AA+Q==
X-CSE-MsgGUID: 9j4E5mfPQEWL4D7Ypv7UjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="21103256"
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; d="scan'208";a="21103256"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 05:52:03 -0700
X-CSE-ConnectionGUID: P/Nj19W2STSLZze6KLhJhA==
X-CSE-MsgGUID: VijivfoaTpyT/RfQtSiBtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; d="scan'208";a="56427598"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 05:52:01 -0700
Date: Tue, 6 Aug 2024 14:51:58 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVA==?= =?utf-8?Q?=3A?= failure for
 tests/core_hotunplug: Make it fail only once
Message-ID: <20240806125158.ekktjw3cksz5vsbd@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20240805143713.76034-1-kamil.konieczny@linux.intel.com>
 <172290187178.541967.3526584282945736721@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <172290187178.541967.3526584282945736721@2413ebb6fbb6>
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
On 2024-08-05 at 23:51:11 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/core_hotunplug: Make it fail only once
> URL   : https://patchwork.freedesktop.org/series/136888/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_15180_full -> IGTPW_11531_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11531_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11531_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11531/index.html
> 
> Participating hosts (9 -> 9)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11531_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_busy@close-race:
>     - shard-tglu:         [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15180/shard-tglu-9/igt@gem_busy@close-race.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11531/shard-tglu-6/igt@gem_busy@close-race.html
> 
>   * igt@kms_atomic_transition@modeset-transition-fencing@2x-outputs:
>     - shard-glk:          [PASS][3] -> [FAIL][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15180/shard-glk3/igt@kms_atomic_transition@modeset-transition-fencing@2x-outputs.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11531/shard-glk8/igt@kms_atomic_transition@modeset-transition-fencing@2x-outputs.html
> 
>   * igt@kms_big_fb@4-tiled-8bpp-rotate-0:
>     - shard-mtlp:         [PASS][5] -> [ABORT][6]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15180/shard-mtlp-7/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11531/shard-mtlp-7/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-hdmi-a2:
>     - shard-rkl:          NOTRUN -> [FAIL][7] +1 other test fail
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11531/shard-rkl-5/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-hdmi-a2.html
> 
>   * igt@perf_pmu@all-busy-idle-check-all:
>     - shard-dg2:          [PASS][8] -> [FAIL][9] +1 other test fail
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15180/shard-dg2-7/igt@perf_pmu@all-busy-idle-check-all.html
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11531/shard-dg2-11/igt@perf_pmu@all-busy-idle-check-all.html
>     - shard-dg1:          [PASS][10] -> [FAIL][11]
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15180/shard-dg1-14/igt@perf_pmu@all-busy-idle-check-all.html
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11531/shard-dg1-18/igt@perf_pmu@all-busy-idle-check-all.html
>     - shard-mtlp:         NOTRUN -> [FAIL][12]
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11531/shard-mtlp-3/igt@perf_pmu@all-busy-idle-check-all.html
> 

These are unrelated to core_hotunplug,

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_11531_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
...cut...
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7956 -> IGTPW_11531
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_15180: d15caf398bccf6c9d34363f65251b7192f833dc9 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_11531: 11531
>   IGT_7956: dc7e77d1a8643f50832c38b4c8f8ddb598c0cf48 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11531/index.html
