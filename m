Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5D68C52D6D
	for <igt-dev@archiver.kernel.org>; Fri,  2 Aug 2024 12:47:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D83610E09B;
	Fri,  2 Aug 2024 12:47:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="McZqcJDf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F303410E045;
 Fri,  2 Aug 2024 12:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722602833; x=1754138833;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=TVxv8P5DbjySxffnVciyIXc6McpLpIcycL3dKNGWfvs=;
 b=McZqcJDf9IkTXeP+WmYjkF8BuLPSbdA0yrueaNwiPrIeIb6em75KVoCl
 HPTlUsNNngaPCWJ0NwGhDbfTWm1td0lAF8eR/CsVr9Kn4Ya+lgnnz0AgR
 dWJGoNuUJEcc9z0ARjJpxtRo+d+6kFvJikrB9q4ZX5zMn20UsE7ZjwqS9
 Q5jeZfC1owDgv1RuIDThg1fOjWNknhnoeBSj91i3VDnzi0xNgL+YxmG0x
 4+zfGLPwtt1jJAFMFhTv6u1EuDt7urECu+f8jFUJGZmW6xQl90PrhJ1YY
 ubTTZZSuFRYPZGR5iOiyuKwLVCo3XJU5cZwxRnkj/RvZr6UTkWuDqFWmT Q==;
X-CSE-ConnectionGUID: cDiI432IRAyWeSPgcZ57EQ==
X-CSE-MsgGUID: yCQqSSkvTKOhIqlssIaf8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="31768791"
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800"; d="scan'208";a="31768791"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2024 05:47:12 -0700
X-CSE-ConnectionGUID: X2tVxtSWQpSm9Ag/rW4K7g==
X-CSE-MsgGUID: ouNepylFSjGFaVQ/XnSX5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800"; d="scan'208";a="55987819"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2024 05:47:11 -0700
Date: Fri, 2 Aug 2024 14:47:07 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIENJLnhlRlVMTDogZmFpbHVy?= =?utf-8?Q?e?= for
 tests/intel/drm_fdinfo: Fix type comparison warning
Message-ID: <20240802124707.ufcitfnlbpc2qhen@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20240802105120.586924-1-marcin.bernatowicz@linux.intel.com>
 <172260223344.503067.11382576105222818378@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <172260223344.503067.11382576105222818378@2413ebb6fbb6>
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
On 2024-08-02 at 12:37:13 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/drm_fdinfo: Fix type comparison warning
> URL   : https://patchwork.freedesktop.org/series/136842/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_7953_full -> XEIGTPW_11524_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_11524_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_11524_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_11524_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@core_hotunplug@unplug-rescan:
>     - shard-lnl:          [PASS][1] -> [SKIP][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7953/shard-lnl-5/igt@core_hotunplug@unplug-rescan.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11524/shard-lnl-3/igt@core_hotunplug@unplug-rescan.html
> 
>   * igt@kms_big_fb@y-tiled-addfb:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][3]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11524/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:
>     - shard-dg2-set2:     [PASS][4] -> [SKIP][5] +4 other tests skip
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7953/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11524/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html
> 
>   * igt@kms_pm_rpm@modeset-lpsp-stress:
>     - shard-lnl:          NOTRUN -> [SKIP][6]
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11524/shard-lnl-8/igt@kms_pm_rpm@modeset-lpsp-stress.html
> 
>   * igt@xe_exec_fault_mode@many-bindexecqueue:
>     - shard-lnl:          [PASS][7] -> [TIMEOUT][8]
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7953/shard-lnl-5/igt@xe_exec_fault_mode@many-bindexecqueue.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11524/shard-lnl-5/igt@xe_exec_fault_mode@many-bindexecqueue.html
> 
>   * igt@xe_exec_fault_mode@once-rebind-prefetch:
>     - shard-lnl:          [PASS][9] -> [FAIL][10] +3 other tests fail
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7953/shard-lnl-3/igt@xe_exec_fault_mode@once-rebind-prefetch.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11524/shard-lnl-5/igt@xe_exec_fault_mode@once-rebind-prefetch.html
> 
>   * igt@xe_exec_threads@threads-bal-fd-rebind:
>     - shard-dg2-set2:     [PASS][11] -> [FAIL][12]
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7953/shard-dg2-436/igt@xe_exec_threads@threads-bal-fd-rebind.html
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11524/shard-dg2-432/igt@xe_exec_threads@threads-bal-fd-rebind.html
> 
>   
> #### Warnings ####
> 
>   * igt@core_hotunplug@hotrebind-lateclose:
>     - shard-lnl:          [ABORT][13] ([Intel XE#2418]) -> [SKIP][14]
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7953/shard-lnl-2/igt@core_hotunplug@hotrebind-lateclose.html
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11524/shard-lnl-8/igt@core_hotunplug@hotrebind-lateclose.html
> 
>   * igt@kms_big_fb@linear-32bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][15] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][16]
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7953/shard-dg2-434/igt@kms_big_fb@linear-32bpp-rotate-270.html
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11524/shard-dg2-432/igt@kms_big_fb@linear-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-dg2-set2:     [SKIP][17] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][18]
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7953/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11524/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:
>     - shard-dg2-set2:     [SKIP][19] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][20]
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7953/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11524/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
>     - shard-dg2-set2:     [SKIP][21] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][22]
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7953/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11524/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:
>     - shard-dg2-set2:     [SKIP][23] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][24]
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7953/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11524/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt:
>     - shard-dg2-set2:     [SKIP][25] ([Intel XE#651]) -> [SKIP][26]
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7953/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt.html
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11524/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:
>     - shard-dg2-set2:     [SKIP][27] ([Intel XE#1201]) -> [SKIP][28]
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7953/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11524/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@plane-fbc-rte:
>     - shard-dg2-set2:     [SKIP][29] ([Intel XE#1158]) -> [SKIP][30]
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7953/shard-dg2-432/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11524/shard-dg2-432/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
>     - shard-dg2-set2:     [SKIP][31] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][32] +2 other tests skip
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7953/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11524/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf:
>     - shard-dg2-set2:     [SKIP][33] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][34]
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7953/shard-dg2-436/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11524/shard-dg2-432/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr@fbc-psr-sprite-blt:
>     - shard-dg2-set2:     [SKIP][35] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][36] +1 other test skip
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7953/shard-dg2-435/igt@kms_psr@fbc-psr-sprite-blt.html
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11524/shard-dg2-432/igt@kms_psr@fbc-psr-sprite-blt.html
> 

These are unrelated to change in drm_fdinfo (which is i915 test
so cannot affect Xe testing). No need for respin as I already
merged this compilation fix.

Regards,
Kamil

>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@kms_async_flips@alternate-sync-async-flip:
>     - {shard-bmg}:        NOTRUN -> [DMESG-WARN][37] +9 other tests dmesg-warn
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11524/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip.html
> 
...cut...
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7953 -> IGTPW_11524
> 
>   IGTPW_11524: 11524
>   IGT_7953: 3ec54005a0329f9435dc66baaa4f685159308bc8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1708-974ee82a5f44e91fd93895cc12fb1e76e55b229a: 974ee82a5f44e91fd93895cc12fb1e76e55b229a
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11524/index.html
