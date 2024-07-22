Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAD1DC3DA59
	for <igt-dev@archiver.kernel.org>; Mon, 22 Jul 2024 12:44:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3501A10E4FC;
	Mon, 22 Jul 2024 12:44:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yu/tzD5p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BF5510E491;
 Mon, 22 Jul 2024 12:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721652295; x=1753188295;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zDf55nhOI4ak+ViODVQNtKTCpZ5nksKEXVjeO/ZzqdM=;
 b=Yu/tzD5prsc+Oe7LQn62DkAIo9Inq9Wl6Z2XHKxCfGaQvjOQF7lklQ4Q
 H7OzbHOucq5rp0pE/AH+QB7LMmWD9tl4h0Xn17msu9wQfy94IQjjZnK7M
 dvvr1RJkXuvPdnRsT70iBPWE3PenkSTM5rMHH8ohAnEbxsXe4jjHefYUc
 ccyLcBkMoJOy2MWVbhXLmb6kQCMXWZ3doZu8XfKkXgZmcsNr5FEnpbc3K
 wopVKLQlgD8pZJASUjA6+B5mNCVZn/IxkyA1yUfZa8mmvNrjbfd3E8y5j
 aqRa/yzuZ2HSqJpIZmjNo9LsQ7VwO+LfXPnB7kI4R1JIXd7B+Qr7pC0zj g==;
X-CSE-ConnectionGUID: tAJr8mNVTWyeQu8T5mHnUA==
X-CSE-MsgGUID: FY7juC6YQs2SKhdUKwSU3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11140"; a="23082969"
X-IronPort-AV: E=Sophos;i="6.09,228,1716274800"; d="scan'208";a="23082969"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 05:44:54 -0700
X-CSE-ConnectionGUID: WCSH7wqATC2EWo7igToYbQ==
X-CSE-MsgGUID: eu9QN46NRESNMWb2qtcovg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,228,1716274800"; d="scan'208";a="51940334"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.233])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 05:44:52 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: I915-ci-infra@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Subject: Re: =?UTF-8?B?4pyX?= CI.xeFULL: failure for lib/kunit: Fixes and
 enhancements
Date: Mon, 22 Jul 2024 13:59:48 +0200
Message-ID: <4934833.31r3eYUQgx@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <172164750786.327182.10183595689995672898@2413ebb6fbb6>
References: <20240722080913.74333-5-janusz.krzysztofik@linux.intel.com>
 <172164750786.327182.10183595689995672898@2413ebb6fbb6>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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

On Monday, 22 July 2024 13:25:07 GMT+2 Patchwork wrote:
> == Series Details ==
> 
> Series: lib/kunit: Fixes and enhancements
> URL   : https://patchwork.freedesktop.org/series/136329/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_7933_full -> XEIGTPW_11440_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_11440_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_11440_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (3 -> 3)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_11440_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_display_modes@extended-mode-basic:
>     - shard-dg2-set2:     [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-436/igt@kms_display_modes@extended-mode-basic.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-432/igt@kms_display_modes@extended-mode-basic.html
> 
>   * igt@xe_exec_reset@cm-gt-reset:
>     - shard-lnl:          [PASS][3] -> [FAIL][4] +2 other tests fail
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-lnl-3/igt@xe_exec_reset@cm-gt-reset.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-lnl-1/igt@xe_exec_reset@cm-gt-reset.html

Hi I915-ci-infra@lists.freedesktop.org,

My series touches kunit selftests only, and those above are not tests like 
that, then the failures are for sure not related to my changes.  Please update 
your filters.

Thanks,
Janusz


> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * {igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-1}:
>     - shard-lnl:          [PASS][5] -> [DMESG-WARN][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-1.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-1.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_11440_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][7] ([Intel XE#623])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-432/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>   * igt@kms_async_flips@invalid-async-flip:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][8] ([Intel XE#1201] / [Intel XE#873])
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-466/igt@kms_async_flips@invalid-async-flip.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-lnl:          [PASS][9] -> [FAIL][10] ([Intel XE#1659])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-433/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#1124] / [Intel XE#1201]) +5 other tests skip
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
>     - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#1124]) +1 other test skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-lnl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-463/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][15] ([Intel XE#616]) +5 other tests fail
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +11 other tests skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html
>     - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#1399]) +2 other tests skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-lnl-4/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel XE#787]) +41 other tests skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#787]) +6 other tests skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_cdclk@mode-transition:
>     - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#314] / [Intel XE#599])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-lnl-4/igt@kms_cdclk@mode-transition.html
> 
>   * igt@kms_cdclk@mode-transition-all-outputs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#314])
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-436/igt@kms_cdclk@mode-transition-all-outputs.html
> 
>   * igt@kms_cdclk@mode-transition@pipe-b-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#314]) +2 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-lnl-4/igt@kms_cdclk@mode-transition@pipe-b-edp-1.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#1201] / [Intel XE#373]) +4 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-436/igt@kms_chamelium_hpd@vga-hpd.html
> 
>   * igt@kms_content_protection@uevent:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][25] ([Intel XE#1188]) +1 other test fail
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-436/igt@kms_content_protection@uevent.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x170:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#1201] / [Intel XE#308])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-463/igt@kms_cursor_crc@cursor-onscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-random-32x10:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#1201] / [Intel XE#455]) +5 other tests skip
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-466/igt@kms_cursor_crc@cursor-random-32x10.html
>     - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#1424])
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-lnl-7/igt@kms_cursor_crc@cursor-random-32x10.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#1201] / [Intel XE#323])
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
> 
>   * igt@kms_cursor_legacy@single-bo@pipe-a:
>     - shard-lnl:          [PASS][30] -> [DMESG-WARN][31] ([Intel XE#877]) +1 other test dmesg-warn
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-lnl-5/igt@kms_cursor_legacy@single-bo@pipe-a.html
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-lnl-6/igt@kms_cursor_legacy@single-bo@pipe-a.html
> 
>   * igt@kms_cursor_legacy@torture-move@pipe-a:
>     - shard-dg2-set2:     [PASS][32] -> [DMESG-WARN][33] ([Intel XE#877]) +3 other tests dmesg-warn
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-434/igt@kms_cursor_legacy@torture-move@pipe-a.html
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-432/igt@kms_cursor_legacy@torture-move@pipe-a.html
> 
>   * igt@kms_fbcon_fbt@fbc:
>     - shard-lnl:          [PASS][34] -> [DMESG-WARN][35] ([Intel XE#1705])
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-lnl-7/igt@kms_fbcon_fbt@fbc.html
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-lnl-4/igt@kms_fbcon_fbt@fbc.html
> 
>   * igt@kms_feature_discovery@display-2x:
>     - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#702])
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-lnl-7/igt@kms_feature_discovery@display-2x.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
>     - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#1421])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-lnl-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank:
>     - shard-lnl:          [PASS][38] -> [FAIL][39] ([Intel XE#886]) +1 other test fail
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank.html
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@d-dp4:
>     - shard-dg2-set2:     [PASS][40] -> [INCOMPLETE][41] ([Intel XE#1195] / [Intel XE#2049])
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#1401] / [Intel XE#1745])
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#1401])
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:
>     - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#651]) +2 other tests skip
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#651]) +5 other tests skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#1201] / [Intel XE#651]) +8 other tests skip
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#656]) +1 other test skip
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-slowdraw:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#1201] / [Intel XE#653]) +10 other tests skip
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-slowdraw.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][49] -> [DMESG-WARN][50] ([Intel XE#1162])
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-464/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-435/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_plane_multiple@tiling-yf:
>     - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#599])
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-lnl-3/igt@kms_plane_multiple@tiling-yf.html
> 
>   * igt@kms_pm_backlight@fade-with-suspend:
>     - shard-lnl:          [PASS][52] -> [SKIP][53] ([Intel XE#870]) +1 other test skip
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-lnl-6/igt@kms_pm_backlight@fade-with-suspend.html
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-lnl-5/igt@kms_pm_backlight@fade-with-suspend.html
> 
>   * igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#1201] / [Intel XE#1489]) +1 other test skip
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-435/igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#1489])
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-432/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_su@page_flip-xrgb8888:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#1122] / [Intel XE#1201])
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-436/igt@kms_psr2_su@page_flip-xrgb8888.html
> 
>   * igt@kms_psr@fbc-psr2-primary-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#1201] / [Intel XE#929]) +7 other tests skip
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-466/igt@kms_psr@fbc-psr2-primary-blt.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-270:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#1201] / [Intel XE#327]) +1 other test skip
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-435/igt@kms_rotation_crc@sprite-rotation-270.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:
>     - shard-dg2-set2:     [PASS][59] -> [FAIL][60] ([Intel XE#899]) +1 other test fail
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-464/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-suspend:
>     - shard-dg2-set2:     [PASS][61] -> [DMESG-WARN][62] ([Intel XE#1551]) +1 other test dmesg-warn
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-434/igt@kms_vblank@ts-continuation-dpms-suspend.html
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-436/igt@kms_vblank@ts-continuation-dpms-suspend.html
> 
>   * igt@xe_compute@ccs-mode-compute-kernel:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][63] ([Intel XE#1050])
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-432/igt@xe_compute@ccs-mode-compute-kernel.html
> 
>   * igt@xe_evict@evict-small-multi-vm-cm:
>     - shard-dg2-set2:     [PASS][64] -> [INCOMPLETE][65] ([Intel XE#1195] / [Intel XE#1473])
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-464/igt@xe_evict@evict-small-multi-vm-cm.html
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-466/igt@xe_evict@evict-small-multi-vm-cm.html
> 
>   * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen:
>     - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#688])
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-lnl-7/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
>     - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#1392]) +1 other test skip
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-lnl-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#1201] / [Intel XE#288]) +9 other tests skip
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm.html
> 
>   * igt@xe_exec_fault_mode@twice-bindexecqueue-prefetch:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#288])
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-prefetch.html
> 
>   * igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:
>     - shard-dg2-set2:     [PASS][70] -> [ABORT][71] ([Intel XE#2271]) +1 other test abort
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-464/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-433/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html
> 
>   * igt@xe_exec_threads@threads-hang-shared-vm-userptr-rebind:
>     - shard-lnl:          [PASS][72] -> [DMESG-FAIL][73] ([Intel XE#1638])
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-lnl-7/igt@xe_exec_threads@threads-hang-shared-vm-userptr-rebind.html
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-lnl-7/igt@xe_exec_threads@threads-hang-shared-vm-userptr-rebind.html
> 
>   * igt@xe_gt_freq@freq_fixed_exec:
>     - shard-dg2-set2:     [PASS][74] -> [FAIL][75] ([Intel XE#2262])
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-436/igt@xe_gt_freq@freq_fixed_exec.html
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-435/igt@xe_gt_freq@freq_fixed_exec.html
> 
>   * igt@xe_gt_freq@freq_reset_multiple:
>     - shard-lnl:          [PASS][76] -> [DMESG-WARN][77] ([Intel XE#1620])
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-lnl-1/igt@xe_gt_freq@freq_reset_multiple.html
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-lnl-3/igt@xe_gt_freq@freq_reset_multiple.html
> 
>   * igt@xe_live_ktest@xe_dma_buf:
>     - shard-lnl:          [PASS][78] -> [SKIP][79] ([Intel XE#1192])
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-lnl-4/igt@xe_live_ktest@xe_dma_buf.html
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-lnl-1/igt@xe_live_ktest@xe_dma_buf.html
> 
>   * igt@xe_pm@s3-d3cold-basic-exec:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][80] ([Intel XE#1201] / [Intel XE#366])
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-463/igt@xe_pm@s3-d3cold-basic-exec.html
> 
>   * igt@xe_pm@s3-d3hot-basic-exec:
>     - shard-dg2-set2:     [PASS][81] -> [DMESG-WARN][82] ([Intel XE#1551] / [Intel XE#569])
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-434/igt@xe_pm@s3-d3hot-basic-exec.html
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-432/igt@xe_pm@s3-d3hot-basic-exec.html
> 
>   * igt@xe_pm@s4-basic:
>     - shard-lnl:          [PASS][83] -> [ABORT][84] ([Intel XE#1358] / [Intel XE#1607]) +1 other test abort
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-lnl-6/igt@xe_pm@s4-basic.html
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-lnl-2/igt@xe_pm@s4-basic.html
> 
>   * igt@xe_pm@s4-vm-bind-userptr:
>     - shard-dg2-set2:     [PASS][85] -> [INCOMPLETE][86] ([Intel XE#1195] / [Intel XE#2280])
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-464/igt@xe_pm@s4-vm-bind-userptr.html
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-436/igt@xe_pm@s4-vm-bind-userptr.html
> 
>   * igt@xe_pm_residency@toggle-gt-c6:
>     - shard-lnl:          [PASS][87] -> [FAIL][88] ([Intel XE#958])
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition:
>     - shard-dg2-set2:     [FAIL][89] ([Intel XE#1426]) -> [PASS][90]
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-463/igt@kms_atomic_transition@plane-all-modeset-transition.html
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-464/igt@kms_atomic_transition@plane-all-modeset-transition.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [FAIL][91] -> [PASS][92]
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-463/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-464/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6:
>     - shard-dg2-set2:     [DMESG-WARN][93] ([Intel XE#1551]) -> [PASS][94]
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6.html
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6.html
> 
>   * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1:
>     - shard-lnl:          [FAIL][95] ([Intel XE#886]) -> [PASS][96] +1 other test pass
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-lnl-4/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-lnl-4/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html
> 
>   * {igt@kms_plane@plane-position-covered@pipe-a-plane-3}:
>     - shard-lnl:          [DMESG-FAIL][97] ([Intel XE#324]) -> [PASS][98] +1 other test pass
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-lnl-3/igt@kms_plane@plane-position-covered@pipe-a-plane-3.html
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-lnl-8/igt@kms_plane@plane-position-covered@pipe-a-plane-3.html
> 
>   * {igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3}:
>     - shard-lnl:          [DMESG-WARN][99] ([Intel XE#324]) -> [PASS][100] +4 other tests pass
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html
> 
>   * igt@kms_pm_backlight@fade:
>     - shard-lnl:          [SKIP][101] ([Intel XE#870]) -> [PASS][102]
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-lnl-7/igt@kms_pm_backlight@fade.html
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-lnl-6/igt@kms_pm_backlight@fade.html
> 
>   * igt@kms_pm_dc@dc5-psr:
>     - shard-lnl:          [FAIL][103] ([Intel XE#718]) -> [PASS][104]
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-lnl-5/igt@kms_pm_dc@dc5-psr.html
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-lnl-3/igt@kms_pm_dc@dc5-psr.html
> 
>   * igt@kms_pm_rpm@system-suspend-modeset:
>     - shard-lnl:          [DMESG-WARN][105] ([Intel XE#2042]) -> [PASS][106]
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-lnl-1/igt@kms_pm_rpm@system-suspend-modeset.html
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-lnl-1/igt@kms_pm_rpm@system-suspend-modeset.html
> 
>   * igt@kms_sequence@queue-idle@pipe-b-edp-1:
>     - shard-lnl:          [FAIL][107] -> [PASS][108] +1 other test pass
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-lnl-1/igt@kms_sequence@queue-idle@pipe-b-edp-1.html
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-lnl-6/igt@kms_sequence@queue-idle@pipe-b-edp-1.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-small:
>     - shard-dg2-set2:     [TIMEOUT][109] ([Intel XE#1473] / [Intel XE#402]) -> [PASS][110]
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-small.html
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-small.html
> 
>   * igt@xe_evict@evict-beng-mixed-threads-large:
>     - shard-dg2-set2:     [TIMEOUT][111] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392]) -> [PASS][112]
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-463/igt@xe_evict@evict-beng-mixed-threads-large.html
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-464/igt@xe_evict@evict-beng-mixed-threads-large.html
> 
>   * igt@xe_evict@evict-mixed-threads-large:
>     - shard-dg2-set2:     [TIMEOUT][113] ([Intel XE#1473] / [Intel XE#392]) -> [PASS][114]
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-433/igt@xe_evict@evict-mixed-threads-large.html
> 
>   * igt@xe_evict@evict-threads-large:
>     - shard-dg2-set2:     [FAIL][115] ([Intel XE#1000]) -> [PASS][116]
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-466/igt@xe_evict@evict-threads-large.html
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-434/igt@xe_evict@evict-threads-large.html
> 
>   * igt@xe_live_ktest@xe_mocs:
>     - shard-lnl:          [SKIP][117] ([Intel XE#1192]) -> [PASS][118]
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-lnl-1/igt@xe_live_ktest@xe_mocs.html
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-lnl-4/igt@xe_live_ktest@xe_mocs.html
> 
>   * igt@xe_module_load@many-reload:
>     - shard-lnl:          [DMESG-WARN][119] ([Intel XE#2356]) -> [PASS][120]
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-lnl-2/igt@xe_module_load@many-reload.html
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-lnl-8/igt@xe_module_load@many-reload.html
> 
>   * igt@xe_pm@s4-vm-bind-prefetch:
>     - shard-dg2-set2:     [DMESG-WARN][121] ([Intel XE#2019]) -> [PASS][122] +1 other test pass
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-435/igt@xe_pm@s4-vm-bind-prefetch.html
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-463/igt@xe_pm@s4-vm-bind-prefetch.html
> 
>   * igt@xe_vm@mmap-style-bind-either-side-partial-split-page-hammer:
>     - shard-dg2-set2:     [ABORT][123] ([Intel XE#2271]) -> [PASS][124]
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-433/igt@xe_vm@mmap-style-bind-either-side-partial-split-page-hammer.html
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-435/igt@xe_vm@mmap-style-bind-either-side-partial-split-page-hammer.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][125] ([Intel XE#316]) -> [SKIP][126] ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-432/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-433/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@linear-8bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][127] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][128] ([Intel XE#316]) +1 other test skip
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-466/igt@kms_big_fb@linear-8bpp-rotate-270.html
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-432/igt@kms_big_fb@linear-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
>     - shard-dg2-set2:     [SKIP][129] ([Intel XE#1201] / [Intel XE#607]) -> [SKIP][130] ([Intel XE#607])
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
>     - shard-dg2-set2:     [SKIP][131] ([Intel XE#1124]) -> [SKIP][132] ([Intel XE#1124] / [Intel XE#1201]) +4 other tests skip
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-436/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
>     - shard-dg2-set2:     [SKIP][133] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][134] ([Intel XE#1124]) +7 other tests skip
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_joiner@basic:
>     - shard-dg2-set2:     [SKIP][135] ([Intel XE#1201] / [Intel XE#346]) -> [SKIP][136] ([Intel XE#346])
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-463/igt@kms_big_joiner@basic.html
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-432/igt@kms_big_joiner@basic.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
>     - shard-dg2-set2:     [SKIP][137] ([Intel XE#367]) -> [SKIP][138] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-463/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
>     - shard-dg2-set2:     [SKIP][139] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][140] ([Intel XE#367])
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-466/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html
> 
>   * igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][141] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][142] ([Intel XE#787]) +62 other tests skip
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-435/igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-a-hdmi-a-6.html
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs:
>     - shard-dg2-set2:     [SKIP][143] ([Intel XE#1201] / [Intel XE#1252]) -> [SKIP][144] ([Intel XE#1252])
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
>     - shard-dg2-set2:     [INCOMPLETE][145] ([Intel XE#1195]) -> [FAIL][146] ([Intel XE#616]) +1 other test fail
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     [SKIP][147] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][148] ([Intel XE#455] / [Intel XE#787]) +17 other tests skip
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][149] ([Intel XE#787]) -> [SKIP][150] ([Intel XE#1201] / [Intel XE#787]) +62 other tests skip
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-6.html
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     [SKIP][151] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][152] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +17 other tests skip
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-433/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
>     - shard-dg2-set2:     [SKIP][153] ([Intel XE#1152] / [Intel XE#1201]) -> [SKIP][154] ([Intel XE#1152]) +3 other tests skip
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-434/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html
> 
>   * igt@kms_chamelium_color@ctm-blue-to-red:
>     - shard-dg2-set2:     [SKIP][155] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][156] ([Intel XE#306])
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-463/igt@kms_chamelium_color@ctm-blue-to-red.html
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-432/igt@kms_chamelium_color@ctm-blue-to-red.html
> 
>   * igt@kms_chamelium_color@degamma:
>     - shard-dg2-set2:     [SKIP][157] ([Intel XE#306]) -> [SKIP][158] ([Intel XE#1201] / [Intel XE#306])
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-432/igt@kms_chamelium_color@degamma.html
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-433/igt@kms_chamelium_color@degamma.html
> 
>   * igt@kms_chamelium_edid@hdmi-edid-read:
>     - shard-dg2-set2:     [SKIP][159] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][160] ([Intel XE#373]) +5 other tests skip
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-433/igt@kms_chamelium_edid@hdmi-edid-read.html
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-432/igt@kms_chamelium_edid@hdmi-edid-read.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-fast:
>     - shard-dg2-set2:     [SKIP][161] ([Intel XE#373]) -> [SKIP][162] ([Intel XE#1201] / [Intel XE#373]) +2 other tests skip
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-432/igt@kms_chamelium_hpd@dp-hpd-fast.html
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-435/igt@kms_chamelium_hpd@dp-hpd-fast.html
> 
>   * igt@kms_content_protection@dp-mst-type-0:
>     - shard-dg2-set2:     [SKIP][163] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][164] ([Intel XE#307]) +1 other test skip
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-433/igt@kms_content_protection@dp-mst-type-0.html
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-432/igt@kms_content_protection@dp-mst-type-0.html
> 
>   * igt@kms_content_protection@dp-mst-type-1:
>     - shard-dg2-set2:     [SKIP][165] ([Intel XE#307]) -> [SKIP][166] ([Intel XE#1201] / [Intel XE#307])
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-432/igt@kms_content_protection@dp-mst-type-1.html
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-436/igt@kms_content_protection@dp-mst-type-1.html
> 
>   * igt@kms_content_protection@mei-interface:
>     - shard-dg2-set2:     [SKIP][167] ([Intel XE#1201]) -> [SKIP][168] ([Intel XE#1201] / [Intel XE#455])
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-435/igt@kms_content_protection@mei-interface.html
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-466/igt@kms_content_protection@mei-interface.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
>     - shard-dg2-set2:     [SKIP][169] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][170] ([Intel XE#308]) +1 other test skip
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-466/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x170:
>     - shard-dg2-set2:     [SKIP][171] ([Intel XE#308]) -> [SKIP][172] ([Intel XE#1201] / [Intel XE#308])
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-512x170.html
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-512x170.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
>     - shard-dg2-set2:     [SKIP][173] ([Intel XE#323]) -> [SKIP][174] ([Intel XE#1201] / [Intel XE#323])
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
> 
>   * igt@kms_feature_discovery@psr2:
>     - shard-dg2-set2:     [SKIP][175] ([Intel XE#1135]) -> [SKIP][176] ([Intel XE#1135] / [Intel XE#1201])
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-432/igt@kms_feature_discovery@psr2.html
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-433/igt@kms_feature_discovery@psr2.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>     - shard-dg2-set2:     [DMESG-WARN][177] ([Intel XE#1551]) -> [INCOMPLETE][178] ([Intel XE#1195] / [Intel XE#2049])
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible.html
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
>     - shard-dg2-set2:     [SKIP][179] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][180] ([Intel XE#651]) +13 other tests skip
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
>     - shard-dg2-set2:     [SKIP][181] ([Intel XE#651]) -> [SKIP][182] ([Intel XE#1201] / [Intel XE#651]) +14 other tests skip
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
>     - shard-dg2-set2:     [SKIP][183] ([Intel XE#653]) -> [SKIP][184] ([Intel XE#1201] / [Intel XE#653]) +11 other tests skip
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
>     - shard-dg2-set2:     [SKIP][185] ([Intel XE#1201] / [Intel XE#658]) -> [SKIP][186] ([Intel XE#658])
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
>     - shard-dg2-set2:     [SKIP][187] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][188] ([Intel XE#653]) +20 other tests skip
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - shard-dg2-set2:     [SKIP][189] ([Intel XE#1201] / [Intel XE#417]) -> [SKIP][190] ([Intel XE#417])
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-466/igt@kms_hdmi_inject@inject-audio.html
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-432/igt@kms_hdmi_inject@inject-audio.html
> 
>   * igt@kms_plane@plane-position-hole:
>     - shard-lnl:          [DMESG-FAIL][191] ([Intel XE#324]) -> [DMESG-WARN][192] ([Intel XE#324])
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-lnl-2/igt@kms_plane@plane-position-hole.html
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-lnl-6/igt@kms_plane@plane-position-hole.html
> 
>   * igt@kms_plane_multiple@tiling-y:
>     - shard-dg2-set2:     [SKIP][193] ([Intel XE#455]) -> [SKIP][194] ([Intel XE#1201] / [Intel XE#455]) +9 other tests skip
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-432/igt@kms_plane_multiple@tiling-y.html
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-466/igt@kms_plane_multiple@tiling-y.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
>     - shard-dg2-set2:     [SKIP][195] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) -> [SKIP][196] ([Intel XE#455] / [Intel XE#498]) +1 other test skip
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][197] ([Intel XE#1201] / [Intel XE#498]) -> [SKIP][198] ([Intel XE#498]) +2 other tests skip
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
>     - shard-dg2-set2:     [SKIP][199] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][200] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) +4 other tests skip
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][201] ([Intel XE#1201]) -> [SKIP][202] ([Intel XE#1201] / [Intel XE#2318]) +2 other tests skip
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-463/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_pm_backlight@fade:
>     - shard-dg2-set2:     [SKIP][203] ([Intel XE#1201] / [Intel XE#870]) -> [SKIP][204] ([Intel XE#870])
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-435/igt@kms_pm_backlight@fade.html
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-432/igt@kms_pm_backlight@fade.html
> 
>   * igt@kms_pm_dc@dc6-psr:
>     - shard-dg2-set2:     [SKIP][205] ([Intel XE#1129]) -> [SKIP][206] ([Intel XE#1129] / [Intel XE#1201])
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-432/igt@kms_pm_dc@dc6-psr.html
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-436/igt@kms_pm_dc@dc6-psr.html
> 
>   * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf:
>     - shard-dg2-set2:     [SKIP][207] ([Intel XE#1489]) -> [SKIP][208] ([Intel XE#1201] / [Intel XE#1489]) +1 other test skip
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf.html
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-436/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_sf@overlay-plane-move-continuous-sf:
>     - shard-dg2-set2:     [SKIP][209] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][210] ([Intel XE#1489]) +1 other test skip
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-435/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_su@page_flip-nv12:
>     - shard-dg2-set2:     [SKIP][211] ([Intel XE#1122] / [Intel XE#1201]) -> [SKIP][212] ([Intel XE#1122])
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-466/igt@kms_psr2_su@page_flip-nv12.html
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-432/igt@kms_psr2_su@page_flip-nv12.html
> 
>   * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
>     - shard-dg2-set2:     [SKIP][213] ([Intel XE#929]) -> [SKIP][214] ([Intel XE#1201] / [Intel XE#929]) +6 other tests skip
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-464/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html
> 
>   * igt@kms_psr@psr-dpms:
>     - shard-dg2-set2:     [SKIP][215] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][216] ([Intel XE#929]) +9 other tests skip
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-466/igt@kms_psr@psr-dpms.html
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-432/igt@kms_psr@psr-dpms.html
> 
>   * igt@kms_rotation_crc@bad-pixel-format:
>     - shard-dg2-set2:     [SKIP][217] ([Intel XE#327]) -> [SKIP][218] ([Intel XE#1201] / [Intel XE#327])
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-432/igt@kms_rotation_crc@bad-pixel-format.html
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-435/igt@kms_rotation_crc@bad-pixel-format.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
>     - shard-dg2-set2:     [SKIP][219] ([Intel XE#1127]) -> [SKIP][220] ([Intel XE#1127] / [Intel XE#1201])
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-435/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>     - shard-dg2-set2:     [SKIP][221] ([Intel XE#1127] / [Intel XE#1201]) -> [SKIP][222] ([Intel XE#1127]) +1 other test skip
>    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-435/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
>    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
> 
>   * igt@kms_vrr@flipline:
>     - shard-dg2-set2:     [SKIP][223] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][224] ([Intel XE#455]) +7 other tests skip
>    [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-464/igt@kms_vrr@flipline.html
>    [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-432/igt@kms_vrr@flipline.html
> 
>   * igt@kms_vrr@negative-basic:
>     - shard-lnl:          [SKIP][225] ([Intel XE#599]) -> [SKIP][226] ([Intel XE#1499] / [Intel XE#599]) +2 other tests skip
>    [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-lnl-7/igt@kms_vrr@negative-basic.html
>    [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-lnl-8/igt@kms_vrr@negative-basic.html
> 
>   * igt@kms_writeback@writeback-check-output-xrgb2101010:
>     - shard-dg2-set2:     [SKIP][227] ([Intel XE#756]) -> [SKIP][228] ([Intel XE#1201] / [Intel XE#756])
>    [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-432/igt@kms_writeback@writeback-check-output-xrgb2101010.html
>    [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-433/igt@kms_writeback@writeback-check-output-xrgb2101010.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0x369:
>     - shard-dg2-set2:     [SKIP][229] ([Intel XE#1123] / [Intel XE#1201]) -> [SKIP][230] ([Intel XE#1123])
>    [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0x369.html
>    [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x369.html
> 
>   * igt@xe_evict@evict-beng-cm-threads-large:
>     - shard-dg2-set2:     [TIMEOUT][231] ([Intel XE#1473] / [Intel XE#392]) -> [INCOMPLETE][232] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
>    [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-433/igt@xe_evict@evict-beng-cm-threads-large.html
>    [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-435/igt@xe_evict@evict-beng-cm-threads-large.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-large:
>     - shard-dg2-set2:     [INCOMPLETE][233] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392]) -> [TIMEOUT][234] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392])
>    [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-464/igt@xe_evict@evict-mixed-many-threads-large.html
>    [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-large.html
> 
>   * igt@xe_exec_fault_mode@many-bindexecqueue-rebind:
>     - shard-dg2-set2:     [SKIP][235] ([Intel XE#288]) -> [SKIP][236] ([Intel XE#1201] / [Intel XE#288]) +11 other tests skip
>    [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-432/igt@xe_exec_fault_mode@many-bindexecqueue-rebind.html
>    [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-433/igt@xe_exec_fault_mode@many-bindexecqueue-rebind.html
> 
>   * igt@xe_exec_fault_mode@twice-userptr-prefetch:
>     - shard-dg2-set2:     [SKIP][237] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][238] ([Intel XE#288]) +15 other tests skip
>    [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-prefetch.html
>    [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-prefetch.html
> 
>   * igt@xe_exec_reset@parallel-gt-reset:
>     - shard-dg2-set2:     [TIMEOUT][239] ([Intel XE#2105]) -> [TIMEOUT][240] ([Intel XE#2105] / [Intel XE#2345])
>    [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-435/igt@xe_exec_reset@parallel-gt-reset.html
>    [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-432/igt@xe_exec_reset@parallel-gt-reset.html
> 
>   * igt@xe_module_load@force-load:
>     - shard-dg2-set2:     [SKIP][241] ([Intel XE#1201] / [Intel XE#378]) -> [SKIP][242] ([Intel XE#378])
>    [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-466/igt@xe_module_load@force-load.html
>    [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-432/igt@xe_module_load@force-load.html
> 
>   * igt@xe_pat@display-vs-wb-transient:
>     - shard-dg2-set2:     [SKIP][243] ([Intel XE#1201] / [Intel XE#1337]) -> [SKIP][244] ([Intel XE#1337])
>    [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-433/igt@xe_pat@display-vs-wb-transient.html
>    [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-432/igt@xe_pat@display-vs-wb-transient.html
> 
>   * igt@xe_pm@d3cold-multiple-execs:
>     - shard-dg2-set2:     [SKIP][245] ([Intel XE#366]) -> [SKIP][246] ([Intel XE#1201] / [Intel XE#366])
>    [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-432/igt@xe_pm@d3cold-multiple-execs.html
>    [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-463/igt@xe_pm@d3cold-multiple-execs.html
> 
>   * igt@xe_pm@s3-vm-bind-unbind-all:
>     - shard-dg2-set2:     [DMESG-WARN][247] ([Intel XE#1162] / [Intel XE#1941]) -> [DMESG-WARN][248] ([Intel XE#1162])
>    [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-463/igt@xe_pm@s3-vm-bind-unbind-all.html
>    [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-464/igt@xe_pm@s3-vm-bind-unbind-all.html
> 
>   * igt@xe_pm@s4-d3cold-basic-exec:
>     - shard-dg2-set2:     [SKIP][249] ([Intel XE#1201] / [Intel XE#366]) -> [SKIP][250] ([Intel XE#366])
>    [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-466/igt@xe_pm@s4-d3cold-basic-exec.html
>    [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-432/igt@xe_pm@s4-d3cold-basic-exec.html
> 
>   * igt@xe_query@multigpu-query-cs-cycles:
>     - shard-dg2-set2:     [SKIP][251] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][252] ([Intel XE#944]) +2 other tests skip
>    [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-436/igt@xe_query@multigpu-query-cs-cycles.html
>    [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-432/igt@xe_query@multigpu-query-cs-cycles.html
> 
>   * igt@xe_query@multigpu-query-invalid-size:
>     - shard-dg2-set2:     [SKIP][253] ([Intel XE#944]) -> [SKIP][254] ([Intel XE#1201] / [Intel XE#944])
>    [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-432/igt@xe_query@multigpu-query-invalid-size.html
>    [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-466/igt@xe_query@multigpu-query-invalid-size.html
> 
>   * igt@xe_wedged@basic-wedged:
>     - shard-dg2-set2:     [SKIP][255] ([Intel XE#1130] / [Intel XE#1201]) -> [DMESG-WARN][256] ([Intel XE#1760])
>    [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7933/shard-dg2-463/igt@xe_wedged@basic-wedged.html
>    [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/shard-dg2-434/igt@xe_wedged@basic-wedged.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
>   [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
>   [Intel XE#1050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050
>   [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>   [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
>   [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
>   [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
>   [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
>   [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
>   [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
>   [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
>   [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
>   [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
>   [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>   [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
>   [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
>   [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
>   [Intel XE#1638]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638
>   [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
>   [Intel XE#1705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1705
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
>   [Intel XE#1941]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1941
>   [Intel XE#2019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019
>   [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
>   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>   [Intel XE#2105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105
>   [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
>   [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>   [Intel XE#2207]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2207
>   [Intel XE#2262]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2262
>   [Intel XE#2271]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2271
>   [Intel XE#2280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280
>   [Intel XE#2318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
>   [Intel XE#2345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2345
>   [Intel XE#2356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2356
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>   [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
>   [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
>   [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
>   [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
>   [Intel XE#417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/417
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
>   [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
>   [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>   [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
>   [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>   [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
>   [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
>   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
>   [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
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
>   * IGT: IGT_7933 -> IGTPW_11440
>   * Linux: xe-1633-25cbb0b9828d08006be65c72f2ad5e85766d1941 -> xe-1641-867eb2599d00e03d12a2a49b223cf37280d7ee2e
> 
>   IGTPW_11440: 11440
>   IGT_7933: 7933
>   xe-1633-25cbb0b9828d08006be65c72f2ad5e85766d1941: 25cbb0b9828d08006be65c72f2ad5e85766d1941
>   xe-1641-867eb2599d00e03d12a2a49b223cf37280d7ee2e: 867eb2599d00e03d12a2a49b223cf37280d7ee2e
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11440/index.html
> 




