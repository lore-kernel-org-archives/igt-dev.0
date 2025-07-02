Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE42CC83013
	for <igt-dev@archiver.kernel.org>; Wed,  2 Jul 2025 12:22:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7996410E6F4;
	Wed,  2 Jul 2025 12:22:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SW75mica";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D74F10E6FD;
 Wed,  2 Jul 2025 12:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751458967; x=1782994967;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=eskeN47WtbfeehYbQ8GxJG8/P+5pb+9pEiC98JU9drk=;
 b=SW75micaDwYvPprXOOwVlb62fOBms/3PdfwaHgtQamiHSiKR22lr+kwE
 HpEfIUWZ6l642J5idSL+nr7FpwMLsjSNPfu3PXX4DVxR7yygQ13nmc4a5
 HF9kU6ufieqpuuvk5mHMygsy+IKZa7dekcX+Nv9N9M6T/ns6VfoToNRkN
 ifGuly5lWDu+LqTYxdwUsvlZp66tu6MRJmWGkMsS84OMyl05cTqa/1Ggm
 EkSBxhW14m7VOezlwTBONqpkXafyc7xVIZVociiimgWnLjZnoOAGuVLo4
 J2tefOMWwDrv77NsWj86bGHrsf2MzROWSd8CjvjVjppXbmo/XFlKYD8Tk A==;
X-CSE-ConnectionGUID: hAiF+UUgQ7OnORmqq2P8Pw==
X-CSE-MsgGUID: +Houe2n/QYy9itWyM40Z9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="64796651"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="64796651"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 05:22:46 -0700
X-CSE-ConnectionGUID: lv7na+cbQ7+YsvbsiWPQwQ==
X-CSE-MsgGUID: jVwwAI80SMGmJloVoRFq9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="154609432"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 05:22:45 -0700
Date: Wed, 2 Jul 2025 14:22:27 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Alex Hung <alex.hung@amd.com>, I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_fo?=
 =?utf-8?Q?r?= lib/igt_kms: Move get_writeback_formats_blob to lib (rev5)
Message-ID: <20250702122227.pbwkji2wdvpmamot@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Alex Hung <alex.hung@amd.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20250627234409.702251-1-alex.hung@amd.com>
 <175139638874.125172.1498370568023887433@1538d3639d33>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <175139638874.125172.1498370568023887433@1538d3639d33>
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
On 2025-07-01 at 18:59:48 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/igt_kms: Move get_writeback_formats_blob to lib (rev5)
> URL   : https://patchwork.freedesktop.org/series/150486/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8432_full -> IGTPW_13369_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_13369_full absolutely need to be
>   verified manually.

Unrelated to change in kms_writeback test, no need for re-run.

Regards,
Kamil

>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_13369_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13369/index.html
> 
> Participating hosts (11 -> 11)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_13369_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_cursor_crc@cursor-sliding-256x256:
>     - shard-rkl:          NOTRUN -> [SKIP][1] +13 other tests skip
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13369/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-256x256.html
> 
>   * igt@kms_plane_multiple@tiling-y:
>     - shard-rkl:          [PASS][2] -> [SKIP][3] +39 other tests skip
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/shard-rkl-5/igt@kms_plane_multiple@tiling-y.html
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13369/shard-rkl-6/igt@kms_plane_multiple@tiling-y.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
>     - shard-rkl:          [SKIP][4] ([i915#9531]) -> [SKIP][5]
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/shard-rkl-5/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13369/shard-rkl-6/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
> 
>   * igt@kms_big_fb@4-tiled-8bpp-rotate-0:
>     - shard-rkl:          [SKIP][6] ([i915#5286]) -> [SKIP][7] +4 other tests skip
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/shard-rkl-2/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13369/shard-rkl-6/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html
> 
>   * igt@kms_big_fb@linear-16bpp-rotate-270:
>     - shard-rkl:          [SKIP][8] ([i915#3638]) -> [SKIP][9]
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/shard-rkl-8/igt@kms_big_fb@linear-16bpp-rotate-270.html
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13369/shard-rkl-6/igt@kms_big_fb@linear-16bpp-rotate-270.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
>     - shard-rkl:          [SKIP][10] ([i915#12313]) -> [SKIP][11] +2 other tests skip
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/shard-rkl-8/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13369/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:
>     - shard-rkl:          [SKIP][12] ([i915#14098] / [i915#6095]) -> [SKIP][13] +10 other tests skip
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/shard-rkl-8/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13369/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-128x128:
>     - shard-rkl:          [DMESG-WARN][14] ([i915#12964]) -> [SKIP][15]
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/shard-rkl-7/igt@kms_cursor_crc@cursor-offscreen-128x128.html
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13369/shard-rkl-6/igt@kms_cursor_crc@cursor-offscreen-128x128.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x512:
>     - shard-rkl:          [SKIP][16] ([i915#13049]) -> [SKIP][17] +1 other test skip
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/shard-rkl-8/igt@kms_cursor_crc@cursor-sliding-512x512.html
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13369/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-512x512.html
> 
>   * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
>     - shard-rkl:          [SKIP][18] ([i915#9067]) -> [SKIP][19]
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/shard-rkl-8/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13369/shard-rkl-6/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
> 
>   * igt@kms_dsc@dsc-fractional-bpp:
>     - shard-rkl:          [SKIP][20] ([i915#3840]) -> [SKIP][21]
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/shard-rkl-8/igt@kms_dsc@dsc-fractional-bpp.html
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13369/shard-rkl-6/igt@kms_dsc@dsc-fractional-bpp.html
> 
>   * igt@kms_hdr@static-toggle:
>     - shard-rkl:          [SKIP][22] ([i915#3555] / [i915#8228]) -> [SKIP][23]
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/shard-rkl-5/igt@kms_hdr@static-toggle.html
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13369/shard-rkl-6/igt@kms_hdr@static-toggle.html
> 
>   * igt@kms_scaling_modes@scaling-mode-none:
>     - shard-rkl:          [SKIP][24] ([i915#3555]) -> [SKIP][25] +2 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/shard-rkl-3/igt@kms_scaling_modes@scaling-mode-none.html
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13369/shard-rkl-6/igt@kms_scaling_modes@scaling-mode-none.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-rkl:          [SKIP][26] ([i915#8623]) -> [SKIP][27]
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/shard-rkl-2/igt@kms_tiled_display@basic-test-pattern.html
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13369/shard-rkl-6/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_vrr@lobf:
>     - shard-rkl:          [SKIP][28] ([i915#11920]) -> [SKIP][29]
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/shard-rkl-4/igt@kms_vrr@lobf.html
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13369/shard-rkl-6/igt@kms_vrr@lobf.html
> 
>   * igt@kms_vrr@seamless-rr-switch-vrr:
>     - shard-rkl:          [SKIP][30] ([i915#9906]) -> [SKIP][31]
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/shard-rkl-3/igt@kms_vrr@seamless-rr-switch-vrr.html
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13369/shard-rkl-6/igt@kms_vrr@seamless-rr-switch-vrr.html
> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between IGT_8432_full and IGTPW_13369_full:
> 
> ### New IGT tests (2) ###
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-3:
>     - Statuses : 1 pass(s)
>     - Exec time: [4.86] s
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-3:
>     - Statuses : 1 pass(s)
>     - Exec time: [4.28] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_13369_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@crc32:
>     - shard-tglu:         NOTRUN -> [SKIP][32] ([i915#6230])
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13369/shard-tglu-4/igt@api_intel_bb@crc32.html

...cut...

