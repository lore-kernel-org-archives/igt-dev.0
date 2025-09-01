Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05DA6CA0FFD
	for <igt-dev@archiver.kernel.org>; Mon,  1 Sep 2025 10:22:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD2F710E40D;
	Mon,  1 Sep 2025 10:22:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W2seFoWs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43D5F10E40D
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Sep 2025 10:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756722163; x=1788258163;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=pNXB1HwYycmW8ge3GOfY0zboMjbTUJM0mxyCPcU8LV4=;
 b=W2seFoWs4YZpXgsBiLt0/145MxWJZWYqbYZIUnfAf7pXlg6EJ7gQ6Xfb
 JoQHexWdY67fdl/hpF1TCeqHgIF24sa9PdykeoOnPhnDJEqxsXKeMk/Qh
 iGoU9rd7teyMkywv0xlMxWps3bDKRKc0Qg/6VZxmM+J23fJUgwUD1fMGh
 kZ7v1+SrHyCCnqlKWjXK1Svsiv2AGotYsOu0AM68j6UIh8QRZGFCzSsFm
 9OriD6DKkBLAIWAG7pI/T2CUmtp+DEv+ZI//VRpGcuaQ+a08j8ZX1+o3O
 s5fJpPtUUFJKqXhFSIYK5z8HWUQVfHxCopZphc8IH99lhYLGEEr93kQUu w==;
X-CSE-ConnectionGUID: GT9pDOISTd2D87JYZtKISQ==
X-CSE-MsgGUID: Z04kEGgqRzWL51qF62cS8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58925549"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="58925549"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2025 03:22:43 -0700
X-CSE-ConnectionGUID: vf1jVt5oRkiCC5cLTSfMsw==
X-CSE-MsgGUID: ulp1GmRjQsuGQ0qC+RmndA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; d="scan'208";a="175353282"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.245.85.180])
 ([10.245.85.180])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2025 03:22:41 -0700
Message-ID: <152a6cda-9d3d-4ad0-b613-a88345f42133@linux.intel.com>
Date: Mon, 1 Sep 2025 12:22:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciB4ZV9zcmlvdl9m?=
 =?UTF-8?Q?lr=3A_Skip_non-MAIN_GTs_when_reading_provisioning_data?=
To: igt-dev@lists.freedesktop.org, lgci.bug.filing@intel.com
References: <20250829104037.649426-1-marcin.bernatowicz@linux.intel.com>
 <175649979896.286105.15023232614540772834@1538d3639d33>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <175649979896.286105.15023232614540772834@1538d3639d33>
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



On 8/29/2025 10:36 PM, Patchwork wrote:
> == Series Details ==
> 
> Series: xe_sriov_flr: Skip non-MAIN GTs when reading provisioning data
> URL   : https://patchwork.freedesktop.org/series/153709/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8515_FULL -> XEIGTPW_13660_FULL
> ====================================================
> 
> Summary
> -------
> 
>    **FAILURE**
> 
>    Serious unknown changes coming with XEIGTPW_13660_FULL absolutely need to be
>    verified manually.
>    
>    If you think the reported changes have nothing to do with the changes
>    introduced in XEIGTPW_13660_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>    Here are the unknown changes that may have been introduced in XEIGTPW_13660_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>    * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue:
>      - shard-bmg:          NOTRUN -> [FAIL][1]
>     [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-bmg-6/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue.html

Not related to the change.
--
marcin>
>    
> Known issues
> ------------
> 
>    Here are the changes found in XEIGTPW_13660_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>    * igt@fbdev@info:
>      - shard-dg2-set2:     [PASS][2] -> [SKIP][3] ([Intel XE#2134])
>     [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-463/igt@fbdev@info.html
>     [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-434/igt@fbdev@info.html
> 
>    * igt@intel_hwmon@hwmon-write:
>      - shard-bmg:          NOTRUN -> [FAIL][4] ([Intel XE#4665])
>     [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-bmg-6/igt@intel_hwmon@hwmon-write.html
>      - shard-lnl:          NOTRUN -> [SKIP][5] ([Intel XE#1125])
>     [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-lnl-4/igt@intel_hwmon@hwmon-write.html
> 
>    * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>      - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#2233])
>     [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-bmg-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>    * igt@kms_async_flips@async-flip-suspend-resume@pipe-c-dp-4:
>      - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][7] ([Intel XE#4912]) +1 other test incomplete
>     [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-435/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-dp-4.html
> 
>    * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1:
>      - shard-lnl:          [PASS][8] -> [FAIL][9] ([Intel XE#5993]) +3 other tests fail
>     [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html
>     [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html
> 
>    * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
>      - shard-dg2-set2:     [PASS][10] -> [SKIP][11] ([Intel XE#4208] / [i915#2575]) +77 other tests skip
>     [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-466/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
>     [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-434/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
> 
>    * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
>      - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#1407]) +1 other test skip
>     [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-lnl-4/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html
> 
>    * igt@kms_big_fb@linear-16bpp-rotate-270:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#316]) +1 other test skip
>     [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-463/igt@kms_big_fb@linear-16bpp-rotate-270.html
> 
>    * igt@kms_big_fb@linear-32bpp-rotate-270:
>      - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2327]) +3 other tests skip
>     [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-bmg-6/igt@kms_big_fb@linear-32bpp-rotate-270.html
> 
>    * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#2351] / [Intel XE#4208]) +6 other tests skip
>     [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
> 
>    * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#1124]) +4 other tests skip
>     [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-466/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html
>      - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#1124]) +2 other tests skip
>     [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-lnl-3/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html
> 
>    * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
>      - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#1124]) +3 other tests skip
>     [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-bmg-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
> 
>    * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
>      - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#2191])
>     [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-lnl-7/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
> 
>    * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
>      - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2314] / [Intel XE#2894])
>     [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-bmg-6/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
> 
>    * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#2191]) +1 other test skip
>     [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
> 
>    * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
>      - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#367]) +1 other test skip
>     [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-bmg-6/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
> 
>    * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#367])
>     [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-466/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
> 
>    * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
>      - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2887]) +9 other tests skip
>     [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-bmg-1/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html
> 
>    * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:
>      - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
>     [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-bmg-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html
> 
>    * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:
>      - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#2887]) +5 other tests skip
>     [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-lnl-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html
> 
>    * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
>      - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#3432])
>     [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html
>      - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#3432])
>     [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html
> 
>    * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#787]) +209 other tests skip
>     [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html
> 
>    * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#455] / [Intel XE#787]) +38 other tests skip
>     [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html
> 
>    * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2:
>      - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][31] ([Intel XE#1727] / [Intel XE#3113])
>     [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2.html
> 
>    * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:
>      - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][32] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) +2 other tests incomplete
>     [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html
> 
>    * igt@kms_cdclk@mode-transition-all-outputs:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#4418])
>     [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-466/igt@kms_cdclk@mode-transition-all-outputs.html
> 
>    * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
>      - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2252]) +5 other tests skip
>     [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
> 
>    * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#373]) +5 other tests skip
>     [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-463/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
>      - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#373]) +3 other tests skip
>     [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-lnl-2/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
> 
>    * igt@kms_content_protection@atomic-dpms:
>      - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#3278])
>     [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-lnl-8/igt@kms_content_protection@atomic-dpms.html
> 
>    * igt@kms_content_protection@dp-mst-lic-type-0:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#307]) +1 other test skip
>     [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-463/igt@kms_content_protection@dp-mst-lic-type-0.html
>      - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2390])
>     [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-bmg-3/igt@kms_content_protection@dp-mst-lic-type-0.html
> 
>    * igt@kms_content_protection@dp-mst-lic-type-1:
>      - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#307])
>     [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-lnl-4/igt@kms_content_protection@dp-mst-lic-type-1.html
> 
>    * igt@kms_content_protection@lic-type-0:
>      - shard-dg2-set2:     NOTRUN -> [FAIL][41] ([Intel XE#1178])
>     [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-435/igt@kms_content_protection@lic-type-0.html
> 
>    * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
>      - shard-bmg:          NOTRUN -> [FAIL][42] ([Intel XE#1178]) +2 other tests fail
>     [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-bmg-7/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html
> 
>    * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
>      - shard-dg2-set2:     NOTRUN -> [FAIL][43] ([Intel XE#3304])
>     [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-435/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html
> 
>    * igt@kms_content_protection@uevent@pipe-a-dp-4:
>      - shard-dg2-set2:     NOTRUN -> [FAIL][44] ([Intel XE#1188])
>     [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-464/igt@kms_content_protection@uevent@pipe-a-dp-4.html
> 
>    * igt@kms_cursor_crc@cursor-random-512x170:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#308])
>     [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-432/igt@kms_cursor_crc@cursor-random-512x170.html
> 
>    * igt@kms_cursor_crc@cursor-sliding-256x85:
>      - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2320]) +4 other tests skip
>     [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-256x85.html
>      - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#1424])
>     [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-lnl-4/igt@kms_cursor_crc@cursor-sliding-256x85.html
> 
>    * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
>      - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#309])
>     [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-lnl-3/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
> 
>    * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
>      - shard-bmg:          [PASS][49] -> [SKIP][50] ([Intel XE#2291]) +1 other test skip
>     [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
>     [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
> 
>    * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
>      - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#1508])
>     [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-bmg-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
>      - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#1508])
>     [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-lnl-7/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
> 
>    * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
>      - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#5428])
>     [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-bmg-4/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
> 
>    * igt@kms_dp_link_training@uhbr-mst:
>      - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#4354])
>     [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-lnl-3/igt@kms_dp_link_training@uhbr-mst.html
>      - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#4354])
>     [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-bmg-1/igt@kms_dp_link_training@uhbr-mst.html
> 
>    * igt@kms_dsc@dsc-with-output-formats-with-bpc:
>      - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2244])
>     [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-bmg-8/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
> 
>    * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
>      - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#4422])
>     [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-bmg-6/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html
> 
>    * igt@kms_fbcon_fbt@fbc:
>      - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#5425])
>     [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-bmg-2/igt@kms_fbcon_fbt@fbc.html
> 
>    * igt@kms_feature_discovery@chamelium:
>      - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2372])
>     [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-bmg-2/igt@kms_feature_discovery@chamelium.html
>      - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#701])
>     [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-463/igt@kms_feature_discovery@chamelium.html
>      - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#701])
>     [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-lnl-1/igt@kms_feature_discovery@chamelium.html
> 
>    * igt@kms_feature_discovery@display-2x:
>      - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#702])
>     [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-lnl-2/igt@kms_feature_discovery@display-2x.html
> 
>    * igt@kms_flip@2x-dpms-vs-vblank-race:
>      - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#1421]) +1 other test skip
>     [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-lnl-1/igt@kms_flip@2x-dpms-vs-vblank-race.html
> 
>    * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
>      - shard-bmg:          [PASS][64] -> [SKIP][65] ([Intel XE#2316])
>     [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-bmg-7/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
>     [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
> 
>    * igt@kms_flip@flip-vs-suspend-interruptible:
>      - shard-bmg:          [PASS][66] -> [INCOMPLETE][67] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
>     [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-bmg-5/igt@kms_flip@flip-vs-suspend-interruptible.html
>     [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-bmg-4/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>    * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
>      - shard-dg2-set2:     [PASS][68] -> [SKIP][69] ([Intel XE#4208]) +153 other tests skip
>     [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
>     [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
> 
>    * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:
>      - shard-lnl:          NOTRUN -> [FAIL][70] ([Intel XE#4683]) +1 other test fail
>     [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html
> 
>    * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
>      - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#1401] / [Intel XE#1745])
>     [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
> 
>    * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode:
>      - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#1401])
>     [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode.html
> 
>    * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
>      - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#2293]) +2 other tests skip
>     [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html
> 
>    * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
>      - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2293] / [Intel XE#2380]) +2 other tests skip
>     [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
> 
>    * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#455]) +15 other tests skip
>     [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
> 
>    * igt@kms_force_connector_basic@prune-stale-modes:
>      - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#352])
>     [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-lnl-4/igt@kms_force_connector_basic@prune-stale-modes.html
> 
>    * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:
>      - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#651]) +3 other tests skip
>     [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html
> 
>    * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
>      - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#2311]) +19 other tests skip
>     [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:
>      - shard-dg2-set2:     [PASS][79] -> [SKIP][80] ([Intel XE#2351] / [Intel XE#4208]) +12 other tests skip
>     [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html
>     [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-tiling-linear:
>      - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#5390]) +9 other tests skip
>     [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html
> 
>    * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#651]) +18 other tests skip
>     [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html
> 
>    * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render:
>      - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#656]) +14 other tests skip
>     [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move:
>      - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#2312]) +1 other test skip
>     [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
>      - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#2313]) +18 other tests skip
>     [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#653]) +19 other tests skip
>     [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html
> 
>    * igt@kms_hdr@invalid-hdr:
>      - shard-bmg:          [PASS][87] -> [SKIP][88] ([Intel XE#1503])
>     [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-bmg-2/igt@kms_hdr@invalid-hdr.html
>     [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-bmg-1/igt@kms_hdr@invalid-hdr.html
> 
>    * igt@kms_hdr@static-toggle-suspend:
>      - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#1503])
>     [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-lnl-3/igt@kms_hdr@static-toggle-suspend.html
> 
>    * igt@kms_joiner@invalid-modeset-ultra-joiner:
>      - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#2927])
>     [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-bmg-4/igt@kms_joiner@invalid-modeset-ultra-joiner.html
> 
>    * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
>      - shard-dg2-set2:     [PASS][91] -> [FAIL][92] ([Intel XE#616]) +1 other test fail
>     [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-463/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
>     [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-463/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
> 
>    * igt@kms_plane_lowres@tiling-y:
>      - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#2393])
>     [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-bmg-2/igt@kms_plane_lowres@tiling-y.html
> 
>    * igt@kms_plane_multiple@2x-tiling-4:
>      - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#4596])
>     [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-lnl-4/igt@kms_plane_multiple@2x-tiling-4.html
> 
>    * igt@kms_plane_scaling@2x-scaler-multi-pipe:
>      - shard-bmg:          [PASS][95] -> [SKIP][96] ([Intel XE#2571])
>     [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-bmg-8/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
>     [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
> 
>    * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#4208] / [i915#2575]) +22 other tests skip
>     [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html
> 
>    * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
>      - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#2763]) +4 other tests skip
>     [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html
> 
>    * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a:
>      - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#2763]) +3 other tests skip
>     [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-lnl-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a.html
> 
>    * igt@kms_pm_dc@dc5-dpms-negative:
>      - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#1131])
>     [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-lnl-4/igt@kms_pm_dc@dc5-dpms-negative.html
> 
>    * igt@kms_pm_dc@dc5-retention-flops:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][101] ([Intel XE#3309])
>     [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-464/igt@kms_pm_dc@dc5-retention-flops.html
> 
>    * igt@kms_pm_dc@dc6-psr:
>      - shard-lnl:          [PASS][102] -> [FAIL][103] ([Intel XE#718])
>     [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html
>     [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html
> 
>    * igt@kms_pm_rpm@modeset-lpsp:
>      - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
>     [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-bmg-2/igt@kms_pm_rpm@modeset-lpsp.html
> 
>    * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
>      - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#1406] / [Intel XE#2893])
>     [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-lnl-2/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html
> 
>    * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#1406] / [Intel XE#1489]) +4 other tests skip
>     [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-432/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html
> 
>    * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
>      - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#1406] / [Intel XE#1489]) +5 other tests skip
>     [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html
>      - shard-lnl:          NOTRUN -> [SKIP][108] ([Intel XE#1406] / [Intel XE#2893] / [Intel XE#4608]) +1 other test skip
>     [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html
> 
>    * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1:
>      - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#1406] / [Intel XE#4608]) +3 other tests skip
>     [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1.html
> 
>    * igt@kms_psr@fbc-pr-primary-blt:
>      - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#1406]) +1 other test skip
>     [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-lnl-3/igt@kms_psr@fbc-pr-primary-blt.html
> 
>    * igt@kms_psr@fbc-psr2-dpms:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][111] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +7 other tests skip
>     [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-433/igt@kms_psr@fbc-psr2-dpms.html
> 
>    * igt@kms_psr@psr-primary-page-flip:
>      - shard-bmg:          NOTRUN -> [SKIP][112] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +6 other tests skip
>     [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-bmg-8/igt@kms_psr@psr-primary-page-flip.html
> 
>    * igt@kms_psr@psr2-cursor-plane-move:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#1406] / [Intel XE#4208]) +2 other tests skip
>     [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-434/igt@kms_psr@psr2-cursor-plane-move.html
> 
>    * igt@kms_rotation_crc@sprite-rotation-90:
>      - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#3414] / [Intel XE#3904])
>     [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-bmg-1/igt@kms_rotation_crc@sprite-rotation-90.html
> 
>    * igt@kms_setmode@basic@pipe-b-edp-1:
>      - shard-lnl:          [PASS][115] -> [FAIL][116] ([Intel XE#2883]) +2 other tests fail
>     [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-lnl-2/igt@kms_setmode@basic@pipe-b-edp-1.html
>     [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-lnl-5/igt@kms_setmode@basic@pipe-b-edp-1.html
> 
>    * igt@kms_vrr@seamless-rr-switch-drrs:
>      - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#1499])
>     [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-bmg-1/igt@kms_vrr@seamless-rr-switch-drrs.html
>      - shard-lnl:          NOTRUN -> [SKIP][118] ([Intel XE#1499])
>     [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-lnl-3/igt@kms_vrr@seamless-rr-switch-drrs.html
> 
>    * igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute:
>      - shard-dg2-set2:     NOTRUN -> [FAIL][119] ([Intel XE#5890])
>     [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-463/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html
> 
>    * igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][120] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
>     [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-463/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html
> 
>    * igt@xe_copy_basic@mem-set-linear-0xfd:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][121] ([Intel XE#1126])
>     [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfd.html
> 
>    * igt@xe_create@multigpu-create-massive-size:
>      - shard-bmg:          NOTRUN -> [SKIP][122] ([Intel XE#2504])
>     [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-bmg-1/igt@xe_create@multigpu-create-massive-size.html
> 
>    * igt@xe_eu_stall@blocking-read:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][123] ([Intel XE#5626])
>     [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-432/igt@xe_eu_stall@blocking-read.html
> 
>    * igt@xe_eudebug@basic-close:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][124] ([Intel XE#4208]) +113 other tests skip
>     [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-434/igt@xe_eudebug@basic-close.html
> 
>    * igt@xe_eudebug@multiple-sessions:
>      - shard-lnl:          NOTRUN -> [SKIP][125] ([Intel XE#4837]) +2 other tests skip
>     [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-lnl-1/igt@xe_eudebug@multiple-sessions.html
> 
>    * igt@xe_eudebug_online@interrupt-other:
>      - shard-bmg:          NOTRUN -> [SKIP][126] ([Intel XE#4837]) +5 other tests skip
>     [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-bmg-8/igt@xe_eudebug_online@interrupt-other.html
> 
>    * igt@xe_eudebug_online@reset-with-attention:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][127] ([Intel XE#4837]) +1 other test skip
>     [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-463/igt@xe_eudebug_online@reset-with-attention.html
> 
>    * igt@xe_evict@evict-large-multi-vm:
>      - shard-lnl:          NOTRUN -> [SKIP][128] ([Intel XE#688])
>     [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-lnl-2/igt@xe_evict@evict-large-multi-vm.html
> 
>    * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
>      - shard-bmg:          NOTRUN -> [SKIP][129] ([Intel XE#2322]) +4 other tests skip
>     [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
> 
>    * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:
>      - shard-dg2-set2:     [PASS][130] -> [SKIP][131] ([Intel XE#1392]) +2 other tests skip
>     [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-466/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html
>     [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html
> 
>    * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:
>      - shard-lnl:          NOTRUN -> [SKIP][132] ([Intel XE#1392]) +1 other test skip
>     [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-lnl-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html
> 
>    * igt@xe_exec_fault_mode@once-rebind-imm:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][133] ([Intel XE#288]) +9 other tests skip
>     [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-436/igt@xe_exec_fault_mode@once-rebind-imm.html
> 
>    * igt@xe_exec_reset@parallel-gt-reset:
>      - shard-bmg:          NOTRUN -> [DMESG-WARN][134] ([Intel XE#3876])
>     [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-bmg-6/igt@xe_exec_reset@parallel-gt-reset.html
> 
>    * igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge:
>      - shard-bmg:          NOTRUN -> [SKIP][135] ([Intel XE#4943]) +15 other tests skip
>     [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-bmg-6/igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge.html
> 
>    * igt@xe_exec_system_allocator@process-many-mmap-free-race-nomemset:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][136] ([Intel XE#4915]) +146 other tests skip
>     [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-432/igt@xe_exec_system_allocator@process-many-mmap-free-race-nomemset.html
> 
>    * igt@xe_exec_system_allocator@process-many-stride-mmap-huge:
>      - shard-lnl:          NOTRUN -> [SKIP][137] ([Intel XE#4943]) +7 other tests skip
>     [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-lnl-8/igt@xe_exec_system_allocator@process-many-stride-mmap-huge.html
> 
>    * igt@xe_exec_threads@threads-userptr-invalidate-race:
>      - shard-bmg:          [PASS][138] -> [DMESG-FAIL][139] ([Intel XE#3876])
>     [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-bmg-8/igt@xe_exec_threads@threads-userptr-invalidate-race.html
>     [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-bmg-6/igt@xe_exec_threads@threads-userptr-invalidate-race.html
> 
>    * igt@xe_mmap@pci-membarrier-bad-object:
>      - shard-lnl:          NOTRUN -> [SKIP][140] ([Intel XE#5100])
>     [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-lnl-8/igt@xe_mmap@pci-membarrier-bad-object.html
> 
>    * igt@xe_module_load@reload:
>      - shard-dg2-set2:     [PASS][141] -> [FAIL][142] ([Intel XE#4208])
>     [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-464/igt@xe_module_load@reload.html
>     [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-434/igt@xe_module_load@reload.html
> 
>    * igt@xe_oa@oa-tlb-invalidate:
>      - shard-bmg:          NOTRUN -> [SKIP][143] ([Intel XE#2248])
>     [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-bmg-1/igt@xe_oa@oa-tlb-invalidate.html
> 
>    * igt@xe_oa@whitelisted-registers-userspace-config:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][144] ([Intel XE#3573]) +6 other tests skip
>     [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-466/igt@xe_oa@whitelisted-registers-userspace-config.html
> 
>    * igt@xe_peer2peer@write:
>      - shard-bmg:          NOTRUN -> [SKIP][145] ([Intel XE#2427])
>     [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-bmg-1/igt@xe_peer2peer@write.html
>      - shard-dg2-set2:     NOTRUN -> [SKIP][146] ([Intel XE#1061] / [Intel XE#4208])
>     [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-434/igt@xe_peer2peer@write.html
> 
>    * igt@xe_pm@d3cold-i2c:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][147] ([Intel XE#5694])
>     [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-463/igt@xe_pm@d3cold-i2c.html
>      - shard-lnl:          NOTRUN -> [SKIP][148] ([Intel XE#5694])
>     [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-lnl-2/igt@xe_pm@d3cold-i2c.html
>      - shard-bmg:          NOTRUN -> [SKIP][149] ([Intel XE#5694])
>     [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-bmg-8/igt@xe_pm@d3cold-i2c.html
> 
>    * igt@xe_pmu@all-fn-engine-activity-load:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][150] ([Intel XE#4650])
>     [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-464/igt@xe_pmu@all-fn-engine-activity-load.html
> 
>    * igt@xe_pmu@fn-engine-activity-sched-if-idle:
>      - shard-bmg:          [PASS][151] -> [DMESG-WARN][152] ([Intel XE#3876])
>     [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-bmg-6/igt@xe_pmu@fn-engine-activity-sched-if-idle.html
>     [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-bmg-7/igt@xe_pmu@fn-engine-activity-sched-if-idle.html
> 
>    * igt@xe_pxp@pxp-stale-bo-bind-post-suspend:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][153] ([Intel XE#4733]) +1 other test skip
>     [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-435/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html
> 
>    * igt@xe_pxp@pxp-stale-queue-post-termination-irq:
>      - shard-bmg:          NOTRUN -> [SKIP][154] ([Intel XE#4733]) +1 other test skip
>     [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-bmg-2/igt@xe_pxp@pxp-stale-queue-post-termination-irq.html
> 
>    * igt@xe_query@multigpu-query-cs-cycles:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][155] ([Intel XE#944]) +1 other test skip
>     [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-464/igt@xe_query@multigpu-query-cs-cycles.html
>      - shard-lnl:          NOTRUN -> [SKIP][156] ([Intel XE#944]) +1 other test skip
>     [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-lnl-2/igt@xe_query@multigpu-query-cs-cycles.html
> 
>    * igt@xe_query@multigpu-query-invalid-cs-cycles:
>      - shard-bmg:          NOTRUN -> [SKIP][157] ([Intel XE#944]) +2 other tests skip
>     [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-bmg-6/igt@xe_query@multigpu-query-invalid-cs-cycles.html
> 
>    * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][158] ([Intel XE#4130])
>     [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-463/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html
>      - shard-lnl:          NOTRUN -> [SKIP][159] ([Intel XE#4130])
>     [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-lnl-5/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html
> 
>    * igt@xe_sriov_flr@flr-twice:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][160] ([Intel XE#4273])
>     [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-435/igt@xe_sriov_flr@flr-twice.html
>      - shard-lnl:          NOTRUN -> [SKIP][161] ([Intel XE#4273])
>     [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-lnl-3/igt@xe_sriov_flr@flr-twice.html
> 
>    
> #### Possible fixes ####
> 
>    * igt@core_getversion@all-cards:
>      - shard-dg2-set2:     [FAIL][162] ([Intel XE#4208]) -> [PASS][163] +2 other tests pass
>     [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-434/igt@core_getversion@all-cards.html
>     [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-463/igt@core_getversion@all-cards.html
> 
>    * igt@fbdev@eof:
>      - shard-dg2-set2:     [SKIP][164] ([Intel XE#2134]) -> [PASS][165] +1 other test pass
>     [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-434/igt@fbdev@eof.html
>     [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-464/igt@fbdev@eof.html
> 
>    * igt@kms_big_fb@x-tiled-addfb-size-offset-overflow:
>      - shard-dg2-set2:     [SKIP][166] ([Intel XE#2351] / [Intel XE#4208]) -> [PASS][167] +8 other tests pass
>     [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-434/igt@kms_big_fb@x-tiled-addfb-size-offset-overflow.html
>     [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-463/igt@kms_big_fb@x-tiled-addfb-size-offset-overflow.html
> 
>    * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2:
>      - shard-bmg:          [FAIL][168] ([Intel XE#5376]) -> [PASS][169] +1 other test pass
>     [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2.html
>     [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2.html
> 
>    * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:
>      - shard-dg2-set2:     [INCOMPLETE][170] ([Intel XE#3124]) -> [PASS][171]
>     [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html
>     [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html
> 
>    * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:
>      - shard-dg2-set2:     [DMESG-WARN][172] ([Intel XE#1727] / [Intel XE#3113]) -> [PASS][173]
>     [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html
>     [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html
> 
>    * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
>      - shard-bmg:          [SKIP][174] ([Intel XE#2291]) -> [PASS][175] +4 other tests pass
>     [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
>     [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
> 
>    * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
>      - shard-bmg:          [FAIL][176] ([Intel XE#1475]) -> [PASS][177]
>     [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
>     [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
> 
>    * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
>      - shard-bmg:          [SKIP][178] ([Intel XE#1340]) -> [PASS][179]
>     [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
>     [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-bmg-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
> 
>    * igt@kms_fbcon_fbt@fbc-suspend:
>      - shard-dg2-set2:     [INCOMPLETE][180] ([Intel XE#6001]) -> [PASS][181]
>     [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-432/igt@kms_fbcon_fbt@fbc-suspend.html
>     [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-466/igt@kms_fbcon_fbt@fbc-suspend.html
> 
>    * igt@kms_flip@2x-flip-vs-dpms-on-nop:
>      - shard-bmg:          [SKIP][182] ([Intel XE#2316]) -> [PASS][183] +7 other tests pass
>     [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
>     [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
> 
>    * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
>      - shard-lnl:          [FAIL][184] ([Intel XE#301]) -> [PASS][185] +1 other test pass
>     [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
>     [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
> 
>    * igt@kms_flip@flip-vs-rmfb@c-dp2:
>      - shard-bmg:          [INCOMPLETE][186] ([Intel XE#2049]) -> [PASS][187] +1 other test pass
>     [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-bmg-3/igt@kms_flip@flip-vs-rmfb@c-dp2.html
>     [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-bmg-4/igt@kms_flip@flip-vs-rmfb@c-dp2.html
> 
>    * igt@kms_flip@flip-vs-suspend-interruptible:
>      - shard-dg2-set2:     [INCOMPLETE][188] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][189] +1 other test pass
>     [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible.html
>     [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>    * igt@kms_hdr@invalid-metadata-sizes:
>      - shard-bmg:          [SKIP][190] ([Intel XE#1503]) -> [PASS][191]
>     [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-bmg-6/igt@kms_hdr@invalid-metadata-sizes.html
>     [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-bmg-8/igt@kms_hdr@invalid-metadata-sizes.html
> 
>    * igt@kms_lease@invalid-create-leases:
>      - shard-dg2-set2:     [SKIP][192] ([Intel XE#4208] / [i915#2575]) -> [PASS][193] +99 other tests pass
>     [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-434/igt@kms_lease@invalid-create-leases.html
>     [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-435/igt@kms_lease@invalid-create-leases.html
> 
>    * igt@kms_plane_multiple@2x-tiling-x:
>      - shard-bmg:          [SKIP][194] ([Intel XE#4596]) -> [PASS][195]
>     [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-x.html
>     [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-x.html
> 
>    * igt@kms_pm_dc@dc5-dpms:
>      - shard-lnl:          [FAIL][196] ([Intel XE#718]) -> [PASS][197]
>     [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-lnl-3/igt@kms_pm_dc@dc5-dpms.html
>     [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-lnl-3/igt@kms_pm_dc@dc5-dpms.html
> 
>    * igt@kms_setmode@basic:
>      - shard-dg2-set2:     [FAIL][198] ([Intel XE#2883]) -> [PASS][199]
>     [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-432/igt@kms_setmode@basic.html
>     [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-435/igt@kms_setmode@basic.html
> 
>    * igt@kms_vblank@ts-continuation-suspend:
>      - shard-dg2-set2:     [INCOMPLETE][200] ([Intel XE#4488]) -> [PASS][201] +1 other test pass
>     [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-464/igt@kms_vblank@ts-continuation-suspend.html
>     [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-466/igt@kms_vblank@ts-continuation-suspend.html
> 
>    * igt@kms_vrr@cmrr@pipe-a-edp-1:
>      - shard-lnl:          [FAIL][202] ([Intel XE#4459]) -> [PASS][203] +1 other test pass
>     [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html
>     [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html
> 
>    * igt@xe_exec_basic@many-null-rebind:
>      - shard-dg2-set2:     [SKIP][204] ([Intel XE#4208]) -> [PASS][205] +209 other tests pass
>     [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-434/igt@xe_exec_basic@many-null-rebind.html
>     [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-433/igt@xe_exec_basic@many-null-rebind.html
> 
>    * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:
>      - shard-dg2-set2:     [SKIP][206] ([Intel XE#1392]) -> [PASS][207] +2 other tests pass
>     [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html
>     [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-464/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html
> 
>    * {igt@xe_exec_system_allocator@many-stride-malloc-prefetch}:
>      - shard-bmg:          [WARN][208] ([Intel XE#5786]) -> [PASS][209] +1 other test pass
>     [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-bmg-4/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html
>     [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-bmg-8/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html
> 
>    * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-remap-ro-dontunmap:
>      - shard-bmg:          [INCOMPLETE][210] -> [PASS][211]
>     [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-remap-ro-dontunmap.html
>     [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-remap-ro-dontunmap.html
> 
>    * igt@xe_live_ktest@xe_bo:
>      - shard-dg2-set2:     [SKIP][212] ([Intel XE#2229] / [Intel XE#455]) -> [PASS][213] +1 other test pass
>     [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-434/igt@xe_live_ktest@xe_bo.html
>     [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-463/igt@xe_live_ktest@xe_bo.html
> 
>    * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
>      - shard-dg2-set2:     [SKIP][214] ([Intel XE#2229]) -> [PASS][215]
>     [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-434/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
>     [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-463/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
> 
>    
> #### Warnings ####
> 
>    * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>      - shard-dg2-set2:     [SKIP][216] ([Intel XE#4208] / [i915#2575]) -> [SKIP][217] ([Intel XE#623])
>     [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-434/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
>     [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-463/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>    * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
>      - shard-dg2-set2:     [SKIP][218] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][219] ([Intel XE#316])
>     [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-434/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
>     [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-466/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
> 
>    * igt@kms_big_fb@linear-64bpp-rotate-270:
>      - shard-dg2-set2:     [SKIP][220] ([Intel XE#316]) -> [SKIP][221] ([Intel XE#2351] / [Intel XE#4208])
>     [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-435/igt@kms_big_fb@linear-64bpp-rotate-270.html
>     [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-434/igt@kms_big_fb@linear-64bpp-rotate-270.html
> 
>    * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
>      - shard-dg2-set2:     [SKIP][222] ([Intel XE#4208]) -> [SKIP][223] ([Intel XE#316]) +2 other tests skip
>     [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-434/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
>     [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-432/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
> 
>    * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
>      - shard-dg2-set2:     [SKIP][224] ([Intel XE#316]) -> [SKIP][225] ([Intel XE#4208]) +2 other tests skip
>     [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-466/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
>     [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
> 
>    * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
>      - shard-dg2-set2:     [SKIP][226] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][227] ([Intel XE#1124]) +1 other test skip
>     [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-434/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html
>     [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-433/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html
> 
>    * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
>      - shard-dg2-set2:     [SKIP][228] ([Intel XE#607]) -> [SKIP][229] ([Intel XE#2351] / [Intel XE#4208])
>     [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
>     [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
> 
>    * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
>      - shard-dg2-set2:     [SKIP][230] ([Intel XE#1124]) -> [SKIP][231] ([Intel XE#2351] / [Intel XE#4208]) +3 other tests skip
>     [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-433/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
>     [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
> 
>    * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
>      - shard-dg2-set2:     [SKIP][232] ([Intel XE#4208]) -> [SKIP][233] ([Intel XE#607])
>     [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
>     [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
> 
>    * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
>      - shard-dg2-set2:     [SKIP][234] ([Intel XE#1124]) -> [SKIP][235] ([Intel XE#4208]) +6 other tests skip
>     [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
>     [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
> 
>    * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>      - shard-dg2-set2:     [SKIP][236] ([Intel XE#4208]) -> [SKIP][237] ([Intel XE#1124]) +7 other tests skip
>     [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>     [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>    * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
>      - shard-dg2-set2:     [SKIP][238] ([Intel XE#4208] / [i915#2575]) -> [SKIP][239] ([Intel XE#2191])
>     [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
>     [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-433/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
> 
>    * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
>      - shard-dg2-set2:     [SKIP][240] ([Intel XE#2191]) -> [SKIP][241] ([Intel XE#4208] / [i915#2575])
>     [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
>     [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
> 
>    * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
>      - shard-dg2-set2:     [SKIP][242] ([Intel XE#367]) -> [SKIP][243] ([Intel XE#4208] / [i915#2575]) +1 other test skip
>     [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-464/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
>     [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
> 
>    * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
>      - shard-dg2-set2:     [SKIP][244] ([Intel XE#4208] / [i915#2575]) -> [SKIP][245] ([Intel XE#367]) +3 other tests skip
>     [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
>     [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-435/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
> 
>    * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs:
>      - shard-dg2-set2:     [SKIP][246] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][247] ([Intel XE#4208]) +8 other tests skip
>     [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-464/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html
>     [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-434/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html
> 
>    * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
>      - shard-dg2-set2:     [SKIP][248] ([Intel XE#4208]) -> [SKIP][249] ([Intel XE#455] / [Intel XE#787]) +11 other tests skip
>     [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-434/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
>     [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-466/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
> 
>    * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
>      - shard-dg2-set2:     [SKIP][250] ([Intel XE#4208]) -> [SKIP][251] ([Intel XE#2907]) +1 other test skip
>     [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
>     [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-463/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
> 
>    * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
>      - shard-dg2-set2:     [SKIP][252] ([Intel XE#2907]) -> [SKIP][253] ([Intel XE#4208])
>     [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
>     [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
> 
>    * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>      - shard-dg2-set2:     [SKIP][254] ([Intel XE#4208]) -> [SKIP][255] ([Intel XE#3442]) +1 other test skip
>     [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
>     [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
> 
>    * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:
>      - shard-dg2-set2:     [SKIP][256] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][257] ([Intel XE#2351] / [Intel XE#4208]) +1 other test skip
>     [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html
>     [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html
> 
>    * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs:
>      - shard-dg2-set2:     [SKIP][258] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][259] ([Intel XE#455] / [Intel XE#787])
>     [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html
>     [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html
> 
>    * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
>      - shard-dg2-set2:     [INCOMPLETE][260] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345]) -> [INCOMPLETE][261] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345])
>     [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
>     [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
> 
>    * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
>      - shard-dg2-set2:     [INCOMPLETE][262] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> [INCOMPLETE][263] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
>     [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
>     [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
> 
>    * igt@kms_chamelium_color@ctm-green-to-red:
>      - shard-dg2-set2:     [SKIP][264] ([Intel XE#4208] / [i915#2575]) -> [SKIP][265] ([Intel XE#306]) +1 other test skip
>     [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-434/igt@kms_chamelium_color@ctm-green-to-red.html
>     [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-463/igt@kms_chamelium_color@ctm-green-to-red.html
> 
>    * igt@kms_chamelium_color@ctm-negative:
>      - shard-dg2-set2:     [SKIP][266] ([Intel XE#306]) -> [SKIP][267] ([Intel XE#4208] / [i915#2575])
>     [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-464/igt@kms_chamelium_color@ctm-negative.html
>     [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-434/igt@kms_chamelium_color@ctm-negative.html
> 
>    * igt@kms_chamelium_edid@hdmi-mode-timings:
>      - shard-dg2-set2:     [SKIP][268] ([Intel XE#4208] / [i915#2575]) -> [SKIP][269] ([Intel XE#373]) +10 other tests skip
>     [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-434/igt@kms_chamelium_edid@hdmi-mode-timings.html
>     [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-466/igt@kms_chamelium_edid@hdmi-mode-timings.html
> 
>    * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
>      - shard-dg2-set2:     [SKIP][270] ([Intel XE#373]) -> [SKIP][271] ([Intel XE#4208] / [i915#2575]) +8 other tests skip
>     [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-463/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
>     [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-434/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
> 
>    * igt@kms_content_protection@dp-mst-type-1:
>      - shard-dg2-set2:     [SKIP][272] ([Intel XE#4208] / [i915#2575]) -> [SKIP][273] ([Intel XE#307]) +1 other test skip
>     [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-434/igt@kms_content_protection@dp-mst-type-1.html
>     [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-463/igt@kms_content_protection@dp-mst-type-1.html
> 
>    * igt@kms_content_protection@lic-type-0:
>      - shard-bmg:          [SKIP][274] ([Intel XE#2341]) -> [FAIL][275] ([Intel XE#1178])
>     [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-bmg-6/igt@kms_content_protection@lic-type-0.html
>     [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-bmg-7/igt@kms_content_protection@lic-type-0.html
> 
>    * igt@kms_content_protection@srm:
>      - shard-dg2-set2:     [FAIL][276] ([Intel XE#1178]) -> [SKIP][277] ([Intel XE#4208] / [i915#2575])
>     [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-433/igt@kms_content_protection@srm.html
>     [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-434/igt@kms_content_protection@srm.html
> 
>    * igt@kms_cursor_crc@cursor-offscreen-32x32:
>      - shard-dg2-set2:     [SKIP][278] ([Intel XE#455]) -> [SKIP][279] ([Intel XE#4208] / [i915#2575]) +2 other tests skip
>     [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-466/igt@kms_cursor_crc@cursor-offscreen-32x32.html
>     [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-32x32.html
> 
>    * igt@kms_cursor_crc@cursor-sliding-512x170:
>      - shard-dg2-set2:     [SKIP][280] ([Intel XE#308]) -> [SKIP][281] ([Intel XE#4208] / [i915#2575]) +2 other tests skip
>     [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-464/igt@kms_cursor_crc@cursor-sliding-512x170.html
>     [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-512x170.html
> 
>    * igt@kms_cursor_crc@cursor-sliding-512x512:
>      - shard-dg2-set2:     [SKIP][282] ([Intel XE#4208] / [i915#2575]) -> [SKIP][283] ([Intel XE#308])
>     [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-512x512.html
>     [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-512x512.html
> 
>    * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
>      - shard-bmg:          [SKIP][284] ([Intel XE#2291]) -> [DMESG-WARN][285] ([Intel XE#5354])
>     [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
>     [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
> 
>    * igt@kms_dp_link_training@uhbr-sst:
>      - shard-dg2-set2:     [SKIP][286] ([Intel XE#4356]) -> [SKIP][287] ([Intel XE#4208])
>     [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-466/igt@kms_dp_link_training@uhbr-sst.html
>     [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-434/igt@kms_dp_link_training@uhbr-sst.html
> 
>    * igt@kms_dsc@dsc-with-bpc:
>      - shard-dg2-set2:     [SKIP][288] ([Intel XE#455]) -> [SKIP][289] ([Intel XE#4208]) +3 other tests skip
>     [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-464/igt@kms_dsc@dsc-with-bpc.html
>     [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-434/igt@kms_dsc@dsc-with-bpc.html
> 
>    * igt@kms_dsc@dsc-with-bpc-formats:
>      - shard-dg2-set2:     [SKIP][290] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][291] ([Intel XE#455]) +1 other test skip
>     [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-434/igt@kms_dsc@dsc-with-bpc-formats.html
>     [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-435/igt@kms_dsc@dsc-with-bpc-formats.html
> 
>    * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
>      - shard-dg2-set2:     [SKIP][292] ([Intel XE#4208]) -> [SKIP][293] ([Intel XE#4422])
>     [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-434/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html
>     [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-433/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html
> 
>    * igt@kms_fbcon_fbt@psr:
>      - shard-dg2-set2:     [SKIP][294] ([Intel XE#4208]) -> [SKIP][295] ([Intel XE#776])
>     [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-434/igt@kms_fbcon_fbt@psr.html
>     [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-433/igt@kms_fbcon_fbt@psr.html
> 
>    * igt@kms_feature_discovery@psr1:
>      - shard-dg2-set2:     [SKIP][296] ([Intel XE#1135]) -> [SKIP][297] ([Intel XE#4208] / [i915#2575])
>     [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-432/igt@kms_feature_discovery@psr1.html
>     [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-434/igt@kms_feature_discovery@psr1.html
> 
>    * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
>      - shard-dg2-set2:     [SKIP][298] ([Intel XE#455]) -> [SKIP][299] ([Intel XE#2351] / [Intel XE#4208]) +1 other test skip
>     [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
>     [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
> 
>    * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
>      - shard-dg2-set2:     [SKIP][300] ([Intel XE#4208]) -> [SKIP][301] ([Intel XE#455]) +4 other tests skip
>     [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
>     [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
> 
>    * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-move:
>      - shard-dg2-set2:     [SKIP][302] ([Intel XE#651]) -> [SKIP][303] ([Intel XE#4208]) +14 other tests skip
>     [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-move.html
>     [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-move.html
> 
>    * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
>      - shard-bmg:          [SKIP][304] ([Intel XE#2312]) -> [SKIP][305] ([Intel XE#2311]) +8 other tests skip
>     [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
>     [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
> 
>    * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
>      - shard-bmg:          [SKIP][306] ([Intel XE#2311]) -> [SKIP][307] ([Intel XE#2312]) +7 other tests skip
>     [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
>     [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
>      - shard-bmg:          [SKIP][308] ([Intel XE#5390]) -> [SKIP][309] ([Intel XE#2312]) +2 other tests skip
>     [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
>     [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
>      - shard-bmg:          [SKIP][310] ([Intel XE#2312]) -> [SKIP][311] ([Intel XE#5390]) +3 other tests skip
>     [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
>     [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
> 
>    * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:
>      - shard-dg2-set2:     [SKIP][312] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][313] ([Intel XE#651]) +5 other tests skip
>     [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html
>     [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html
> 
>    * igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary:
>      - shard-dg2-set2:     [SKIP][314] ([Intel XE#4208]) -> [SKIP][315] ([Intel XE#651]) +19 other tests skip
>     [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html
>     [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html
> 
>    * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
>      - shard-dg2-set2:     [SKIP][316] ([Intel XE#651]) -> [SKIP][317] ([Intel XE#2351] / [Intel XE#4208]) +7 other tests skip
>     [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html
>     [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
>      - shard-dg2-set2:     [SKIP][318] ([Intel XE#4208]) -> [SKIP][319] ([Intel XE#653]) +20 other tests skip
>     [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
>     [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:
>      - shard-bmg:          [SKIP][320] ([Intel XE#2313]) -> [SKIP][321] ([Intel XE#2312]) +8 other tests skip
>     [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html
>     [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
>      - shard-bmg:          [SKIP][322] ([Intel XE#2312]) -> [SKIP][323] ([Intel XE#2313]) +12 other tests skip
>     [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html
>     [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
>      - shard-dg2-set2:     [SKIP][324] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][325] ([Intel XE#653]) +12 other tests skip
>     [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
>     [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
>      - shard-dg2-set2:     [SKIP][326] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][327] ([Intel XE#658])
>     [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
>     [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
> 
>    * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:
>      - shard-dg2-set2:     [SKIP][328] ([Intel XE#653]) -> [SKIP][329] ([Intel XE#4208]) +18 other tests skip
>     [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html
>     [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html
> 
>    * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
>      - shard-dg2-set2:     [SKIP][330] ([Intel XE#653]) -> [SKIP][331] ([Intel XE#2351] / [Intel XE#4208]) +5 other tests skip
>     [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html
>     [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html
> 
>    * igt@kms_hdr@brightness-with-hdr:
>      - shard-bmg:          [SKIP][332] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][333] ([Intel XE#3544])
>     [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html
>     [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html
> 
>    * igt@kms_joiner@invalid-modeset-big-joiner:
>      - shard-dg2-set2:     [SKIP][334] ([Intel XE#4208]) -> [SKIP][335] ([Intel XE#346])
>     [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-434/igt@kms_joiner@invalid-modeset-big-joiner.html
>     [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-432/igt@kms_joiner@invalid-modeset-big-joiner.html
> 
>    * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
>      - shard-dg2-set2:     [SKIP][336] ([Intel XE#4208]) -> [SKIP][337] ([Intel XE#2925])
>     [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-434/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
>     [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-464/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
> 
>    * igt@kms_joiner@invalid-modeset-ultra-joiner:
>      - shard-dg2-set2:     [SKIP][338] ([Intel XE#4208]) -> [SKIP][339] ([Intel XE#2927])
>     [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-434/igt@kms_joiner@invalid-modeset-ultra-joiner.html
>     [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-436/igt@kms_joiner@invalid-modeset-ultra-joiner.html
> 
>    * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>      - shard-dg2-set2:     [SKIP][340] ([Intel XE#4208] / [i915#2575]) -> [SKIP][341] ([Intel XE#356])
>     [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-434/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
>     [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-463/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>    * igt@kms_plane_cursor@primary:
>      - shard-dg2-set2:     [FAIL][342] ([Intel XE#616]) -> [SKIP][343] ([Intel XE#4208] / [i915#2575])
>     [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-464/igt@kms_plane_cursor@primary.html
>     [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-434/igt@kms_plane_cursor@primary.html
> 
>    * igt@kms_pm_backlight@brightness-with-dpms:
>      - shard-dg2-set2:     [SKIP][344] ([Intel XE#2938]) -> [SKIP][345] ([Intel XE#4208])
>     [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-433/igt@kms_pm_backlight@brightness-with-dpms.html
>     [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-434/igt@kms_pm_backlight@brightness-with-dpms.html
> 
>    * igt@kms_pm_dc@dc5-psr:
>      - shard-dg2-set2:     [SKIP][346] ([Intel XE#4208]) -> [SKIP][347] ([Intel XE#1129])
>     [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-434/igt@kms_pm_dc@dc5-psr.html
>     [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-463/igt@kms_pm_dc@dc5-psr.html
> 
>    * igt@kms_pm_dc@dc6-psr:
>      - shard-dg2-set2:     [SKIP][348] ([Intel XE#1129]) -> [SKIP][349] ([Intel XE#2351] / [Intel XE#4208])
>     [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-435/igt@kms_pm_dc@dc6-psr.html
>     [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-434/igt@kms_pm_dc@dc6-psr.html
> 
>    * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
>      - shard-dg2-set2:     [SKIP][350] ([Intel XE#1406] / [Intel XE#1489]) -> [SKIP][351] ([Intel XE#1406] / [Intel XE#4208]) +7 other tests skip
>     [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-432/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html
>     [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-434/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html
> 
>    * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
>      - shard-dg2-set2:     [SKIP][352] ([Intel XE#1406] / [Intel XE#4208]) -> [SKIP][353] ([Intel XE#1406] / [Intel XE#1489]) +9 other tests skip
>     [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-434/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html
>     [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-466/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html
> 
>    * igt@kms_psr@fbc-pr-cursor-plane-move:
>      - shard-dg2-set2:     [SKIP][354] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) -> [SKIP][355] ([Intel XE#1406] / [Intel XE#4208]) +4 other tests skip
>     [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-432/igt@kms_psr@fbc-pr-cursor-plane-move.html
>     [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-434/igt@kms_psr@fbc-pr-cursor-plane-move.html
> 
>    * igt@kms_psr@fbc-psr-sprite-plane-onoff:
>      - shard-dg2-set2:     [SKIP][356] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) -> [SKIP][357] ([Intel XE#1406] / [Intel XE#2351] / [Intel XE#4208]) +4 other tests skip
>     [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-432/igt@kms_psr@fbc-psr-sprite-plane-onoff.html
>     [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-plane-onoff.html
> 
>    * igt@kms_psr@fbc-psr-sprite-render:
>      - shard-dg2-set2:     [SKIP][358] ([Intel XE#1406] / [Intel XE#4208]) -> [SKIP][359] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +8 other tests skip
>     [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-render.html
>     [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-render.html
> 
>    * igt@kms_psr@psr-dpms:
>      - shard-dg2-set2:     [SKIP][360] ([Intel XE#1406] / [Intel XE#2351] / [Intel XE#4208]) -> [SKIP][361] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +7 other tests skip
>     [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-434/igt@kms_psr@psr-dpms.html
>     [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-463/igt@kms_psr@psr-dpms.html
> 
>    * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>      - shard-dg2-set2:     [SKIP][362] ([Intel XE#1406] / [Intel XE#2939]) -> [SKIP][363] ([Intel XE#1406] / [Intel XE#4208])
>     [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-435/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
>     [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-434/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
> 
>    * igt@kms_rotation_crc@primary-rotation-270:
>      - shard-dg2-set2:     [SKIP][364] ([Intel XE#4208] / [i915#2575]) -> [SKIP][365] ([Intel XE#3414]) +1 other test skip
>     [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-434/igt@kms_rotation_crc@primary-rotation-270.html
>     [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-464/igt@kms_rotation_crc@primary-rotation-270.html
> 
>    * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
>      - shard-dg2-set2:     [SKIP][366] ([Intel XE#4208] / [i915#2575]) -> [SKIP][367] ([Intel XE#1127])
>     [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
>     [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
> 
>    * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>      - shard-dg2-set2:     [SKIP][368] ([Intel XE#3414]) -> [SKIP][369] ([Intel XE#4208] / [i915#2575]) +2 other tests skip
>     [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
>     [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
> 
>    * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>      - shard-dg2-set2:     [SKIP][370] ([Intel XE#1127]) -> [SKIP][371] ([Intel XE#4208] / [i915#2575])
>     [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-435/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
>     [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
> 
>    * igt@kms_vrr@cmrr:
>      - shard-dg2-set2:     [SKIP][372] ([Intel XE#2168]) -> [SKIP][373] ([Intel XE#4208] / [i915#2575])
>     [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-433/igt@kms_vrr@cmrr.html
>     [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-434/igt@kms_vrr@cmrr.html
> 
>    * igt@kms_vrr@flipline:
>      - shard-dg2-set2:     [SKIP][374] ([Intel XE#4208] / [i915#2575]) -> [SKIP][375] ([Intel XE#455]) +4 other tests skip
>     [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-434/igt@kms_vrr@flipline.html
>     [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-466/igt@kms_vrr@flipline.html
> 
>    * igt@kms_vrr@lobf:
>      - shard-dg2-set2:     [SKIP][376] ([Intel XE#4208] / [i915#2575]) -> [SKIP][377] ([Intel XE#2168])
>     [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-434/igt@kms_vrr@lobf.html
>     [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-435/igt@kms_vrr@lobf.html
> 
>    * igt@xe_compute_preempt@compute-preempt-many:
>      - shard-dg2-set2:     [SKIP][378] ([Intel XE#4208]) -> [FAIL][379] ([Intel XE#5890])
>     [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-many.html
>     [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-463/igt@xe_compute_preempt@compute-preempt-many.html
> 
>    * igt@xe_compute_preempt@compute-preempt-many-all-ram:
>      - shard-dg2-set2:     [FAIL][380] ([Intel XE#5890]) -> [SKIP][381] ([Intel XE#4208])
>     [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-466/igt@xe_compute_preempt@compute-preempt-many-all-ram.html
>     [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-many-all-ram.html
> 
>    * igt@xe_copy_basic@mem-copy-linear-0xfffe:
>      - shard-dg2-set2:     [SKIP][382] ([Intel XE#4208]) -> [SKIP][383] ([Intel XE#1123]) +1 other test skip
>     [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
>     [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
> 
>    * igt@xe_eu_stall@invalid-event-report-count:
>      - shard-dg2-set2:     [SKIP][384] ([Intel XE#4208]) -> [SKIP][385] ([Intel XE#5626])
>     [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-434/igt@xe_eu_stall@invalid-event-report-count.html
>     [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-466/igt@xe_eu_stall@invalid-event-report-count.html
> 
>    * igt@xe_eu_stall@unprivileged-access:
>      - shard-dg2-set2:     [SKIP][386] ([Intel XE#5626]) -> [SKIP][387] ([Intel XE#4208])
>     [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-435/igt@xe_eu_stall@unprivileged-access.html
>     [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-434/igt@xe_eu_stall@unprivileged-access.html
> 
>    * igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:
>      - shard-dg2-set2:     [SKIP][388] ([Intel XE#4208]) -> [SKIP][389] ([Intel XE#4837]) +10 other tests skip
>     [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-434/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html
>     [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-464/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html
> 
>    * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic:
>      - shard-dg2-set2:     [SKIP][390] ([Intel XE#4208]) -> [SKIP][391] ([Intel XE#1392])
>     [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-434/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic.html
>     [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic.html
> 
>    * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
>      - shard-dg2-set2:     [SKIP][392] ([Intel XE#288]) -> [SKIP][393] ([Intel XE#4208]) +19 other tests skip
>     [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-435/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
>     [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-434/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
> 
>    * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
>      - shard-dg2-set2:     [SKIP][394] ([Intel XE#4208]) -> [SKIP][395] ([Intel XE#288]) +32 other tests skip
>     [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
>     [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
> 
>    * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
>      - shard-dg2-set2:     [SKIP][396] ([Intel XE#2360]) -> [SKIP][397] ([Intel XE#4208])
>     [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
>     [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-434/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
> 
>    * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
>      - shard-dg2-set2:     [SKIP][398] ([Intel XE#4208]) -> [SKIP][399] ([Intel XE#2360])
>     [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
>     [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-463/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
> 
>    * igt@xe_exec_sip_eudebug@breakpoint-writesip:
>      - shard-dg2-set2:     [SKIP][400] ([Intel XE#4837]) -> [SKIP][401] ([Intel XE#4208]) +9 other tests skip
>     [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-432/igt@xe_exec_sip_eudebug@breakpoint-writesip.html
>     [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-434/igt@xe_exec_sip_eudebug@breakpoint-writesip.html
> 
>    * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-shared-nomemset:
>      - shard-dg2-set2:     [SKIP][402] ([Intel XE#4208]) -> [SKIP][403] ([Intel XE#4915]) +281 other tests skip
>     [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-434/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-shared-nomemset.html
>     [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-463/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-shared-nomemset.html
> 
>    * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race-nomemset:
>      - shard-dg2-set2:     [SKIP][404] ([Intel XE#4915]) -> [SKIP][405] ([Intel XE#4208]) +207 other tests skip
>     [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-436/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race-nomemset.html
>     [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-434/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race-nomemset.html
> 
>    * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
>      - shard-dg2-set2:     [ABORT][406] ([Intel XE#4917]) -> [SKIP][407] ([Intel XE#4208])
>     [406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-435/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
>     [407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-434/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
>      - shard-lnl:          [ABORT][408] ([Intel XE#5466]) -> [ABORT][409] ([Intel XE#4917] / [Intel XE#5466])
>     [408]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-lnl-1/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
>     [409]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-lnl-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
> 
>    * igt@xe_media_fill@media-fill:
>      - shard-dg2-set2:     [SKIP][410] ([Intel XE#560]) -> [SKIP][411] ([Intel XE#4208])
>     [410]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-433/igt@xe_media_fill@media-fill.html
>     [411]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-434/igt@xe_media_fill@media-fill.html
> 
>    * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
>      - shard-dg2-set2:     [SKIP][412] ([Intel XE#3573]) -> [SKIP][413] ([Intel XE#4208]) +4 other tests skip
>     [412]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-432/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html
>     [413]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-434/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html
> 
>    * igt@xe_oa@syncs-userptr-wait-cfg:
>      - shard-dg2-set2:     [SKIP][414] ([Intel XE#4208]) -> [SKIP][415] ([Intel XE#3573]) +8 other tests skip
>     [414]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-434/igt@xe_oa@syncs-userptr-wait-cfg.html
>     [415]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-432/igt@xe_oa@syncs-userptr-wait-cfg.html
> 
>    * igt@xe_pat@pat-index-xe2:
>      - shard-dg2-set2:     [SKIP][416] ([Intel XE#4208]) -> [SKIP][417] ([Intel XE#977])
>     [416]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-434/igt@xe_pat@pat-index-xe2.html
>     [417]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-463/igt@xe_pat@pat-index-xe2.html
> 
>    * igt@xe_pat@pat-index-xelpg:
>      - shard-dg2-set2:     [SKIP][418] ([Intel XE#4208]) -> [SKIP][419] ([Intel XE#979])
>     [418]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-434/igt@xe_pat@pat-index-xelpg.html
>     [419]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-464/igt@xe_pat@pat-index-xelpg.html
> 
>    * igt@xe_peer2peer@read:
>      - shard-dg2-set2:     [SKIP][420] ([Intel XE#1061]) -> [SKIP][421] ([Intel XE#1061] / [Intel XE#4208])
>     [420]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-432/igt@xe_peer2peer@read.html
>     [421]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-434/igt@xe_peer2peer@read.html
> 
>    * igt@xe_pm@d3cold-basic-exec:
>      - shard-dg2-set2:     [SKIP][422] ([Intel XE#4208]) -> [SKIP][423] ([Intel XE#2284] / [Intel XE#366]) +2 other tests skip
>     [422]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-434/igt@xe_pm@d3cold-basic-exec.html
>     [423]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-435/igt@xe_pm@d3cold-basic-exec.html
> 
>    * igt@xe_pm@d3cold-mmap-vram:
>      - shard-dg2-set2:     [SKIP][424] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][425] ([Intel XE#4208]) +1 other test skip
>     [424]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-463/igt@xe_pm@d3cold-mmap-vram.html
>     [425]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-434/igt@xe_pm@d3cold-mmap-vram.html
> 
>    * igt@xe_pm@d3hot-i2c:
>      - shard-dg2-set2:     [SKIP][426] ([Intel XE#4208]) -> [SKIP][427] ([Intel XE#5742])
>     [426]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-434/igt@xe_pm@d3hot-i2c.html
>     [427]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-432/igt@xe_pm@d3hot-i2c.html
> 
>    * igt@xe_pmu@fn-engine-activity-sched-if-idle:
>      - shard-dg2-set2:     [SKIP][428] ([Intel XE#4208]) -> [SKIP][429] ([Intel XE#4650])
>     [428]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-434/igt@xe_pmu@fn-engine-activity-sched-if-idle.html
>     [429]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-435/igt@xe_pmu@fn-engine-activity-sched-if-idle.html
> 
>    * igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:
>      - shard-dg2-set2:     [SKIP][430] ([Intel XE#4208]) -> [SKIP][431] ([Intel XE#4733]) +3 other tests skip
>     [430]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-434/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html
>     [431]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-464/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html
> 
>    * igt@xe_query@multigpu-query-engines:
>      - shard-dg2-set2:     [SKIP][432] ([Intel XE#4208]) -> [SKIP][433] ([Intel XE#944]) +3 other tests skip
>     [432]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-434/igt@xe_query@multigpu-query-engines.html
>     [433]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-435/igt@xe_query@multigpu-query-engines.html
> 
>    * igt@xe_query@multigpu-query-uc-fw-version-guc:
>      - shard-dg2-set2:     [SKIP][434] ([Intel XE#944]) -> [SKIP][435] ([Intel XE#4208]) +5 other tests skip
>     [434]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-463/igt@xe_query@multigpu-query-uc-fw-version-guc.html
>     [435]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-434/igt@xe_query@multigpu-query-uc-fw-version-guc.html
> 
>    * igt@xe_render_copy@render-stress-1-copies:
>      - shard-dg2-set2:     [SKIP][436] ([Intel XE#4208]) -> [SKIP][437] ([Intel XE#4814])
>     [436]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-434/igt@xe_render_copy@render-stress-1-copies.html
>     [437]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-435/igt@xe_render_copy@render-stress-1-copies.html
> 
>    * igt@xe_render_copy@render-stress-4-copies:
>      - shard-dg2-set2:     [SKIP][438] ([Intel XE#4814]) -> [SKIP][439] ([Intel XE#4208])
>     [438]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-466/igt@xe_render_copy@render-stress-4-copies.html
>     [439]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-434/igt@xe_render_copy@render-stress-4-copies.html
> 
>    * igt@xe_sriov_flr@flr-each-isolation:
>      - shard-dg2-set2:     [SKIP][440] ([Intel XE#3342]) -> [SKIP][441] ([Intel XE#4208])
>     [440]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-463/igt@xe_sriov_flr@flr-each-isolation.html
>     [441]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-434/igt@xe_sriov_flr@flr-each-isolation.html
> 
>    * igt@xe_sriov_flr@flr-vf1-clear:
>      - shard-dg2-set2:     [SKIP][442] ([Intel XE#4208]) -> [SKIP][443] ([Intel XE#3342])
>     [442]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-434/igt@xe_sriov_flr@flr-vf1-clear.html
>     [443]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-463/igt@xe_sriov_flr@flr-vf1-clear.html
> 
>    * igt@xe_sriov_flr@flr-vfs-parallel:
>      - shard-dg2-set2:     [SKIP][444] ([Intel XE#4273]) -> [SKIP][445] ([Intel XE#4208])
>     [444]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-435/igt@xe_sriov_flr@flr-vfs-parallel.html
>     [445]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-434/igt@xe_sriov_flr@flr-vfs-parallel.html
> 
>    * igt@xe_sriov_scheduling@nonpreempt-engine-resets:
>      - shard-dg2-set2:     [SKIP][446] ([Intel XE#4208]) -> [SKIP][447] ([Intel XE#4351])
>     [446]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8515/shard-dg2-434/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html
>     [447]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/shard-dg2-435/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html
> 
>    
>    {name}: This element is suppressed. This means it is ignored when computing
>            the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>    [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
>    [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>    [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>    [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
>    [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>    [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>    [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
>    [Intel XE#1131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131
>    [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
>    [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>    [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
>    [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
>    [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
>    [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>    [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>    [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>    [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>    [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>    [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>    [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>    [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
>    [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>    [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>    [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>    [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
>    [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>    [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>    [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>    [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
>    [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
>    [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>    [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
>    [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
>    [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>    [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
>    [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
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
>    [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>    [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
>    [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
>    [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
>    [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
>    [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
>    [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
>    [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
>    [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
>    [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
>    [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
>    [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
>    [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>    [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
>    [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>    [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>    [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>    [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
>    [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>    [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
>    [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
>    [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
>    [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
>    [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
>    [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
>    [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
>    [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>    [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>    [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>    [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>    [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>    [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
>    [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
>    [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
>    [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>    [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
>    [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
>    [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
>    [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
>    [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
>    [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>    [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>    [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
>    [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
>    [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
>    [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
>    [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
>    [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
>    [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>    [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>    [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>    [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
>    [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>    [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
>    [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
>    [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
>    [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
>    [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
>    [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
>    [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
>    [Intel XE#4356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356
>    [Intel XE#4418]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418
>    [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
>    [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
>    [Intel XE#4488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4488
>    [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
>    [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>    [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
>    [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
>    [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
>    [Intel XE#4665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4665
>    [Intel XE#4683]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4683
>    [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>    [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
>    [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
>    [Intel XE#4912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4912
>    [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
>    [Intel XE#4917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
>    [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
>    [Intel XE#5007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007
>    [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
>    [Intel XE#5300]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5300
>    [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
>    [Intel XE#5376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5376
>    [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
>    [Intel XE#5425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5425
>    [Intel XE#5428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5428
>    [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
>    [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
>    [Intel XE#5626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626
>    [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
>    [Intel XE#5742]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742
>    [Intel XE#5786]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786
>    [Intel XE#5890]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5890
>    [Intel XE#5993]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5993
>    [Intel XE#6001]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6001
>    [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
>    [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>    [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
>    [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>    [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>    [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>    [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
>    [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>    [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
>    [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
>    [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
>    [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
>    [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>    [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
>    [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>    [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>    [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
>    [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
>    [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
> 
> 
> Build changes
> -------------
> 
>    * IGT: IGT_8515 -> IGTPW_13660
> 
>    IGTPW_13660: 3f0089c8a4af50a67d1b69d34d36e01a519bdc04 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    IGT_8515: 8515
>    xe-3636-a6266a4e06191737946de23e04597c13834cce70: a6266a4e06191737946de23e04597c13834cce70
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13660/index.html
> 

