Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B95D767DE
	for <igt-dev@archiver.kernel.org>; Thu, 31 Oct 2024 15:52:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A3EB10E8D4;
	Thu, 31 Oct 2024 15:52:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b7+8QlRS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8479210E41B;
 Thu, 31 Oct 2024 15:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730389933; x=1761925933;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=TI/iX5wQNyi/AH2Bsgu68dLBap8ui2Ny6en/XERCpDo=;
 b=b7+8QlRSnbH0IL3PI5BaxSj2P8ucm6Kt+BwpEmtGffB26rUVDxiakOPq
 k48nnkn2UxycGz71OZ6yvZ09l39IVD5f+3ZozxAscEO1MPGLiYKCmj1F0
 6g9YBB6OBM1H6phn4BbCui3FWRVi7V6pKZ35KAIQPnpPyxovPNs4lb9wN
 pgspYHMpTQ9MlUjleYYSVkv7MVU/NITabwMDsCvL1cJq9PdlauWUOK2g3
 4QooDZSJv1CErGhpd71papXYEG8lJAPyWDwZKzfsqFNLrGXyoLpmPGCih
 dVyFpkFF6zfAShzgE9RMoW+ljP8/CA7idiAhjkxYlxAN+S1eIE5tsz3gp w==;
X-CSE-ConnectionGUID: dd2F6HY1QKCs/EQdCMLYdA==
X-CSE-MsgGUID: rUIYqlqnTfegw6uV7fz48w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30328028"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30328028"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 08:52:12 -0700
X-CSE-ConnectionGUID: m4nGhRKGSdSL266mxQlFCA==
X-CSE-MsgGUID: 3TVWIsLlRE6v+wVxRMV1gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="83093058"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 08:52:11 -0700
Date: Thu, 31 Oct 2024 16:52:08 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_CI=2ExeFULL=3A_failure_for_tests=2Fintel?=
 =?utf-8?Q?=2Fxe=5Fsysfs=5Ftimeslice=5Fduration=3A?= Restore preempt timeout
Message-ID: <20241031155208.6ebnbt5zadfam7aj@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20241029213621.170938-1-jonathan.cavitt@intel.com>
 <173026990116.1362925.1218150927635868051@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <173026990116.1362925.1218150927635868051@2413ebb6fbb6>
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
On 2024-10-30 at 06:31:41 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/xe_sysfs_timeslice_duration: Restore preempt timeout
> URL   : https://patchwork.freedesktop.org/series/140695/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8088_full -> XEIGTPW_11998_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_11998_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_11998_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_11998_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
>     - shard-lnl:          NOTRUN -> [SKIP][1]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11998/shard-lnl-3/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
> 
>   * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0:
>     - shard-bmg:          [PASS][2] -> [SKIP][3] +5 other tests skip
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-8/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0.html
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11998/shard-bmg-5/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0.html
> 
>   * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ac-dp2-hdmi-a3:
>     - shard-bmg:          NOTRUN -> [INCOMPLETE][4]
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11998/shard-bmg-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ac-dp2-hdmi-a3.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-dp4:
>     - shard-dg2-set2:     NOTRUN -> [ABORT][5] +1 other test abort
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11998/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-dp4.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
>     - shard-lnl:          [PASS][6] -> [DMESG-WARN][7] +3 other tests dmesg-warn
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11998/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html
> 
>   * igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3:
>     - shard-bmg:          NOTRUN -> [FAIL][8]
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11998/shard-bmg-1/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3.html
> 
>   * igt@kms_pm_dc@dc5-retention-flops:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][9]
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11998/shard-dg2-466/igt@kms_pm_dc@dc5-retention-flops.html
> 
>   * igt@kms_psr@psr-cursor-blt@edp-1:
>     - shard-lnl:          [PASS][10] -> [FAIL][11] +2 other tests fail
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-lnl-3/igt@kms_psr@psr-cursor-blt@edp-1.html
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11998/shard-lnl-6/igt@kms_psr@psr-cursor-blt@edp-1.html
> 
>   * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm:
>     - shard-bmg:          [PASS][12] -> [FAIL][13]
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-3/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm.html
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11998/shard-bmg-7/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
>     - shard-bmg:          [SKIP][14] ([Intel XE#2327]) -> [SKIP][15] +2 other tests skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-2/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11998/shard-bmg-5/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
>     - shard-bmg:          [SKIP][16] ([Intel XE#1124]) -> [SKIP][17]
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11998/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:
>     - shard-bmg:          [SKIP][18] ([Intel XE#2887]) -> [SKIP][19] +5 other tests skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-8/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11998/shard-bmg-5/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html
> 
>   * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
>     - shard-bmg:          [SKIP][20] ([Intel XE#2423]) -> [INCOMPLETE][21]
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11998/shard-bmg-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
>     - shard-bmg:          [SKIP][22] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][23] +1 other test skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11998/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling:
>     - shard-bmg:          [SKIP][24] ([Intel XE#2231]) -> [SKIP][25]
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-8/igt@kms_flip_tiling@flip-change-tiling.html
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11998/shard-bmg-5/igt@kms_flip_tiling@flip-change-tiling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
>     - shard-bmg:          [SKIP][26] ([Intel XE#2311]) -> [SKIP][27] +12 other tests skip
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11998/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
>     - shard-bmg:          [FAIL][28] ([Intel XE#2333]) -> [SKIP][29] +3 other tests skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11998/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
>     - shard-bmg:          [SKIP][30] ([Intel XE#2313]) -> [SKIP][31] +3 other tests skip
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11998/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_joiner@invalid-modeset-big-joiner:
>     - shard-bmg:          [SKIP][32] ([Intel XE#346]) -> [SKIP][33]
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-4/igt@kms_joiner@invalid-modeset-big-joiner.html
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11998/shard-bmg-5/igt@kms_joiner@invalid-modeset-big-joiner.html
> 
>   * igt@kms_pm_backlight@fade-with-suspend:
>     - shard-bmg:          [SKIP][34] ([Intel XE#870]) -> [SKIP][35]
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-1/igt@kms_pm_backlight@fade-with-suspend.html
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11998/shard-bmg-5/igt@kms_pm_backlight@fade-with-suspend.html
> 
>   * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
>     - shard-bmg:          [SKIP][36] ([Intel XE#1489]) -> [SKIP][37] +5 other tests skip
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-2/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11998/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr@psr2-primary-render:
>     - shard-bmg:          [SKIP][38] ([Intel XE#2234]) -> [SKIP][39]
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-7/igt@kms_psr@psr2-primary-render.html
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11998/shard-bmg-5/igt@kms_psr@psr2-primary-render.html
> 
>   * igt@kms_psr@psr2-suspend:
>     - shard-bmg:          [SKIP][40] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][41] +5 other tests skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-3/igt@kms_psr@psr2-suspend.html
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11998/shard-bmg-5/igt@kms_psr@psr2-suspend.html
> 
>   * igt@xe_exec_fault_mode@many-userptr-invalidate-race:
>     - shard-bmg:          [SKIP][42] ([Intel XE#1130]) -> [FAIL][43] +2 other tests fail
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-5/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11998/shard-bmg-7/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html
> 

These are unrelated to changed tests.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_11998_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@core_hotunplug@unplug-rescan:
>     - shard-bmg:          [PASS][44] -> [SKIP][45] ([Intel XE#1885]) +1 other test skip
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-8/igt@core_hotunplug@unplug-rescan.html
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11998/shard-bmg-5/igt@core_hotunplug@unplug-rescan.html
> 
>   * igt@fbdev@info:
>     - shard-bmg:          [PASS][46] -> [SKIP][47] ([Intel XE#2134]) +1 other test skip
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/shard-bmg-3/igt@fbdev@info.html
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11998/shard-bmg-5/igt@fbdev@info.html
> 

...cut...

>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
>   [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
>   [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8088 -> IGTPW_11998
>   * Linux: xe-2139-fb2691707e2d5a8c704ae5e48bc5a314a308b0e0 -> xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f
> 
>   IGTPW_11998: 89299f1d1051614462c7ed4761758addaa69bd7c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8088: 0030d5bc92b8e4ac991db1c88af1f0ad7593812a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-2139-fb2691707e2d5a8c704ae5e48bc5a314a308b0e0: fb2691707e2d5a8c704ae5e48bc5a314a308b0e0
>   xe-2140-b97473387ce132222c9b71f7cf39c2cd814cbb6f: b97473387ce132222c9b71f7cf39c2cd814cbb6f
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11998/index.html
