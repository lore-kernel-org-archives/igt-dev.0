Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDF5EC3DA64
	for <igt-dev@archiver.kernel.org>; Wed, 31 Jul 2024 11:40:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EE6410E52A;
	Wed, 31 Jul 2024 11:40:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G95iyxVw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E84010E137;
 Wed, 31 Jul 2024 11:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722426049; x=1753962049;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1SmIA3TEC64OS/MkXO79AyVknSf4Xf7OlxjDqAN5GKc=;
 b=G95iyxVwFAfkKauUee3yRCfFauuFOvXSTUOvbJfyU2DrFwikrS4ZxBoG
 FPwZs7444Z9RjU8cYcKLGuCwwTjdOQN4Mf7GAds+zQ5fjoIZhbDobVPRa
 1+CdBocpFxC6B66uOYu2UYl51esxfmDAWLZOlLib6n+prtQ8JK0oWegjJ
 iYneNZl5mLy16kbHFuPP6dfrrlvMkYB8iBW/VsrZ50Ul/wTV8TlV8M+ag
 hPl0l5njL1NqjhxXkCqZecEONPw9v7wmc9kphZB3fiCHLPhDpZGCDvyYy
 YStkL6BmJu5OWJz2/8N6TOwulcVhK4MvNjmbNSsDgTYdDRNEddkz45JTp g==;
X-CSE-ConnectionGUID: a0JMokG0RsWpXUHT9tW7Ow==
X-CSE-MsgGUID: v2Ac/NH0SwGY/p6h5AjdWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="20436483"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="20436483"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 04:40:48 -0700
X-CSE-ConnectionGUID: t4Ws+jsAQS6gGj/51ZCi6g==
X-CSE-MsgGUID: XqsHaJoJRhSdNfeq375fdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="59725074"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2024 04:40:47 -0700
Date: Wed, 31 Jul 2024 13:40:28 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_CI=2ExeFULL=3A_failure_fo?= =?utf-8?Q?r?=
 benchmarks/gem_wsim: Extend engine selection syntax (rev3)
Message-ID: <20240731114028.qb62wzhk2bq35q2t@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20240729175219.1636694-1-marcin.bernatowicz@linux.intel.com>
 <172229842524.426419.5155845128696095809@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <172229842524.426419.5155845128696095809@2413ebb6fbb6>
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
On 2024-07-30 at 00:13:45 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: benchmarks/gem_wsim: Extend engine selection syntax (rev3)
> URL   : https://patchwork.freedesktop.org/series/128780/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_7942_full -> XEIGTPW_11487_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_11487_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_11487_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (3 -> 3)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_11487_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@core_setmaster@master-drop-set-user:
>     - shard-dg2-set2:     [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@core_setmaster@master-drop-set-user.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11487/shard-dg2-463/igt@core_setmaster@master-drop-set-user.html
> 
>   * igt@kms_big_fb@x-tiled-addfb-size-overflow:
>     - shard-lnl:          [PASS][3] -> [SKIP][4] +67 other tests skip
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_big_fb@x-tiled-addfb-size-overflow.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11487/shard-lnl-8/igt@kms_big_fb@x-tiled-addfb-size-overflow.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:
>     - shard-lnl:          NOTRUN -> [SKIP][5] +16 other tests skip
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11487/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html
> 
>   * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
>     - shard-lnl:          [PASS][6] -> [FAIL][7] +3 other tests fail
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11487/shard-lnl-2/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
> 
>   * igt@xe_pm@s4-basic:
>     - shard-dg2-set2:     [PASS][8] -> [DMESG-WARN][9] +1 other test dmesg-warn
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@xe_pm@s4-basic.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11487/shard-dg2-434/igt@xe_pm@s4-basic.html
> 

This and warnings below are note related to benchmark change
as it was not even run (it is not a test).

Regards,
Kamil

>   
> #### Warnings ####
> 
>   * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
>     - shard-lnl:          [SKIP][10] ([Intel XE#660]) -> [SKIP][11]
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11487/shard-lnl-7/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-lnl:          [FAIL][12] ([Intel XE#1659]) -> [SKIP][13]
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11487/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@linear-16bpp-rotate-90:
>     - shard-lnl:          [SKIP][14] ([Intel XE#1407]) -> [SKIP][15] +2 other tests skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_big_fb@linear-16bpp-rotate-90.html
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11487/shard-lnl-7/igt@kms_big_fb@linear-16bpp-rotate-90.html
> 
>   * igt@kms_big_fb@linear-64bpp-rotate-0:
>     - shard-lnl:          [DMESG-WARN][16] ([Intel XE#1725]) -> [SKIP][17]
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@kms_big_fb@linear-64bpp-rotate-0.html
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11487/shard-lnl-3/igt@kms_big_fb@linear-64bpp-rotate-0.html
> 
>   * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
>     - shard-lnl:          [SKIP][18] ([Intel XE#1124]) -> [SKIP][19] +4 other tests skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-7/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11487/shard-lnl-7/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:
>     - shard-lnl:          [SKIP][20] ([Intel XE#1399]) -> [SKIP][21] +7 other tests skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11487/shard-lnl-2/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html
> 
>   * igt@kms_chamelium_color@ctm-blue-to-red:
>     - shard-lnl:          [SKIP][22] ([Intel XE#306]) -> [SKIP][23] +1 other test skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-5/igt@kms_chamelium_color@ctm-blue-to-red.html
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11487/shard-lnl-3/igt@kms_chamelium_color@ctm-blue-to-red.html
> 
>   * igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
>     - shard-lnl:          [SKIP][24] ([Intel XE#373]) -> [SKIP][25] +5 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-2/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11487/shard-lnl-7/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x170:
>     - shard-lnl:          [SKIP][26] ([Intel XE#1413]) -> [SKIP][27]
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_cursor_crc@cursor-random-512x170.html
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11487/shard-lnl-3/igt@kms_cursor_crc@cursor-random-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
>     - shard-lnl:          [SKIP][28] ([Intel XE#1424]) -> [SKIP][29] +3 other tests skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-2/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11487/shard-lnl-7/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
> 
>   * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
>     - shard-lnl:          [SKIP][30] ([Intel XE#1508] / [Intel XE#599]) -> [SKIP][31]
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11487/shard-lnl-3/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
> 
>   * igt@kms_dsc@dsc-basic:
>     - shard-lnl:          [SKIP][32] ([Intel XE#599]) -> [SKIP][33] +2 other tests skip
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-4/igt@kms_dsc@dsc-basic.html
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11487/shard-lnl-3/igt@kms_dsc@dsc-basic.html
> 
>   * igt@kms_flip@2x-modeset-vs-vblank-race:
>     - shard-lnl:          [SKIP][34] ([Intel XE#1421]) -> [SKIP][35] +3 other tests skip
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@kms_flip@2x-modeset-vs-vblank-race.html
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11487/shard-lnl-3/igt@kms_flip@2x-modeset-vs-vblank-race.html
> 
>   * igt@kms_flip@bo-too-big-interruptible:
>     - shard-lnl:          [TIMEOUT][36] ([Intel XE#1504]) -> [SKIP][37]
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@kms_flip@bo-too-big-interruptible.html
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11487/shard-lnl-7/igt@kms_flip@bo-too-big-interruptible.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
>     - shard-lnl:          [SKIP][38] ([Intel XE#1397] / [Intel XE#1745]) -> [SKIP][39] +1 other test skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11487/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
>     - shard-lnl:          [SKIP][40] ([Intel XE#1401] / [Intel XE#1745]) -> [SKIP][41] +3 other tests skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11487/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:
>     - shard-lnl:          [SKIP][42] ([Intel XE#651]) -> [SKIP][43] +7 other tests skip
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11487/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:
>     - shard-lnl:          [SKIP][44] ([Intel XE#656]) -> [SKIP][45] +21 other tests skip
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11487/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html
> 
>   * igt@kms_invalid_mode@clock-too-high:
>     - shard-lnl:          [SKIP][46] ([Intel XE#1450] / [Intel XE#599]) -> [SKIP][47]
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_invalid_mode@clock-too-high.html
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11487/shard-lnl-7/igt@kms_invalid_mode@clock-too-high.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
>     - shard-lnl:          [SKIP][48] ([Intel XE#498]) -> [SKIP][49] +1 other test skip
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-5/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11487/shard-lnl-7/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html
> 
>   * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
>     - shard-lnl:          [SKIP][50] ([Intel XE#2318]) -> [SKIP][51]
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11487/shard-lnl-3/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html
> 
>   * igt@kms_pm_rpm@dpms-non-lpsp:
>     - shard-lnl:          [SKIP][52] ([Intel XE#1439]) -> [SKIP][53]
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-4/igt@kms_pm_rpm@dpms-non-lpsp.html
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11487/shard-lnl-7/igt@kms_pm_rpm@dpms-non-lpsp.html
> 
>   * igt@kms_psr2_su@page_flip-xrgb8888:
>     - shard-lnl:          [SKIP][54] ([Intel XE#1128]) -> [SKIP][55]
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_psr2_su@page_flip-xrgb8888.html
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11487/shard-lnl-7/igt@kms_psr2_su@page_flip-xrgb8888.html
> 
>   * igt@kms_psr@fbc-pr-no-drrs:
>     - shard-lnl:          [SKIP][56] ([Intel XE#1406]) -> [SKIP][57] +3 other tests skip
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-4/igt@kms_psr@fbc-pr-no-drrs.html
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11487/shard-lnl-3/igt@kms_psr@fbc-pr-no-drrs.html
> 
>   * igt@kms_setmode@invalid-clone-single-crtc:
>     - shard-lnl:          [SKIP][58] ([Intel XE#1435]) -> [SKIP][59]
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-7/igt@kms_setmode@invalid-clone-single-crtc.html
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11487/shard-lnl-7/igt@kms_setmode@invalid-clone-single-crtc.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-lnl:          [SKIP][60] ([Intel XE#362]) -> [SKIP][61]
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_tiled_display@basic-test-pattern.html
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11487/shard-lnl-8/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_writeback@writeback-invalid-parameters:
>     - shard-lnl:          [SKIP][62] ([Intel XE#756]) -> [SKIP][63]
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-4/igt@kms_writeback@writeback-invalid-parameters.html
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11487/shard-lnl-7/igt@kms_writeback@writeback-invalid-parameters.html
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-off:
>     - shard-lnl:          [SKIP][64] ([Intel XE#1091]) -> [SKIP][65]
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-4/igt@sriov_basic@enable-vfs-autoprobe-off.html
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11487/shard-lnl-8/igt@sriov_basic@enable-vfs-autoprobe-off.html
> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * {igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p}:
>     - shard-lnl:          [SKIP][66] ([Intel XE#1512]) -> [SKIP][67]
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-5/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11487/shard-lnl-3/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
> 
>   * {igt@xe_oa@invalid-oa-exponent}:
>     - shard-dg2-set2:     [SKIP][68] ([Intel XE#1201]) -> [SKIP][69] +2 other tests skip
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@xe_oa@invalid-oa-exponent.html
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11487/shard-dg2-432/igt@xe_oa@invalid-oa-exponent.html
> 
>   * {igt@xe_oa@invalid-remove-userspace-config}:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][70]
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11487/shard-dg2-432/igt@xe_oa@invalid-remove-userspace-config.html
>     - shard-lnl:          NOTRUN -> [SKIP][71] +4 other tests skip
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11487/shard-lnl-5/igt@xe_oa@invalid-remove-userspace-config.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_11487_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@core_hotunplug@hotreplug:
>     - shard-dg2-set2:     [PASS][72] -> [SKIP][73] ([Intel XE#1201] / [Intel XE#1885])
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@core_hotunplug@hotreplug.html
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11487/shard-dg2-436/igt@core_hotunplug@hotreplug.html
>     - shard-lnl:          [PASS][74] -> [SKIP][75] ([Intel XE#1885])
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@core_hotunplug@hotreplug.html
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11487/shard-lnl-8/igt@core_hotunplug@hotreplug.html
> 
...cut...
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7942 -> IGTPW_11487
>   * Linux: xe-1684-3a93d4a1f4872fbdfe43e9b7f1a7dfd9236a642d -> xe-1685-e64cee35967e4b08dd7f3b3ad6f110927c4699a9
> 
>   IGTPW_11487: 11487
>   IGT_7942: 0f02dc176959e6296866b1bafd3982e277a5e44b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1684-3a93d4a1f4872fbdfe43e9b7f1a7dfd9236a642d: 3a93d4a1f4872fbdfe43e9b7f1a7dfd9236a642d
>   xe-1685-e64cee35967e4b08dd7f3b3ad6f110927c4699a9: e64cee35967e4b08dd7f3b3ad6f110927c4699a9
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11487/index.html
