Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04200D5CCA5
	for <igt-dev@archiver.kernel.org>; Wed, 30 Oct 2024 12:41:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A89DB10E7A5;
	Wed, 30 Oct 2024 12:41:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S2r+HXtT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BACD810E7A4;
 Wed, 30 Oct 2024 12:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730292102; x=1761828102;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/E3xCIAuZs7RrfWCh7OUknTASrhy1W0wkkPevUdzj7g=;
 b=S2r+HXtTQV3oxmQLijw1/x70vpXHL5s3ZA1j0Ua1bt34Uf5qrH6TkxME
 YnE+wMyJYr2xRfTx4RsYRmajoXJ3R9wig4D4H/WaVrufLVsnlEXrirj//
 R6Np8RhMAIsxeQr8xKoOvGz+bCickPPRAwf1destMclqAT30xsuVViQSB
 hc9mqJtuQaSclDGtBBa9RTbV347VWkhL2w/SbVd1lbkXvbPDz6y0c4DZe
 3z4MDpFPJHkhzcT464UvAHcvgkduH2m6GpZ5Z4KMWsLqSn9WwhH4iCqwj
 EDt2VfO5uweIGw+ISRSaSDUi+9VDyPctZFchl/yBOTSZhnCl0uS8xlrst A==;
X-CSE-ConnectionGUID: 4PDXbEM1RDOtbdBWTrhm5A==
X-CSE-MsgGUID: EaemgQuGQ4WJx6l0Y/bspQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41091051"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="41091051"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2024 05:41:42 -0700
X-CSE-ConnectionGUID: /xQ7cY//Q5W9jjrzD45pAg==
X-CSE-MsgGUID: /hbro6nnSi+5jAp49Itn9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; d="scan'208";a="86910022"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 05:41:40 -0700
Date: Wed, 30 Oct 2024 13:41:25 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIENJLnhlRlVMTA==?= =?utf-8?Q?=3A?= failure for
 rename drm_fdinfo into i915_fdinfo (rev3)
Message-ID: <20241030124125.jwljtk6q33xmqszc@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20241028174636.142662-1-kamil.konieczny@linux.intel.com>
 <173023276456.1361174.16600074827951586374@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <173023276456.1361174.16600074827951586374@2413ebb6fbb6>
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
On 2024-10-29 at 20:12:44 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: rename drm_fdinfo into i915_fdinfo (rev3)
> URL   : https://patchwork.freedesktop.org/series/140053/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8087_full -> XEIGTPW_11993_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_11993_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_11993_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_11993_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-dp-2:
>     - shard-bmg:          [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-dp-2.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11993/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-dp-2.html
> 
>   * igt@kms_big_fb@x-tiled-16bpp-rotate-0:
>     - shard-bmg:          [PASS][3] -> [SKIP][4] +6 other tests skip
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-1/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11993/shard-bmg-5/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][5]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11993/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_cursor_legacy@torture-move@pipe-d:
>     - shard-dg2-set2:     [PASS][6] -> [DMESG-WARN][7] +1 other test dmesg-warn
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-dg2-434/igt@kms_cursor_legacy@torture-move@pipe-d.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11993/shard-dg2-435/igt@kms_cursor_legacy@torture-move@pipe-d.html
> 
>   * igt@kms_pm_rpm@legacy-planes-dpms@plane-50:
>     - shard-lnl:          [PASS][8] -> [DMESG-WARN][9]
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-lnl-6/igt@kms_pm_rpm@legacy-planes-dpms@plane-50.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11993/shard-lnl-4/igt@kms_pm_rpm@legacy-planes-dpms@plane-50.html
> 
>   * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race:
>     - shard-bmg:          [PASS][10] -> [FAIL][11] +3 other tests fail
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-2/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11993/shard-bmg-4/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm:
>     - shard-lnl:          [PASS][12] -> [FAIL][13] +2 other tests fail
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-lnl-7/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11993/shard-lnl-3/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
>     - shard-bmg:          [SKIP][14] ([Intel XE#2327]) -> [SKIP][15] +1 other test skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-7/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11993/shard-bmg-5/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
>     - shard-bmg:          [SKIP][16] ([Intel XE#1124]) -> [SKIP][17] +2 other tests skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11993/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:
>     - shard-bmg:          [SKIP][18] ([Intel XE#2887]) -> [SKIP][19]
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-7/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11993/shard-bmg-5/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
>     - shard-bmg:          [SKIP][20] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][21] +3 other tests skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11993/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:
>     - shard-bmg:          [SKIP][22] ([Intel XE#2311]) -> [SKIP][23] +7 other tests skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11993/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt:
>     - shard-bmg:          [SKIP][24] ([Intel XE#2231]) -> [SKIP][25] +1 other test skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt.html
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11993/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
>     - shard-bmg:          [FAIL][26] ([Intel XE#2333]) -> [SKIP][27] +2 other tests skip
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11993/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
>     - shard-bmg:          [SKIP][28] ([Intel XE#2313]) -> [SKIP][29] +2 other tests skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11993/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_joiner@invalid-modeset-big-joiner:
>     - shard-bmg:          [SKIP][30] ([Intel XE#346]) -> [SKIP][31]
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@kms_joiner@invalid-modeset-big-joiner.html
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11993/shard-bmg-5/igt@kms_joiner@invalid-modeset-big-joiner.html
> 
>   * igt@kms_pm_lpsp@kms-lpsp:
>     - shard-bmg:          [SKIP][32] ([Intel XE#2499]) -> [SKIP][33]
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-1/igt@kms_pm_lpsp@kms-lpsp.html
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11993/shard-bmg-5/igt@kms_pm_lpsp@kms-lpsp.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
>     - shard-bmg:          [SKIP][34] ([Intel XE#1489]) -> [SKIP][35] +4 other tests skip
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11993/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html
> 
>   * igt@kms_psr@fbc-psr-primary-render:
>     - shard-bmg:          [SKIP][36] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][37] +3 other tests skip
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-1/igt@kms_psr@fbc-psr-primary-render.html
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11993/shard-bmg-5/igt@kms_psr@fbc-psr-primary-render.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch:
>     - shard-bmg:          [SKIP][38] ([Intel XE#1130]) -> [FAIL][39] +1 other test fail
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-5/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch.html
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11993/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch.html
> 

These are unrelated to i915 test i915_fdinfo, I will restart
testing as i915 BAT were also failed.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_11993_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@core_hotunplug@unplug-rescan:
>     - shard-bmg:          [PASS][40] -> [SKIP][41] ([Intel XE#1885]) +1 other test skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8087/shard-bmg-8/igt@core_hotunplug@unplug-rescan.html
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11993/shard-bmg-5/igt@core_hotunplug@unplug-rescan.html
> 

...cut...

> 
> Build changes
> -------------
> 
>   * IGT: IGT_8087 -> IGTPW_11993
>   * Linux: xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab -> xe-2137-95fd9af8bb5389f9b5a639d567ef5c3e43e25682
> 
>   IGTPW_11993: de88ef108822411b2a9bf88a9c9b7616f118934e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8087: 7abd9c49a49a9ff1f3300d7c51a92a5af8a789f1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-2136-738c18d8599dce736da8b6958f96d2eac08a36ab: 738c18d8599dce736da8b6958f96d2eac08a36ab
>   xe-2137-95fd9af8bb5389f9b5a639d567ef5c3e43e25682: 95fd9af8bb5389f9b5a639d567ef5c3e43e25682
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11993/index.html
