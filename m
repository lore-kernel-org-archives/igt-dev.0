Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8905DCCFA1A
	for <igt-dev@archiver.kernel.org>; Wed, 12 Nov 2025 08:28:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EC2F10E6CE;
	Wed, 12 Nov 2025 08:28:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hxORvfDg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39A1610E6CE
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Nov 2025 08:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762936089; x=1794472089;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=sfTx9z7ecN4dEd6u5OyANxKX991osLsxUOzGWUBUSyg=;
 b=hxORvfDgf66hJRJgMzbDYa0a7s3UeaZVNR/xY1fEcJuWFYlazLvHc3im
 MxDYDbvfbLtYUXZN2NYDGcvxaA5CqBh5L7CThWJOd+25qfYq2HnVu1Qin
 KuqTm1PEU/ECq4bqLrLOQDPYQdnRPZBnH5DhpztsZ7A9IlMrFw4EWIH14
 cr/Qe1WlUhNPLRgizxmViBOCmnueV2wgz12c3AT70j5uQeiD+UsR9pbee
 hPPBulDkxCQUnxQ8Y3I7jBom+jstZOQ5eIZmbupxkuaBf3fJ9zYZv37Rl
 o9PD2rf4AgjmwBMcrzijjZ0AbVHJswe831OwlexjJa881itlgex7xnR7g A==;
X-CSE-ConnectionGUID: T+Vc7luyQuK5VeKBeJ6IJw==
X-CSE-MsgGUID: rJbLdG+TTM+VECKKK/9gmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="75299620"
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; d="scan'208";a="75299620"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 00:28:09 -0800
X-CSE-ConnectionGUID: VBZRqZdzQPmgLd0xCgzWhQ==
X-CSE-MsgGUID: VDVxDMTnS5q0UV5nG2iqcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; d="scan'208";a="194354938"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.194])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 00:28:08 -0800
Date: Wed, 12 Nov 2025 09:28:05 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: nishit.sharma@intel.com
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for
 Multi-CCS support in IGT (rev14)
Message-ID: <h7hpp4bud4xfg5dk3kmrxseqsfxh3r7qsjtzushiosicqlg4sh@bj6gjbtzso4o>
References: <20251107151519.66692-1-nishit.sharma@intel.com>
 <176267471314.33229.607536672644246736@10055242dc62>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <176267471314.33229.607536672644246736@10055242dc62>
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

On Sun, Nov 09, 2025 at 07:51:53AM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Multi-CCS support in IGT (rev14)                                 
>    URL:     https://patchwork.freedesktop.org/series/153115/                 
>    State:   failure                                                          
>    Details: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14026/index.html 
> 
>         CI Bug Log - changes from XEIGT_8614_FULL -> XEIGTPW_14026_FULL
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with XEIGTPW_14026_FULL absolutely need to
>    be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in XEIGTPW_14026_FULL, please notify your bug team
>    (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
> Participating hosts (4 -> 3)
> 
>    Missing (1): shard-adlp
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    XEIGTPW_14026_FULL:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@panthor/panthor_query@query:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP +2 other tests skip
>      * igt@xe_compute@eu-busy-10s (NEW):
> 
>           * shard-bmg: NOTRUN -> SKIP
>           * shard-lnl: NOTRUN -> SKIP
> 
>     Warnings
> 
>      * igt@xe_compute@ccs-mode-basic:
> 
>           * shard-bmg: FAIL (Intel XE#5794) -> SKIP
>      * igt@xe_compute@ccs-mode-compute-kernel:
> 
>           * shard-bmg: FAIL (Intel XE#5963) -> SKIP

This is expected. Changing ccs with sriov is not possible, so
change handles this now.

--
Zbigniew

> 
> New tests
> 
>    New tests have been introduced between XEIGT_8614_FULL and
>    XEIGTPW_14026_FULL:
> 
>   New IGT tests (2)
> 
>      * igt@xe_compute@eu-busy-10s:
> 
>           * Statuses : 3 skip(s)
>           * Exec time: [0.0, 0.05] s
>      * igt@xe_compute@loop-duration-2s:
> 
>           * Statuses : 2 pass(s) 1 skip(s)
>           * Exec time: [0.02, 2.05] s
> 
> Known issues
> 
>    Here are the changes found in XEIGTPW_14026_FULL that come from known
>    issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#3658)
>      * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#316) +2 other tests skip
>      * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2327) +4 other tests skip
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1407) +1 other test skip
>      * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1124) +2 other tests skip
>      * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1124) +10 other tests skip
>      * igt@kms_big_fb@y-tiled-addfb:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2328)
>      * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#607)
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#607)
>      * igt@kms_big_fb@yf-tiled-addfb:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#619)
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1467)
>      * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#610)
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1124) +4 other tests
>             skip
>      * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2314 / Intel XE#2894) +1
>             other test skip
>      * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#367) +3 other tests skip
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#367)
>      * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#367) +3 other tests skip
>      * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2887) +20 other tests skip
>      * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#455 / Intel XE#787) +21
>             other tests skip
>      * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-a-dp-4:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#787) +76 other tests
>             skip
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#3442)
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#3432) +3 other tests skip
>      * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#3432) +1 other test skip
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
> 
>           * shard-dg2-set2: PASS -> INCOMPLETE (Intel XE#2705 / Intel XE#4212
>             / Intel XE#4345)
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:
> 
>           * shard-dg2-set2: PASS -> INCOMPLETE (Intel XE#2705 / Intel XE#4212
>             / Intel XE#6014)
>      * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2652 / Intel XE#787) +8 other
>             tests skip
>      * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2887) +6 other tests skip
>      * igt@kms_cdclk@mode-transition-all-outputs:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2724)
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4418)
>      * igt@kms_chamelium_color@ctm-blue-to-red:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#306)
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#306)
>      * igt@kms_chamelium_color@ctm-red-to-blue:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2325)
>      * igt@kms_chamelium_edid@dp-edid-resolution-list:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#373) +6 other tests skip
>      * igt@kms_chamelium_frames@hdmi-crc-fast:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#373) +2 other tests skip
>      * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2252) +10 other tests skip
>      * igt@kms_chamelium_sharpness_filter@filter-basic:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#6507)
>      * igt@kms_content_protection@atomic:
> 
>           * shard-dg2-set2: NOTRUN -> FAIL (Intel XE#1178) +1 other test fail
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#3278)
>      * igt@kms_content_protection@lic-type-1:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#455) +11 other tests
>             skip
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2341)
>      * igt@kms_content_protection@srm:
> 
>           * shard-bmg: NOTRUN -> FAIL (Intel XE#1178) +1 other test fail
>      * igt@kms_cursor_crc@cursor-random-32x32:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2320) +10 other tests skip
>      * igt@kms_cursor_crc@cursor-random-512x512:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#308)
>      * igt@kms_cursor_crc@cursor-random-max-size:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1424)
>      * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2291) +1 other test skip
>      * igt@kms_dp_link_training@uhbr-sst:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4354)
>      * igt@kms_dsc@dsc-fractional-bpp:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2244)
>      * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4422)
>      * igt@kms_feature_discovery@chamelium:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#701)
>      * igt@kms_feature_discovery@display-3x:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2373)
>      * igt@kms_feature_discovery@display-4x:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1138)
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1138)
>      * igt@kms_feature_discovery@psr2:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1135)
>      * igt@kms_flip@2x-flip-vs-panning-interruptible:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2316) +1 other test skip
>      * igt@kms_flip@2x-plain-flip:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1421) +4 other tests skip
>      * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#2316) +1 other test skip
>      * igt@kms_flip@blocking-wf_vblank:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#6266) +1 other test fail
>      * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#301 / Intel XE#3149) +3 other
>             tests fail
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2293) +4 other tests skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2380) +1 other test skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2293 / Intel XE#2380) +4
>             other tests skip
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1401 / Intel XE#1745) +1
>             other test skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-default-mode:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1401) +1 other test skip
>      * igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-blt:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#6312)
>      * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#651) +14 other tests
>             skip
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#651) +5 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#6313) +1 other test skip
>      * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#5390) +15 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2311) +33 other tests skip
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#6312) +5 other tests
>             skip
>      * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2312) +4 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#658)
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1469)
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#656) +12 other tests skip
>      * igt@kms_frontbuffer_tracking@plane-fbc-rte:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2350)
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2313) +38 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#653) +12 other tests
>             skip
>      * igt@kms_hdr@brightness-with-hdr:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#3374 / Intel XE#3544)
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#3374 / Intel XE#3544)
>      * igt@kms_hdr@static-swap:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#1503)
>      * igt@kms_joiner@basic-big-joiner:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#346) +1 other test skip
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#346)
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#346)
>      * igt@kms_joiner@basic-ultra-joiner:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2927)
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2927)
>      * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2501)
>      * igt@kms_panel_fitting@atomic-fastset:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2486)
>      * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4329)
>      * igt@kms_plane_lowres@tiling-none@pipe-b-edp-1:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#599) +3 other tests skip
>      * igt@kms_plane_multiple@2x-tiling-4:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4596)
>      * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2763) +3 other tests skip
>      * igt@kms_pm_dc@dc5-retention-flops:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#3309)
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#3309)
>      * igt@kms_pm_dc@dc6-psr:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2392)
>      * igt@kms_pm_lpsp@kms-lpsp:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2499)
>      * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1439 / Intel XE#836)
>      * igt@kms_pm_rpm@modeset-lpsp:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1439 / Intel XE#3141 / Intel
>             XE#836)
>      * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#2893 / Intel
>             XE#4608) +1 other test skip
>      * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#4608) +3
>             other tests skip
>      * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#1489) +11
>             other tests skip
>      * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#2893)
>      * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#1489) +4
>             other tests skip
>      * igt@kms_psr2_su@frontbuffer-xrgb8888:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#2387)
>      * igt@kms_psr@fbc-pr-cursor-plane-move:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#2850 /
>             Intel XE#929) +8 other tests skip
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1406) +2 other tests skip
>      * igt@kms_psr@psr2-sprite-blt:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#2234 / Intel
>             XE#2850) +13 other tests skip
>      * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#2414)
>           * shard-lnl: PASS -> SKIP (Intel XE#1406 / Intel XE#4692)
>      * igt@kms_rotation_crc@sprite-rotation-90:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#3414 / Intel XE#3904) +1
>             other test skip
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#3414)
>      * igt@kms_scaling_modes@scaling-mode-center:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2413)
>      * igt@kms_setmode@invalid-clone-exclusive-crtc:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1435)
>      * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#6503) +2 other tests skip
>      * igt@kms_tiled_display@basic-test-pattern:
> 
>           * shard-bmg: NOTRUN -> FAIL (Intel XE#1729)
>           * shard-dg2-set2: NOTRUN -> FAIL (Intel XE#1729)
>      * igt@kms_tv_load_detect@load-detect:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#330)
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#330)
>      * igt@kms_vrr@flip-basic-fastset:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1499)
>      * igt@panthor/panthor_gem@bo_mmap_offset_invalid_handle:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#6530) +2 other tests skip
>      * igt@panthor/panthor_query@query:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#6530)
>      * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1091 / Intel XE#2849)
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1091 / Intel XE#2849)
>           * shard-bmg: NOTRUN -> FAIL (Intel XE#5937)
>      * igt@xe_copy_basic@mem-copy-linear-0x369:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1123)
>      * igt@xe_eu_stall@invalid-event-report-count:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#5626)
>      * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4837) +14 other tests skip
>      * igt@xe_eudebug@multigpu-basic-client-many:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4837) +4 other tests skip
>      * igt@xe_eudebug@multiple-sessions:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4837) +7 other tests
>             skip
>      * igt@xe_evict@evict-beng-mixed-many-threads-small:
> 
>           * shard-bmg: NOTRUN -> INCOMPLETE (Intel XE#6321)
>      * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#688) +3 other tests skip
>      * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2322) +10 other tests skip
>      * igt@xe_exec_basic@multigpu-once-bindexecqueue:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1392) +3 other tests skip
>      * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#288) +14 other tests
>             skip
>      * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2360)
>      * igt@xe_exec_system_allocator@once-mmap-huge:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4943) +7 other tests skip
>      * igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontunmap-eocheck:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4915) +209 other tests
>             skip
>      * igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4943) +27 other tests skip
>      * igt@xe_exec_system_allocator@twice-malloc-prefetch-madvise:
> 
>           * shard-lnl: NOTRUN -> WARN (Intel XE#5786)
>      * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
> 
>           * shard-dg2-set2: NOTRUN -> ABORT (Intel XE#5466)
>           * shard-bmg: NOTRUN -> ABORT (Intel XE#5466 / Intel XE#5530)
>      * igt@xe_module_load@force-load:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#378)
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#378)
>      * igt@xe_oa@syncs-userptr-wait-cfg:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#3573) +7 other tests
>             skip
>      * igt@xe_pat@pat-index-xelpg:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#979)
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#979)
>      * igt@xe_pm@d3cold-basic:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2284)
>      * igt@xe_pm@d3cold-basic-exec:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2284 / Intel XE#366)
>      * igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_copy0:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#6251)
>      * igt@xe_pmu@gt-frequency:
> 
>           * shard-dg2-set2: PASS -> FAIL (Intel XE#4819) +1 other test fail
>      * igt@xe_pxp@pxp-stale-bo-bind-post-rpm:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4733) +1 other test skip
>      * igt@xe_pxp@pxp-stale-bo-exec-post-suspend:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4733) +2 other tests skip
>      * igt@xe_query@multigpu-query-hwconfig:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#944)
>      * igt@xe_query@multigpu-query-invalid-cs-cycles:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#944) +3 other tests skip
>      * igt@xe_query@multigpu-query-topology:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#944) +1 other test skip
>      * igt@xe_render_copy@render-stress-2-copies:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4814)
>      * igt@xe_sriov_auto_provisioning@exclusive-ranges:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4130)
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4130)
>      * igt@xe_sriov_flr@flr-vfs-parallel:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4273)
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4273)
> 
>     Possible fixes
> 
>      * igt@kms_cursor_edge_walk@128x128-left-edge:
> 
>           * shard-bmg: SKIP -> PASS
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
> 
>           * shard-bmg: FAIL (Intel XE#4633) -> PASS
>      * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
> 
>           * shard-dg2-set2: FAIL (Intel XE#301) -> PASS
>      * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:
> 
>           * shard-dg2-set2: FAIL (Intel XE#301 / Intel XE#3321) -> PASS
>      * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-dp2-hdmi-a3:
> 
>           * shard-bmg: DMESG-WARN (Intel XE#3428) -> PASS +9 other tests pass
>      * igt@kms_flip@2x-plain-flip-fb-recreate:
> 
>           * shard-bmg: SKIP (Intel XE#2316) -> PASS +3 other tests pass
>      * igt@kms_flip@modeset-vs-vblank-race-interruptible:
> 
>           * shard-lnl: FAIL (Intel XE#3098) -> PASS +1 other test pass
>      * igt@kms_hdr@invalid-metadata-sizes:
> 
>           * shard-bmg: SKIP (Intel XE#1503) -> PASS
>      * igt@kms_pm_dc@dc6-dpms:
> 
>           * shard-lnl: FAIL (Intel XE#718) -> PASS
>      * igt@kms_setmode@basic@pipe-a-hdmi-a-6:
> 
>           * shard-dg2-set2: FAIL (Intel XE#6361) -> PASS +2 other tests pass
>      * igt@kms_setmode@basic@pipe-b-edp-1:
> 
>           * shard-lnl: FAIL (Intel XE#6361) -> PASS +2 other tests pass
>      * igt@kms_vblank@query-idle@pipe-d-dp-2:
> 
>           * shard-bmg: FAIL -> PASS +4 other tests pass
>      * igt@xe_exec_basic@multigpu-once-bindexecqueue:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1392) -> PASS +1 other test pass
>      * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
> 
>           * shard-dg2-set2: DMESG-WARN (Intel XE#5893) -> PASS
>      * igt@xe_pm@s2idle-basic:
> 
>           * shard-dg2-set2: INCOMPLETE (Intel XE#4504) -> PASS
>      * igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_decode0:
> 
>           * shard-lnl: FAIL (Intel XE#6251) -> PASS +1 other test pass
>      * igt@xe_pmu@gt-c6-idle:
> 
>           * shard-dg2-set2: FAIL (Intel XE#6366) -> PASS
> 
>     Warnings
> 
>      * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
> 
>           * shard-bmg: DMESG-WARN (Intel XE#3428) -> SKIP (Intel XE#2291)
>      * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-blt:
> 
>           * shard-bmg: SKIP (Intel XE#2312) -> SKIP (Intel XE#2311) +2 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
> 
>           * shard-bmg: SKIP (Intel XE#2312) -> SKIP (Intel XE#5390) +2 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
> 
>           * shard-bmg: SKIP (Intel XE#5390) -> SKIP (Intel XE#2312) +3 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:
> 
>           * shard-bmg: SKIP (Intel XE#2311) -> SKIP (Intel XE#2312) +6 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
> 
>           * shard-bmg: SKIP (Intel XE#2312) -> SKIP (Intel XE#2313) +3 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
> 
>           * shard-bmg: SKIP (Intel XE#2313) -> SKIP (Intel XE#2312) +11 other
>             tests skip
>      * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
> 
>           * shard-lnl: FAIL (Intel XE#5862) -> FAIL (Intel XE#5862 / Intel
>             XE#6554) +1 other test fail
> 
> Build changes
> 
>      * IGT: IGT_8614 -> IGTPW_14026
>      * Linux: xe-4073-4dff427fe8bbfd0bdbf7935d23a2aba0c350ab2d ->
>        xe-4074-2bc418aa7efaae562e49d84e8b28f799cf624745
> 
>    IGTPW_14026: 14026
>    IGT_8614: 8614
>    xe-4073-4dff427fe8bbfd0bdbf7935d23a2aba0c350ab2d:
>    4dff427fe8bbfd0bdbf7935d23a2aba0c350ab2d
>    xe-4074-2bc418aa7efaae562e49d84e8b28f799cf624745:
>    2bc418aa7efaae562e49d84e8b28f799cf624745
