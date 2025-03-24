Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A99B7C36002
	for <igt-dev@archiver.kernel.org>; Mon, 24 Mar 2025 13:58:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B5EA10E413;
	Mon, 24 Mar 2025 13:58:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UsfBSxgn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA41710E413;
 Mon, 24 Mar 2025 13:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742824731; x=1774360731;
 h=message-id:date:mime-version:subject:from:to:references:
 in-reply-to:content-transfer-encoding;
 bh=P4dShHjY3aKrDULjJ6iUU/KjGBf1FKoA5OTgFwCA2Mw=;
 b=UsfBSxgnAlx+it7ciE4OxgyyXkQKX9rNL73cNbpK2d5O1jdICerpQ+hk
 8addcXMD4rjhqJc00xu48TNYhwGSD+eBjP1yGDO3/ZiqhmjsPLW8HsWWN
 oXrvTf5U10yAIquVjBX6jE7X9w1T7pXf+W3VacVMnETNnqbn1daQLUqDV
 UuioM7xHw4zIJeA7BzztKPrE7tC6zKt9y2paqRh4BIU97acVAq9DLF0lC
 K7VkrGkOhSWZaEtFU8EEJTK6XGCsvIOYLZmlt2IK/+T8yi+ezOVqxvVez
 fRCBNghtjr2cZgdy1/rVlQAJcL73BI/wbl8NMVf3/G0NkSCX4XQgIJK1V w==;
X-CSE-ConnectionGUID: ys2lmslcSA+kHks2EzefQw==
X-CSE-MsgGUID: G7OGt49ATq6cymO/uzuTjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="44195209"
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="44195209"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 06:58:50 -0700
X-CSE-ConnectionGUID: GwQVefL2RSif6JoYUE9qPg==
X-CSE-MsgGUID: up+crwuZT96uXaHuR916UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="128747770"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.245.80.52])
 ([10.245.80.52])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 06:58:48 -0700
Message-ID: <3bc3c42d-fe52-41e5-a76f-de70bc029617@linux.intel.com>
Date: Mon, 24 Mar 2025 14:58:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_tests/intel?=
 =?UTF-8?Q?/xe=5Ffault=5Finjection=3A_Injection_list_clear_at_exit?=
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250321095306.798153-1-marcin.bernatowicz@linux.intel.com>
 <174257713732.65615.286403698099560201@18a75f3d1eae>
 <fc833c9f-3671-4bf4-9ae2-979e9c3384cd@linux.intel.com>
Content-Language: en-US
In-Reply-To: <fc833c9f-3671-4bf4-9ae2-979e9c3384cd@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



On 3/24/2025 2:31 PM, Bernatowicz, Marcin wrote:
> 
> 
> On 3/21/2025 6:12 PM, Patchwork wrote:
>> == Series Details ==
>>
>> Series: tests/intel/xe_fault_injection: Injection list clear at exit
>> URL   : https://patchwork.freedesktop.org/series/146575/
>> State : failure
>>
>> == Summary ==
>>
>> CI Bug Log - changes from XEIGT_8277_full -> XEIGTPW_12810_full
>> ====================================================
>>
>> Summary
>> -------
>>
>>    **FAILURE**
>>
>>    Serious unknown changes coming with XEIGTPW_12810_full absolutely 
>> need to be
>>    verified manually.
>>    If you think the reported changes have nothing to do with the changes
>>    introduced in XEIGTPW_12810_full, please notify your bug team 
>> (I915-ci-infra@lists.freedesktop.org) to allow them
>>    to document this new failure mode, which will reduce false 
>> positives in CI.
>>
>>
>> Participating hosts (4 -> 4)
>> ------------------------------
>>
>>    No changes in participating hosts
>>
>> Possible new issues
>> -------------------
>>
>>    Here are the unknown changes that may have been introduced in 
>> XEIGTPW_12810_full:
>>
>> ### IGT changes ###
>>
>> #### Possible regressions ####
>>
>>    * igt@xe_eudebug_online@set-breakpoint-sigint-debugger:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][1]
>>     [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> dg2-464/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html
>>
> 
> Not related to the change.
> -- 
> marcin
> 
>> Known issues
>> ------------
>>
>>    Here are the changes found in XEIGTPW_12810_full that come from 
>> known issues:
>>
>> ### IGT changes ###
>>
>> #### Issues hit ####
>>
>>    * igt@intel_hwmon@hwmon-write:
>>      - shard-lnl:          NOTRUN -> [SKIP][2] ([Intel XE#1125])
>>     [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> lnl-4/igt@intel_hwmon@hwmon-write.html
>>
>>    * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi- 
>> a-6-4-mc-ccs:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][3] ([Intel XE#2550] / 
>> [Intel XE#3767]) +7 other tests skip
>>     [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> dg2-464/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b- 
>> hdmi-a-6-4-mc-ccs.html
>>
>>    * igt@kms_atomic@plane-cursor-legacy@pipe-a-edp-1:
>>      - shard-lnl:          NOTRUN -> [DMESG-WARN][4] ([Intel XE#324]) 
>> +1 other test dmesg-warn
>>     [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> lnl-7/igt@kms_atomic@plane-cursor-legacy@pipe-a-edp-1.html
>>
>>    * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
>>      - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2385])
>>     [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> bmg-8/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
>>
>>    * igt@kms_atomic_transition@plane-all-modeset-transition:
>>      - shard-lnl:          NOTRUN -> [SKIP][6] ([Intel XE#3279])
>>     [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> lnl-8/igt@kms_atomic_transition@plane-all-modeset-transition.html
>>
>>    * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-dp-4:
>>      - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][7] ([Intel XE#2613]) 
>> +1 other test incomplete
>>     [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> dg2-435/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b- 
>> dp-4.html
>>
>>    * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
>>      - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2327]) +5 
>> other tests skip
>>     [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> bmg-8/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#316]) +3 
>> other tests skip
>>     [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> dg2-436/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
>>
>>    * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async- 
>> flip:
>>      - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#3658])
>>     [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async- 
>> flip.html
>>
>>    * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>>      - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#1407]) +3 
>> other tests skip
>>     [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
>>
>>    * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
>>      - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#1124]) +18 
>> other tests skip
>>     [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> bmg-4/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
>>
>>    * igt@kms_big_fb@y-tiled-addfb:
>>      - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2328])
>>     [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> bmg-6/igt@kms_big_fb@y-tiled-addfb.html
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#619])
>>     [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> dg2-434/igt@kms_big_fb@y-tiled-addfb.html
>>      - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#1467])
>>     [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> lnl-1/igt@kms_big_fb@y-tiled-addfb.html
>>
>>    * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
>>      - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#1477])
>>     [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> lnl-7/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
>>
>>    * igt@kms_big_fb@y-tiled-addfb-size-overflow:
>>      - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#610])
>>     [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> bmg-8/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#610])
>>     [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> dg2-436/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
>>
>>    * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
>>      - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#607])
>>     [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> bmg-8/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
>>
>>    * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#1124]) +13 
>> other tests skip
>>     [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
>>
>>    * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip- 
>> async-flip:
>>      - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#1124]) +12 
>> other tests skip
>>     [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> lnl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip- 
>> async-flip.html
>>
>>    * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
>>      - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#2191]) +1 
>> other test skip
>>     [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> lnl-1/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
>>
>>    * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
>>      - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2314] / 
>> [Intel XE#2894]) +1 other test skip
>>     [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
>>
>>    * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#2191])
>>     [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
>>
>>    * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
>>      - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#367]) +2 
>> other tests skip
>>     [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> bmg-3/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html
>>
>>    * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#367]) +2 
>> other tests skip
>>     [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> dg2-433/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
>>
>>    * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#787]) +175 
>> other tests skip
>>     [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2.html
>>
>>    * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
>>      - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2887]) +28 
>> other tests skip
>>     [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> bmg-7/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html
>>
>>    * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#455] / 
>> [Intel XE#787]) +47 other tests skip
>>     [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> dg2-433/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
>>      - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#2887]) +17 
>> other tests skip
>>     [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> lnl-1/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
>>
>>    * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#2907])
>>     [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> dg2-436/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
>>
>>    * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
>>      - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2652] / 
>> [Intel XE#787]) +30 other tests skip
>>     [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> bmg-8/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html
>>
>>    * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
>>      - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#3432]) +1 
>> other test skip
>>     [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> lnl-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html
>>
>>    * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:
>>      - shard-dg2-set2:     [PASS][34] -> [INCOMPLETE][35] ([Intel 
>> XE#1727] / [Intel XE#3113]) +1 other test incomplete
>>     [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi- 
>> a-6.html
>>     [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi- 
>> a-6.html
>>
>>    * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#4416]) +3 
>> other tests skip
>>     [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> dg2-433/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html
>>
>>    * igt@kms_chamelium_audio@dp-audio:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#373]) +10 
>> other tests skip
>>     [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> dg2-434/igt@kms_chamelium_audio@dp-audio.html
>>      - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#373]) +9 
>> other tests skip
>>     [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> lnl-1/igt@kms_chamelium_audio@dp-audio.html
>>
>>    * igt@kms_chamelium_audio@hdmi-audio-edid:
>>      - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2252]) +10 
>> other tests skip
>>     [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> bmg-1/igt@kms_chamelium_audio@hdmi-audio-edid.html
>>
>>    * igt@kms_chamelium_color@ctm-0-50:
>>      - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2325]) +1 
>> other test skip
>>     [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> bmg-1/igt@kms_chamelium_color@ctm-0-50.html
>>
>>    * igt@kms_chamelium_color@ctm-limited-range:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#306]) +2 
>> other tests skip
>>     [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> dg2-432/igt@kms_chamelium_color@ctm-limited-range.html
>>
>>    * igt@kms_chamelium_color@ctm-negative:
>>      - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#306]) +2 
>> other tests skip
>>     [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> lnl-7/igt@kms_chamelium_color@ctm-negative.html
>>
>>    * igt@kms_content_protection@atomic:
>>      - shard-bmg:          NOTRUN -> [FAIL][43] ([Intel XE#1178]) +2 
>> other tests fail
>>     [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> bmg-4/igt@kms_content_protection@atomic.html
>>      - shard-dg2-set2:     NOTRUN -> [FAIL][44] ([Intel XE#1178]) +1 
>> other test fail
>>     [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> dg2-433/igt@kms_content_protection@atomic.html
>>      - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#3278]) +1 
>> other test skip
>>     [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> lnl-2/igt@kms_content_protection@atomic.html
>>
>>    * igt@kms_content_protection@content-type-change:
>>      - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2341]) +2 
>> other tests skip
>>     [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> bmg-4/igt@kms_content_protection@content-type-change.html
>>
>>    * igt@kms_content_protection@dp-mst-lic-type-1:
>>      - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2390])
>>     [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> bmg-8/igt@kms_content_protection@dp-mst-lic-type-1.html
>>
>>    * igt@kms_content_protection@mei-interface:
>>      - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#1468])
>>     [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> lnl-1/igt@kms_content_protection@mei-interface.html
>>
>>    * igt@kms_content_protection@uevent@pipe-a-dp-2:
>>      - shard-dg2-set2:     NOTRUN -> [FAIL][49] ([Intel XE#1188])
>>     [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> dg2-432/igt@kms_content_protection@uevent@pipe-a-dp-2.html
>>
>>    * igt@kms_cursor_crc@cursor-offscreen-32x32:
>>      - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2320]) +5 
>> other tests skip
>>     [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> bmg-8/igt@kms_cursor_crc@cursor-offscreen-32x32.html
>>
>>    * igt@kms_cursor_crc@cursor-onscreen-512x512:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#308]) +2 
>> other tests skip
>>     [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x512.html
>>      - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#2321]) +1 
>> other test skip
>>     [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> lnl-3/igt@kms_cursor_crc@cursor-onscreen-512x512.html
>>
>>    * igt@kms_cursor_crc@cursor-random-512x512:
>>      - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2321]) +1 
>> other test skip
>>     [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> bmg-4/igt@kms_cursor_crc@cursor-random-512x512.html
>>
>>    * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
>>      - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#1424]) +4 
>> other tests skip
>>     [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> lnl-3/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html
>>
>>    * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
>>      - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2291]) +1 
>> other test skip
>>     [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
>>
>>    * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions- 
>> varying-size:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#309])
>>     [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions- 
>> varying-size.html
>>      - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#309])
>>     [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> lnl-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions- 
>> varying-size.html
>>
>>    * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions- 
>> varying-size:
>>      - shard-bmg:          [PASS][58] -> [SKIP][59] ([Intel XE#2291]) 
>> +3 other tests skip
>>     [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions- 
>> varying-size.html
>>     [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions- 
>> varying-size.html
>>
>>    * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
>>      - shard-dg2-set2:     [PASS][60] -> [SKIP][61] ([Intel XE#309])
>>     [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> dg2-463/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
>>     [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
>>
>>    * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
>>      - shard-bmg:          NOTRUN -> [INCOMPLETE][62] ([Intel XE#3226])
>>     [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
>>
>>    * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
>>      - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#323])
>>     [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> lnl-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
>>
>>    * igt@kms_dp_aux_dev:
>>      - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#3009])
>>     [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> bmg-6/igt@kms_dp_aux_dev.html
>>
>>    * igt@kms_dp_link_training@non-uhbr-mst:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#4354])
>>     [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> dg2-433/igt@kms_dp_link_training@non-uhbr-mst.html
>>
>>    * igt@kms_dp_linktrain_fallback@dp-fallback:
>>      - shard-dg2-set2:     [PASS][66] -> [SKIP][67] ([Intel XE#4331])
>>     [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> dg2-436/igt@kms_dp_linktrain_fallback@dp-fallback.html
>>     [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> dg2-464/igt@kms_dp_linktrain_fallback@dp-fallback.html
>>
>>    * igt@kms_dp_linktrain_fallback@dsc-fallback:
>>      - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#4331])
>>     [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> bmg-7/igt@kms_dp_linktrain_fallback@dsc-fallback.html
>>      - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#4331])
>>     [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> lnl-2/igt@kms_dp_linktrain_fallback@dsc-fallback.html
>>
>>    * igt@kms_dsc@dsc-with-bpc-formats:
>>      - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#2244])
>>     [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> bmg-8/igt@kms_dsc@dsc-with-bpc-formats.html
>>
>>    * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
>>      - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#4422]) +1 
>> other test skip
>>     [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> bmg-7/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
>>
>>    * igt@kms_fbcon_fbt@fbc-suspend:
>>      - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#4156])
>>     [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> bmg-8/igt@kms_fbcon_fbt@fbc-suspend.html
>>
>>    * igt@kms_feature_discovery@display-2x:
>>      - shard-bmg:          [PASS][73] -> [SKIP][74] ([Intel XE#2373])
>>     [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> bmg-3/igt@kms_feature_discovery@display-2x.html
>>     [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> bmg-4/igt@kms_feature_discovery@display-2x.html
>>
>>    * igt@kms_feature_discovery@display-4x:
>>      - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#1138])
>>     [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> bmg-4/igt@kms_feature_discovery@display-4x.html
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#1138])
>>     [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> dg2-433/igt@kms_feature_discovery@display-4x.html
>>      - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#1138])
>>     [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> lnl-2/igt@kms_feature_discovery@display-4x.html
>>
>>    * igt@kms_feature_discovery@psr1:
>>      - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#2374])
>>     [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> bmg-8/igt@kms_feature_discovery@psr1.html
>>
>>    * igt@kms_flip@2x-flip-vs-modeset:
>>      - shard-dg2-set2:     [PASS][79] -> [SKIP][80] ([Intel XE#310]) 
>> +3 other tests skip
>>     [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> dg2-466/igt@kms_flip@2x-flip-vs-modeset.html
>>     [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> dg2-464/igt@kms_flip@2x-flip-vs-modeset.html
>>
>>    * igt@kms_flip@2x-flip-vs-suspend-interruptible:
>>      - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#1421]) +4 
>> other tests skip
>>     [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> lnl-4/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
>>
>>    * igt@kms_flip@2x-nonexisting-fb-interruptible:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#310]) +2 
>> other tests skip
>>     [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> dg2-464/igt@kms_flip@2x-nonexisting-fb-interruptible.html
>>
>>    * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset- 
>> interruptible:
>>      - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#2316])
>>     [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> bmg-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset- 
>> interruptible.html
>>
>>    * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
>>      - shard-bmg:          [PASS][84] -> [SKIP][85] ([Intel XE#2316]) 
>> +5 other tests skip
>>     [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> bmg-8/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
>>     [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> bmg-6/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
>>
>>    * igt@kms_flip@blocking-wf_vblank:
>>      - shard-lnl:          [PASS][86] -> [FAIL][87] ([Intel XE#886]) 
>> +1 other test fail
>>     [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> lnl-5/igt@kms_flip@blocking-wf_vblank.html
>>     [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> lnl-4/igt@kms_flip@blocking-wf_vblank.html
>>
>>    * igt@kms_flip@blocking-wf_vblank@a-dp2:
>>      - shard-bmg:          [PASS][88] -> [FAIL][89] ([Intel XE#2882]) 
>> +1 other test fail
>>     [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> bmg-1/igt@kms_flip@blocking-wf_vblank@a-dp2.html
>>     [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> bmg-8/igt@kms_flip@blocking-wf_vblank@a-dp2.html
>>
>>    * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:
>>      - shard-dg2-set2:     NOTRUN -> [FAIL][90] ([Intel XE#301]) +5 
>> other tests fail
>>     [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html
>>
>>    * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile- 
>> downscaling@pipe-a-default-mode:
>>      - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#1397]) +1 
>> other test skip
>>     [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile- 
>> downscaling@pipe-a-default-mode.html
>>
>>    * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
>>      - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#2293] / 
>> [Intel XE#2380]) +8 other tests skip
>>     [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile- 
>> upscaling.html
>>
>>    * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear- 
>> downscaling:
>>      - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#1397] / 
>> [Intel XE#1745]) +1 other test skip
>>     [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear- 
>> downscaling.html
>>
>>    * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][94] ([Intel XE#455]) +26 
>> other tests skip
>>     [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile- 
>> downscaling.html
>>      - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#1401] / 
>> [Intel XE#1745]) +4 other tests skip
>>     [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile- 
>> downscaling.html
>>
>>    * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile- 
>> upscaling@pipe-a-default-mode:
>>      - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#1401]) +4 
>> other tests skip
>>     [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile- 
>> upscaling@pipe-a-default-mode.html
>>
>>    * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp- 
>> ytilegen12rcccs-upscaling@pipe-a-valid-mode:
>>      - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#2293]) +8 
>> other tests skip
>>     [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp- 
>> ytilegen12rcccs-upscaling@pipe-a-valid-mode.html
>>
>>    * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:
>>      - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#651]) +15 
>> other tests skip
>>     [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> lnl-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html
>>
>>    * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#651]) +39 
>> other tests skip
>>     [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/shard- 
>> dg2-435/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html
>>
>>    * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
>>      - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#2311]) +35 
>> other tests skip
>>     [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html
>>
>>    * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:
>>      - shard-dg2-set2:     [PASS][101] -> [SKIP][102] ([Intel XE#656]) 
>> +3 other tests skip
>>     [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html
>>     [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb- 
>> onoff.html
>>
>>    * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
>>      - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#4141]) +15 
>> other tests skip
>>     [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb- 
>> onoff.html
>>
>>    * igt@kms_frontbuffer_tracking@fbc-tiling-y:
>>      - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#1469])
>>     [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
>>      - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#2352])
>>     [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
>>
>>    * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw- 
>> mmap-wc:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#656]) +7 
>> other tests skip
>>     [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri- 
>> indfb-draw-mmap-wc.html
>>
>>    * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#658]) +1 
>> other test skip
>>     [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
>>
>>    * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
>>      - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#2313]) +34 
>> other tests skip
>>     [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb- 
>> plflip-blt.html
>>
>>    * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
>>      - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#2312]) +18 
>> other tests skip
>>     [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip- 
>> blt.html
>>
>>    * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#653]) +39 
>> other tests skip
>>     [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb- 
>> msflip-blt.html
>>
>>    * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
>>      - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#656]) +34 
>> other tests skip
>>     [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-lnl-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb- 
>> draw-render.html
>>
>>    * igt@kms_hdmi_inject@inject-4k:
>>      - shard-lnl:          NOTRUN -> [SKIP][112] ([Intel XE#1470])
>>     [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-lnl-4/igt@kms_hdmi_inject@inject-4k.html
>>
>>    * igt@kms_hdr@brightness-with-hdr:
>>      - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#3544])
>>     [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html
>>
>>    * igt@kms_hdr@invalid-hdr:
>>      - shard-dg2-set2:     [PASS][114] -> [SKIP][115] ([Intel XE#455])
>>     [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> dg2-463/igt@kms_hdr@invalid-hdr.html
>>     [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-436/igt@kms_hdr@invalid-hdr.html
>>
>>    * igt@kms_joiner@basic-max-non-joiner:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([Intel XE#4298])
>>     [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-464/igt@kms_joiner@basic-max-non-joiner.html
>>      - shard-lnl:          NOTRUN -> [SKIP][117] ([Intel XE#4298])
>>     [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-lnl-3/igt@kms_joiner@basic-max-non-joiner.html
>>      - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#4298])
>>     [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-bmg-2/igt@kms_joiner@basic-max-non-joiner.html
>>
>>    * igt@kms_joiner@basic-ultra-joiner:
>>      - shard-bmg:          NOTRUN -> [SKIP][119] ([Intel XE#2927])
>>     [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-bmg-6/igt@kms_joiner@basic-ultra-joiner.html
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][120] ([Intel XE#2927])
>>     [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-433/igt@kms_joiner@basic-ultra-joiner.html
>>
>>    * igt@kms_joiner@invalid-modeset-big-joiner:
>>      - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#346])
>>     [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-bmg-2/igt@kms_joiner@invalid-modeset-big-joiner.html
>>
>>    * igt@kms_joiner@invalid-modeset-force-big-joiner:
>>      - shard-dg2-set2:     [PASS][122] -> [SKIP][123] ([Intel XE#4328])
>>     [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> dg2-435/igt@kms_joiner@invalid-modeset-force-big-joiner.html
>>     [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-464/igt@kms_joiner@invalid-modeset-force-big-joiner.html
>>
>>    * igt@kms_joiner@invalid-modeset-ultra-joiner:
>>      - shard-lnl:          NOTRUN -> [SKIP][124] ([Intel XE#2927]) +1 
>> other test skip
>>     [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-lnl-7/igt@kms_joiner@invalid-modeset-ultra-joiner.html
>>
>>    * igt@kms_plane_cursor@viewport:
>>      - shard-dg2-set2:     NOTRUN -> [FAIL][125] ([Intel XE#616]) +1 
>> other test fail
>>     [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-466/igt@kms_plane_cursor@viewport.html
>>
>>    * igt@kms_plane_lowres@tiling-yf:
>>      - shard-bmg:          NOTRUN -> [SKIP][126] ([Intel XE#2393]) +1 
>> other test skip
>>     [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-bmg-8/igt@kms_plane_lowres@tiling-yf.html
>>
>>    * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][127] ([Intel XE#2763] / 
>> [Intel XE#455]) +4 other tests skip
>>     [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with- 
>> pixel-format.html
>>
>>    * igt@kms_plane_scaling@plane-downscale-factor-0-25-with- 
>> rotation@pipe-a:
>>      - shard-lnl:          NOTRUN -> [SKIP][128] ([Intel XE#2763]) +21 
>> other tests skip
>>     [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-lnl-7/igt@kms_plane_scaling@plane-downscale-factor-0-25-with- 
>> rotation@pipe-a.html
>>
>>    * igt@kms_plane_scaling@planes-upscale-20x20-downscale- 
>> factor-0-25@pipe-b:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][129] ([Intel XE#2763]) +5 
>> other tests skip
>>     [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-466/igt@kms_plane_scaling@planes-upscale-20x20-downscale- 
>> factor-0-25@pipe-b.html
>>
>>    * igt@kms_plane_scaling@planes-upscale-20x20-downscale- 
>> factor-0-75@pipe-a:
>>      - shard-bmg:          NOTRUN -> [SKIP][130] ([Intel XE#2763]) +14 
>> other tests skip
>>     [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-bmg-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale- 
>> factor-0-75@pipe-a.html
>>
>>    * igt@kms_pm_backlight@fade-with-dpms:
>>      - shard-bmg:          NOTRUN -> [SKIP][131] ([Intel XE#870])
>>     [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-bmg-3/igt@kms_pm_backlight@fade-with-dpms.html
>>
>>    * igt@kms_pm_dc@dc5-dpms-negative:
>>      - shard-lnl:          NOTRUN -> [SKIP][132] ([Intel XE#1131])
>>     [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-lnl-8/igt@kms_pm_dc@dc5-dpms-negative.html
>>
>>    * igt@kms_pm_dc@dc5-psr:
>>      - shard-bmg:          NOTRUN -> [SKIP][133] ([Intel XE#2392])
>>     [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-bmg-7/igt@kms_pm_dc@dc5-psr.html
>>      - shard-lnl:          NOTRUN -> [FAIL][134] ([Intel XE#718])
>>     [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-lnl-2/igt@kms_pm_dc@dc5-psr.html
>>
>>    * igt@kms_pm_dc@dc6-dpms:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][135] ([Intel XE#908])
>>     [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-434/igt@kms_pm_dc@dc6-dpms.html
>>      - shard-bmg:          NOTRUN -> [FAIL][136] ([Intel XE#1430])
>>     [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-bmg-6/igt@kms_pm_dc@dc6-dpms.html
>>
>>    * igt@kms_pm_rpm@modeset-non-lpsp:
>>      - shard-lnl:          NOTRUN -> [SKIP][137] ([Intel XE#1439] / 
>> [Intel XE#3141])
>>     [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-lnl-8/igt@kms_pm_rpm@modeset-non-lpsp.html
>>
>>    * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][138] ([Intel XE#1489]) +8 
>> other tests skip
>>     [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-463/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html
>>
>>    * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
>>      - shard-lnl:          NOTRUN -> [SKIP][139] ([Intel XE#2893]) +3 
>> other tests skip
>>     [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-lnl-4/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html
>>
>>    * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:
>>      - shard-bmg:          NOTRUN -> [SKIP][140] ([Intel XE#1489]) +6 
>> other tests skip
>>     [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-bmg-6/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed- 
>> sf.html
>>
>>    * igt@kms_psr2_su@frontbuffer-xrgb8888:
>>      - shard-bmg:          NOTRUN -> [SKIP][141] ([Intel XE#2387])
>>     [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-bmg-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html
>>
>>    * igt@kms_psr2_su@page_flip-xrgb8888:
>>      - shard-lnl:          NOTRUN -> [SKIP][142] ([Intel XE#1128])
>>     [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-lnl-6/igt@kms_psr2_su@page_flip-xrgb8888.html
>>
>>    * igt@kms_psr@fbc-pr-dpms:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][143] ([Intel XE#2850] / 
>> [Intel XE#929]) +18 other tests skip
>>     [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-433/igt@kms_psr@fbc-pr-dpms.html
>>
>>    * igt@kms_psr@pr-no-drrs:
>>      - shard-lnl:          NOTRUN -> [SKIP][144] ([Intel XE#1406]) +1 
>> other test skip
>>     [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-lnl-1/igt@kms_psr@pr-no-drrs.html
>>
>>    * igt@kms_psr@psr-primary-page-flip:
>>      - shard-bmg:          NOTRUN -> [SKIP][145] ([Intel XE#2234] / 
>> [Intel XE#2850]) +21 other tests skip
>>     [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-bmg-8/igt@kms_psr@psr-primary-page-flip.html
>>
>>    * igt@kms_psr@psr2-primary-render:
>>      - shard-bmg:          NOTRUN -> [SKIP][146] ([Intel XE#2234])
>>     [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-bmg-7/igt@kms_psr@psr2-primary-render.html
>>
>>    * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>>      - shard-bmg:          NOTRUN -> [SKIP][147] ([Intel XE#2414])
>>     [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-bmg-8/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
>>
>>    * igt@kms_rmfb@close-fd@pipe-a-edp-1:
>>      - shard-lnl:          [PASS][148] -> [DMESG-WARN][149] ([Intel 
>> XE#324])
>>     [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> lnl-8/igt@kms_rmfb@close-fd@pipe-a-edp-1.html
>>     [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-lnl-4/igt@kms_rmfb@close-fd@pipe-a-edp-1.html
>>
>>    * igt@kms_rotation_crc@primary-rotation-90:
>>      - shard-bmg:          NOTRUN -> [SKIP][150] ([Intel XE#3414] / 
>> [Intel XE#3904]) +1 other test skip
>>     [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-bmg-8/igt@kms_rotation_crc@primary-rotation-90.html
>>
>>    * igt@kms_scaling_modes@scaling-mode-none:
>>      - shard-bmg:          NOTRUN -> [SKIP][151] ([Intel XE#2413]) +1 
>> other test skip
>>     [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-bmg-3/igt@kms_scaling_modes@scaling-mode-none.html
>>
>>    * igt@kms_setmode@invalid-clone-single-crtc-stealing:
>>      - shard-bmg:          [PASS][152] -> [SKIP][153] ([Intel XE#1435])
>>     [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> bmg-3/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
>>     [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
>>
>>    * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>>      - shard-lnl:          NOTRUN -> [SKIP][154] ([Intel XE#362])
>>     [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-lnl-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>>
>>    * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
>>      - shard-lnl:          NOTRUN -> [FAIL][155] ([Intel XE#899]) +2 
>> other tests fail
>>     [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
>>
>>    * igt@kms_vrr@flip-suspend:
>>      - shard-bmg:          NOTRUN -> [SKIP][156] ([Intel XE#1499]) +1 
>> other test skip
>>     [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-bmg-3/igt@kms_vrr@flip-suspend.html
>>
>>    * igt@kms_vrr@negative-basic:
>>      - shard-lnl:          NOTRUN -> [SKIP][157] ([Intel XE#1499])
>>     [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-lnl-7/igt@kms_vrr@negative-basic.html
>>
>>    * igt@kms_writeback@writeback-check-output:
>>      - shard-lnl:          NOTRUN -> [SKIP][158] ([Intel XE#756])
>>     [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-lnl-2/igt@kms_writeback@writeback-check-output.html
>>
>>    * igt@kms_writeback@writeback-invalid-parameters:
>>      - shard-bmg:          NOTRUN -> [SKIP][159] ([Intel XE#756]) +1 
>> other test skip
>>     [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-bmg-8/igt@kms_writeback@writeback-invalid-parameters.html
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][160] ([Intel XE#756]) +1 
>> other test skip
>>     [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-436/igt@kms_writeback@writeback-invalid-parameters.html
>>
>>    * igt@sriov_basic@enable-vfs-autoprobe-off:
>>      - shard-bmg:          NOTRUN -> [SKIP][161] ([Intel XE#1091] / 
>> [Intel XE#2849])
>>     [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-off.html
>>
>>    * igt@xe_copy_basic@mem-copy-linear-0xfd:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][162] ([Intel XE#1123])
>>     [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0xfd.html
>>
>>    * igt@xe_copy_basic@mem-set-linear-0xfffe:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][163] ([Intel XE#1126])
>>     [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0xfffe.html
>>
>>    * igt@xe_create@create-big-vram:
>>      - shard-lnl:          NOTRUN -> [SKIP][164] ([Intel XE#1062])
>>     [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-lnl-1/igt@xe_create@create-big-vram.html
>>
>>    * igt@xe_eu_stall@blocking-read:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][165] ([Intel XE#4497]) +2 
>> other tests skip
>>     [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-464/igt@xe_eu_stall@blocking-read.html
>>
>>    * igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][166] ([Intel XE#2905] / 
>> [Intel XE#3889]) +1 other test skip
>>     [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-464/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html
>>      - shard-lnl:          NOTRUN -> [SKIP][167] ([Intel XE#2905] / 
>> [Intel XE#3889]) +1 other test skip
>>     [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-lnl-3/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html
>>
>>    * igt@xe_eudebug@basic-vm-bind-ufence-reconnect:
>>      - shard-bmg:          NOTRUN -> [SKIP][168] ([Intel XE#2905] / 
>> [Intel XE#3889]) +1 other test skip
>>     [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-bmg-6/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html
>>
>>    * igt@xe_eudebug_online@interrupt-all-set-breakpoint:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][169] ([Intel XE#2905]) +11 
>> other tests skip
>>     [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-435/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html
>>      - shard-lnl:          NOTRUN -> [SKIP][170] ([Intel XE#2905]) +11 
>> other tests skip
>>     [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-lnl-4/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html
>>
>>    * igt@xe_eudebug_online@single-step:
>>      - shard-bmg:          NOTRUN -> [SKIP][171] ([Intel XE#2905]) +18 
>> other tests skip
>>     [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-bmg-4/igt@xe_eudebug_online@single-step.html
>>
>>    * igt@xe_evict@evict-large-cm:
>>      - shard-lnl:          NOTRUN -> [SKIP][172] ([Intel XE#688])
>>     [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-lnl-8/igt@xe_evict@evict-large-cm.html
>>
>>    * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr- 
>> invalidate-race:
>>      - shard-dg2-set2:     [PASS][173] -> [SKIP][174] ([Intel 
>> XE#1392]) +2 other tests skip
>>     [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> dg2-463/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr- 
>> invalidate-race.html
>>     [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm- 
>> userptr-invalidate-race.html
>>
>>    * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:
>>      - shard-lnl:          NOTRUN -> [SKIP][175] ([Intel XE#1392]) +1 
>> other test skip
>>     [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-lnl-6/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html
>>
>>    * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
>>      - shard-bmg:          NOTRUN -> [SKIP][176] ([Intel XE#2322]) +12 
>> other tests skip
>>     [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html
>>
>>    * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][177] ([Intel XE#1392]) +3 
>> other tests skip
>>     [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html
>>
>>    * igt@xe_exec_fault_mode@once-bindexecqueue-imm:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][178] ([Intel XE#288]) +37 
>> other tests skip
>>     [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-436/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html
>>
>>    * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][179] ([Intel XE#2360])
>>     [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-464/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
>>
>>    * igt@xe_exec_threads@threads-hang-rebind:
>>      - shard-dg2-set2:     [PASS][180] -> [DMESG-WARN][181] ([Intel 
>> XE#3876])
>>     [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> dg2-434/igt@xe_exec_threads@threads-hang-rebind.html
>>     [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-432/igt@xe_exec_threads@threads-hang-rebind.html
>>
>>    * igt@xe_huc_copy@huc_copy:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][182] ([Intel XE#255])
>>     [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-435/igt@xe_huc_copy@huc_copy.html
>>
>>    * igt@xe_mmap@pci-membarrier-parallel:
>>      - shard-lnl:          NOTRUN -> [SKIP][183] ([Intel XE#4045])
>>     [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-lnl-7/igt@xe_mmap@pci-membarrier-parallel.html
>>
>>    * igt@xe_mmap@small-bar:
>>      - shard-bmg:          NOTRUN -> [SKIP][184] ([Intel XE#586])
>>     [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-bmg-7/igt@xe_mmap@small-bar.html
>>
>>    * igt@xe_module_load@load:
>>      - shard-dg2-set2:     ([PASS][185], [PASS][186], [PASS][187], 
>> [PASS][188], [PASS][189], [PASS][190], [PASS][191], [PASS][192], 
>> [PASS][193], [PASS][194], [PASS][195], [PASS][196], [PASS][197], 
>> [PASS][198], [PASS][199], [PASS][200], [PASS][201], [PASS][202], 
>> [PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], 
>> [PASS][208], [PASS][209]) -> ([PASS][210], [PASS][211], [PASS][212], 
>> [PASS][213], [PASS][214], [PASS][215], [PASS][216], [PASS][217], 
>> [PASS][218], [PASS][219], [PASS][220], [PASS][221], [PASS][222], 
>> [PASS][223], [PASS][224], [PASS][225], [PASS][226], [PASS][227], 
>> [PASS][228], [PASS][229], [PASS][230], [PASS][231], [SKIP][232], 
>> [PASS][233], [PASS][234], [PASS][235]) ([Intel XE#378])
>>     [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> dg2-433/igt@xe_module_load@load.html
>>     [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> dg2-433/igt@xe_module_load@load.html
>>     [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> dg2-466/igt@xe_module_load@load.html
>>     [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> dg2-463/igt@xe_module_load@load.html
>>     [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> dg2-466/igt@xe_module_load@load.html
>>     [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> dg2-466/igt@xe_module_load@load.html
>>     [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> dg2-435/igt@xe_module_load@load.html
>>     [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> dg2-463/igt@xe_module_load@load.html
>>     [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> dg2-435/igt@xe_module_load@load.html
>>     [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> dg2-435/igt@xe_module_load@load.html
>>     [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> dg2-464/igt@xe_module_load@load.html
>>     [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> dg2-463/igt@xe_module_load@load.html
>>     [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> dg2-464/igt@xe_module_load@load.html
>>     [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> dg2-436/igt@xe_module_load@load.html
>>     [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> dg2-436/igt@xe_module_load@load.html
>>     [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> dg2-434/igt@xe_module_load@load.html
>>     [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> dg2-434/igt@xe_module_load@load.html
>>     [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> dg2-436/igt@xe_module_load@load.html
>>     [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> dg2-436/igt@xe_module_load@load.html
>>     [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> dg2-433/igt@xe_module_load@load.html
>>     [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> dg2-434/igt@xe_module_load@load.html
>>     [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> dg2-432/igt@xe_module_load@load.html
>>     [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> dg2-432/igt@xe_module_load@load.html
>>     [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> dg2-432/igt@xe_module_load@load.html
>>     [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> dg2-464/igt@xe_module_load@load.html
>>     [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-433/igt@xe_module_load@load.html
>>     [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-433/igt@xe_module_load@load.html
>>     [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-463/igt@xe_module_load@load.html
>>     [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-466/igt@xe_module_load@load.html
>>     [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-466/igt@xe_module_load@load.html
>>     [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-432/igt@xe_module_load@load.html
>>     [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-463/igt@xe_module_load@load.html
>>     [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-464/igt@xe_module_load@load.html
>>     [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-464/igt@xe_module_load@load.html
>>     [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-432/igt@xe_module_load@load.html
>>     [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-433/igt@xe_module_load@load.html
>>     [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-434/igt@xe_module_load@load.html
>>     [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-434/igt@xe_module_load@load.html
>>     [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-464/igt@xe_module_load@load.html
>>     [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-464/igt@xe_module_load@load.html
>>     [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-435/igt@xe_module_load@load.html
>>     [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-435/igt@xe_module_load@load.html
>>     [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-435/igt@xe_module_load@load.html
>>     [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-463/igt@xe_module_load@load.html
>>     [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-434/igt@xe_module_load@load.html
>>     [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-432/igt@xe_module_load@load.html
>>     [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-436/igt@xe_module_load@load.html
>>     [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-432/igt@xe_module_load@load.html
>>     [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-436/igt@xe_module_load@load.html
>>     [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-436/igt@xe_module_load@load.html
>>     [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-432/igt@xe_module_load@load.html
>>
>>    * igt@xe_oa@buffer-size:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][236] ([Intel XE#4501])
>>     [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-436/igt@xe_oa@buffer-size.html
>>
>>    * igt@xe_oa@non-privileged-map-oa-buffer:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][237] ([Intel XE#2541] / 
>> [Intel XE#3573]) +4 other tests skip
>>     [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-463/igt@xe_oa@non-privileged-map-oa-buffer.html
>>
>>    * igt@xe_oa@syncs-syncobj-cfg:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][238] ([Intel XE#2541] / 
>> [Intel XE#3573] / [Intel XE#4501]) +2 other tests skip
>>     [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-464/igt@xe_oa@syncs-syncobj-cfg.html
>>
>>    * igt@xe_pat@pat-index-xehpc:
>>      - shard-bmg:          NOTRUN -> [SKIP][239] ([Intel XE#1420])
>>     [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-bmg-6/igt@xe_pat@pat-index-xehpc.html
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][240] ([Intel XE#2838] / 
>> [Intel XE#979])
>>     [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-434/igt@xe_pat@pat-index-xehpc.html
>>      - shard-lnl:          NOTRUN -> [SKIP][241] ([Intel XE#1420] / 
>> [Intel XE#2838])
>>     [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-lnl-1/igt@xe_pat@pat-index-xehpc.html
>>
>>    * igt@xe_pat@pat-index-xelp:
>>      - shard-bmg:          NOTRUN -> [SKIP][242] ([Intel XE#2245])
>>     [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-bmg-4/igt@xe_pat@pat-index-xelp.html
>>
>>    * igt@xe_pat@pat-index-xelpg:
>>      - shard-bmg:          NOTRUN -> [SKIP][243] ([Intel XE#2236])
>>     [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-bmg-6/igt@xe_pat@pat-index-xelpg.html
>>
>>    * igt@xe_pm@d3cold-basic-exec:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][244] ([Intel XE#2284] / 
>> [Intel XE#366]) +2 other tests skip
>>     [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-466/igt@xe_pm@d3cold-basic-exec.html
>>
>>    * igt@xe_pm@s3-d3cold-basic-exec:
>>      - shard-bmg:          NOTRUN -> [SKIP][245] ([Intel XE#2284]) +3 
>> other tests skip
>>     [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-bmg-3/igt@xe_pm@s3-d3cold-basic-exec.html
>>      - shard-lnl:          NOTRUN -> [SKIP][246] ([Intel XE#2284] / 
>> [Intel XE#366]) +1 other test skip
>>     [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-lnl-6/igt@xe_pm@s3-d3cold-basic-exec.html
>>
>>    * igt@xe_pm@s4-basic:
>>      - shard-bmg:          NOTRUN -> [ABORT][247] ([Intel XE#4268])
>>     [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-bmg-2/igt@xe_pm@s4-basic.html
>>
>>    * igt@xe_pm@vram-d3cold-threshold:
>>      - shard-bmg:          NOTRUN -> [SKIP][248] ([Intel XE#579])
>>     [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-bmg-4/igt@xe_pm@vram-d3cold-threshold.html
>>
>>    * igt@xe_pm_residency@cpg-basic:
>>      - shard-lnl:          NOTRUN -> [SKIP][249] ([Intel XE#584]) +2 
>> other tests skip
>>     [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-lnl-7/igt@xe_pm_residency@cpg-basic.html
>>
>>    * igt@xe_query@multigpu-query-engines:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][250] ([Intel XE#944]) +1 
>> other test skip
>>     [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-434/igt@xe_query@multigpu-query-engines.html
>>
>>    * igt@xe_query@multigpu-query-invalid-cs-cycles:
>>      - shard-bmg:          NOTRUN -> [SKIP][251] ([Intel XE#944]) +5 
>> other tests skip
>>     [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-bmg-6/igt@xe_query@multigpu-query-invalid-cs-cycles.html
>>
>>    * igt@xe_query@multigpu-query-topology:
>>      - shard-lnl:          NOTRUN -> [SKIP][252] ([Intel XE#944]) +1 
>> other test skip
>>     [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-lnl-8/igt@xe_query@multigpu-query-topology.html
>>
>>    * igt@xe_sriov_auto_provisioning@exclusive-ranges:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][253] ([Intel XE#4130])
>>     [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-433/igt@xe_sriov_auto_provisioning@exclusive-ranges.html
>>
>>    * igt@xe_sriov_auto_provisioning@fair-allocation:
>>      - shard-lnl:          NOTRUN -> [SKIP][254] ([Intel XE#4130])
>>     [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-lnl-8/igt@xe_sriov_auto_provisioning@fair-allocation.html
>>
>>    * igt@xe_sriov_flr@flr-vf1-clear:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][255] ([Intel XE#3342])
>>     [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-466/igt@xe_sriov_flr@flr-vf1-clear.html
>>      - shard-bmg:          NOTRUN -> [SKIP][256] ([Intel XE#3342])
>>     [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-bmg-7/igt@xe_sriov_flr@flr-vf1-clear.html
>>
>>    * igt@xe_sriov_scheduling@nonpreempt-engine-resets:
>>      - shard-bmg:          NOTRUN -> [SKIP][257] ([Intel XE#4351])
>>     [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-bmg-4/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html
>>
>> #### Possible fixes ####
>>
>>    * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a- 
>> edp-1-linear:
>>      - shard-lnl:          [FAIL][258] ([Intel XE#911]) -> [PASS][259] 
>> +3 other tests pass
>>     [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a- 
>> edp-1-linear.html
>>     [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe- 
>> a-edp-1-linear.html
>>
>>    * igt@kms_color@deep-color@pipe-a-hdmi-a-6-gamma:
>>      - shard-dg2-set2:     [INCOMPLETE][260] ([Intel XE#4346]) -> 
>> [PASS][261] +1 other test pass
>>     [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> dg2-464/igt@kms_color@deep-color@pipe-a-hdmi-a-6-gamma.html
>>     [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-434/igt@kms_color@deep-color@pipe-a-hdmi-a-6-gamma.html
>>
>>    * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
>>      - shard-bmg:          [SKIP][262] ([Intel XE#2291]) -> [PASS] 
>> [263] +1 other test pass
>>     [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
>>     [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
>>
>>    * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
>>      - shard-dg2-set2:     [SKIP][264] ([Intel XE#309]) -> [PASS][265]
>>     [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
>>     [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-434/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
>>
>>    * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
>>      - shard-dg2-set2:     [SKIP][266] ([Intel XE#310]) -> [PASS][267]
>>     [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> dg2-464/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html
>>     [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-436/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html
>>
>>    * igt@kms_flip@2x-plain-flip-fb-recreate:
>>      - shard-bmg:          [SKIP][268] ([Intel XE#2316]) -> [PASS] 
>> [269] +1 other test pass
>>     [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html
>>     [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate.html
>>
>>    * igt@kms_flip@flip-vs-absolute-wf_vblank:
>>      - shard-bmg:          [INCOMPLETE][270] ([Intel XE#2049]) -> 
>> [PASS][271]
>>     [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> bmg-3/igt@kms_flip@flip-vs-absolute-wf_vblank.html
>>     [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-bmg-4/igt@kms_flip@flip-vs-absolute-wf_vblank.html
>>
>>    * igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2:
>>      - shard-bmg:          [FAIL][272] ([Intel XE#2882]) -> [PASS] 
>> [273] +1 other test pass
>>     [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> bmg-8/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2.html
>>     [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-bmg-7/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2.html
>>
>>    * igt@kms_hdr@invalid-hdr:
>>      - shard-bmg:          [SKIP][274] ([Intel XE#1503]) -> [PASS][275]
>>     [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> bmg-6/igt@kms_hdr@invalid-hdr.html
>>     [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-bmg-3/igt@kms_hdr@invalid-hdr.html
>>
>>    * igt@kms_pm_dc@dc5-dpms:
>>      - shard-lnl:          [FAIL][276] ([Intel XE#718]) -> [PASS][277]
>>     [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> lnl-1/igt@kms_pm_dc@dc5-dpms.html
>>     [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-lnl-6/igt@kms_pm_dc@dc5-dpms.html
>>
>>    * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
>>      - shard-dg2-set2:     [SKIP][278] ([Intel XE#1392]) -> [PASS] 
>> [279] +3 other tests pass
>>     [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html
>>     [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html
>>
>>    * igt@xe_exec_threads@threads-hang-fd-rebind:
>>      - shard-dg2-set2:     [DMESG-WARN][280] ([Intel XE#3876]) -> 
>> [PASS][281]
>>     [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> dg2-463/igt@xe_exec_threads@threads-hang-fd-rebind.html
>>     [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-463/igt@xe_exec_threads@threads-hang-fd-rebind.html
>>
>>    * igt@xe_module_load@load:
>>      - shard-bmg:          ([PASS][282], [PASS][283], [PASS][284], 
>> [PASS][285], [PASS][286], [SKIP][287], [PASS][288], [PASS][289], 
>> [PASS][290], [PASS][291], [PASS][292], [PASS][293], [PASS][294], 
>> [PASS][295], [PASS][296], [PASS][297], [PASS][298], [PASS][299], 
>> [PASS][300], [PASS][301], [PASS][302], [PASS][303]) ([Intel XE#2457]) 
>> -> ([PASS][304], [PASS][305], [PASS][306], [PASS][307], [PASS][308], 
>> [PASS][309], [PASS][310], [PASS][311], [PASS][312], [PASS][313], 
>> [PASS][314], [PASS][315], [PASS][316], [PASS][317], [PASS][318], 
>> [PASS][319], [PASS][320], [PASS][321], [PASS][322], [PASS][323], 
>> [PASS][324])
>>     [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> bmg-7/igt@xe_module_load@load.html
>>     [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> bmg-6/igt@xe_module_load@load.html
>>     [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> bmg-6/igt@xe_module_load@load.html
>>     [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> bmg-2/igt@xe_module_load@load.html
>>     [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> bmg-2/igt@xe_module_load@load.html
>>     [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> bmg-3/igt@xe_module_load@load.html
>>     [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> bmg-2/igt@xe_module_load@load.html
>>     [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> bmg-8/igt@xe_module_load@load.html
>>     [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> bmg-8/igt@xe_module_load@load.html
>>     [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> bmg-8/igt@xe_module_load@load.html
>>     [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> bmg-1/igt@xe_module_load@load.html
>>     [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> bmg-1/igt@xe_module_load@load.html
>>     [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> bmg-4/igt@xe_module_load@load.html
>>     [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> bmg-6/igt@xe_module_load@load.html
>>     [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> bmg-4/igt@xe_module_load@load.html
>>     [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> bmg-4/igt@xe_module_load@load.html
>>     [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> bmg-7/igt@xe_module_load@load.html
>>     [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> bmg-4/igt@xe_module_load@load.html
>>     [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> bmg-3/igt@xe_module_load@load.html
>>     [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> bmg-7/igt@xe_module_load@load.html
>>     [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> bmg-3/igt@xe_module_load@load.html
>>     [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> bmg-3/igt@xe_module_load@load.html
>>     [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-bmg-2/igt@xe_module_load@load.html
>>     [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-bmg-1/igt@xe_module_load@load.html
>>     [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-bmg-1/igt@xe_module_load@load.html
>>     [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-bmg-3/igt@xe_module_load@load.html
>>     [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-bmg-3/igt@xe_module_load@load.html
>>     [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-bmg-3/igt@xe_module_load@load.html
>>     [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-bmg-6/igt@xe_module_load@load.html
>>     [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-bmg-4/igt@xe_module_load@load.html
>>     [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-bmg-8/igt@xe_module_load@load.html
>>     [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-bmg-8/igt@xe_module_load@load.html
>>     [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-bmg-4/igt@xe_module_load@load.html
>>     [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-bmg-1/igt@xe_module_load@load.html
>>     [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-bmg-6/igt@xe_module_load@load.html
>>     [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-bmg-4/igt@xe_module_load@load.html
>>     [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-bmg-2/igt@xe_module_load@load.html
>>     [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-bmg-2/igt@xe_module_load@load.html
>>     [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-bmg-8/igt@xe_module_load@load.html
>>     [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-bmg-7/igt@xe_module_load@load.html
>>     [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-bmg-6/igt@xe_module_load@load.html
>>     [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-bmg-7/igt@xe_module_load@load.html
>>     [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-bmg-7/igt@xe_module_load@load.html
>>
>> #### Warnings ####
>>
>>    * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6:
>>      - shard-dg2-set2:     [SKIP][325] ([Intel XE#455] / [Intel 
>> XE#787]) -> [SKIP][326] ([Intel XE#787])
>>     [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> dg2-464/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-d-hdmi- 
>> a-6.html
>>     [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-435/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-d- 
>> hdmi-a-6.html
>>
>>    * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi- 
>> a-6:
>>      - shard-dg2-set2:     [SKIP][327] ([Intel XE#787]) -> [SKIP][328] 
>> ([Intel XE#455] / [Intel XE#787]) +5 other tests skip
>>     [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> dg2-433/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc@pipe-d- 
>> hdmi-a-6.html
>>     [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs- 
>> cc@pipe-d-hdmi-a-6.html
>>
>>    * igt@kms_cdclk@mode-transition-all-outputs:
>>      - shard-dg2-set2:     [SKIP][329] ([Intel XE#4440]) -> [SKIP] 
>> [330] ([Intel XE#4418])
>>     [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> dg2-464/igt@kms_cdclk@mode-transition-all-outputs.html
>>     [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-466/igt@kms_cdclk@mode-transition-all-outputs.html
>>
>>    * igt@kms_content_protection@atomic-dpms:
>>      - shard-bmg:          [SKIP][331] ([Intel XE#2341]) -> [FAIL] 
>> [332] ([Intel XE#1178])
>>     [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> bmg-6/igt@kms_content_protection@atomic-dpms.html
>>     [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-bmg-1/igt@kms_content_protection@atomic-dpms.html
>>
>>    * igt@kms_content_protection@lic-type-0:
>>      - shard-dg2-set2:     [FAIL][333] ([Intel XE#1178]) -> [SKIP] 
>> [334] ([Intel XE#455])
>>     [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> dg2-435/igt@kms_content_protection@lic-type-0.html
>>     [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-464/igt@kms_content_protection@lic-type-0.html
>>
>>    * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
>>      - shard-bmg:          [SKIP][335] ([Intel XE#2291]) -> [DMESG- 
>> WARN][336] ([Intel XE#877])
>>     [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
>>     [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
>>
>>    * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
>>      - shard-bmg:          [SKIP][337] ([Intel XE#2312]) -> [SKIP] 
>> [338] ([Intel XE#2311]) +7 other tests skip
>>     [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw- 
>> render.html
>>     [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb- 
>> draw-render.html
>>
>>    * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw- 
>> mmap-wc:
>>      - shard-bmg:          [SKIP][339] ([Intel XE#2311]) -> [SKIP] 
>> [340] ([Intel XE#2312]) +6 other tests skip
>>     [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw- 
>> mmap-wc.html
>>     [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb- 
>> draw-mmap-wc.html
>>
>>    * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:
>>      - shard-bmg:          [SKIP][341] ([Intel XE#2312]) -> [SKIP] 
>> [342] ([Intel XE#4141]) +1 other test skip
>>     [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw- 
>> render.html
>>     [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb- 
>> draw-render.html
>>
>>    * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:
>>      - shard-bmg:          [SKIP][343] ([Intel XE#4141]) -> [SKIP] 
>> [344] ([Intel XE#2312]) +2 other tests skip
>>     [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw- 
>> blt.html
>>     [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb- 
>> draw-blt.html
>>
>>    * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw- 
>> mmap-wc:
>>      - shard-dg2-set2:     [SKIP][345] ([Intel XE#656]) -> [SKIP][346] 
>> ([Intel XE#651]) +1 other test skip
>>     [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb- 
>> draw-mmap-wc.html
>>     [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur- 
>> indfb-draw-mmap-wc.html
>>
>>    * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff:
>>      - shard-dg2-set2:     [SKIP][347] ([Intel XE#651]) -> [SKIP][348] 
>> ([Intel XE#656]) +6 other tests skip
>>     [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb- 
>> onoff.html
>>     [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr- 
>> indfb-onoff.html
>>
>>    * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw- 
>> render:
>>      - shard-dg2-set2:     [SKIP][349] ([Intel XE#653]) -> [SKIP][350] 
>> ([Intel XE#656]) +5 other tests skip
>>     [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb- 
>> draw-render.html
>>     [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr- 
>> indfb-draw-render.html
>>
>>    * igt@kms_frontbuffer_tracking@fbcpsr-2p-rte:
>>      - shard-bmg:          [SKIP][351] ([Intel XE#2312]) -> [SKIP] 
>> [352] ([Intel XE#2313]) +6 other tests skip
>>     [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html
>>     [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html
>>
>>    * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
>>      - shard-dg2-set2:     [SKIP][353] ([Intel XE#656]) -> [SKIP][354] 
>> ([Intel XE#653]) +4 other tests skip
>>     [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb- 
>> draw-blt.html
>>     [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri- 
>> indfb-draw-blt.html
>>
>>    * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
>>      - shard-bmg:          [SKIP][355] ([Intel XE#2313]) -> [SKIP] 
>> [356] ([Intel XE#2312]) +6 other tests skip
>>     [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw- 
>> blt.html
>>     [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb- 
>> draw-blt.html
>>
>>    * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
>>      - shard-dg2-set2:     [INCOMPLETE][357] ([Intel XE#2566]) -> 
>> [SKIP][358] ([Intel XE#2763] / [Intel XE#455])
>>     [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity- 
>> scaling.html
>>     [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25- 
>> unity-scaling.html
>>
>>    * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity- 
>> scaling@pipe-c:
>>      - shard-dg2-set2:     [INCOMPLETE][359] ([Intel XE#2566]) -> 
>> [SKIP][360] ([Intel XE#2763])
>>     [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity- 
>> scaling@pipe-c.html
>>     [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25- 
>> unity-scaling@pipe-c.html
>>
>>    * igt@kms_tiled_display@basic-test-pattern:
>>      - shard-dg2-set2:     [SKIP][361] ([Intel XE#362]) -> [FAIL][362] 
>> ([Intel XE#1729])
>>     [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> dg2-464/igt@kms_tiled_display@basic-test-pattern.html
>>     [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-436/igt@kms_tiled_display@basic-test-pattern.html
>>
>>    * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>>      - shard-dg2-set2:     [SKIP][363] ([Intel XE#362]) -> [SKIP][364] 
>> ([Intel XE#1500])
>>     [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8277/shard- 
>> dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>>     [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12810/ 
>> shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with- 
>> chamelium.html
>>
>>    [Intel XE#1062]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/1062
>>    [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/1091
>>    [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/1123
>>    [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/1124
>>    [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/1125
>>    [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/1126
>>    [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/1128
>>    [Intel XE#1131]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/1131
>>    [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/1138
>>    [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/1178
>>    [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/1188
>>    [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/1392
>>    [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/1397
>>    [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/1401
>>    [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/1406
>>    [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/1407
>>    [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/1420
>>    [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/1421
>>    [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/1424
>>    [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/1430
>>    [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/1435
>>    [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/1439
>>    [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/1467
>>    [Intel XE#1468]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/1468
>>    [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/1469
>>    [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/1470
>>    [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/1477
>>    [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/1489
>>    [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/1499
>>    [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/1500
>>    [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/1503
>>    [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/1727
>>    [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/1729
>>    [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/1745
>>    [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/2049
>>    [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/2191
>>    [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/2234
>>    [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/2236
>>    [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/2244
>>    [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/2245
>>    [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/2252
>>    [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/2284
>>    [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/2291
>>    [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/2293
>>    [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/2311
>>    [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/2312
>>    [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/2313
>>    [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/2314
>>    [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/2316
>>    [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/2320
>>    [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/2321
>>    [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/2322
>>    [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/2325
>>    [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/2327
>>    [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/2328
>>    [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/2341
>>    [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/2352
>>    [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/2360
>>    [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/2373
>>    [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/2374
>>    [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/2380
>>    [Intel XE#2385]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/2385
>>    [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/2387
>>    [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/2390
>>    [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/2392
>>    [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/2393
>>    [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/2413
>>    [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/2414
>>    [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/2457
>>    [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/2541
>>    [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/255
>>    [Intel XE#2550]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/2550
>>    [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/2566
>>    [Intel XE#2613]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/2613
>>    [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/2652
>>    [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/2763
>>    [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/2838
>>    [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/2849
>>    [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/2850
>>    [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/288
>>    [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/2882
>>    [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/2887
>>    [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/2893
>>    [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/2894
>>    [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/2905
>>    [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/2907
>>    [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/2927
>>    [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/3009
>>    [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/301
>>    [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/306
>>    [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/308
>>    [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/309
>>    [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/310
>>    [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/3113
>>    [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/3141
>>    [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/316
>>    [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/3226
>>    [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/323
>>    [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/324
>>    [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/3278
>>    [Intel XE#3279]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/3279
>>    [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/3342
>>    [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/3414
>>    [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/3432
>>    [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/346
>>    [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/3544
>>    [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/3573
>>    [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/362
>>    [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/3658
>>    [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/366
>>    [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/367
>>    [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/373
>>    [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/3767
>>    [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/378
>>    [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/3876
>>    [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/3889
>>    [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/3904
>>    [Intel XE#4045]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/4045
>>    [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/4130
>>    [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/4141
>>    [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/4156
>>    [Intel XE#4268]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/4268
>>    [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/4298
>>    [Intel XE#4328]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/4328
>>    [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/4331
>>    [Intel XE#4346]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/4346
>>    [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/4351
>>    [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/4354
>>    [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/4416
>>    [Intel XE#4418]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/4418
>>    [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/4422
>>    [Intel XE#4440]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/4440
>>    [Intel XE#4497]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/4497
>>    [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/4501
>>    [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/455
>>    [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/579
>>    [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/584
>>    [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/586
>>    [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/607
>>    [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/610
>>    [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/616
>>    [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/619
>>    [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/651
>>    [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/653
>>    [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/656
>>    [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/658
>>    [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/688
>>    [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/718
>>    [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/756
>>    [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/787
>>    [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/870
>>    [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/877
>>    [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/886
>>    [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/899
>>    [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/908
>>    [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/911
>>    [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/929
>>    [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/944
>>    [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/ 
>> issues/979
>>
>>
>> Build changes
>> -------------
>>
>>    * IGT: IGT_8277 -> IGTPW_12810
>>    * Linux: xe-2829-2695de3e236e7acf43a2cf431e31635585873fc4 -> 
>> xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396
>>
>>    IGTPW_12810: 12810
>>    IGT_8277: 8277
>>    xe-2829-2695de3e236e7acf43a2cf431e31635585873fc4: 
>> 2695de3e236e7acf43a2cf431e31635585873fc4
>>    xe-2832-b15a87713d14b1c2986f47a622c5a8c5458e2396: 
>> b15a87713d14b1c2986f47a622c5a8c5458e2396
>>
>> == Logs ==
>>
>> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/ 
>> IGTPW_12810/index.html
>>
> 

