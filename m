Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FB09E7717F
	for <igt-dev@archiver.kernel.org>; Tue, 17 Dec 2024 19:12:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDC8F10E649;
	Tue, 17 Dec 2024 19:12:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hZgwXlq7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22C4B10E3E3;
 Tue, 17 Dec 2024 19:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734462765; x=1765998765;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=jjNF7ukIcM2N/+hNKN4ZX9p/DOwgtlpvb3qYrgKtlEg=;
 b=hZgwXlq7g8hpDJGBwyZSjhiL8ea+qgZpDdPwPssHD+mYwoGnipRQ/WVN
 rNdVJbObI39gycf//mhdND4sth4n3D2RhCr9lDDaQIiQlcAK4z93havcC
 csk266wBQNqvIDaIBQi8ylM5HKAq8dOd/4llwQ/1orF+7A7eelSsaoLc3
 wD57Mef2e/8zvhRzuLOs5q9HDog/bpCWrM4VXXQm8IajAEpl8gAb4T0jq
 acWSJocHMHPtsWnNNz3PRyUZ90TJHhtIJwwxWATfnw92Lw6HODqE8Zfaq
 CCGDjdZ8zeMKBCcfFpCR2uFyWwgIzyX/OWBQy9J2ZEs6BpsLeo96oZgbQ w==;
X-CSE-ConnectionGUID: d91XSGhESCiJMQhtPa1exg==
X-CSE-MsgGUID: gn23I21mSGWWTjHRVXFQFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="34785821"
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; d="scan'208";a="34785821"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 11:12:44 -0800
X-CSE-ConnectionGUID: NVio6nV0Sv2ZNIWBDXfvog==
X-CSE-MsgGUID: v/IGhY9VRmGuAqtfEkDZfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="97476099"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 11:12:42 -0800
Date: Tue, 17 Dec 2024 20:12:40 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for
 tests/intel/gem_pxp: Fix requirements
Message-ID: <20241217191240.ywa7s5of24f4lokr@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20241216153129.50964-1-kamil.konieczny@linux.intel.com>
 <173441308136.3620127.2385301579326887506@b555e5b46a47>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <173441308136.3620127.2385301579326887506@b555e5b46a47>
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
On 2024-12-17 at 05:24:41 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/gem_pxp: Fix requirements
> URL   : https://patchwork.freedesktop.org/series/142659/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8157_full -> XEIGTPW_12326_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_12326_full absolutely need to be
>   verified manually.

This is unrelated to changes in i915 test.

Regards,
Kamil

>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_12326_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_12326_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][1] +1 other test incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-dg2-434/igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_cursor_crc@cursor-suspend:
>     - shard-bmg:          [PASS][2] -> [INCOMPLETE][3] +7 other tests incomplete
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8157/shard-bmg-6/igt@kms_cursor_crc@cursor-suspend.html
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-bmg-4/igt@kms_cursor_crc@cursor-suspend.html
> 
>   * igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [INCOMPLETE][4]
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-bmg-4/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-2.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-dp2-hdmi-a3:
>     - shard-bmg:          NOTRUN -> [FAIL][5] +2 other tests fail
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-bmg-4/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-dp2-hdmi-a3.html
> 
>   * igt@kms_plane_cursor@overlay:
>     - shard-dg2-set2:     [PASS][6] -> [INCOMPLETE][7] +2 other tests incomplete
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8157/shard-dg2-463/igt@kms_plane_cursor@overlay.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-dg2-433/igt@kms_plane_cursor@overlay.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_12326_full that come from known issues:
> 

...cut...

> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@intel_hwmon@hwmon-write:
>     - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#1125])
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-lnl-6/igt@intel_hwmon@hwmon-write.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#2550]) +23 other tests skip
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-dg2-436/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html
> 
>   * igt@kms_async_flips@crc@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [INCOMPLETE][10] ([Intel XE#3781]) +2 other tests incomplete
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-bmg-5/igt@kms_async_flips@crc@pipe-a-dp-2.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#3658])
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
>     - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2327])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-bmg-7/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
>     - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#1407])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-lnl-6/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#316]) +2 other tests skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-dg2-435/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-overflow:
>     - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#610])
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-bmg-7/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#1124]) +13 other tests skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-dg2-463/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#610])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>     - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#1124]) +2 other tests skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
>     - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#1124]) +8 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-bmg-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#2191]) +1 other test skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
>     - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#367]) +1 other test skip
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#367]) +5 other tests skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-dg2-435/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
> 
>   * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
>     - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2887]) +10 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-bmg-7/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#787]) +132 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#3442])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
>     - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#3432])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#455] / [Intel XE#787]) +37 other tests skip
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][28] ([Intel XE#1727])
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][29] ([Intel XE#1727] / [Intel XE#3113])
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
>     - shard-dg2-set2:     [PASS][30] -> [INCOMPLETE][31] ([Intel XE#1727])
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8157/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][32] -> [DMESG-WARN][33] ([Intel XE#1727] / [Intel XE#3113])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8157/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#2887]) +2 other tests skip
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-lnl-8/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html
> 
>   * igt@kms_chamelium_color@ctm-green-to-red:
>     - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#2325]) +1 other test skip
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-bmg-7/igt@kms_chamelium_color@ctm-green-to-red.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#306]) +1 other test skip
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-dg2-434/igt@kms_chamelium_color@ctm-green-to-red.html
> 
>   * igt@kms_chamelium_color@ctm-limited-range:
>     - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#306])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-lnl-2/igt@kms_chamelium_color@ctm-limited-range.html
> 
>   * igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:
>     - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2252]) +5 other tests skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-bmg-5/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html
> 
>   * igt@kms_chamelium_frames@hdmi-cmp-planar-formats:
>     - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#373])
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-lnl-7/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#373]) +10 other tests skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
> 
>   * igt@kms_content_protection@dp-mst-type-0:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#307]) +1 other test skip
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-dg2-464/igt@kms_content_protection@dp-mst-type-0.html
> 
>   * igt@kms_content_protection@legacy:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][42] ([Intel XE#1178]) +1 other test fail
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-dg2-464/igt@kms_content_protection@legacy.html
> 
>   * igt@kms_content_protection@lic-type-0:
>     - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#3278])
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-lnl-1/igt@kms_content_protection@lic-type-0.html
> 
>   * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [FAIL][44] ([Intel XE#1178]) +1 other test fail
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-bmg-3/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x512:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#308]) +2 other tests skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-dg2-433/igt@kms_cursor_crc@cursor-offscreen-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x170:
>     - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2321]) +3 other tests skip
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-bmg-5/igt@kms_cursor_crc@cursor-random-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-random-max-size:
>     - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#1424])
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-lnl-4/igt@kms_cursor_crc@cursor-random-max-size.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
>     - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#2321])
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-lnl-8/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
>     - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2320]) +1 other test skip
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-bmg-6/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
> 
>   * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
>     - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2291])
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
>     - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#309])
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-lnl-3/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
>     - shard-bmg:          [PASS][52] -> [SKIP][53] ([Intel XE#2291]) +1 other test skip
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8157/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#323])
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-dg2-463/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
> 
>   * igt@kms_display_modes@mst-extended-mode-negative:
>     - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2323])
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-bmg-5/igt@kms_display_modes@mst-extended-mode-negative.html
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#776])
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-dg2-433/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   * igt@kms_feature_discovery@display-3x:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#703])
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-dg2-434/igt@kms_feature_discovery@display-3x.html
> 
>   * igt@kms_feature_discovery@display-4x:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#1138])
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-dg2-463/igt@kms_feature_discovery@display-4x.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
>     - shard-bmg:          NOTRUN -> [FAIL][59] ([Intel XE#2882]) +2 other tests fail
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:
>     - shard-bmg:          NOTRUN -> [FAIL][60] ([Intel XE#3321]) +1 other test fail
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend-interruptible:
>     - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#1421]) +3 other tests skip
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-lnl-2/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip@2x-plain-flip:
>     - shard-bmg:          [PASS][62] -> [SKIP][63] ([Intel XE#2316]) +2 other tests skip
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8157/shard-bmg-2/igt@kms_flip@2x-plain-flip.html
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-bmg-6/igt@kms_flip@2x-plain-flip.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][64] ([Intel XE#301]) +6 other tests fail
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@a-dp4:
>     - shard-dg2-set2:     [PASS][65] -> [FAIL][66] ([Intel XE#3321])
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8157/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6:
>     - shard-dg2-set2:     [PASS][67] -> [FAIL][68] ([Intel XE#301]) +1 other test fail
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8157/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6.html
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6.html
> 
>   * igt@kms_flip@flip-vs-suspend:
>     - shard-bmg:          [PASS][69] -> [INCOMPLETE][70] ([Intel XE#2597]) +3 other tests incomplete
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8157/shard-bmg-5/igt@kms_flip@flip-vs-suspend.html
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-bmg-6/igt@kms_flip@flip-vs-suspend.html
> 
>   * igt@kms_flip@plain-flip-fb-recreate-interruptible@b-edp1:
>     - shard-lnl:          [PASS][71] -> [FAIL][72] ([Intel XE#886]) +2 other tests fail
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8157/shard-lnl-8/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-edp1.html
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-lnl-2/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-edp1.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
>     - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#2293]) +3 other tests skip
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2293] / [Intel XE#2380]) +3 other tests skip
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#1397] / [Intel XE#1745])
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#1397])
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#2311]) +19 other tests skip
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#651]) +36 other tests skip
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
>     - shard-bmg:          NOTRUN -> [FAIL][79] ([Intel XE#2333]) +9 other tests fail
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen:
>     - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#651]) +1 other test skip
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen:
>     - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2312])
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#658])
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:
>     - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#656]) +7 other tests skip
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#2313]) +21 other tests skip
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#653]) +42 other tests skip
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
> 
>   * igt@kms_getfb@getfb-reject-ccs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#605])
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-dg2-433/igt@kms_getfb@getfb-reject-ccs.html
> 
>   * igt@kms_getfb@getfb2-accept-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#2340])
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-bmg-5/igt@kms_getfb@getfb2-accept-ccs.html
> 
>   * igt@kms_joiner@basic-big-joiner:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#346])
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-dg2-434/igt@kms_joiner@basic-big-joiner.html
> 
>   * igt@kms_joiner@basic-ultra-joiner:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#2927])
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-dg2-434/igt@kms_joiner@basic-ultra-joiner.html
> 
>   * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
>     - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#2934])
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-bmg-5/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
> 
>   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#356])
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-dg2-433/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>   * igt@kms_panel_fitting@legacy:
>     - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#2486])
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-bmg-5/igt@kms_panel_fitting@legacy.html
> 
>   * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
>     - shard-dg2-set2:     [PASS][93] -> [FAIL][94] ([Intel XE#616])
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8157/shard-dg2-463/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-dg2-433/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][95] -> [FAIL][96] ([Intel XE#361])
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8157/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#2763]) +17 other tests skip
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c:
>     - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#2763]) +3 other tests skip
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-lnl-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#2763] / [Intel XE#455]) +11 other tests skip
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
>     - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#2763]) +14 other tests skip
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html
> 
>   * igt@kms_pm_backlight@fade-with-dpms:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][101] ([Intel XE#870])
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-dg2-436/igt@kms_pm_backlight@fade-with-dpms.html
> 
>   * igt@kms_pm_dc@dc5-psr:
>     - shard-lnl:          [PASS][102] -> [FAIL][103] ([Intel XE#718])
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8157/shard-lnl-1/igt@kms_pm_dc@dc5-psr.html
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-lnl-6/igt@kms_pm_dc@dc5-psr.html
> 
>   * igt@kms_pm_dc@dc5-retention-flops:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][104] ([Intel XE#3309])
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-dg2-433/igt@kms_pm_dc@dc5-retention-flops.html
> 
>   * igt@kms_pm_rpm@modeset-lpsp:
>     - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp.html
> 
>   * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#1489]) +11 other tests skip
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-dg2-436/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
>     - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#1489]) +2 other tests skip
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-bmg-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_su@page_flip-nv12:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][108] ([Intel XE#1122]) +2 other tests skip
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-dg2-433/igt@kms_psr2_su@page_flip-nv12.html
> 
>   * igt@kms_psr2_su@page_flip-p010:
>     - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#2387]) +1 other test skip
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-bmg-6/igt@kms_psr2_su@page_flip-p010.html
>     - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#1128])
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-lnl-8/igt@kms_psr2_su@page_flip-p010.html
> 
>   * igt@kms_psr@pr-sprite-plane-move:
>     - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#1406])
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-lnl-2/igt@kms_psr@pr-sprite-plane-move.html
> 
>   * igt@kms_psr@psr-dpms:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][112] ([Intel XE#2850] / [Intel XE#929]) +20 other tests skip
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-dg2-435/igt@kms_psr@psr-dpms.html
> 
>   * igt@kms_psr@psr-primary-page-flip:
>     - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#2234] / [Intel XE#2850]) +7 other tests skip
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-bmg-3/igt@kms_psr@psr-primary-page-flip.html
> 
>   * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>     - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#2414])
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-bmg-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][115] ([Intel XE#2939])
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-dg2-464/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> 
>   * igt@kms_rotation_crc@primary-rotation-270:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([Intel XE#3414]) +1 other test skip
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-dg2-464/igt@kms_rotation_crc@primary-rotation-270.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
>     - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#2330])
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>     - shard-lnl:          NOTRUN -> [SKIP][118] ([Intel XE#1127])
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-lnl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
>     - shard-bmg:          NOTRUN -> [SKIP][119] ([Intel XE#3414])
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-bmg-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
> 
>   * igt@kms_scaling_modes@scaling-mode-full-aspect:
>     - shard-bmg:          NOTRUN -> [SKIP][120] ([Intel XE#2413])
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-bmg-8/igt@kms_scaling_modes@scaling-mode-full-aspect.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak:
>     - shard-dg2-set2:     [PASS][121] -> [FAIL][122] ([Intel XE#771] / [Intel XE#899])
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8157/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak.html
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:
>     - shard-dg2-set2:     [PASS][123] -> [FAIL][124] ([Intel XE#899])
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8157/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html
> 
>   * igt@kms_vrr@cmrr:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#2168])
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-dg2-463/igt@kms_vrr@cmrr.html
> 
>   * igt@kms_vrr@flipline:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][126] ([Intel XE#455]) +23 other tests skip
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-dg2-464/igt@kms_vrr@flipline.html
> 
>   * igt@kms_vrr@seamless-rr-switch-drrs:
>     - shard-bmg:          NOTRUN -> [SKIP][127] ([Intel XE#1499])
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-bmg-7/igt@kms_vrr@seamless-rr-switch-drrs.html
> 
>   * igt@kms_writeback@writeback-fb-id-xrgb2101010:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][128] ([Intel XE#756]) +1 other test skip
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-dg2-434/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0xfffe:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][129] ([Intel XE#1123])
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0x3fff:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][130] ([Intel XE#1126]) +1 other test skip
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0x3fff.html
> 
>   * igt@xe_eudebug@basic-connect:
>     - shard-lnl:          NOTRUN -> [SKIP][131] ([Intel XE#2905]) +3 other tests skip
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-lnl-7/igt@xe_eudebug@basic-connect.html
> 
>   * igt@xe_eudebug@basic-read-event:
>     - shard-bmg:          NOTRUN -> [SKIP][132] ([Intel XE#2905]) +9 other tests skip
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-bmg-3/igt@xe_eudebug@basic-read-event.html
> 
>   * igt@xe_eudebug_online@interrupt-all-set-breakpoint:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][133] ([Intel XE#2905]) +10 other tests skip
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-dg2-434/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-small:
>     - shard-dg2-set2:     [PASS][134] -> [TIMEOUT][135] ([Intel XE#1473] / [Intel XE#402])
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8157/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-small.html
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-dg2-433/igt@xe_evict@evict-beng-mixed-many-threads-small.html
> 
>   * igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd:
>     - shard-lnl:          NOTRUN -> [SKIP][136] ([Intel XE#688]) +2 other tests skip
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-lnl-1/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:
>     - shard-bmg:          NOTRUN -> [SKIP][137] ([Intel XE#2322]) +4 other tests skip
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html
> 
>   * igt@xe_exec_basic@multigpu-once-userptr-invalidate:
>     - shard-lnl:          NOTRUN -> [SKIP][138] ([Intel XE#1392]) +1 other test skip
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-lnl-5/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html
> 
>   * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][139] ([Intel XE#288]) +31 other tests skip
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-dg2-433/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
> 
>   * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][140] ([Intel XE#2360]) +1 other test skip
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-dg2-463/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html
> 
>   * igt@xe_live_ktest@xe_migrate:
>     - shard-lnl:          [PASS][141] -> [SKIP][142] ([Intel XE#1192]) +3 other tests skip
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8157/shard-lnl-5/igt@xe_live_ktest@xe_migrate.html
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-lnl-4/igt@xe_live_ktest@xe_migrate.html
>     - shard-bmg:          [PASS][143] -> [SKIP][144] ([Intel XE#1192])
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8157/shard-bmg-2/igt@xe_live_ktest@xe_migrate.html
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-bmg-5/igt@xe_live_ktest@xe_migrate.html
> 
>   * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][145] ([Intel XE#1999]) +2 other tests fail
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-dg2-434/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
> 
>   * igt@xe_oa@closed-fd-and-unmapped-access:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][146] ([Intel XE#2541] / [Intel XE#3573]) +9 other tests skip
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-dg2-436/igt@xe_oa@closed-fd-and-unmapped-access.html
> 
>   * igt@xe_pm@s2idle-d3cold-basic-exec:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][147] ([Intel XE#2284] / [Intel XE#366])
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-dg2-463/igt@xe_pm@s2idle-d3cold-basic-exec.html
> 
>   * igt@xe_pm@s4-d3cold-basic-exec:
>     - shard-lnl:          NOTRUN -> [SKIP][148] ([Intel XE#2284] / [Intel XE#366])
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-lnl-3/igt@xe_pm@s4-d3cold-basic-exec.html
>     - shard-bmg:          NOTRUN -> [SKIP][149] ([Intel XE#2284])
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-bmg-4/igt@xe_pm@s4-d3cold-basic-exec.html
> 
>   * igt@xe_pm_residency@toggle-gt-c6:
>     - shard-lnl:          [PASS][150] -> [FAIL][151] ([Intel XE#958])
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8157/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-lnl-2/igt@xe_pm_residency@toggle-gt-c6.html
> 
>   * igt@xe_query@multigpu-query-engines:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][152] ([Intel XE#944]) +2 other tests skip
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-dg2-464/igt@xe_query@multigpu-query-engines.html
> 
>   * igt@xe_wedged@wedged-at-any-timeout:
>     - shard-dg2-set2:     NOTRUN -> [ABORT][153] ([Intel XE#3421])
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-dg2-435/igt@xe_wedged@wedged-at-any-timeout.html
> 
>   * igt@xe_wedged@wedged-mode-toggle:
>     - shard-dg2-set2:     NOTRUN -> [ABORT][154] ([Intel XE#3075] / [Intel XE#3084])
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-dg2-436/igt@xe_wedged@wedged-mode-toggle.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
>     - shard-bmg:          [SKIP][155] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][156] +1 other test pass
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8157/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-64x64:
>     - shard-dg2-set2:     [INCOMPLETE][157] -> [PASS][158] +1 other test pass
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8157/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-64x64.html
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-64x64.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
>     - shard-bmg:          [SKIP][159] ([Intel XE#2291]) -> [PASS][160] +3 other tests pass
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8157/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
> 
>   * igt@kms_feature_discovery@display-2x:
>     - shard-bmg:          [SKIP][161] ([Intel XE#2373]) -> [PASS][162]
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8157/shard-bmg-6/igt@kms_feature_discovery@display-2x.html
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-bmg-8/igt@kms_feature_discovery@display-2x.html
> 
>   * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
>     - shard-bmg:          [SKIP][163] ([Intel XE#2316]) -> [PASS][164] +6 other tests pass
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8157/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:
>     - shard-dg2-set2:     [FAIL][165] ([Intel XE#3321]) -> [PASS][166]
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8157/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4:
>     - shard-dg2-set2:     [FAIL][167] ([Intel XE#301]) -> [PASS][168]
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8157/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html
> 
>   * igt@kms_flip@2x-plain-flip-fb-recreate:
>     - shard-bmg:          [FAIL][169] ([Intel XE#2882]) -> [PASS][170] +3 other tests pass
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8157/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate.html
>     - shard-dg2-set2:     [FAIL][171] ([Intel XE#886]) -> [PASS][172] +1 other test pass
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8157/shard-dg2-463/igt@kms_flip@2x-plain-flip-fb-recreate.html
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-dg2-435/igt@kms_flip@2x-plain-flip-fb-recreate.html
> 
>   * igt@kms_flip@2x-plain-flip-fb-recreate@bc-hdmi-a6-dp4:
>     - shard-dg2-set2:     [FAIL][173] -> [PASS][174] +2 other tests pass
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8157/shard-dg2-463/igt@kms_flip@2x-plain-flip-fb-recreate@bc-hdmi-a6-dp4.html
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-dg2-435/igt@kms_flip@2x-plain-flip-fb-recreate@bc-hdmi-a6-dp4.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3:
>     - shard-bmg:          [FAIL][175] ([Intel XE#3321]) -> [PASS][176]
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8157/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html
> 
>   * igt@kms_flip@flip-vs-suspend:
>     - shard-dg2-set2:     [INCOMPLETE][177] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][178]
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8157/shard-dg2-434/igt@kms_flip@flip-vs-suspend.html
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-dg2-464/igt@kms_flip@flip-vs-suspend.html
> 
>   * igt@kms_flip@flip-vs-suspend@d-dp4:
>     - shard-dg2-set2:     [INCOMPLETE][179] ([Intel XE#2049]) -> [PASS][180]
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8157/shard-dg2-434/igt@kms_flip@flip-vs-suspend@d-dp4.html
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-dg2-464/igt@kms_flip@flip-vs-suspend@d-dp4.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-bmg:          [SKIP][181] ([Intel XE#1503]) -> [PASS][182]
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8157/shard-bmg-6/igt@kms_hdr@invalid-hdr.html
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-bmg-4/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_joiner@basic-force-big-joiner:
>     - shard-bmg:          [SKIP][183] ([Intel XE#3012]) -> [PASS][184]
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8157/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-bmg-5/igt@kms_joiner@basic-force-big-joiner.html
> 
>   * igt@kms_plane_cursor@viewport:
>     - shard-dg2-set2:     [FAIL][185] ([Intel XE#616]) -> [PASS][186] +1 other test pass
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8157/shard-dg2-435/igt@kms_plane_cursor@viewport.html
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-dg2-436/igt@kms_plane_cursor@viewport.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
>     - shard-dg2-set2:     [FAIL][187] ([Intel XE#361]) -> [PASS][188]
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8157/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
> 
>   * igt@kms_setmode@basic@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [FAIL][189] ([Intel XE#2883]) -> [PASS][190] +6 other tests pass
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8157/shard-dg2-463/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-dg2-434/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_setmode@basic@pipe-b-edp-1:
>     - shard-lnl:          [FAIL][191] ([Intel XE#2883]) -> [PASS][192] +1 other test pass
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8157/shard-lnl-1/igt@kms_setmode@basic@pipe-b-edp-1.html
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-lnl-6/igt@kms_setmode@basic@pipe-b-edp-1.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
>     - shard-lnl:          [FAIL][193] ([Intel XE#899]) -> [PASS][194]
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8157/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-small:
>     - shard-bmg:          [TIMEOUT][195] ([Intel XE#1473]) -> [PASS][196]
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8157/shard-bmg-7/igt@xe_evict@evict-beng-mixed-many-threads-small.html
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-bmg-8/igt@xe_evict@evict-beng-mixed-many-threads-small.html
> 
>   * igt@xe_exec_basic@many-basic:
>     - shard-bmg:          [INCOMPLETE][197] -> [PASS][198]
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8157/shard-bmg-4/igt@xe_exec_basic@many-basic.html
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-bmg-4/igt@xe_exec_basic@many-basic.html
> 
>   * igt@xe_pm@s4-vm-bind-unbind-all:
>     - shard-lnl:          [ABORT][199] ([Intel XE#1794]) -> [PASS][200]
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8157/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-lnl-5/igt@xe_pm@s4-vm-bind-unbind-all.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_flip@bo-too-big-interruptible@a-edp1:
>     - shard-lnl:          [TIMEOUT][201] ([Intel XE#1504]) -> [INCOMPLETE][202] ([Intel XE#1504]) +1 other test incomplete
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8157/shard-lnl-6/igt@kms_flip@bo-too-big-interruptible@a-edp1.html
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-lnl-7/igt@kms_flip@bo-too-big-interruptible@a-edp1.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
>     - shard-bmg:          [SKIP][203] ([Intel XE#2312]) -> [SKIP][204] ([Intel XE#2311]) +12 other tests skip
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8157/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][205] ([Intel XE#2312]) -> [FAIL][206] ([Intel XE#2333]) +7 other tests fail
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8157/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][207] ([Intel XE#2311]) -> [SKIP][208] ([Intel XE#2312]) +4 other tests skip
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8157/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
>     - shard-bmg:          [SKIP][209] ([Intel XE#2312]) -> [SKIP][210] ([Intel XE#2313]) +13 other tests skip
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8157/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt:
>     - shard-bmg:          [SKIP][211] ([Intel XE#2313]) -> [SKIP][212] ([Intel XE#2312]) +4 other tests skip
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8157/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-large:
>     - shard-bmg:          [TIMEOUT][213] ([Intel XE#1473]) -> [INCOMPLETE][214] ([Intel XE#1473])
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8157/shard-bmg-8/igt@xe_evict@evict-mixed-many-threads-large.html
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-large.html
> 
>   * igt@xe_evict@evict-mixed-threads-large:
>     - shard-bmg:          [FAIL][215] ([Intel XE#1000]) -> [INCOMPLETE][216] ([Intel XE#1473])
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8157/shard-bmg-5/igt@xe_evict@evict-mixed-threads-large.html
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-bmg-4/igt@xe_evict@evict-mixed-threads-large.html
> 
>   * igt@xe_evict@evict-threads-large:
>     - shard-bmg:          [TIMEOUT][217] ([Intel XE#1473] / [Intel XE#2472]) -> [FAIL][218] ([Intel XE#1000])
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8157/shard-bmg-5/igt@xe_evict@evict-threads-large.html
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-bmg-8/igt@xe_evict@evict-threads-large.html
> 
>   * igt@xe_live_ktest@xe_eudebug:
>     - shard-lnl:          [SKIP][219] ([Intel XE#2833]) -> [SKIP][220] ([Intel XE#1192] / [Intel XE#3026])
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8157/shard-lnl-8/igt@xe_live_ktest@xe_eudebug.html
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-lnl-4/igt@xe_live_ktest@xe_eudebug.html
> 
>   * igt@xe_wedged@wedged-at-any-timeout:
>     - shard-bmg:          [SKIP][221] ([Intel XE#1130]) -> [ABORT][222] ([Intel XE#3421])
>    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8157/shard-bmg-5/igt@xe_wedged@wedged-at-any-timeout.html
>    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/shard-bmg-5/igt@xe_wedged@wedged-at-any-timeout.html
> 
>   
>   [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
>   [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>   [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
>   [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
>   [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
>   [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>   [Intel XE#1504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504
>   [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>   [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
>   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>   [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
>   [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
>   [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
>   [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2323
>   [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
>   [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
>   [Intel XE#2340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340
>   [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
>   [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
>   [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
>   [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
>   [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
>   [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
>   [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
>   [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
>   [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
>   [Intel XE#2550]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550
>   [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
>   [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>   [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
>   [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
>   [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
>   [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
>   [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
>   [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
>   [Intel XE#3026]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3026
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#3075]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3075
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#3084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
>   [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
>   [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
>   [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
>   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>   [Intel XE#3421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3421
>   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>   [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
>   [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
>   [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
>   [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
>   [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
>   [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#3781]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3781
>   [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
>   [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
>   [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
>   [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
>   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>   [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
>   [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8157 -> IGTPW_12326
>   * Linux: xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3 -> xe-2386-49cc582754c205bbe43d4ef2b1fd3894bee1f3bd
> 
>   IGTPW_12326: 2db9f685a997db9f93d6e0c034b3a2b48cd3ef92 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8157: 48a70f6795e6d68b9fae275261ae3b09d3401fe1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3: 63be16e210b1c3e43b43d8ca9b7e17f15142d2c3
>   xe-2386-49cc582754c205bbe43d4ef2b1fd3894bee1f3bd: 49cc582754c205bbe43d4ef2b1fd3894bee1f3bd
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12326/index.html
