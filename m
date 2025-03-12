Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E2ADC28B2E
	for <igt-dev@archiver.kernel.org>; Wed, 12 Mar 2025 10:44:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2331110E765;
	Wed, 12 Mar 2025 10:44:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j9HriKNH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 732EE89FF7
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Mar 2025 10:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741776246; x=1773312246;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=mJNF33LS87ff2bJ1jYLLGkIsls6sU2vlL54JEE71MFI=;
 b=j9HriKNHoxArxxb3DyduJ2oRlq9qW1d2Tkk2EvyfvroEakb5xITRv2ci
 yVgUyStlK6AbdtIaTenpgZoDxZaQY1Gz0Jl6tHnVtbVvvdiPg13sFhw3w
 FuDGMnEX6cHQfieuAN4OAXHbFN48uXFLDK5w4CCd5YTy6d0tjIHltizm8
 SaA8NSoAVqc+RTQnZCAaSor7h4LkYcB1G7+SFGLNDwy0i7gsNMV34t7GA
 SzWcCAaBgchfsX39m7AYCFnDLswv+6nZBAzMEZuGDGRh+bgaKmz7XDoy5
 AEfXVadXOThrZ4JW67K36I5YBvL7La0EOSLGeJNMyNsIGMOOChOhoPdkx g==;
X-CSE-ConnectionGUID: HZsd63CDTzOiMun6UJ1Vnw==
X-CSE-MsgGUID: oUuoeXAlSR+i9GZ6fwTsLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="53840459"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="53840459"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 03:44:05 -0700
X-CSE-ConnectionGUID: de+jit4HQg+0o56QDFUD4g==
X-CSE-MsgGUID: c5NQUzYqSoGEFExHyWU/SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="125238353"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.245.101.99])
 ([10.245.101.99])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 03:44:04 -0700
Message-ID: <8e1bc9ae-7eb4-4fc5-ba5e-a46a9a1a7e28@linux.intel.com>
Date: Wed, 12 Mar 2025 11:44:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciB0ZXN0cy94ZV9k?=
 =?UTF-8?Q?rm=5Ffdinfo=3A_Check_prerequisites_for_utilization_tests_=28rev3?=
 =?UTF-8?Q?=29?=
To: igt-dev@lists.freedesktop.org
References: <20250306200118.1771514-1-marcin.bernatowicz@linux.intel.com>
 <174138117192.4462.4606830370992834525@18a75f3d1eae>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <174138117192.4462.4606830370992834525@18a75f3d1eae>
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



On 3/7/2025 9:59 PM, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/xe_drm_fdinfo: Check prerequisites for utilization tests (rev3)
> URL   : https://patchwork.freedesktop.org/series/145797/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8264_full -> XEIGTPW_12723_full
> ====================================================
> 
> Summary
> -------
> 
>    **FAILURE**
> 
>    Serious unknown changes coming with XEIGTPW_12723_full absolutely need to be
>    verified manually.
>    
>    If you think the reported changes have nothing to do with the changes
>    introduced in XEIGTPW_12723_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in CI.
> 
>    
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>    No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>    Here are the unknown changes that may have been introduced in XEIGTPW_12723_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>    * igt@xe_exec_threads@threads-bal-mixed-userptr-invalidate:
>      - shard-bmg:          NOTRUN -> [FAIL][1]
>     [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-7/igt@xe_exec_threads@threads-bal-mixed-userptr-invalidate.html
> 
Not related to the change.
--
marcin
>    
> Known issues
> ------------
> 
>    Here are the changes found in XEIGTPW_12723_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>    * igt@kms_3d:
>      - shard-lnl:          NOTRUN -> [SKIP][2] ([Intel XE#1465])
>     [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-4/igt@kms_3d.html
> 
>    * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
>      - shard-lnl:          NOTRUN -> [SKIP][3] ([Intel XE#3157])
>     [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
> 
>    * igt@kms_atomic_transition@plane-all-modeset-transition:
>      - shard-lnl:          NOTRUN -> [SKIP][4] ([Intel XE#3279])
>     [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-4/igt@kms_atomic_transition@plane-all-modeset-transition.html
> 
>    * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
>      - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2370])
>     [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
> 
>    * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
>      - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#2327]) +6 other tests skip
>     [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-2/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
> 
>    * igt@kms_big_fb@linear-32bpp-rotate-270:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][7] ([Intel XE#316]) +5 other tests skip
>     [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-464/igt@kms_big_fb@linear-32bpp-rotate-270.html
>      - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#1407]) +7 other tests skip
>     [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-4/igt@kms_big_fb@linear-32bpp-rotate-270.html
> 
>    * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
>      - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#1124]) +12 other tests skip
>     [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-7/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html
> 
>    * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
>      - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#1124]) +13 other tests skip
>     [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-8/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
> 
>    * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#1124]) +15 other tests skip
>     [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
> 
>    * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
>      - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#607]) +1 other test skip
>     [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
>      - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#607]) +1 other test skip
>     [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
>      - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#1477]) +1 other test skip
>     [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-3/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
> 
>    * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
>      - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#2191]) +2 other tests skip
>     [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-4/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
> 
>    * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#2191])
>     [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-433/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
> 
>    * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
>      - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
>     [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-4/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
> 
>    * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
>      - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#367]) +1 other test skip
>     [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-7/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html
> 
>    * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
>      - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#367]) +2 other tests skip
>     [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-3/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
> 
>    * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#367]) +2 other tests skip
>     [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
> 
>    * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:
>      - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#2887]) +20 other tests skip
>     [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-6/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html
> 
>    * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
>      - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2887]) +24 other tests skip
>     [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-8/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html
> 
>    * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:
>      - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#2669]) +7 other tests skip
>     [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-3/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1.html
> 
>    * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
>      - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#3432])
>     [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html
> 
>    * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:
>      - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2652] / [Intel XE#787]) +8 other tests skip
>     [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html
> 
>    * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#2907])
>     [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
> 
>    * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-2:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#455] / [Intel XE#787]) +63 other tests skip
>     [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-2.html
> 
>    * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#787]) +250 other tests skip
>     [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html
> 
>    * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6:
>      - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][29] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) +1 other test incomplete
>     [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html
> 
>    * igt@kms_cdclk@mode-transition-all-outputs:
>      - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2724]) +1 other test skip
>     [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-8/igt@kms_cdclk@mode-transition-all-outputs.html
>      - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#4440])
>     [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-464/igt@kms_cdclk@mode-transition-all-outputs.html
>      - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#4418])
>     [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-4/igt@kms_cdclk@mode-transition-all-outputs.html
> 
>    * igt@kms_cdclk@mode-transition@pipe-b-edp-1:
>      - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#4417]) +3 other tests skip
>     [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-7/igt@kms_cdclk@mode-transition@pipe-b-edp-1.html
> 
>    * igt@kms_chamelium_color@ctm-max:
>      - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#306])
>     [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-8/igt@kms_chamelium_color@ctm-max.html
>      - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#2325]) +1 other test skip
>     [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-8/igt@kms_chamelium_color@ctm-max.html
> 
>    * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
>      - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2252]) +13 other tests skip
>     [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-2/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
> 
>    * igt@kms_chamelium_hpd@vga-hpd:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#373]) +11 other tests skip
>     [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-433/igt@kms_chamelium_hpd@vga-hpd.html
>      - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#373]) +12 other tests skip
>     [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-5/igt@kms_chamelium_hpd@vga-hpd.html
> 
>    * igt@kms_content_protection@dp-mst-lic-type-0:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#307]) +1 other test skip
>     [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-0.html
>      - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#307])
>     [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-8/igt@kms_content_protection@dp-mst-lic-type-0.html
> 
>    * igt@kms_content_protection@dp-mst-type-0:
>      - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2390]) +2 other tests skip
>     [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-4/igt@kms_content_protection@dp-mst-type-0.html
> 
>    * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
>      - shard-dg2-set2:     NOTRUN -> [FAIL][42] ([Intel XE#3304])
>     [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-433/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html
> 
>    * igt@kms_content_protection@type1:
>      - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2341])
>     [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-4/igt@kms_content_protection@type1.html
> 
>    * igt@kms_content_protection@uevent:
>      - shard-dg2-set2:     NOTRUN -> [FAIL][44] ([Intel XE#1188]) +1 other test fail
>     [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-433/igt@kms_content_protection@uevent.html
>      - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#3278]) +1 other test skip
>     [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-3/igt@kms_content_protection@uevent.html
>      - shard-bmg:          NOTRUN -> [FAIL][46] ([Intel XE#1188]) +1 other test fail
>     [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-2/igt@kms_content_protection@uevent.html
> 
>    * igt@kms_cursor_crc@cursor-offscreen-256x85:
>      - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2320]) +8 other tests skip
>     [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-8/igt@kms_cursor_crc@cursor-offscreen-256x85.html
> 
>    * igt@kms_cursor_crc@cursor-onscreen-512x512:
>      - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2321])
>     [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-4/igt@kms_cursor_crc@cursor-onscreen-512x512.html
> 
>    * igt@kms_cursor_crc@cursor-random-32x10:
>      - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#1424]) +8 other tests skip
>     [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-8/igt@kms_cursor_crc@cursor-random-32x10.html
> 
>    * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
>      - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2291])
>     [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
>      - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#309]) +2 other tests skip
>     [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
> 
>    * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
>      - shard-dg2-set2:     [PASS][52] -> [SKIP][53] ([Intel XE#309]) +4 other tests skip
>     [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-dg2-433/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
>     [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-464/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
> 
>    * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#309])
>     [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-464/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
> 
>    * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>      - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#323])
>     [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
>      - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2286]) +1 other test skip
>     [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>    * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
>      - shard-bmg:          [PASS][57] -> [SKIP][58] ([Intel XE#2291]) +5 other tests skip
>     [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
>     [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
> 
>    * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#323])
>     [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
> 
>    * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
>      - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#4210])
>     [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-4/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
> 
>    * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
>      - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#1340])
>     [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html
> 
>    * igt@kms_dp_link_training@uhbr-mst:
>      - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#4354]) +2 other tests skip
>     [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-7/igt@kms_dp_link_training@uhbr-mst.html
> 
>    * igt@kms_dp_link_training@uhbr-sst:
>      - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#4354]) +2 other tests skip
>     [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-7/igt@kms_dp_link_training@uhbr-sst.html
>      - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#4356]) +1 other test skip
>     [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-432/igt@kms_dp_link_training@uhbr-sst.html
> 
>    * igt@kms_dp_linktrain_fallback@dp-fallback:
>      - shard-dg2-set2:     [PASS][65] -> [SKIP][66] ([Intel XE#4331])
>     [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-dg2-432/igt@kms_dp_linktrain_fallback@dp-fallback.html
>     [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-464/igt@kms_dp_linktrain_fallback@dp-fallback.html
> 
>    * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
>      - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#2244])
>     [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-4/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
> 
>    * igt@kms_dsc@dsc-with-bpc:
>      - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#2244])
>     [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-5/igt@kms_dsc@dsc-with-bpc.html
> 
>    * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#4422])
>     [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-433/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html
>      - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#4422])
>     [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-3/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html
> 
>    * igt@kms_feature_discovery@chamelium:
>      - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#701])
>     [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-4/igt@kms_feature_discovery@chamelium.html
> 
>    * igt@kms_feature_discovery@display-2x:
>      - shard-dg2-set2:     [PASS][72] -> [SKIP][73] ([Intel XE#702])
>     [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-dg2-463/igt@kms_feature_discovery@display-2x.html
>     [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-464/igt@kms_feature_discovery@display-2x.html
> 
>    * igt@kms_feature_discovery@dp-mst:
>      - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2375])
>     [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-8/igt@kms_feature_discovery@dp-mst.html
> 
>    * igt@kms_feature_discovery@psr2:
>      - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#2374])
>     [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-7/igt@kms_feature_discovery@psr2.html
>      - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#1135])
>     [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-464/igt@kms_feature_discovery@psr2.html
> 
>    * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#310]) +3 other tests skip
>     [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-464/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
> 
>    * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:
>      - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#1421]) +11 other tests skip
>     [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-7/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html
> 
>    * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
>      - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#2316]) +2 other tests skip
>     [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-4/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
> 
>    * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:
>      - shard-dg2-set2:     NOTRUN -> [FAIL][80] ([Intel XE#301] / [Intel XE#3321])
>     [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html
> 
>    * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
>      - shard-dg2-set2:     NOTRUN -> [FAIL][81] ([Intel XE#301]) +5 other tests fail
>     [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
> 
>    * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
>      - shard-bmg:          [PASS][82] -> [SKIP][83] ([Intel XE#2316]) +2 other tests skip
>     [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-bmg-2/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
>     [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-4/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
> 
>    * igt@kms_flip@2x-nonexisting-fb-interruptible:
>      - shard-dg2-set2:     [PASS][84] -> [SKIP][85] ([Intel XE#310]) +4 other tests skip
>     [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-dg2-463/igt@kms_flip@2x-nonexisting-fb-interruptible.html
>     [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-464/igt@kms_flip@2x-nonexisting-fb-interruptible.html
> 
>    * igt@kms_flip@flip-vs-blocking-wf-vblank:
>      - shard-lnl:          NOTRUN -> [FAIL][86] ([Intel XE#3098] / [Intel XE#886])
>     [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-1/igt@kms_flip@flip-vs-blocking-wf-vblank.html
> 
>    * igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:
>      - shard-lnl:          NOTRUN -> [FAIL][87] ([Intel XE#3098])
>     [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-1/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html
> 
>    * igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1:
>      - shard-lnl:          NOTRUN -> [FAIL][88] ([Intel XE#886]) +1 other test fail
>     [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-1/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html
> 
>    * igt@kms_flip@flip-vs-expired-vblank:
>      - shard-dg2-set2:     [PASS][89] -> [FAIL][90] ([Intel XE#301])
>     [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank.html
>     [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank.html
> 
>    * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
>      - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#1401] / [Intel XE#1745]) +3 other tests skip
>     [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
> 
>    * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode:
>      - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#1397]) +2 other tests skip
>     [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode.html
> 
>    * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode:
>      - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#1401]) +3 other tests skip
>     [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode.html
> 
>    * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
>      - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#1397] / [Intel XE#1745]) +2 other tests skip
>     [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
> 
>    * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
>      - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#2293] / [Intel XE#2380]) +3 other tests skip
>     [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
> 
>    * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
>      - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#2293]) +3 other tests skip
>     [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html
> 
>    * igt@kms_force_connector_basic@force-edid:
>      - shard-lnl:          NOTRUN -> [SKIP][97] ([Intel XE#352])
>     [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-3/igt@kms_force_connector_basic@force-edid.html
> 
>    * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#656]) +21 other tests skip
>     [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
> 
>    * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
>      - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#2311]) +38 other tests skip
>     [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
> 
>    * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][100] ([Intel XE#651]) +27 other tests skip
>     [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
>      - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#4141]) +18 other tests skip
>     [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
>      - shard-dg2-set2:     [PASS][102] -> [SKIP][103] ([Intel XE#656]) +7 other tests skip
>     [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
>     [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
>      - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#656]) +49 other tests skip
>     [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-tiling-y:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#658])
>     [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
> 
>    * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:
>      - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#651]) +18 other tests skip
>     [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
>      - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#2313]) +32 other tests skip
>     [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
>      - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#2352])
>     [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
> 
>    * igt@kms_frontbuffer_tracking@plane-fbc-rte:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#4439])
>     [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-432/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
> 
>    * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#653]) +33 other tests skip
>     [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
> 
>    * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
>      - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#2312]) +17 other tests skip
>     [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
> 
>    * igt@kms_getfb@getfb-reject-ccs:
>      - shard-bmg:          NOTRUN -> [SKIP][112] ([Intel XE#2502])
>     [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-4/igt@kms_getfb@getfb-reject-ccs.html
>      - shard-lnl:          NOTRUN -> [SKIP][113] ([Intel XE#605])
>     [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-5/igt@kms_getfb@getfb-reject-ccs.html
> 
>    * igt@kms_getfb@getfb2-accept-ccs:
>      - shard-lnl:          NOTRUN -> [SKIP][114] ([Intel XE#2340])
>     [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-3/igt@kms_getfb@getfb2-accept-ccs.html
> 
>    * igt@kms_joiner@basic-big-joiner:
>      - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#346])
>     [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-7/igt@kms_joiner@basic-big-joiner.html
>      - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([Intel XE#346])
>     [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-464/igt@kms_joiner@basic-big-joiner.html
>      - shard-lnl:          NOTRUN -> [SKIP][117] ([Intel XE#346])
>     [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-7/igt@kms_joiner@basic-big-joiner.html
> 
>    * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
>      - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#2934])
>     [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-7/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
> 
>    * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][119] ([Intel XE#2925])
>     [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-433/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
>      - shard-lnl:          NOTRUN -> [SKIP][120] ([Intel XE#4090])
>     [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-5/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
> 
>    * igt@kms_plane@plane-position-covered:
>      - shard-lnl:          NOTRUN -> [DMESG-FAIL][121] ([Intel XE#324]) +5 other tests dmesg-fail
>     [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-7/igt@kms_plane@plane-position-covered.html
> 
>    * igt@kms_plane@plane-position-covered@pipe-b-plane-4:
>      - shard-lnl:          NOTRUN -> [DMESG-WARN][122] ([Intel XE#324]) +7 other tests dmesg-warn
>     [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-7/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html
> 
>    * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256:
>      - shard-dg2-set2:     NOTRUN -> [FAIL][123] ([Intel XE#616]) +3 other tests fail
>     [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-432/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256.html
> 
>    * igt@kms_plane_multiple@tiling-y:
>      - shard-bmg:          NOTRUN -> [SKIP][124] ([Intel XE#2493])
>     [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-2/igt@kms_plane_multiple@tiling-y.html
>      - shard-lnl:          NOTRUN -> [SKIP][125] ([Intel XE#2493])
>     [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-1/igt@kms_plane_multiple@tiling-y.html
> 
>    * igt@kms_plane_scaling@2x-scaler-multi-pipe:
>      - shard-bmg:          [PASS][126] -> [SKIP][127] ([Intel XE#2571])
>     [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-bmg-8/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
>     [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
> 
>    * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b:
>      - shard-lnl:          NOTRUN -> [SKIP][128] ([Intel XE#2763]) +17 other tests skip
>     [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b.html
> 
>    * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][129] ([Intel XE#2763]) +9 other tests skip
>     [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b.html
> 
>    * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][130] ([Intel XE#2763] / [Intel XE#455]) +6 other tests skip
>     [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html
> 
>    * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b:
>      - shard-bmg:          NOTRUN -> [SKIP][131] ([Intel XE#2763]) +9 other tests skip
>     [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-2/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b.html
> 
>    * igt@kms_pm_backlight@brightness-with-dpms:
>      - shard-bmg:          NOTRUN -> [SKIP][132] ([Intel XE#2938])
>     [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-4/igt@kms_pm_backlight@brightness-with-dpms.html
> 
>    * igt@kms_pm_backlight@fade-with-dpms:
>      - shard-bmg:          NOTRUN -> [SKIP][133] ([Intel XE#870])
>     [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-4/igt@kms_pm_backlight@fade-with-dpms.html
>      - shard-dg2-set2:     NOTRUN -> [SKIP][134] ([Intel XE#870]) +1 other test skip
>     [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-432/igt@kms_pm_backlight@fade-with-dpms.html
> 
>    * igt@kms_pm_dc@dc3co-vpb-simulation:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][135] ([Intel XE#1122])
>     [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-464/igt@kms_pm_dc@dc3co-vpb-simulation.html
> 
>    * igt@kms_pm_dc@dc5-dpms-negative:
>      - shard-lnl:          NOTRUN -> [SKIP][136] ([Intel XE#1131])
>     [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-7/igt@kms_pm_dc@dc5-dpms-negative.html
> 
>    * igt@kms_pm_dc@dc5-retention-flops:
>      - shard-bmg:          NOTRUN -> [SKIP][137] ([Intel XE#3309])
>     [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-7/igt@kms_pm_dc@dc5-retention-flops.html
> 
>    * igt@kms_pm_dc@dc6-psr:
>      - shard-lnl:          NOTRUN -> [FAIL][138] ([Intel XE#1430])
>     [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-6/igt@kms_pm_dc@dc6-psr.html
>      - shard-bmg:          NOTRUN -> [SKIP][139] ([Intel XE#2392])
>     [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-2/igt@kms_pm_dc@dc6-psr.html
>      - shard-dg2-set2:     NOTRUN -> [SKIP][140] ([Intel XE#1129])
>     [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-464/igt@kms_pm_dc@dc6-psr.html
> 
>    * igt@kms_pm_dc@deep-pkgc:
>      - shard-bmg:          NOTRUN -> [SKIP][141] ([Intel XE#2505])
>     [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-2/igt@kms_pm_dc@deep-pkgc.html
> 
>    * igt@kms_pm_rpm@dpms-non-lpsp:
>      - shard-lnl:          NOTRUN -> [SKIP][142] ([Intel XE#1439] / [Intel XE#3141])
>     [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-4/igt@kms_pm_rpm@dpms-non-lpsp.html
> 
>    * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
>      - shard-bmg:          NOTRUN -> [SKIP][143] ([Intel XE#1489]) +12 other tests skip
>     [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-2/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html
> 
>    * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][144] ([Intel XE#1489]) +10 other tests skip
>     [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-464/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html
> 
>    * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
>      - shard-lnl:          NOTRUN -> [SKIP][145] ([Intel XE#2893]) +4 other tests skip
>     [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-6/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html
> 
>    * igt@kms_psr2_su@page_flip-nv12:
>      - shard-bmg:          NOTRUN -> [SKIP][146] ([Intel XE#2387])
>     [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-7/igt@kms_psr2_su@page_flip-nv12.html
> 
>    * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
>      - shard-lnl:          [PASS][147] -> [FAIL][148] ([Intel XE#3924]) +1 other test fail
>     [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-lnl-1/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html
>     [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-4/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html
> 
>    * igt@kms_psr@pr-primary-blt:
>      - shard-lnl:          NOTRUN -> [SKIP][149] ([Intel XE#1406]) +6 other tests skip
>     [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-1/igt@kms_psr@pr-primary-blt.html
> 
>    * igt@kms_psr@psr-primary-page-flip:
>      - shard-bmg:          NOTRUN -> [SKIP][150] ([Intel XE#2234] / [Intel XE#2850]) +23 other tests skip
>     [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-2/igt@kms_psr@psr-primary-page-flip.html
> 
>    * igt@kms_psr@psr2-basic:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][151] ([Intel XE#2850] / [Intel XE#929]) +19 other tests skip
>     [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-432/igt@kms_psr@psr2-basic.html
> 
>    * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][152] ([Intel XE#2939])
>     [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-432/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
> 
>    * igt@kms_rmfb@close-fd@pipe-a-edp-1:
>      - shard-lnl:          [PASS][153] -> [DMESG-WARN][154] ([Intel XE#324])
>     [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-lnl-3/igt@kms_rmfb@close-fd@pipe-a-edp-1.html
>     [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-1/igt@kms_rmfb@close-fd@pipe-a-edp-1.html
> 
>    * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][155] ([Intel XE#1127]) +1 other test skip
>     [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-464/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
>      - shard-lnl:          NOTRUN -> [SKIP][156] ([Intel XE#1127])
>     [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
> 
>    * igt@kms_rotation_crc@sprite-rotation-270:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][157] ([Intel XE#3414])
>     [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-270.html
>      - shard-lnl:          NOTRUN -> [SKIP][158] ([Intel XE#3414] / [Intel XE#3904])
>     [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-4/igt@kms_rotation_crc@sprite-rotation-270.html
> 
>    * igt@kms_scaling_modes@scaling-mode-full-aspect:
>      - shard-bmg:          NOTRUN -> [SKIP][159] ([Intel XE#2413]) +1 other test skip
>     [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-2/igt@kms_scaling_modes@scaling-mode-full-aspect.html
> 
>    * igt@kms_setmode@basic-clone-single-crtc:
>      - shard-lnl:          NOTRUN -> [SKIP][160] ([Intel XE#1435])
>     [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-8/igt@kms_setmode@basic-clone-single-crtc.html
> 
>    * igt@kms_setmode@clone-exclusive-crtc:
>      - shard-dg2-set2:     [PASS][161] -> [SKIP][162] ([Intel XE#455]) +1 other test skip
>     [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-dg2-433/igt@kms_setmode@clone-exclusive-crtc.html
>     [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-464/igt@kms_setmode@clone-exclusive-crtc.html
> 
>    * igt@kms_setmode@invalid-clone-single-crtc:
>      - shard-bmg:          [PASS][163] -> [SKIP][164] ([Intel XE#1435])
>     [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-bmg-2/igt@kms_setmode@invalid-clone-single-crtc.html
>     [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc.html
> 
>    * igt@kms_tiled_display@basic-test-pattern:
>      - shard-bmg:          NOTRUN -> [SKIP][165] ([Intel XE#2426])
>     [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html
>      - shard-dg2-set2:     NOTRUN -> [FAIL][166] ([Intel XE#1729])
>     [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern.html
> 
>    * igt@kms_vrr@cmrr:
>      - shard-bmg:          NOTRUN -> [SKIP][167] ([Intel XE#2168])
>     [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-8/igt@kms_vrr@cmrr.html
>      - shard-dg2-set2:     NOTRUN -> [SKIP][168] ([Intel XE#2168])
>     [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-464/igt@kms_vrr@cmrr.html
> 
>    * igt@kms_vrr@flip-dpms:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][169] ([Intel XE#455]) +21 other tests skip
>     [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-433/igt@kms_vrr@flip-dpms.html
> 
>    * igt@kms_vrr@max-min:
>      - shard-bmg:          NOTRUN -> [SKIP][170] ([Intel XE#1499]) +3 other tests skip
>     [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-2/igt@kms_vrr@max-min.html
> 
>    * igt@kms_vrr@seamless-rr-switch-drrs:
>      - shard-lnl:          NOTRUN -> [SKIP][171] ([Intel XE#1499]) +1 other test skip
>     [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-1/igt@kms_vrr@seamless-rr-switch-drrs.html
> 
>    * igt@kms_writeback@writeback-fb-id:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][172] ([Intel XE#756]) +1 other test skip
>     [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-433/igt@kms_writeback@writeback-fb-id.html
> 
>    * igt@kms_writeback@writeback-pixel-formats:
>      - shard-lnl:          NOTRUN -> [SKIP][173] ([Intel XE#756]) +1 other test skip
>     [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-5/igt@kms_writeback@writeback-pixel-formats.html
> 
>    * igt@sriov_basic@enable-vfs-autoprobe-off:
>      - shard-bmg:          NOTRUN -> [SKIP][174] ([Intel XE#1091] / [Intel XE#2849])
>     [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-off.html
>      - shard-dg2-set2:     NOTRUN -> [SKIP][175] ([Intel XE#1091] / [Intel XE#2849])
>     [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-464/igt@sriov_basic@enable-vfs-autoprobe-off.html
>      - shard-lnl:          NOTRUN -> [SKIP][176] ([Intel XE#1091] / [Intel XE#2849])
>     [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-5/igt@sriov_basic@enable-vfs-autoprobe-off.html
> 
>    * igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute:
>      - shard-lnl:          [PASS][177] -> [FAIL][178] ([Intel XE#4278]) +1 other test fail
>     [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-lnl-6/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html
>     [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-4/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html
> 
>    * igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][179] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
>     [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-464/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html
> 
>    * igt@xe_copy_basic@mem-copy-linear-0xfd:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][180] ([Intel XE#1123])
>     [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfd.html
> 
>    * igt@xe_eu_stall@unprivileged-access:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][181] ([Intel XE#4497])
>     [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-433/igt@xe_eu_stall@unprivileged-access.html
> 
>    * igt@xe_eudebug@basic-connect:
>      - shard-lnl:          NOTRUN -> [SKIP][182] ([Intel XE#2905]) +13 other tests skip
>     [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-3/igt@xe_eudebug@basic-connect.html
> 
>    * igt@xe_eudebug@basic-vm-access-parameters-userptr:
>      - shard-bmg:          NOTRUN -> [SKIP][183] ([Intel XE#3889])
>     [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-4/igt@xe_eudebug@basic-vm-access-parameters-userptr.html
> 
>    * igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][184] ([Intel XE#3889]) +1 other test skip
>     [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-433/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html
> 
>    * igt@xe_eudebug_online@single-step:
>      - shard-bmg:          NOTRUN -> [SKIP][185] ([Intel XE#2905]) +16 other tests skip
>     [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-8/igt@xe_eudebug_online@single-step.html
> 
>    * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd:
>      - shard-lnl:          NOTRUN -> [SKIP][186] ([Intel XE#688]) +6 other tests skip
>     [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-6/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd.html
> 
>    * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
>      - shard-bmg:          NOTRUN -> [SKIP][187] ([Intel XE#2322]) +11 other tests skip
>     [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
> 
>    * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][188] ([Intel XE#1392]) +2 other tests skip
>     [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html
> 
>    * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:
>      - shard-lnl:          NOTRUN -> [SKIP][189] ([Intel XE#1392]) +11 other tests skip
>     [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-3/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html
> 
>    * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
>      - shard-dg2-set2:     [PASS][190] -> [SKIP][191] ([Intel XE#1392]) +8 other tests skip
>     [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-dg2-463/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
>     [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
> 
>    * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][192] ([Intel XE#288]) +36 other tests skip
>     [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
> 
>    * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][193] ([Intel XE#2360])
>     [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-432/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
> 
>    * igt@xe_exec_sip_eudebug@breakpoint-writesip:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][194] ([Intel XE#2905]) +14 other tests skip
>     [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-433/igt@xe_exec_sip_eudebug@breakpoint-writesip.html
> 
>    * igt@xe_exec_threads@threads-hang-userptr-invalidate:
>      - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][195] ([Intel XE#3876])
>     [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-464/igt@xe_exec_threads@threads-hang-userptr-invalidate.html
> 
>    * igt@xe_huc_copy@huc_copy:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][196] ([Intel XE#255])
>     [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-464/igt@xe_huc_copy@huc_copy.html
> 
>    * igt@xe_live_ktest@xe_eudebug:
>      - shard-lnl:          NOTRUN -> [SKIP][197] ([Intel XE#2833])
>     [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-3/igt@xe_live_ktest@xe_eudebug.html
> 
>    * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][198] ([Intel XE#2229])
>     [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-432/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
>      - shard-lnl:          NOTRUN -> [SKIP][199] ([Intel XE#2229])
>     [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-4/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
> 
>    * igt@xe_mmap@small-bar:
>      - shard-bmg:          NOTRUN -> [SKIP][200] ([Intel XE#586])
>     [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-4/igt@xe_mmap@small-bar.html
>      - shard-dg2-set2:     NOTRUN -> [SKIP][201] ([Intel XE#512])
>     [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-433/igt@xe_mmap@small-bar.html
>      - shard-lnl:          NOTRUN -> [SKIP][202] ([Intel XE#512])
>     [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-1/igt@xe_mmap@small-bar.html
> 
>    * igt@xe_module_load@load:
>      - shard-lnl:          ([PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208], [PASS][209], [PASS][210], [PASS][211], [PASS][212], [PASS][213], [PASS][214], [PASS][215], [PASS][216], [PASS][217], [PASS][218], [PASS][219], [PASS][220], [PASS][221], [PASS][222], [PASS][223], [PASS][224], [PASS][225], [PASS][226], [PASS][227]) -> ([PASS][228], [PASS][229], [PASS][230], [PASS][231], [PASS][232], [PASS][233], [PASS][234], [PASS][235], [PASS][236], [PASS][237], [PASS][238], [PASS][239], [PASS][240], [PASS][241], [PASS][242], [PASS][243], [PASS][244], [PASS][245], [PASS][246], [PASS][247], [PASS][248], [PASS][249], [SKIP][250], [PASS][251], [PASS][252], [PASS][253]) ([Intel XE#378])
>     [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-lnl-7/igt@xe_module_load@load.html
>     [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-lnl-7/igt@xe_module_load@load.html
>     [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-lnl-7/igt@xe_module_load@load.html
>     [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-lnl-7/igt@xe_module_load@load.html
>     [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-lnl-3/igt@xe_module_load@load.html
>     [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-lnl-5/igt@xe_module_load@load.html
>     [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-lnl-5/igt@xe_module_load@load.html
>     [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-lnl-5/igt@xe_module_load@load.html
>     [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-lnl-3/igt@xe_module_load@load.html
>     [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-lnl-3/igt@xe_module_load@load.html
>     [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-lnl-5/igt@xe_module_load@load.html
>     [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-lnl-6/igt@xe_module_load@load.html
>     [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-lnl-6/igt@xe_module_load@load.html
>     [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-lnl-6/igt@xe_module_load@load.html
>     [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-lnl-8/igt@xe_module_load@load.html
>     [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-lnl-8/igt@xe_module_load@load.html
>     [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-lnl-4/igt@xe_module_load@load.html
>     [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-lnl-1/igt@xe_module_load@load.html
>     [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-lnl-1/igt@xe_module_load@load.html
>     [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-lnl-1/igt@xe_module_load@load.html
>     [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-lnl-8/igt@xe_module_load@load.html
>     [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-lnl-8/igt@xe_module_load@load.html
>     [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-lnl-4/igt@xe_module_load@load.html
>     [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-lnl-4/igt@xe_module_load@load.html
>     [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-lnl-6/igt@xe_module_load@load.html
>     [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-6/igt@xe_module_load@load.html
>     [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-8/igt@xe_module_load@load.html
>     [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-5/igt@xe_module_load@load.html
>     [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-6/igt@xe_module_load@load.html
>     [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-1/igt@xe_module_load@load.html
>     [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-1/igt@xe_module_load@load.html
>     [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-4/igt@xe_module_load@load.html
>     [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-1/igt@xe_module_load@load.html
>     [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-4/igt@xe_module_load@load.html
>     [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-4/igt@xe_module_load@load.html
>     [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-8/igt@xe_module_load@load.html
>     [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-4/igt@xe_module_load@load.html
>     [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-6/igt@xe_module_load@load.html
>     [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-3/igt@xe_module_load@load.html
>     [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-1/igt@xe_module_load@load.html
>     [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-5/igt@xe_module_load@load.html
>     [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-7/igt@xe_module_load@load.html
>     [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-7/igt@xe_module_load@load.html
>     [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-3/igt@xe_module_load@load.html
>     [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-6/igt@xe_module_load@load.html
>     [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-7/igt@xe_module_load@load.html
>     [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-7/igt@xe_module_load@load.html
>     [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-8/igt@xe_module_load@load.html
>     [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-5/igt@xe_module_load@load.html
>     [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-8/igt@xe_module_load@load.html
>     [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-3/igt@xe_module_load@load.html
>      - shard-bmg:          ([PASS][254], [PASS][255], [PASS][256], [PASS][257], [PASS][258], [PASS][259], [PASS][260], [PASS][261], [PASS][262], [PASS][263], [PASS][264], [PASS][265], [PASS][266], [PASS][267], [PASS][268], [PASS][269], [PASS][270], [PASS][271]) -> ([PASS][272], [PASS][273], [PASS][274], [PASS][275], [PASS][276], [SKIP][277], [PASS][278], [PASS][279], [PASS][280], [PASS][281], [PASS][282], [PASS][283], [PASS][284], [PASS][285], [PASS][286], [PASS][287], [PASS][288], [PASS][289], [PASS][290], [PASS][291]) ([Intel XE#2457])
>     [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-bmg-2/igt@xe_module_load@load.html
>     [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-bmg-8/igt@xe_module_load@load.html
>     [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-bmg-4/igt@xe_module_load@load.html
>     [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-bmg-4/igt@xe_module_load@load.html
>     [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-bmg-8/igt@xe_module_load@load.html
>     [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-bmg-8/igt@xe_module_load@load.html
>     [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-bmg-8/igt@xe_module_load@load.html
>     [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-bmg-4/igt@xe_module_load@load.html
>     [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-bmg-4/igt@xe_module_load@load.html
>     [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-bmg-7/igt@xe_module_load@load.html
>     [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-bmg-7/igt@xe_module_load@load.html
>     [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-bmg-7/igt@xe_module_load@load.html
>     [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-bmg-7/igt@xe_module_load@load.html
>     [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-bmg-2/igt@xe_module_load@load.html
>     [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-bmg-2/igt@xe_module_load@load.html
>     [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-bmg-2/igt@xe_module_load@load.html
>     [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-bmg-2/igt@xe_module_load@load.html
>     [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-bmg-7/igt@xe_module_load@load.html
>     [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-4/igt@xe_module_load@load.html
>     [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-2/igt@xe_module_load@load.html
>     [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-2/igt@xe_module_load@load.html
>     [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-4/igt@xe_module_load@load.html
>     [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-7/igt@xe_module_load@load.html
>     [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-8/igt@xe_module_load@load.html
>     [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-7/igt@xe_module_load@load.html
>     [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-7/igt@xe_module_load@load.html
>     [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-2/igt@xe_module_load@load.html
>     [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-4/igt@xe_module_load@load.html
>     [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-4/igt@xe_module_load@load.html
>     [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-4/igt@xe_module_load@load.html
>     [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-2/igt@xe_module_load@load.html
>     [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-8/igt@xe_module_load@load.html
>     [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-8/igt@xe_module_load@load.html
>     [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-8/igt@xe_module_load@load.html
>     [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-8/igt@xe_module_load@load.html
>     [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-8/igt@xe_module_load@load.html
>     [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-7/igt@xe_module_load@load.html
>     [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-7/igt@xe_module_load@load.html
> 
>    * igt@xe_oa@invalid-create-userspace-config:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][292] ([Intel XE#2541] / [Intel XE#3573]) +6 other tests skip
>     [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-433/igt@xe_oa@invalid-create-userspace-config.html
> 
>    * igt@xe_oa@oa-tlb-invalidate:
>      - shard-lnl:          NOTRUN -> [SKIP][293] ([Intel XE#2248])
>     [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-8/igt@xe_oa@oa-tlb-invalidate.html
>      - shard-bmg:          NOTRUN -> [SKIP][294] ([Intel XE#2248])
>     [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-8/igt@xe_oa@oa-tlb-invalidate.html
> 
>    * igt@xe_oa@syncs-ufence-wait-cfg:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][295] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501]) +1 other test skip
>     [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-433/igt@xe_oa@syncs-ufence-wait-cfg.html
> 
>    * igt@xe_pat@pat-index-xe2:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][296] ([Intel XE#977])
>     [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-433/igt@xe_pat@pat-index-xe2.html
> 
>    * igt@xe_pat@pat-index-xelpg:
>      - shard-bmg:          NOTRUN -> [SKIP][297] ([Intel XE#2236])
>     [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-2/igt@xe_pat@pat-index-xelpg.html
> 
>    * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
>      - shard-dg2-set2:     NOTRUN -> [FAIL][298] ([Intel XE#1173]) +2 other tests fail
>     [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-433/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html
> 
>    * igt@xe_peer2peer@write:
>      - shard-bmg:          NOTRUN -> [SKIP][299] ([Intel XE#2427])
>     [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-8/igt@xe_peer2peer@write.html
>      - shard-lnl:          NOTRUN -> [SKIP][300] ([Intel XE#1061])
>     [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-4/igt@xe_peer2peer@write.html
> 
>    * igt@xe_pm@d3cold-basic-exec:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][301] ([Intel XE#2284] / [Intel XE#366])
>     [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-464/igt@xe_pm@d3cold-basic-exec.html
>      - shard-lnl:          NOTRUN -> [SKIP][302] ([Intel XE#2284] / [Intel XE#366])
>     [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-1/igt@xe_pm@d3cold-basic-exec.html
> 
>    * igt@xe_pm@d3cold-mocs:
>      - shard-bmg:          NOTRUN -> [SKIP][303] ([Intel XE#2284]) +1 other test skip
>     [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-4/igt@xe_pm@d3cold-mocs.html
>      - shard-dg2-set2:     NOTRUN -> [SKIP][304] ([Intel XE#2284])
>     [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-432/igt@xe_pm@d3cold-mocs.html
>      - shard-lnl:          NOTRUN -> [SKIP][305] ([Intel XE#2284])
>     [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-6/igt@xe_pm@d3cold-mocs.html
> 
>    * igt@xe_pm@s3-vm-bind-unbind-all:
>      - shard-lnl:          NOTRUN -> [SKIP][306] ([Intel XE#584]) +1 other test skip
>     [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-3/igt@xe_pm@s3-vm-bind-unbind-all.html
> 
>    * igt@xe_pm@s4-basic-exec:
>      - shard-dg2-set2:     NOTRUN -> [ABORT][307] ([Intel XE#4268])
>     [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-433/igt@xe_pm@s4-basic-exec.html
> 
>    * igt@xe_pm@s4-mocs:
>      - shard-bmg:          NOTRUN -> [ABORT][308] ([Intel XE#4268]) +2 other tests abort
>     [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-7/igt@xe_pm@s4-mocs.html
> 
>    * igt@xe_pm@vram-d3cold-threshold:
>      - shard-lnl:          NOTRUN -> [SKIP][309] ([Intel XE#579])
>     [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-3/igt@xe_pm@vram-d3cold-threshold.html
>      - shard-bmg:          NOTRUN -> [SKIP][310] ([Intel XE#579])
>     [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-2/igt@xe_pm@vram-d3cold-threshold.html
> 
>    * igt@xe_query@multigpu-query-invalid-extension:
>      - shard-bmg:          NOTRUN -> [SKIP][311] ([Intel XE#944]) +1 other test skip
>     [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-7/igt@xe_query@multigpu-query-invalid-extension.html
> 
>    * igt@xe_query@multigpu-query-uc-fw-version-guc:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][312] ([Intel XE#944]) +2 other tests skip
>     [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-433/igt@xe_query@multigpu-query-uc-fw-version-guc.html
>      - shard-lnl:          NOTRUN -> [SKIP][313] ([Intel XE#944]) +1 other test skip
>     [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-3/igt@xe_query@multigpu-query-uc-fw-version-guc.html
> 
>    * igt@xe_sriov_auto_provisioning@exclusive-ranges:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][314] ([Intel XE#4130])
>     [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-432/igt@xe_sriov_auto_provisioning@exclusive-ranges.html
> 
>    * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:
>      - shard-bmg:          NOTRUN -> [SKIP][315] ([Intel XE#4130]) +1 other test skip
>     [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-2/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html
> 
>    * igt@xe_sriov_scheduling@equal-throughput:
>      - shard-bmg:          NOTRUN -> [SKIP][316] ([Intel XE#4351])
>     [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-4/igt@xe_sriov_scheduling@equal-throughput.html
> 
>    
> #### Possible fixes ####
> 
>    * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
>      - shard-bmg:          [SKIP][317] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][318]
>     [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
>     [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
>      - shard-dg2-set2:     [SKIP][319] ([Intel XE#2191]) -> [PASS][320]
>     [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
>     [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-433/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
> 
>    * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
>      - shard-bmg:          [SKIP][321] ([Intel XE#2291]) -> [PASS][322]
>     [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
>     [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-8/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
> 
>    * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
>      - shard-dg2-set2:     [SKIP][323] ([Intel XE#309]) -> [PASS][324] +4 other tests pass
>     [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
>     [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-432/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
> 
>    * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
>      - shard-bmg:          [SKIP][325] ([Intel XE#2316]) -> [PASS][326] +1 other test pass
>     [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html
>     [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-8/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html
> 
>    * igt@kms_flip@2x-plain-flip-ts-check:
>      - shard-dg2-set2:     [SKIP][327] ([Intel XE#310]) -> [PASS][328]
>     [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-dg2-464/igt@kms_flip@2x-plain-flip-ts-check.html
>     [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-432/igt@kms_flip@2x-plain-flip-ts-check.html
> 
>    * igt@kms_flip@flip-vs-expired-vblank-interruptible:
>      - shard-dg2-set2:     [FAIL][329] ([Intel XE#301]) -> [PASS][330]
>     [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
>     [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
> 
>    * igt@kms_flip@flip-vs-expired-vblank@d-dp2:
>      - shard-bmg:          [FAIL][331] ([Intel XE#3321]) -> [PASS][332] +3 other tests pass
>     [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank@d-dp2.html
>     [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank@d-dp2.html
> 
>    * igt@kms_flip@flip-vs-suspend-interruptible:
>      - shard-bmg:          [INCOMPLETE][333] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][334] +1 other test pass
>     [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible.html
>     [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>    * igt@kms_flip@plain-flip-fb-recreate@c-edp1:
>      - shard-lnl:          [FAIL][335] ([Intel XE#3149] / [Intel XE#886]) -> [PASS][336] +1 other test pass
>     [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-lnl-6/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html
>     [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-lnl-4/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:
>      - shard-dg2-set2:     [SKIP][337] ([Intel XE#656]) -> [PASS][338] +3 other tests pass
>     [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html
>     [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html
> 
>    * igt@kms_pm_rpm@modeset-non-lpsp:
>      - shard-dg2-set2:     [SKIP][339] ([Intel XE#836]) -> [PASS][340]
>     [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp.html
>     [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-432/igt@kms_pm_rpm@modeset-non-lpsp.html
> 
>    * igt@kms_setmode@invalid-clone-single-crtc-stealing:
>      - shard-bmg:          [SKIP][341] ([Intel XE#1435]) -> [PASS][342]
>     [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
>     [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-7/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
>      - shard-dg2-set2:     [SKIP][343] ([Intel XE#455]) -> [PASS][344]
>     [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-dg2-464/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
>     [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-432/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
> 
>    * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
>      - shard-dg2-set2:     [SKIP][345] ([Intel XE#1392]) -> [PASS][346] +3 other tests pass
>     [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
>     [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
> 
>    * igt@xe_exec_threads@threads-bal-mixed-userptr-rebind:
>      - shard-dg2-set2:     [INCOMPLETE][347] ([Intel XE#1169]) -> [PASS][348]
>     [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-dg2-434/igt@xe_exec_threads@threads-bal-mixed-userptr-rebind.html
>     [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-433/igt@xe_exec_threads@threads-bal-mixed-userptr-rebind.html
> 
>    
> #### Warnings ####
> 
>    * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:
>      - shard-dg2-set2:     [SKIP][349] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][350] ([Intel XE#787]) +3 other tests skip
>     [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-dg2-464/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html
>     [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-433/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html
> 
>    * igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-6:
>      - shard-dg2-set2:     [SKIP][351] ([Intel XE#787]) -> [SKIP][352] ([Intel XE#455] / [Intel XE#787]) +7 other tests skip
>     [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-6.html
>     [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-6.html
> 
>    * igt@kms_content_protection@lic-type-0:
>      - shard-dg2-set2:     [SKIP][353] ([Intel XE#455]) -> [FAIL][354] ([Intel XE#1178])
>     [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-dg2-464/igt@kms_content_protection@lic-type-0.html
>     [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-433/igt@kms_content_protection@lic-type-0.html
> 
>    * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
>      - shard-dg2-set2:     [SKIP][355] ([i915#3804]) -> [SKIP][356] ([Intel XE#455] / [i915#3804])
>     [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-dg2-433/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
>     [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
> 
>    * igt@kms_flip@2x-flip-vs-expired-vblank:
>      - shard-bmg:          [FAIL][357] ([Intel XE#3321]) -> [SKIP][358] ([Intel XE#2316])
>     [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank.html
>     [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank.html
> 
>    * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt:
>      - shard-bmg:          [SKIP][359] ([Intel XE#2311]) -> [SKIP][360] ([Intel XE#2312]) +2 other tests skip
>     [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt.html
>     [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt.html
> 
>    * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
>      - shard-dg2-set2:     [SKIP][361] ([Intel XE#651]) -> [SKIP][362] ([Intel XE#656]) +17 other tests skip
>     [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html
>     [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html
> 
>    * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move:
>      - shard-bmg:          [SKIP][363] ([Intel XE#2312]) -> [SKIP][364] ([Intel XE#2311]) +2 other tests skip
>     [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move.html
>     [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
>      - shard-bmg:          [SKIP][365] ([Intel XE#2312]) -> [SKIP][366] ([Intel XE#4141]) +2 other tests skip
>     [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
>     [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
>      - shard-bmg:          [SKIP][367] ([Intel XE#4141]) -> [SKIP][368] ([Intel XE#2312]) +4 other tests skip
>     [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
>     [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
> 
>    * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
>      - shard-dg2-set2:     [SKIP][369] ([Intel XE#656]) -> [SKIP][370] ([Intel XE#651]) +8 other tests skip
>     [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
>     [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:
>      - shard-bmg:          [SKIP][371] ([Intel XE#2312]) -> [SKIP][372] ([Intel XE#2313]) +6 other tests skip
>     [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html
>     [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:
>      - shard-bmg:          [SKIP][373] ([Intel XE#2313]) -> [SKIP][374] ([Intel XE#2312]) +8 other tests skip
>     [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html
>     [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html
> 
>    * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move:
>      - shard-dg2-set2:     [SKIP][375] ([Intel XE#653]) -> [SKIP][376] ([Intel XE#656]) +14 other tests skip
>     [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move.html
>     [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move.html
> 
>    * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
>      - shard-dg2-set2:     [SKIP][377] ([Intel XE#656]) -> [SKIP][378] ([Intel XE#653]) +12 other tests skip
>     [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html
>     [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html
> 
>    * igt@kms_plane_scaling@planes-downscale-factor-0-25:
>      - shard-dg2-set2:     [INCOMPLETE][379] ([Intel XE#2566]) -> [SKIP][380] ([Intel XE#2763] / [Intel XE#455])
>     [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25.html
>     [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-25.html
> 
>    * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b:
>      - shard-dg2-set2:     [INCOMPLETE][381] ([Intel XE#2566]) -> [SKIP][382] ([Intel XE#2763])
>     [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b.html
>     [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b.html
> 
>    * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>      - shard-dg2-set2:     [SKIP][383] ([Intel XE#362]) -> [SKIP][384] ([Intel XE#1500])
>     [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>     [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>    * igt@xe_peer2peer@read:
>      - shard-dg2-set2:     [SKIP][385] ([Intel XE#1061]) -> [FAIL][386] ([Intel XE#1173])
>     [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/shard-dg2-432/igt@xe_peer2peer@read.html
>     [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/shard-dg2-433/igt@xe_peer2peer@read.html
> 
>    
>    [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
>    [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
>    [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>    [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>    [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>    [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>    [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
>    [Intel XE#1131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131
>    [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
>    [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
>    [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
>    [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>    [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
>    [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
>    [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
>    [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>    [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
>    [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>    [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>    [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>    [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>    [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>    [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
>    [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>    [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>    [Intel XE#1465]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465
>    [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
>    [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>    [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>    [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
>    [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>    [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
>    [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>    [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>    [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
>    [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>    [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
>    [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>    [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
>    [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
>    [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
>    [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>    [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>    [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
>    [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
>    [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
>    [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>    [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
>    [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>    [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
>    [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
>    [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>    [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>    [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>    [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
>    [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>    [Intel XE#2340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340
>    [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
>    [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
>    [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
>    [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
>    [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
>    [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
>    [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
>    [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
>    [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
>    [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
>    [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
>    [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>    [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
>    [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
>    [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
>    [Intel XE#2502]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2502
>    [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
>    [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
>    [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
>    [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
>    [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
>    [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
>    [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>    [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
>    [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
>    [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>    [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
>    [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
>    [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>    [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>    [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>    [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
>    [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
>    [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
>    [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
>    [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
>    [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
>    [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
>    [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
>    [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>    [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>    [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>    [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>    [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
>    [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
>    [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
>    [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
>    [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
>    [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
>    [Intel XE#3157]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3157
>    [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>    [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>    [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>    [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
>    [Intel XE#3279]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279
>    [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
>    [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
>    [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
>    [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>    [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>    [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
>    [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
>    [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
>    [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
>    [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>    [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>    [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>    [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
>    [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
>    [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
>    [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>    [Intel XE#3924]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3924
>    [Intel XE#4090]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090
>    [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
>    [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>    [Intel XE#4210]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210
>    [Intel XE#4268]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268
>    [Intel XE#4278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4278
>    [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
>    [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
>    [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
>    [Intel XE#4356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356
>    [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
>    [Intel XE#4418]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418
>    [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
>    [Intel XE#4439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4439
>    [Intel XE#4440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4440
>    [Intel XE#4497]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4497
>    [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
>    [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>    [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
>    [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
>    [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
>    [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
>    [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
>    [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
>    [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>    [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>    [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>    [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>    [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
>    [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>    [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
>    [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
>    [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>    [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>    [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
>    [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>    [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>    [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>    [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>    [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
>    [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
> 
> 
> Build changes
> -------------
> 
>    * IGT: IGT_8264 -> IGTPW_12723
>    * Linux: xe-2769-6f2e5afc45e3ca8bf46427ae21a9c1029ea6cdb3 -> xe-2772-eee1c40efa14a88232f68ca31fc341f34fb7cf7b
> 
>    IGTPW_12723: 12723
>    IGT_8264: 8264
>    xe-2769-6f2e5afc45e3ca8bf46427ae21a9c1029ea6cdb3: 6f2e5afc45e3ca8bf46427ae21a9c1029ea6cdb3
>    xe-2772-eee1c40efa14a88232f68ca31fc341f34fb7cf7b: eee1c40efa14a88232f68ca31fc341f34fb7cf7b
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12723/index.html
> 

