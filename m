Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09451C54FCD
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jul 2026 10:52:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3E6D10E035;
	Wed, 29 Jul 2026 10:52:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="esgwXjoV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B421710E035;
 Wed, 29 Jul 2026 10:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785322290; x=1816858290;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=p/MGSr6BzwSc7fSUlU/DUjDZiz6kP6sBw1KQ4mqqd70=;
 b=esgwXjoVY5Pwd+cCmkAHDU5JU/k0PXBb02TXuIn+Hxgt6WLXSAyhNpG9
 oOIPxRYwBoZ6dbBDdVU/wd+TQNSwXrZ16q20XwVhwgynBl1011GQuDeUl
 W1S4DXlCaN3NhtTOT9ijYRsK6lVOrDz2kv9rxpKYwDs27esuUOdP7B58K
 2kEjt8vjE2TOshGfHFF1o/N77JYBON+jrw4Mv38r90Fi5h4F9zLkdx4aL
 vbqY/ZNKcEkHPuc6BqzvQMsrij/vch73tsNaS/RFVLfaNpLUTSfdbn8T6
 iSmOwMSXvRPaLNz6CpyqDLAjJsuUbum0HKsQckXjgtnqhZpVj4oMVVFB4 A==;
X-CSE-ConnectionGUID: pIhXJSMNT7+2FaA5Yj1BTQ==
X-CSE-MsgGUID: UASvbZMpQWCcCl5Hu/1GGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="89811937"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="89811937"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 03:51:30 -0700
X-CSE-ConnectionGUID: XtQ4kOI3SD297TyXr0CMeg==
X-CSE-MsgGUID: Wp1t4LvCTHCZhjgjV3oKiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="256055386"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 03:51:28 -0700
Date: Wed, 29 Jul 2026 12:51:25 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Robert Mazur <robert.mazur@imgtec.com>, I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbA==?= =?utf-8?Q?=3A?= failure for
 tests/imagination: Additional DEV_QUERY tests
Message-ID: <20260729105125.qmyuwvdmg4dlh4kn@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Robert Mazur <robert.mazur@imgtec.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20260728-test-imagination-additional-dev_query-tests-v1-0-f361c7c2b513@imgtec.com>
 <178528486367.232538.2806744058627848232@6beec6c84f66>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <178528486367.232538.2806744058627848232@6beec6c84f66>
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
On 2026-07-29 at 00:27:43 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/imagination: Additional DEV_QUERY tests
> URL   : https://patchwork.freedesktop.org/series/171212/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_9029_full -> IGTPW_15602_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_15602_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_15602_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15602/index.html
> 
> Participating hosts (10 -> 10)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_15602_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_color_pipeline@plane-lut1d-post-ctm3x4:
>     - shard-dg2:          [PASS][1] -> [SKIP][2] +86 other tests skip
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9029/shard-dg2-4/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15602/shard-dg2-10/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4.html
> 
>   * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu:
>     - shard-dg2:          NOTRUN -> [SKIP][3] +13 other tests skip
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15602/shard-dg2-10/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html
> 

Unrelated, this is non-Intel test.



Regards,
Kamil


>   
> #### Warnings ####
> 
>   * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
>     - shard-dg2:          [SKIP][4] ([i915#9531]) -> [SKIP][5]
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9029/shard-dg2-3/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15602/shard-dg2-10/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
> 
>   * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-dg2:          [SKIP][6] ([i915#3828]) -> [SKIP][7]
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9029/shard-dg2-3/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15602/shard-dg2-10/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
>     - shard-dg2:          [SKIP][8] ([i915#12313]) -> [SKIP][9] +2 other tests skip
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9029/shard-dg2-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15602/shard-dg2-10/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
>     - shard-dg2:          [SKIP][10] ([i915#6095]) -> [SKIP][11] +1 other test skip
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9029/shard-dg2-1/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15602/shard-dg2-10/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc:
>     - shard-dg2:          [SKIP][12] ([i915#10307] / [i915#6095]) -> [SKIP][13] +10 other tests skip
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9029/shard-dg2-6/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15602/shard-dg2-10/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html
> 
>   * igt@kms_content_protection@uevent-hdcp14:
>     - shard-dg2:          [SKIP][14] ([i915#15865]) -> [SKIP][15] +2 other tests skip
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9029/shard-dg2-6/igt@kms_content_protection@uevent-hdcp14.html
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15602/shard-dg2-10/igt@kms_content_protection@uevent-hdcp14.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
>     - shard-dg2:          [SKIP][16] ([i915#13049]) -> [SKIP][17]
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9029/shard-dg2-1/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15602/shard-dg2-10/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-32x10:
>     - shard-dg2:          [SKIP][18] ([i915#3555]) -> [SKIP][19] +2 other tests skip
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9029/shard-dg2-3/igt@kms_cursor_crc@cursor-sliding-32x10.html
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15602/shard-dg2-10/igt@kms_cursor_crc@cursor-sliding-32x10.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
>     - shard-dg2:          [SKIP][20] ([i915#13046] / [i915#5354]) -> [SKIP][21] +4 other tests skip
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9029/shard-dg2-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15602/shard-dg2-10/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
>     - shard-dg2:          [SKIP][22] ([i915#9067]) -> [SKIP][23]
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9029/shard-dg2-1/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15602/shard-dg2-10/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
> 
>   * igt@kms_dp_link_training@non-uhbr-sst:
>     - shard-dg2:          [SKIP][24] ([i915#13749]) -> [SKIP][25]
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9029/shard-dg2-4/igt@kms_dp_link_training@non-uhbr-sst.html
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15602/shard-dg2-10/igt@kms_dp_link_training@non-uhbr-sst.html
> 
>   * igt@kms_dp_link_training@uhbr-sst:
>     - shard-dg2:          [SKIP][26] ([i915#13748]) -> [SKIP][27]
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9029/shard-dg2-7/igt@kms_dp_link_training@uhbr-sst.html
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15602/shard-dg2-10/igt@kms_dp_link_training@uhbr-sst.html
> 
>   * igt@kms_dp_linktrain_fallback@dsc-fallback:
>     - shard-dg2:          [SKIP][28] ([i915#13707]) -> [SKIP][29]
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9029/shard-dg2-8/igt@kms_dp_linktrain_fallback@dsc-fallback.html
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15602/shard-dg2-10/igt@kms_dp_linktrain_fallback@dsc-fallback.html
> 
>   * igt@kms_dsc@dsc-with-bpc-formats:
>     - shard-dg2:          [SKIP][30] ([i915#16361]) -> [SKIP][31] +2 other tests skip
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9029/shard-dg2-6/igt@kms_dsc@dsc-with-bpc-formats.html
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15602/shard-dg2-10/igt@kms_dsc@dsc-with-bpc-formats.html
> 
>   * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-pwrite:
>     - shard-dg2:          [SKIP][32] ([i915#15991]) -> [SKIP][33] +40 other tests skip
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9029/shard-dg2-7/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-pwrite.html
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15602/shard-dg2-10/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-pwrite.html
> 
>   * igt@kms_frontbuffer_tracking@fbchdr-tiling-y:
>     - shard-dg2:          [SKIP][34] ([i915#10055]) -> [SKIP][35]
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9029/shard-dg2-4/igt@kms_frontbuffer_tracking@fbchdr-tiling-y.html
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15602/shard-dg2-10/igt@kms_frontbuffer_tracking@fbchdr-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-pwrite:
>     - shard-dg2:          [SKIP][36] ([i915#15989]) -> [SKIP][37] +13 other tests skip
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9029/shard-dg2-1/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-pwrite.html
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15602/shard-dg2-10/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-pwrite.html
> 
>   * igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-mmap-wc:
>     - shard-dg2:          [SKIP][38] ([i915#15990]) -> [SKIP][39] +25 other tests skip
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9029/shard-dg2-4/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-mmap-wc.html
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15602/shard-dg2-10/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psrhdr-suspend:
>     - shard-dg2:          [SKIP][40] ([i915#15102]) -> [SKIP][41] +16 other tests skip
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9029/shard-dg2-3/igt@kms_frontbuffer_tracking@psrhdr-suspend.html
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15602/shard-dg2-10/igt@kms_frontbuffer_tracking@psrhdr-suspend.html
> 
>   * igt@kms_hdr@invalid-metadata-sizes:
>     - shard-dg2:          [SKIP][42] ([i915#16518] / [i915#3555] / [i915#8228]) -> [SKIP][43] +1 other test skip
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9029/shard-dg2-6/igt@kms_hdr@invalid-metadata-sizes.html
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15602/shard-dg2-10/igt@kms_hdr@invalid-metadata-sizes.html
> 
>   * igt@kms_plane_multiple@tiling-y:
>     - shard-dg2:          [SKIP][44] ([i915#14259]) -> [SKIP][45]
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9029/shard-dg2-4/igt@kms_plane_multiple@tiling-y.html
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15602/shard-dg2-10/igt@kms_plane_multiple@tiling-y.html
> 
>   * igt@kms_rotation_crc@exhaust-fences:
>     - shard-dg2:          [SKIP][46] ([i915#4235]) -> [SKIP][47]
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9029/shard-dg2-4/igt@kms_rotation_crc@exhaust-fences.html
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15602/shard-dg2-10/igt@kms_rotation_crc@exhaust-fences.html
> 
>   * igt@kms_vrr@lobf:
>     - shard-dg2:          [SKIP][48] ([i915#11920]) -> [SKIP][49]
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9029/shard-dg2-1/igt@kms_vrr@lobf.html
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15602/shard-dg2-10/igt@kms_vrr@lobf.html
> 
>   * igt@kms_vrr@seamless-rr-switch-vrr:
>     - shard-dg2:          [SKIP][50] ([i915#9906]) -> [SKIP][51]
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9029/shard-dg2-8/igt@kms_vrr@seamless-rr-switch-vrr.html
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15602/shard-dg2-10/igt@kms_vrr@seamless-rr-switch-vrr.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_15602_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@blit-reloc-purge-cache:
>     - shard-rkl:          NOTRUN -> [SKIP][52] ([i915#14544] / [i915#8411])
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15602/shard-rkl-6/igt@api_intel_bb@blit-reloc-purge-cache.html
> 
...cut...
