Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3586E7717F
	for <igt-dev@archiver.kernel.org>; Tue, 10 Dec 2024 06:01:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BBF410E0F8;
	Tue, 10 Dec 2024 06:01:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cggowsFY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7CD810E021
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Dec 2024 06:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733810505; x=1765346505;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=I5H6fAFhvwu6d8KaFP9NO8wVcWQlJRWUHCeu8uX/bI8=;
 b=cggowsFYqtPG93UIZ8V9L4JZHdvfaDrJ4RTYnMFrWmxAeoI4+XkRcZ3E
 ly7PUm6598pONO5agHD82FUN+FwD1TJkA9TvuhK59SbBC1g8T0rZkRYlM
 vZBuK5pF/8qZPEXk+s/jl7nZlkAEQiMUSLuusi7ayAbGicCxxpn4959/g
 6TRuA+fExRsPU/yPdpcGOXze0xIEBAb1BhR3GXcamsljkxvHNvQh0V/mj
 vPKbBnJknwNzesKpA91RXwHUARfH8E9OHb8VpzQ26c8Pd1Qy+uxgPvPSQ
 ArOjgLLUF5b6/rrTjJZM98LO2Vf3QcMgBeJPX7X55OqZu6lXBKs6TXqqp g==;
X-CSE-ConnectionGUID: 6JajUROXR72YuUJcoxRR5g==
X-CSE-MsgGUID: Kfi/vUEmSp+MLLXxLGjatA==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="33474582"
X-IronPort-AV: E=Sophos;i="6.12,221,1728975600"; d="scan'208";a="33474582"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 22:01:44 -0800
X-CSE-ConnectionGUID: mSByz/iuQTePd84SfALMyw==
X-CSE-MsgGUID: X1vsDYueSBSy9+vYw6Ts8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,221,1728975600"; d="scan'208";a="95122725"
Received: from amiszcza-mobl.ger.corp.intel.com (HELO [10.245.81.229])
 ([10.245.81.229])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 22:01:42 -0800
Message-ID: <974bbdae-3a0a-437a-8acb-4cb10e2bd4ae@linux.intel.com>
Date: Tue, 10 Dec 2024 07:01:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciB2bXRiOiBJbnRy?=
 =?UTF-8?Q?oduce_SR-IOV_VM-level_testing_tool_=28rev4=29?=
To: igt-dev@lists.freedesktop.org
References: <20241209142423.2718734-1-adam.miszczak@linux.intel.com>
 <173378714830.639395.13219258778228328830@b555e5b46a47>
Content-Language: en-US
From: Adam Miszczak <adam.miszczak@linux.intel.com>
In-Reply-To: <173378714830.639395.13219258778228328830@b555e5b46a47>
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

Unrelated issues: series introduces a new tool independent from the 
existing igt tests.
- Adam Miszczak

On 10.12.2024 00:32, Patchwork wrote:
> == Series Details ==
>
> Series: vmtb: Introduce SR-IOV VM-level testing tool (rev4)
> URL   : https://patchwork.freedesktop.org/series/141049/
> State : failure
>
> == Summary ==
>
> CI Bug Log - changes from XEIGT_8145_full -> XEIGTPW_12279_full
> ====================================================
>
> Summary
> -------
>
>    **FAILURE**
>
>    Serious unknown changes coming with XEIGTPW_12279_full absolutely need to be
>    verified manually.
>    
>    If you think the reported changes have nothing to do with the changes
>    introduced in XEIGTPW_12279_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>    Here are the unknown changes that may have been introduced in XEIGTPW_12279_full:
>
> ### IGT changes ###
>
> #### Possible regressions ####
>
>    * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a3:
>      - shard-bmg:          [PASS][1] -> [FAIL][2]
>     [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a3.html
>     [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a3.html
>
>    * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
>      - shard-bmg:          [PASS][3] -> [DMESG-WARN][4] +2 other tests dmesg-warn
>     [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-7/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
>     [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-5/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
>
>    * igt@kms_universal_plane@universal-plane-sanity@pipe-a-hdmi-a-3:
>      - shard-bmg:          NOTRUN -> [DMESG-WARN][5] +2 other tests dmesg-warn
>     [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-5/igt@kms_universal_plane@universal-plane-sanity@pipe-a-hdmi-a-3.html
>
>    * igt@kms_vblank@query-busy:
>      - shard-bmg:          NOTRUN -> [INCOMPLETE][6] +2 other tests incomplete
>     [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-8/igt@kms_vblank@query-busy.html
>
>    * igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-vram01:
>      - shard-bmg:          [PASS][7] -> [INCOMPLETE][8]
>     [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-8/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-vram01.html
>     [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-1/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-vram01.html
>
>    
> Known issues
> ------------
>
>    Here are the changes found in XEIGTPW_12279_full that come from known issues:
>
> ### IGT changes ###
>
> #### Issues hit ####
>
>    * igt@intel_hwmon@hwmon-read:
>      - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#1125])
>     [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-4/igt@intel_hwmon@hwmon-read.html
>
>    * igt@kms_3d:
>      - shard-bmg:          NOTRUN -> [DMESG-WARN][10] ([Intel XE#1727] / [Intel XE#3468])
>     [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-6/igt@kms_3d.html
>
>    * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>      - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#1466])
>     [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
>      - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2233])
>     [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-5/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
>
>    * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
>      - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2370])
>     [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
>
>    * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
>      - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#1407]) +6 other tests skip
>     [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-8/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
>
>    * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>      - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#3658])
>     [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
>
>    * igt@kms_big_fb@linear-8bpp-rotate-90:
>      - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2327]) +2 other tests skip
>     [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-8/igt@kms_big_fb@linear-8bpp-rotate-90.html
>
>    * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180:
>      - shard-bmg:          [PASS][17] -> [DMESG-FAIL][18] ([Intel XE#3468]) +6 other tests dmesg-fail
>     [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180.html
>     [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180.html
>
>    * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
>      - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#1124]) +9 other tests skip
>     [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-5/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html
>
>    * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
>      - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#607])
>     [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-3/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
>      - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#1477])
>     [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-8/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
>
>    * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>      - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#1124]) +8 other tests skip
>     [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
>
>    * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
>      - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#2191]) +1 other test skip
>     [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-8/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
>
>    * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
>      - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2314] / [Intel XE#2894])
>     [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
>
>    * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
>      - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#367]) +2 other tests skip
>     [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-6/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html
>
>    * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
>      - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#367]) +1 other test skip
>     [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-7/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
>
>    * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-edp-1:
>      - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#2669]) +3 other tests skip
>     [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-1/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-edp-1.html
>
>    * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
>      - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#3432]) +3 other tests skip
>     [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
>
>    * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
>      - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#3432]) +1 other test skip
>     [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html
>
>    * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
>      - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2652] / [Intel XE#787]) +8 other tests skip
>     [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html
>
>    * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:
>      - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#2887]) +18 other tests skip
>     [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html
>
>    * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:
>      - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2887]) +10 other tests skip
>     [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html
>
>    * igt@kms_chamelium_color@ctm-limited-range:
>      - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#306]) +1 other test skip
>     [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-2/igt@kms_chamelium_color@ctm-limited-range.html
>
>    * igt@kms_chamelium_color@gamma:
>      - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2325])
>     [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-7/igt@kms_chamelium_color@gamma.html
>
>    * igt@kms_chamelium_frames@hdmi-crc-single:
>      - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#373]) +11 other tests skip
>     [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-1/igt@kms_chamelium_frames@hdmi-crc-single.html
>
>    * igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:
>      - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2252]) +6 other tests skip
>     [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-6/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html
>
>    * igt@kms_color@ctm-red-to-blue:
>      - shard-bmg:          [PASS][37] -> [DMESG-WARN][38] ([Intel XE#877]) +1 other test dmesg-warn
>     [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-4/igt@kms_color@ctm-red-to-blue.html
>     [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-8/igt@kms_color@ctm-red-to-blue.html
>
>    * igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-3:
>      - shard-bmg:          NOTRUN -> [DMESG-WARN][39] ([Intel XE#877])
>     [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-8/igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-3.html
>
>    * igt@kms_content_protection@atomic:
>      - shard-bmg:          NOTRUN -> [FAIL][40] ([Intel XE#1178]) +3 other tests fail
>     [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-4/igt@kms_content_protection@atomic.html
>
>    * igt@kms_content_protection@legacy:
>      - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#3278])
>     [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-5/igt@kms_content_protection@legacy.html
>
>    * igt@kms_content_protection@mei-interface:
>      - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#1468])
>     [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-7/igt@kms_content_protection@mei-interface.html
>
>    * igt@kms_cursor_crc@cursor-offscreen-128x42:
>      - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2320]) +6 other tests skip
>     [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-128x42.html
>
>    * igt@kms_cursor_crc@cursor-onscreen-512x512:
>      - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2321]) +2 other tests skip
>     [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-4/igt@kms_cursor_crc@cursor-onscreen-512x512.html
>
>    * igt@kms_cursor_crc@cursor-random-256x85:
>      - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#1424]) +8 other tests skip
>     [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-7/igt@kms_cursor_crc@cursor-random-256x85.html
>
>    * igt@kms_cursor_crc@cursor-sliding-512x512:
>      - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#2321]) +2 other tests skip
>     [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-3/igt@kms_cursor_crc@cursor-sliding-512x512.html
>
>    * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
>      - shard-bmg:          [PASS][47] -> [SKIP][48] ([Intel XE#2291]) +2 other tests skip
>     [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-3/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
>     [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
>
>    * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>      - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2286])
>     [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
>
>    * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
>      - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#309]) +6 other tests skip
>     [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-1/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
>
>    * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
>      - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2291]) +1 other test skip
>     [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
>
>    * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-2:
>      - shard-bmg:          NOTRUN -> [FAIL][52] ([Intel XE#2141])
>     [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-3/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-2.html
>
>    * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
>      - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#1508])
>     [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-4/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
>
>    * igt@kms_draw_crc@draw-method-blt@xrgb2101010-xtiled:
>      - shard-bmg:          [PASS][54] -> [DMESG-FAIL][55] ([Intel XE#2705] / [Intel XE#3468]) +1 other test dmesg-fail
>     [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-1/igt@kms_draw_crc@draw-method-blt@xrgb2101010-xtiled.html
>     [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-2/igt@kms_draw_crc@draw-method-blt@xrgb2101010-xtiled.html
>
>    * igt@kms_draw_crc@draw-method-blt@xrgb8888-4tiled:
>      - shard-bmg:          [PASS][56] -> [DMESG-FAIL][57] ([Intel XE#2705])
>     [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-1/igt@kms_draw_crc@draw-method-blt@xrgb8888-4tiled.html
>     [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-2/igt@kms_draw_crc@draw-method-blt@xrgb8888-4tiled.html
>
>    * igt@kms_draw_crc@draw-method-render:
>      - shard-bmg:          [PASS][58] -> [INCOMPLETE][59] ([Intel XE#1727] / [Intel XE#3468]) +1 other test incomplete
>     [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-6/igt@kms_draw_crc@draw-method-render.html
>     [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-7/igt@kms_draw_crc@draw-method-render.html
>
>    * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
>      - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#2244])
>     [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-8/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
>
>    * igt@kms_feature_discovery@psr1:
>      - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2374])
>     [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-5/igt@kms_feature_discovery@psr1.html
>
>    * igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3:
>      - shard-bmg:          NOTRUN -> [FAIL][62] ([Intel XE#3321])
>     [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html
>
>    * igt@kms_flip@2x-plain-flip-fb-recreate:
>      - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2316]) +4 other tests skip
>     [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate.html
>
>    * igt@kms_flip@2x-plain-flip-ts-check:
>      - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#1421]) +13 other tests skip
>     [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-8/igt@kms_flip@2x-plain-flip-ts-check.html
>
>    * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
>      - shard-bmg:          [PASS][65] -> [SKIP][66] ([Intel XE#2316]) +3 other tests skip
>     [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-3/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
>     [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
>
>    * igt@kms_flip@absolute-wf_vblank@a-dp2:
>      - shard-bmg:          NOTRUN -> [DMESG-FAIL][67] ([Intel XE#3468]) +3 other tests dmesg-fail
>     [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-2/igt@kms_flip@absolute-wf_vblank@a-dp2.html
>
>    * igt@kms_flip@flip-vs-expired-vblank-interruptible:
>      - shard-bmg:          [PASS][68] -> [FAIL][69] ([Intel XE#2882])
>     [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
>     [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
>
>    * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
>      - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#2293]) +6 other tests skip
>     [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html
>
>    * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
>      - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#1401] / [Intel XE#1745]) +8 other tests skip
>     [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
>
>    * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
>      - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#1401]) +8 other tests skip
>     [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html
>
>    * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
>      - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#1397] / [Intel XE#1745])
>     [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html
>
>    * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:
>      - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#1397])
>     [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html
>
>    * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
>      - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#2293] / [Intel XE#2380]) +6 other tests skip
>     [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
>
>    * igt@kms_force_connector_basic@prune-stale-modes:
>      - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#352]) +1 other test skip
>     [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-5/igt@kms_force_connector_basic@prune-stale-modes.html
>
>    * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move:
>      - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#2312]) +21 other tests skip
>     [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.html
>
>    * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
>      - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#2311]) +21 other tests skip
>     [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
>
>    * igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:
>      - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#651]) +23 other tests skip
>     [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html
>
>    * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:
>      - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#656]) +46 other tests skip
>     [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html
>
>    * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
>      - shard-bmg:          NOTRUN -> [FAIL][81] ([Intel XE#2333]) +7 other tests fail
>     [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
>
>    * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:
>      - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#2313]) +26 other tests skip
>     [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html
>
>    * igt@kms_frontbuffer_tracking@psr-suspend:
>      - shard-lnl:          NOTRUN -> [ABORT][83] ([Intel XE#3673]) +9 other tests abort
>     [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-suspend.html
>
>    * igt@kms_getfb@getfb2-accept-ccs:
>      - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#2340])
>     [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-1/igt@kms_getfb@getfb2-accept-ccs.html
>
>    * igt@kms_joiner@basic-ultra-joiner:
>      - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#2927])
>     [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-8/igt@kms_joiner@basic-ultra-joiner.html
>      - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#2927])
>     [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-5/igt@kms_joiner@basic-ultra-joiner.html
>
>    * igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:
>      - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#599]) +3 other tests skip
>     [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-7/igt@kms_plane_lowres@tiling-x@pipe-b-edp-1.html
>
>    * igt@kms_plane_scaling@2x-scaler-multi-pipe:
>      - shard-bmg:          [PASS][88] -> [SKIP][89] ([Intel XE#2571])
>     [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
>     [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
>
>    * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a:
>      - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#2763]) +29 other tests skip
>     [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-1/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a.html
>
>    * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:
>      - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#2763]) +9 other tests skip
>     [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b.html
>
>    * igt@kms_pm_dc@deep-pkgc:
>      - shard-lnl:          NOTRUN -> [FAIL][92] ([Intel XE#2029])
>     [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-1/igt@kms_pm_dc@deep-pkgc.html
>
>    * igt@kms_pm_rpm@drm-resources-equal:
>      - shard-bmg:          [PASS][93] -> [DMESG-WARN][94] ([Intel XE#1727] / [Intel XE#3468]) +3 other tests dmesg-warn
>     [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-8/igt@kms_pm_rpm@drm-resources-equal.html
>     [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-5/igt@kms_pm_rpm@drm-resources-equal.html
>
>    * igt@kms_pm_rpm@modeset-stress-extra-wait:
>      - shard-bmg:          [PASS][95] -> [INCOMPLETE][96] ([Intel XE#1727] / [Intel XE#2864] / [Intel XE#3468])
>     [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-6/igt@kms_pm_rpm@modeset-stress-extra-wait.html
>     [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-4/igt@kms_pm_rpm@modeset-stress-extra-wait.html
>
>    * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
>      - shard-lnl:          NOTRUN -> [SKIP][97] ([Intel XE#2893]) +4 other tests skip
>     [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-8/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html
>
>    * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
>      - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#1489]) +6 other tests skip
>     [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-7/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html
>
>    * igt@kms_psr@fbc-pr-cursor-blt:
>      - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#2234] / [Intel XE#2850]) +14 other tests skip
>     [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-2/igt@kms_psr@fbc-pr-cursor-blt.html
>
>    * igt@kms_psr@pr-sprite-render:
>      - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#1406]) +5 other tests skip
>     [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-8/igt@kms_psr@pr-sprite-render.html
>
>    * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
>      - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#3414]) +1 other test skip
>     [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
>      - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#3414])
>     [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
>
>    * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>      - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#1127])
>     [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
>      - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#2330])
>     [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
>
>    * igt@kms_scaling_modes@scaling-mode-full-aspect:
>      - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#2413]) +1 other test skip
>     [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-full-aspect.html
>
>    * igt@kms_sequence@get-busy@pipe-c-dp-2:
>      - shard-bmg:          NOTRUN -> [DMESG-WARN][106] ([Intel XE#3468]) +47 other tests dmesg-warn
>     [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-3/igt@kms_sequence@get-busy@pipe-c-dp-2.html
>
>    * igt@kms_setmode@basic:
>      - shard-bmg:          [PASS][107] -> [FAIL][108] ([Intel XE#2883]) +2 other tests fail
>     [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-3/igt@kms_setmode@basic.html
>     [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-5/igt@kms_setmode@basic.html
>
>    * igt@kms_setmode@basic-clone-single-crtc:
>      - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#1435])
>     [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-8/igt@kms_setmode@basic-clone-single-crtc.html
>
>    * igt@kms_tiled_display@basic-test-pattern:
>      - shard-bmg:          NOTRUN -> [SKIP][110] ([Intel XE#2426])
>     [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html
>      - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#362])
>     [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-2/igt@kms_tiled_display@basic-test-pattern.html
>
>    * igt@kms_tv_load_detect@load-detect:
>      - shard-lnl:          NOTRUN -> [SKIP][112] ([Intel XE#330])
>     [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-2/igt@kms_tv_load_detect@load-detect.html
>
>    * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
>      - shard-lnl:          NOTRUN -> [FAIL][113] ([Intel XE#899]) +3 other tests fail
>     [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
>
>    * igt@kms_vblank@query-forked@pipe-d-dp-2:
>      - shard-bmg:          [PASS][114] -> [DMESG-WARN][115] ([Intel XE#3468]) +53 other tests dmesg-warn
>     [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-8/igt@kms_vblank@query-forked@pipe-d-dp-2.html
>     [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-1/igt@kms_vblank@query-forked@pipe-d-dp-2.html
>
>    * igt@kms_vrr@flip-basic:
>      - shard-bmg:          NOTRUN -> [SKIP][116] ([Intel XE#1499])
>     [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-8/igt@kms_vrr@flip-basic.html
>
>    * igt@kms_vrr@seamless-rr-switch-drrs:
>      - shard-lnl:          NOTRUN -> [SKIP][117] ([Intel XE#1499]) +1 other test skip
>     [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-3/igt@kms_vrr@seamless-rr-switch-drrs.html
>
>    * igt@kms_writeback@writeback-invalid-parameters:
>      - shard-lnl:          NOTRUN -> [SKIP][118] ([Intel XE#756]) +1 other test skip
>     [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-3/igt@kms_writeback@writeback-invalid-parameters.html
>
>    * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
>      - shard-lnl:          NOTRUN -> [SKIP][119] ([Intel XE#1091] / [Intel XE#2849])
>     [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-4/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
>
>    * igt@xe_create@create-big-vram:
>      - shard-lnl:          NOTRUN -> [SKIP][120] ([Intel XE#1062])
>     [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-3/igt@xe_create@create-big-vram.html
>
>    * igt@xe_eudebug_online@breakpoint-many-sessions-single-tile:
>      - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#2905]) +8 other tests skip
>     [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-8/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html
>
>    * igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram:
>      - shard-lnl:          NOTRUN -> [SKIP][122] ([Intel XE#2905]) +7 other tests skip
>     [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-6/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram.html
>
>    * igt@xe_evict@evict-mixed-threads-large:
>      - shard-bmg:          NOTRUN -> [TIMEOUT][123] ([Intel XE#1473] / [Intel XE#2472])
>     [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-6/igt@xe_evict@evict-mixed-threads-large.html
>
>    * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:
>      - shard-lnl:          NOTRUN -> [SKIP][124] ([Intel XE#688]) +6 other tests skip
>     [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-8/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html
>
>    * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:
>      - shard-lnl:          NOTRUN -> [SKIP][125] ([Intel XE#1392]) +13 other tests skip
>     [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html
>
>    * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
>      - shard-bmg:          NOTRUN -> [SKIP][126] ([Intel XE#2322]) +11 other tests skip
>     [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html
>
>    * igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:
>      - shard-bmg:          [PASS][127] -> [DMESG-WARN][128] ([Intel XE#3467] / [Intel XE#3468])
>     [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html
>     [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html
>
>    * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:
>      - shard-bmg:          [PASS][129] -> [DMESG-WARN][130] ([Intel XE#3343]) +1 other test dmesg-warn
>     [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html
>     [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html
>
>    * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init:
>      - shard-bmg:          NOTRUN -> [DMESG-WARN][131] ([Intel XE#3343] / [Intel XE#3468])
>     [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html
>
>    * igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init:
>      - shard-bmg:          NOTRUN -> [DMESG-WARN][132] ([Intel XE#3467] / [Intel XE#3468]) +1 other test dmesg-warn
>     [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html
>
>    * igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:
>      - shard-bmg:          NOTRUN -> [DMESG-WARN][133] ([Intel XE#3467]) +1 other test dmesg-warn
>     [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-5/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html
>
>    * igt@xe_live_ktest@xe_eudebug:
>      - shard-bmg:          NOTRUN -> [SKIP][134] ([Intel XE#2833])
>     [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-5/igt@xe_live_ktest@xe_eudebug.html
>
>    * igt@xe_live_ktest@xe_mocs:
>      - shard-bmg:          [PASS][135] -> [SKIP][136] ([Intel XE#1192])
>     [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-3/igt@xe_live_ktest@xe_mocs.html
>     [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-1/igt@xe_live_ktest@xe_mocs.html
>
>    * igt@xe_media_fill@media-fill:
>      - shard-lnl:          NOTRUN -> [SKIP][137] ([Intel XE#560])
>     [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-4/igt@xe_media_fill@media-fill.html
>      - shard-bmg:          NOTRUN -> [SKIP][138] ([Intel XE#2459] / [Intel XE#2596])
>     [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-2/igt@xe_media_fill@media-fill.html
>
>    * igt@xe_module_load@force-load:
>      - shard-lnl:          NOTRUN -> [SKIP][139] ([Intel XE#378])
>     [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-1/igt@xe_module_load@force-load.html
>      - shard-bmg:          NOTRUN -> [SKIP][140] ([Intel XE#2457])
>     [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-5/igt@xe_module_load@force-load.html
>
>    * igt@xe_module_load@load:
>      - shard-lnl:          ([PASS][141], [PASS][142], [PASS][143], [PASS][144], [PASS][145], [PASS][146], [PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165]) -> ([PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178], [PASS][179], [PASS][180], [PASS][181], [PASS][182], [PASS][183], [PASS][184], [PASS][185], [PASS][186], [PASS][187], [PASS][188], [SKIP][189], [PASS][190], [PASS][191]) ([Intel XE#378])
>     [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-lnl-5/igt@xe_module_load@load.html
>     [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-lnl-8/igt@xe_module_load@load.html
>     [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-lnl-8/igt@xe_module_load@load.html
>     [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-lnl-4/igt@xe_module_load@load.html
>     [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-lnl-4/igt@xe_module_load@load.html
>     [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-lnl-8/igt@xe_module_load@load.html
>     [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-lnl-2/igt@xe_module_load@load.html
>     [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-lnl-2/igt@xe_module_load@load.html
>     [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-lnl-7/igt@xe_module_load@load.html
>     [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-lnl-3/igt@xe_module_load@load.html
>     [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-lnl-6/igt@xe_module_load@load.html
>     [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-lnl-4/igt@xe_module_load@load.html
>     [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-lnl-1/igt@xe_module_load@load.html
>     [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-lnl-1/igt@xe_module_load@load.html
>     [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-lnl-1/igt@xe_module_load@load.html
>     [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-lnl-7/igt@xe_module_load@load.html
>     [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-lnl-6/igt@xe_module_load@load.html
>     [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-lnl-3/igt@xe_module_load@load.html
>     [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-lnl-3/igt@xe_module_load@load.html
>     [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-lnl-7/igt@xe_module_load@load.html
>     [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-lnl-7/igt@xe_module_load@load.html
>     [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-lnl-6/igt@xe_module_load@load.html
>     [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-lnl-5/igt@xe_module_load@load.html
>     [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-lnl-5/igt@xe_module_load@load.html
>     [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-lnl-5/igt@xe_module_load@load.html
>     [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-6/igt@xe_module_load@load.html
>     [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-2/igt@xe_module_load@load.html
>     [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-6/igt@xe_module_load@load.html
>     [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-5/igt@xe_module_load@load.html
>     [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-4/igt@xe_module_load@load.html
>     [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-2/igt@xe_module_load@load.html
>     [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-2/igt@xe_module_load@load.html
>     [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-5/igt@xe_module_load@load.html
>     [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-3/igt@xe_module_load@load.html
>     [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-7/igt@xe_module_load@load.html
>     [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-3/igt@xe_module_load@load.html
>     [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-3/igt@xe_module_load@load.html
>     [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-8/igt@xe_module_load@load.html
>     [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-1/igt@xe_module_load@load.html
>     [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-1/igt@xe_module_load@load.html
>     [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-8/igt@xe_module_load@load.html
>     [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-1/igt@xe_module_load@load.html
>     [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-7/igt@xe_module_load@load.html
>     [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-7/igt@xe_module_load@load.html
>     [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-2/igt@xe_module_load@load.html
>     [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-6/igt@xe_module_load@load.html
>     [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-4/igt@xe_module_load@load.html
>     [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-4/igt@xe_module_load@load.html
>     [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-2/igt@xe_module_load@load.html
>     [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-8/igt@xe_module_load@load.html
>     [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-5/igt@xe_module_load@load.html
>      - shard-bmg:          ([PASS][192], [PASS][193], [PASS][194], [PASS][195], [PASS][196], [PASS][197], [PASS][198], [PASS][199], [PASS][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208], [PASS][209], [PASS][210], [PASS][211], [PASS][212], [PASS][213], [PASS][214], [PASS][215], [PASS][216]) -> ([PASS][217], [PASS][218], [PASS][219], [SKIP][220], [PASS][221], [PASS][222], [PASS][223], [PASS][224], [PASS][225], [PASS][226], [PASS][227], [PASS][228], [PASS][229], [PASS][230], [PASS][231], [PASS][232], [PASS][233], [PASS][234], [PASS][235], [PASS][236], [PASS][237], [PASS][238], [PASS][239], [PASS][240], [PASS][241], [PASS][242]) ([Intel XE#2457])
>     [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-8/igt@xe_module_load@load.html
>     [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-8/igt@xe_module_load@load.html
>     [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-8/igt@xe_module_load@load.html
>     [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-3/igt@xe_module_load@load.html
>     [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-4/igt@xe_module_load@load.html
>     [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-3/igt@xe_module_load@load.html
>     [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-1/igt@xe_module_load@load.html
>     [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-6/igt@xe_module_load@load.html
>     [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-6/igt@xe_module_load@load.html
>     [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-6/igt@xe_module_load@load.html
>     [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-8/igt@xe_module_load@load.html
>     [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-4/igt@xe_module_load@load.html
>     [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-3/igt@xe_module_load@load.html
>     [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-1/igt@xe_module_load@load.html
>     [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-5/igt@xe_module_load@load.html
>     [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-5/igt@xe_module_load@load.html
>     [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-5/igt@xe_module_load@load.html
>     [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-5/igt@xe_module_load@load.html
>     [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-1/igt@xe_module_load@load.html
>     [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-7/igt@xe_module_load@load.html
>     [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-7/igt@xe_module_load@load.html
>     [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-2/igt@xe_module_load@load.html
>     [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-2/igt@xe_module_load@load.html
>     [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-7/igt@xe_module_load@load.html
>     [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-4/igt@xe_module_load@load.html
>     [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-8/igt@xe_module_load@load.html
>     [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-5/igt@xe_module_load@load.html
>     [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-5/igt@xe_module_load@load.html
>     [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-7/igt@xe_module_load@load.html
>     [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-2/igt@xe_module_load@load.html
>     [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-2/igt@xe_module_load@load.html
>     [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-2/igt@xe_module_load@load.html
>     [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-3/igt@xe_module_load@load.html
>     [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-3/igt@xe_module_load@load.html
>     [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-3/igt@xe_module_load@load.html
>     [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-6/igt@xe_module_load@load.html
>     [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-1/igt@xe_module_load@load.html
>     [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-5/igt@xe_module_load@load.html
>     [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-8/igt@xe_module_load@load.html
>     [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-5/igt@xe_module_load@load.html
>     [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-5/igt@xe_module_load@load.html
>     [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-6/igt@xe_module_load@load.html
>     [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-4/igt@xe_module_load@load.html
>     [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-1/igt@xe_module_load@load.html
>     [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-8/igt@xe_module_load@load.html
>     [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-4/igt@xe_module_load@load.html
>     [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-7/igt@xe_module_load@load.html
>     [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-6/igt@xe_module_load@load.html
>     [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-3/igt@xe_module_load@load.html
>     [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-7/igt@xe_module_load@load.html
>     [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-7/igt@xe_module_load@load.html
>
>    * igt@xe_pat@pat-index-xelp:
>      - shard-bmg:          NOTRUN -> [SKIP][243] ([Intel XE#2245])
>     [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-7/igt@xe_pat@pat-index-xelp.html
>
>    * igt@xe_peer2peer@read:
>      - shard-lnl:          NOTRUN -> [SKIP][244] ([Intel XE#1061])
>     [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-4/igt@xe_peer2peer@read.html
>
>    * igt@xe_pm@d3cold-basic-exec:
>      - shard-lnl:          NOTRUN -> [SKIP][245] ([Intel XE#2284] / [Intel XE#366])
>     [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-1/igt@xe_pm@d3cold-basic-exec.html
>
>    * igt@xe_pm@s2idle-basic:
>      - shard-lnl:          NOTRUN -> [ABORT][246] ([Intel XE#1358] / [Intel XE#3673])
>     [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-1/igt@xe_pm@s2idle-basic.html
>
>    * igt@xe_pm@s2idle-basic-exec:
>      - shard-bmg:          NOTRUN -> [ABORT][247] ([Intel XE#1616])
>     [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-2/igt@xe_pm@s2idle-basic-exec.html
>
>    * igt@xe_pm@s2idle-multiple-execs:
>      - shard-lnl:          NOTRUN -> [ABORT][248] ([Intel XE#1358] / [Intel XE#1616] / [Intel XE#3766])
>     [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-8/igt@xe_pm@s2idle-multiple-execs.html
>
>    * igt@xe_pm@s2idle-vm-bind-unbind-all:
>      - shard-lnl:          NOTRUN -> [ABORT][249] ([Intel XE#1616] / [Intel XE#1694] / [Intel XE#3766])
>     [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-6/igt@xe_pm@s2idle-vm-bind-unbind-all.html
>
>    * igt@xe_pm@s3-basic-exec:
>      - shard-bmg:          NOTRUN -> [DMESG-WARN][250] ([Intel XE#3468] / [Intel XE#569])
>     [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-6/igt@xe_pm@s3-basic-exec.html
>
>    * igt@xe_pm@s3-d3hot-basic-exec:
>      - shard-lnl:          NOTRUN -> [SKIP][251] ([Intel XE#584]) +4 other tests skip
>     [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-6/igt@xe_pm@s3-d3hot-basic-exec.html
>      - shard-bmg:          [PASS][252] -> [DMESG-WARN][253] ([Intel XE#1727] / [Intel XE#3468] / [Intel XE#569])
>     [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-5/igt@xe_pm@s3-d3hot-basic-exec.html
>     [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-2/igt@xe_pm@s3-d3hot-basic-exec.html
>
>    * igt@xe_pm@s4-basic-exec:
>      - shard-lnl:          [PASS][254] -> [ABORT][255] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
>     [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-lnl-4/igt@xe_pm@s4-basic-exec.html
>     [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-2/igt@xe_pm@s4-basic-exec.html
>
>    * igt@xe_pm@vram-d3cold-threshold:
>      - shard-lnl:          NOTRUN -> [SKIP][256] ([Intel XE#579])
>     [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-7/igt@xe_pm@vram-d3cold-threshold.html
>      - shard-bmg:          NOTRUN -> [SKIP][257] ([Intel XE#579])
>     [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-3/igt@xe_pm@vram-d3cold-threshold.html
>
>    * igt@xe_pm_residency@gt-c6-freeze@gt1:
>      - shard-bmg:          [PASS][258] -> [DMESG-FAIL][259] ([Intel XE#1727] / [Intel XE#3468]) +8 other tests dmesg-fail
>     [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-1/igt@xe_pm_residency@gt-c6-freeze@gt1.html
>     [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-2/igt@xe_pm_residency@gt-c6-freeze@gt1.html
>
>    * igt@xe_query@multigpu-query-cs-cycles:
>      - shard-lnl:          NOTRUN -> [SKIP][260] ([Intel XE#944])
>     [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-6/igt@xe_query@multigpu-query-cs-cycles.html
>      - shard-bmg:          NOTRUN -> [SKIP][261] ([Intel XE#944])
>     [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-5/igt@xe_query@multigpu-query-cs-cycles.html
>
>    
> #### Possible fixes ####
>
>    * igt@kms_atomic_transition@plane-all-transition-fencing:
>      - shard-bmg:          [DMESG-WARN][262] ([Intel XE#2705] / [Intel XE#3468]) -> [PASS][263]
>     [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-2/igt@kms_atomic_transition@plane-all-transition-fencing.html
>     [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-2/igt@kms_atomic_transition@plane-all-transition-fencing.html
>
>    * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
>      - shard-bmg:          [DMESG-FAIL][264] ([Intel XE#3468]) -> [PASS][265]
>     [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
>     [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
>
>    * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
>      - shard-bmg:          [SKIP][266] ([Intel XE#2291]) -> [PASS][267] +2 other tests pass
>     [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
>     [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
>
>    * igt@kms_display_modes@extended-mode-basic:
>      - shard-bmg:          [SKIP][268] ([Intel XE#2425]) -> [PASS][269]
>     [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html
>     [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-2/igt@kms_display_modes@extended-mode-basic.html
>
>    * igt@kms_flip@2x-plain-flip:
>      - shard-bmg:          [SKIP][270] ([Intel XE#2316]) -> [PASS][271] +1 other test pass
>     [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-4/igt@kms_flip@2x-plain-flip.html
>     [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-8/igt@kms_flip@2x-plain-flip.html
>
>    * igt@kms_flip@flip-vs-expired-vblank:
>      - shard-bmg:          [FAIL][272] ([Intel XE#2882]) -> [PASS][273] +4 other tests pass
>     [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank.html
>     [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank.html
>
>    * igt@kms_hdr@static-toggle-suspend:
>      - shard-bmg:          [SKIP][274] ([Intel XE#1503]) -> [PASS][275] +1 other test pass
>     [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-5/igt@kms_hdr@static-toggle-suspend.html
>     [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-4/igt@kms_hdr@static-toggle-suspend.html
>
>    * igt@kms_pm_dc@dc5-dpms-negative:
>      - shard-bmg:          [DMESG-WARN][276] ([Intel XE#3468]) -> [PASS][277] +16 other tests pass
>     [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-2/igt@kms_pm_dc@dc5-dpms-negative.html
>     [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-6/igt@kms_pm_dc@dc5-dpms-negative.html
>
>    * igt@xe_evict@evict-threads-small:
>      - shard-bmg:          [DMESG-WARN][278] ([Intel XE#1727]) -> [PASS][279]
>     [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-1/igt@xe_evict@evict-threads-small.html
>     [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-8/igt@xe_evict@evict-threads-small.html
>
>    * igt@xe_exec_balancer@once-cm-parallel-basic:
>      - shard-bmg:          [DMESG-WARN][280] -> [PASS][281]
>     [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-2/igt@xe_exec_balancer@once-cm-parallel-basic.html
>     [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-6/igt@xe_exec_balancer@once-cm-parallel-basic.html
>
>    * igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init:
>      - shard-bmg:          [DMESG-WARN][282] ([Intel XE#3467] / [Intel XE#3468]) -> [PASS][283]
>     [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html
>     [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html
>
>    * igt@xe_module_load@many-reload:
>      - shard-bmg:          [DMESG-WARN][284] ([Intel XE#3467]) -> [PASS][285] +1 other test pass
>     [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-2/igt@xe_module_load@many-reload.html
>     [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-2/igt@xe_module_load@many-reload.html
>
>    * igt@xe_pm@s4-multiple-execs:
>      - shard-lnl:          [ABORT][286] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][287]
>     [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html
>     [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-lnl-3/igt@xe_pm@s4-multiple-execs.html
>
>    * igt@xe_pm_residency@cpg-basic:
>      - shard-bmg:          [DMESG-FAIL][288] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][289] +1 other test pass
>     [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-2/igt@xe_pm_residency@cpg-basic.html
>     [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-3/igt@xe_pm_residency@cpg-basic.html
>
>    
> #### Warnings ####
>
>    * igt@kms_content_protection@legacy:
>      - shard-bmg:          [FAIL][290] ([Intel XE#1178]) -> [SKIP][291] ([Intel XE#2341])
>     [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-3/igt@kms_content_protection@legacy.html
>     [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-6/igt@kms_content_protection@legacy.html
>
>    * igt@kms_content_protection@uevent:
>      - shard-bmg:          [FAIL][292] ([Intel XE#1188]) -> [SKIP][293] ([Intel XE#2341])
>     [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-4/igt@kms_content_protection@uevent.html
>     [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-5/igt@kms_content_protection@uevent.html
>
>    * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
>      - shard-bmg:          [SKIP][294] ([Intel XE#2291]) -> [DMESG-WARN][295] ([Intel XE#877])
>     [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
>     [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
>
>    * igt@kms_fbcon_fbt@fbc:
>      - shard-bmg:          [FAIL][296] ([Intel XE#1695]) -> [DMESG-FAIL][297] ([Intel XE#3468])
>     [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-5/igt@kms_fbcon_fbt@fbc.html
>     [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-7/igt@kms_fbcon_fbt@fbc.html
>
>    * igt@kms_flip@2x-flip-vs-expired-vblank:
>      - shard-bmg:          [SKIP][298] ([Intel XE#2316]) -> [DMESG-FAIL][299] ([Intel XE#3468])
>     [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank.html
>     [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank.html
>
>    * igt@kms_flip@2x-flip-vs-panning-interruptible:
>      - shard-bmg:          [DMESG-WARN][300] ([Intel XE#3468]) -> [SKIP][301] ([Intel XE#2316])
>     [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-2/igt@kms_flip@2x-flip-vs-panning-interruptible.html
>     [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-5/igt@kms_flip@2x-flip-vs-panning-interruptible.html
>
>    * igt@kms_flip@2x-flip-vs-suspend-interruptible:
>      - shard-bmg:          [ABORT][302] ([Intel XE#3468]) -> [SKIP][303] ([Intel XE#2316])
>     [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-2/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
>     [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-4/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
>
>    * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
>      - shard-bmg:          [SKIP][304] ([Intel XE#2316]) -> [DMESG-WARN][305] ([Intel XE#3468])
>     [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
>     [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-8/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
>
>    * igt@kms_flip@flip-vs-panning-interruptible@d-dp2:
>      - shard-bmg:          [DMESG-WARN][306] -> [DMESG-WARN][307] ([Intel XE#3468])
>     [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-2/igt@kms_flip@flip-vs-panning-interruptible@d-dp2.html
>     [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-2/igt@kms_flip@flip-vs-panning-interruptible@d-dp2.html
>
>    * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc:
>      - shard-bmg:          [SKIP][308] ([Intel XE#2311]) -> [SKIP][309] ([Intel XE#2312]) +10 other tests skip
>     [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc.html
>     [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc.html
>
>    * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
>      - shard-bmg:          [DMESG-FAIL][310] ([Intel XE#3468]) -> [FAIL][311] ([Intel XE#2333]) +2 other tests fail
>     [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html
>     [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html
>
>    * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
>      - shard-bmg:          [SKIP][312] ([Intel XE#2312]) -> [FAIL][313] ([Intel XE#2333]) +3 other tests fail
>     [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
>     [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
>
>    * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
>      - shard-bmg:          [FAIL][314] ([Intel XE#2333]) -> [SKIP][315] ([Intel XE#2312]) +3 other tests skip
>     [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
>     [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
>
>    * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
>      - shard-bmg:          [FAIL][316] ([Intel XE#2333]) -> [DMESG-FAIL][317] ([Intel XE#3468]) +6 other tests dmesg-fail
>     [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
>     [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
>
>    * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt:
>      - shard-bmg:          [SKIP][318] ([Intel XE#2312]) -> [SKIP][319] ([Intel XE#2311]) +6 other tests skip
>     [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt.html
>     [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt.html
>
>    * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-render:
>      - shard-bmg:          [SKIP][320] ([Intel XE#2313]) -> [SKIP][321] ([Intel XE#2312]) +14 other tests skip
>     [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-render.html
>     [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-render.html
>
>    * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff:
>      - shard-bmg:          [SKIP][322] ([Intel XE#2312]) -> [SKIP][323] ([Intel XE#2313]) +7 other tests skip
>     [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff.html
>     [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff.html
>
>    * igt@kms_pm_dc@dc6-dpms:
>      - shard-bmg:          [DMESG-FAIL][324] ([Intel XE#3468]) -> [FAIL][325] ([Intel XE#1430])
>     [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-2/igt@kms_pm_dc@dc6-dpms.html
>     [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-8/igt@kms_pm_dc@dc6-dpms.html
>
>    * igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01:
>      - shard-bmg:          [ABORT][326] ([Intel XE#3673]) -> [ABORT][327] ([Intel XE#3468] / [Intel XE#3673]) +3 other tests abort
>     [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-8/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01.html
>     [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-1/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01.html
>
>    * igt@xe_evict@evict-beng-mixed-threads-large:
>      - shard-bmg:          [DMESG-FAIL][328] -> [TIMEOUT][329] ([Intel XE#1473])
>     [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-5/igt@xe_evict@evict-beng-mixed-threads-large.html
>     [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-7/igt@xe_evict@evict-beng-mixed-threads-large.html
>
>    * igt@xe_evict@evict-beng-threads-large:
>      - shard-bmg:          [TIMEOUT][330] ([Intel XE#1473]) -> [INCOMPLETE][331] ([Intel XE#1473] / [Intel XE#3468])
>     [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-4/igt@xe_evict@evict-beng-threads-large.html
>     [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-6/igt@xe_evict@evict-beng-threads-large.html
>
>    * igt@xe_evict@evict-large-multi-vm-cm:
>      - shard-bmg:          [DMESG-FAIL][332] ([Intel XE#3468]) -> [FAIL][333] ([Intel XE#2364])
>     [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-2/igt@xe_evict@evict-large-multi-vm-cm.html
>     [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-6/igt@xe_evict@evict-large-multi-vm-cm.html
>
>    * igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:
>      - shard-bmg:          [DMESG-WARN][334] ([Intel XE#3467] / [Intel XE#3468]) -> [DMESG-WARN][335] ([Intel XE#3467])
>     [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html
>     [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html
>
>    * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:
>      - shard-bmg:          [DMESG-WARN][336] ([Intel XE#3343]) -> [DMESG-WARN][337] ([Intel XE#3343] / [Intel XE#3468])
>     [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html
>     [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html
>
>    * igt@xe_module_load@reload:
>      - shard-bmg:          [FAIL][338] ([Intel XE#3625]) -> [DMESG-WARN][339] ([Intel XE#3467])
>     [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-7/igt@xe_module_load@reload.html
>     [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-3/igt@xe_module_load@reload.html
>
>    * igt@xe_pm@s2idle-vm-bind-unbind-all:
>      - shard-bmg:          [ABORT][340] ([Intel XE#1616] / [Intel XE#3468]) -> [ABORT][341] ([Intel XE#1616])
>     [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-2/igt@xe_pm@s2idle-vm-bind-unbind-all.html
>     [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-5/igt@xe_pm@s2idle-vm-bind-unbind-all.html
>
>    * igt@xe_pm@s3-vm-bind-prefetch:
>      - shard-bmg:          [DMESG-WARN][342] ([Intel XE#1727] / [Intel XE#3468] / [Intel XE#569]) -> [DMESG-WARN][343] ([Intel XE#3468] / [Intel XE#569])
>     [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-7/igt@xe_pm@s3-vm-bind-prefetch.html
>     [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-5/igt@xe_pm@s3-vm-bind-prefetch.html
>
>    * igt@xe_pm@s4-mocs:
>      - shard-bmg:          [DMESG-WARN][344] ([Intel XE#1727] / [Intel XE#2280] / [Intel XE#3468]) -> [DMESG-WARN][345] ([Intel XE#2280] / [Intel XE#3468])
>     [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-1/igt@xe_pm@s4-mocs.html
>     [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-5/igt@xe_pm@s4-mocs.html
>
>    * igt@xe_pm_residency@gt-c6-freeze:
>      - shard-bmg:          [ABORT][346] ([Intel XE#3673]) -> [ABORT][347] ([Intel XE#1727] / [Intel XE#3468] / [Intel XE#3673])
>     [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-1/igt@xe_pm_residency@gt-c6-freeze.html
>     [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-2/igt@xe_pm_residency@gt-c6-freeze.html
>
>    * igt@xe_wedged@wedged-mode-toggle:
>      - shard-bmg:          [DMESG-WARN][348] ([Intel XE#3467]) -> [DMESG-WARN][349] ([Intel XE#3467] / [Intel XE#3468])
>     [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8145/shard-bmg-7/igt@xe_wedged@wedged-mode-toggle.html
>     [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/shard-bmg-6/igt@xe_wedged@wedged-mode-toggle.html
>
>    
>    [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
>    [Intel XE#1062]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062
>    [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
>    [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>    [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
>    [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>    [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>    [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
>    [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
>    [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>    [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>    [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
>    [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>    [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>    [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>    [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>    [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>    [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
>    [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>    [Intel XE#1466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466
>    [Intel XE#1468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468
>    [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>    [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
>    [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>    [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>    [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>    [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
>    [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
>    [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
>    [Intel XE#1694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694
>    [Intel XE#1695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695
>    [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>    [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>    [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>    [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
>    [Intel XE#2141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2141
>    [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>    [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
>    [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>    [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
>    [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
>    [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>    [Intel XE#2280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280
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
>    [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
>    [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
>    [Intel XE#2340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340
>    [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
>    [Intel XE#2364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
>    [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
>    [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
>    [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
>    [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
>    [Intel XE#2425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2425
>    [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>    [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
>    [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
>    [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
>    [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
>    [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
>    [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>    [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
>    [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
>    [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>    [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
>    [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
>    [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>    [Intel XE#2864]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864
>    [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
>    [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
>    [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>    [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
>    [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
>    [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
>    [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
>    [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>    [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>    [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
>    [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
>    [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
>    [Intel XE#3343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
>    [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>    [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>    [Intel XE#3467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467
>    [Intel XE#3468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468
>    [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
>    [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
>    [Intel XE#3625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3625
>    [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
>    [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>    [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>    [Intel XE#3673]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3673
>    [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>    [Intel XE#3766]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3766
>    [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
>    [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
>    [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
>    [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
>    [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
>    [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>    [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
>    [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>    [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>    [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>    [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>    [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>    [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
>    [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>    [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>
>
> Build changes
> -------------
>
>    * IGT: IGT_8145 -> IGTPW_12279
>
>    IGTPW_12279: 12279
>    IGT_8145: 9ecc5cadf47dc934af126a6b34653b860974b9f1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    xe-2340-9d12021e081c72b18c31bda175fb9a43f1d005fc: 9d12021e081c72b18c31bda175fb9a43f1d005fc
>
> == Logs ==
>
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12279/index.html
>
