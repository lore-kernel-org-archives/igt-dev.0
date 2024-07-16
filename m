Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05560C3DA49
	for <igt-dev@archiver.kernel.org>; Tue, 16 Jul 2024 15:29:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EB3A10E783;
	Tue, 16 Jul 2024 15:29:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RGAIuvMV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B59410E782;
 Tue, 16 Jul 2024 15:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721143779; x=1752679779;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2R8lxfP6cqZO4+l7LyQnNPq0JY2Pqdal3Q8UGwWhL94=;
 b=RGAIuvMVjIF/qyTudzs+VvF0ohT6iRN04N8E4Xj38KAkSEJuPIfO5oAy
 H8Ox1Max15kAZotU6PMu33fQ0lBaEhLlI8Ko9ZK5+7dtby5SHeiRTFQxg
 ofoxMrx+HFgeQdBzolrEVbKyBukZgglGLAavsVIiSJLRKspVIqll2YOKU
 ubipxOL58ytZQoAUsfrfKX/CT/0c1tx0vx6vGcWDEEvo5g0PjvG2KmRGU
 jdEZBKNrhOZdvKcL53VRRL8W1Ju/6+LamoJGBdbbG3nK+NIsMYV1wA0nH
 W3yffL4MkZs/d2haHExKwUY1FsJAcBPOMi0SE/Takd+hZyx35I+cctpv+ Q==;
X-CSE-ConnectionGUID: lSXlgD82RBKmVaZx5FAtLw==
X-CSE-MsgGUID: BwF06eDKS9mObv6y6UCRGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="18786088"
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; d="scan'208";a="18786088"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 08:29:38 -0700
X-CSE-ConnectionGUID: Vup3v5cqT2mLD6+ksHJ31Q==
X-CSE-MsgGUID: B95sPUdbQOWqQU7o1IvrjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; d="scan'208";a="54290117"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.26.160])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 08:29:38 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: I915-ci-infra@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Subject: Re: =?UTF-8?B?4pyX?= CI.xeFULL: failure for tests/gem_ctx_exec: Fix
 failing preempt timeout updates (rev3)
Date: Tue, 16 Jul 2024 17:29:33 +0200
Message-ID: <4654037.ElGaqSPkdT@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <172113665729.247216.12635030062734377825@2413ebb6fbb6>
References: <20240715183000.2828719-7-janusz.krzysztofik@linux.intel.com>
 <172113665729.247216.12635030062734377825@2413ebb6fbb6>
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

On Tuesday, 16 July 2024 15:30:57 GMT+2 Patchwork wrote:
> == Series Details ==
> 
> Series: tests/gem_ctx_exec: Fix failing preempt timeout updates (rev3)
> URL   : https://patchwork.freedesktop.org/series/136109/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_7927_full -> XEIGTPW_11413_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_11413_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_11413_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_11413_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_pm@s4-d3hot-basic-exec:
>     - shard-dg2-set2:     [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7927/shard-dg2-464/igt@xe_pm@s4-d3hot-basic-exec.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-dg2-464/igt@xe_pm@s4-d3hot-basic-exec.html

Dear I915-ci-infra@lists.freedesktop.org,

The above not only doesn't have anything to do with my series, but also looks 
to me like a known issue, Intel XE#1551.  Please update filters and re-report.

Thanks,
Janusz

> 
>   
> #### Warnings ####
> 
>   * igt@xe_exec_reset@close-fd:
>     - shard-dg2-set2:     [ABORT][3] ([Intel XE#2271]) -> [ABORT][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7927/shard-dg2-463/igt@xe_exec_reset@close-fd.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-dg2-433/igt@xe_exec_reset@close-fd.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_11413_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_async_flips@test-cursor:
>     - shard-lnl:          NOTRUN -> [SKIP][5] ([Intel XE#664])
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-lnl-4/igt@kms_async_flips@test-cursor.html
> 
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][6] ([Intel XE#1201] / [Intel XE#316])
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-dg2-433/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
>     - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#1407])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-lnl-5/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][8] ([Intel XE#1124] / [Intel XE#1201]) +3 other tests skip
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
>     - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#1477])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-lnl-5/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#1124]) +6 other tests skip
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-lnl-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
>     - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#367])
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-lnl-6/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html
> 
>   * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
>     - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#1512])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-lnl-7/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#1201] / [Intel XE#787]) +34 other tests skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#1399]) +17 other tests skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-lnl-6/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +9 other tests skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-dg2-436/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html
> 
>   * igt@kms_cdclk@mode-transition:
>     - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#314] / [Intel XE#599])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-lnl-6/igt@kms_cdclk@mode-transition.html
> 
>   * igt@kms_cdclk@mode-transition@pipe-b-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#314]) +3 other tests skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-lnl-6/igt@kms_cdclk@mode-transition@pipe-b-edp-1.html
> 
>   * igt@kms_chamelium_audio@hdmi-audio:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel XE#373]) +3 other tests skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-dg2-434/igt@kms_chamelium_audio@hdmi-audio.html
> 
>   * igt@kms_chamelium_color@ctm-0-75:
>     - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#306])
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-lnl-2/igt@kms_chamelium_color@ctm-0-75.html
> 
>   * igt@kms_chamelium_color@ctm-red-to-blue:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#1201] / [Intel XE#306])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-dg2-466/igt@kms_chamelium_color@ctm-red-to-blue.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd:
>     - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#373]) +11 other tests skip
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-lnl-7/igt@kms_chamelium_hpd@vga-hpd.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-0:
>     - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#307])
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-lnl-7/igt@kms_content_protection@dp-mst-lic-type-0.html
> 
>   * igt@kms_content_protection@lic-type-0:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][23] ([Intel XE#1204]) +1 other test fail
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-dg2-435/igt@kms_content_protection@lic-type-0.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
>     - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#1424]) +4 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-lnl-2/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#1201] / [Intel XE#308])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-dg2-463/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-max-size:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#1201] / [Intel XE#455]) +6 other tests skip
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-dg2-436/igt@kms_cursor_crc@cursor-sliding-max-size.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>     - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#323]) +1 other test skip
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-lnl-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
>     - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#309]) +3 other tests skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-lnl-2/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
> 
>   * igt@kms_feature_discovery@dp-mst:
>     - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#1137])
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-lnl-6/igt@kms_feature_discovery@dp-mst.html
> 
>   * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:
>     - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#1421]) +5 other tests skip
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-lnl-5/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html
> 
>   * igt@kms_flip@absolute-wf_vblank:
>     - shard-dg2-set2:     [PASS][31] -> [INCOMPLETE][32] ([Intel XE#1195]) +4 other tests incomplete
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7927/shard-dg2-436/igt@kms_flip@absolute-wf_vblank.html
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-dg2-463/igt@kms_flip@absolute-wf_vblank.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#1401] / [Intel XE#1745]) +2 other tests skip
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#1401]) +2 other tests skip
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#1201] / [Intel XE#651]) +12 other tests skip
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:
>     - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#651]) +13 other tests skip
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-y:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#1201] / [Intel XE#658])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
>     - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#1469])
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#656]) +36 other tests skip
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-lnl-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-slowdraw:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#1201] / [Intel XE#653]) +11 other tests skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-slowdraw.html
> 
>   * igt@kms_getfb@getfb2-accept-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#1339])
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-lnl-8/igt@kms_getfb@getfb2-accept-ccs.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +1 other test skip
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#498]) +3 other tests skip
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-lnl-2/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-edp-1.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-c-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#305]) +11 other tests skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-lnl-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-c-edp-1.html
> 
>   * igt@kms_pm_dc@dc3co-vpb-simulation:
>     - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#736])
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-lnl-6/igt@kms_pm_dc@dc3co-vpb-simulation.html
> 
>   * igt@kms_pm_dc@dc5-psr:
>     - shard-lnl:          [PASS][47] -> [FAIL][48] ([Intel XE#718])
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7927/shard-lnl-2/igt@kms_pm_dc@dc5-psr.html
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-lnl-2/igt@kms_pm_dc@dc5-psr.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#1201] / [Intel XE#908])
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-dg2-436/igt@kms_pm_dc@dc6-dpms.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp:
>     - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#1439]) +1 other test skip
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-lnl-6/igt@kms_pm_rpm@modeset-non-lpsp.html
> 
>   * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#1201] / [Intel XE#1489]) +2 other tests skip
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-dg2-463/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr@fbc-psr-sprite-render:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#1201] / [Intel XE#929]) +8 other tests skip
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-dg2-463/igt@kms_psr@fbc-psr-sprite-render.html
> 
>   * igt@kms_psr@pr-no-drrs:
>     - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#1406]) +2 other tests skip
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-lnl-2/igt@kms_psr@pr-no-drrs.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>     - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#1127])
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-lnl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
> 
>   * igt@kms_setmode@invalid-clone-single-crtc-stealing:
>     - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#1435])
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-lnl-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][56] -> [FAIL][57] ([Intel XE#899])
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7927/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-suspend:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][58] ([Intel XE#1551]) +1 other test dmesg-warn
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-dg2-436/igt@kms_vblank@ts-continuation-dpms-suspend.html
> 
>   * igt@kms_vrr@negative-basic:
>     - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#599]) +5 other tests skip
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-lnl-4/igt@kms_vrr@negative-basic.html
> 
>   * igt@kms_writeback@writeback-fb-id:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#1201] / [Intel XE#756])
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-dg2-463/igt@kms_writeback@writeback-fb-id.html
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-off:
>     - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#1091])
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-lnl-4/igt@sriov_basic@enable-vfs-autoprobe-off.html
> 
>   * igt@xe_compute@ccs-mode-compute-kernel:
>     - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#1447])
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-lnl-6/igt@xe_compute@ccs-mode-compute-kernel.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0xfffe:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#1126] / [Intel XE#1201])
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfffe.html
> 
>   * igt@xe_evict@evict-beng-large-multi-vm-cm:
>     - shard-dg2-set2:     [PASS][64] -> [FAIL][65] ([Intel XE#1600])
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7927/shard-dg2-464/igt@xe_evict@evict-beng-large-multi-vm-cm.html
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-dg2-466/igt@xe_evict@evict-beng-large-multi-vm-cm.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-small:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][66] ([Intel XE#1195] / [Intel XE#1473])
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-dg2-464/igt@xe_evict@evict-beng-mixed-many-threads-small.html
> 
>   * igt@xe_evict@evict-beng-mixed-threads-large-multi-vm:
>     - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#688]) +9 other tests skip
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-lnl-2/igt@xe_evict@evict-beng-mixed-threads-large-multi-vm.html
> 
>   * igt@xe_evict@evict-cm-threads-large:
>     - shard-dg2-set2:     [PASS][68] -> [TIMEOUT][69] ([Intel XE#1473] / [Intel XE#392])
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7927/shard-dg2-463/igt@xe_evict@evict-cm-threads-large.html
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-dg2-466/igt@xe_evict@evict-cm-threads-large.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:
>     - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#1392]) +7 other tests skip
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-lnl-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html
> 
>   * igt@xe_exec_fault_mode@once-basic-imm:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#1201] / [Intel XE#288]) +9 other tests skip
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-dg2-464/igt@xe_exec_fault_mode@once-basic-imm.html
> 
>   * igt@xe_exec_reset@parallel-close-fd:
>     - shard-dg2-set2:     [PASS][72] -> [ABORT][73] ([Intel XE#2273])
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7927/shard-dg2-433/igt@xe_exec_reset@parallel-close-fd.html
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-dg2-436/igt@xe_exec_reset@parallel-close-fd.html
> 
>   * igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate-race:
>     - shard-dg2-set2:     NOTRUN -> [ABORT][74] ([Intel XE#2271])
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-dg2-464/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate-race.html
> 
>   * igt@xe_live_ktest@xe_dma_buf:
>     - shard-dg2-set2:     [PASS][75] -> [SKIP][76] ([Intel XE#1192] / [Intel XE#1201])
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7927/shard-dg2-433/igt@xe_live_ktest@xe_dma_buf.html
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-dg2-466/igt@xe_live_ktest@xe_dma_buf.html
> 
>   * igt@xe_mmap@small-bar:
>     - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#512])
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-lnl-5/igt@xe_mmap@small-bar.html
> 
>   * igt@xe_pm@s2idle-exec-after:
>     - shard-lnl:          [PASS][78] -> [INCOMPLETE][79] ([Intel XE#1358])
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7927/shard-lnl-5/igt@xe_pm@s2idle-exec-after.html
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-lnl-5/igt@xe_pm@s2idle-exec-after.html
> 
>   * igt@xe_pm@s3-basic-exec:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][80] ([Intel XE#1551] / [Intel XE#569])
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-dg2-435/igt@xe_pm@s3-basic-exec.html
>     - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#584])
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-lnl-7/igt@xe_pm@s3-basic-exec.html
> 
>   * igt@xe_pm@s3-d3cold-basic-exec:
>     - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#366]) +1 other test skip
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-lnl-2/igt@xe_pm@s3-d3cold-basic-exec.html
> 
>   * igt@xe_pm@s3-d3hot-basic-exec:
>     - shard-dg2-set2:     [PASS][83] -> [DMESG-WARN][84] ([Intel XE#1551] / [Intel XE#569])
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7927/shard-dg2-463/igt@xe_pm@s3-d3hot-basic-exec.html
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-dg2-433/igt@xe_pm@s3-d3hot-basic-exec.html
> 
>   * igt@xe_pm@s3-vm-bind-prefetch:
>     - shard-dg2-set2:     [PASS][85] -> [DMESG-WARN][86] ([Intel XE#569])
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7927/shard-dg2-466/igt@xe_pm@s3-vm-bind-prefetch.html
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-dg2-466/igt@xe_pm@s3-vm-bind-prefetch.html
> 
>   * igt@xe_pm@s4-mocs:
>     - shard-dg2-set2:     [PASS][87] -> [DMESG-WARN][88] ([Intel XE#2280])
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7927/shard-dg2-466/igt@xe_pm@s4-mocs.html
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-dg2-434/igt@xe_pm@s4-mocs.html
> 
>   * igt@xe_pm@s4-vm-bind-prefetch:
>     - shard-dg2-set2:     [PASS][89] -> [DMESG-WARN][90] ([Intel XE#2019]) +1 other test dmesg-warn
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7927/shard-dg2-466/igt@xe_pm@s4-vm-bind-prefetch.html
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-dg2-463/igt@xe_pm@s4-vm-bind-prefetch.html
> 
>   * igt@xe_pm@vram-d3cold-threshold:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#1201] / [Intel XE#579])
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-dg2-464/igt@xe_pm@vram-d3cold-threshold.html
>     - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#579])
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-lnl-7/igt@xe_pm@vram-d3cold-threshold.html
> 
>   * igt@xe_pm_residency@toggle-gt-c6:
>     - shard-lnl:          [PASS][93] -> [FAIL][94] ([Intel XE#958])
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7927/shard-lnl-4/igt@xe_pm_residency@toggle-gt-c6.html
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html
> 
>   * igt@xe_query@multigpu-query-invalid-size:
>     - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#944]) +2 other tests skip
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-lnl-4/igt@xe_query@multigpu-query-invalid-size.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [FAIL][96] -> [PASS][97] +2 other tests pass
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7927/shard-dg2-463/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-dg2-466/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:
>     - shard-lnl:          [FAIL][98] -> [PASS][99] +1 other test pass
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7927/shard-lnl-4/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-lnl-2/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-lnl:          [FAIL][100] ([Intel XE#1659]) -> [PASS][101]
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7927/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_flip@flip-vs-panning@a-hdmi-a6:
>     - shard-dg2-set2:     [INCOMPLETE][102] ([Intel XE#1195]) -> [PASS][103] +1 other test pass
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7927/shard-dg2-436/igt@kms_flip@flip-vs-panning@a-hdmi-a6.html
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-dg2-435/igt@kms_flip@flip-vs-panning@a-hdmi-a6.html
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - shard-dg2-set2:     [SKIP][104] ([Intel XE#1201] / [Intel XE#417]) -> [PASS][105]
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7927/shard-dg2-435/igt@kms_hdmi_inject@inject-audio.html
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-dg2-466/igt@kms_hdmi_inject@inject-audio.html
> 
>   * {igt@kms_plane@plane-position-covered@pipe-a-plane-4}:
>     - shard-lnl:          [DMESG-FAIL][106] ([Intel XE#324]) -> [PASS][107] +1 other test pass
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7927/shard-lnl-4/igt@kms_plane@plane-position-covered@pipe-a-plane-4.html
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-lnl-2/igt@kms_plane@plane-position-covered@pipe-a-plane-4.html
> 
>   * {igt@kms_plane@plane-position-covered@pipe-b-plane-4}:
>     - shard-lnl:          [DMESG-WARN][108] ([Intel XE#324]) -> [PASS][109] +1 other test pass
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7927/shard-lnl-4/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-lnl-2/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html
> 
>   * igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant:
>     - shard-lnl:          [DMESG-WARN][110] ([Intel XE#1705]) -> [PASS][111] +1 other test pass
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7927/shard-lnl-4/igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant.html
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-lnl-7/igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant.html
> 
>   * igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant@pipe-c-edp-1:
>     - shard-lnl:          [DMESG-WARN][112] -> [PASS][113]
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7927/shard-lnl-4/igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant@pipe-c-edp-1.html
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-lnl-7/igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant@pipe-c-edp-1.html
> 
>   * igt@kms_psr@fbc-psr2-cursor-plane-move@edp-1:
>     - shard-lnl:          [FAIL][114] ([Intel XE#1649]) -> [PASS][115] +1 other test pass
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7927/shard-lnl-4/igt@kms_psr@fbc-psr2-cursor-plane-move@edp-1.html
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-lnl-6/igt@kms_psr@fbc-psr2-cursor-plane-move@edp-1.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:
>     - shard-dg2-set2:     [FAIL][116] ([Intel XE#899]) -> [PASS][117]
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7927/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html
> 
>   * igt@kms_vrr@flip-dpms:
>     - shard-lnl:          [FAIL][118] ([Intel XE#1522]) -> [PASS][119] +1 other test pass
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7927/shard-lnl-8/igt@kms_vrr@flip-dpms.html
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-lnl-5/igt@kms_vrr@flip-dpms.html
> 
>   * igt@xe_evict@evict-threads-large:
>     - shard-dg2-set2:     [TIMEOUT][120] ([Intel XE#1473] / [Intel XE#392]) -> [PASS][121]
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7927/shard-dg2-463/igt@xe_evict@evict-threads-large.html
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-dg2-434/igt@xe_evict@evict-threads-large.html
> 
>   * igt@xe_live_ktest@xe_migrate:
>     - shard-dg2-set2:     [SKIP][122] ([Intel XE#1192] / [Intel XE#1201]) -> [PASS][123] +1 other test pass
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7927/shard-dg2-436/igt@xe_live_ktest@xe_migrate.html
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-dg2-464/igt@xe_live_ktest@xe_migrate.html
> 
>   * igt@xe_module_load@reload-no-display:
>     - shard-dg2-set2:     [DMESG-WARN][124] ([Intel XE#2019]) -> [PASS][125] +3 other tests pass
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7927/shard-dg2-466/igt@xe_module_load@reload-no-display.html
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-dg2-434/igt@xe_module_load@reload-no-display.html
> 
>   * {igt@xe_oa@oa-regs-whitelisted}:
>     - shard-lnl:          [FAIL][126] ([Intel XE#2259]) -> [PASS][127]
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7927/shard-lnl-5/igt@xe_oa@oa-regs-whitelisted.html
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-lnl-5/igt@xe_oa@oa-regs-whitelisted.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_content_protection@atomic-dpms:
>     - shard-dg2-set2:     [INCOMPLETE][128] ([Intel XE#1195]) -> [FAIL][129] ([Intel XE#1178]) +1 other test fail
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7927/shard-dg2-436/igt@kms_content_protection@atomic-dpms.html
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-dg2-463/igt@kms_content_protection@atomic-dpms.html
> 
>   * igt@kms_content_protection@legacy@pipe-a-dp-4:
>     - shard-dg2-set2:     [FAIL][130] ([Intel XE#1178]) -> [INCOMPLETE][131] ([Intel XE#1195]) +1 other test incomplete
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7927/shard-dg2-434/igt@kms_content_protection@legacy@pipe-a-dp-4.html
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-dg2-463/igt@kms_content_protection@legacy@pipe-a-dp-4.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>     - shard-dg2-set2:     [DMESG-WARN][132] ([Intel XE#1551]) -> [INCOMPLETE][133] ([Intel XE#1195] / [Intel XE#1551] / [Intel XE#2049])
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7927/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible.html
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-dg2-set2:     [SKIP][134] ([Intel XE#1201] / [Intel XE#362]) -> [SKIP][135] ([Intel XE#1201] / [Intel XE#1500])
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7927/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@xe_evict@evict-beng-mixed-threads-large:
>     - shard-dg2-set2:     [TIMEOUT][136] ([Intel XE#1473] / [Intel XE#392]) -> [TIMEOUT][137] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392])
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7927/shard-dg2-434/igt@xe_evict@evict-beng-mixed-threads-large.html
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-dg2-434/igt@xe_evict@evict-beng-mixed-threads-large.html
> 
>   * igt@xe_evict@evict-mixed-threads-large:
>     - shard-dg2-set2:     [TIMEOUT][138] ([Intel XE#1473] / [Intel XE#392]) -> [FAIL][139] ([Intel XE#1000])
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7927/shard-dg2-434/igt@xe_evict@evict-mixed-threads-large.html
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
>   [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
>   [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
>   [Intel XE#1339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1339
>   [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
>   [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
>   [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
>   [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
>   [Intel XE#1522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1522
>   [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
>   [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
>   [Intel XE#1649]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649
>   [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
>   [Intel XE#1705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1705
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#2019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019
>   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>   [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
>   [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>   [Intel XE#2207]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2207
>   [Intel XE#2259]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2259
>   [Intel XE#2271]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2271
>   [Intel XE#2273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2273
>   [Intel XE#2280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>   [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
>   [Intel XE#417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/417
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
>   [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
>   [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
>   [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
>   [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
>   [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
>   [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
>   [Intel XE#736]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/736
>   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7927 -> IGTPW_11413
> 
>   IGTPW_11413: abe8b1e57baf368289de8d82bc0b96ae27ad3958 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_7927: a2ab0ec12ef447c96c67dc539813462b6b39f857 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1613-b6af83ceb593bc4e0d79acda73684462b13a15b9: b6af83ceb593bc4e0d79acda73684462b13a15b9
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11413/index.html
> 




