Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 984F5C021A0
	for <igt-dev@archiver.kernel.org>; Mon, 17 Feb 2025 08:53:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 599C310E26D;
	Mon, 17 Feb 2025 08:53:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AePAi67D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5ACD10E26D;
 Mon, 17 Feb 2025 08:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739782397; x=1771318397;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=lkrKQ35A2c+/71Q9SGwHoJ4xc0161hp0k98wvj/cgk8=;
 b=AePAi67D+pFTAAnXrPQSnrs/oHAzwPnpO3FQOJpB5qCtfzSSUd3MuuPQ
 tYXlclA+lmWEYPNI5vf2/Gu+gW6TiZK0surVnIyk2fgqcLDlw7oi8C6hc
 1YLE06YnQthcK2y72rMo4gbt2RAAZN+bUdZafttB0yvu6NLtF8zqAdb4b
 Pm0xm0dWJ88QODOuk08TaUBG3ndeSgPHW5InCqgLcnI0n9k79qNEA1yIe
 kMKSX2ykeVF6Y2a4DMMBG/A2mMYm70QXK9oUM99mlYmlbCGB1vmjk/NIF
 fQ42K9CP3LNsRuOg0Gp867o0xUq6oNf8qy50dO3Mp6euQ6KXm5+Cg5bry w==;
X-CSE-ConnectionGUID: RUR6JNPWRTm3fSwDUww29Q==
X-CSE-MsgGUID: +F9PXSJXTtC+oSl7fIlKkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="44383845"
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; d="scan'208";a="44383845"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 00:53:16 -0800
X-CSE-ConnectionGUID: e+15mGNyQxqP1bO18Av1Zw==
X-CSE-MsgGUID: Jq4Am4kpRIqyR300t1+x9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="118982900"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 00:53:15 -0800
Date: Mon, 17 Feb 2025 09:53:12 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1cg==?= =?utf-8?Q?e?= for
 tests/kms_color: Disable CTM at the end of CTM tests
Message-ID: <20250217085312.nlrdcoxgifrgmtzu@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20250214-disable-cwb-v2-1-d01f7a100748@quicinc.com>
 <173968591203.2871091.1327637420666184361@b555e5b46a47>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <173968591203.2871091.1327637420666184361@b555e5b46a47>
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
On 2025-02-16 at 06:05:12 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/kms_color: Disable CTM at the end of CTM tests
> URL   : https://patchwork.freedesktop.org/series/144911/
> State : failure

Unrelated,

Regards,
Kamil

> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8230_full -> XEIGTPW_12605_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_12605_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_12605_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_12605_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_color@legacy-gamma-reset:
>     - shard-bmg:          [PASS][1] -> [SKIP][2] +23 other tests skip
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-4/igt@kms_color@legacy-gamma-reset.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12605/shard-bmg-5/igt@kms_color@legacy-gamma-reset.html
> 
>   * igt@kms_flip@dpms-vs-vblank-race:
>     - shard-dg2-set2:     [PASS][3] -> [DMESG-WARN][4] +1 other test dmesg-warn
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-463/igt@kms_flip@dpms-vs-vblank-race.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12605/shard-dg2-434/igt@kms_flip@dpms-vs-vblank-race.html
>     - shard-bmg:          [PASS][5] -> [DMESG-WARN][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-5/igt@kms_flip@dpms-vs-vblank-race.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12605/shard-bmg-4/igt@kms_flip@dpms-vs-vblank-race.html
> 
>   * igt@kms_joiner@invalid-modeset-force-big-joiner:
>     - shard-dg2-set2:     [PASS][7] -> [SKIP][8]
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-433/igt@kms_joiner@invalid-modeset-force-big-joiner.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12605/shard-dg2-464/igt@kms_joiner@invalid-modeset-force-big-joiner.html
> 
>   * igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd:
>     - shard-bmg:          [PASS][9] -> [DMESG-FAIL][10]
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-4/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12605/shard-bmg-5/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd.html
> 
>   * igt@xe_exec_balancer@many-parallel-userptr-invalidate:
>     - shard-bmg:          NOTRUN -> [SKIP][11] +9 other tests skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12605/shard-bmg-5/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
>     - shard-bmg:          [SKIP][12] ([Intel XE#367]) -> [SKIP][13]
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-5/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12605/shard-bmg-5/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs:
>     - shard-bmg:          [SKIP][14] ([Intel XE#2887]) -> [SKIP][15] +2 other tests skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs.html
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12605/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs.html
> 
>   * igt@kms_chamelium_color@gamma:
>     - shard-bmg:          [SKIP][16] ([Intel XE#2325]) -> [SKIP][17]
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-5/igt@kms_chamelium_color@gamma.html
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12605/shard-bmg-5/igt@kms_chamelium_color@gamma.html
> 
>   * igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
>     - shard-bmg:          [SKIP][18] ([Intel XE#2252]) -> [SKIP][19]
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-1/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12605/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-blt:
>     - shard-bmg:          [SKIP][20] ([Intel XE#2311]) -> [SKIP][21]
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-blt.html
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12605/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt:
>     - shard-bmg:          [SKIP][22] ([Intel XE#2312]) -> [SKIP][23]
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12605/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render:
>     - shard-bmg:          [SKIP][24] ([Intel XE#2313]) -> [SKIP][25]
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render.html
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12605/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
>     - shard-bmg:          [SKIP][26] ([Intel XE#2763]) -> [SKIP][27]
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-7/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12605/shard-bmg-5/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
>     - shard-bmg:          [SKIP][28] ([Intel XE#1489]) -> [SKIP][29]
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12605/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr2_su@frontbuffer-xrgb8888:
>     - shard-bmg:          [SKIP][30] ([Intel XE#2387]) -> [SKIP][31]
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-4/igt@kms_psr2_su@frontbuffer-xrgb8888.html
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12605/shard-bmg-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html
> 
>   * igt@kms_psr@fbc-psr2-basic:
>     - shard-bmg:          [SKIP][32] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][33] +1 other test skip
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-5/igt@kms_psr@fbc-psr2-basic.html
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12605/shard-bmg-5/igt@kms_psr@fbc-psr2-basic.html
> 
>   * igt@kms_psr@psr2-primary-render:
>     - shard-bmg:          [SKIP][34] ([Intel XE#2234]) -> [SKIP][35]
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-4/igt@kms_psr@psr2-primary-render.html
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12605/shard-bmg-5/igt@kms_psr@psr2-primary-render.html
> 
>   * igt@xe_eudebug@basic-vm-access:
>     - shard-bmg:          [SKIP][36] ([Intel XE#2905]) -> [SKIP][37]
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-1/igt@xe_eudebug@basic-vm-access.html
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12605/shard-bmg-5/igt@xe_eudebug@basic-vm-access.html
> 
>   * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
>     - shard-bmg:          [SKIP][38] ([Intel XE#2322]) -> [SKIP][39] +1 other test skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-4/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12605/shard-bmg-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * {igt@kms_pipe_stress@stress-xrgb8888-ytiled}:
>     - shard-bmg:          NOTRUN -> [SKIP][40]
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12605/shard-bmg-4/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][41]
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12605/shard-dg2-464/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
>     - shard-lnl:          NOTRUN -> [SKIP][42]
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12605/shard-lnl-3/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_12605_full that come from known issues:
> 
...cut...

>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8230 -> IGTPW_12605
>   * Linux: xe-2665-57457d93f156d8b4bdff8d138127d81b8f97d8c9 -> xe-2669-cbd747025a1ef985e1ebfa040aa0da4a5d77aacd
> 
>   IGTPW_12605: 958298e5eaff0eaeb07c632b08acf4cbb191e84e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8230: 8230
>   xe-2665-57457d93f156d8b4bdff8d138127d81b8f97d8c9: 57457d93f156d8b4bdff8d138127d81b8f97d8c9
>   xe-2669-cbd747025a1ef985e1ebfa040aa0da4a5d77aacd: cbd747025a1ef985e1ebfa040aa0da4a5d77aacd
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12605/index.html
