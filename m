Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE92DC87FDB
	for <igt-dev@archiver.kernel.org>; Mon, 11 Aug 2025 10:43:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FFCF10E41A;
	Mon, 11 Aug 2025 10:43:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XzlKsW6M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12FB410E41A
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Aug 2025 10:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754908989; x=1786444989;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=UKrJSjCcvOC5h7MU37OX9JIh0c10jtOSmkzAFiipmOE=;
 b=XzlKsW6MjeDSFtcT5k/EETMvlWil6BsmiXILpHTSFnzCsTG2NnS7g3QK
 RCLLZnF1qpg4QPveC68XLXnUsIY+vKypSbTqg4BV/U3qBKeWmXRfGHWxK
 YEBVT/NZwKkdJB99c7WjQHqqLJTX1FngV8VePxBGJZqr3P8J/kF9kcnvv
 40ZuhOMwkTTQ8/77Uy5EHKQ7Nvagcww4YfXezZJXf4SPRyOkhV5Xas+pr
 Ey8Hrq92HeN1IbpB5KVNW3Kp3QoJM/alcicnM8jpJtavcfPIMZH4u9RL6
 Fj6E2+y+xJl0Oyy8D1m54j/tjySxKD88qD/BzWZbDWnAZYpci7H2FIwgg g==;
X-CSE-ConnectionGUID: cQj8GlHXQZSQqXGCnBfKeA==
X-CSE-MsgGUID: V/2oB9zwR3iE7JcbYQe1gA==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="56870833"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="56870833"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 03:42:56 -0700
X-CSE-ConnectionGUID: Thsh+uLAQlKRaOkLsUY01w==
X-CSE-MsgGUID: gX9IRsL1TS60Ua+eEODncg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="166244251"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.84])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 03:42:54 -0700
Date: Mon, 11 Aug 2025 12:42:52 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1cmUgZm9yIHRlc3RzL3hl?=
 =?utf-8?Q?=5Fcompute=5Fpreempt=3A?= remove WMTP check in multiprocess tests
Message-ID: <3m5npwfgjawia4ekis7qdd6wo5emgydlezh37y7hphepg6yqgs@gdi5oesc33gh>
References: <20250811054650.37114-2-zbigniew.kempczynski@intel.com>
 <175489849362.225350.4445585734560428434@1538d3639d33>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <175489849362.225350.4445585734560428434@1538d3639d33>
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

On Mon, Aug 11, 2025 at 07:48:13AM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  tests/xe_compute_preempt: remove WMTP check in multiprocess tests 
>    URL:     https://patchwork.freedesktop.org/series/152738/                  
>    State:   failure                                                           
>    Details: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13566/index.html  
> 
>         CI Bug Log - changes from XEIGT_8489_FULL -> XEIGTPW_13566_FULL
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with XEIGTPW_13566_FULL absolutely need to
>    be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in XEIGTPW_13566_FULL, please notify your bug team
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
>    XEIGTPW_13566_FULL:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@xe_ccs@ctrl-surf-copy-new-ctx@tile4-compressed-compfmt0-vram01-vram01:
> 
>           * shard-bmg: PASS -> INCOMPLETE +1 other test incomplete
>      * igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init:
> 
>           * shard-dg2-set2: PASS -> FAIL
>           * shard-lnl: PASS -> FAIL
>           * shard-bmg: PASS -> FAIL +1 other test fail
>      * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
> 
>           * shard-dg2-set2: PASS -> DMESG-WARN
>      * igt@xe_pmu@engine-activity-most-load:
> 
>           * shard-dg2-set2: PASS -> INCOMPLETE +1 other test incomplete

Patch is unrelated to the failures above.

> 
>     Warnings
> 
>      * igt@xe_compute_preempt@compute-preempt-many:
>           * shard-dg2-set2: SKIP (Intel XE#1280 / Intel XE#455) -> FAIL +1
>             other test fail

Normally test is skipping, preemptions are not supported on DG2.

--
Zbigniew

> 
>     Suppressed
> 
>    The following results come from untrusted machines, tests, or statuses.
>    They do not affect the overall result.
> 
>      * {igt@xe_compute_preempt@compute-preempt-many-vram-evict}:
>           * shard-dg2-set2: SKIP (Intel XE#455) -> FAIL +3 other tests fail
> 
> New tests
> 
>    New tests have been introduced between XEIGT_8489_FULL and
>    XEIGTPW_13566_FULL:
> 
>   New IGT tests (7)
> 
>      * igt@kms_cursor_crc@cursor-dpms@pipe-a-dp-2:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [1.22] s
>      * igt@kms_cursor_crc@cursor-dpms@pipe-d-dp-2:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.99] s
>      * igt@kms_mmap_write_crc@main@pipe-a-dp-2:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [3.24] s
>      * igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-a-dp-2:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.69] s
>      * igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-d-dp-2:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.53] s
>      * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-2:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [1.27] s
>      * igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-dp-2:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [1.08] s
> 
> Known issues
> 
>    Here are the changes found in XEIGTPW_13566_FULL that come from known
>    issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2233)
>      * igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#911) +3 other tests fail
>      * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1407) +1 other test skip
>      * igt@kms_big_fb@linear-8bpp-rotate-270:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2327)
>      * igt@kms_big_fb@y-tiled-addfb-size-overflow:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#610)
>      * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1124) +4 other tests skip
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1124) +3 other tests skip
>      * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1124) +1 other test skip
>      * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2314 / Intel XE#2894) +1
>             other test skip
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2191)
>      * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#367)
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1512)
>      * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2887) +8 other tests skip
>      * igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-c-dp-2:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#787) +90 other tests
>             skip
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2652 / Intel XE#787) +3 other
>             tests skip
>      * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#3432) +1 other test skip
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#3432)
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
> 
>           * shard-dg2-set2: NOTRUN -> INCOMPLETE (Intel XE#1727 / Intel
>             XE#2705 / Intel XE#3113 / Intel XE#4212 / Intel XE#4345)
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2887) +2 other tests skip
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-2:
> 
>           * shard-dg2-set2: NOTRUN -> INCOMPLETE (Intel XE#2705 / Intel
>             XE#3113 / Intel XE#4212)
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
> 
>           * shard-dg2-set2: PASS -> INCOMPLETE (Intel XE#2705 / Intel XE#4212
>             / Intel XE#4345)
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
> 
>           * shard-dg2-set2: PASS -> INCOMPLETE (Intel XE#1727 / Intel
>             XE#3113) +1 other test incomplete
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:
> 
>           * shard-dg2-set2: PASS -> INCOMPLETE (Intel XE#2705 / Intel
>             XE#4212)
>      * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#455 / Intel XE#787) +15
>             other tests skip
>      * igt@kms_chamelium_audio@hdmi-audio-edid:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2252) +3 other tests skip
>      * igt@kms_chamelium_color@ctm-0-50:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2325)
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#306)
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#306)
>      * igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#373)
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#373)
>      * igt@kms_content_protection@dp-mst-lic-type-1:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2390) +1 other test skip
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#307)
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#307)
>      * igt@kms_content_protection@legacy@pipe-a-dp-2:
> 
>           * shard-dg2-set2: NOTRUN -> FAIL (Intel XE#1178)
>      * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
> 
>           * shard-dg2-set2: NOTRUN -> FAIL (Intel XE#3304)
>      * igt@kms_cursor_crc@cursor-random-max-size:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#455) +1 other test skip
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1424)
>      * igt@kms_cursor_crc@cursor-sliding-max-size:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2320) +1 other test skip
>      * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
> 
>           * shard-dg2-set2: PASS -> INCOMPLETE (Intel XE#3226)
>      * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#309) +2 other tests skip
>      * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#2291) +2 other tests skip
>      * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
> 
>           * shard-bmg: PASS -> DMESG-WARN (Intel XE#5354)
>      * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2291)
>      * igt@kms_dsc@dsc-with-bpc-formats:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2244)
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2244) +1 other test skip
>      * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4422)
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4422)
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4422)
>      * igt@kms_fbcon_fbt@psr-suspend:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#776)
>      * igt@kms_feature_discovery@display-2x:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#702)
>      * igt@kms_feature_discovery@display-4x:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1138)
>      * igt@kms_flip@2x-flip-vs-panning-interruptible:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#2316) +2 other tests skip
>      * igt@kms_flip@2x-plain-flip-ts-check:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2316)
>      * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#301)
>      * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
> 
>           * shard-lnl: PASS -> FAIL (Intel XE#301 / Intel XE#3149) +1 other
>             test fail
>      * igt@kms_flip@flip-vs-suspend@a-hdmi-a6:
> 
>           * shard-dg2-set2: PASS -> TIMEOUT (Intel XE#5737) +1 other test
>             timeout
>      * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2293 / Intel XE#2380)
>      * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2293)
>      * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2311) +13 other tests skip
>      * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-mmap-wc:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#651) +4 other tests skip
>      * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#651) +5 other tests skip
>      * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-pgflip-blt:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2312) +2 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#5390) +11 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#658)
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1469)
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2352)
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2313) +21 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#656) +12 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#653) +7 other tests skip
>      * igt@kms_hdr@invalid-hdr:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#1503)
>      * igt@kms_hdr@static-toggle-dpms:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1503)
>      * igt@kms_joiner@invalid-modeset-force-big-joiner:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#3012)
>      * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
> 
>           * shard-dg2-set2: PASS -> FAIL (Intel XE#616) +1 other test fail
>      * igt@kms_plane_multiple@2x-tiling-4:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#4596) +1 other test skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-5:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2763) +3 other tests skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2763) +4 other tests skip
>      * igt@kms_pm_backlight@bad-brightness:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#870)
>      * igt@kms_pm_rpm@dpms-lpsp:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1439 / Intel XE#3141 / Intel
>             XE#836)
>      * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1489) +2 other tests skip
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1489) +1 other test skip
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2893) +1 other test skip
>      * igt@kms_psr@fbc-psr2-no-drrs:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2850 / Intel XE#929) +3
>             other tests skip
>      * igt@kms_psr@fbc-psr2-no-drrs@edp-1:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4609)
>      * igt@kms_psr@pr-primary-blt:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1406) +2 other tests skip
>      * igt@kms_psr@psr2-sprite-blt:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2234 / Intel XE#2850) +7
>             other tests skip
>      * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
> 
>           * shard-lnl: PASS -> SKIP (Intel XE#4692)
>      * igt@kms_rotation_crc@sprite-rotation-90:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#3414 / Intel XE#3904)
>      * igt@kms_scaling_modes@scaling-mode-center:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2413)
>      * igt@kms_setmode@invalid-clone-single-crtc:
> 
>           * shard-bmg: PASS -> SKIP (Intel XE#1435)
>      * igt@kms_tiled_display@basic-test-pattern:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2426)
>           * shard-dg2-set2: NOTRUN -> FAIL (Intel XE#1729)
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#362)
>      * igt@kms_vrr@max-min:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#1499) +2 other tests skip
>      * igt@xe_eudebug@basic-exec-queues:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4837) +10 other tests skip
>      * igt@xe_eudebug_online@resume-dss:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4837) +2 other tests
>             skip
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4837) +5 other tests skip
>      * igt@xe_evict@evict-beng-large-external:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#688)
>      * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:
> 
>           * shard-dg2-set2: PASS -> SKIP (Intel XE#1392) +3 other tests skip
>      * igt@xe_exec_basic@multigpu-once-null-rebind:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#2322) +7 other tests skip
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1392) +2 other tests skip
>      * igt@xe_exec_fault_mode@twice-invalid-fault:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#288) +4 other tests skip
>      * igt@xe_exec_system_allocator@process-many-large-mmap-huge-nomemset:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4943) +4 other tests skip
>      * igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4943) +12 other tests skip
>      * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-shared-nomemset:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4915) +50 other tests
>             skip
>      * igt@xe_exec_threads@threads-mixed-userptr-rebind:
> 
>           * shard-bmg: PASS -> INCOMPLETE (Intel XE#4842)
>      * igt@xe_oa@whitelisted-registers-userspace-config:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#3573)
>      * igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
> 
>           * shard-dg2-set2: NOTRUN -> FAIL (Intel XE#1173)
>      * igt@xe_pm@s3-multiple-execs:
> 
>           * shard-bmg: PASS -> DMESG-FAIL (Intel XE#5545)
>      * igt@xe_pmu@gt-frequency:
> 
>           * shard-dg2-set2: PASS -> FAIL (Intel XE#4819) +1 other test fail
>      * igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4733)
>      * igt@xe_pxp@pxp-stale-bo-exec-post-suspend:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#4733) +2 other tests skip
>      * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
> 
>           * shard-bmg: NOTRUN -> SKIP (Intel XE#944) +1 other test skip
>      * igt@xe_query@multigpu-query-topology-l3-bank-mask:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#944)
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#944)
>      * igt@xe_sriov_flr@flr-each-isolation:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#3342)
> 
>     Possible fixes
> 
>      * igt@intel_hwmon@hwmon-write:
> 
>           * shard-bmg: FAIL (Intel XE#4665) -> PASS
>      * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
> 
>           * shard-bmg: SKIP (Intel XE#2291) -> PASS +1 other test pass
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
> 
>           * shard-bmg: FAIL (Intel XE#4633) -> PASS
>      * igt@kms_dp_aux_dev:
> 
>           * shard-bmg: SKIP (Intel XE#3009) -> PASS
>      * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
> 
>           * shard-bmg: SKIP (Intel XE#2316) -> PASS +2 other tests pass
>      * igt@kms_pm_dc@dc6-psr:
> 
>           * shard-lnl: FAIL (Intel XE#718) -> PASS +1 other test pass
>      * igt@kms_vrr@cmrr@pipe-a-edp-1:
> 
>           * shard-lnl: FAIL (Intel XE#4459) -> PASS +1 other test pass
>      * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1392) -> PASS +5 other tests pass
>      * igt@xe_pm@d3hot-basic:
> 
>           * shard-bmg: ABORT (Intel XE#4760) -> PASS
>      * {igt@xe_pmu@fn-engine-activity-sched-if-idle@engine-drm_xe_engine_class_video_enhance1}:
> 
>           * shard-bmg: ABORT (Intel XE#3970) -> PASS +1 other test pass
> 
>     Warnings
> 
>      * igt@kms_content_protection@atomic-dpms:
> 
>           * shard-bmg: FAIL (Intel XE#1178) -> SKIP (Intel XE#2341)
>      * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
> 
>           * shard-bmg: SKIP (Intel XE#2311) -> SKIP (Intel XE#2312) +12 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:
> 
>           * shard-bmg: SKIP (Intel XE#2312) -> SKIP (Intel XE#2311) +6 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
> 
>           * shard-bmg: SKIP (Intel XE#5390) -> SKIP (Intel XE#2312) +9 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
> 
>           * shard-bmg: SKIP (Intel XE#2312) -> SKIP (Intel XE#5390) +3 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
> 
>           * shard-bmg: SKIP (Intel XE#2312) -> SKIP (Intel XE#2313) +7 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
> 
>           * shard-bmg: SKIP (Intel XE#2313) -> SKIP (Intel XE#2312) +12 other
>             tests skip
>      * igt@kms_hdr@brightness-with-hdr:
> 
>           * shard-bmg: SKIP (Intel XE#3544) -> SKIP (Intel XE#3374 / Intel
>             XE#3544)
>      * igt@kms_pm_dc@dc3co-vpb-simulation:
> 
>           * shard-lnl: SKIP (Intel XE#736) -> SKIP (Intel XE#1909)
>      * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> 
>           * shard-bmg: SKIP (Intel XE#2509) -> SKIP (Intel XE#2426)
>      * igt@xe_peer2peer@write:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1061) -> FAIL (Intel XE#1173)
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Build changes
> 
>      * IGT: IGT_8489 -> IGTPW_13566
>      * Linux: xe-3516-c59a466c9c1d514e151d30f0a66ce76ce8d21aef ->
>        xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b
> 
>    IGTPW_13566: 2e59493a2456abd9cf7f4c251a60085a2d5204db @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    IGT_8489: 4972020ea0f3d0ac8a0d7dd4f5419119b1b30995 @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    xe-3516-c59a466c9c1d514e151d30f0a66ce76ce8d21aef:
>    c59a466c9c1d514e151d30f0a66ce76ce8d21aef
>    xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b:
>    0a2be3731268a69a6452047c2fb6699ee19afe5b
