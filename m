Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D1FEC27C4F
	for <igt-dev@archiver.kernel.org>; Wed, 26 Jun 2024 11:27:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3A9C10E841;
	Wed, 26 Jun 2024 11:27:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KlhuvFxF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF63A10E841;
 Wed, 26 Jun 2024 11:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719401239; x=1750937239;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=fqNo6Y4rkqiQBlBh+fsnUHDhmc2ud8sAN1ypo2O7XEU=;
 b=KlhuvFxFfNhVaKfx6Hg5WIrgsaZFOlkWF6fh41+tMPhYpEcAs816OGTV
 FlrwssdzARQwcTNL/fF3OIdk7gTZYvCHAJYS2NQxdqnLd6YN3HwU3KLgs
 gLkZSQMhSzp/D2C7tsNakX2NtwgDd0psh6yjWcjE8wPbmTzrYwreTYQ38
 KiEId+jvQv/ZqTyNXbqWkppwYoV4C4qqfUlIJ0UTHMFnTR5W/5bG72qYH
 eXJ2zOR8fxUfLA4SAgJ3K+jdPRZIpQxeEQGjv8M4BwvRS63ad9zYfjuIT
 lA0Wh3yxM6jcJAwbVGLOu9Wqa7AJFDvY8SiF74ktIfnx2z9xSw2dddtcR Q==;
X-CSE-ConnectionGUID: eo39DaNySCWwd0f2BLbnUA==
X-CSE-MsgGUID: /IE/uFQxTLCM2q7FhElRFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="27089751"
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; d="scan'208";a="27089751"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 04:27:18 -0700
X-CSE-ConnectionGUID: ZRU5uhpzR4W37aH5nV9Y4A==
X-CSE-MsgGUID: YkriX2T/Qq+2plQ49hiF9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; d="scan'208";a="44042430"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 04:27:16 -0700
Date: Wed, 26 Jun 2024 13:27:14 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVA==?= =?utf-8?Q?=3A?= failure for
 lib/intel_blt: Fix printing mocs on Xe2+
Message-ID: <20240626112714.wysb3ppprwwovs2a@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20240625091847.134707-1-zbigniew.kempczynski@intel.com>
 <171939348214.160231.948268811333991475@a6498e030952>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171939348214.160231.948268811333991475@a6498e030952>
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
On 2024-06-26 at 09:18:02 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/intel_blt: Fix printing mocs on Xe2+
> URL   : https://patchwork.freedesktop.org/series/135344/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14997_full -> IGTPW_11311_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11311_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11311_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/index.html
> 
> Participating hosts (10 -> 9)
> ------------------------------
> 
>   Missing    (1): shard-snb-0 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11311_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_color@ctm-0-75@pipe-a:
>     - shard-tglu:         [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14997/shard-tglu-6/igt@kms_color@ctm-0-75@pipe-a.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-tglu-7/igt@kms_color@ctm-0-75@pipe-a.html
> 
>   * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
>     - shard-tglu:         NOTRUN -> [SKIP][3]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-tglu-10/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr2_sf@fbc-cursor-plane-update-sf:
>     - shard-dg1:          NOTRUN -> [SKIP][4] +5 other tests skip
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg1-18/igt@kms_psr2_sf@fbc-cursor-plane-update-sf.html
> 
>   * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf:
>     - shard-rkl:          NOTRUN -> [SKIP][5] +9 other tests skip
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-rkl-5/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_sf@fbc-overlay-plane-update-continuous-sf:
>     - shard-dg2:          NOTRUN -> [SKIP][6] +4 other tests skip
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg2-6/igt@kms_psr2_sf@fbc-overlay-plane-update-continuous-sf.html
> 

Unrelated, the change is only for developers using dumping option(s).

Regards,
Kamil

>   
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_14997_full and IGTPW_11311_full:
> 
> ### New IGT tests (1) ###
> 
>   * igt@kms_cursor_crc@cursor-alpha-opaque@pipe-b-hdmi-a-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.37] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_11311_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@blit-reloc-purge-cache:
>     - shard-dg1:          NOTRUN -> [SKIP][7] ([i915#8411])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg1-18/igt@api_intel_bb@blit-reloc-purge-cache.html
> 
>   * igt@debugfs_test@basic-hwmon:
>     - shard-rkl:          NOTRUN -> [SKIP][8] ([i915#9318])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-rkl-5/igt@debugfs_test@basic-hwmon.html
> 
>   * igt@device_reset@unbind-cold-reset-rebind:
>     - shard-rkl:          NOTRUN -> [SKIP][9] ([i915#11078]) +1 other test skip
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-rkl-3/igt@device_reset@unbind-cold-reset-rebind.html
> 
>   * igt@drm_fdinfo@most-busy-check-all@rcs0:
>     - shard-rkl:          [PASS][10] -> [FAIL][11] ([i915#7742])
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14997/shard-rkl-3/igt@drm_fdinfo@most-busy-check-all@rcs0.html
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-rkl-2/igt@drm_fdinfo@most-busy-check-all@rcs0.html
> 
>   * igt@drm_fdinfo@most-busy-idle-check-all@bcs0:
>     - shard-dg1:          NOTRUN -> [SKIP][12] ([i915#8414]) +10 other tests skip
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg1-16/igt@drm_fdinfo@most-busy-idle-check-all@bcs0.html
> 
>   * igt@drm_fdinfo@virtual-busy-idle:
>     - shard-mtlp:         NOTRUN -> [SKIP][13] ([i915#8414]) +6 other tests skip
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-mtlp-4/igt@drm_fdinfo@virtual-busy-idle.html
>     - shard-dg2:          NOTRUN -> [SKIP][14] ([i915#8414])
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg2-5/igt@drm_fdinfo@virtual-busy-idle.html
> 
>   * igt@gem_ccs@suspend-resume:
>     - shard-rkl:          NOTRUN -> [SKIP][15] ([i915#9323]) +1 other test skip
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-rkl-3/igt@gem_ccs@suspend-resume.html
>     - shard-mtlp:         NOTRUN -> [SKIP][16] ([i915#9323])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-mtlp-5/igt@gem_ccs@suspend-resume.html
> 
>   * igt@gem_close_race@multigpu-basic-process:
>     - shard-dg2:          NOTRUN -> [SKIP][17] ([i915#7697])
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg2-1/igt@gem_close_race@multigpu-basic-process.html
>     - shard-rkl:          NOTRUN -> [SKIP][18] ([i915#7697])
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-rkl-2/igt@gem_close_race@multigpu-basic-process.html
> 
>   * igt@gem_create@create-ext-cpu-access-big:
>     - shard-mtlp:         NOTRUN -> [SKIP][19] ([i915#6335])
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-mtlp-3/igt@gem_create@create-ext-cpu-access-big.html
> 
>   * igt@gem_create@create-ext-set-pat:
>     - shard-rkl:          NOTRUN -> [SKIP][20] ([i915#8562])
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-rkl-3/igt@gem_create@create-ext-set-pat.html
> 
>   * igt@gem_ctx_exec@basic-nohangcheck:
>     - shard-rkl:          NOTRUN -> [FAIL][21] ([i915#6268])
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-rkl-2/igt@gem_ctx_exec@basic-nohangcheck.html
> 
>   * igt@gem_ctx_persistence@heartbeat-hostile:
>     - shard-mtlp:         NOTRUN -> [SKIP][22] ([i915#8555])
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-mtlp-4/igt@gem_ctx_persistence@heartbeat-hostile.html
> 
>   * igt@gem_ctx_sseu@invalid-sseu:
>     - shard-dg1:          NOTRUN -> [SKIP][23] ([i915#280])
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg1-15/igt@gem_ctx_sseu@invalid-sseu.html
> 
>   * igt@gem_ctx_sseu@mmap-args:
>     - shard-rkl:          NOTRUN -> [SKIP][24] ([i915#280])
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-rkl-3/igt@gem_ctx_sseu@mmap-args.html
>     - shard-mtlp:         NOTRUN -> [SKIP][25] ([i915#280])
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-mtlp-7/igt@gem_ctx_sseu@mmap-args.html
> 
>   * igt@gem_eio@reset-stress:
>     - shard-dg1:          [PASS][26] -> [FAIL][27] ([i915#5784])
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14997/shard-dg1-15/igt@gem_eio@reset-stress.html
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg1-15/igt@gem_eio@reset-stress.html
> 
>   * igt@gem_exec_balancer@bonded-semaphore:
>     - shard-dg1:          NOTRUN -> [SKIP][28] ([i915#4812]) +5 other tests skip
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg1-17/igt@gem_exec_balancer@bonded-semaphore.html
> 
>   * igt@gem_exec_balancer@noheartbeat:
>     - shard-dg2:          NOTRUN -> [SKIP][29] ([i915#8555]) +1 other test skip
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg2-8/igt@gem_exec_balancer@noheartbeat.html
> 
>   * igt@gem_exec_balancer@parallel:
>     - shard-rkl:          NOTRUN -> [SKIP][30] ([i915#4525]) +2 other tests skip
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-rkl-3/igt@gem_exec_balancer@parallel.html
> 
>   * igt@gem_exec_create@basic@smem:
>     - shard-dg1:          [PASS][31] -> [DMESG-WARN][32] ([i915#4423])
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14997/shard-dg1-17/igt@gem_exec_create@basic@smem.html
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg1-18/igt@gem_exec_create@basic@smem.html
> 
>   * igt@gem_exec_fair@basic-deadline:
>     - shard-rkl:          [PASS][33] -> [FAIL][34] ([i915#2846])
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14997/shard-rkl-5/igt@gem_exec_fair@basic-deadline.html
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-rkl-5/igt@gem_exec_fair@basic-deadline.html
> 
>   * igt@gem_exec_fair@basic-none-rrul@rcs0:
>     - shard-glk:          NOTRUN -> [FAIL][35] ([i915#2842])
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-glk2/igt@gem_exec_fair@basic-none-rrul@rcs0.html
> 
>   * igt@gem_exec_fair@basic-none-share:
>     - shard-dg2:          NOTRUN -> [SKIP][36] ([i915#3539] / [i915#4852]) +3 other tests skip
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg2-8/igt@gem_exec_fair@basic-none-share.html
> 
>   * igt@gem_exec_fair@basic-none-share@rcs0:
>     - shard-rkl:          [PASS][37] -> [FAIL][38] ([i915#2842])
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14997/shard-rkl-4/igt@gem_exec_fair@basic-none-share@rcs0.html
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-rkl-5/igt@gem_exec_fair@basic-none-share@rcs0.html
> 
>   * igt@gem_exec_fair@basic-pace-solo:
>     - shard-mtlp:         NOTRUN -> [SKIP][39] ([i915#4473])
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-mtlp-6/igt@gem_exec_fair@basic-pace-solo.html
> 
>   * igt@gem_exec_fair@basic-pace-solo@rcs0:
>     - shard-glk:          [PASS][40] -> [FAIL][41] ([i915#2842])
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14997/shard-glk9/igt@gem_exec_fair@basic-pace-solo@rcs0.html
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-glk4/igt@gem_exec_fair@basic-pace-solo@rcs0.html
> 
>   * igt@gem_exec_fair@basic-pace@rcs0:
>     - shard-rkl:          NOTRUN -> [FAIL][42] ([i915#2842]) +3 other tests fail
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-rkl-5/igt@gem_exec_fair@basic-pace@rcs0.html
> 
>   * igt@gem_exec_fence@concurrent:
>     - shard-mtlp:         NOTRUN -> [SKIP][43] ([i915#4812]) +1 other test skip
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-mtlp-5/igt@gem_exec_fence@concurrent.html
> 
>   * igt@gem_exec_fence@submit67:
>     - shard-dg2:          NOTRUN -> [SKIP][44] ([i915#4812])
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg2-8/igt@gem_exec_fence@submit67.html
> 
>   * igt@gem_exec_flush@basic-batch-kernel-default-wb:
>     - shard-dg1:          NOTRUN -> [SKIP][45] ([i915#3539] / [i915#4852]) +2 other tests skip
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg1-16/igt@gem_exec_flush@basic-batch-kernel-default-wb.html
> 
>   * igt@gem_exec_flush@basic-uc-prw-default:
>     - shard-dg1:          NOTRUN -> [SKIP][46] ([i915#3539]) +3 other tests skip
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg1-17/igt@gem_exec_flush@basic-uc-prw-default.html
> 
>   * igt@gem_exec_reloc@basic-cpu-wc-active:
>     - shard-mtlp:         NOTRUN -> [SKIP][47] ([i915#3281]) +6 other tests skip
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-mtlp-7/igt@gem_exec_reloc@basic-cpu-wc-active.html
> 
>   * igt@gem_exec_reloc@basic-wc-read:
>     - shard-dg1:          NOTRUN -> [SKIP][48] ([i915#3281]) +9 other tests skip
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg1-16/igt@gem_exec_reloc@basic-wc-read.html
> 
>   * igt@gem_exec_reloc@basic-wc-read-noreloc:
>     - shard-rkl:          NOTRUN -> [SKIP][49] ([i915#3281]) +13 other tests skip
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-rkl-2/igt@gem_exec_reloc@basic-wc-read-noreloc.html
> 
>   * igt@gem_exec_reloc@basic-write-gtt-noreloc:
>     - shard-dg2:          NOTRUN -> [SKIP][50] ([i915#3281]) +9 other tests skip
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg2-10/igt@gem_exec_reloc@basic-write-gtt-noreloc.html
> 
>   * igt@gem_exec_schedule@reorder-wide:
>     - shard-mtlp:         NOTRUN -> [SKIP][51] ([i915#4537] / [i915#4812])
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-mtlp-3/igt@gem_exec_schedule@reorder-wide.html
> 
>   * igt@gem_fence_thrash@bo-write-verify-threaded-none:
>     - shard-dg1:          NOTRUN -> [SKIP][52] ([i915#4860]) +1 other test skip
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg1-13/igt@gem_fence_thrash@bo-write-verify-threaded-none.html
> 
>   * igt@gem_fenced_exec_thrash@2-spare-fences:
>     - shard-dg2:          NOTRUN -> [SKIP][53] ([i915#4860]) +1 other test skip
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg2-2/igt@gem_fenced_exec_thrash@2-spare-fences.html
> 
>   * igt@gem_fenced_exec_thrash@no-spare-fences-busy:
>     - shard-mtlp:         NOTRUN -> [SKIP][54] ([i915#4860]) +1 other test skip
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-mtlp-7/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html
> 
>   * igt@gem_lmem_swapping@basic:
>     - shard-mtlp:         NOTRUN -> [SKIP][55] ([i915#4613]) +2 other tests skip
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-mtlp-1/igt@gem_lmem_swapping@basic.html
> 
>   * igt@gem_lmem_swapping@heavy-multi@lmem0:
>     - shard-dg1:          [PASS][56] -> [FAIL][57] ([i915#10378])
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14997/shard-dg1-17/igt@gem_lmem_swapping@heavy-multi@lmem0.html
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg1-15/igt@gem_lmem_swapping@heavy-multi@lmem0.html
> 
>   * igt@gem_lmem_swapping@heavy-random:
>     - shard-tglu:         NOTRUN -> [SKIP][58] ([i915#4613])
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-tglu-9/igt@gem_lmem_swapping@heavy-random.html
> 
>   * igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0:
>     - shard-dg1:          NOTRUN -> [SKIP][59] ([i915#4565]) +1 other test skip
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg1-18/igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0.html
> 
>   * igt@gem_lmem_swapping@parallel-random-verify:
>     - shard-rkl:          NOTRUN -> [SKIP][60] ([i915#4613]) +5 other tests skip
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-rkl-4/igt@gem_lmem_swapping@parallel-random-verify.html
> 
>   * igt@gem_lmem_swapping@parallel-random-verify-ccs:
>     - shard-glk:          NOTRUN -> [SKIP][61] ([i915#4613]) +2 other tests skip
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-glk8/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
> 
>   * igt@gem_lmem_swapping@smem-oom@lmem0:
>     - shard-dg1:          [PASS][62] -> [TIMEOUT][63] ([i915#5493])
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14997/shard-dg1-15/igt@gem_lmem_swapping@smem-oom@lmem0.html
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg1-18/igt@gem_lmem_swapping@smem-oom@lmem0.html
> 
>   * igt@gem_madvise@dontneed-before-exec:
>     - shard-mtlp:         NOTRUN -> [SKIP][64] ([i915#3282]) +7 other tests skip
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-mtlp-5/igt@gem_madvise@dontneed-before-exec.html
> 
>   * igt@gem_mmap@bad-object:
>     - shard-dg1:          NOTRUN -> [SKIP][65] ([i915#4083]) +4 other tests skip
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg1-16/igt@gem_mmap@bad-object.html
> 
>   * igt@gem_mmap@short-mmap:
>     - shard-mtlp:         NOTRUN -> [SKIP][66] ([i915#4083]) +5 other tests skip
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-mtlp-7/igt@gem_mmap@short-mmap.html
> 
>   * igt@gem_mmap_gtt@cpuset-basic-small-copy-odd:
>     - shard-dg1:          NOTRUN -> [SKIP][67] ([i915#4077]) +10 other tests skip
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg1-15/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html
> 
>   * igt@gem_mmap_gtt@cpuset-big-copy-odd:
>     - shard-dg2:          NOTRUN -> [SKIP][68] ([i915#4077]) +7 other tests skip
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg2-8/igt@gem_mmap_gtt@cpuset-big-copy-odd.html
> 
>   * igt@gem_mmap_offset@clear@smem0:
>     - shard-mtlp:         [PASS][69] -> [ABORT][70] ([i915#10029] / [i915#10729])
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14997/shard-mtlp-7/igt@gem_mmap_offset@clear@smem0.html
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-mtlp-5/igt@gem_mmap_offset@clear@smem0.html
> 
>   * igt@gem_mmap_wc@read-write:
>     - shard-dg2:          NOTRUN -> [SKIP][71] ([i915#4083]) +3 other tests skip
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg2-1/igt@gem_mmap_wc@read-write.html
> 
>   * igt@gem_partial_pwrite_pread@writes-after-reads:
>     - shard-rkl:          NOTRUN -> [SKIP][72] ([i915#3282]) +12 other tests skip
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-rkl-5/igt@gem_partial_pwrite_pread@writes-after-reads.html
> 
>   * igt@gem_pread@snoop:
>     - shard-dg2:          NOTRUN -> [SKIP][73] ([i915#3282]) +4 other tests skip
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg2-2/igt@gem_pread@snoop.html
> 
>   * igt@gem_pwrite@basic-exhaustion:
>     - shard-dg1:          NOTRUN -> [SKIP][74] ([i915#3282]) +4 other tests skip
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg1-15/igt@gem_pwrite@basic-exhaustion.html
> 
>   * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
>     - shard-rkl:          NOTRUN -> [SKIP][75] ([i915#4270]) +4 other tests skip
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-rkl-3/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html
> 
>   * igt@gem_pxp@protected-raw-src-copy-not-readible:
>     - shard-dg2:          NOTRUN -> [SKIP][76] ([i915#4270]) +4 other tests skip
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg2-4/igt@gem_pxp@protected-raw-src-copy-not-readible.html
> 
>   * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
>     - shard-dg1:          NOTRUN -> [SKIP][77] ([i915#4270]) +5 other tests skip
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg1-17/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html
> 
>   * igt@gem_pxp@verify-pxp-stale-buf-optout-execution:
>     - shard-mtlp:         NOTRUN -> [SKIP][78] ([i915#4270]) +2 other tests skip
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-mtlp-7/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html
> 
>   * igt@gem_render_copy@y-tiled-to-vebox-y-tiled:
>     - shard-mtlp:         NOTRUN -> [SKIP][79] ([i915#8428]) +3 other tests skip
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-mtlp-1/igt@gem_render_copy@y-tiled-to-vebox-y-tiled.html
> 
>   * igt@gem_render_copy@y-tiled-to-vebox-yf-tiled:
>     - shard-dg2:          NOTRUN -> [SKIP][80] ([i915#5190] / [i915#8428]) +10 other tests skip
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg2-10/igt@gem_render_copy@y-tiled-to-vebox-yf-tiled.html
> 
>   * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
>     - shard-rkl:          NOTRUN -> [SKIP][81] ([i915#8411]) +2 other tests skip
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-rkl-2/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html
> 
>   * igt@gem_set_tiling_vs_gtt:
>     - shard-mtlp:         NOTRUN -> [SKIP][82] ([i915#4079])
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-mtlp-3/igt@gem_set_tiling_vs_gtt.html
>     - shard-dg2:          NOTRUN -> [SKIP][83] ([i915#4079])
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg2-8/igt@gem_set_tiling_vs_gtt.html
> 
>   * igt@gem_set_tiling_vs_pwrite:
>     - shard-dg1:          NOTRUN -> [SKIP][84] ([i915#4079])
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg1-18/igt@gem_set_tiling_vs_pwrite.html
> 
>   * igt@gem_userptr_blits@dmabuf-sync:
>     - shard-rkl:          NOTRUN -> [SKIP][85] ([i915#3297] / [i915#3323])
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-rkl-5/igt@gem_userptr_blits@dmabuf-sync.html
> 
>   * igt@gem_userptr_blits@dmabuf-unsync:
>     - shard-dg2:          NOTRUN -> [SKIP][86] ([i915#3297]) +1 other test skip
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg2-2/igt@gem_userptr_blits@dmabuf-unsync.html
>     - shard-dg1:          NOTRUN -> [SKIP][87] ([i915#3297]) +3 other tests skip
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg1-15/igt@gem_userptr_blits@dmabuf-unsync.html
> 
>   * igt@gem_userptr_blits@map-fixed-invalidate-busy:
>     - shard-mtlp:         NOTRUN -> [SKIP][88] ([i915#3297]) +2 other tests skip
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-mtlp-7/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
>     - shard-dg1:          NOTRUN -> [SKIP][89] ([i915#3297] / [i915#4880])
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg1-15/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
> 
>   * igt@gem_userptr_blits@sd-probe:
>     - shard-dg2:          NOTRUN -> [SKIP][90] ([i915#3297] / [i915#4958])
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg2-5/igt@gem_userptr_blits@sd-probe.html
> 
>   * igt@gem_userptr_blits@unsync-overlap:
>     - shard-tglu:         NOTRUN -> [SKIP][91] ([i915#3297])
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-tglu-10/igt@gem_userptr_blits@unsync-overlap.html
> 
>   * igt@gem_userptr_blits@unsync-unmap-after-close:
>     - shard-rkl:          NOTRUN -> [SKIP][92] ([i915#3297]) +3 other tests skip
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-rkl-3/igt@gem_userptr_blits@unsync-unmap-after-close.html
> 
>   * igt@gen3_render_linear_blits:
>     - shard-mtlp:         NOTRUN -> [SKIP][93] +18 other tests skip
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-mtlp-3/igt@gen3_render_linear_blits.html
> 
>   * igt@gen9_exec_parse@allowed-single:
>     - shard-mtlp:         NOTRUN -> [SKIP][94] ([i915#2856]) +2 other tests skip
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-mtlp-4/igt@gen9_exec_parse@allowed-single.html
>     - shard-glk:          [PASS][95] -> [ABORT][96] ([i915#5566])
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14997/shard-glk3/igt@gen9_exec_parse@allowed-single.html
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-glk8/igt@gen9_exec_parse@allowed-single.html
> 
>   * igt@gen9_exec_parse@basic-rejected:
>     - shard-dg2:          NOTRUN -> [SKIP][97] ([i915#2856]) +2 other tests skip
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg2-5/igt@gen9_exec_parse@basic-rejected.html
> 
>   * igt@gen9_exec_parse@basic-rejected-ctx-param:
>     - shard-tglu:         NOTRUN -> [SKIP][98] ([i915#2527] / [i915#2856])
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-tglu-10/igt@gen9_exec_parse@basic-rejected-ctx-param.html
> 
>   * igt@gen9_exec_parse@bb-chained:
>     - shard-rkl:          NOTRUN -> [SKIP][99] ([i915#2527]) +8 other tests skip
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-rkl-2/igt@gen9_exec_parse@bb-chained.html
> 
>   * igt@gen9_exec_parse@bb-start-out:
>     - shard-dg1:          NOTRUN -> [SKIP][100] ([i915#2527]) +1 other test skip
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg1-18/igt@gen9_exec_parse@bb-start-out.html
> 
>   * igt@i915_fb_tiling:
>     - shard-dg2:          NOTRUN -> [SKIP][101] ([i915#4881])
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg2-3/igt@i915_fb_tiling.html
> 
>   * igt@i915_module_load@resize-bar:
>     - shard-tglu:         NOTRUN -> [SKIP][102] ([i915#6412])
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-tglu-7/igt@i915_module_load@resize-bar.html
> 
>   * igt@i915_pm_freq_api@freq-basic-api:
>     - shard-rkl:          NOTRUN -> [SKIP][103] ([i915#8399]) +1 other test skip
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-rkl-1/igt@i915_pm_freq_api@freq-basic-api.html
> 
>   * igt@i915_pm_freq_mult@media-freq@gt0:
>     - shard-rkl:          NOTRUN -> [SKIP][104] ([i915#6590])
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-rkl-2/igt@i915_pm_freq_mult@media-freq@gt0.html
> 
>   * igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0:
>     - shard-tglu:         NOTRUN -> [WARN][105] ([i915#2681]) +3 other tests warn
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-tglu-7/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html
> 
>   * igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0:
>     - shard-dg1:          [PASS][106] -> [FAIL][107] ([i915#3591])
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14997/shard-dg1-15/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg1-16/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html
> 
>   * igt@i915_pm_rpm@gem-evict-pwrite:
>     - shard-mtlp:         NOTRUN -> [SKIP][108] ([i915#4077]) +5 other tests skip
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-mtlp-8/igt@i915_pm_rpm@gem-evict-pwrite.html
> 
>   * igt@i915_pm_rps@basic-api:
>     - shard-dg1:          NOTRUN -> [SKIP][109] ([i915#6621])
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg1-15/igt@i915_pm_rps@basic-api.html
>     - shard-dg2:          NOTRUN -> [SKIP][110] ([i915#6621])
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg2-10/igt@i915_pm_rps@basic-api.html
> 
>   * igt@i915_pm_rps@thresholds-idle@gt0:
>     - shard-dg1:          NOTRUN -> [SKIP][111] ([i915#8925])
>    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg1-18/igt@i915_pm_rps@thresholds-idle@gt0.html
> 
>   * igt@i915_power@sanity:
>     - shard-rkl:          NOTRUN -> [SKIP][112] ([i915#7984])
>    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-rkl-5/igt@i915_power@sanity.html
> 
>   * igt@i915_selftest@mock@memory_region:
>     - shard-dg1:          NOTRUN -> [DMESG-WARN][113] ([i915#9311])
>    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg1-17/igt@i915_selftest@mock@memory_region.html
>     - shard-snb:          NOTRUN -> [DMESG-WARN][114] ([i915#9311])
>    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-snb4/igt@i915_selftest@mock@memory_region.html
> 
>   * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
>     - shard-mtlp:         NOTRUN -> [SKIP][115] ([i915#4212])
>    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-mtlp-2/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html
>     - shard-dg1:          NOTRUN -> [SKIP][116] ([i915#4212])
>    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg1-13/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html
> 
>   * igt@kms_addfb_basic@basic-y-tiled-legacy:
>     - shard-dg2:          NOTRUN -> [SKIP][117] ([i915#4215] / [i915#5190])
>    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg2-8/igt@kms_addfb_basic@basic-y-tiled-legacy.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc:
>     - shard-rkl:          NOTRUN -> [SKIP][118] ([i915#8709]) +3 other tests skip
>    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-rkl-5/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs:
>     - shard-dg1:          NOTRUN -> [SKIP][119] ([i915#8709]) +7 other tests skip
>    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg1-18/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-2-4-mc-ccs:
>     - shard-dg2:          NOTRUN -> [SKIP][120] ([i915#8709]) +11 other tests skip
>    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg2-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-2-4-mc-ccs.html
> 
>   * igt@kms_async_flips@invalid-async-flip:
>     - shard-dg2:          NOTRUN -> [SKIP][121] ([i915#6228])
>    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg2-10/igt@kms_async_flips@invalid-async-flip.html
>     - shard-mtlp:         NOTRUN -> [SKIP][122] ([i915#6228])
>    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-mtlp-8/igt@kms_async_flips@invalid-async-flip.html
> 
>   * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
>     - shard-dg2:          NOTRUN -> [SKIP][123] ([i915#9531])
>    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg2-6/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
>     - shard-rkl:          NOTRUN -> [SKIP][124] ([i915#9531])
>    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-rkl-2/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
>     - shard-dg1:          NOTRUN -> [SKIP][125] ([i915#9531])
>    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg1-13/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
>     - shard-glk:          NOTRUN -> [SKIP][126] ([i915#1769])
>    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-glk2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
> 
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
>     - shard-dg1:          NOTRUN -> [SKIP][127] ([i915#4538] / [i915#5286]) +9 other tests skip
>    [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg1-17/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
>     - shard-rkl:          NOTRUN -> [SKIP][128] ([i915#5286]) +10 other tests skip
>    [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-rkl-5/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
>     - shard-dg1:          NOTRUN -> [SKIP][129] ([i915#5286])
>    [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg1-18/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-mtlp:         [PASS][130] -> [FAIL][131] ([i915#5138]) +1 other test fail
>    [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14997/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
>    [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@linear-16bpp-rotate-90:
>     - shard-tglu:         NOTRUN -> [SKIP][132] +17 other tests skip
>    [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-tglu-9/igt@kms_big_fb@linear-16bpp-rotate-90.html
> 
>   * igt@kms_big_fb@linear-64bpp-rotate-90:
>     - shard-rkl:          NOTRUN -> [SKIP][133] ([i915#3638]) +8 other tests skip
>    [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-rkl-3/igt@kms_big_fb@linear-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
>     - shard-dg1:          NOTRUN -> [SKIP][134] ([i915#3638]) +1 other test skip
>    [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg1-17/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-overflow:
>     - shard-dg2:          NOTRUN -> [SKIP][135] ([i915#5190])
>    [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg2-4/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
>     - shard-dg1:          NOTRUN -> [SKIP][136] ([i915#4538]) +7 other tests skip
>    [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg1-17/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
>     - shard-dg2:          NOTRUN -> [SKIP][137] ([i915#4538] / [i915#5190]) +11 other tests skip
>    [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg2-6/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html
> 
>   * igt@kms_big_joiner@basic:
>     - shard-dg2:          NOTRUN -> [SKIP][138] ([i915#10656]) +1 other test skip
>    [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg2-1/igt@kms_big_joiner@basic.html
>     - shard-rkl:          NOTRUN -> [SKIP][139] ([i915#10656])
>    [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-rkl-2/igt@kms_big_joiner@basic.html
>     - shard-dg1:          NOTRUN -> [SKIP][140] ([i915#10656]) +1 other test skip
>    [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg1-17/igt@kms_big_joiner@basic.html
> 
>   * igt@kms_big_joiner@invalid-modeset-force-joiner:
>     - shard-tglu:         NOTRUN -> [SKIP][141] ([i915#10656])
>    [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-tglu-10/igt@kms_big_joiner@invalid-modeset-force-joiner.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][142] ([i915#6095]) +35 other tests skip
>    [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-mtlp-1/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-edp-1.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-2:
>     - shard-glk:          NOTRUN -> [SKIP][143] +210 other tests skip
>    [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-glk8/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-2.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs:
>     - shard-rkl:          NOTRUN -> [SKIP][144] ([i915#10278])
>    [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-rkl-5/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1:
>     - shard-dg2:          NOTRUN -> [SKIP][145] ([i915#10307] / [i915#10434] / [i915#6095]) +7 other tests skip
>    [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg2-8/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
>     - shard-tglu:         NOTRUN -> [SKIP][146] ([i915#6095]) +11 other tests skip
>    [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-tglu-10/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-a-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [SKIP][147] ([i915#10307] / [i915#6095]) +163 other tests skip
>    [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg2-5/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-a-hdmi-a-3.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs:
>     - shard-dg2:          NOTRUN -> [SKIP][148] ([i915#10278])
>    [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg2-3/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1:
>     - shard-rkl:          NOTRUN -> [SKIP][149] ([i915#6095]) +81 other tests skip
>    [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-rkl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-3:
>     - shard-dg1:          NOTRUN -> [SKIP][150] ([i915#6095]) +107 other tests skip
>    [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg1-13/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-3.html
> 
>   * igt@kms_cdclk@plane-scaling:
>     - shard-rkl:          NOTRUN -> [SKIP][151] ([i915#3742])
>    [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-rkl-3/igt@kms_cdclk@plane-scaling.html
>     - shard-dg1:          NOTRUN -> [SKIP][152] ([i915#3742])
>    [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg1-17/igt@kms_cdclk@plane-scaling.html
> 
>   * igt@kms_cdclk@plane-scaling@pipe-c-edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][153] ([i915#4087]) +3 other tests skip
>    [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-mtlp-8/igt@kms_cdclk@plane-scaling@pipe-c-edp-1.html
> 
>   * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
>     - shard-rkl:          NOTRUN -> [SKIP][154] ([i915#7828]) +11 other tests skip
>    [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-rkl-1/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
> 
>   * igt@kms_chamelium_edid@vga-edid-read:
>     - shard-tglu:         NOTRUN -> [SKIP][155] ([i915#7828]) +2 other tests skip
>    [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-tglu-6/igt@kms_chamelium_edid@vga-edid-read.html
>     - shard-mtlp:         NOTRUN -> [SKIP][156] ([i915#7828]) +4 other tests skip
>    [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-mtlp-2/igt@kms_chamelium_edid@vga-edid-read.html
> 
>   * igt@kms_chamelium_frames@dp-crc-fast:
>     - shard-dg2:          NOTRUN -> [SKIP][157] ([i915#7828]) +9 other tests skip
>    [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg2-5/igt@kms_chamelium_frames@dp-crc-fast.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
>     - shard-dg1:          NOTRUN -> [SKIP][158] ([i915#7828]) +9 other tests skip
>    [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg1-13/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-0:
>     - shard-tglu:         NOTRUN -> [SKIP][159] ([i915#3116] / [i915#3299])
>    [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-tglu-10/igt@kms_content_protection@dp-mst-lic-type-0.html
>     - shard-dg2:          NOTRUN -> [SKIP][160] ([i915#3299])
>    [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg2-5/igt@kms_content_protection@dp-mst-lic-type-0.html
> 
>   * igt@kms_content_protection@dp-mst-type-1:
>     - shard-rkl:          NOTRUN -> [SKIP][161] ([i915#3116]) +1 other test skip
>    [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-rkl-4/igt@kms_content_protection@dp-mst-type-1.html
> 
>   * igt@kms_content_protection@legacy:
>     - shard-dg2:          NOTRUN -> [SKIP][162] ([i915#7118] / [i915#9424])
>    [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg2-4/igt@kms_content_protection@legacy.html
> 
>   * igt@kms_content_protection@lic-type-1:
>     - shard-dg2:          NOTRUN -> [SKIP][163] ([i915#9424])
>    [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg2-6/igt@kms_content_protection@lic-type-1.html
>     - shard-rkl:          NOTRUN -> [SKIP][164] ([i915#9424])
>    [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-rkl-2/igt@kms_content_protection@lic-type-1.html
> 
>   * igt@kms_content_protection@mei-interface:
>     - shard-dg1:          NOTRUN -> [SKIP][165] ([i915#9424])
>    [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg1-15/igt@kms_content_protection@mei-interface.html
> 
>   * igt@kms_content_protection@type1:
>     - shard-rkl:          NOTRUN -> [SKIP][166] ([i915#7118] / [i915#9424]) +1 other test skip
>    [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-rkl-4/igt@kms_content_protection@type1.html
>     - shard-dg1:          NOTRUN -> [SKIP][167] ([i915#7116] / [i915#9424]) +1 other test skip
>    [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg1-13/igt@kms_content_protection@type1.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-32x32:
>     - shard-tglu:         NOTRUN -> [SKIP][168] ([i915#3555])
>    [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-tglu-8/igt@kms_cursor_crc@cursor-offscreen-32x32.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-256x85:
>     - shard-mtlp:         NOTRUN -> [SKIP][169] ([i915#8814])
>    [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-mtlp-7/igt@kms_cursor_crc@cursor-onscreen-256x85.html
> 
>   * igt@kms_cursor_crc@cursor-random-32x10:
>     - shard-mtlp:         NOTRUN -> [SKIP][170] ([i915#3555] / [i915#8814]) +1 other test skip
>    [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-mtlp-6/igt@kms_cursor_crc@cursor-random-32x10.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x170:
>     - shard-rkl:          NOTRUN -> [SKIP][171] ([i915#3359]) +3 other tests skip
>    [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-rkl-2/igt@kms_cursor_crc@cursor-random-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
>     - shard-dg2:          NOTRUN -> [SKIP][172] ([i915#3359])
>    [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg2-4/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x170:
>     - shard-mtlp:         NOTRUN -> [SKIP][173] ([i915#3359]) +1 other test skip
>    [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-mtlp-4/igt@kms_cursor_crc@cursor-sliding-512x170.html
>     - shard-dg1:          NOTRUN -> [SKIP][174] ([i915#3359])
>    [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg1-16/igt@kms_cursor_crc@cursor-sliding-512x170.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
>     - shard-mtlp:         NOTRUN -> [SKIP][175] ([i915#9809]) +4 other tests skip
>    [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-mtlp-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
>     - shard-snb:          [PASS][176] -> [SKIP][177] +6 other tests skip
>    [176]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14997/shard-snb7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
>    [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-snb4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
>     - shard-glk:          [PASS][178] -> [FAIL][179] ([i915#2346])
>    [178]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14997/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
>    [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
>     - shard-dg1:          NOTRUN -> [SKIP][180] ([i915#9067])
>    [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg1-16/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>     - shard-rkl:          NOTRUN -> [SKIP][181] ([i915#4103]) +1 other test skip
>    [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-rkl-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
>     - shard-dg1:          NOTRUN -> [SKIP][182] ([i915#9723])
>    [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg1-18/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
>     - shard-mtlp:         NOTRUN -> [SKIP][183] ([i915#9833])
>    [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-mtlp-2/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
> 
>   * igt@kms_display_modes@mst-extended-mode-negative:
>     - shard-dg2:          NOTRUN -> [SKIP][184] ([i915#8588])
>    [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg2-4/igt@kms_display_modes@mst-extended-mode-negative.html
> 
>   * igt@kms_dp_aux_dev:
>     - shard-dg2:          NOTRUN -> [SKIP][185] ([i915#1257])
>    [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg2-2/igt@kms_dp_aux_dev.html
>     - shard-rkl:          NOTRUN -> [SKIP][186] ([i915#1257])
>    [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-rkl-3/igt@kms_dp_aux_dev.html
> 
>   * igt@kms_dsc@dsc-with-bpc-formats:
>     - shard-mtlp:         NOTRUN -> [SKIP][187] ([i915#3555] / [i915#3840])
>    [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-mtlp-2/igt@kms_dsc@dsc-with-bpc-formats.html
>     - shard-dg2:          NOTRUN -> [SKIP][188] ([i915#3555] / [i915#3840])
>    [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg2-4/igt@kms_dsc@dsc-with-bpc-formats.html
>     - shard-rkl:          NOTRUN -> [SKIP][189] ([i915#3555] / [i915#3840]) +1 other test skip
>    [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-rkl-5/igt@kms_dsc@dsc-with-bpc-formats.html
>     - shard-dg1:          NOTRUN -> [SKIP][190] ([i915#3555] / [i915#3840])
>    [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg1-13/igt@kms_dsc@dsc-with-bpc-formats.html
> 
>   * igt@kms_fbcon_fbt@psr:
>     - shard-dg2:          NOTRUN -> [SKIP][191] ([i915#3469])
>    [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg2-10/igt@kms_fbcon_fbt@psr.html
>     - shard-tglu:         NOTRUN -> [SKIP][192] ([i915#3469])
>    [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-tglu-8/igt@kms_fbcon_fbt@psr.html
> 
>   * igt@kms_feature_discovery@psr1:
>     - shard-dg2:          NOTRUN -> [SKIP][193] ([i915#658])
>    [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg2-5/igt@kms_feature_discovery@psr1.html
> 
>   * igt@kms_feature_discovery@psr2:
>     - shard-dg1:          NOTRUN -> [SKIP][194] ([i915#658])
>    [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg1-15/igt@kms_feature_discovery@psr2.html
>     - shard-rkl:          NOTRUN -> [SKIP][195] ([i915#658])
>    [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-rkl-3/igt@kms_feature_discovery@psr2.html
> 
>   * igt@kms_flip@2x-flip-vs-dpms:
>     - shard-rkl:          NOTRUN -> [SKIP][196] +54 other tests skip
>    [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-rkl-2/igt@kms_flip@2x-flip-vs-dpms.html
> 
>   * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
>     - shard-tglu:         NOTRUN -> [SKIP][197] ([i915#3637]) +1 other test skip
>    [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-tglu-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend-interruptible:
>     - shard-mtlp:         NOTRUN -> [SKIP][198] ([i915#3637]) +3 other tests skip
>    [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-mtlp-3/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip@2x-modeset-vs-vblank-race:
>     - shard-dg2:          NOTRUN -> [SKIP][199] +23 other tests skip
>    [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg2-1/igt@kms_flip@2x-modeset-vs-vblank-race.html
>     - shard-dg1:          NOTRUN -> [SKIP][200] ([i915#9934]) +5 other tests skip
>    [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg1-17/igt@kms_flip@2x-modeset-vs-vblank-race.html
> 
>   * igt@kms_flip@blocking-wf_vblank@a-hdmi-a4:
>     - shard-dg1:          [PASS][201] -> [FAIL][202] ([i915#2122])
>    [201]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14997/shard-dg1-17/igt@kms_flip@blocking-wf_vblank@a-hdmi-a4.html
>    [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg1-17/igt@kms_flip@blocking-wf_vblank@a-hdmi-a4.html
> 
>   * igt@kms_flip@flip-vs-fences-interruptible:
>     - shard-dg1:          NOTRUN -> [SKIP][203] ([i915#8381])
>    [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg1-15/igt@kms_flip@flip-vs-fences-interruptible.html
> 
>   * igt@kms_flip@plain-flip-ts-check@b-hdmi-a1:
>     - shard-snb:          [PASS][204] -> [FAIL][205] ([i915#2122])
>    [204]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14997/shard-snb5/igt@kms_flip@plain-flip-ts-check@b-hdmi-a1.html
>    [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-snb7/igt@kms_flip@plain-flip-ts-check@b-hdmi-a1.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode:
>     - shard-mtlp:         NOTRUN -> [SKIP][206] ([i915#8810])
>    [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
>     - shard-dg2:          NOTRUN -> [SKIP][207] ([i915#2672]) +2 other tests skip
>    [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
>     - shard-mtlp:         NOTRUN -> [SKIP][208] ([i915#2672]) +1 other test skip
>    [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-mtlp-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
>     - shard-tglu:         NOTRUN -> [SKIP][209] ([i915#2587] / [i915#2672])
>    [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-tglu-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode:
>     - shard-mtlp:         NOTRUN -> [SKIP][210] ([i915#3555] / [i915#8810])
>    [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
>     - shard-rkl:          NOTRUN -> [SKIP][211] ([i915#2672]) +5 other tests skip
>    [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-rkl-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html
>     - shard-dg1:          NOTRUN -> [SKIP][212] ([i915#2587] / [i915#2672]) +4 other tests skip
>    [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg1-17/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-default-mode:
>     - shard-mtlp:         NOTRUN -> [SKIP][213] ([i915#2672] / [i915#3555])
>    [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-gtt:
>     - shard-mtlp:         NOTRUN -> [SKIP][214] ([i915#8708]) +4 other tests skip
>    [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-pwrite:
>     - shard-dg2:          [PASS][215] -> [FAIL][216] ([i915#6880])
>    [215]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14997/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-pwrite.html
>    [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-pwrite.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:
>     - shard-mtlp:         NOTRUN -> [SKIP][217] ([i915#1825]) +18 other tests skip
>    [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:
>     - shard-dg2:          NOTRUN -> [SKIP][218] ([i915#8708]) +16 other tests skip
>    [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-rte:
>     - shard-dg2:          NOTRUN -> [SKIP][219] ([i915#5354]) +42 other tests skip
>    [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-2p-rte.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
>     - shard-dg1:          NOTRUN -> [SKIP][220] +47 other tests skip
>    [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg1-15/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-y:
>     - shard-dg2:          NOTRUN -> [SKIP][221] ([i915#10055])
>    [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:
>     - shard-dg1:          NOTRUN -> [SKIP][222] ([i915#8708]) +25 other tests skip
>    [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt:
>     - shard-rkl:          NOTRUN -> [SKIP][223] ([i915#3023]) +39 other tests skip
>    [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
>     - shard-mtlp:         NOTRUN -> [SKIP][224] ([i915#10055])
>    [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
>     - shard-rkl:          NOTRUN -> [SKIP][225] ([i915#9766])
>    [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-rkl-3/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
> 
>   * igt@kms_frontbuffer_tracking@plane-fbc-rte:
>     - shard-rkl:          NOTRUN -> [SKIP][226] ([i915#10070])
>    [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-rkl-5/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-rte:
>     - shard-dg2:          NOTRUN -> [SKIP][227] ([i915#3458]) +17 other tests skip
>    [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-1p-rte.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
>     - shard-rkl:          NOTRUN -> [SKIP][228] ([i915#1825]) +74 other tests skip
>    [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
>     - shard-snb:          NOTRUN -> [SKIP][229] +63 other tests skip
>    [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-snb7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite:
>     - shard-dg1:          NOTRUN -> [SKIP][230] ([i915#3458]) +18 other tests skip
>    [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite.html
> 
>   * igt@kms_hdr@bpc-switch:
>     - shard-dg1:          NOTRUN -> [SKIP][231] ([i915#3555] / [i915#8228]) +2 other tests skip
>    [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg1-13/igt@kms_hdr@bpc-switch.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-rkl:          NOTRUN -> [SKIP][232] ([i915#3555] / [i915#8228]) +1 other test skip
>    [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-rkl-3/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_hdr@static-toggle:
>     - shard-mtlp:         NOTRUN -> [SKIP][233] ([i915#3555] / [i915#8228])
>    [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-mtlp-5/igt@kms_hdr@static-toggle.html
> 
>   * igt@kms_hdr@static-toggle-suspend:
>     - shard-dg2:          NOTRUN -> [SKIP][234] ([i915#3555] / [i915#8228]) +1 other test skip
>    [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg2-6/igt@kms_hdr@static-toggle-suspend.html
> 
>   * igt@kms_panel_fitting@atomic-fastset:
>     - shard-rkl:          NOTRUN -> [SKIP][235] ([i915#6301])
>    [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-rkl-5/igt@kms_panel_fitting@atomic-fastset.html
> 
>   * igt@kms_panel_fitting@legacy:
>     - shard-dg2:          NOTRUN -> [SKIP][236] ([i915#6301])
>    [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg2-10/igt@kms_panel_fitting@legacy.html
> 
>   * igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1:
>     - shard-glk:          NOTRUN -> [FAIL][237] ([i915#7862]) +1 other test fail
>    [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-glk8/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_plane_multiple@tiling-yf:
>     - shard-rkl:          NOTRUN -> [SKIP][238] ([i915#3555]) +9 other tests skip
>    [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-rkl-3/igt@kms_plane_multiple@tiling-yf.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size:
>     - shard-tglu:         NOTRUN -> [SKIP][239] ([i915#6953])
>    [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-tglu-7/igt@kms_plane_scaling@intel-max-src-size.html
>     - shard-dg1:          NOTRUN -> [SKIP][240] ([i915#6953])
>    [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg1-16/igt@kms_plane_scaling@intel-max-src-size.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [SKIP][241] ([i915#9423]) +3 other tests skip
>    [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg2-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-3.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b-hdmi-a-1:
>     - shard-rkl:          NOTRUN -> [SKIP][242] ([i915#9423]) +5 other tests skip
>    [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-rkl-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-c-hdmi-a-4:
>     - shard-dg1:          NOTRUN -> [SKIP][243] ([i915#9423]) +7 other tests skip
>    [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg1-15/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-c-hdmi-a-4.html
> 
>   * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c-hdmi-a-4:
>     - shard-dg1:          NOTRUN -> [SKIP][244] ([i915#5176] / [i915#9423]) +3 other tests skip
>    [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg1-16/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c-hdmi-a-4.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][245] ([i915#5235]) +7 other tests skip
>    [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-rkl-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b-edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][246] ([i915#5235]) +9 other tests skip
>    [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-mtlp-1/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b-edp-1.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-d-edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][247] ([i915#3555] / [i915#5235]) +1 other test skip
>    [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-mtlp-2/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-d-edp-1.html
> 
>   * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-2:
>     - shard-dg2:          NOTRUN -> [SKIP][248] ([i915#5235] / [i915#9423]) +7 other tests skip
>    [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg2-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-4:
>     - shard-dg1:          NOTRUN -> [SKIP][249] ([i915#5235]) +11 other tests skip
>    [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg1-15/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-4.html
> 
>   * igt@kms_pm_backlight@fade-with-dpms:
>     - shard-rkl:          NOTRUN -> [SKIP][250] ([i915#5354]) +1 other test skip
>    [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-rkl-2/igt@kms_pm_backlight@fade-with-dpms.html
> 
>   * igt@kms_pm_backlight@fade-with-suspend:
>     - shard-dg1:          NOTRUN -> [SKIP][251] ([i915#5354]) +1 other test skip
>    [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg1-17/igt@kms_pm_backlight@fade-with-suspend.html
> 
>   * igt@kms_pm_dc@dc3co-vpb-simulation:
>     - shard-rkl:          NOTRUN -> [SKIP][252] ([i915#9685])
>    [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-rkl-4/igt@kms_pm_dc@dc3co-vpb-simulation.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-mtlp:         NOTRUN -> [SKIP][253] ([i915#10139])
>    [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-mtlp-1/igt@kms_pm_dc@dc6-dpms.html
> 
>   * igt@kms_pm_lpsp@kms-lpsp:
>     - shard-rkl:          NOTRUN -> [SKIP][254] ([i915#9340])
>    [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-rkl-3/igt@kms_pm_lpsp@kms-lpsp.html
>     - shard-dg1:          NOTRUN -> [SKIP][255] ([i915#9340])
>    [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg1-17/igt@kms_pm_lpsp@kms-lpsp.html
> 
>   * igt@kms_pm_lpsp@screens-disabled:
>     - shard-dg1:          NOTRUN -> [SKIP][256] ([i915#8430])
>    [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg1-18/igt@kms_pm_lpsp@screens-disabled.html
> 
>   * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
>     - shard-rkl:          [PASS][257] -> [SKIP][258] ([i915#9519])
>    [257]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14997/shard-rkl-3/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
>    [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-rkl-5/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
>     - shard-tglu:         NOTRUN -> [SKIP][259] ([i915#9519])
>    [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-tglu-9/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
> 
>   * igt@kms_pm_rpm@dpms-non-lpsp:
>     - shard-mtlp:         NOTRUN -> [SKIP][260] ([i915#9519])
>    [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-mtlp-3/igt@kms_pm_rpm@dpms-non-lpsp.html
> 
>   * igt@kms_pm_rpm@modeset-lpsp:
>     - shard-dg2:          NOTRUN -> [SKIP][261] ([i915#9519]) +1 other test skip
>    [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg2-1/igt@kms_pm_rpm@modeset-lpsp.html
> 
>   * igt@kms_pm_rpm@modeset-lpsp-stress:
>     - shard-dg2:          [PASS][262] -> [SKIP][263] ([i915#9519]) +1 other test skip
>    [262]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14997/shard-dg2-10/igt@kms_pm_rpm@modeset-lpsp-stress.html
>    [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg2-3/igt@kms_pm_rpm@modeset-lpsp-stress.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp-stress:
>     - shard-rkl:          NOTRUN -> [SKIP][264] ([i915#9519])
>    [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
> 
>   * igt@kms_prime@basic-crc-hybrid:
>     - shard-dg1:          NOTRUN -> [SKIP][265] ([i915#6524])
>    [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg1-17/igt@kms_prime@basic-crc-hybrid.html
> 
>   * igt@kms_prime@basic-crc-vgem:
>     - shard-dg2:          NOTRUN -> [SKIP][266] ([i915#6524] / [i915#6805])
>    [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg2-8/igt@kms_prime@basic-crc-vgem.html
> 
>   * igt@kms_prime@d3hot:
>     - shard-rkl:          NOTRUN -> [SKIP][267] ([i915#6524])
>    [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-rkl-3/igt@kms_prime@d3hot.html
> 
>   * igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area@psr2-pipe-a-edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][268] ([i915#9808]) +5 other tests skip
>    [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-mtlp-4/igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area@psr2-pipe-a-edp-1.html
> 
>   * igt@kms_psr2_su@frontbuffer-xrgb8888:
>     - shard-dg2:          NOTRUN -> [SKIP][269] ([i915#9683])
>    [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg2-2/igt@kms_psr2_su@frontbuffer-xrgb8888.html
>     - shard-dg1:          NOTRUN -> [SKIP][270] ([i915#9683])
>    [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg1-18/igt@kms_psr2_su@frontbuffer-xrgb8888.html
> 
>   * igt@kms_psr2_su@page_flip-p010:
>     - shard-rkl:          NOTRUN -> [SKIP][271] ([i915#9683]) +1 other test skip
>    [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-rkl-3/igt@kms_psr2_su@page_flip-p010.html
> 
>   * igt@kms_psr@fbc-psr-primary-render@edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][272] ([i915#9688]) +9 other tests skip
>    [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-mtlp-3/igt@kms_psr@fbc-psr-primary-render@edp-1.html
> 
>   * igt@kms_psr@fbc-psr2-sprite-mmap-gtt:
>     - shard-dg1:          NOTRUN -> [SKIP][273] ([i915#1072] / [i915#9732]) +25 other tests skip
>    [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg1-16/igt@kms_psr@fbc-psr2-sprite-mmap-gtt.html
> 
>   * igt@kms_psr@pr-primary-page-flip:
>     - shard-tglu:         NOTRUN -> [SKIP][274] ([i915#9732]) +4 other tests skip
>    [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-tglu-9/igt@kms_psr@pr-primary-page-flip.html
> 
>   * igt@kms_psr@psr2-cursor-mmap-gtt:
>     - shard-rkl:          NOTRUN -> [SKIP][275] ([i915#1072] / [i915#9732]) +41 other tests skip
>    [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-rkl-5/igt@kms_psr@psr2-cursor-mmap-gtt.html
> 
>   * igt@kms_psr@psr2-primary-mmap-gtt:
>     - shard-dg2:          NOTRUN -> [SKIP][276] ([i915#1072] / [i915#9732]) +27 other tests skip
>    [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg2-10/igt@kms_psr@psr2-primary-mmap-gtt.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>     - shard-dg2:          NOTRUN -> [SKIP][277] ([i915#4235] / [i915#5190])
>    [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg2-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>     - shard-rkl:          NOTRUN -> [SKIP][278] ([i915#5289]) +1 other test skip
>    [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-rkl-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
>     - shard-dg1:          NOTRUN -> [SKIP][279] ([i915#5289])
>    [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg1-17/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
>     - shard-dg2:          NOTRUN -> [SKIP][280] ([i915#4235])
>    [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg2-5/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
> 
>   * igt@kms_scaling_modes@scaling-mode-center:
>     - shard-dg1:          NOTRUN -> [SKIP][281] ([i915#3555]) +4 other tests skip
>    [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg1-18/igt@kms_scaling_modes@scaling-mode-center.html
> 
>   * igt@kms_scaling_modes@scaling-mode-none:
>     - shard-dg2:          NOTRUN -> [SKIP][282] ([i915#3555]) +2 other tests skip
>    [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg2-2/igt@kms_scaling_modes@scaling-mode-none.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-mtlp:         NOTRUN -> [SKIP][283] ([i915#8623])
>    [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-mtlp-5/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-dg1:          NOTRUN -> [SKIP][284] ([i915#8623])
>    [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg1-13/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:
>     - shard-snb:          [PASS][285] -> [FAIL][286] ([i915#9196])
>    [285]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14997/shard-snb2/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html
>    [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-snb5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
>     - shard-mtlp:         [PASS][287] -> [FAIL][288] ([i915#9196])
>    [287]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14997/shard-mtlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
>    [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-mtlp-6/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:
>     - shard-rkl:          [PASS][289] -> [FAIL][290] ([i915#9196])
>    [289]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14997/shard-rkl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html
>    [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-rkl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:
>     - shard-tglu:         [PASS][291] -> [FAIL][292] ([i915#9196]) +1 other test fail
>    [291]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14997/shard-tglu-8/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html
>    [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-tglu-9/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [FAIL][293] ([i915#9196])
>    [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg2-1/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-3.html
> 
>   * igt@kms_vrr@flip-basic-fastset:
>     - shard-mtlp:         NOTRUN -> [SKIP][294] ([i915#8808] / [i915#9906]) +1 other test skip
>    [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-mtlp-1/igt@kms_vrr@flip-basic-fastset.html
> 
>   * igt@kms_vrr@max-min:
>     - shard-dg2:          NOTRUN -> [SKIP][295] ([i915#9906])
>    [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg2-10/igt@kms_vrr@max-min.html
> 
>   * igt@kms_vrr@negative-basic:
>     - shard-dg2:          NOTRUN -> [SKIP][296] ([i915#3555] / [i915#9906])
>    [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg2-2/igt@kms_vrr@negative-basic.html
>     - shard-tglu:         NOTRUN -> [SKIP][297] ([i915#3555] / [i915#9906])
>    [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-tglu-10/igt@kms_vrr@negative-basic.html
> 
>   * igt@kms_vrr@seamless-rr-switch-virtual:
>     - shard-dg1:          NOTRUN -> [SKIP][298] ([i915#9906])
>    [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg1-16/igt@kms_vrr@seamless-rr-switch-virtual.html
> 
>   * igt@kms_writeback@writeback-check-output:
>     - shard-rkl:          NOTRUN -> [SKIP][299] ([i915#2437]) +1 other test skip
>    [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-rkl-2/igt@kms_writeback@writeback-check-output.html
> 
>   * igt@kms_writeback@writeback-check-output-xrgb2101010:
>     - shard-glk:          NOTRUN -> [SKIP][300] ([i915#2437])
>    [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-glk9/igt@kms_writeback@writeback-check-output-xrgb2101010.html
>     - shard-mtlp:         NOTRUN -> [SKIP][301] ([i915#2437] / [i915#9412])
>    [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-mtlp-5/igt@kms_writeback@writeback-check-output-xrgb2101010.html
> 
>   * igt@kms_writeback@writeback-fb-id:
>     - shard-dg1:          NOTRUN -> [SKIP][302] ([i915#2437])
>    [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg1-18/igt@kms_writeback@writeback-fb-id.html
> 
>   * igt@kms_writeback@writeback-fb-id-xrgb2101010:
>     - shard-dg2:          NOTRUN -> [SKIP][303] ([i915#2437] / [i915#9412])
>    [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg2-5/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
>     - shard-rkl:          NOTRUN -> [SKIP][304] ([i915#2437] / [i915#9412]) +1 other test skip
>    [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-rkl-2/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
> 
>   * igt@perf@global-sseu-config:
>     - shard-mtlp:         NOTRUN -> [SKIP][305] ([i915#7387])
>    [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-mtlp-8/igt@perf@global-sseu-config.html
> 
>   * igt@perf_pmu@event-wait@rcs0:
>     - shard-mtlp:         NOTRUN -> [SKIP][306] ([i915#3555] / [i915#8807])
>    [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-mtlp-7/igt@perf_pmu@event-wait@rcs0.html
> 
>   * igt@perf_pmu@rc6@other-idle-gt0:
>     - shard-rkl:          NOTRUN -> [SKIP][307] ([i915#8516]) +1 other test skip
>    [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-rkl-5/igt@perf_pmu@rc6@other-idle-gt0.html
> 
>   * igt@prime_vgem@basic-gtt:
>     - shard-dg2:          NOTRUN -> [SKIP][308] ([i915#3708] / [i915#4077]) +1 other test skip
>    [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg2-8/igt@prime_vgem@basic-gtt.html
> 
>   * igt@prime_vgem@basic-read:
>     - shard-dg1:          NOTRUN -> [SKIP][309] ([i915#3708])
>    [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg1-17/igt@prime_vgem@basic-read.html
> 
>   * igt@prime_vgem@basic-write:
>     - shard-dg2:          NOTRUN -> [SKIP][310] ([i915#3291] / [i915#3708]) +1 other test skip
>    [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg2-4/igt@prime_vgem@basic-write.html
>     - shard-rkl:          NOTRUN -> [SKIP][311] ([i915#3291] / [i915#3708]) +1 other test skip
>    [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-rkl-5/igt@prime_vgem@basic-write.html
> 
>   * igt@prime_vgem@coherency-gtt:
>     - shard-dg1:          NOTRUN -> [SKIP][312] ([i915#3708] / [i915#4077]) +1 other test skip
>    [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg1-15/igt@prime_vgem@coherency-gtt.html
> 
>   * igt@prime_vgem@fence-write-hang:
>     - shard-dg2:          NOTRUN -> [SKIP][313] ([i915#3708])
>    [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg2-8/igt@prime_vgem@fence-write-hang.html
> 
>   * igt@sriov_basic@bind-unbind-vf:
>     - shard-dg2:          NOTRUN -> [SKIP][314] ([i915#9917])
>    [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg2-8/igt@sriov_basic@bind-unbind-vf.html
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-on:
>     - shard-rkl:          NOTRUN -> [SKIP][315] ([i915#9917])
>    [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-rkl-2/igt@sriov_basic@enable-vfs-autoprobe-on.html
> 
>   * igt@syncobj_wait@invalid-wait-zero-handles:
>     - shard-mtlp:         NOTRUN -> [FAIL][316] ([i915#9781])
>    [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-mtlp-2/igt@syncobj_wait@invalid-wait-zero-handles.html
>     - shard-dg1:          NOTRUN -> [FAIL][317] ([i915#9781])
>    [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg1-13/igt@syncobj_wait@invalid-wait-zero-handles.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@gem_eio@reset-stress:
>     - shard-dg2:          [FAIL][318] ([i915#5784]) -> [PASS][319]
>    [318]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14997/shard-dg2-2/igt@gem_eio@reset-stress.html
>    [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg2-2/igt@gem_eio@reset-stress.html
> 
>   * igt@gem_exec_endless@dispatch@bcs0:
>     - shard-dg2:          [TIMEOUT][320] ([i915#3778] / [i915#7016]) -> [PASS][321]
>    [320]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14997/shard-dg2-11/igt@gem_exec_endless@dispatch@bcs0.html
>    [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg2-1/igt@gem_exec_endless@dispatch@bcs0.html
> 
>   * igt@gem_exec_fair@basic-pace-share@rcs0:
>     - shard-tglu:         [FAIL][322] ([i915#2842]) -> [PASS][323]
>    [322]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14997/shard-tglu-5/igt@gem_exec_fair@basic-pace-share@rcs0.html
>    [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-tglu-7/igt@gem_exec_fair@basic-pace-share@rcs0.html
> 
>   * igt@gem_lmem_swapping@basic@lmem0:
>     - shard-dg2:          [FAIL][324] ([i915#10378]) -> [PASS][325]
>    [324]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14997/shard-dg2-1/igt@gem_lmem_swapping@basic@lmem0.html
>    [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg2-8/igt@gem_lmem_swapping@basic@lmem0.html
> 
>   * igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:
>     - shard-dg1:          [FAIL][326] ([i915#3591]) -> [PASS][327]
>    [326]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14997/shard-dg1-15/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html
>    [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg1-16/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html
> 
>   * igt@i915_selftest@live@hangcheck:
>     - shard-mtlp:         [DMESG-WARN][328] ([i915#11349]) -> [PASS][329]
>    [328]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14997/shard-mtlp-4/igt@i915_selftest@live@hangcheck.html
>    [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-mtlp-5/igt@i915_selftest@live@hangcheck.html
> 
>   * igt@kms_cursor_legacy@torture-bo@pipe-a:
>     - shard-snb:          [DMESG-WARN][330] ([i915#10166]) -> [PASS][331] +1 other test pass
>    [330]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14997/shard-snb6/igt@kms_cursor_legacy@torture-bo@pipe-a.html
>    [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-snb5/igt@kms_cursor_legacy@torture-bo@pipe-a.html
> 
>   * igt@kms_flip@2x-plain-flip-fb-recreate@ab-vga1-hdmi-a1:
>     - shard-snb:          [FAIL][332] ([i915#2122]) -> [PASS][333] +2 other tests pass
>    [332]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14997/shard-snb7/igt@kms_flip@2x-plain-flip-fb-recreate@ab-vga1-hdmi-a1.html
>    [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-snb5/igt@kms_flip@2x-plain-flip-fb-recreate@ab-vga1-hdmi-a1.html
> 
>   * igt@kms_flip@blocking-wf_vblank@b-hdmi-a1:
>     - shard-rkl:          [FAIL][334] ([i915#2122]) -> [PASS][335]
>    [334]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14997/shard-rkl-5/igt@kms_flip@blocking-wf_vblank@b-hdmi-a1.html
>    [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-rkl-2/igt@kms_flip@blocking-wf_vblank@b-hdmi-a1.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1:
>     - shard-glk:          [FAIL][336] ([i915#79]) -> [PASS][337] +1 other test pass
>    [336]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14997/shard-glk4/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html
>    [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-glk8/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
>     - shard-snb:          [SKIP][338] -> [PASS][339] +3 other tests pass
>    [338]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14997/shard-snb2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
>    [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_pm_rpm@dpms-lpsp:
>     - shard-dg2:          [SKIP][340] ([i915#9519]) -> [PASS][341] +3 other tests pass
>    [340]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14997/shard-dg2-2/igt@kms_pm_rpm@dpms-lpsp.html
>    [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg2-8/igt@kms_pm_rpm@dpms-lpsp.html
> 
>   * igt@kms_pm_rpm@i2c:
>     - shard-dg2:          [FAIL][342] ([i915#8717]) -> [PASS][343]
>    [342]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14997/shard-dg2-2/igt@kms_pm_rpm@i2c.html
>    [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg2-5/igt@kms_pm_rpm@i2c.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:
>     - shard-rkl:          [FAIL][344] ([i915#9196]) -> [PASS][345]
>    [344]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14997/shard-rkl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html
>    [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-rkl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html
> 
>   
> #### Warnings ####
> 
>   * igt@gem_exec_fair@basic-pace@rcs0:
>     - shard-tglu:         [FAIL][346] ([i915#2876]) -> [FAIL][347] ([i915#2842])
>    [346]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14997/shard-tglu-7/igt@gem_exec_fair@basic-pace@rcs0.html
>    [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-tglu-7/igt@gem_exec_fair@basic-pace@rcs0.html
> 
>   * igt@i915_module_load@reload-with-fault-injection:
>     - shard-rkl:          [ABORT][348] ([i915#9820]) -> [ABORT][349] ([i915#9697] / [i915#9820])
>    [348]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14997/shard-rkl-5/igt@i915_module_load@reload-with-fault-injection.html
>    [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-rkl-3/igt@i915_module_load@reload-with-fault-injection.html
> 
>   * igt@kms_content_protection@lic-type-1:
>     - shard-snb:          [INCOMPLETE][350] ([i915#8816]) -> [SKIP][351]
>    [350]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14997/shard-snb7/igt@kms_content_protection@lic-type-1.html
>    [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-snb5/igt@kms_content_protection@lic-type-1.html
> 
>   * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu:
>     - shard-dg2:          [SKIP][352] ([i915#10433] / [i915#3458]) -> [SKIP][353] ([i915#3458]) +1 other test skip
>    [352]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14997/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu.html
>    [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu.html
> 
>   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>     - shard-rkl:          [SKIP][354] ([i915#4070] / [i915#4816]) -> [SKIP][355] ([i915#4816])
>    [354]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14997/shard-rkl-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
>    [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-rkl-3/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>   * igt@kms_psr@psr2-primary-blt:
>     - shard-dg2:          [SKIP][356] ([i915#1072] / [i915#9673] / [i915#9732]) -> [SKIP][357] ([i915#1072] / [i915#9732]) +2 other tests skip
>    [356]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14997/shard-dg2-11/igt@kms_psr@psr2-primary-blt.html
>    [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/shard-dg2-8/igt@kms_psr@psr2-primary-blt.html
> 
>   
>   [i915#10029]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10029
>   [i915#10055]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10055
>   [i915#10070]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10070
>   [i915#10139]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10139
>   [i915#10166]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10166
>   [i915#10278]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10278
>   [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
>   [i915#10378]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10378
>   [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
>   [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
>   [i915#10656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656
>   [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
>   [i915#10729]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10729
>   [i915#11078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
>   [i915#11349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349
>   [i915#1257]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257
>   [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
>   [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
>   [i915#2122]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122
>   [i915#2346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2346
>   [i915#2437]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437
>   [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
>   [i915#2587]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587
>   [i915#2672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672
>   [i915#2681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2681
>   [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
>   [i915#2842]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2842
>   [i915#2846]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2846
>   [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
>   [i915#2876]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2876
>   [i915#3023]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023
>   [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
>   [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
>   [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
>   [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
>   [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
>   [i915#3299]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
>   [i915#3323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323
>   [i915#3359]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3359
>   [i915#3458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458
>   [i915#3469]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3469
>   [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
>   [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
>   [i915#3591]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3591
>   [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
>   [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
>   [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
>   [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
>   [i915#3778]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3778
>   [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
>   [i915#4070]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4070
>   [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
>   [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
>   [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
>   [i915#4087]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4087
>   [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
>   [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
>   [i915#4215]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4215
>   [i915#4235]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235
>   [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
>   [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
>   [i915#4473]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4473
>   [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
>   [i915#4537]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537
>   [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
>   [i915#4565]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565
>   [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
>   [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
>   [i915#4816]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4816
>   [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
>   [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
>   [i915#4880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880
>   [i915#4881]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4881
>   [i915#4958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4958
>   [i915#5138]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138
>   [i915#5176]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5176
>   [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
>   [i915#5235]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5235
>   [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
>   [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
>   [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
>   [i915#5493]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5493
>   [i915#5566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5566
>   [i915#5784]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5784
>   [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
>   [i915#6228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6228
>   [i915#6268]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6268
>   [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
>   [i915#6335]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335
>   [i915#6412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412
>   [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
>   [i915#658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658
>   [i915#6590]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590
>   [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
>   [i915#6805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6805
>   [i915#6880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880
>   [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
>   [i915#7016]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7016
>   [i915#7116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116
>   [i915#7118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118
>   [i915#7387]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7387
>   [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
>   [i915#7742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7742
>   [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
>   [i915#7862]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7862
>   [i915#79]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/79
>   [i915#7984]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984
>   [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
>   [i915#8381]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381
>   [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
>   [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
>   [i915#8414]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414
>   [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
>   [i915#8430]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430
>   [i915#8516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
>   [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
>   [i915#8562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562
>   [i915#8588]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8588
>   [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
>   [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
>   [i915#8709]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709
>   [i915#8717]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8717
>   [i915#8807]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8807
>   [i915#8808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808
>   [i915#8810]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810
>   [i915#8814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814
>   [i915#8816]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8816
>   [i915#8925]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8925
>   [i915#9067]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067
>   [i915#9196]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9196
>   [i915#9311]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9311
>   [i915#9318]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318
>   [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
>   [i915#9340]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340
>   [i915#9412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412
>   [i915#9423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423
>   [i915#9424]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424
>   [i915#9519]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519
>   [i915#9531]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531
>   [i915#9673]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9673
>   [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
>   [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
>   [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
>   [i915#9697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9697
>   [i915#9723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723
>   [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
>   [i915#9766]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766
>   [i915#9781]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9781
>   [i915#9808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808
>   [i915#9809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809
>   [i915#9820]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9820
>   [i915#9833]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9833
>   [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
>   [i915#9917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917
>   [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7898 -> IGTPW_11311
> 
>   CI-20190529: 20190529
>   CI_DRM_14997: 5e45785f315938951d86af616d35a5ba08bfeabc @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_11311: 11311
>   IGT_7898: a2600953b16d6628855b89ac40f477b58933b37b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11311/index.html
