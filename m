Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFFF5CA0ED1
	for <igt-dev@archiver.kernel.org>; Thu, 14 Aug 2025 05:29:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93CC310E04F;
	Thu, 14 Aug 2025 05:29:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PvIJ84d0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0813410E04F
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Aug 2025 05:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755149357; x=1786685357;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=+jzOWEb3wL7Vw6VD2uVkXQLTsUGjFLJY1FHVlm0iDX4=;
 b=PvIJ84d0CNjGFLbXKE5r/3ED8gzlaS3HF8lvIIOD3u7INjXHudp1wgTU
 S6gtcGUq/8Z5n8eXB83U7ihmG/QDIfEKDe97//qmIS6q9w7daSNbOj3TZ
 jBVVJ/FeyLXji0j0w/7Ojk4z7sZ74562Z728frj3AAqvA/LerM7gaI2hQ
 DKeFsfFlvp97sjkogDtwttg9twdreplR4vUECe9gz48FZmxDjpOG9tcdD
 FR145oIjdvhaGh06rxScjfk0l+R0g/PtoovYHSg8sHj6Lk4MFa1mimfIt
 rPnFFAfpGSLwhgjCXFIwaNU6eTURX2kZwyelDf92YBimaNLclt/20rBxa Q==;
X-CSE-ConnectionGUID: Kqcwyc6qTqSz4vhe76sZ2A==
X-CSE-MsgGUID: d4OMj7+XSUSEcD28iz/mWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="68061604"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="68061604"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 22:28:51 -0700
X-CSE-ConnectionGUID: 6k+YB825TL++BXjMKCg5SQ==
X-CSE-MsgGUID: 15XU+I5JS2eG451cE8PeOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="170871778"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.95])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 22:28:50 -0700
Date: Thu, 14 Aug 2025 07:28:47 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for
 Shaders migration to separate headers
Message-ID: <hyw3r5wfczmje43l6ovhvtca4nuafagxovqpom7kkmekksvugh@hfuddjpsvzth>
References: <20250813082502.371493-6-zbigniew.kempczynski@intel.com>
 <175510368976.234050.2499305854222455244@1538d3639d33>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <175510368976.234050.2499305854222455244@1538d3639d33>
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

On Wed, Aug 13, 2025 at 04:48:09PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Shaders migration to separate headers                            
>    URL:     https://patchwork.freedesktop.org/series/152864/                 
>    State:   failure                                                          
>    Details: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13577/index.html 
> 
>         CI Bug Log - changes from XEIGT_8493_FULL -> XEIGTPW_13577_FULL
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with XEIGTPW_13577_FULL absolutely need to
>    be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in XEIGTPW_13577_FULL, please notify your bug team
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
>    XEIGTPW_13577_FULL:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@xe_exec_compute_mode@many-bindexecqueue-userptr-rebind:
> 
>           * shard-bmg: PASS -> FAIL
>      * igt@xe_exec_fault_mode@many-rebind-prefetch:
> 
>           * shard-lnl: PASS -> FAIL
>      * igt@xe_pm@s3-d3hot-basic-exec:
> 
>           * shard-dg2-set2: PASS -> TIMEOUT
>      * igt@xe_pmu@gt-frequency:
> 
>           * shard-lnl: NOTRUN -> FAIL +1 other test fail

Series is unrelated to above failures. It touches shaders only.

--
Zbigniew

> 
> Known issues
> 
>    Here are the changes found in XEIGTPW_13577_FULL that come from known
>    issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2233)
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#623)
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1466)
>      * igt@kms_async_flips@invalid-async-flip-atomic:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#3768)
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#3768)
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#3768)
>      * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2370)
>      * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#316) +2 other tests skip
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1407) +3 other tests skip
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#3658)
>      * igt@kms_big_fb@linear-64bpp-rotate-90:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2327) +3 other tests skip
>      * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1124) +15 other tests
>             skip
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1124) +10 other tests skip
>      * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1124) +15 other tests skip
>      * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2191) +1 other test skip
>      * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#2314 / Intel XE#2894)
>      * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2314 / Intel XE#2894) +1
>             other test skip
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2191) +1 other test skip
>      * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#367) +5 other tests skip
>      * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#367) +4 other tests skip
>      * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#367) +3 other tests skip
>      * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1512)
>      * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2887) +17 other tests skip
>      * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2907) +3 other tests
>             skip
>      * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2669) +7 other tests skip
>      * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2887) +9 other tests skip
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#3432) +2 other tests skip
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#3432) +2 other tests skip
>      * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2652 / Intel XE#787) +17
>             other tests skip
>      * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#787) +251 other tests
>             skip
>      * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#455 / Intel XE#787) +55
>             other tests skip
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
> 
>           * shard-dg2-set2: NOTRUN -> INCOMPLETE (Intel XE#1727 / Intel
>             XE#3113 / Intel XE#3124 / Intel XE#4345)
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
> 
>           * shard-dg2-set2: PASS -> INCOMPLETE (Intel XE#1727 / Intel XE#2705
>             / Intel XE#3113 / Intel XE#4212 / Intel XE#4345 / Intel XE#4522)
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:
> 
>           * shard-dg2-set2: NOTRUN -> INCOMPLETE (Intel XE#2705 / Intel
>             XE#4212) +1 other test incomplete
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4:
> 
>           * shard-dg2-set2: PASS -> INCOMPLETE (Intel XE#1727 / Intel XE#2705
>             / Intel XE#3113 / Intel XE#4212 / Intel XE#4522)
>      * igt@kms_cdclk@plane-scaling:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2724)
>      * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4416) +3 other tests
>             skip
>      * igt@kms_chamelium_hpd@common-hpd-after-suspend:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2252) +13 other tests skip
>      * igt@kms_chamelium_hpd@dp-hpd-fast:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#373) +8 other tests skip
>      * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#373) +12 other tests
>             skip
>      * igt@kms_concurrent@multi-plane-atomic-lowres:
> 
>           * shard-bmg: PASS -> ABORT (Intel XE#5826)
>           * shard-dg2-set2: PASS -> ABORT (Intel XE#5826)
>      * igt@kms_concurrent@multi-plane-atomic-lowres@pipe-a-dp-2:
> 
>           * shard-bmg: PASS -> ABORT (Intel XE#5898)
>      * igt@kms_concurrent@multi-plane-atomic-lowres@pipe-a-dp-4:
> 
>           * shard-dg2-set2: PASS -> DMESG-WARN (Intel XE#5826)
>      * igt@kms_concurrent@multi-plane-atomic-lowres@pipe-a-hdmi-a-3:
> 
>           * shard-bmg: PASS -> DMESG-WARN (Intel XE#5826)
>      * igt@kms_concurrent@multi-plane-atomic-lowres@pipe-a-hdmi-a-6:
> 
>           * shard-dg2-set2: PASS -> ABORT (Intel XE#5898)
>      * igt@kms_content_protection@atomic-dpms:
> 
>           * shard-dg2-set2: NOTRUN -> FAIL (Intel XE#1178) +1 other test fail
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#3278)
>      * igt@kms_content_protection@content-type-change:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2341) +2 other tests skip
>      * igt@kms_content_protection@dp-mst-type-1:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2390)
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#307)
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#307)
>      * igt@kms_content_protection@uevent@pipe-a-dp-4:
> 
>           * shard-dg2-set2: NOTRUN -> FAIL (Intel XE#1188)
>      * igt@kms_cursor_crc@cursor-offscreen-256x85:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2320) +9 other tests skip
>      * igt@kms_cursor_crc@cursor-onscreen-512x512:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#308) +2 other tests skip
>      * igt@kms_cursor_crc@cursor-random-512x170:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2321) +1 other test skip
>      * igt@kms_cursor_crc@cursor-random-max-size:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#455) +12 other tests
>             skip
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1424) +6 other tests skip
>      * igt@kms_cursor_crc@cursor-sliding-512x170:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2321)
>      * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2291)
>      * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#2291) +1 other test skip
>      * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
> 
>           * shard-bmg: NOTRUN -> DMESG-WARN (Intel XE#5354)
>      * igt@kms_cursor_legacy@forked-move:
> 
>           * shard-bmg: NOTRUN -> ABORT (Intel XE#5826) +1 other test abort
>      * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#323)
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2286)
>      * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#5428)
>      * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1340)
>      * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4494 / i915#3804)
>      * igt@kms_dp_link_training@uhbr-mst:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4354)
>      * igt@kms_dsc@dsc-with-formats:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2244)
>      * igt@kms_dsc@dsc-with-output-formats:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2244) +1 other test skip
>      * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4422)
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4422)
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4422)
>      * igt@kms_fbcon_fbt@fbc-suspend:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#5425)
>      * igt@kms_feature_discovery@dp-mst:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2375)
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1137)
>      * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1421) +4 other tests skip
>      * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2316)
>      * igt@kms_flip@2x-plain-flip-interruptible:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#2316) +2 other tests skip
>      * igt@kms_flip@flip-vs-expired-vblank-interruptible:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#301 / Intel XE#3149)
>      * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#301)
>      * igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp2:
> 
>           * shard-bmg: PASS -> FAIL (Intel XE#5338) +1 other test fail
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2293 / Intel XE#2380) +1
>             other test skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2293) +1 other test skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2380) +1 other test skip
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1401 / Intel XE#1745)
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1401)
>      * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling:
> 
>           * shard-lnl: NOTRUN -> FAIL (Intel XE#4683) +1 other test fail
>      * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-move:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#651) +11 other tests skip
>      * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2311) +32 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#5390) +15 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2312) +9 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#651) +30 other tests
>             skip
>      * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1469) +1 other test skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2313) +33 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2352) +1 other test skip
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#658)
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#656) +29 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-slowdraw:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#653) +41 other tests
>             skip
>      * igt@kms_hdr@static-toggle:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#1503)
>      * igt@kms_hdr@static-toggle-dpms:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1503)
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1503)
>      * igt@kms_joiner@basic-big-joiner:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#346)
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#346)
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#346)
>      * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2934)
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2925)
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2925)
>      * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4329)
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4359)
>      * igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0:
> 
>           * shard-lnl: NOTRUN -> FAIL (Intel XE#5195) +2 other tests fail
>      * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
> 
>           * shard-dg2-set2: NOTRUN -> FAIL (Intel XE#616) +3 other tests fail
>      * igt@kms_plane_lowres@tiling-4:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#599) +3 other tests skip
>      * igt@kms_plane_multiple@2x-tiling-none:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4596) +1 other test skip
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4596)
>      * igt@kms_plane_multiple@2x-tiling-yf:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#5021)
>      * igt@kms_plane_multiple@tiling-yf:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#5020)
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#5020)
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#5020)
>      * igt@kms_plane_scaling@2x-scaler-multi-pipe:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#309) +1 other test skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2763) +11 other tests skip
>      * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2763) +9 other tests skip
>      * igt@kms_pm_dc@dc5-dpms:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#718) +1 other test fail
>      * igt@kms_pm_dc@dc5-psr:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2392)
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1129)
>      * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1439 / Intel XE#836)
>      * igt@kms_pm_rpm@modeset-non-lpsp-stress:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1439 / Intel XE#3141)
>      * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1489 / Intel XE#5899)
>             +10 other tests skip
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2893 / Intel XE#4608 / Intel
>             XE#5899) +1 other test skip
>      * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4608 / Intel XE#5899) +3
>             other tests skip
>      * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2893 / Intel XE#5899)
>      * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1489 / Intel XE#5899) +9
>             other tests skip
>      * igt@kms_psr2_su@frontbuffer-xrgb8888:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1128 / Intel XE#5899)
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2387 / Intel XE#5899)
>      * igt@kms_psr2_su@page_flip-p010:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1122 / Intel XE#5899) +1
>             other test skip
>      * igt@kms_psr@fbc-psr-cursor-render:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#5784 / Intel XE#5899) +3
>             other tests skip
>      * igt@kms_psr@fbc-psr-primary-render:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2234 / Intel XE#2850 / Intel
>             XE#5899) +20 other tests skip
>      * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2850 / Intel XE#5899 /
>             Intel XE#929) +18 other tests skip
>      * igt@kms_psr@fbc-psr2-dpms@edp-1:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4609 / Intel XE#5899) +1
>             other test skip
>      * igt@kms_psr@pr-primary-blt:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#5899) +5
>             other tests skip
>      * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
> 
>           * shard-lnl: PASS -> SKIP (Intel XE#4692 / Intel XE#5899)
>      * igt@kms_rotation_crc@bad-tiling:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#3414) +1 other test skip
>      * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#3414 / Intel XE#3904)
>      * igt@kms_rotation_crc@sprite-rotation-90:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#3414 / Intel XE#3904)
>      * igt@kms_scaling_modes@scaling-mode-center:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2413)
>      * igt@kms_setmode@clone-exclusive-crtc:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1435)
>      * igt@kms_vrr@seamless-rr-switch-virtual:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1499) +1 other test skip
>      * igt@xe_compute@ccs-mode-basic:
> 
>           * shard-bmg: NOTRUN -> FAIL (Intel XE#5794)
>      * igt@xe_configfs@survivability-mode:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#5249)
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#5249)
>      * igt@xe_copy_basic@mem-copy-linear-0x3fff:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1123)
>      * igt@xe_copy_basic@mem-set-linear-0xfd:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1126) +1 other test skip
>      * igt@xe_eu_stall@blocking-read:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#5626)
>      * igt@xe_eudebug@discovery-empty:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4837) +15 other tests skip
>      * igt@xe_eudebug@vma-ufence-faultable:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4837) +15 other tests
>             skip
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4837) +8 other tests skip
>      * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#688) +5 other tests skip
>      * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2322) +10 other tests skip
>      * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
> 
>           * shard-dg2-set2: PASS -> SKIP (Intel XE#1392) +3 other tests skip
>      * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1392)
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1392) +6 other tests skip
>      * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#288) +32 other tests
>             skip
>      * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2360) +1 other test skip
>      * igt@xe_exec_reset@parallel-gt-reset:
> 
>           * shard-bmg: NOTRUN -> DMESG-WARN (Intel XE#3876) +1 other test
>             dmesg-warn
>           * shard-dg2-set2: NOTRUN -> DMESG-WARN (Intel XE#3876)
>      * igt@xe_exec_system_allocator@process-many-mmap-new-huge-nomemset:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4943) +22 other tests skip
>      * igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4943) +24 other tests skip
>      * igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-eocheck:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4915) +310 other tests
>             skip
>      * igt@xe_exec_threads@threads-bal-mixed-fd-basic:
> 
>           * shard-bmg: PASS -> DMESG-FAIL (Intel XE#3876)
>      * igt@xe_mmap@pci-membarrier-bad-pagesize:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#5100)
>      * igt@xe_mmap@vram:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1416)
>      * igt@xe_module_load@force-load:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2457)
>      * igt@xe_oa@buffer-size:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#5103)
>      * igt@xe_oa@closed-fd-and-unmapped-access:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#3573) +11 other tests
>             skip
>      * igt@xe_oa@oa-tlb-invalidate:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2248)
>      * igt@xe_pat@display-vs-wb-transient:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1337)
>      * igt@xe_peer2peer@read:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1061)
>      * igt@xe_pm@d3cold-basic:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2284 / Intel XE#366) +1 other
>             test skip
>      * igt@xe_pm@s3-d3cold-basic-exec:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2284) +2 other tests skip
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2284 / Intel XE#366) +2
>             other tests skip
>      * igt@xe_pm@s3-vm-bind-unbind-all:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#584)
>      * igt@xe_pxp@pxp-stale-bo-bind-post-rpm:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4733) +3 other tests
>             skip
>      * igt@xe_pxp@pxp-termination-key-update-post-suspend:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4733) +2 other tests skip
>      * igt@xe_query@multigpu-query-cs-cycles:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#944) +4 other tests skip
>      * igt@xe_query@multigpu-query-pxp-status:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#944) +1 other test skip
>      * igt@xe_query@multigpu-query-uc-fw-version-guc:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#944) +5 other tests skip
>      * igt@xe_render_copy@render-stress-2-copies:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4814)
>      * igt@xe_sriov_auto_provisioning@exclusive-ranges:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4130)
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4130)
> 
>     Possible fixes
> 
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
> 
>           * shard-dg2-set2: INCOMPLETE (Intel XE#3862) -> PASS +1 other test
>             pass
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:
> 
>           * shard-dg2-set2: INCOMPLETE (Intel XE#1727 / Intel XE#2705 / Intel
>             XE#3113 / Intel XE#4212 / Intel XE#4522) -> PASS
>      * igt@kms_concurrent@multi-plane-atomic-lowres:
> 
>           * shard-lnl: ABORT (Intel XE#5826) -> PASS +1 other test pass
>      * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
> 
>           * shard-bmg: SKIP (Intel XE#2291) -> PASS
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
> 
>           * shard-bmg: FAIL (Intel XE#1475) -> PASS
>      * igt@kms_dp_linktrain_fallback@dp-fallback:
> 
>           * shard-bmg: SKIP (Intel XE#4294) -> PASS
>      * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
> 
>           * shard-bmg: SKIP (Intel XE#2316) -> PASS +1 other test pass
>      * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
> 
>           * shard-lnl: FAIL (Intel XE#301) -> PASS +1 other test pass
>      * igt@kms_flip@flip-vs-suspend-interruptible:
> 
>           * shard-dg2-set2: TIMEOUT (Intel XE#1504 / Intel XE#5737) -> PASS
>      * igt@kms_hdr@static-swap:
> 
>           * shard-bmg: SKIP (Intel XE#1503) -> PASS
>      * igt@kms_psr@fbc-psr-suspend@edp-1:
> 
>           * shard-lnl: ABORT (Intel XE#2625 / Intel XE#4847) -> PASS +1 other
>             test pass
>      * igt@kms_vrr@cmrr@pipe-a-edp-1:
> 
>           * shard-lnl: FAIL (Intel XE#4459) -> PASS +1 other test pass
>      * igt@xe_exec_basic@multigpu-once-null:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1392) -> PASS +1 other test pass
>      * igt@xe_exec_compute_mode@many-userptr-rebind:
> 
>           * shard-lnl: FAIL (Intel XE#5817) -> PASS
>      * igt@xe_exec_fault_mode@many-execqueues-rebind-imm:
> 
>           * shard-lnl: FAIL (Intel XE#5536) -> PASS
>      * igt@xe_exec_system_allocator@process-many-large-execqueues-free:
> 
>           * shard-bmg: INCOMPLETE -> PASS
>      * igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:
> 
>           * shard-lnl: DMESG-WARN -> PASS
> 
>     Warnings
> 
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
> 
>           * shard-dg2-set2: INCOMPLETE (Intel XE#1727 / Intel XE#2705 / Intel
>             XE#3113 / Intel XE#4212 / Intel XE#4522) -> INCOMPLETE (Intel
>             XE#1727 / Intel XE#3113 / Intel XE#3124 / Intel XE#4345)
>      * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc:
> 
>           * shard-bmg: SKIP (Intel XE#2311) -> SKIP (Intel XE#2312) +7 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-onoff:
> 
>           * shard-bmg: SKIP (Intel XE#2312) -> SKIP (Intel XE#2311) +2 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
> 
>           * shard-bmg: SKIP (Intel XE#5390) -> SKIP (Intel XE#2312) +7 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt:
> 
>           * shard-bmg: SKIP (Intel XE#2312) -> SKIP (Intel XE#5390)
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:
> 
>           * shard-bmg: SKIP (Intel XE#2313) -> SKIP (Intel XE#2312) +4 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
> 
>           * shard-bmg: SKIP (Intel XE#2312) -> SKIP (Intel XE#2313) +4 other
>             tests skip
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Build changes
> 
>      * IGT: IGT_8493 -> IGTPW_13577
>      * Linux: xe-3535-6f1fcd1c8f6cfedca8d5d6de1dfedc561c193736 ->
>        xe-3540-ec8aa890d544a1acecf63c1a23e659bb7fc7abe6
> 
>    IGTPW_13577: e577044e535443101fb15f0a70478ea16d209262 @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    IGT_8493: 8493
>    xe-3535-6f1fcd1c8f6cfedca8d5d6de1dfedc561c193736:
>    6f1fcd1c8f6cfedca8d5d6de1dfedc561c193736
>    xe-3540-ec8aa890d544a1acecf63c1a23e659bb7fc7abe6:
>    ec8aa890d544a1acecf63c1a23e659bb7fc7abe6
