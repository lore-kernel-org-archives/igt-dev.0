Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A18C677C4
	for <igt-dev@archiver.kernel.org>; Wed, 11 Jun 2025 10:30:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB12910E60D;
	Wed, 11 Jun 2025 10:30:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YaMt7o4b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F01F10E608
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Jun 2025 10:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749637807; x=1781173807;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=fc+HVqHWWvVZHZv0aM2PN/EGVtGeUuG7WqAmwX6BxoI=;
 b=YaMt7o4bvwg/QTmYxsWcQgKOMCgSCFhuBQoNxpDoMMAOVTDkmqHPhHjK
 jphHpmFMcLTQaWWsrqurW7jfwUhCdGr/12wWTaBKJkYc1PfzoJhx81J7Q
 EeSiCSK51KL1Cj+mQ50bjq5TpPm2O/imKU0RRjfaSKrwCPn2XMo/M3tp/
 OxqWQ/2txyxf5feEz6FhZV3W3aIXrq/gOZ6/ABaHRO/03iCIU1ppRcIN6
 yuKPdjSXFExmHkGvnaLfrDdZ+0m5qajOymsQmvjamOZYsQWxyLXh/NyIE
 59lJ6qpteNHmwrWYiLz9QIpjuC+Idp29DzsU669DkOETBHfZSMJ+x7vSs Q==;
X-CSE-ConnectionGUID: dcHGLUhvT2Cy1wJDXm9YAw==
X-CSE-MsgGUID: SFQu2UF8Ssu757mBUtUxMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="74311961"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="74311961"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 03:30:07 -0700
X-CSE-ConnectionGUID: s5GYts01R26In91qPMv6Fw==
X-CSE-MsgGUID: UWputOsjQNSXfYflh07Xeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="147068022"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.144])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 03:30:05 -0700
Date: Wed, 11 Jun 2025 12:30:01 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_lib=2Fintel?=
 =?utf-8?Q?=5Fcompute?= =?utf-8?Q?=3A?= change shader and logic for
 threadgroup preemption (rev2)
Message-ID: <dtof6c7rcujusaerxo36ooxcetieltijd5s7syvoadcyu4zeft@b3m7t57dxqur>
References: <20250611054628.678665-2-zbigniew.kempczynski@intel.com>
 <174963309838.66717.12480457406070939720@1538d3639d33>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174963309838.66717.12480457406070939720@1538d3639d33>
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

On Wed, Jun 11, 2025 at 09:11:38AM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  lib/intel_compute: change shader and logic for threadgroup        
>             preemption (rev2)                                                 
>    URL:     https://patchwork.freedesktop.org/series/149934/                  
>    State:   failure                                                           
>    Details: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13270/index.html  
> 
>         CI Bug Log - changes from XEIGT_8404_FULL -> XEIGTPW_13270_FULL
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with XEIGTPW_13270_FULL absolutely need to
>    be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in XEIGTPW_13270_FULL, please notify your bug team
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
>    XEIGTPW_13270_FULL:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@xe_pmu@engine-activity-single-load:
>           * shard-dg2-set2: NOTRUN -> FAIL +4 other tests fail

Unrelated. Change touches xe_compute_preempt only.

--
Zbigniew

> 
> Known issues
> 
>    Here are the changes found in XEIGTPW_13270_FULL that come from known
>    issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@intel_hwmon@hwmon-read:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1125) +1 other test skip
>      * igt@kms_3d:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1465)
>      * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#623)
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1466)
>      * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#3157)
>      * igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-a-hdmi-a-6-4-rc-ccs-cc:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#3767) +31 other tests
>             skip
>      * igt@kms_async_flips@invalid-async-flip:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#873)
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#873)
>      * igt@kms_async_flips@invalid-async-flip-atomic:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#3768)
>      * igt@kms_async_flips@test-cursor-atomic:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#664) +1 other test skip
>      * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#3279) +1 other test skip
>      * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#316) +21 other tests
>             skip
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1407) +23 other tests skip
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#3658) +2 other tests skip
>      * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1124) +52 other tests skip
>      * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#607) +1 other test skip
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1477) +1 other test skip
>      * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1124) +55 other tests
>             skip
>      * igt@kms_big_fb@yf-tiled-addfb:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#619) +1 other test skip
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1467) +1 other test skip
>      * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#610)
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1428)
>      * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2191) +6 other tests skip
>      * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2191) +6 other tests
>             skip
>      * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#367) +5 other tests skip
>      * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#367) +14 other tests
>             skip
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1512) +5 other tests skip
>      * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2887) +79 other tests skip
>      * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2907) +8 other tests
>             skip
>      * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2669) +19 other tests skip
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#3442) +1 other test skip
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2669 / Intel XE#3433) +3
>             other tests skip
>      * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#3432) +9 other tests skip
>      * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#787) +524 other tests
>             skip
>      * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#455 / Intel XE#787) +149
>             other tests skip
>      * igt@kms_cdclk@mode-transition-all-outputs:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4418)
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4418)
>      * igt@kms_cdclk@mode-transition@pipe-b-edp-1:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4417) +3 other tests skip
>      * igt@kms_cdclk@mode-transition@pipe-c-dp-4:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4417) +3 other tests
>             skip
>      * igt@kms_cdclk@plane-scaling:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4416) +3 other tests skip
>      * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4416) +3 other tests
>             skip
>      * igt@kms_chamelium_color@ctm-blue-to-red:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#306) +9 other tests skip
>      * igt@kms_chamelium_color@degamma:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#306) +8 other tests skip
>      * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#373) +53 other tests skip
>      * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#373) +54 other tests
>             skip
>      * igt@kms_content_protection@dp-mst-type-0:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#307) +2 other tests skip
>      * igt@kms_content_protection@dp-mst-type-1:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#307) +3 other tests skip
>      * igt@kms_content_protection@legacy@pipe-a-dp-4:
> 
>           * shard-dg2-set2: NOTRUN -> FAIL (Intel XE#1178) +8 other tests
>             fail
>      * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
> 
>           * shard-dg2-set2: NOTRUN -> FAIL (Intel XE#3304)
>      * igt@kms_content_protection@mei-interface:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1468)
>      * igt@kms_content_protection@uevent:
> 
>           * shard-dg2-set2: NOTRUN -> FAIL (Intel XE#1188) +1 other test fail
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#5176) +6 other tests skip
>      * igt@kms_cursor_crc@cursor-onscreen-512x170:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#308) +8 other tests skip
>      * igt@kms_cursor_crc@cursor-sliding-512x512:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2321) +9 other tests skip
>      * igt@kms_cursor_crc@cursor-sliding-64x21:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1424) +25 other tests skip
>      * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#309) +26 other tests skip
>      * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#323) +2 other tests skip
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#323) +2 other tests skip
>      * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1508)
>      * igt@kms_display_modes@extended-mode-basic:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4302)
>      * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4494 / i915#3804)
>      * igt@kms_dp_link_training@non-uhbr-mst:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4354)
>      * igt@kms_dp_link_training@uhbr-mst:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4354) +2 other tests skip
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4356)
>      * igt@kms_dp_linktrain_fallback@dp-fallback:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4294)
>      * igt@kms_dp_linktrain_fallback@dsc-fallback:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4331)
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4331)
>      * igt@kms_dsc@dsc-with-bpc-formats:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2244) +6 other tests skip
>      * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4422) +2 other tests
>             skip
>      * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4422) +2 other tests skip
>      * igt@kms_fbcon_fbt@psr:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#776) +1 other test skip
>      * igt@kms_feature_discovery@chamelium:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#701)
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#701)
>      * igt@kms_feature_discovery@display-2x:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#702)
>      * igt@kms_feature_discovery@display-3x:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#703)
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#703)
>      * igt@kms_feature_discovery@display-4x:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1138)
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1138)
>      * igt@kms_feature_discovery@dp-mst:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1137)
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1137)
>      * igt@kms_feature_discovery@psr1:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1135)
>      * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:
> 
>           * shard-dg2-set2: NOTRUN -> FAIL (Intel XE#301 / Intel XE#3321) +3
>             other tests fail
>      * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1421) +38 other tests skip
>      * igt@kms_flip@bo-too-big-interruptible:
> 
>           * shard-lnl: NOTRUN -> TIMEOUT (Intel XE#1504) +1 other test
>             timeout
>      * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
> 
>           * shard-lnl: NOTRUN -> FAIL (Intel XE#3098 / Intel XE#3149 / Intel
>             XE#886)
>      * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-edp1:
> 
>           * shard-lnl: NOTRUN -> FAIL (Intel XE#3098)
>      * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1:
> 
>           * shard-lnl: NOTRUN -> FAIL (Intel XE#886) +1 other test fail
>      * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
> 
>           * shard-lnl: NOTRUN -> FAIL (Intel XE#301) +4 other tests fail
>      * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a6:
> 
>           * shard-dg2-set2: NOTRUN -> INCOMPLETE (Intel XE#2049) +1 other
>             test incomplete
>      * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
> 
>           * shard-lnl: NOTRUN -> FAIL (Intel XE#301 / Intel XE#3149) +1 other
>             test fail
>      * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6:
> 
>           * shard-dg2-set2: NOTRUN -> FAIL (Intel XE#301) +6 other tests fail
>      * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1397) +8 other tests skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1401) +24 other tests skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1397 / Intel XE#1745) +8
>             other tests skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling:
> 
>           * shard-lnl: NOTRUN -> FAIL (Intel XE#4683) +1 other test fail
>      * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1401 / Intel XE#1745) +24
>             other tests skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#455) +93 other tests
>             skip
>      * igt@kms_force_connector_basic@prune-stale-modes:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#352) +2 other tests skip
>      * igt@kms_frontbuffer_tracking@drrs-suspend:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#651) +162 other tests
>             skip
>      * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#651) +75 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#658) +2 other tests skip
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1469) +2 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#653) +161 other tests
>             skip
>      * igt@kms_frontbuffer_tracking@plane-fbc-rte:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1158)
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#656) +207 other tests skip
>      * igt@kms_getfb@getfb-reject-ccs:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#605)
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#605)
>      * igt@kms_hdmi_inject@inject-4k:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1470)
>      * igt@kms_hdmi_inject@inject-audio:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1470 / Intel XE#2853)
>      * igt@kms_hdr@brightness-with-hdr:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#3374 / Intel XE#3544)
>      * igt@kms_hdr@invalid-metadata-sizes:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1503) +3 other tests skip
>      * igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1450) +1 other test skip
>      * igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1450 / Intel XE#2568) +1
>             other test skip
>      * igt@kms_joiner@basic-big-joiner:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#346) +1 other test skip
>      * igt@kms_joiner@basic-max-non-joiner:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4298)
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4298)
>      * igt@kms_joiner@basic-ultra-joiner:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2927) +1 other test skip
>      * igt@kms_joiner@invalid-modeset-big-joiner:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#346) +1 other test skip
>      * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2934) +1 other test skip
>      * igt@kms_joiner@invalid-modeset-ultra-joiner:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2927) +1 other test skip
>      * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2925) +2 other tests
>             skip
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4090)
>      * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#356)
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#356)
>      * igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0:
> 
>           * shard-lnl: NOTRUN -> FAIL (Intel XE#5195) +2 other tests fail
>      * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
> 
>           * shard-dg2-set2: NOTRUN -> FAIL (Intel XE#616) +3 other tests fail
>      * igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#599) +9 other tests skip
>      * igt@kms_plane_multiple@2x-tiling-none:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4596) +3 other tests skip
>      * igt@kms_plane_multiple@2x-tiling-y:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#5021) +1 other test skip
>      * igt@kms_plane_multiple@tiling-x@pipe-c-edp-1:
> 
>           * shard-lnl: NOTRUN -> FAIL (Intel XE#4658) +3 other tests fail
>      * igt@kms_plane_multiple@tiling-y:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#5020) +1 other test skip
>      * igt@kms_plane_multiple@tiling-yf:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#5020) +1 other test skip
>      * igt@kms_plane_scaling@intel-max-src-size:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#3307)
>      * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2763) +49 other tests skip
>      * igt@kms_pm_backlight@brightness-with-dpms:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2938)
>      * igt@kms_pm_backlight@fade-with-suspend:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#870) +4 other tests skip
>      * igt@kms_pm_dc@dc3co-vpb-simulation:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#736)
>      * igt@kms_pm_dc@dc5-dpms-negative:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1131)
>      * igt@kms_pm_dc@dc5-psr:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1129) +1 other test skip
>      * igt@kms_pm_dc@dc5-retention-flops:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#3309)
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#3309)
>      * igt@kms_pm_dc@dc6-dpms:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#908) +1 other test skip
>      * igt@kms_pm_dc@dc6-psr:
> 
>           * shard-lnl: NOTRUN -> FAIL (Intel XE#718) +1 other test fail
>      * igt@kms_pm_dc@deep-pkgc:
> 
>           * shard-lnl: NOTRUN -> FAIL (Intel XE#2029)
>      * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1439 / Intel XE#836)
>      * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1439 / Intel XE#3141) +2
>             other tests skip
>      * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1489) +43 other tests
>             skip
>      * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2893 / Intel XE#4608) +10
>             other tests skip
>      * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4608) +20 other tests skip
>      * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2893) +19 other tests skip
>      * igt@kms_psr2_su@frontbuffer-xrgb8888:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1128) +3 other tests skip
>      * igt@kms_psr2_su@page_flip-nv12:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1122) +4 other tests
>             skip
>      * igt@kms_psr@fbc-psr2-cursor-render@edp-1:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4609) +12 other tests skip
>      * igt@kms_psr@pr-sprite-render:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1406) +39 other tests skip
>      * igt@kms_psr@psr-dpms:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2850 / Intel XE#929) +80
>             other tests skip
>      * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2939) +1 other test skip
>      * igt@kms_rotation_crc@primary-rotation-90:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#3414 / Intel XE#3904) +10
>             other tests skip
>      * igt@kms_rotation_crc@primary-x-tiled-reflect-x-0:
> 
>           * shard-lnl: NOTRUN -> FAIL (Intel XE#4689)
>      * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#3414) +9 other tests
>             skip
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1127) +3 other tests
>             skip
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1127) +1 other test skip
>      * igt@kms_setmode@basic@pipe-a-hdmi-a-6-pipe-b-dp-4:
> 
>           * shard-dg2-set2: NOTRUN -> FAIL (Intel XE#2883) +4 other tests
>             fail
>      * igt@kms_setmode@invalid-clone-single-crtc:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1435) +3 other tests skip
>      * igt@kms_tiled_display@basic-test-pattern:
> 
>           * shard-dg2-set2: NOTRUN -> FAIL (Intel XE#1729)
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#362)
>      * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#362)
>      * igt@kms_tv_load_detect@load-detect:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#330)
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#330)
>      * igt@kms_vrr@lobf:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2168) +1 other test skip
>      * igt@kms_vrr@seamless-rr-switch-drrs:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1499) +2 other tests skip
>      * igt@runner@aborted:
> 
>           * shard-bmg: NOTRUN -> (FAIL, FAIL, FAIL, FAIL, FAIL, FAIL, FAIL,
>             FAIL, FAIL, FAIL, FAIL, FAIL, FAIL, FAIL, FAIL, FAIL, FAIL, FAIL,
>             FAIL, FAIL, FAIL, FAIL, FAIL, FAIL, FAIL) (Intel XE#5080)
>      * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1091 / Intel XE#2849) +1
>             other test skip
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1091 / Intel XE#2849) +1
>             other test skip
>      * igt@xe_compute@ccs-mode-compute-kernel:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1447)
>      * igt@xe_compute_preempt@compute-preempt:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1280 / Intel XE#455) +3
>             other tests skip
>      * igt@xe_configfs@survivability-mode:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#5084)
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#5084)
>      * igt@xe_copy_basic@mem-copy-linear-0xfffe:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1123) +3 other tests
>             skip
>      * igt@xe_copy_basic@mem-set-linear-0xfffe:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1126) +2 other tests
>             skip
>      * igt@xe_create@create-big-vram:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1062)
>      * igt@xe_eu_stall@invalid-event-report-count:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4497) +6 other tests
>             skip
>      * igt@xe_eudebug@basic-connect:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4837) +66 other tests skip
>      * igt@xe_eudebug@basic-vm-access-parameters-userptr-faultable:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4837) +74 other tests
>             skip
>      * igt@xe_eudebug_sriov@deny-sriov:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4518)
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4518) +1 other test skip
>      * igt@xe_evict@evict-beng-large-external-cm:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#688) +24 other tests skip
>      * igt@xe_exec_basic@multigpu-no-exec-userptr:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1392) +45 other tests skip
>      * igt@xe_exec_fault_mode@once-basic-imm:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#288) +136 other tests
>             skip
>      * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2360) +3 other tests
>             skip
>      * igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontunmap-eocheck:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4915) +1383 other tests
>             skip
>      * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free-huge:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4943) +123 other tests skip
>      * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset:
> 
>           * shard-lnl: NOTRUN -> FAIL (Intel XE#5018)
>      * igt@xe_fault_injection@inject-fault-probe-function-xe_add_hw_engine_class_defaults:
> 
>           * shard-lnl: NOTRUN -> ABORT (Intel XE#4757)
>      * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
> 
>           * shard-dg2-set2: NOTRUN -> ABORT (Intel XE#4917 / Intel XE#5227)
>           * shard-lnl: NOTRUN -> ABORT (Intel XE#4917)
>      * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
> 
>           * shard-dg2-set2: NOTRUN -> INCOMPLETE (Intel XE#4911)
>           * shard-lnl: NOTRUN -> ABORT (Intel XE#4911)
>      * igt@xe_huc_copy@huc_copy:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#255)
>      * igt@xe_live_ktest@xe_eudebug:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2833)
>      * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2229) +1 other test skip
>      * igt@xe_media_fill@media-fill:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#560)
>      * igt@xe_mmap@pci-membarrier:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#5100) +3 other tests skip
>      * igt@xe_mmap@small-bar:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#512)
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#512)
>      * igt@xe_mmap@vram:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1416)
>      * igt@xe_module_load@force-load:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#378)
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#378)
>      * igt@xe_noexec_ping_pong:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#379)
>      * igt@xe_oa@buffer-size:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4501)
>      * igt@xe_oa@mmio-triggered-reports-read:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#5103)
>      * igt@xe_oa@non-system-wide-paranoid:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2541 / Intel XE#3573)
>             +30 other tests skip
>      * igt@xe_oa@oa-tlb-invalidate:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2248)
>      * igt@xe_oa@syncs-ufence-wait:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2541 / Intel XE#3573 /
>             Intel XE#4501) +5 other tests skip
>      * igt@xe_pat@display-vs-wb-transient:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1337)
>      * igt@xe_pat@pat-index-xe2:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#977)
>      * igt@xe_pat@pat-index-xehpc:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2838 / Intel XE#979)
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1420 / Intel XE#2838)
>      * igt@xe_pat@pat-index-xelp:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#977)
>      * igt@xe_pat@pat-index-xelpg:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#979)
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#979)
>      * igt@xe_peer2peer@read:
> 
>           * shard-dg2-set2: NOTRUN -> FAIL (Intel XE#1173) +3 other tests
>             fail
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1061) +1 other test skip
>      * igt@xe_pm@d3cold-basic:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2284 / Intel XE#366) +7 other
>             tests skip
>      * igt@xe_pm@d3cold-mmap-vram:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2284 / Intel XE#366) +7
>             other tests skip
>      * igt@xe_pm@d3cold-mocs:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#2284)
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2284)
>      * igt@xe_pm@d3hot-mmap-vram:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#1948)
>      * igt@xe_pm@s3-mocs:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#584) +7 other tests skip
>      * igt@xe_pm@s4-mocs:
> 
>           * shard-lnl: NOTRUN -> ABORT (Intel XE#1794)
>      * igt@xe_pm@vram-d3cold-threshold:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#579)
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#579)
>      * igt@xe_pmu@all-fn-engine-activity-load:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4650) +1 other test skip
>      * igt@xe_pmu@fn-engine-activity-sched-if-idle:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4650) +2 other tests skip
>      * igt@xe_pmu@gt-frequency:
> 
>           * shard-dg2-set2: NOTRUN -> FAIL (Intel XE#5166) +1 other test fail
>      * igt@xe_pxp@pxp-termination-key-update-post-rpm:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4733) +14 other tests
>             skip
>      * igt@xe_query@multigpu-query-engines:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#944) +15 other tests
>             skip
>      * igt@xe_query@multigpu-query-invalid-size:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#944) +13 other tests skip
>      * igt@xe_render_copy@render-stress-2-copies:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4814) +2 other tests
>             skip
>      * igt@xe_spin_batch@spin-mem-copy:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4821)
>      * igt@xe_sriov_auto_provisioning@exclusive-ranges:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4130) +3 other tests
>             skip
>      * igt@xe_sriov_auto_provisioning@fair-allocation:
> 
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4130) +3 other tests skip
>      * igt@xe_sriov_flr@flr-each-isolation:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#3342)
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#3342)
>      * igt@xe_sriov_flr@flr-vfs-parallel:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4273) +1 other test skip
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4273) +1 other test skip
>      * igt@xe_sriov_scheduling@nonpreempt-engine-resets:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4351) +1 other test skip
>           * shard-lnl: NOTRUN -> SKIP (Intel XE#4351) +1 other test skip
> 
>     Possible fixes
> 
>      * igt@xe_module_load@load:
>           * shard-bmg: (DMESG-FAIL, DMESG-FAIL, DMESG-FAIL, DMESG-FAIL,
>             DMESG-FAIL, DMESG-FAIL, DMESG-FAIL, DMESG-FAIL, DMESG-FAIL,
>             DMESG-FAIL, DMESG-FAIL, DMESG-FAIL, DMESG-FAIL, DMESG-FAIL,
>             DMESG-FAIL, DMESG-FAIL, DMESG-FAIL, DMESG-FAIL, DMESG-FAIL,
>             DMESG-FAIL, DMESG-FAIL, DMESG-FAIL, DMESG-FAIL, DMESG-FAIL,
>             DMESG-FAIL) (Intel XE#5231) -> (PASS, PASS, PASS, PASS, PASS,
>             PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS,
>             PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS)
> 
>     Warnings
> 
>      * igt@xe_module_load@load:
>           * shard-lnl: (DMESG-FAIL, DMESG-FAIL, DMESG-FAIL, DMESG-FAIL,
>             DMESG-FAIL, DMESG-FAIL, DMESG-FAIL, DMESG-FAIL, DMESG-FAIL,
>             DMESG-FAIL, DMESG-FAIL, DMESG-FAIL, DMESG-FAIL, DMESG-FAIL,
>             DMESG-FAIL, DMESG-FAIL, DMESG-FAIL, DMESG-FAIL, DMESG-FAIL,
>             DMESG-FAIL, DMESG-FAIL, DMESG-FAIL, DMESG-FAIL, DMESG-FAIL,
>             DMESG-FAIL) (Intel XE#5231) -> (PASS, SKIP, PASS, PASS, PASS,
>             PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS,
>             PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS)
>             (Intel XE#378)
>           * shard-dg2-set2: (DMESG-FAIL, DMESG-FAIL, DMESG-FAIL, DMESG-FAIL,
>             DMESG-FAIL, DMESG-FAIL, DMESG-FAIL, DMESG-FAIL, DMESG-FAIL,
>             DMESG-FAIL, DMESG-FAIL, DMESG-FAIL, DMESG-FAIL, DMESG-FAIL,
>             DMESG-FAIL, DMESG-FAIL, DMESG-FAIL, DMESG-FAIL, DMESG-FAIL,
>             DMESG-FAIL, DMESG-FAIL, DMESG-FAIL, DMESG-FAIL, DMESG-FAIL,
>             DMESG-FAIL) (Intel XE#5231) -> (SKIP, PASS, PASS, PASS, PASS,
>             PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS,
>             PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS, PASS) (Intel
>             XE#378)
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Build changes
> 
>      * IGT: IGT_8404 -> IGTPW_13270
> 
>    IGTPW_13270: 13270
>    IGT_8404: dad4b2bb9e5a2c87ae0275efbf9f0df00a67ef46 @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60:
>    7bc153635620254b73cfe8714ce42768b2bf6d60
