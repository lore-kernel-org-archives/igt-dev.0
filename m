Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05EE7C10F16
	for <igt-dev@archiver.kernel.org>; Mon,  6 May 2024 13:21:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79CD510F9E1;
	Mon,  6 May 2024 13:21:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="brXEBOac";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EE6E10F9E1
 for <igt-dev@lists.freedesktop.org>; Mon,  6 May 2024 13:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715001702; x=1746537702;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=eGPgNQhuUkGOu6okAs7OdL0SbDb9Kj+fLwO7d4ODKa0=;
 b=brXEBOac7xrgDB1Hzi1Hq/Z4JMJXjCU8BSNOhWCx8/Huf4fUWrhe3deA
 mps2EMhrWaGFJDseOaqL7qT8Qa9C5vWvaCUj9+oJZJJ9nuauQVPuZbsoY
 e49CIMThTumtjr/WqyWUEk4wLWZzH/Wxah/66QeWB+xLHGgdPLdfaLw4L
 WQikvg1VFLITfl3ULAaWcCLGsb1LsGWPXLR+K2UnmYUywWPYuDO1I2YJY
 ksmL2dwHeZEMeX7Tms1xl+b3c9Azcv8qnM3shpjXivF7AwAsxVpcoJg93
 QG0kBpXTSk8y1hQ8n0mSANJAGHQL898RjEiUr9KPFmqgfKBONmUidsuZR w==;
X-CSE-ConnectionGUID: fKBFbbJnQvK08+FXsJgOqA==
X-CSE-MsgGUID: yhq2j/3cR/CoKahi3AZHhw==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="22156560"
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="22156560"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 06:21:35 -0700
X-CSE-ConnectionGUID: Cq1sxgGIRcuTlpTWiwsMfA==
X-CSE-MsgGUID: YGKTh8e1RO2zt6jKWC4G4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="32833606"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 06:21:33 -0700
Date: Mon, 6 May 2024 15:21:29 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Vignesh Raman <vignesh.raman@collabora.com>
Subject: Re: =?utf-8?B?4pyXIENJLnhlRlVMTDogZmFpbHVy?= =?utf-8?Q?e?= for
 tests/meson.build: Generate test-list for cross build
Message-ID: <20240506132129.l3f6nmsiywim2ht3@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Vignesh Raman <vignesh.raman@collabora.com>
References: <20240502064309.56280-1-vignesh.raman@collabora.com>
 <171464679392.1848696.4808414689084546747@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171464679392.1848696.4808414689084546747@8e613ede5ea5>
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
On 2024-05-02 at 10:46:33 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/meson.build: Generate test-list for cross build
> URL   : https://patchwork.freedesktop.org/series/133130/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_7828_full -> XEIGTPW_11092_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_11092_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_11092_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (3 -> 1)
> ------------------------------
> 
>   ERROR: It appears as if the changes made in XEIGTPW_11092_full prevented too many machines from booting.
> 

Very unlikly for meson change (as some tests did run below).
No need for re-run.

Regards,
Kamil

>   Missing    (2): shard-adlp shard-lnl 
> 
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_11092_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-7-4-mc-ccs:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][1] ([Intel XE#650]) +7 other tests fail
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11092/shard-dg2-464/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-7-4-mc-ccs.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-7-4-rc-ccs-cc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][2] ([Intel XE#1201]) +7 other tests skip
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11092/shard-dg2-464/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-7-4-rc-ccs-cc.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][3] ([Intel XE#1124] / [Intel XE#1201])
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11092/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][4] ([Intel XE#1201] / [Intel XE#367])
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11092/shard-dg2-466/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc:
>     - shard-dg2-set2:     [PASS][5] -> [SKIP][6] ([Intel XE#1201] / [Intel XE#829])
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7828/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11092/shard-dg2-433/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-7:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][7] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +18 other tests skip
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11092/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-7.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-a-hdmi-a-7:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][8] ([Intel XE#1201] / [Intel XE#787]) +77 other tests skip
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11092/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-a-hdmi-a-7.html
> 
>   * igt@kms_cdclk@mode-transition@pipe-c-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#1201] / [Intel XE#314]) +3 other tests skip
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11092/shard-dg2-434/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html
> 
>   * igt@kms_chamelium_edid@dp-edid-read:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][10] ([Intel XE#1201] / [Intel XE#373])
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11092/shard-dg2-434/igt@kms_chamelium_edid@dp-edid-read.html
> 
>   * igt@kms_color@ctm-0-50:
>     - shard-dg2-set2:     [PASS][11] -> [SKIP][12] ([Intel XE#1201] / [Intel XE#1226]) +2 other tests skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7828/shard-dg2-435/igt@kms_color@ctm-0-50.html
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11092/shard-dg2-433/igt@kms_color@ctm-0-50.html
> 
>   * igt@kms_content_protection@legacy@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][13] ([Intel XE#1178])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11092/shard-dg2-466/igt@kms_content_protection@legacy@pipe-a-dp-4.html
> 
>   * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
>     - shard-dg2-set2:     [PASS][14] -> [DMESG-WARN][15] ([Intel XE#1214] / [Intel XE#282]) +3 other tests dmesg-warn
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7828/shard-dg2-434/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11092/shard-dg2-463/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#1201] / [Intel XE#455]) +1 other test skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11092/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#1201] / [Intel XE#653])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11092/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render.html
> 
>   * igt@kms_rmfb@close-fd@pipe-b-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][18] ([Intel XE#294])
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11092/shard-dg2-435/igt@kms_rmfb@close-fd@pipe-b-dp-4.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:
>     - shard-dg2-set2:     [PASS][19] -> [FAIL][20] ([Intel XE#899])
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7828/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11092/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html
> 
>   * igt@kms_vblank@ts-continuation-suspend:
>     - shard-dg2-set2:     [PASS][21] -> [DMESG-WARN][22] ([Intel XE#1162] / [Intel XE#1214]) +3 other tests dmesg-warn
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7828/shard-dg2-435/igt@kms_vblank@ts-continuation-suspend.html
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11092/shard-dg2-434/igt@kms_vblank@ts-continuation-suspend.html
> 
>   * igt@kms_vrr@negative-basic:
>     - shard-dg2-set2:     [PASS][23] -> [SKIP][24] ([Intel XE#1201] / [Intel XE#455])
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7828/shard-dg2-463/igt@kms_vrr@negative-basic.html
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11092/shard-dg2-464/igt@kms_vrr@negative-basic.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
>     - shard-dg2-set2:     [SKIP][25] ([Intel XE#1201] / [i915#6077]) -> [PASS][26]
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7828/shard-dg2-436/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11092/shard-dg2-434/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [FAIL][27] ([Intel XE#1388]) -> [PASS][28] +1 other test pass
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7828/shard-dg2-466/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11092/shard-dg2-435/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
>     - shard-dg2-set2:     [DMESG-WARN][29] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910]) -> [PASS][30]
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7828/shard-dg2-466/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11092/shard-dg2-466/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
> 
>   * igt@kms_cursor_legacy@forked-move@pipe-b:
>     - shard-dg2-set2:     [DMESG-WARN][31] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][32] +3 other tests pass
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7828/shard-dg2-463/igt@kms_cursor_legacy@forked-move@pipe-b.html
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11092/shard-dg2-434/igt@kms_cursor_legacy@forked-move@pipe-b.html
> 
>   * igt@kms_cursor_legacy@torture-move@pipe-a:
>     - shard-dg2-set2:     [DMESG-WARN][33] ([Intel XE#1214] / [Intel XE#877]) -> [PASS][34] +1 other test pass
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7828/shard-dg2-433/igt@kms_cursor_legacy@torture-move@pipe-a.html
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11092/shard-dg2-435/igt@kms_cursor_legacy@torture-move@pipe-a.html
> 
>   * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
>     - shard-dg2-set2:     [SKIP][35] ([Intel XE#1201] / [Intel XE#829]) -> [PASS][36] +2 other tests pass
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7828/shard-dg2-436/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11092/shard-dg2-464/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [FAIL][37] ([Intel XE#361]) -> [PASS][38]
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7828/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11092/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:
>     - shard-dg2-set2:     [SKIP][39] ([Intel XE#1201]) -> [PASS][40] +10 other tests pass
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7828/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11092/shard-dg2-463/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html
> 
>   * igt@kms_sequence@queue-busy:
>     - shard-dg2-set2:     [SKIP][41] ([Intel XE#1201] / [Intel XE#1234]) -> [PASS][42]
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7828/shard-dg2-436/igt@kms_sequence@queue-busy.html
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11092/shard-dg2-463/igt@kms_sequence@queue-busy.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     [FAIL][43] ([Intel XE#899]) -> [PASS][44]
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7828/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11092/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-suspend:
>     - shard-dg2-set2:     [DMESG-WARN][45] ([Intel XE#1162] / [Intel XE#1214]) -> [PASS][46] +2 other tests pass
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7828/shard-dg2-463/igt@kms_vblank@ts-continuation-dpms-suspend.html
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11092/shard-dg2-435/igt@kms_vblank@ts-continuation-dpms-suspend.html
> 
>   * igt@xe_evict@evict-beng-cm-threads-large:
>     - shard-dg2-set2:     [INCOMPLETE][47] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392]) -> [PASS][48] +1 other test pass
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7828/shard-dg2-463/igt@xe_evict@evict-beng-cm-threads-large.html
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11092/shard-dg2-463/igt@xe_evict@evict-beng-cm-threads-large.html
> 
>   * igt@xe_live_ktest@xe_migrate:
>     - shard-dg2-set2:     [SKIP][49] ([Intel XE#1192] / [Intel XE#1201]) -> [PASS][50]
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7828/shard-dg2-436/igt@xe_live_ktest@xe_migrate.html
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11092/shard-dg2-463/igt@xe_live_ktest@xe_migrate.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
>     - shard-dg2-set2:     [SKIP][51] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][52] ([Intel XE#1201] / [Intel XE#316])
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7828/shard-dg2-436/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11092/shard-dg2-464/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
>     - shard-dg2-set2:     [SKIP][53] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][54] ([Intel XE#1201] / [Intel XE#829]) +1 other test skip
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7828/shard-dg2-463/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11092/shard-dg2-433/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
>     - shard-dg2-set2:     [SKIP][55] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][56] ([Intel XE#1201] / [Intel XE#610])
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7828/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11092/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
> 
>   * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs:
>     - shard-dg2-set2:     [SKIP][57] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][58] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +4 other tests skip
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7828/shard-dg2-436/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11092/shard-dg2-434/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html
> 
>   * igt@kms_chamelium_edid@vga-edid-read:
>     - shard-dg2-set2:     [SKIP][59] ([Intel XE#1201]) -> [SKIP][60] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7828/shard-dg2-436/igt@kms_chamelium_edid@vga-edid-read.html
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11092/shard-dg2-463/igt@kms_chamelium_edid@vga-edid-read.html
> 
>   * igt@kms_chamelium_frames@hdmi-aspect-ratio:
>     - shard-dg2-set2:     [SKIP][61] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][62] ([Intel XE#1201] / [Intel XE#1226])
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7828/shard-dg2-435/igt@kms_chamelium_frames@hdmi-aspect-ratio.html
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11092/shard-dg2-433/igt@kms_chamelium_frames@hdmi-aspect-ratio.html
> 
>   * igt@kms_content_protection@legacy:
>     - shard-dg2-set2:     [SKIP][63] ([Intel XE#1201] / [Intel XE#455]) -> [FAIL][64] ([Intel XE#1178])
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7828/shard-dg2-464/igt@kms_content_protection@legacy.html
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11092/shard-dg2-466/igt@kms_content_protection@legacy.html
> 
>   * igt@kms_content_protection@srm:
>     - shard-dg2-set2:     [FAIL][65] ([Intel XE#1178]) -> [SKIP][66] ([Intel XE#1201] / [Intel XE#455])
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7828/shard-dg2-466/igt@kms_content_protection@srm.html
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11092/shard-dg2-464/igt@kms_content_protection@srm.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
>     - shard-dg2-set2:     [SKIP][67] ([Intel XE#1201]) -> [SKIP][68] ([Intel XE#1201] / [Intel XE#1226])
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7828/shard-dg2-436/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11092/shard-dg2-433/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
> 
>   * igt@kms_cursor_edge_walk@256x256-right-edge:
>     - shard-dg2-set2:     [DMESG-WARN][69] ([Intel XE#1214] / [Intel XE#282]) -> [FAIL][70] ([Intel XE#581])
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7828/shard-dg2-433/igt@kms_cursor_edge_walk@256x256-right-edge.html
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11092/shard-dg2-433/igt@kms_cursor_edge_walk@256x256-right-edge.html
> 
>   * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
>     - shard-dg2-set2:     [DMESG-WARN][71] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910]) -> [DMESG-WARN][72] ([Intel XE#1214] / [Intel XE#282])
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7828/shard-dg2-463/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11092/shard-dg2-435/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
> 
>   * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
>     - shard-dg2-set2:     [SKIP][73] ([Intel XE#1201]) -> [DMESG-WARN][74] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910])
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7828/shard-dg2-436/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11092/shard-dg2-435/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
>     - shard-dg2-set2:     [SKIP][75] ([Intel XE#1201]) -> [SKIP][76] ([Intel XE#1201] / [Intel XE#323])
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7828/shard-dg2-436/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11092/shard-dg2-433/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
>     - shard-dg2-set2:     [SKIP][77] ([Intel XE#1201] / [Intel XE#1234]) -> [DMESG-WARN][78] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910])
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7828/shard-dg2-436/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11092/shard-dg2-466/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
>     - shard-dg2-set2:     [SKIP][79] ([Intel XE#1201]) -> [SKIP][80] ([Intel XE#1201] / [Intel XE#455]) +4 other tests skip
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7828/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11092/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:
>     - shard-dg2-set2:     [SKIP][81] ([Intel XE#1201]) -> [SKIP][82] ([Intel XE#1201] / [Intel XE#651]) +3 other tests skip
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7828/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11092/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
>     - shard-dg2-set2:     [SKIP][83] ([Intel XE#1201] / [Intel XE#1234]) -> [SKIP][84] ([Intel XE#1201] / [Intel XE#651])
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7828/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11092/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move:
>     - shard-dg2-set2:     [SKIP][85] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][86] ([Intel XE#1201] / [Intel XE#1226]) +1 other test skip
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7828/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move.html
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11092/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
>     - shard-dg2-set2:     [SKIP][87] ([Intel XE#1201]) -> [SKIP][88] ([Intel XE#1201] / [Intel XE#658])
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7828/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11092/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt:
>     - shard-dg2-set2:     [SKIP][89] ([Intel XE#1201]) -> [SKIP][90] ([Intel XE#1201] / [Intel XE#653]) +5 other tests skip
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7828/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt.html
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11092/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render:
>     - shard-dg2-set2:     [SKIP][91] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][92] ([Intel XE#1201] / [Intel XE#1226])
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7828/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render.html
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11092/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render.html
> 
>   * igt@kms_plane_cursor@primary:
>     - shard-dg2-set2:     [FAIL][93] ([Intel XE#616]) -> [FAIL][94] ([Intel XE#581])
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7828/shard-dg2-433/igt@kms_plane_cursor@primary.html
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11092/shard-dg2-433/igt@kms_plane_cursor@primary.html
> 
>   * igt@kms_psr@fbc-psr2-primary-page-flip:
>     - shard-dg2-set2:     [SKIP][95] ([Intel XE#1201]) -> [SKIP][96] ([Intel XE#1201] / [Intel XE#929]) +2 other tests skip
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7828/shard-dg2-436/igt@kms_psr@fbc-psr2-primary-page-flip.html
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11092/shard-dg2-463/igt@kms_psr@fbc-psr2-primary-page-flip.html
> 
>   * igt@kms_psr@psr2-sprite-plane-move:
>     - shard-dg2-set2:     [SKIP][97] ([Intel XE#1201] / [Intel XE#1234]) -> [SKIP][98] ([Intel XE#1201] / [Intel XE#929])
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7828/shard-dg2-436/igt@kms_psr@psr2-sprite-plane-move.html
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11092/shard-dg2-435/igt@kms_psr@psr2-sprite-plane-move.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-large:
>     - shard-dg2-set2:     [TIMEOUT][99] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392]) -> [INCOMPLETE][100] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7828/shard-dg2-464/igt@xe_evict@evict-beng-mixed-many-threads-large.html
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11092/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-large.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
>   [Intel XE#1043]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1043
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>   [Intel XE#1226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226
>   [Intel XE#1234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1234
>   [Intel XE#1388]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1388
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
>   [Intel XE#294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/294
>   [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#581]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/581
>   [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
>   [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>   [Intel XE#650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/650
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
>   [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [i915#6077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7828 -> IGTPW_11092
>   * Linux: xe-1213-3ac3efef3a1fc9d494b0a63c78bd0039a0b3d009 -> xe-1217-8f904f61a50ed9e9869bead4a4dd767fce79a025
> 
>   IGTPW_11092: 11092
>   IGT_7828: 68a055ff91b91dadb01d9501cd8670f654b5b952 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1213-3ac3efef3a1fc9d494b0a63c78bd0039a0b3d009: 3ac3efef3a1fc9d494b0a63c78bd0039a0b3d009
>   xe-1217-8f904f61a50ed9e9869bead4a4dd767fce79a025: 8f904f61a50ed9e9869bead4a4dd767fce79a025
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133130v1/index.html
