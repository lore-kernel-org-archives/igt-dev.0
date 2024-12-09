Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C437E7717D
	for <igt-dev@archiver.kernel.org>; Mon,  9 Dec 2024 10:53:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4691810E6C8;
	Mon,  9 Dec 2024 10:53:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="STOHvtUY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E46910E6C8
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Dec 2024 10:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733741631; x=1765277631;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=WV+Fj1usy862nJg9XQldL6wSb2UYaNfPw+Rr00F1fkQ=;
 b=STOHvtUYfBfv7uLQ/1isCD3J6kNBEJL86L67ZfONzy9xupoA1YyTs1ei
 v8aDeg0TEf7WlgRboTDGlqgJ3vdrh7bf+ubwHJOX5V76o3SOjEPMlzXuZ
 Yu8EV2U/N2F2AB+q/xy/mkoaMrsY+J3Ef+uPh1bBkEoRcP/SL3CLSApSg
 afhFbEiAY39Ww8jUntGi0eGZTqxWzzzOt5AWYOLE7pzfF74seMFiNhEQN
 GIOtOwJgB8ToklnruGKgWXXwyXkTwhw7hmj0Y0y82A6mcaUnydc1/Hv5+
 K7Cm4U2Pcxwk/eCAKiqxFXkLqZHbY/Jz3HKozvbz7ve0MnDE7Ezv4LQP9 w==;
X-CSE-ConnectionGUID: LctDL/+NR/Ke7VoZJKufLg==
X-CSE-MsgGUID: aM/Gxr2TS6aprK/yPw7B+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="34152849"
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="34152849"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 02:53:51 -0800
X-CSE-ConnectionGUID: mtunkIeeQmmPawNCS8bSFg==
X-CSE-MsgGUID: V9c9L9wOSq2sSiIZGowNUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="125880213"
Received: from amiszcza-mobl.ger.corp.intel.com (HELO [10.245.81.229])
 ([10.245.81.229])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 02:53:50 -0800
Message-ID: <855da7e8-8296-4792-b0be-17569436e0fd@linux.intel.com>
Date: Mon, 9 Dec 2024 11:53:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciB2bXRiOiBJbnRy?=
 =?UTF-8?Q?oduce_SR-IOV_VM-level_testing_tool_=28rev3=29?=
To: igt-dev@lists.freedesktop.org
References: <20241127102202.3903735-1-adam.miszczak@linux.intel.com>
 <173271862886.3759706.5695303493511748628@b555e5b46a47>
Content-Language: en-US
From: Adam Miszczak <adam.miszczak@linux.intel.com>
In-Reply-To: <173271862886.3759706.5695303493511748628@b555e5b46a47>
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

On 27.11.2024 15:43, Patchwork wrote:
> == Series Details ==
>
> Series: vmtb: Introduce SR-IOV VM-level testing tool (rev3)
> URL   : https://patchwork.freedesktop.org/series/141049/
> State : failure
>
> == Summary ==
>
> CI Bug Log - changes from XEIGT_8127_full -> XEIGTPW_12206_full
> ====================================================
>
> Summary
> -------
>
>    **FAILURE**
>
>    Serious unknown changes coming with XEIGTPW_12206_full absolutely need to be
>    verified manually.
>    
>    If you think the reported changes have nothing to do with the changes
>    introduced in XEIGTPW_12206_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>    Here are the unknown changes that may have been introduced in XEIGTPW_12206_full:
>
> ### IGT changes ###
>
> #### Possible regressions ####
>
>    * igt@core_setmaster@master-drop-set-root:
>      - shard-bmg:          [PASS][1] -> [FAIL][2]
>     [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-6/igt@core_setmaster@master-drop-set-root.html
>     [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-1/igt@core_setmaster@master-drop-set-root.html
>
>    * igt@kms_concurrent@multi-plane-atomic-lowres:
>      - shard-bmg:          NOTRUN -> [DMESG-WARN][3] +1 other test dmesg-warn
>     [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-6/igt@kms_concurrent@multi-plane-atomic-lowres.html
>
>    * igt@xe_exec_fault_mode@twice-userptr:
>      - shard-bmg:          [PASS][4] -> [DMESG-WARN][5]
>     [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-4/igt@xe_exec_fault_mode@twice-userptr.html
>     [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-5/igt@xe_exec_fault_mode@twice-userptr.html
>
>    
> #### Warnings ####
>
>    * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
>      - shard-bmg:          [SKIP][6] ([Intel XE#2423]) -> [DMESG-WARN][7]
>     [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
>     [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
>
>    * igt@xe_wedged@wedged-at-any-timeout:
>      - shard-bmg:          [ABORT][8] ([Intel XE#3421] / [Intel XE#3467]) -> [ABORT][9]
>     [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-7/igt@xe_wedged@wedged-at-any-timeout.html
>     [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-5/igt@xe_wedged@wedged-at-any-timeout.html
>
>    
> Known issues
> ------------
>
>    Here are the changes found in XEIGTPW_12206_full that come from known issues:
>
> ### IGT changes ###
>
> #### Issues hit ####
>
>    * igt@core_getclient:
>      - shard-dg2-set2:     [PASS][10] -> [SKIP][11] ([Intel XE#2423])
>     [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-435/igt@core_getclient.html
>     [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-466/igt@core_getclient.html
>
>    * igt@core_hotunplug@hotreplug-lateclose:
>      - shard-dg2-set2:     [PASS][12] -> [SKIP][13] ([Intel XE#1885]) +1 other test skip
>     [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-436/igt@core_hotunplug@hotreplug-lateclose.html
>     [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-466/igt@core_hotunplug@hotreplug-lateclose.html
>
>    * igt@core_hotunplug@unplug-rescan:
>      - shard-bmg:          [PASS][14] -> [SKIP][15] ([Intel XE#1885])
>     [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-7/igt@core_hotunplug@unplug-rescan.html
>     [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-1/igt@core_hotunplug@unplug-rescan.html
>
>    * igt@fbdev@read:
>      - shard-dg2-set2:     [PASS][16] -> [SKIP][17] ([Intel XE#2134])
>     [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-436/igt@fbdev@read.html
>     [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-466/igt@fbdev@read.html
>
>    * igt@kms_addfb_basic@unused-handle:
>      - shard-bmg:          [PASS][18] -> [SKIP][19] ([Intel XE#2423]) +86 other tests skip
>     [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-3/igt@kms_addfb_basic@unused-handle.html
>     [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-1/igt@kms_addfb_basic@unused-handle.html
>
>    * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
>      - shard-lnl:          [PASS][20] -> [FAIL][21] ([Intel XE#911]) +3 other tests fail
>     [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
>     [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
>
>    * igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs:
>      - shard-lnl:          [PASS][22] -> [FAIL][23] ([Intel XE#1701]) +1 other test fail
>     [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-lnl-1/igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs.html
>     [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-lnl-1/igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs.html
>
>    * igt@kms_atomic_transition@plane-all-transition-fencing:
>      - shard-bmg:          [PASS][24] -> [DMESG-WARN][25] ([Intel XE#2705] / [Intel XE#3468])
>     [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-2/igt@kms_atomic_transition@plane-all-transition-fencing.html
>     [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-5/igt@kms_atomic_transition@plane-all-transition-fencing.html
>
>    * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>      - shard-bmg:          [PASS][26] -> [DMESG-WARN][27] ([Intel XE#3468]) +36 other tests dmesg-warn
>     [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
>     [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
>
>    * igt@kms_big_fb@linear-32bpp-rotate-90:
>      - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2327])
>     [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-7/igt@kms_big_fb@linear-32bpp-rotate-90.html
>
>    * igt@kms_big_fb@x-tiled-8bpp-rotate-180:
>      - shard-lnl:          [PASS][29] -> [INCOMPLETE][30] ([Intel XE#3225])
>     [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-lnl-6/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html
>     [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-lnl-7/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html
>
>    * igt@kms_big_fb@x-tiled-addfb:
>      - shard-bmg:          [PASS][31] -> [SKIP][32] ([Intel XE#2136]) +19 other tests skip
>     [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-7/igt@kms_big_fb@x-tiled-addfb.html
>     [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-1/igt@kms_big_fb@x-tiled-addfb.html
>
>    * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#2136] / [Intel XE#2351])
>     [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
>
>    * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>      - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#1124]) +1 other test skip
>     [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
>
>    * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc:
>      - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#2887]) +2 other tests skip
>     [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-3/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc.html
>
>    * igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-a-hdmi-a-6:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#787]) +90 other tests skip
>     [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-a-hdmi-a-6.html
>
>    * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2:
>      - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2652] / [Intel XE#787]) +15 other tests skip
>     [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2.html
>
>    * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
>      - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#3432])
>     [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
>
>    * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#2907])
>     [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
>
>    * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#455] / [Intel XE#787]) +12 other tests skip
>     [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-435/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html
>
>    * igt@kms_cdclk@mode-transition@pipe-c-dp-4:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#314]) +3 other tests skip
>     [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-436/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html
>
>    * igt@kms_chamelium_frames@hdmi-crc-single:
>      - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2252])
>     [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-5/igt@kms_chamelium_frames@hdmi-crc-single.html
>
>    * igt@kms_chamelium_hpd@vga-hpd:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#2423] / [i915#2575]) +6 other tests skip
>     [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd.html
>
>    * igt@kms_color@ctm-0-25@pipe-a-dp-2:
>      - shard-bmg:          NOTRUN -> [INCOMPLETE][44] ([Intel XE#1727])
>     [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-4/igt@kms_color@ctm-0-25@pipe-a-dp-2.html
>
>    * igt@kms_content_protection@legacy:
>      - shard-bmg:          NOTRUN -> [FAIL][45] ([Intel XE#1178]) +2 other tests fail
>     [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-2/igt@kms_content_protection@legacy.html
>
>    * igt@kms_cursor_crc@cursor-onscreen-128x42:
>      - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2320])
>     [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-4/igt@kms_cursor_crc@cursor-onscreen-128x42.html
>
>    * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
>      - shard-dg2-set2:     [PASS][47] -> [SKIP][48] ([Intel XE#2423] / [i915#2575]) +81 other tests skip
>     [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-436/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
>     [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-434/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
>
>    * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
>      - shard-bmg:          [PASS][49] -> [INCOMPLETE][50] ([Intel XE#1727] / [Intel XE#3226])
>     [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-5/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
>     [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
>
>    * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
>      - shard-dg2-set2:     [PASS][51] -> [INCOMPLETE][52] ([Intel XE#1727])
>     [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-435/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html
>     [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-435/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html
>
>    * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>      - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2286]) +1 other test skip
>     [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
>
>    * igt@kms_cursor_legacy@torture-bo@pipe-b:
>      - shard-bmg:          NOTRUN -> [DMESG-WARN][54] ([Intel XE#3468] / [Intel XE#877])
>     [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-6/igt@kms_cursor_legacy@torture-bo@pipe-b.html
>
>    * igt@kms_draw_crc@draw-method-blt@xrgb2101010-4tiled:
>      - shard-bmg:          NOTRUN -> [INCOMPLETE][55] ([Intel XE#1727] / [Intel XE#3468])
>     [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-3/igt@kms_draw_crc@draw-method-blt@xrgb2101010-4tiled.html
>
>    * igt@kms_draw_crc@draw-method-blt@xrgb8888-4tiled:
>      - shard-bmg:          NOTRUN -> [DMESG-FAIL][56] ([Intel XE#2705])
>     [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-3/igt@kms_draw_crc@draw-method-blt@xrgb8888-4tiled.html
>
>    * igt@kms_dsc@dsc-with-output-formats:
>      - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2244])
>     [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-5/igt@kms_dsc@dsc-with-output-formats.html
>
>    * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3:
>      - shard-bmg:          NOTRUN -> [FAIL][58] ([Intel XE#3486]) +1 other test fail
>     [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3.html
>
>    * igt@kms_flip@absolute-wf_vblank-interruptible@a-hdmi-a3:
>      - shard-bmg:          NOTRUN -> [DMESG-WARN][59] ([Intel XE#3468]) +38 other tests dmesg-warn
>     [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-5/igt@kms_flip@absolute-wf_vblank-interruptible@a-hdmi-a3.html
>
>    * igt@kms_flip@absolute-wf_vblank-interruptible@b-dp2:
>      - shard-bmg:          NOTRUN -> [DMESG-WARN][60] ([Intel XE#2705] / [Intel XE#3468])
>     [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-5/igt@kms_flip@absolute-wf_vblank-interruptible@b-dp2.html
>
>    * igt@kms_flip@flip-vs-suspend@a-hdmi-a3:
>      - shard-bmg:          NOTRUN -> [DMESG-WARN][61] ([Intel XE#1727] / [Intel XE#3468])
>     [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-2/igt@kms_flip@flip-vs-suspend@a-hdmi-a3.html
>
>    * igt@kms_flip@flip-vs-suspend@c-dp2:
>      - shard-bmg:          NOTRUN -> [DMESG-FAIL][62] ([Intel XE#1727] / [Intel XE#3468]) +4 other tests dmesg-fail
>     [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-2/igt@kms_flip@flip-vs-suspend@c-dp2.html
>
>    * igt@kms_flip@plain-flip-ts-check:
>      - shard-lnl:          [PASS][63] -> [FAIL][64] ([Intel XE#3149] / [Intel XE#886]) +1 other test fail
>     [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-lnl-6/igt@kms_flip@plain-flip-ts-check.html
>     [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-lnl-8/igt@kms_flip@plain-flip-ts-check.html
>
>    * igt@kms_flip@plain-flip-ts-check@a-edp1:
>      - shard-lnl:          [PASS][65] -> [FAIL][66] ([Intel XE#886]) +7 other tests fail
>     [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-lnl-6/igt@kms_flip@plain-flip-ts-check@a-edp1.html
>     [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-lnl-8/igt@kms_flip@plain-flip-ts-check@a-edp1.html
>
>    * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
>      - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#2293]) +7 other tests skip
>     [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html
>
>    * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
>      - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#2293] / [Intel XE#2380]) +1 other test skip
>     [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
>
>    * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#455]) +2 other tests skip
>     [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html
>
>    * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#2136]) +2 other tests skip
>     [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html
>
>    * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:
>      - shard-bmg:          NOTRUN -> [FAIL][71] ([Intel XE#2333]) +3 other tests fail
>     [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html
>
>    * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move:
>      - shard-dg2-set2:     [PASS][72] -> [SKIP][73] ([Intel XE#2136]) +20 other tests skip
>     [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html
>     [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html
>
>    * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
>      - shard-dg2-set2:     [PASS][74] -> [SKIP][75] ([Intel XE#2136] / [Intel XE#2351]) +14 other tests skip
>     [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
>     [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
>
>    * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
>      - shard-bmg:          NOTRUN -> [DMESG-FAIL][76] ([Intel XE#3468]) +6 other tests dmesg-fail
>     [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
>
>    * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-wc:
>      - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#2311]) +3 other tests skip
>     [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-wc.html
>
>    * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff:
>      - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#2313]) +2 other tests skip
>     [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff.html
>
>    * igt@kms_lease@lessee-list@pipe-d-dp-4:
>      - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][79] ([Intel XE#1727]) +2 other tests dmesg-warn
>     [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-435/igt@kms_lease@lessee-list@pipe-d-dp-4.html
>
>    * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:
>      - shard-bmg:          [PASS][80] -> [INCOMPLETE][81] ([Intel XE#1035]) +1 other test incomplete
>     [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-5/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html
>     [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-7/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html
>
>    * igt@kms_plane_lowres@tiling-4:
>      - shard-bmg:          [PASS][82] -> [DMESG-FAIL][83] ([Intel XE#2705] / [Intel XE#3468]) +2 other tests dmesg-fail
>     [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-5/igt@kms_plane_lowres@tiling-4.html
>     [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-5/igt@kms_plane_lowres@tiling-4.html
>
>    * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:
>      - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#2763]) +7 other tests skip
>     [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html
>
>    * igt@kms_pm_dc@dc5-dpms:
>      - shard-lnl:          [PASS][85] -> [FAIL][86] ([Intel XE#718])
>     [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-lnl-5/igt@kms_pm_dc@dc5-dpms.html
>     [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-lnl-4/igt@kms_pm_dc@dc5-dpms.html
>
>    * igt@kms_pm_lpsp@kms-lpsp@pipe-a-hdmi-a-6:
>      - shard-dg2-set2:     NOTRUN -> [FAIL][87] ([Intel XE#3527])
>     [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-435/igt@kms_pm_lpsp@kms-lpsp@pipe-a-hdmi-a-6.html
>
>    * igt@kms_pm_rpm@basic-rte:
>      - shard-bmg:          [PASS][88] -> [DMESG-WARN][89] ([Intel XE#1727] / [Intel XE#3468]) +2 other tests dmesg-warn
>     [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-4/igt@kms_pm_rpm@basic-rte.html
>     [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-6/igt@kms_pm_rpm@basic-rte.html
>
>    * igt@kms_pm_rpm@cursor-dpms:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#2446])
>     [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-434/igt@kms_pm_rpm@cursor-dpms.html
>
>    * igt@kms_pm_rpm@drm-resources-equal:
>      - shard-bmg:          [PASS][91] -> [SKIP][92] ([Intel XE#2446]) +4 other tests skip
>     [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-4/igt@kms_pm_rpm@drm-resources-equal.html
>     [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-1/igt@kms_pm_rpm@drm-resources-equal.html
>
>    * igt@kms_pm_rpm@legacy-planes:
>      - shard-bmg:          [PASS][93] -> [INCOMPLETE][94] ([Intel XE#1727] / [Intel XE#2864] / [Intel XE#3468])
>     [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-5/igt@kms_pm_rpm@legacy-planes.html
>     [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-6/igt@kms_pm_rpm@legacy-planes.html
>
>    * igt@kms_pm_rpm@legacy-planes@plane-50:
>      - shard-bmg:          [PASS][95] -> [INCOMPLETE][96] ([Intel XE#1727] / [Intel XE#3468]) +2 other tests incomplete
>     [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-5/igt@kms_pm_rpm@legacy-planes@plane-50.html
>     [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-6/igt@kms_pm_rpm@legacy-planes@plane-50.html
>
>    * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
>      - shard-dg2-set2:     [PASS][97] -> [SKIP][98] ([Intel XE#2446]) +4 other tests skip
>     [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-436/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
>     [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-466/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
>
>    * igt@kms_pm_rpm@universal-planes-dpms:
>      - shard-lnl:          [PASS][99] -> [DMESG-WARN][100] ([Intel XE#2042])
>     [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-lnl-6/igt@kms_pm_rpm@universal-planes-dpms.html
>     [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-lnl-8/igt@kms_pm_rpm@universal-planes-dpms.html
>
>    * igt@kms_pm_rpm@universal-planes-dpms@plane-41:
>      - shard-lnl:          [PASS][101] -> [DMESG-WARN][102] ([Intel XE#3184])
>     [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-lnl-6/igt@kms_pm_rpm@universal-planes-dpms@plane-41.html
>     [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-lnl-8/igt@kms_pm_rpm@universal-planes-dpms@plane-41.html
>
>    * igt@kms_pm_rpm@universal-planes@plane-32:
>      - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][103] ([Intel XE#1727] / [Intel XE#3468]) +1 other test dmesg-warn
>     [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-435/igt@kms_pm_rpm@universal-planes@plane-32.html
>
>    * igt@kms_pm_rpm@universal-planes@plane-59:
>      - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][104] ([Intel XE#3468]) +9 other tests dmesg-warn
>     [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-435/igt@kms_pm_rpm@universal-planes@plane-59.html
>
>    * igt@kms_psr@psr-cursor-blt:
>      - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#2136]) +5 other tests skip
>     [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-1/igt@kms_psr@psr-cursor-blt.html
>
>    * igt@kms_psr@psr2-no-drrs:
>      - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#2234] / [Intel XE#2850])
>     [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-4/igt@kms_psr@psr2-no-drrs.html
>
>    * igt@kms_vblank@wait-idle@pipe-a-dp-2:
>      - shard-bmg:          [PASS][107] -> [DMESG-FAIL][108] ([Intel XE#3468]) +7 other tests dmesg-fail
>     [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-7/igt@kms_vblank@wait-idle@pipe-a-dp-2.html
>     [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-6/igt@kms_vblank@wait-idle@pipe-a-dp-2.html
>
>    * igt@kms_writeback@writeback-check-output:
>      - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#2423]) +8 other tests skip
>     [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-1/igt@kms_writeback@writeback-check-output.html
>
>    * igt@kms_writeback@writeback-fb-id-xrgb2101010:
>      - shard-bmg:          NOTRUN -> [SKIP][110] ([Intel XE#756])
>     [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-7/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
>
>    * igt@xe_compute_preempt@compute-preempt@engine-drm_xe_engine_class_compute:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][111] ([Intel XE#1280] / [Intel XE#455])
>     [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-436/igt@xe_compute_preempt@compute-preempt@engine-drm_xe_engine_class_compute.html
>
>    * igt@xe_create@multigpu-create-massive-size:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][112] ([Intel XE#944])
>     [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-436/igt@xe_create@multigpu-create-massive-size.html
>
>    * igt@xe_eudebug@basic-exec-queues-enable:
>      - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#2905]) +1 other test skip
>     [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-7/igt@xe_eudebug@basic-exec-queues-enable.html
>
>    * igt@xe_evict@evict-beng-mixed-many-threads-large:
>      - shard-dg2-set2:     [PASS][114] -> [TIMEOUT][115] ([Intel XE#1473])
>     [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-large.html
>     [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-large.html
>
>    * igt@xe_exec_balancer@many-parallel-userptr-invalidate:
>      - shard-bmg:          NOTRUN -> [SKIP][116] ([Intel XE#1130]) +9 other tests skip
>     [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-1/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html
>
>    * igt@xe_exec_basic@multigpu-once-userptr:
>      - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#2322])
>     [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-2/igt@xe_exec_basic@multigpu-once-userptr.html
>
>    * igt@xe_exec_basic@no-exec-rebind:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][118] ([Intel XE#1130]) +6 other tests skip
>     [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-434/igt@xe_exec_basic@no-exec-rebind.html
>
>    * igt@xe_gt_freq@freq_fixed_idle:
>      - shard-bmg:          [PASS][119] -> [DMESG-WARN][120] ([Intel XE#1727])
>     [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-7/igt@xe_gt_freq@freq_fixed_idle.html
>     [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-3/igt@xe_gt_freq@freq_fixed_idle.html
>
>    * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
>      - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#2229]) +1 other test skip
>     [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
>
>    * igt@xe_module_load@load:
>      - shard-bmg:          NOTRUN -> [SKIP][122] ([Intel XE#2457])
>     [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-2/igt@xe_module_load@load.html
>
>    * igt@xe_pat@pat-index-xelpg:
>      - shard-bmg:          NOTRUN -> [SKIP][123] ([Intel XE#2236])
>     [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-3/igt@xe_pat@pat-index-xelpg.html
>
>    * igt@xe_pm@d3cold-mmap-vram:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][124] ([Intel XE#2284] / [Intel XE#366])
>     [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-435/igt@xe_pm@d3cold-mmap-vram.html
>
>    * igt@xe_pm@s2idle-basic-exec:
>      - shard-bmg:          [PASS][125] -> [DMESG-WARN][126] ([Intel XE#1616] / [Intel XE#1727] / [Intel XE#3468]) +2 other tests dmesg-warn
>     [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-5/igt@xe_pm@s2idle-basic-exec.html
>     [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-4/igt@xe_pm@s2idle-basic-exec.html
>
>    * igt@xe_pm@s4-d3cold-basic-exec:
>      - shard-bmg:          NOTRUN -> [SKIP][127] ([Intel XE#2284])
>     [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-2/igt@xe_pm@s4-d3cold-basic-exec.html
>
>    * igt@xe_query@query-uc-fw-version-huc:
>      - shard-dg2-set2:     [PASS][128] -> [SKIP][129] ([Intel XE#1130]) +157 other tests skip
>     [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-435/igt@xe_query@query-uc-fw-version-huc.html
>     [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-434/igt@xe_query@query-uc-fw-version-huc.html
>
>    * igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:
>      - shard-bmg:          [PASS][130] -> [SKIP][131] ([Intel XE#1130]) +195 other tests skip
>     [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-7/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html
>     [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-1/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html
>
>    
> #### Possible fixes ####
>
>    * igt@core_getversion@basic:
>      - shard-dg2-set2:     [FAIL][132] ([Intel XE#3440]) -> [PASS][133]
>     [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-434/igt@core_getversion@basic.html
>     [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-436/igt@core_getversion@basic.html
>
>    * igt@core_hotunplug@hotrebind-lateclose:
>      - shard-bmg:          [SKIP][134] ([Intel XE#1885]) -> [PASS][135] +2 other tests pass
>     [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-1/igt@core_hotunplug@hotrebind-lateclose.html
>     [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-2/igt@core_hotunplug@hotrebind-lateclose.html
>
>    * igt@kms_3d:
>      - shard-bmg:          [DMESG-WARN][136] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][137]
>     [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-3/igt@kms_3d.html
>     [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-3/igt@kms_3d.html
>
>    * igt@kms_addfb_basic@bad-pitch-999:
>      - shard-bmg:          [SKIP][138] ([Intel XE#2423]) -> [PASS][139] +86 other tests pass
>     [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-1/igt@kms_addfb_basic@bad-pitch-999.html
>     [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-2/igt@kms_addfb_basic@bad-pitch-999.html
>
>    * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
>      - shard-lnl:          [FAIL][140] ([Intel XE#1426]) -> [PASS][141] +1 other test pass
>     [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
>     [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-lnl-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
>
>    * igt@kms_big_fb@4-tiled-addfb-size-overflow:
>      - shard-dg2-set2:     [SKIP][142] ([Intel XE#2136]) -> [PASS][143] +30 other tests pass
>     [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-466/igt@kms_big_fb@4-tiled-addfb-size-overflow.html
>     [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-436/igt@kms_big_fb@4-tiled-addfb-size-overflow.html
>
>    * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>      - shard-bmg:          [SKIP][144] ([Intel XE#2136]) -> [PASS][145] +20 other tests pass
>     [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
>     [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
>
>    * igt@kms_cursor_crc@cursor-suspend:
>      - shard-bmg:          [INCOMPLETE][146] ([Intel XE#3468]) -> [PASS][147] +1 other test pass
>     [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-2/igt@kms_cursor_crc@cursor-suspend.html
>     [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-2/igt@kms_cursor_crc@cursor-suspend.html
>
>    * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
>      - shard-bmg:          [DMESG-WARN][148] -> [PASS][149]
>     [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-3/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
>     [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-7/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
>
>    * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
>      - shard-bmg:          [SKIP][150] ([Intel XE#2291]) -> [PASS][151]
>     [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
>     [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
>
>    * igt@kms_flip@2x-flip-vs-suspend:
>      - shard-bmg:          [INCOMPLETE][152] ([Intel XE#1727] / [Intel XE#2597] / [Intel XE#3468] / [Intel XE#3561]) -> [PASS][153]
>     [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-2/igt@kms_flip@2x-flip-vs-suspend.html
>     [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-3/igt@kms_flip@2x-flip-vs-suspend.html
>
>    * igt@kms_flip@2x-flip-vs-suspend@ab-dp2-hdmi-a3:
>      - shard-bmg:          [DMESG-FAIL][154] ([Intel XE#3468]) -> [PASS][155] +5 other tests pass
>     [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-2/igt@kms_flip@2x-flip-vs-suspend@ab-dp2-hdmi-a3.html
>     [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-3/igt@kms_flip@2x-flip-vs-suspend@ab-dp2-hdmi-a3.html
>
>    * igt@kms_flip@2x-flip-vs-suspend@ac-dp2-hdmi-a3:
>      - shard-bmg:          [DMESG-FAIL][156] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][157] +3 other tests pass
>     [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-2/igt@kms_flip@2x-flip-vs-suspend@ac-dp2-hdmi-a3.html
>     [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-3/igt@kms_flip@2x-flip-vs-suspend@ac-dp2-hdmi-a3.html
>
>    * igt@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a3:
>      - shard-bmg:          [DMESG-WARN][158] ([Intel XE#3468]) -> [PASS][159] +14 other tests pass
>     [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-6/igt@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a3.html
>     [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-3/igt@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a3.html
>
>    * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:
>      - shard-bmg:          [INCOMPLETE][160] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][161] +1 other test pass
>     [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html
>     [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html
>
>    * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
>      - shard-dg2-set2:     [SKIP][162] ([Intel XE#2136] / [Intel XE#2351]) -> [PASS][163] +4 other tests pass
>     [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html
>     [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html
>
>    * igt@kms_pm_rpm@i2c:
>      - shard-bmg:          [SKIP][164] ([Intel XE#2446]) -> [PASS][165] +1 other test pass
>     [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-1/igt@kms_pm_rpm@i2c.html
>     [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-2/igt@kms_pm_rpm@i2c.html
>
>    * igt@kms_pm_rpm@modeset-stress-extra-wait:
>      - shard-dg2-set2:     [SKIP][166] ([Intel XE#2446]) -> [PASS][167] +1 other test pass
>     [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-466/igt@kms_pm_rpm@modeset-stress-extra-wait.html
>     [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-435/igt@kms_pm_rpm@modeset-stress-extra-wait.html
>
>    * igt@kms_psr@fbc-psr2-cursor-render@edp-1:
>      - shard-lnl:          [FAIL][168] -> [PASS][169] +1 other test pass
>     [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-lnl-3/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html
>     [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-lnl-4/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html
>
>    * igt@kms_rotation_crc@sprite-rotation-180:
>      - shard-dg2-set2:     [SKIP][170] ([Intel XE#2423] / [i915#2575]) -> [PASS][171] +87 other tests pass
>     [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-466/igt@kms_rotation_crc@sprite-rotation-180.html
>     [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-435/igt@kms_rotation_crc@sprite-rotation-180.html
>
>    * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
>      - shard-lnl:          [FAIL][172] ([Intel XE#899]) -> [PASS][173]
>     [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
>     [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
>
>    * igt@xe_exec_balancer@twice-parallel-userptr-invalidate:
>      - shard-bmg:          [DMESG-WARN][174] ([Intel XE#1727]) -> [PASS][175] +1 other test pass
>     [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-3/igt@xe_exec_balancer@twice-parallel-userptr-invalidate.html
>     [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-3/igt@xe_exec_balancer@twice-parallel-userptr-invalidate.html
>
>    * igt@xe_exec_basic@many-null-rebind:
>      - shard-dg2-set2:     [SKIP][176] ([Intel XE#1130]) -> [PASS][177] +154 other tests pass
>     [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-434/igt@xe_exec_basic@many-null-rebind.html
>     [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-435/igt@xe_exec_basic@many-null-rebind.html
>
>    * igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race:
>      - shard-bmg:          [SKIP][178] ([Intel XE#1130]) -> [PASS][179] +203 other tests pass
>     [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-1/igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race.html
>     [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-4/igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race.html
>
>    * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:
>      - shard-bmg:          [DMESG-WARN][180] ([Intel XE#3343]) -> [PASS][181]
>     [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html
>     [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html
>
>    * igt@xe_live_ktest@xe_bo:
>      - shard-bmg:          [SKIP][182] ([Intel XE#1192]) -> [PASS][183]
>     [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-6/igt@xe_live_ktest@xe_bo.html
>     [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-1/igt@xe_live_ktest@xe_bo.html
>
>    * igt@xe_pm_residency@gt-c6-freeze:
>      - shard-lnl:          [DMESG-WARN][184] ([Intel XE#3088]) -> [PASS][185] +1 other test pass
>     [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-lnl-8/igt@xe_pm_residency@gt-c6-freeze.html
>     [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-lnl-5/igt@xe_pm_residency@gt-c6-freeze.html
>
>    * igt@xe_pm_residency@toggle-gt-c6:
>      - shard-lnl:          [FAIL][186] ([Intel XE#958]) -> [PASS][187]
>     [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-lnl-3/igt@xe_pm_residency@toggle-gt-c6.html
>     [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html
>
>    * igt@xe_vm@large-userptr-split-misaligned-binds-1073741824:
>      - shard-dg2-set2:     [INCOMPLETE][188] -> [PASS][189]
>     [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-436/igt@xe_vm@large-userptr-split-misaligned-binds-1073741824.html
>     [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-436/igt@xe_vm@large-userptr-split-misaligned-binds-1073741824.html
>
>    
> #### Warnings ####
>
>    * igt@core_hotunplug@hotunplug-rescan:
>      - shard-dg2-set2:     [DMESG-WARN][190] ([Intel XE#3468]) -> [SKIP][191] ([Intel XE#1885])
>     [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-435/igt@core_hotunplug@hotunplug-rescan.html
>     [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-434/igt@core_hotunplug@hotunplug-rescan.html
>
>    * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>      - shard-bmg:          [SKIP][192] ([Intel XE#2423]) -> [SKIP][193] ([Intel XE#2233])
>     [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
>     [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-7/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
>
>    * igt@kms_addfb_basic@unused-modifier:
>      - shard-bmg:          [SKIP][194] ([Intel XE#2423]) -> [DMESG-WARN][195] ([Intel XE#3468]) +6 other tests dmesg-warn
>     [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-1/igt@kms_addfb_basic@unused-modifier.html
>     [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-5/igt@kms_addfb_basic@unused-modifier.html
>
>    * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
>      - shard-bmg:          [SKIP][196] ([Intel XE#2385]) -> [SKIP][197] ([Intel XE#2423])
>     [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-5/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
>     [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-1/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
>
>    * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
>      - shard-bmg:          [INCOMPLETE][198] ([Intel XE#1727] / [Intel XE#2613]) -> [SKIP][199] ([Intel XE#2423])
>     [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-4/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
>     [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-1/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
>
>    * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
>      - shard-bmg:          [SKIP][200] ([Intel XE#2423]) -> [SKIP][201] ([Intel XE#2370])
>     [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
>     [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
>
>    * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
>      - shard-dg2-set2:     [SKIP][202] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][203] ([Intel XE#316])
>     [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-434/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html
>     [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-435/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html
>
>    * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
>      - shard-dg2-set2:     [SKIP][204] ([Intel XE#316]) -> [SKIP][205] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
>     [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-435/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
>     [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-466/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
>
>    * igt@kms_big_fb@linear-64bpp-rotate-270:
>      - shard-bmg:          [SKIP][206] ([Intel XE#2136]) -> [SKIP][207] ([Intel XE#2327]) +5 other tests skip
>     [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-1/igt@kms_big_fb@linear-64bpp-rotate-270.html
>     [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-4/igt@kms_big_fb@linear-64bpp-rotate-270.html
>
>    * igt@kms_big_fb@linear-8bpp-rotate-270:
>      - shard-dg2-set2:     [SKIP][208] ([Intel XE#2136]) -> [SKIP][209] ([Intel XE#316]) +4 other tests skip
>     [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-434/igt@kms_big_fb@linear-8bpp-rotate-270.html
>     [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-436/igt@kms_big_fb@linear-8bpp-rotate-270.html
>
>    * igt@kms_big_fb@linear-8bpp-rotate-90:
>      - shard-bmg:          [SKIP][210] ([Intel XE#2327]) -> [SKIP][211] ([Intel XE#2136]) +3 other tests skip
>     [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-6/igt@kms_big_fb@linear-8bpp-rotate-90.html
>     [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-1/igt@kms_big_fb@linear-8bpp-rotate-90.html
>
>    * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0:
>      - shard-bmg:          [DMESG-WARN][212] ([Intel XE#3468]) -> [SKIP][213] ([Intel XE#2136]) +1 other test skip
>     [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-6/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0.html
>     [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-1/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0.html
>
>    * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
>      - shard-bmg:          [DMESG-WARN][214] ([Intel XE#1727] / [Intel XE#3468]) -> [SKIP][215] ([Intel XE#2136])
>     [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-3/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
>     [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-1/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
>
>    * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
>      - shard-dg2-set2:     [SKIP][216] ([Intel XE#316]) -> [SKIP][217] ([Intel XE#2136])
>     [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-436/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
>     [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-466/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
>
>    * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>      - shard-bmg:          [SKIP][218] ([Intel XE#2136]) -> [DMESG-FAIL][219] ([Intel XE#1727] / [Intel XE#3468])
>     [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
>     [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
>
>    * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
>      - shard-dg2-set2:     [SKIP][220] ([Intel XE#1124]) -> [SKIP][221] ([Intel XE#2136] / [Intel XE#2351]) +3 other tests skip
>     [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
>     [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
>
>    * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
>      - shard-dg2-set2:     [SKIP][222] ([Intel XE#1124]) -> [SKIP][223] ([Intel XE#2136]) +3 other tests skip
>     [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
>     [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
>
>    * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
>      - shard-dg2-set2:     [SKIP][224] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][225] ([Intel XE#1124]) +2 other tests skip
>     [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-434/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html
>     [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-436/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html
>
>    * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
>      - shard-bmg:          [SKIP][226] ([Intel XE#2136]) -> [SKIP][227] ([Intel XE#1124]) +17 other tests skip
>     [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-1/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
>     [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-5/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
>
>    * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
>      - shard-dg2-set2:     [SKIP][228] ([Intel XE#2136]) -> [SKIP][229] ([Intel XE#1124]) +5 other tests skip
>     [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-466/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
>     [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-435/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
>
>    * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
>      - shard-bmg:          [SKIP][230] ([Intel XE#1124]) -> [SKIP][231] ([Intel XE#2136]) +13 other tests skip
>     [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-3/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html
>     [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-1/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html
>
>    * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
>      - shard-bmg:          [SKIP][232] ([Intel XE#607]) -> [SKIP][233] ([Intel XE#2136])
>     [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-3/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
>     [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
>
>    * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
>      - shard-dg2-set2:     [SKIP][234] ([Intel XE#367]) -> [SKIP][235] ([Intel XE#2423] / [i915#2575]) +3 other tests skip
>     [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-436/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
>     [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-466/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
>
>    * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
>      - shard-dg2-set2:     [SKIP][236] ([Intel XE#2423] / [i915#2575]) -> [SKIP][237] ([Intel XE#2191]) +2 other tests skip
>     [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
>     [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-435/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
>
>    * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
>      - shard-bmg:          [SKIP][238] ([Intel XE#2314] / [Intel XE#2894]) -> [SKIP][239] ([Intel XE#2423]) +1 other test skip
>     [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-6/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
>     [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-1/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
>
>    * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
>      - shard-bmg:          [SKIP][240] ([Intel XE#2423]) -> [SKIP][241] ([Intel XE#2314] / [Intel XE#2894])
>     [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-1/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
>     [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-6/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
>
>    * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
>      - shard-dg2-set2:     [SKIP][242] ([Intel XE#2191]) -> [SKIP][243] ([Intel XE#2423] / [i915#2575]) +1 other test skip
>     [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
>     [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
>
>    * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
>      - shard-bmg:          [SKIP][244] ([Intel XE#2423]) -> [SKIP][245] ([Intel XE#367]) +2 other tests skip
>     [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
>     [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
>
>    * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
>      - shard-dg2-set2:     [SKIP][246] ([Intel XE#2423] / [i915#2575]) -> [SKIP][247] ([Intel XE#367]) +5 other tests skip
>     [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html
>     [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-435/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html
>
>    * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
>      - shard-bmg:          [SKIP][248] ([Intel XE#367]) -> [SKIP][249] ([Intel XE#2423]) +4 other tests skip
>     [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-3/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html
>     [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-1/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html
>
>    * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:
>      - shard-bmg:          [SKIP][250] ([Intel XE#2136]) -> [SKIP][251] ([Intel XE#2887]) +18 other tests skip
>     [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-1/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html
>     [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-2/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html
>
>    * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
>      - shard-dg2-set2:     [SKIP][252] ([Intel XE#2907]) -> [SKIP][253] ([Intel XE#2136])
>     [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-435/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
>     [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
>
>    * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
>      - shard-dg2-set2:     [SKIP][254] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][255] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
>     [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-466/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html
>     [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html
>
>    * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:
>      - shard-dg2-set2:     [SKIP][256] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][257] ([Intel XE#2136] / [Intel XE#2351]) +3 other tests skip
>     [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html
>     [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html
>
>    * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
>      - shard-bmg:          [INCOMPLETE][258] ([Intel XE#1727] / [Intel XE#3468]) -> [SKIP][259] ([Intel XE#2136])
>     [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
>     [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
>
>    * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>      - shard-dg2-set2:     [SKIP][260] ([Intel XE#3442]) -> [SKIP][261] ([Intel XE#2136]) +1 other test skip
>     [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
>     [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
>
>    * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
>      - shard-bmg:          [SKIP][262] ([Intel XE#2136]) -> [SKIP][263] ([Intel XE#3432])
>     [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html
>     [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html
>
>    * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
>      - shard-dg2-set2:     [SKIP][264] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][265] ([Intel XE#2136]) +11 other tests skip
>     [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html
>     [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html
>      - shard-bmg:          [SKIP][266] ([Intel XE#3432]) -> [SKIP][267] ([Intel XE#2136]) +3 other tests skip
>     [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html
>     [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html
>
>    * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
>      - shard-dg2-set2:     [SKIP][268] ([Intel XE#2136]) -> [SKIP][269] ([Intel XE#455] / [Intel XE#787]) +10 other tests skip
>     [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
>     [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
>
>    * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
>      - shard-bmg:          [SKIP][270] ([Intel XE#2136]) -> [DMESG-WARN][271] ([Intel XE#3468]) +1 other test dmesg-warn
>     [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
>     [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
>      - shard-dg2-set2:     [SKIP][272] ([Intel XE#2136]) -> [SKIP][273] ([Intel XE#2907]) +1 other test skip
>     [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
>     [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
>
>    * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
>      - shard-bmg:          [SKIP][274] ([Intel XE#2136]) -> [SKIP][275] ([Intel XE#2652] / [Intel XE#787]) +1 other test skip
>     [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
>     [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
>
>    * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
>      - shard-bmg:          [SKIP][276] ([Intel XE#2887]) -> [SKIP][277] ([Intel XE#2136]) +15 other tests skip
>     [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
>     [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
>
>    * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
>      - shard-bmg:          [SKIP][278] ([Intel XE#2652] / [Intel XE#787]) -> [SKIP][279] ([Intel XE#2136]) +2 other tests skip
>     [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-3/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
>     [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
>
>    * igt@kms_chamelium_audio@dp-audio:
>      - shard-dg2-set2:     [SKIP][280] ([Intel XE#373]) -> [SKIP][281] ([Intel XE#2423] / [i915#2575]) +8 other tests skip
>     [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-436/igt@kms_chamelium_audio@dp-audio.html
>     [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-466/igt@kms_chamelium_audio@dp-audio.html
>
>    * igt@kms_chamelium_color@ctm-0-25:
>      - shard-dg2-set2:     [SKIP][282] ([Intel XE#2423] / [i915#2575]) -> [SKIP][283] ([Intel XE#306])
>     [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-466/igt@kms_chamelium_color@ctm-0-25.html
>     [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-436/igt@kms_chamelium_color@ctm-0-25.html
>
>    * igt@kms_chamelium_color@ctm-0-50:
>      - shard-bmg:          [SKIP][284] ([Intel XE#2423]) -> [SKIP][285] ([Intel XE#2325])
>     [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-1/igt@kms_chamelium_color@ctm-0-50.html
>     [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-3/igt@kms_chamelium_color@ctm-0-50.html
>
>    * igt@kms_chamelium_color@ctm-blue-to-red:
>      - shard-bmg:          [SKIP][286] ([Intel XE#2325]) -> [SKIP][287] ([Intel XE#2423]) +1 other test skip
>     [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-5/igt@kms_chamelium_color@ctm-blue-to-red.html
>     [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-1/igt@kms_chamelium_color@ctm-blue-to-red.html
>
>    * igt@kms_chamelium_color@ctm-limited-range:
>      - shard-dg2-set2:     [SKIP][288] ([Intel XE#306]) -> [SKIP][289] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
>     [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-435/igt@kms_chamelium_color@ctm-limited-range.html
>     [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-434/igt@kms_chamelium_color@ctm-limited-range.html
>
>    * igt@kms_chamelium_edid@dp-edid-read:
>      - shard-bmg:          [SKIP][290] ([Intel XE#2252]) -> [SKIP][291] ([Intel XE#2423]) +11 other tests skip
>     [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-6/igt@kms_chamelium_edid@dp-edid-read.html
>     [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-1/igt@kms_chamelium_edid@dp-edid-read.html
>
>    * igt@kms_chamelium_frames@hdmi-aspect-ratio:
>      - shard-bmg:          [SKIP][292] ([Intel XE#2423]) -> [SKIP][293] ([Intel XE#2252]) +10 other tests skip
>     [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-1/igt@kms_chamelium_frames@hdmi-aspect-ratio.html
>     [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-2/igt@kms_chamelium_frames@hdmi-aspect-ratio.html
>
>    * igt@kms_chamelium_hpd@hdmi-hpd:
>      - shard-dg2-set2:     [SKIP][294] ([Intel XE#2423] / [i915#2575]) -> [SKIP][295] ([Intel XE#373]) +12 other tests skip
>     [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd.html
>     [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd.html
>
>    * igt@kms_color@ctm-0-25:
>      - shard-bmg:          [SKIP][296] ([Intel XE#2423]) -> [INCOMPLETE][297] ([Intel XE#1727])
>     [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-1/igt@kms_color@ctm-0-25.html
>     [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-4/igt@kms_color@ctm-0-25.html
>
>    * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
>      - shard-bmg:          [FAIL][298] ([Intel XE#1178]) -> [INCOMPLETE][299] ([Intel XE#2715] / [Intel XE#3468]) +1 other test incomplete
>     [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-7/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html
>     [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-3/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html
>
>    * igt@kms_content_protection@content-type-change:
>      - shard-bmg:          [SKIP][300] ([Intel XE#2423]) -> [SKIP][301] ([Intel XE#2341]) +1 other test skip
>     [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-1/igt@kms_content_protection@content-type-change.html
>     [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-5/igt@kms_content_protection@content-type-change.html
>
>    * igt@kms_content_protection@dp-mst-lic-type-0:
>      - shard-dg2-set2:     [SKIP][302] ([Intel XE#2423] / [i915#2575]) -> [SKIP][303] ([Intel XE#307])
>     [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-466/igt@kms_content_protection@dp-mst-lic-type-0.html
>     [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-435/igt@kms_content_protection@dp-mst-lic-type-0.html
>
>    * igt@kms_content_protection@dp-mst-lic-type-1:
>      - shard-bmg:          [SKIP][304] ([Intel XE#2423]) -> [SKIP][305] ([Intel XE#2390])
>     [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-1/igt@kms_content_protection@dp-mst-lic-type-1.html
>     [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-7/igt@kms_content_protection@dp-mst-lic-type-1.html
>
>    * igt@kms_content_protection@dp-mst-type-1:
>      - shard-dg2-set2:     [SKIP][306] ([Intel XE#307]) -> [SKIP][307] ([Intel XE#2423] / [i915#2575])
>     [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-436/igt@kms_content_protection@dp-mst-type-1.html
>     [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-466/igt@kms_content_protection@dp-mst-type-1.html
>
>    * igt@kms_content_protection@srm:
>      - shard-bmg:          [SKIP][308] ([Intel XE#2423]) -> [FAIL][309] ([Intel XE#1178])
>     [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-1/igt@kms_content_protection@srm.html
>     [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-7/igt@kms_content_protection@srm.html
>
>    * igt@kms_cursor_crc@cursor-offscreen-256x85:
>      - shard-bmg:          [SKIP][310] ([Intel XE#2320]) -> [SKIP][311] ([Intel XE#2423]) +6 other tests skip
>     [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-256x85.html
>     [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-256x85.html
>
>    * igt@kms_cursor_crc@cursor-random-512x170:
>      - shard-bmg:          [SKIP][312] ([Intel XE#2423]) -> [SKIP][313] ([Intel XE#2321]) +3 other tests skip
>     [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-1/igt@kms_cursor_crc@cursor-random-512x170.html
>     [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-5/igt@kms_cursor_crc@cursor-random-512x170.html
>
>    * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
>      - shard-dg2-set2:     [SKIP][314] ([Intel XE#308]) -> [SKIP][315] ([Intel XE#2423] / [i915#2575]) +1 other test skip
>     [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-435/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
>     [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
>
>    * igt@kms_cursor_crc@cursor-sliding-256x85:
>      - shard-bmg:          [SKIP][316] ([Intel XE#2423]) -> [SKIP][317] ([Intel XE#2320]) +3 other tests skip
>     [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-256x85.html
>     [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-256x85.html
>
>    * igt@kms_cursor_crc@cursor-sliding-512x170:
>      - shard-dg2-set2:     [SKIP][318] ([Intel XE#2423] / [i915#2575]) -> [SKIP][319] ([Intel XE#308]) +2 other tests skip
>     [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-512x170.html
>     [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-512x170.html
>
>    * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
>      - shard-bmg:          [SKIP][320] ([Intel XE#2291]) -> [SKIP][321] ([Intel XE#2423]) +1 other test skip
>     [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
>     [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
>
>    * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>      - shard-bmg:          [SKIP][322] ([Intel XE#2423]) -> [SKIP][323] ([Intel XE#2286])
>     [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
>     [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
>
>    * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
>      - shard-bmg:          [SKIP][324] ([Intel XE#2291]) -> [DMESG-WARN][325] ([Intel XE#3468]) +1 other test dmesg-warn
>     [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
>     [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
>
>    * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
>      - shard-bmg:          [SKIP][326] ([Intel XE#2423]) -> [DMESG-WARN][327] ([Intel XE#877]) +1 other test dmesg-warn
>     [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
>     [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
>
>    * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
>      - shard-bmg:          [DMESG-WARN][328] ([Intel XE#3468]) -> [SKIP][329] ([Intel XE#2423]) +3 other tests skip
>     [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
>     [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
>
>    * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>      - shard-dg2-set2:     [SKIP][330] ([Intel XE#323]) -> [SKIP][331] ([Intel XE#2423] / [i915#2575])
>     [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
>     [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
>      - shard-bmg:          [SKIP][332] ([Intel XE#2286]) -> [SKIP][333] ([Intel XE#2423]) +1 other test skip
>     [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
>     [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
>
>    * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
>      - shard-dg2-set2:     [SKIP][334] ([Intel XE#2423] / [i915#2575]) -> [SKIP][335] ([Intel XE#323])
>     [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-466/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
>     [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
>
>    * igt@kms_cursor_legacy@torture-bo:
>      - shard-bmg:          [SKIP][336] ([Intel XE#2423]) -> [DMESG-WARN][337] ([Intel XE#3468] / [Intel XE#877])
>     [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-1/igt@kms_cursor_legacy@torture-bo.html
>     [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-6/igt@kms_cursor_legacy@torture-bo.html
>
>    * igt@kms_draw_crc@draw-method-blt:
>      - shard-bmg:          [SKIP][338] ([Intel XE#2136]) -> [INCOMPLETE][339] ([Intel XE#1727] / [Intel XE#3468])
>     [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-1/igt@kms_draw_crc@draw-method-blt.html
>     [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-3/igt@kms_draw_crc@draw-method-blt.html
>
>    * igt@kms_dsc@dsc-fractional-bpp:
>      - shard-bmg:          [SKIP][340] ([Intel XE#2136]) -> [SKIP][341] ([Intel XE#2244]) +1 other test skip
>     [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-1/igt@kms_dsc@dsc-fractional-bpp.html
>     [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-7/igt@kms_dsc@dsc-fractional-bpp.html
>
>    * igt@kms_dsc@dsc-with-bpc:
>      - shard-dg2-set2:     [SKIP][342] ([Intel XE#2136]) -> [SKIP][343] ([Intel XE#455]) +3 other tests skip
>     [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-466/igt@kms_dsc@dsc-with-bpc.html
>     [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-435/igt@kms_dsc@dsc-with-bpc.html
>
>    * igt@kms_dsc@dsc-with-formats:
>      - shard-bmg:          [SKIP][344] ([Intel XE#2244]) -> [SKIP][345] ([Intel XE#2136])
>     [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-7/igt@kms_dsc@dsc-with-formats.html
>     [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-1/igt@kms_dsc@dsc-with-formats.html
>
>    * igt@kms_fbcon_fbt@psr:
>      - shard-bmg:          [SKIP][346] ([Intel XE#776]) -> [SKIP][347] ([Intel XE#2136])
>     [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-3/igt@kms_fbcon_fbt@psr.html
>     [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-1/igt@kms_fbcon_fbt@psr.html
>
>    * igt@kms_fbcon_fbt@psr-suspend:
>      - shard-dg2-set2:     [SKIP][348] ([Intel XE#776]) -> [SKIP][349] ([Intel XE#2136])
>     [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-435/igt@kms_fbcon_fbt@psr-suspend.html
>     [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-466/igt@kms_fbcon_fbt@psr-suspend.html
>
>    * igt@kms_feature_discovery@chamelium:
>      - shard-dg2-set2:     [SKIP][350] ([Intel XE#701]) -> [SKIP][351] ([Intel XE#2423] / [i915#2575])
>     [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-436/igt@kms_feature_discovery@chamelium.html
>     [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-434/igt@kms_feature_discovery@chamelium.html
>
>    * igt@kms_flip@2x-flip-vs-expired-vblank:
>      - shard-bmg:          [FAIL][352] ([Intel XE#2882]) -> [SKIP][353] ([Intel XE#2423])
>     [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank.html
>     [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank.html
>
>    * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
>      - shard-bmg:          [SKIP][354] ([Intel XE#2423]) -> [FAIL][355] ([Intel XE#2882])
>     [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
>     [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
>
>    * igt@kms_flip@2x-flip-vs-panning:
>      - shard-bmg:          [SKIP][356] ([Intel XE#2316]) -> [SKIP][357] ([Intel XE#2423])
>     [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning.html
>     [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-1/igt@kms_flip@2x-flip-vs-panning.html
>
>    * igt@kms_flip@2x-flip-vs-rmfb:
>      - shard-bmg:          [DMESG-WARN][358] ([Intel XE#2955] / [Intel XE#3468]) -> [SKIP][359] ([Intel XE#2423])
>     [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-2/igt@kms_flip@2x-flip-vs-rmfb.html
>     [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-1/igt@kms_flip@2x-flip-vs-rmfb.html
>
>    * igt@kms_flip@flip-vs-panning-interruptible:
>      - shard-bmg:          [DMESG-WARN][360] ([Intel XE#2705] / [Intel XE#2955] / [Intel XE#3468]) -> [SKIP][361] ([Intel XE#2423])
>     [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-2/igt@kms_flip@flip-vs-panning-interruptible.html
>     [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-1/igt@kms_flip@flip-vs-panning-interruptible.html
>
>    * igt@kms_flip@flip-vs-suspend:
>      - shard-bmg:          [SKIP][362] ([Intel XE#2423]) -> [DMESG-FAIL][363] ([Intel XE#1727] / [Intel XE#3468])
>     [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-1/igt@kms_flip@flip-vs-suspend.html
>     [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-2/igt@kms_flip@flip-vs-suspend.html
>
>    * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
>      - shard-bmg:          [SKIP][364] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][365] ([Intel XE#2136]) +4 other tests skip
>     [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html
>     [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html
>
>    * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
>      - shard-bmg:          [SKIP][366] ([Intel XE#2136]) -> [SKIP][367] ([Intel XE#2293] / [Intel XE#2380]) +5 other tests skip
>     [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
>     [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
>
>    * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
>      - shard-dg2-set2:     [SKIP][368] ([Intel XE#455]) -> [SKIP][369] ([Intel XE#2136] / [Intel XE#2351])
>     [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
>     [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
>
>    * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
>      - shard-dg2-set2:     [SKIP][370] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][371] ([Intel XE#455]) +1 other test skip
>     [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
>     [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
>
>    * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
>      - shard-dg2-set2:     [SKIP][372] ([Intel XE#2136]) -> [DMESG-WARN][373] ([Intel XE#1727])
>     [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
>     [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
>
>    * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
>      - shard-dg2-set2:     [SKIP][374] ([Intel XE#455]) -> [SKIP][375] ([Intel XE#2136]) +4 other tests skip
>     [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html
>     [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html
>
>    * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move:
>      - shard-dg2-set2:     [SKIP][376] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][377] ([Intel XE#651]) +7 other tests skip
>     [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html
>     [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html
>
>    * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render:
>      - shard-bmg:          [SKIP][378] ([Intel XE#2311]) -> [SKIP][379] ([Intel XE#2136]) +31 other tests skip
>     [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html
>     [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html
>
>    * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc:
>      - shard-dg2-set2:     [SKIP][380] ([Intel XE#651]) -> [SKIP][381] ([Intel XE#2136]) +18 other tests skip
>     [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc.html
>     [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc.html
>
>    * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
>      - shard-bmg:          [SKIP][382] ([Intel XE#2136]) -> [SKIP][383] ([Intel XE#2311]) +35 other tests skip
>     [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html
>     [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html
>
>    * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:
>      - shard-dg2-set2:     [SKIP][384] ([Intel XE#2136]) -> [SKIP][385] ([Intel XE#651]) +20 other tests skip
>     [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html
>     [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html
>
>    * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
>      - shard-bmg:          [SKIP][386] ([Intel XE#2312]) -> [SKIP][387] ([Intel XE#2136]) +10 other tests skip
>     [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
>     [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
>
>    * igt@kms_frontbuffer_tracking@drrs-suspend:
>      - shard-dg2-set2:     [SKIP][388] ([Intel XE#651]) -> [SKIP][389] ([Intel XE#2136] / [Intel XE#2351]) +7 other tests skip
>     [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-suspend.html
>     [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-suspend.html
>
>    * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
>      - shard-bmg:          [SKIP][390] ([Intel XE#2136]) -> [FAIL][391] ([Intel XE#2333]) +10 other tests fail
>     [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html
>     [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html
>
>    * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:
>      - shard-bmg:          [SKIP][392] ([Intel XE#2312]) -> [FAIL][393] ([Intel XE#2333]) +2 other tests fail
>     [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html
>     [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html
>
>    * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:
>      - shard-bmg:          [DMESG-FAIL][394] ([Intel XE#3468]) -> [SKIP][395] ([Intel XE#2136])
>     [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html
>     [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html
>
>    * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc:
>      - shard-bmg:          [SKIP][396] ([Intel XE#2136]) -> [DMESG-FAIL][397] ([Intel XE#3468]) +3 other tests dmesg-fail
>     [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
>     [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
>
>    * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
>      - shard-bmg:          [FAIL][398] ([Intel XE#2333]) -> [DMESG-FAIL][399] ([Intel XE#3468]) +5 other tests dmesg-fail
>     [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
>     [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
>
>    * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
>      - shard-bmg:          [FAIL][400] ([Intel XE#2333]) -> [SKIP][401] ([Intel XE#2136]) +15 other tests skip
>     [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
>     [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
>
>    * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:
>      - shard-bmg:          [DMESG-FAIL][402] ([Intel XE#3468]) -> [FAIL][403] ([Intel XE#2333])
>     [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html
>     [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html
>
>    * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:
>      - shard-bmg:          [SKIP][404] ([Intel XE#2312]) -> [SKIP][405] ([Intel XE#2311]) +6 other tests skip
>     [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html
>     [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html
>
>    * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
>      - shard-dg2-set2:     [SKIP][406] ([Intel XE#658]) -> [SKIP][407] ([Intel XE#2136] / [Intel XE#2351])
>     [406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
>     [407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
>      - shard-bmg:          [SKIP][408] ([Intel XE#2136]) -> [SKIP][409] ([Intel XE#2352]) +1 other test skip
>     [408]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
>     [409]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
>
>    * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render:
>      - shard-dg2-set2:     [SKIP][410] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][411] ([Intel XE#653]) +10 other tests skip
>     [410]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render.html
>     [411]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render.html
>
>    * igt@kms_frontbuffer_tracking@fbcpsr-2p-rte:
>      - shard-bmg:          [SKIP][412] ([Intel XE#2312]) -> [SKIP][413] ([Intel XE#2313]) +4 other tests skip
>     [412]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html
>     [413]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html
>
>    * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:
>      - shard-bmg:          [SKIP][414] ([Intel XE#2136]) -> [SKIP][415] ([Intel XE#2313]) +34 other tests skip
>     [414]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html
>     [415]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html
>
>    * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
>      - shard-dg2-set2:     [SKIP][416] ([Intel XE#653]) -> [SKIP][417] ([Intel XE#2136] / [Intel XE#2351]) +4 other tests skip
>     [416]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html
>     [417]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html
>
>    * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
>      - shard-dg2-set2:     [SKIP][418] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][419] ([Intel XE#658])
>     [418]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
>     [419]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
>
>    * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
>      - shard-dg2-set2:     [SKIP][420] ([Intel XE#2136]) -> [SKIP][421] ([Intel XE#653]) +26 other tests skip
>     [420]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
>     [421]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
>
>    * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc:
>      - shard-bmg:          [SKIP][422] ([Intel XE#2313]) -> [SKIP][423] ([Intel XE#2136]) +31 other tests skip
>     [422]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html
>     [423]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html
>
>    * igt@kms_frontbuffer_tracking@psr-slowdraw:
>      - shard-dg2-set2:     [SKIP][424] ([Intel XE#653]) -> [SKIP][425] ([Intel XE#2136]) +28 other tests skip
>     [424]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-slowdraw.html
>     [425]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-slowdraw.html
>
>    * igt@kms_getfb@getfb-reject-ccs:
>      - shard-bmg:          [SKIP][426] ([Intel XE#2423]) -> [SKIP][427] ([Intel XE#2502])
>     [426]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-1/igt@kms_getfb@getfb-reject-ccs.html
>     [427]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-3/igt@kms_getfb@getfb-reject-ccs.html
>
>    * igt@kms_hdr@brightness-with-hdr:
>      - shard-bmg:          [SKIP][428] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][429] ([Intel XE#2423])
>     [428]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html
>     [429]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html
>
>    * igt@kms_joiner@basic-force-ultra-joiner:
>      - shard-bmg:          [SKIP][430] ([Intel XE#2136]) -> [SKIP][431] ([Intel XE#2934])
>     [430]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-1/igt@kms_joiner@basic-force-ultra-joiner.html
>     [431]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-5/igt@kms_joiner@basic-force-ultra-joiner.html
>
>    * igt@kms_joiner@basic-ultra-joiner:
>      - shard-bmg:          [SKIP][432] ([Intel XE#2927]) -> [SKIP][433] ([Intel XE#2136])
>     [432]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-6/igt@kms_joiner@basic-ultra-joiner.html
>     [433]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-1/igt@kms_joiner@basic-ultra-joiner.html
>
>    * igt@kms_joiner@invalid-modeset-big-joiner:
>      - shard-dg2-set2:     [SKIP][434] ([Intel XE#346]) -> [SKIP][435] ([Intel XE#2136]) +1 other test skip
>     [434]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-435/igt@kms_joiner@invalid-modeset-big-joiner.html
>     [435]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-434/igt@kms_joiner@invalid-modeset-big-joiner.html
>
>    * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
>      - shard-bmg:          [SKIP][436] ([Intel XE#2934]) -> [SKIP][437] ([Intel XE#2136])
>     [436]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-2/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
>     [437]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
>
>    * igt@kms_lease@lessee-list:
>      - shard-dg2-set2:     [SKIP][438] ([Intel XE#2423] / [i915#2575]) -> [DMESG-WARN][439] ([Intel XE#1727])
>     [438]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-466/igt@kms_lease@lessee-list.html
>     [439]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-435/igt@kms_lease@lessee-list.html
>
>    * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>      - shard-bmg:          [SKIP][440] ([Intel XE#2501]) -> [SKIP][441] ([Intel XE#2423])
>     [440]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-3/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
>     [441]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
>
>    * igt@kms_plane_lowres@tiling-yf:
>      - shard-bmg:          [SKIP][442] ([Intel XE#2423]) -> [SKIP][443] ([Intel XE#2393])
>     [442]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-1/igt@kms_plane_lowres@tiling-yf.html
>     [443]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-3/igt@kms_plane_lowres@tiling-yf.html
>
>    * igt@kms_plane_multiple@tiling-y:
>      - shard-bmg:          [SKIP][444] ([Intel XE#2493]) -> [SKIP][445] ([Intel XE#2423])
>     [444]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-3/igt@kms_plane_multiple@tiling-y.html
>     [445]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-1/igt@kms_plane_multiple@tiling-y.html
>
>    * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
>      - shard-dg2-set2:     [SKIP][446] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][447] ([Intel XE#2423] / [i915#2575])
>     [446]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html
>     [447]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html
>
>    * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation:
>      - shard-dg2-set2:     [DMESG-WARN][448] ([Intel XE#1727]) -> [SKIP][449] ([Intel XE#2423] / [i915#2575])
>     [448]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-435/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation.html
>     [449]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-466/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation.html
>
>    * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
>      - shard-bmg:          [SKIP][450] ([Intel XE#2763]) -> [SKIP][451] ([Intel XE#2423]) +1 other test skip
>     [450]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
>     [451]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
>
>    * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
>      - shard-bmg:          [SKIP][452] ([Intel XE#2423]) -> [SKIP][453] ([Intel XE#2763]) +1 other test skip
>     [452]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html
>     [453]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html
>
>    * igt@kms_pm_backlight@bad-brightness:
>      - shard-bmg:          [SKIP][454] ([Intel XE#870]) -> [SKIP][455] ([Intel XE#2136]) +1 other test skip
>     [454]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-7/igt@kms_pm_backlight@bad-brightness.html
>     [455]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-1/igt@kms_pm_backlight@bad-brightness.html
>
>    * igt@kms_pm_backlight@brightness-with-dpms:
>      - shard-bmg:          [SKIP][456] ([Intel XE#2938]) -> [SKIP][457] ([Intel XE#2136])
>     [456]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-3/igt@kms_pm_backlight@brightness-with-dpms.html
>     [457]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-1/igt@kms_pm_backlight@brightness-with-dpms.html
>
>    * igt@kms_pm_backlight@fade-with-suspend:
>      - shard-dg2-set2:     [SKIP][458] ([Intel XE#870]) -> [SKIP][459] ([Intel XE#2136]) +3 other tests skip
>     [458]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-436/igt@kms_pm_backlight@fade-with-suspend.html
>     [459]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-466/igt@kms_pm_backlight@fade-with-suspend.html
>
>    * igt@kms_pm_dc@dc3co-vpb-simulation:
>      - shard-dg2-set2:     [SKIP][460] ([Intel XE#1122]) -> [SKIP][461] ([Intel XE#2136] / [Intel XE#2351])
>     [460]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-435/igt@kms_pm_dc@dc3co-vpb-simulation.html
>     [461]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-466/igt@kms_pm_dc@dc3co-vpb-simulation.html
>      - shard-bmg:          [SKIP][462] ([Intel XE#2136]) -> [SKIP][463] ([Intel XE#2391])
>     [462]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-1/igt@kms_pm_dc@dc3co-vpb-simulation.html
>     [463]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-2/igt@kms_pm_dc@dc3co-vpb-simulation.html
>
>    * igt@kms_pm_dc@dc5-retention-flops:
>      - shard-dg2-set2:     [SKIP][464] ([Intel XE#2136]) -> [SKIP][465] ([Intel XE#3309])
>     [464]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-434/igt@kms_pm_dc@dc5-retention-flops.html
>     [465]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-436/igt@kms_pm_dc@dc5-retention-flops.html
>      - shard-bmg:          [SKIP][466] ([Intel XE#3309]) -> [SKIP][467] ([Intel XE#2136])
>     [466]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-5/igt@kms_pm_dc@dc5-retention-flops.html
>     [467]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-1/igt@kms_pm_dc@dc5-retention-flops.html
>
>    * igt@kms_pm_dc@dc6-dpms:
>      - shard-dg2-set2:     [SKIP][468] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][469] ([Intel XE#908])
>     [468]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-434/igt@kms_pm_dc@dc6-dpms.html
>     [469]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-435/igt@kms_pm_dc@dc6-dpms.html
>
>    * igt@kms_pm_dc@dc6-psr:
>      - shard-bmg:          [SKIP][470] ([Intel XE#2136]) -> [SKIP][471] ([Intel XE#2392]) +1 other test skip
>     [470]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-1/igt@kms_pm_dc@dc6-psr.html
>     [471]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-5/igt@kms_pm_dc@dc6-psr.html
>      - shard-dg2-set2:     [SKIP][472] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][473] ([Intel XE#1129])
>     [472]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-466/igt@kms_pm_dc@dc6-psr.html
>     [473]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-436/igt@kms_pm_dc@dc6-psr.html
>
>    * igt@kms_pm_dc@deep-pkgc:
>      - shard-bmg:          [SKIP][474] ([Intel XE#2505]) -> [SKIP][475] ([Intel XE#2136])
>     [474]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-6/igt@kms_pm_dc@deep-pkgc.html
>     [475]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-1/igt@kms_pm_dc@deep-pkgc.html
>
>    * igt@kms_pm_lpsp@kms-lpsp:
>      - shard-dg2-set2:     [SKIP][476] ([Intel XE#2136]) -> [FAIL][477] ([Intel XE#3527])
>     [476]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-466/igt@kms_pm_lpsp@kms-lpsp.html
>     [477]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-435/igt@kms_pm_lpsp@kms-lpsp.html
>
>    * igt@kms_pm_rpm@dpms-lpsp:
>      - shard-bmg:          [SKIP][478] ([Intel XE#1439] / [Intel XE#3141]) -> [SKIP][479] ([Intel XE#2446])
>     [478]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-7/igt@kms_pm_rpm@dpms-lpsp.html
>     [479]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-1/igt@kms_pm_rpm@dpms-lpsp.html
>
>    * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
>      - shard-dg2-set2:     [SKIP][480] ([Intel XE#2446]) -> [DMESG-WARN][481] ([Intel XE#1727] / [Intel XE#3468])
>     [480]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-434/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
>     [481]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-436/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
>
>    * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
>      - shard-bmg:          [SKIP][482] ([Intel XE#2446]) -> [DMESG-WARN][483] ([Intel XE#1727] / [Intel XE#3468])
>     [482]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
>     [483]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-3/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
>
>    * igt@kms_pm_rpm@universal-planes:
>      - shard-dg2-set2:     [SKIP][484] ([Intel XE#2446]) -> [DMESG-WARN][485] ([Intel XE#1727] / [Intel XE#2042] / [Intel XE#3468])
>     [484]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-466/igt@kms_pm_rpm@universal-planes.html
>     [485]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-435/igt@kms_pm_rpm@universal-planes.html
>
>    * igt@kms_pm_rpm@universal-planes-dpms:
>      - shard-dg2-set2:     [SKIP][486] ([Intel XE#2446]) -> [DMESG-WARN][487] ([Intel XE#2042] / [Intel XE#3468])
>     [486]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-434/igt@kms_pm_rpm@universal-planes-dpms.html
>     [487]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-436/igt@kms_pm_rpm@universal-planes-dpms.html
>
>    * igt@kms_pm_rpm@universal-planes@plane-50:
>      - shard-bmg:          [DMESG-WARN][488] ([Intel XE#3468]) -> [DMESG-WARN][489] ([Intel XE#1727] / [Intel XE#3468]) +1 other test dmesg-warn
>     [488]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-6/igt@kms_pm_rpm@universal-planes@plane-50.html
>     [489]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-5/igt@kms_pm_rpm@universal-planes@plane-50.html
>
>    * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
>      - shard-dg2-set2:     [SKIP][490] ([Intel XE#1489]) -> [SKIP][491] ([Intel XE#2136]) +8 other tests skip
>     [490]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html
>     [491]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-466/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html
>
>    * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
>      - shard-dg2-set2:     [SKIP][492] ([Intel XE#2136]) -> [SKIP][493] ([Intel XE#1489]) +9 other tests skip
>     [492]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-434/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html
>     [493]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-435/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html
>
>    * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
>      - shard-bmg:          [SKIP][494] ([Intel XE#1489]) -> [SKIP][495] ([Intel XE#2136]) +9 other tests skip
>     [494]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-2/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html
>     [495]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-1/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html
>
>    * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
>      - shard-bmg:          [SKIP][496] ([Intel XE#2136]) -> [SKIP][497] ([Intel XE#1489]) +9 other tests skip
>     [496]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-1/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html
>     [497]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-6/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html
>
>    * igt@kms_psr2_su@page_flip-nv12:
>      - shard-bmg:          [SKIP][498] ([Intel XE#2136]) -> [SKIP][499] ([Intel XE#2387])
>     [498]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-1/igt@kms_psr2_su@page_flip-nv12.html
>     [499]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-7/igt@kms_psr2_su@page_flip-nv12.html
>
>    * igt@kms_psr2_su@page_flip-p010:
>      - shard-bmg:          [SKIP][500] ([Intel XE#2387]) -> [SKIP][501] ([Intel XE#2136])
>     [500]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-6/igt@kms_psr2_su@page_flip-p010.html
>     [501]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-1/igt@kms_psr2_su@page_flip-p010.html
>
>    * igt@kms_psr@fbc-pr-no-drrs:
>      - shard-dg2-set2:     [SKIP][502] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][503] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
>     [502]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-466/igt@kms_psr@fbc-pr-no-drrs.html
>     [503]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-435/igt@kms_psr@fbc-pr-no-drrs.html
>
>    * igt@kms_psr@fbc-psr2-cursor-render:
>      - shard-bmg:          [SKIP][504] ([Intel XE#2136]) -> [SKIP][505] ([Intel XE#2234] / [Intel XE#2850]) +21 other tests skip
>     [504]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-1/igt@kms_psr@fbc-psr2-cursor-render.html
>     [505]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-7/igt@kms_psr@fbc-psr2-cursor-render.html
>
>    * igt@kms_psr@fbc-psr2-dpms:
>      - shard-dg2-set2:     [SKIP][506] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][507] ([Intel XE#2136]) +11 other tests skip
>     [506]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-436/igt@kms_psr@fbc-psr2-dpms.html
>     [507]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-434/igt@kms_psr@fbc-psr2-dpms.html
>
>    * igt@kms_psr@fbc-psr2-primary-render:
>      - shard-dg2-set2:     [SKIP][508] ([Intel XE#2136]) -> [SKIP][509] ([Intel XE#2850] / [Intel XE#929]) +14 other tests skip
>     [508]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-434/igt@kms_psr@fbc-psr2-primary-render.html
>     [509]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-435/igt@kms_psr@fbc-psr2-primary-render.html
>
>    * igt@kms_psr@psr-basic:
>      - shard-bmg:          [SKIP][510] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][511] ([Intel XE#2136]) +15 other tests skip
>     [510]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-3/igt@kms_psr@psr-basic.html
>     [511]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-1/igt@kms_psr@psr-basic.html
>
>    * igt@kms_psr@psr-dpms:
>      - shard-dg2-set2:     [SKIP][512] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][513] ([Intel XE#2136] / [Intel XE#2351]) +6 other tests skip
>     [512]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-436/igt@kms_psr@psr-dpms.html
>     [513]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-466/igt@kms_psr@psr-dpms.html
>
>    * igt@kms_psr@psr-primary-page-flip:
>      - shard-dg2-set2:     [SKIP][514] ([Intel XE#2351]) -> [SKIP][515] ([Intel XE#2850] / [Intel XE#929])
>     [514]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-434/igt@kms_psr@psr-primary-page-flip.html
>     [515]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-435/igt@kms_psr@psr-primary-page-flip.html
>
>    * igt@kms_rotation_crc@bad-pixel-format:
>      - shard-bmg:          [SKIP][516] ([Intel XE#2423]) -> [SKIP][517] ([Intel XE#3414]) +2 other tests skip
>     [516]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-1/igt@kms_rotation_crc@bad-pixel-format.html
>     [517]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-6/igt@kms_rotation_crc@bad-pixel-format.html
>
>    * igt@kms_rotation_crc@multiplane-rotation:
>      - shard-bmg:          [SKIP][518] ([Intel XE#2423]) -> [DMESG-FAIL][519] ([Intel XE#3468]) +3 other tests dmesg-fail
>     [518]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-1/igt@kms_rotation_crc@multiplane-rotation.html
>     [519]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-3/igt@kms_rotation_crc@multiplane-rotation.html
>
>    * igt@kms_rotation_crc@primary-rotation-270:
>      - shard-dg2-set2:     [SKIP][520] ([Intel XE#2423] / [i915#2575]) -> [SKIP][521] ([Intel XE#3414]) +1 other test skip
>     [520]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-466/igt@kms_rotation_crc@primary-rotation-270.html
>     [521]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-436/igt@kms_rotation_crc@primary-rotation-270.html
>
>    * igt@kms_rotation_crc@primary-rotation-90:
>      - shard-bmg:          [SKIP][522] ([Intel XE#3414]) -> [SKIP][523] ([Intel XE#2423])
>     [522]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-6/igt@kms_rotation_crc@primary-rotation-90.html
>     [523]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-1/igt@kms_rotation_crc@primary-rotation-90.html
>
>    * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>      - shard-bmg:          [SKIP][524] ([Intel XE#2330]) -> [SKIP][525] ([Intel XE#2423])
>     [524]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
>     [525]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
>
>    * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
>      - shard-dg2-set2:     [SKIP][526] ([Intel XE#3414]) -> [SKIP][527] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
>     [526]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-435/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
>     [527]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
>
>    * igt@kms_scaling_modes@scaling-mode-full-aspect:
>      - shard-bmg:          [SKIP][528] ([Intel XE#2413]) -> [SKIP][529] ([Intel XE#2423])
>     [528]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-6/igt@kms_scaling_modes@scaling-mode-full-aspect.html
>     [529]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-full-aspect.html
>
>    * igt@kms_tiled_display@basic-test-pattern:
>      - shard-dg2-set2:     [SKIP][530] ([Intel XE#2423] / [i915#2575]) -> [FAIL][531] ([Intel XE#1729])
>     [530]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html
>     [531]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html
>
>    * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>      - shard-bmg:          [SKIP][532] ([Intel XE#2426]) -> [SKIP][533] ([Intel XE#2509])
>     [532]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>     [533]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>
>    * igt@kms_tv_load_detect@load-detect:
>      - shard-bmg:          [SKIP][534] ([Intel XE#2450]) -> [SKIP][535] ([Intel XE#2423])
>     [534]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-4/igt@kms_tv_load_detect@load-detect.html
>     [535]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-1/igt@kms_tv_load_detect@load-detect.html
>
>    * igt@kms_vblank@query-idle:
>      - shard-bmg:          [DMESG-FAIL][536] ([Intel XE#3468]) -> [SKIP][537] ([Intel XE#2423])
>     [536]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-3/igt@kms_vblank@query-idle.html
>     [537]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-1/igt@kms_vblank@query-idle.html
>
>    * igt@kms_vrr@cmrr:
>      - shard-bmg:          [SKIP][538] ([Intel XE#2168]) -> [SKIP][539] ([Intel XE#2423])
>     [538]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-3/igt@kms_vrr@cmrr.html
>     [539]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-1/igt@kms_vrr@cmrr.html
>
>    * igt@kms_vrr@flip-dpms:
>      - shard-dg2-set2:     [SKIP][540] ([Intel XE#2423] / [i915#2575]) -> [SKIP][541] ([Intel XE#455]) +2 other tests skip
>     [540]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-434/igt@kms_vrr@flip-dpms.html
>     [541]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-435/igt@kms_vrr@flip-dpms.html
>
>    * igt@kms_vrr@flip-suspend:
>      - shard-bmg:          [SKIP][542] ([Intel XE#2423]) -> [SKIP][543] ([Intel XE#1499]) +2 other tests skip
>     [542]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-1/igt@kms_vrr@flip-suspend.html
>     [543]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-3/igt@kms_vrr@flip-suspend.html
>
>    * igt@kms_vrr@flipline:
>      - shard-dg2-set2:     [SKIP][544] ([Intel XE#455]) -> [SKIP][545] ([Intel XE#2423] / [i915#2575]) +5 other tests skip
>     [544]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-436/igt@kms_vrr@flipline.html
>     [545]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-466/igt@kms_vrr@flipline.html
>
>    * igt@kms_vrr@lobf:
>      - shard-dg2-set2:     [SKIP][546] ([Intel XE#2168]) -> [SKIP][547] ([Intel XE#2423] / [i915#2575])
>     [546]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-436/igt@kms_vrr@lobf.html
>     [547]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-434/igt@kms_vrr@lobf.html
>
>    * igt@kms_vrr@max-min:
>      - shard-bmg:          [SKIP][548] ([Intel XE#1499]) -> [SKIP][549] ([Intel XE#2423]) +2 other tests skip
>     [548]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-2/igt@kms_vrr@max-min.html
>     [549]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-1/igt@kms_vrr@max-min.html
>
>    * igt@kms_writeback@writeback-check-output-xrgb2101010:
>      - shard-bmg:          [SKIP][550] ([Intel XE#756]) -> [SKIP][551] ([Intel XE#2423])
>     [550]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-2/igt@kms_writeback@writeback-check-output-xrgb2101010.html
>     [551]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-1/igt@kms_writeback@writeback-check-output-xrgb2101010.html
>
>    * igt@kms_writeback@writeback-fb-id:
>      - shard-dg2-set2:     [SKIP][552] ([Intel XE#756]) -> [SKIP][553] ([Intel XE#2423] / [i915#2575]) +1 other test skip
>     [552]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-436/igt@kms_writeback@writeback-fb-id.html
>     [553]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-466/igt@kms_writeback@writeback-fb-id.html
>
>    * igt@kms_writeback@writeback-fb-id-xrgb2101010:
>      - shard-dg2-set2:     [SKIP][554] ([Intel XE#2423] / [i915#2575]) -> [SKIP][555] ([Intel XE#756]) +1 other test skip
>     [554]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-434/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
>     [555]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-436/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
>
>    * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
>      - shard-dg2-set2:     [SKIP][556] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][557] ([Intel XE#2423] / [i915#2575])
>     [556]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-435/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
>     [557]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-466/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
>      - shard-bmg:          [SKIP][558] ([Intel XE#2423]) -> [SKIP][559] ([Intel XE#1091] / [Intel XE#2849]) +1 other test skip
>     [558]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-1/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
>     [559]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-4/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
>
>    * igt@xe_compute_preempt@compute-preempt:
>      - shard-dg2-set2:     [SKIP][560] ([Intel XE#1130]) -> [SKIP][561] ([Intel XE#1280] / [Intel XE#455])
>     [560]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-434/igt@xe_compute_preempt@compute-preempt.html
>     [561]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-436/igt@xe_compute_preempt@compute-preempt.html
>
>    * igt@xe_copy_basic@mem-copy-linear-0x369:
>      - shard-dg2-set2:     [SKIP][562] ([Intel XE#1130]) -> [SKIP][563] ([Intel XE#1123])
>     [562]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0x369.html
>     [563]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0x369.html
>
>    * igt@xe_eudebug@basic-client-th:
>      - shard-dg2-set2:     [SKIP][564] ([Intel XE#2905]) -> [SKIP][565] ([Intel XE#1130]) +9 other tests skip
>     [564]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-436/igt@xe_eudebug@basic-client-th.html
>     [565]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-434/igt@xe_eudebug@basic-client-th.html
>
>    * igt@xe_eudebug@basic-close:
>      - shard-dg2-set2:     [SKIP][566] ([Intel XE#1130]) -> [SKIP][567] ([Intel XE#2905]) +10 other tests skip
>     [566]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-434/igt@xe_eudebug@basic-close.html
>     [567]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-436/igt@xe_eudebug@basic-close.html
>
>    * igt@xe_eudebug@basic-vm-access-userptr:
>      - shard-bmg:          [SKIP][568] ([Intel XE#1130]) -> [SKIP][569] ([Intel XE#2905]) +12 other tests skip
>     [568]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-1/igt@xe_eudebug@basic-vm-access-userptr.html
>     [569]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-5/igt@xe_eudebug@basic-vm-access-userptr.html
>
>    * igt@xe_eudebug@multigpu-basic-client:
>      - shard-bmg:          [SKIP][570] ([Intel XE#2905]) -> [SKIP][571] ([Intel XE#1130]) +13 other tests skip
>     [570]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-3/igt@xe_eudebug@multigpu-basic-client.html
>     [571]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-1/igt@xe_eudebug@multigpu-basic-client.html
>
>    * igt@xe_evict@evict-beng-large-multi-vm-cm:
>      - shard-dg2-set2:     [SKIP][572] ([Intel XE#1130]) -> [FAIL][573] ([Intel XE#1600])
>     [572]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-434/igt@xe_evict@evict-beng-large-multi-vm-cm.html
>     [573]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-435/igt@xe_evict@evict-beng-large-multi-vm-cm.html
>
>    * igt@xe_evict@evict-beng-mixed-many-threads-large:
>      - shard-bmg:          [SKIP][574] ([Intel XE#1130]) -> [TIMEOUT][575] ([Intel XE#1473])
>     [574]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-1/igt@xe_evict@evict-beng-mixed-many-threads-large.html
>     [575]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-7/igt@xe_evict@evict-beng-mixed-many-threads-large.html
>
>    * igt@xe_evict@evict-beng-mixed-many-threads-small:
>      - shard-dg2-set2:     [TIMEOUT][576] ([Intel XE#1473] / [Intel XE#402]) -> [SKIP][577] ([Intel XE#1130])
>     [576]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-small.html
>     [577]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html
>
>    * igt@xe_evict@evict-large-multi-vm-cm:
>      - shard-bmg:          [DMESG-FAIL][578] ([Intel XE#3468]) -> [FAIL][579] ([Intel XE#2364])
>     [578]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-2/igt@xe_evict@evict-large-multi-vm-cm.html
>     [579]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-6/igt@xe_evict@evict-large-multi-vm-cm.html
>
>    * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:
>      - shard-bmg:          [SKIP][580] ([Intel XE#1130]) -> [SKIP][581] ([Intel XE#2322]) +9 other tests skip
>     [580]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html
>     [581]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html
>
>    * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
>      - shard-bmg:          [SKIP][582] ([Intel XE#2322]) -> [SKIP][583] ([Intel XE#1130]) +10 other tests skip
>     [582]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-3/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html
>     [583]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html
>
>    * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
>      - shard-dg2-set2:     [SKIP][584] ([Intel XE#1130]) -> [SKIP][585] ([Intel XE#288]) +20 other tests skip
>     [584]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-434/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
>     [585]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-436/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
>
>    * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
>      - shard-dg2-set2:     [SKIP][586] ([Intel XE#288]) -> [SKIP][587] ([Intel XE#1130]) +22 other tests skip
>     [586]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
>     [587]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
>
>    * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
>      - shard-dg2-set2:     [SKIP][588] ([Intel XE#1130]) -> [SKIP][589] ([Intel XE#2360])
>     [588]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-434/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
>     [589]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-435/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
>
>    * igt@xe_exec_reset@gt-reset:
>      - shard-bmg:          [SKIP][590] ([Intel XE#1130]) -> [DMESG-WARN][591] ([Intel XE#1727] / [Intel XE#3468])
>     [590]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-1/igt@xe_exec_reset@gt-reset.html
>     [591]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-3/igt@xe_exec_reset@gt-reset.html
>
>    * igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate:
>      - shard-bmg:          [DMESG-WARN][592] ([Intel XE#1727]) -> [SKIP][593] ([Intel XE#1130])
>     [592]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-4/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate.html
>     [593]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-1/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate.html
>
>    * igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:
>      - shard-bmg:          [SKIP][594] ([Intel XE#1130]) -> [DMESG-WARN][595] ([Intel XE#3468]) +4 other tests dmesg-warn
>     [594]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html
>     [595]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html
>
>    * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init:
>      - shard-dg2-set2:     [DMESG-WARN][596] ([Intel XE#3343]) -> [SKIP][597] ([Intel XE#1130])
>     [596]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-435/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html
>     [597]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html
>
>    * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:
>      - shard-bmg:          [SKIP][598] ([Intel XE#1130]) -> [DMESG-WARN][599] ([Intel XE#3343] / [Intel XE#3468]) +1 other test dmesg-warn
>     [598]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html
>     [599]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html
>
>    * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:
>      - shard-dg2-set2:     [SKIP][600] ([Intel XE#1130]) -> [DMESG-WARN][601] ([Intel XE#3343]) +3 other tests dmesg-warn
>     [600]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html
>     [601]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-436/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html
>
>    * igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init:
>      - shard-bmg:          [DMESG-WARN][602] ([Intel XE#3467] / [Intel XE#3468]) -> [SKIP][603] ([Intel XE#1130]) +2 other tests skip
>     [602]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html
>     [603]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html
>
>    * igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:
>      - shard-bmg:          [SKIP][604] ([Intel XE#1130]) -> [DMESG-WARN][605] ([Intel XE#3467])
>     [604]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html
>     [605]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html
>
>    * igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:
>      - shard-bmg:          [DMESG-WARN][606] ([Intel XE#3343] / [Intel XE#3468]) -> [DMESG-WARN][607] ([Intel XE#3343])
>     [606]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
>     [607]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
>
>    * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:
>      - shard-dg2-set2:     [SKIP][608] ([Intel XE#1130]) -> [DMESG-WARN][609] ([Intel XE#3467]) +1 other test dmesg-warn
>     [608]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-466/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html
>     [609]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-435/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html
>      - shard-bmg:          [SKIP][610] ([Intel XE#1130]) -> [DMESG-FAIL][611] ([Intel XE#3467] / [Intel XE#3468])
>     [610]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html
>     [611]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-5/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html
>
>    * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:
>      - shard-bmg:          [SKIP][612] ([Intel XE#1130]) -> [DMESG-FAIL][613] ([Intel XE#3467])
>     [612]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html
>     [613]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html
>
>    * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:
>      - shard-bmg:          [FAIL][614] ([Intel XE#3499]) -> [SKIP][615] ([Intel XE#1130]) +1 other test skip
>     [614]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html
>     [615]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html
>
>    * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run:
>      - shard-bmg:          [DMESG-FAIL][616] ([Intel XE#3467] / [Intel XE#3468]) -> [FAIL][617] ([Intel XE#3499])
>     [616]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-5/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html
>     [617]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html
>
>    * igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:
>      - shard-dg2-set2:     [DMESG-WARN][618] ([Intel XE#3467]) -> [SKIP][619] ([Intel XE#1130]) +1 other test skip
>     [618]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-436/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html
>     [619]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-466/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html
>
>    * igt@xe_fault_injection@vm-create-fail-xe_pt_create:
>      - shard-bmg:          [SKIP][620] ([Intel XE#1130]) -> [DMESG-WARN][621] ([Intel XE#3467] / [Intel XE#3468])
>     [620]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-1/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html
>     [621]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-7/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html
>
>    * igt@xe_module_load@reload:
>      - shard-bmg:          [FAIL][622] -> [DMESG-WARN][623] ([Intel XE#3467] / [Intel XE#3468])
>     [622]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-1/igt@xe_module_load@reload.html
>     [623]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-4/igt@xe_module_load@reload.html
>
>    * igt@xe_module_load@reload-no-display:
>      - shard-dg2-set2:     [DMESG-WARN][624] ([Intel XE#3467]) -> [FAIL][625] ([Intel XE#3546])
>     [624]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-435/igt@xe_module_load@reload-no-display.html
>     [625]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-466/igt@xe_module_load@reload-no-display.html
>
>    * igt@xe_module_load@unload:
>      - shard-bmg:          [DMESG-WARN][626] -> [DMESG-WARN][627] ([Intel XE#3467])
>     [626]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-6/igt@xe_module_load@unload.html
>     [627]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-6/igt@xe_module_load@unload.html
>
>    * igt@xe_oa@invalid-oa-metric-set-id:
>      - shard-dg2-set2:     [SKIP][628] ([Intel XE#3573]) -> [SKIP][629] ([Intel XE#1130]) +6 other tests skip
>     [628]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-436/igt@xe_oa@invalid-oa-metric-set-id.html
>     [629]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-434/igt@xe_oa@invalid-oa-metric-set-id.html
>
>    * igt@xe_oa@oa-exponents:
>      - shard-bmg:          [DMESG-WARN][630] ([Intel XE#3468]) -> [SKIP][631] ([Intel XE#1130]) +4 other tests skip
>     [630]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-3/igt@xe_oa@oa-exponents.html
>     [631]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-1/igt@xe_oa@oa-exponents.html
>
>    * igt@xe_oa@oa-tlb-invalidate:
>      - shard-bmg:          [SKIP][632] ([Intel XE#2248]) -> [SKIP][633] ([Intel XE#1130])
>     [632]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-4/igt@xe_oa@oa-tlb-invalidate.html
>     [633]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-1/igt@xe_oa@oa-tlb-invalidate.html
>
>    * igt@xe_oa@syncs-ufence-wait:
>      - shard-dg2-set2:     [SKIP][634] ([Intel XE#1130]) -> [SKIP][635] ([Intel XE#3573]) +8 other tests skip
>     [634]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-466/igt@xe_oa@syncs-ufence-wait.html
>     [635]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-436/igt@xe_oa@syncs-ufence-wait.html
>
>    * igt@xe_pat@display-vs-wb-transient:
>      - shard-dg2-set2:     [SKIP][636] ([Intel XE#1337]) -> [SKIP][637] ([Intel XE#1130])
>     [636]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-436/igt@xe_pat@display-vs-wb-transient.html
>     [637]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-466/igt@xe_pat@display-vs-wb-transient.html
>
>    * igt@xe_pat@pat-index-xelp:
>      - shard-dg2-set2:     [SKIP][638] ([Intel XE#1130]) -> [DMESG-WARN][639] ([Intel XE#1727])
>     [638]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-466/igt@xe_pat@pat-index-xelp.html
>     [639]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-435/igt@xe_pat@pat-index-xelp.html
>
>    * igt@xe_pm@d3cold-basic:
>      - shard-bmg:          [SKIP][640] ([Intel XE#1130]) -> [SKIP][641] ([Intel XE#2284])
>     [640]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-1/igt@xe_pm@d3cold-basic.html
>     [641]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-4/igt@xe_pm@d3cold-basic.html
>
>    * igt@xe_pm@d3cold-mmap-system:
>      - shard-dg2-set2:     [SKIP][642] ([Intel XE#1130]) -> [SKIP][643] ([Intel XE#2284] / [Intel XE#366])
>     [642]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-466/igt@xe_pm@d3cold-mmap-system.html
>     [643]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-435/igt@xe_pm@d3cold-mmap-system.html
>
>    * igt@xe_pm@d3hot-mocs:
>      - shard-bmg:          [DMESG-WARN][644] ([Intel XE#1727] / [Intel XE#3468]) -> [SKIP][645] ([Intel XE#1130]) +1 other test skip
>     [644]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-3/igt@xe_pm@d3hot-mocs.html
>     [645]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-1/igt@xe_pm@d3hot-mocs.html
>
>    * igt@xe_pm@s2idle-d3cold-basic-exec:
>      - shard-bmg:          [SKIP][646] ([Intel XE#2284]) -> [SKIP][647] ([Intel XE#1130]) +1 other test skip
>     [646]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-2/igt@xe_pm@s2idle-d3cold-basic-exec.html
>     [647]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-1/igt@xe_pm@s2idle-d3cold-basic-exec.html
>
>    * igt@xe_pm@s3-d3cold-basic-exec:
>      - shard-dg2-set2:     [SKIP][648] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][649] ([Intel XE#1130]) +1 other test skip
>     [648]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-436/igt@xe_pm@s3-d3cold-basic-exec.html
>     [649]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-466/igt@xe_pm@s3-d3cold-basic-exec.html
>
>    * igt@xe_pm@s4-d3hot-basic-exec:
>      - shard-dg2-set2:     [SKIP][650] ([Intel XE#1130]) -> [DMESG-WARN][651] ([Intel XE#1727] / [Intel XE#3468])
>     [650]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-466/igt@xe_pm@s4-d3hot-basic-exec.html
>     [651]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-436/igt@xe_pm@s4-d3hot-basic-exec.html
>
>    * igt@xe_query@multigpu-query-engines:
>      - shard-dg2-set2:     [SKIP][652] ([Intel XE#944]) -> [SKIP][653] ([Intel XE#1130]) +3 other tests skip
>     [652]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-435/igt@xe_query@multigpu-query-engines.html
>     [653]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-434/igt@xe_query@multigpu-query-engines.html
>
>    * igt@xe_query@multigpu-query-invalid-cs-cycles:
>      - shard-bmg:          [SKIP][654] ([Intel XE#944]) -> [SKIP][655] ([Intel XE#1130]) +3 other tests skip
>     [654]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-4/igt@xe_query@multigpu-query-invalid-cs-cycles.html
>     [655]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-1/igt@xe_query@multigpu-query-invalid-cs-cycles.html
>
>    * igt@xe_query@multigpu-query-invalid-size:
>      - shard-bmg:          [SKIP][656] ([Intel XE#1130]) -> [SKIP][657] ([Intel XE#944]) +1 other test skip
>     [656]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-1/igt@xe_query@multigpu-query-invalid-size.html
>     [657]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-2/igt@xe_query@multigpu-query-invalid-size.html
>
>    * igt@xe_query@multigpu-query-mem-usage:
>      - shard-dg2-set2:     [SKIP][658] ([Intel XE#1130]) -> [SKIP][659] ([Intel XE#944]) +2 other tests skip
>     [658]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-434/igt@xe_query@multigpu-query-mem-usage.html
>     [659]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-435/igt@xe_query@multigpu-query-mem-usage.html
>
>    * igt@xe_tlb@basic-tlb:
>      - shard-dg2-set2:     [FAIL][660] ([Intel XE#2922]) -> [SKIP][661] ([Intel XE#1130])
>     [660]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-436/igt@xe_tlb@basic-tlb.html
>     [661]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-434/igt@xe_tlb@basic-tlb.html
>
>    * igt@xe_wedged@wedged-at-any-timeout:
>      - shard-dg2-set2:     [SKIP][662] ([Intel XE#1130]) -> [ABORT][663] ([Intel XE#3421])
>     [662]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-dg2-434/igt@xe_wedged@wedged-at-any-timeout.html
>     [663]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-dg2-436/igt@xe_wedged@wedged-at-any-timeout.html
>
>    * igt@xe_wedged@wedged-mode-toggle:
>      - shard-bmg:          [DMESG-WARN][664] -> [DMESG-WARN][665] ([Intel XE#3468])
>     [664]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8127/shard-bmg-7/igt@xe_wedged@wedged-mode-toggle.html
>     [665]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/shard-bmg-3/igt@xe_wedged@wedged-mode-toggle.html
>
>    
>    [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
>    [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
>    [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>    [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>    [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>    [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
>    [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
>    [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>    [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
>    [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
>    [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
>    [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
>    [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>    [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>    [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>    [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>    [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
>    [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
>    [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
>    [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>    [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
>    [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
>    [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
>    [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
>    [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
>    [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
>    [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>    [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
>    [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
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
>    [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
>    [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
>    [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
>    [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
>    [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
>    [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
>    [Intel XE#2364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
>    [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
>    [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
>    [Intel XE#2385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2385
>    [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
>    [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
>    [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
>    [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
>    [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
>    [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
>    [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
>    [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>    [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
>    [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
>    [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
>    [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
>    [Intel XE#2501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501
>    [Intel XE#2502]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2502
>    [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
>    [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
>    [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
>    [Intel XE#2613]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2613
>    [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>    [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
>    [Intel XE#2715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715
>    [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>    [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
>    [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>    [Intel XE#2864]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864
>    [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>    [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
>    [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>    [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
>    [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
>    [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
>    [Intel XE#2922]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2922
>    [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
>    [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
>    [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
>    [Intel XE#2955]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955
>    [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>    [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>    [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>    [Intel XE#3088]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3088
>    [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
>    [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
>    [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
>    [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>    [Intel XE#3184]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184
>    [Intel XE#3225]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225
>    [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
>    [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>    [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
>    [Intel XE#3343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
>    [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
>    [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>    [Intel XE#3421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3421
>    [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>    [Intel XE#3440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3440
>    [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
>    [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
>    [Intel XE#3467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467
>    [Intel XE#3468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468
>    [Intel XE#3486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3486
>    [Intel XE#3499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3499
>    [Intel XE#3527]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3527
>    [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
>    [Intel XE#3546]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3546
>    [Intel XE#3561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3561
>    [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
>    [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>    [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>    [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>    [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
>    [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>    [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
>    [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>    [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>    [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
>    [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
>    [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
>    [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>    [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
>    [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>    [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>    [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
>    [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>    [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>    [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
>    [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
>    [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>    [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>    [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
>    [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
>
>
> Build changes
> -------------
>
>    * IGT: IGT_8127 -> IGTPW_12206
>    * Linux: xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198 -> xe-2283-441e225c838a29660f3f1c29cc2a617572e63099
>
>    IGTPW_12206: 12206
>    IGT_8127: 433ecaf95ccaed2b5adcb40d27fa5b7a08a2e03d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198: 739a2506c44a0be22cc842d2c625a05ed21c1198
>    xe-2283-441e225c838a29660f3f1c29cc2a617572e63099: 441e225c838a29660f3f1c29cc2a617572e63099
>
> == Logs ==
>
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12206/index.html
>
