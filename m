Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62153C3ABC3
	for <igt-dev@archiver.kernel.org>; Mon, 12 May 2025 08:07:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C09B10E307;
	Mon, 12 May 2025 08:07:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dTHKJ97o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87EAC10E2F7;
 Mon, 12 May 2025 08:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747037266; x=1778573266;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=lCayuJG94wEGk8acBtkeXQdUIT002Z9zyh+lN9altKc=;
 b=dTHKJ97oUlgjRd80haecYhjmssy4xKAX86r56EWaEdFJMek0kJZ0uoDE
 Vbphr7s0C0mfkapanbuq5xep4BDnNvepNkCVMR6iaWkKSHuY9JHpB8EyU
 EisbuxSGv7BNMqk5Mz/03uXfE2VgLZGXh0l5KohrhRKyP8Tko8hnOVlJz
 XQSUdNXYZyoQP++EbcItpdDfEmQFL9M2ohbZyHzG1rF8+aLhM4TXKU5CT
 g3UKTdLu8a46AQJsDySaFy5NXlhDFzpsicBc7SeIwRFHzj2XZzUYeNT30
 RTm8f1Icp2FzXsPsBZqf8PxAEPmXinYRuEqsPHr/9Ln8S7727HxOEyXOU w==;
X-CSE-ConnectionGUID: 9m4y2bSrTtO8YHT+nMlwQw==
X-CSE-MsgGUID: kwPz0EmnSgadhIiB4Uhamg==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="47932208"
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; d="scan'208";a="47932208"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 01:07:45 -0700
X-CSE-ConnectionGUID: FwEjyXm0RaqjqlxHaL+bOg==
X-CSE-MsgGUID: TuqKPuRxRBSxWl6mVubFbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; d="scan'208";a="138218047"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.245.113.30])
 ([10.245.113.30])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 01:07:44 -0700
Message-ID: <09911483-0ded-44d5-9bfd-b9ffbd11a6b6@linux.intel.com>
Date: Mon, 12 May 2025 10:07:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_tests/intel?=
 =?UTF-8?Q?/xe=5Fpmu=3A_Improve_VF_setup_and_cleanup?=
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250506101554.629218-1-marcin.bernatowicz@linux.intel.com>
 <174653641348.51226.13491881351997693957@c664b1dc75d1>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <174653641348.51226.13491881351997693957@c664b1dc75d1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 5/6/2025 3:00 PM, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/xe_pmu: Improve VF setup and cleanup
> URL   : https://patchwork.freedesktop.org/series/148629/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8354_FULL -> XEIGTPW_13082_FULL
> ====================================================
> 
> Summary
> -------
> 
>    **FAILURE**
> 
>    Serious unknown changes coming with XEIGTPW_13082_FULL absolutely need to be
>    verified manually.
>    
>    If you think the reported changes have nothing to do with the changes
>    introduced in XEIGTPW_13082_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in CI.
> 
>    
> 
> Participating hosts (4 -> 3)
> ------------------------------
> 
>    Missing    (1): shard-adlp
> 
> Possible new issues
> -------------------
> 
>    Here are the unknown changes that may have been introduced in XEIGTPW_13082_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>    * igt@kms_plane_lowres@tiling-4:
>      - shard-dg2-set2:     [PASS][1] -> [INCOMPLETE][2]
>     [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-dg2-432/igt@kms_plane_lowres@tiling-4.html
>     [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-dg2-436/igt@kms_plane_lowres@tiling-4.html
> 
>    * igt@kms_plane_lowres@tiling-4@pipe-a-hdmi-a-6:
>      - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][3]
>     [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-dg2-436/igt@kms_plane_lowres@tiling-4@pipe-a-hdmi-a-6.html
> 

Not related to the change.
--
marcin

>    
> Known issues
> ------------
> 
>    Here are the changes found in XEIGTPW_13082_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>    * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>      - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#2233])
>     [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
>      - shard-lnl:          NOTRUN -> [SKIP][5] ([Intel XE#1466])
>     [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-lnl-7/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>    * igt@kms_addfb_basic@unused-modifier:
>      - shard-dg2-set2:     [PASS][6] -> [SKIP][7] ([Intel XE#4208] / [i915#2575]) +1 other test skip
>     [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-dg2-434/igt@kms_addfb_basic@unused-modifier.html
>     [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-dg2-435/igt@kms_addfb_basic@unused-modifier.html
> 
>    * igt@kms_async_flips@alternate-sync-async-flip-atomic:
>      - shard-bmg:          NOTRUN -> [FAIL][8] ([Intel XE#3701] / [Intel XE#3718] / [Intel XE#827])
>     [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
> 
>    * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2:
>      - shard-bmg:          NOTRUN -> [FAIL][9] ([Intel XE#3718] / [Intel XE#827])
>     [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2.html
> 
>    * igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1:
>      - shard-lnl:          [PASS][10] -> [FAIL][11] ([Intel XE#911]) +3 other tests fail
>     [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html
>     [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html
> 
>    * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
>      - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2370])
>     [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
> 
>    * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
>      - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2327])
>     [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-5/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html
> 
>    * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>      - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#3658])
>     [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>    * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#1124]) +4 other tests skip
>     [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-dg2-433/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
> 
>    * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
>      - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#1124]) +1 other test skip
>     [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-lnl-5/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
> 
>    * igt@kms_big_fb@yf-tiled-addfb:
>      - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2328])
>     [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-6/igt@kms_big_fb@yf-tiled-addfb.html
>      - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#1467])
>     [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-lnl-1/igt@kms_big_fb@yf-tiled-addfb.html
> 
>    * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
>      - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#1124]) +8 other tests skip
>     [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html
> 
>    * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#2191])
>     [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
> 
>    * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
>      - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
>     [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
> 
>    * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
>      - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#367])
>     [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-lnl-8/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
>      - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#367])
>     [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-1/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
> 
>    * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#367])
>     [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-dg2-433/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
> 
>    * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs:
>      - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#2887]) +2 other tests skip
>     [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-lnl-6/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs.html
> 
>    * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#787]) +118 other tests skip
>     [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2.html
> 
>    * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#2907])
>     [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
> 
>    * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1:
>      - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#2669]) +7 other tests skip
>     [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-lnl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1.html
> 
>    * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
>      - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#3432]) +1 other test skip
>     [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html
>      - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#3432])
>     [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html
> 
>    * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-2:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#455] / [Intel XE#787]) +20 other tests skip
>     [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-2.html
> 
>    * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs:
>      - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2887]) +10 other tests skip
>     [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-8/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs.html
> 
>    * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:
>      - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][33] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) +1 other test incomplete
>     [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html
> 
>    * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:
>      - shard-dg2-set2:     [PASS][34] -> [INCOMPLETE][35] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
>     [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html
>     [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html
> 
>    * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
>      - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2652] / [Intel XE#787]) +8 other tests skip
>     [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html
> 
>    * igt@kms_cdclk@plane-scaling:
>      - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2724])
>     [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-7/igt@kms_cdclk@plane-scaling.html
> 
>    * igt@kms_cdclk@plane-scaling@pipe-b-dp-2:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#4416]) +3 other tests skip
>     [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-2.html
> 
>    * igt@kms_chamelium_color@ctm-limited-range:
>      - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#306])
>     [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-lnl-6/igt@kms_chamelium_color@ctm-limited-range.html
>      - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2325]) +1 other test skip
>     [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-1/igt@kms_chamelium_color@ctm-limited-range.html
> 
>    * igt@kms_chamelium_hpd@common-hpd-after-suspend:
>      - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2252]) +9 other tests skip
>     [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-6/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
>      - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#373]) +5 other tests skip
>     [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-dg2-436/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
>      - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#373]) +3 other tests skip
>     [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-lnl-7/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
> 
>    * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
>      - shard-bmg:          NOTRUN -> [FAIL][44] ([Intel XE#1178]) +1 other test fail
>     [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-7/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html
> 
>    * igt@kms_content_protection@dp-mst-type-0:
>      - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2390]) +1 other test skip
>     [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-1/igt@kms_content_protection@dp-mst-type-0.html
>      - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#307])
>     [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-dg2-434/igt@kms_content_protection@dp-mst-type-0.html
>      - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#307]) +1 other test skip
>     [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-lnl-8/igt@kms_content_protection@dp-mst-type-0.html
> 
>    * igt@kms_content_protection@legacy@pipe-a-dp-2:
>      - shard-dg2-set2:     NOTRUN -> [FAIL][48] ([Intel XE#1178]) +2 other tests fail
>     [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-dg2-432/igt@kms_content_protection@legacy@pipe-a-dp-2.html
> 
>    * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
>      - shard-dg2-set2:     NOTRUN -> [FAIL][49] ([Intel XE#3304])
>     [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-dg2-464/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html
> 
>    * igt@kms_content_protection@lic-type-1:
>      - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2341])
>     [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-8/igt@kms_content_protection@lic-type-1.html
> 
>    * igt@kms_content_protection@uevent@pipe-a-dp-2:
>      - shard-bmg:          NOTRUN -> [FAIL][51] ([Intel XE#1188])
>     [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-1/igt@kms_content_protection@uevent@pipe-a-dp-2.html
> 
>    * igt@kms_cursor_crc@cursor-sliding-128x42:
>      - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#1424])
>     [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-lnl-4/igt@kms_cursor_crc@cursor-sliding-128x42.html
> 
>    * igt@kms_cursor_crc@cursor-sliding-256x85:
>      - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2320]) +4 other tests skip
>     [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-256x85.html
> 
>    * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
>      - shard-bmg:          [PASS][54] -> [SKIP][55] ([Intel XE#2291]) +7 other tests skip
>     [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-bmg-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
>     [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
> 
>    * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
>      - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2291])
>     [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
> 
>    * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
>      - shard-bmg:          [PASS][57] -> [SKIP][58] ([Intel XE#1340])
>     [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-bmg-8/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
>     [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
> 
>    * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
>      - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2244]) +1 other test skip
>     [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-1/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
> 
>    * igt@kms_fbcon_fbt@fbc-suspend:
>      - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#4156]) +1 other test skip
>     [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-5/igt@kms_fbcon_fbt@fbc-suspend.html
> 
>    * igt@kms_feature_discovery@psr2:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#1135])
>     [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-dg2-435/igt@kms_feature_discovery@psr2.html
> 
>    * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
>      - shard-bmg:          NOTRUN -> [FAIL][62] ([Intel XE#3321]) +9 other tests fail
>     [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
> 
>    * igt@kms_flip@2x-nonexisting-fb:
>      - shard-bmg:          [PASS][63] -> [SKIP][64] ([Intel XE#2316]) +9 other tests skip
>     [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-bmg-7/igt@kms_flip@2x-nonexisting-fb.html
>     [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html
> 
>    * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
>      - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#2316]) +1 other test skip
>     [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html
>      - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#1421]) +2 other tests skip
>     [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-lnl-4/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html
> 
>    * igt@kms_flip@blocking-wf_vblank:
>      - shard-bmg:          [PASS][67] -> [FAIL][68] ([Intel XE#2882]) +1 other test fail
>     [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-bmg-4/igt@kms_flip@blocking-wf_vblank.html
>     [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-4/igt@kms_flip@blocking-wf_vblank.html
> 
>    * igt@kms_flip@flip-vs-expired-vblank:
>      - shard-dg2-set2:     [PASS][69] -> [FAIL][70] ([Intel XE#301])
>     [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank.html
>     [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank.html
> 
>    * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
>      - shard-lnl:          [PASS][71] -> [FAIL][72] ([Intel XE#301]) +2 other tests fail
>     [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
>     [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
> 
>    * igt@kms_flip@flip-vs-expired-vblank@c-dp2:
>      - shard-dg2-set2:     NOTRUN -> [FAIL][73] ([Intel XE#301])
>     [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank@c-dp2.html
> 
>    * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode:
>      - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#1401]) +2 other tests skip
>     [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode.html
> 
>    * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
>      - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#2293] / [Intel XE#2380]) +4 other tests skip
>     [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html
> 
>    * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
>      - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#2293]) +4 other tests skip
>     [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
> 
>    * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#455]) +6 other tests skip
>     [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html
>      - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#1401] / [Intel XE#1745]) +2 other tests skip
>     [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html
> 
>    * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
>      - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#656]) +8 other tests skip
>     [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
> 
>    * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
>      - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#2312]) +18 other tests skip
>     [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
> 
>    * igt@kms_frontbuffer_tracking@drrs-suspend:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#651]) +13 other tests skip
>     [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-suspend.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
>      - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#4141]) +5 other tests skip
>     [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-tiling-y:
>      - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#2352])
>     [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
> 
>    * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:
>      - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#2311]) +17 other tests skip
>     [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:
>      - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#2313]) +15 other tests skip
>     [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html
> 
>    * igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#653]) +16 other tests skip
>     [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html
> 
>    * igt@kms_hdr@invalid-metadata-sizes:
>      - shard-bmg:          [PASS][87] -> [SKIP][88] ([Intel XE#1503])
>     [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-bmg-8/igt@kms_hdr@invalid-metadata-sizes.html
>     [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-4/igt@kms_hdr@invalid-metadata-sizes.html
> 
>    * igt@kms_hdr@static-toggle-dpms:
>      - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#1503])
>     [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-4/igt@kms_hdr@static-toggle-dpms.html
> 
>    * igt@kms_joiner@basic-force-big-joiner:
>      - shard-bmg:          [PASS][90] -> [SKIP][91] ([Intel XE#3012])
>     [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-bmg-1/igt@kms_joiner@basic-force-big-joiner.html
>     [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html
> 
>    * igt@kms_joiner@basic-ultra-joiner:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#2927])
>     [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-dg2-432/igt@kms_joiner@basic-ultra-joiner.html
> 
>    * igt@kms_joiner@invalid-modeset-big-joiner:
>      - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#346])
>     [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-1/igt@kms_joiner@invalid-modeset-big-joiner.html
> 
>    * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>      - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#2501])
>     [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>    * igt@kms_plane_multiple@2x-tiling-4:
>      - shard-bmg:          [PASS][95] -> [SKIP][96] ([Intel XE#4596])
>     [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-4.html
>     [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-4.html
> 
>    * igt@kms_plane_multiple@2x-tiling-none:
>      - shard-lnl:          NOTRUN -> [SKIP][97] ([Intel XE#4596])
>     [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-lnl-1/igt@kms_plane_multiple@2x-tiling-none.html
> 
>    * igt@kms_plane_multiple@tiling-y:
>      - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#2493])
>     [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-5/igt@kms_plane_multiple@tiling-y.html
> 
>    * igt@kms_plane_scaling@2x-scaler-multi-pipe:
>      - shard-bmg:          [PASS][99] -> [SKIP][100] ([Intel XE#2571])
>     [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-bmg-7/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
>     [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-5/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
> 
>    * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b:
>      - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#2763]) +3 other tests skip
>     [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-lnl-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b.html
> 
>    * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
>      - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#2763]) +9 other tests skip
>     [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
> 
>    * igt@kms_pm_backlight@brightness-with-dpms:
>      - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#2938])
>     [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-8/igt@kms_pm_backlight@brightness-with-dpms.html
> 
>    * igt@kms_pm_backlight@fade-with-dpms:
>      - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#870])
>     [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-8/igt@kms_pm_backlight@fade-with-dpms.html
>      - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#870])
>     [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-dg2-466/igt@kms_pm_backlight@fade-with-dpms.html
> 
>    * igt@kms_pm_dc@dc6-psr:
>      - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#2392])
>     [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-7/igt@kms_pm_dc@dc6-psr.html
>      - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#1129])
>     [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-dg2-432/igt@kms_pm_dc@dc6-psr.html
> 
>    * igt@kms_pm_rpm@basic-pci-d3-state:
>      - shard-dg2-set2:     NOTRUN -> [FAIL][108] ([Intel XE#4741])
>     [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-dg2-463/igt@kms_pm_rpm@basic-pci-d3-state.html
> 
>    * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#1489]) +5 other tests skip
>     [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html
> 
>    * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1:
>      - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#4608]) +1 other test skip
>     [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1.html
> 
>    * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
>      - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#2893]) +1 other test skip
>     [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-lnl-1/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html
> 
>    * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
>      - shard-bmg:          NOTRUN -> [SKIP][112] ([Intel XE#1489]) +8 other tests skip
>     [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-7/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
> 
>    * igt@kms_psr2_su@page_flip-p010:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#1122])
>     [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-dg2-434/igt@kms_psr2_su@page_flip-p010.html
> 
>    * igt@kms_psr@fbc-psr-cursor-plane-onoff:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][114] ([Intel XE#2850] / [Intel XE#929]) +5 other tests skip
>     [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-dg2-434/igt@kms_psr@fbc-psr-cursor-plane-onoff.html
> 
>    * igt@kms_psr@fbc-psr-primary-render:
>      - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#2234] / [Intel XE#2850]) +9 other tests skip
>     [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-5/igt@kms_psr@fbc-psr-primary-render.html
> 
>    * igt@kms_psr@fbc-psr2-basic:
>      - shard-lnl:          NOTRUN -> [SKIP][116] ([Intel XE#1406])
>     [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-lnl-5/igt@kms_psr@fbc-psr2-basic.html
> 
>    * igt@kms_psr@fbc-psr2-basic@edp-1:
>      - shard-lnl:          NOTRUN -> [SKIP][117] ([Intel XE#4609])
>     [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-lnl-5/igt@kms_psr@fbc-psr2-basic@edp-1.html
> 
>    * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>      - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#2414])
>     [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-4/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
> 
>    * igt@kms_rotation_crc@primary-rotation-270:
>      - shard-bmg:          NOTRUN -> [SKIP][119] ([Intel XE#3414] / [Intel XE#3904]) +3 other tests skip
>     [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-4/igt@kms_rotation_crc@primary-rotation-270.html
>      - shard-lnl:          NOTRUN -> [SKIP][120] ([Intel XE#3414] / [Intel XE#3904])
>     [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-lnl-5/igt@kms_rotation_crc@primary-rotation-270.html
> 
>    * igt@kms_setmode@invalid-clone-single-crtc:
>      - shard-bmg:          [PASS][121] -> [SKIP][122] ([Intel XE#1435])
>     [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html
>     [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-5/igt@kms_setmode@invalid-clone-single-crtc.html
> 
>    * igt@kms_tv_load_detect@load-detect:
>      - shard-bmg:          NOTRUN -> [SKIP][123] ([Intel XE#2450])
>     [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-1/igt@kms_tv_load_detect@load-detect.html
> 
>    * igt@kms_vblank@ts-continuation-suspend:
>      - shard-dg2-set2:     [PASS][124] -> [INCOMPLETE][125] ([Intel XE#4488])
>     [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-dg2-432/igt@kms_vblank@ts-continuation-suspend.html
>     [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-dg2-436/igt@kms_vblank@ts-continuation-suspend.html
> 
>    * igt@kms_vblank@ts-continuation-suspend@pipe-a-dp-4:
>      - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][126] ([Intel XE#4488])
>     [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-dg2-436/igt@kms_vblank@ts-continuation-suspend@pipe-a-dp-4.html
> 
>    * igt@kms_vrr@max-min:
>      - shard-bmg:          NOTRUN -> [SKIP][127] ([Intel XE#1499]) +2 other tests skip
>     [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-7/igt@kms_vrr@max-min.html
> 
>    * igt@kms_writeback@writeback-pixel-formats:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][128] ([Intel XE#756])
>     [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-dg2-434/igt@kms_writeback@writeback-pixel-formats.html
> 
>    * igt@xe_copy_basic@mem-set-linear-0xfd:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][129] ([Intel XE#1126])
>     [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfd.html
> 
>    * igt@xe_eudebug@basic-close:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][130] ([Intel XE#4837]) +7 other tests skip
>     [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-dg2-436/igt@xe_eudebug@basic-close.html
> 
>    * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
>      - shard-bmg:          NOTRUN -> [SKIP][131] ([Intel XE#4837]) +9 other tests skip
>     [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-8/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html
> 
>    * igt@xe_eudebug_online@resume-dss:
>      - shard-lnl:          NOTRUN -> [SKIP][132] ([Intel XE#4837]) +3 other tests skip
>     [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-lnl-7/igt@xe_eudebug_online@resume-dss.html
> 
>    * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
>      - shard-lnl:          NOTRUN -> [SKIP][133] ([Intel XE#688]) +1 other test skip
>     [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-lnl-5/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
> 
>    * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:
>      - shard-bmg:          NOTRUN -> [SKIP][134] ([Intel XE#2322]) +4 other tests skip
>     [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html
> 
>    * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr:
>      - shard-lnl:          NOTRUN -> [SKIP][135] ([Intel XE#1392])
>     [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-lnl-3/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr.html
> 
>    * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
>      - shard-dg2-set2:     [PASS][136] -> [SKIP][137] ([Intel XE#1392]) +4 other tests skip
>     [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-dg2-466/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html
>     [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html
> 
>    * igt@xe_exec_fault_mode@once-bindexecqueue-imm:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][138] ([Intel XE#288]) +9 other tests skip
>     [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-dg2-435/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html
> 
>    * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][139] ([Intel XE#2360])
>     [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-dg2-466/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html
> 
>    * igt@xe_exec_system_allocator@once-mmap-free-huge:
>      - shard-bmg:          NOTRUN -> [SKIP][140] ([Intel XE#4943]) +16 other tests skip
>     [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-6/igt@xe_exec_system_allocator@once-mmap-free-huge.html
> 
>    * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-huge-nomemset:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][141] ([Intel XE#4915]) +81 other tests skip
>     [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-dg2-463/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-huge-nomemset.html
> 
>    * igt@xe_exec_system_allocator@threads-many-large-execqueues-new-race-nomemset:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][142] ([Intel XE#4208])
>     [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-dg2-435/igt@xe_exec_system_allocator@threads-many-large-execqueues-new-race-nomemset.html
> 
>    * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-huge:
>      - shard-lnl:          NOTRUN -> [SKIP][143] ([Intel XE#4943]) +5 other tests skip
>     [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-lnl-5/igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-huge.html
> 
>    * igt@xe_live_ktest@xe_eudebug:
>      - shard-bmg:          NOTRUN -> [SKIP][144] ([Intel XE#2833])
>     [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-8/igt@xe_live_ktest@xe_eudebug.html
> 
>    * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
>      - shard-dg2-set2:     [PASS][145] -> [INCOMPLETE][146] ([Intel XE#4842]) +1 other test incomplete
>     [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-dg2-432/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
>     [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-dg2-435/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
> 
>    * igt@xe_media_fill@media-fill:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][147] ([Intel XE#560])
>     [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-dg2-435/igt@xe_media_fill@media-fill.html
> 
>    * igt@xe_mmap@pci-membarrier-bad-pagesize:
>      - shard-lnl:          NOTRUN -> [SKIP][148] ([Intel XE#4045])
>     [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-lnl-7/igt@xe_mmap@pci-membarrier-bad-pagesize.html
> 
>    * igt@xe_oa@buffer-size:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][149] ([Intel XE#4501])
>     [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-dg2-436/igt@xe_oa@buffer-size.html
> 
>    * igt@xe_oa@non-privileged-map-oa-buffer:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][150] ([Intel XE#2541] / [Intel XE#3573]) +3 other tests skip
>     [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-dg2-432/igt@xe_oa@non-privileged-map-oa-buffer.html
> 
>    * igt@xe_oa@syncs-ufence-wait:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][151] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
>     [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-dg2-432/igt@xe_oa@syncs-ufence-wait.html
> 
>    * igt@xe_pat@pat-index-xe2:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][152] ([Intel XE#977])
>     [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-dg2-435/igt@xe_pat@pat-index-xe2.html
> 
>    * igt@xe_pat@pat-index-xelp:
>      - shard-lnl:          NOTRUN -> [SKIP][153] ([Intel XE#977])
>     [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-lnl-4/igt@xe_pat@pat-index-xelp.html
>      - shard-bmg:          NOTRUN -> [SKIP][154] ([Intel XE#2245])
>     [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-5/igt@xe_pat@pat-index-xelp.html
> 
>    * igt@xe_pm@d3hot-mmap-vram:
>      - shard-lnl:          NOTRUN -> [SKIP][155] ([Intel XE#1948])
>     [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-lnl-8/igt@xe_pm@d3hot-mmap-vram.html
> 
>    * igt@xe_pm@s3-basic-exec:
>      - shard-lnl:          NOTRUN -> [SKIP][156] ([Intel XE#584]) +1 other test skip
>     [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-lnl-4/igt@xe_pm@s3-basic-exec.html
> 
>    * igt@xe_pm@s3-d3cold-basic-exec:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][157] ([Intel XE#2284] / [Intel XE#366])
>     [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-dg2-434/igt@xe_pm@s3-d3cold-basic-exec.html
> 
>    * igt@xe_pm@s4-basic:
>      - shard-lnl:          [PASS][158] -> [ABORT][159] ([Intel XE#1794])
>     [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-lnl-5/igt@xe_pm@s4-basic.html
>     [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-lnl-2/igt@xe_pm@s4-basic.html
> 
>    * igt@xe_pmu@gt-frequency:
>      - shard-dg2-set2:     NOTRUN -> [FAIL][160] ([Intel XE#4817]) +1 other test fail
>     [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-dg2-432/igt@xe_pmu@gt-frequency.html
> 
>    * igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][161] ([Intel XE#4733]) +2 other tests skip
>     [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-dg2-435/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html
> 
>    * igt@xe_pxp@pxp-termination-key-update-post-termination-irq:
>      - shard-bmg:          NOTRUN -> [SKIP][162] ([Intel XE#4733])
>     [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-8/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html
> 
>    * igt@xe_query@multigpu-query-invalid-cs-cycles:
>      - shard-bmg:          NOTRUN -> [SKIP][163] ([Intel XE#944]) +1 other test skip
>     [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-6/igt@xe_query@multigpu-query-invalid-cs-cycles.html
> 
>    * igt@xe_query@multigpu-query-invalid-query:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][164] ([Intel XE#944])
>     [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-dg2-463/igt@xe_query@multigpu-query-invalid-query.html
> 
>    * igt@xe_render_copy@render-stress-1-copies:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][165] ([Intel XE#4814])
>     [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-dg2-435/igt@xe_render_copy@render-stress-1-copies.html
> 
>    * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:
>      - shard-bmg:          NOTRUN -> [SKIP][166] ([Intel XE#4130])
>     [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-7/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html
>      - shard-lnl:          NOTRUN -> [SKIP][167] ([Intel XE#4130])
>     [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-lnl-3/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html
> 
>    * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][168] ([Intel XE#4130])
>     [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-dg2-466/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html
> 
>    * igt@xe_vm@mmap-style-bind-many-either-side-partial-hammer:
>      - shard-dg2-set2:     [PASS][169] -> [SKIP][170] ([Intel XE#4208]) +4 other tests skip
>     [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-dg2-463/igt@xe_vm@mmap-style-bind-many-either-side-partial-hammer.html
>     [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-dg2-435/igt@xe_vm@mmap-style-bind-many-either-side-partial-hammer.html
> 
>    
> #### Possible fixes ####
> 
>    * igt@kms_addfb_basic@unused-handle:
>      - shard-bmg:          [DMESG-WARN][171] -> [PASS][172] +1 other test pass
>     [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-bmg-6/igt@kms_addfb_basic@unused-handle.html
>     [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-6/igt@kms_addfb_basic@unused-handle.html
> 
>    * {igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1}:
>      - shard-lnl:          [FAIL][173] ([Intel XE#911]) -> [PASS][174] +3 other tests pass
>     [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html
>     [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html
> 
>    * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
>      - shard-bmg:          [DMESG-WARN][175] ([Intel XE#3428]) -> [PASS][176] +4 other tests pass
>     [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-bmg-6/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html
>     [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-7/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html
> 
>    * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
>      - shard-dg2-set2:     [INCOMPLETE][177] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) -> [PASS][178]
>     [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
>     [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
> 
>    * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
>      - shard-dg2-set2:     [INCOMPLETE][179] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [PASS][180]
>     [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html
>     [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html
> 
>    * igt@kms_cursor_crc@cursor-suspend:
>      - shard-bmg:          [SKIP][181] ([Intel XE#2320]) -> [PASS][182]
>     [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-bmg-6/igt@kms_cursor_crc@cursor-suspend.html
>     [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-8/igt@kms_cursor_crc@cursor-suspend.html
> 
>    * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
>      - shard-bmg:          [SKIP][183] ([Intel XE#2291]) -> [PASS][184] +2 other tests pass
>     [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-bmg-4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
>     [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
> 
>    * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
>      - shard-bmg:          [FAIL][185] ([Intel XE#4633]) -> [PASS][186]
>     [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
>     [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
> 
>    * igt@kms_flip@2x-plain-flip-fb-recreate:
>      - shard-bmg:          [SKIP][187] ([Intel XE#2316]) -> [PASS][188] +9 other tests pass
>     [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate.html
>     [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-7/igt@kms_flip@2x-plain-flip-fb-recreate.html
> 
>    * igt@kms_flip@flip-vs-expired-vblank-interruptible:
>      - shard-bmg:          [FAIL][189] ([Intel XE#3321]) -> [PASS][190]
>     [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
>     [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
> 
>    * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:
>      - shard-dg2-set2:     [FAIL][191] ([Intel XE#301]) -> [PASS][192] +9 other tests pass
>     [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html
>     [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html
> 
>    * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
>      - shard-lnl:          [FAIL][193] ([Intel XE#301]) -> [PASS][194]
>     [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
>     [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
> 
>    * igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1:
>      - shard-lnl:          [FAIL][195] ([Intel XE#886]) -> [PASS][196] +2 other tests pass
>     [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-lnl-5/igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1.html
>     [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-lnl-7/igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1.html
> 
>    * igt@kms_hdr@bpc-switch-dpms:
>      - shard-bmg:          [SKIP][197] ([Intel XE#4883]) -> [PASS][198]
>     [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-bmg-6/igt@kms_hdr@bpc-switch-dpms.html
>     [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-8/igt@kms_hdr@bpc-switch-dpms.html
> 
>    * igt@kms_joiner@invalid-modeset-force-big-joiner:
>      - shard-bmg:          [SKIP][199] ([Intel XE#3012]) -> [PASS][200]
>     [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html
>     [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-1/igt@kms_joiner@invalid-modeset-force-big-joiner.html
> 
>    * igt@kms_pm_dc@dc6-dpms:
>      - shard-lnl:          [FAIL][201] ([Intel XE#718]) -> [PASS][202]
>     [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-lnl-7/igt@kms_pm_dc@dc6-dpms.html
>     [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html
> 
>    * igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-vram01:
>      - shard-dg2-set2:     [INCOMPLETE][203] ([Intel XE#4358]) -> [PASS][204] +1 other test pass
>     [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-dg2-433/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-vram01.html
>     [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-dg2-435/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-vram01.html
> 
>    * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
>      - shard-dg2-set2:     [SKIP][205] ([Intel XE#1392]) -> [PASS][206] +1 other test pass
>     [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
>     [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-dg2-436/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
> 
>    * igt@xe_pm@s3-d3hot-basic-exec:
>      - shard-bmg:          [DMESG-WARN][207] ([Intel XE#569]) -> [PASS][208]
>     [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-bmg-6/igt@xe_pm@s3-d3hot-basic-exec.html
>     [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-8/igt@xe_pm@s3-d3hot-basic-exec.html
> 
>    * igt@xe_pm@s4-mocs:
>      - shard-lnl:          [ABORT][209] ([Intel XE#1794]) -> [PASS][210]
>     [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-lnl-2/igt@xe_pm@s4-mocs.html
>     [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-lnl-6/igt@xe_pm@s4-mocs.html
> 
>    
> #### Warnings ####
> 
>    * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
>      - shard-dg2-set2:     [SKIP][211] ([Intel XE#2907]) -> [SKIP][212] ([Intel XE#4208])
>     [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
>     [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
> 
>    * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
>      - shard-dg2-set2:     [INCOMPLETE][213] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [INCOMPLETE][214] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
>     [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
>     [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
> 
>    * igt@kms_content_protection@legacy:
>      - shard-bmg:          [FAIL][215] ([Intel XE#1178]) -> [SKIP][216] ([Intel XE#2341]) +1 other test skip
>     [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-bmg-7/igt@kms_content_protection@legacy.html
>     [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-5/igt@kms_content_protection@legacy.html
> 
>    * igt@kms_content_protection@uevent:
>      - shard-bmg:          [SKIP][217] ([Intel XE#2341]) -> [FAIL][218] ([Intel XE#1188])
>     [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-bmg-6/igt@kms_content_protection@uevent.html
>     [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-1/igt@kms_content_protection@uevent.html
> 
>    * igt@kms_flip@2x-flip-vs-expired-vblank:
>      - shard-bmg:          [SKIP][219] ([Intel XE#2316]) -> [FAIL][220] ([Intel XE#3321])
>     [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank.html
>     [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank.html
> 
>    * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
>      - shard-bmg:          [SKIP][221] ([Intel XE#2311]) -> [SKIP][222] ([Intel XE#2312]) +22 other tests skip
>     [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
>     [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
> 
>    * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
>      - shard-bmg:          [SKIP][223] ([Intel XE#2312]) -> [SKIP][224] ([Intel XE#2311]) +21 other tests skip
>     [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
>     [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
>      - shard-bmg:          [SKIP][225] ([Intel XE#2312]) -> [SKIP][226] ([Intel XE#4141]) +6 other tests skip
>     [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
>     [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
>      - shard-bmg:          [SKIP][227] ([Intel XE#4141]) -> [SKIP][228] ([Intel XE#2312]) +11 other tests skip
>     [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
>     [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
> 
>    * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
>      - shard-dg2-set2:     [SKIP][229] ([Intel XE#651]) -> [SKIP][230] ([Intel XE#4208]) +1 other test skip
>     [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html
>     [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:
>      - shard-bmg:          [SKIP][231] ([Intel XE#2312]) -> [SKIP][232] ([Intel XE#2313]) +13 other tests skip
>     [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html
>     [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
>      - shard-bmg:          [SKIP][233] ([Intel XE#2313]) -> [SKIP][234] ([Intel XE#2312]) +18 other tests skip
>     [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
>     [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
> 
>    * igt@kms_hdr@brightness-with-hdr:
>      - shard-bmg:          [SKIP][235] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][236] ([Intel XE#3544])
>     [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html
>     [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html
> 
>    * igt@kms_plane_multiple@2x-tiling-y:
>      - shard-bmg:          [SKIP][237] ([Intel XE#4596]) -> [SKIP][238] ([Intel XE#2493])
>     [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-y.html
>     [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-y.html
> 
>    * igt@kms_plane_multiple@2x-tiling-yf:
>      - shard-bmg:          [SKIP][239] ([Intel XE#2493]) -> [SKIP][240] ([Intel XE#4596])
>     [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-yf.html
>     [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-yf.html
> 
>    * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
>      - shard-lnl:          [SKIP][241] ([Intel XE#2893] / [Intel XE#4608]) -> [SKIP][242] ([Intel XE#1489])
>     [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html
>     [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html
> 
>    * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge-nomemset:
>      - shard-dg2-set2:     [SKIP][243] ([Intel XE#4915]) -> [SKIP][244] ([Intel XE#4208])
>     [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-dg2-436/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge-nomemset.html
>     [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-dg2-435/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge-nomemset.html
> 
>    * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset:
>      - shard-lnl:          [FAIL][245] -> [FAIL][246] ([Intel XE#4929])
>     [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-lnl-1/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html
>     [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-lnl-8/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html
> 
>    * igt@xe_module_load@load:
>      - shard-bmg:          ([PASS][247], [PASS][248], [PASS][249], [PASS][250], [PASS][251], [PASS][252], [PASS][253], [PASS][254], [PASS][255], [PASS][256], [PASS][257], [PASS][258], [DMESG-WARN][259], [DMESG-WARN][260], [PASS][261], [SKIP][262], [PASS][263], [PASS][264], [PASS][265], [PASS][266], [PASS][267], [PASS][268], [PASS][269], [PASS][270], [PASS][271]) ([Intel XE#2457] / [Intel XE#3428]) -> ([PASS][272], [PASS][273], [PASS][274], [PASS][275], [PASS][276], [PASS][277], [SKIP][278], [PASS][279], [PASS][280], [PASS][281], [PASS][282], [PASS][283], [PASS][284], [PASS][285], [PASS][286], [PASS][287], [PASS][288], [PASS][289], [PASS][290], [PASS][291], [PASS][292], [PASS][293], [PASS][294], [PASS][295], [PASS][296], [PASS][297]) ([Intel XE#2457])
>     [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-bmg-8/igt@xe_module_load@load.html
>     [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-bmg-8/igt@xe_module_load@load.html
>     [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-bmg-7/igt@xe_module_load@load.html
>     [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-bmg-5/igt@xe_module_load@load.html
>     [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-bmg-2/igt@xe_module_load@load.html
>     [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-bmg-2/igt@xe_module_load@load.html
>     [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-bmg-1/igt@xe_module_load@load.html
>     [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-bmg-1/igt@xe_module_load@load.html
>     [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-bmg-1/igt@xe_module_load@load.html
>     [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-bmg-7/igt@xe_module_load@load.html
>     [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-bmg-6/igt@xe_module_load@load.html
>     [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-bmg-6/igt@xe_module_load@load.html
>     [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-bmg-6/igt@xe_module_load@load.html
>     [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-bmg-6/igt@xe_module_load@load.html
>     [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-bmg-7/igt@xe_module_load@load.html
>     [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-bmg-4/igt@xe_module_load@load.html
>     [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-bmg-5/igt@xe_module_load@load.html
>     [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-bmg-4/igt@xe_module_load@load.html
>     [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-bmg-4/igt@xe_module_load@load.html
>     [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-bmg-4/igt@xe_module_load@load.html
>     [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-bmg-5/igt@xe_module_load@load.html
>     [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-bmg-7/igt@xe_module_load@load.html
>     [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-bmg-8/igt@xe_module_load@load.html
>     [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-bmg-4/igt@xe_module_load@load.html
>     [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8354/shard-bmg-5/igt@xe_module_load@load.html
>     [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-1/igt@xe_module_load@load.html
>     [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-1/igt@xe_module_load@load.html
>     [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-6/igt@xe_module_load@load.html
>     [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-5/igt@xe_module_load@load.html
>     [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-7/igt@xe_module_load@load.html
>     [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-7/igt@xe_module_load@load.html
>     [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-8/igt@xe_module_load@load.html
>     [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-6/igt@xe_module_load@load.html
>     [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-6/igt@xe_module_load@load.html
>     [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-5/igt@xe_module_load@load.html
>     [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-4/igt@xe_module_load@load.html
>     [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-5/igt@xe_module_load@load.html
>     [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-1/igt@xe_module_load@load.html
>     [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-1/igt@xe_module_load@load.html
>     [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-7/igt@xe_module_load@load.html
>     [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-7/igt@xe_module_load@load.html
>     [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-1/igt@xe_module_load@load.html
>     [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-5/igt@xe_module_load@load.html
>     [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-7/igt@xe_module_load@load.html
>     [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-8/igt@xe_module_load@load.html
>     [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-4/igt@xe_module_load@load.html
>     [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-8/igt@xe_module_load@load.html
>     [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-4/igt@xe_module_load@load.html
>     [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-8/igt@xe_module_load@load.html
>     [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-4/igt@xe_module_load@load.html
>     [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/shard-bmg-5/igt@xe_module_load@load.html
> 
>    
>    {name}: This element is suppressed. This means it is ignored when computing
>            the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>    [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>    [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>    [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>    [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
>    [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
>    [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>    [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
>    [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
>    [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>    [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>    [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>    [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>    [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>    [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>    [Intel XE#1466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466
>    [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
>    [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>    [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>    [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>    [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>    [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>    [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>    [Intel XE#1948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948
>    [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>    [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
>    [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>    [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
>    [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
>    [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>    [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>    [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
>    [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
>    [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>    [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
>    [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>    [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
>    [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
>    [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>    [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>    [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
>    [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>    [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
>    [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
>    [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
>    [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
>    [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
>    [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
>    [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
>    [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
>    [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
>    [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
>    [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
>    [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
>    [Intel XE#2501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501
>    [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
>    [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
>    [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>    [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
>    [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
>    [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
>    [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>    [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
>    [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>    [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>    [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
>    [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>    [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
>    [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
>    [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
>    [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
>    [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
>    [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>    [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
>    [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>    [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>    [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
>    [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
>    [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
>    [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
>    [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>    [Intel XE#3428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428
>    [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>    [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
>    [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
>    [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
>    [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
>    [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>    [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>    [Intel XE#3701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3701
>    [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
>    [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>    [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
>    [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>    [Intel XE#4045]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4045
>    [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
>    [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>    [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
>    [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
>    [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
>    [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
>    [Intel XE#4358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4358
>    [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
>    [Intel XE#4488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4488
>    [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
>    [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
>    [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>    [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
>    [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
>    [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
>    [Intel XE#4633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
>    [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>    [Intel XE#4741]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4741
>    [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
>    [Intel XE#4817]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4817
>    [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
>    [Intel XE#4842]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4842
>    [Intel XE#4883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4883
>    [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
>    [Intel XE#4929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4929
>    [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
>    [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
>    [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
>    [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
>    [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>    [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>    [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>    [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>    [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
>    [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>    [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>    [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
>    [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>    [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>    [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
>    [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>    [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>    [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
>    [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
> 
> 
> Build changes
> -------------
> 
>    * IGT: IGT_8354 -> IGTPW_13082
>    * Linux: xe-3036-4bc96b6ef5bd34903a5170366644121777aa2418 -> xe-3041-25c796cd9b15016d205d6c1f7cb3c3852ec55453
> 
>    IGTPW_13082: 3512ba4c72461eefaaa32b7f8639a0e07997def7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    IGT_8354: 59f7153426484367f58edfafb6567ce4e6a9e499 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    xe-3036-4bc96b6ef5bd34903a5170366644121777aa2418: 4bc96b6ef5bd34903a5170366644121777aa2418
>    xe-3041-25c796cd9b15016d205d6c1f7cb3c3852ec55453: 25c796cd9b15016d205d6c1f7cb3c3852ec55453
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13082/index.html
> 

