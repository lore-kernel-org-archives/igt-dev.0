Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18594C3DA7F
	for <igt-dev@archiver.kernel.org>; Mon,  5 Aug 2024 11:33:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA3BD10E05A;
	Mon,  5 Aug 2024 11:33:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gViFznP1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B073D891E1;
 Mon,  5 Aug 2024 11:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722857602; x=1754393602;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cuT6bqnBgveJYdUd5cLVTPHW7PLvs9C5fe7wg2nuw+4=;
 b=gViFznP1KgGQ/PKsV9Mhn6nPeN00Diw+gvlSb+MSJ46cxCo1w2Pum699
 S4fpXRVffuA6IkRao9CzaPe43+KkYLxYVSKX1ie+VE7yabsr+4WQtQ3co
 mVRTjGNO5LuWFh1lSZN2K85xfvPUN8nc4UYcVDJDzP/JM0fGCq9tJNL2P
 h8x8WmN23Rw2UkcZAVpSn4UDpCI11uAe+xdtJuEOHlwb9n5u4n9umHgYB
 7CIpYYNgaGRFAe3qWOcGVCgra0sxacmVB8N1qWPdDUmFcei83fXdGNxDf
 GMvZg4+0r162vKFYerrUhXy569ElTi+57cWqapFJHWmW/7HvVBblF8AU4 w==;
X-CSE-ConnectionGUID: HiwpC3DVRaeWi/zoMdFt0w==
X-CSE-MsgGUID: UHr3ROxiREm5Z2b5vwNuBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11154"; a="20394639"
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; d="scan'208";a="20394639"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 04:33:21 -0700
X-CSE-ConnectionGUID: kQA7FGwZRaixJVDMmBIuGQ==
X-CSE-MsgGUID: IAA9YVjaQfaqD5OY0hyiPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; d="scan'208";a="55806449"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2024 04:33:20 -0700
Date: Mon, 5 Aug 2024 13:33:17 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: john.c.harrison@intel.com, I915-ci-infra@lists.freedesktop.org,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: =?utf-8?B?4pyXIENJLnhlRlVMTA==?= =?utf-8?Q?=3A?= failure for
 Update hwconfig table tests
Message-ID: <20240805113317.355s2jnbingzbf7a@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, john.c.harrison@intel.com,
 I915-ci-infra@lists.freedesktop.org,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
References: <20240801195129.3667206-1-John.C.Harrison@Intel.com>
 <172255157192.489444.6719681080174494270@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <172255157192.489444.6719681080174494270@2413ebb6fbb6>
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
On 2024-08-01 at 22:32:51 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Update hwconfig table tests
> URL   : https://patchwork.freedesktop.org/series/136812/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_7951_full -> XEIGTPW_11519_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_11519_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_11519_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_11519_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@core_hotunplug@hotreplug-lateclose:
>     - shard-dg2-set2:     [PASS][1] -> [SKIP][2] +4 other tests skip
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-466/igt@core_hotunplug@hotreplug-lateclose.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11519/shard-dg2-432/igt@core_hotunplug@hotreplug-lateclose.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][3] +1 other test skip
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11519/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
>     - shard-lnl:          [PASS][4] -> [SKIP][5] +2 other tests skip
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11519/shard-lnl-3/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
> 
>   * igt@kms_vrr@flip-basic:
>     - shard-lnl:          [PASS][6] -> [FAIL][7] +1 other test fail
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-5/igt@kms_vrr@flip-basic.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11519/shard-lnl-5/igt@kms_vrr@flip-basic.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_big_fb@linear-64bpp-rotate-180:
>     - shard-dg2-set2:     [DMESG-WARN][8] -> [SKIP][9]
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-435/igt@kms_big_fb@linear-64bpp-rotate-180.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11519/shard-dg2-432/igt@kms_big_fb@linear-64bpp-rotate-180.html
> 
>   * igt@kms_big_fb@y-tiled-16bpp-rotate-90:
>     - shard-dg2-set2:     [SKIP][10] ([Intel XE#1124]) -> [SKIP][11]
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-432/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11519/shard-dg2-432/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html
> 
>   * igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][12] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][13]
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-466/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11519/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html
> 
>   * igt@kms_big_joiner@basic:
>     - shard-dg2-set2:     [SKIP][14] ([Intel XE#1201] / [Intel XE#346]) -> [SKIP][15]
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-435/igt@kms_big_joiner@basic.html
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11519/shard-dg2-432/igt@kms_big_joiner@basic.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs:
>     - shard-dg2-set2:     [SKIP][16] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][17]
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs.html
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11519/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs.html
> 
>   * igt@kms_dsc@dsc-with-bpc-formats:
>     - shard-dg2-set2:     [SKIP][18] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][19]
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-433/igt@kms_dsc@dsc-with-bpc-formats.html
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11519/shard-dg2-432/igt@kms_dsc@dsc-with-bpc-formats.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render:
>     - shard-dg2-set2:     [SKIP][20] ([Intel XE#1201]) -> [SKIP][21] +1 other test skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11519/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-suspend:
>     - shard-dg2-set2:     [FAIL][22] ([Intel XE#616]) -> [SKIP][23]
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-suspend.html
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11519/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt:
>     - shard-dg2-set2:     [SKIP][24] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][25] +2 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt.html
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11519/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt:
>     - shard-dg2-set2:     [SKIP][26] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][27] +2 other tests skip
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt.html
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11519/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt.html
> 
>   * igt@kms_psr@psr2-cursor-plane-move:
>     - shard-dg2-set2:     [SKIP][28] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][29]
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-435/igt@kms_psr@psr2-cursor-plane-move.html
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11519/shard-dg2-432/igt@kms_psr@psr2-cursor-plane-move.html
> 

Unrelated to changes,

Regards,
Kamil

>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
...cut...
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7951 -> IGTPW_11519
>   * Linux: xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a -> xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5
> 
>   IGTPW_11519: 11519
>   IGT_7951: 7951
>   xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a: abbcf7af3bd79f8729a6dba72674a81730f97f8a
>   xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5: d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11519/index.html
