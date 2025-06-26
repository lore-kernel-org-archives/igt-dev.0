Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D968DC77B7F
	for <igt-dev@archiver.kernel.org>; Thu, 26 Jun 2025 08:26:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9323410E881;
	Thu, 26 Jun 2025 08:26:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eydCWief";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F266810E881;
 Thu, 26 Jun 2025 08:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750926390; x=1782462390;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Axckft1+j7AMxg0wcdWH5AmK/sIvPFpGXF/QSNR02qk=;
 b=eydCWiefePCxPztUpZIoQOm7a9tD1ySQuPvwGAlPoeiPUxFRBFYFMz7k
 Ippy01fxP+OZgrIpt2ACUc5Z92lE5bHDiDC98hFbfLAKWldtRRL6kG66k
 jyiJw8i9+WoMR1TwBk7K/vAYr8Ns/2OeRlKemvFNAZmBxxo491Wqmbn1e
 4MfQqsS2BWOPxkdW0pnCdwHEk7w1fM2aVFZpugq8z8xURY8UgJqZgtaye
 diVt6jNh6BFvRkZPRWU+HVp87RRBH7fDyK8oM6Ehjf1vxssDsQefyT1ls
 xFj4BaeCBzJv/0keliiKAvAgl6KmxYQuGba25JXTdsjN1Xyh/DQxG1fVv A==;
X-CSE-ConnectionGUID: 0qH+osAhTK+bptVPf6znYg==
X-CSE-MsgGUID: zad8R5uuScuK6AQx1arpBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53355931"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208";a="53355931"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 01:26:30 -0700
X-CSE-ConnectionGUID: TeBDDoZ4SoyqInILsV9RZw==
X-CSE-MsgGUID: REWz3H1mRSycKNwSvT2upA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208";a="156486140"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 01:26:28 -0700
Date: Thu, 26 Jun 2025 10:26:26 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Alex Hung <alex.hung@amd.com>, I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_fo?=
 =?utf-8?Q?r?= lib/igt_kms: Move get_writeback_formats_blob to lib (rev3)
Message-ID: <20250626082626.o5c4hukyars3dq4a@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Alex Hung <alex.hung@amd.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20250624221712.1786983-1-alex.hung@amd.com>
 <175085272493.107859.18080963740204024371@1538d3639d33>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <175085272493.107859.18080963740204024371@1538d3639d33>
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
On 2025-06-25 at 11:58:44 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/igt_kms: Move get_writeback_formats_blob to lib (rev3)
> URL   : https://patchwork.freedesktop.org/series/150486/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_16753_full -> IGTPW_13346_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_13346_full absolutely need to be
>   verified manually.

Unrelated to kms_writeeback change.

Regards,
Kamil

>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_13346_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13346/index.html
> 
> Participating hosts (10 -> 10)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_13346_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind:
>     - shard-rkl:          [PASS][1] -> [SKIP][2] +49 other tests skip
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16753/shard-rkl-3/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13346/shard-rkl-6/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
>     - shard-rkl:          NOTRUN -> [SKIP][3] +6 other tests skip
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13346/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-rkl:          [SKIP][4] ([i915#5286]) -> [SKIP][5] +2 other tests skip
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16753/shard-rkl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13346/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
>     - shard-rkl:          [SKIP][6] ([i915#3638]) -> [SKIP][7] +1 other test skip
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16753/shard-rkl-2/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13346/shard-rkl-6/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
>     - shard-rkl:          [DMESG-WARN][8] ([i915#12964]) -> [SKIP][9] +1 other test skip
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16753/shard-rkl-3/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13346/shard-rkl-6/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
>     - shard-rkl:          [SKIP][10] ([i915#14098] / [i915#6095]) -> [SKIP][11] +9 other tests skip
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16753/shard-rkl-8/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13346/shard-rkl-6/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
>     - shard-rkl:          [SKIP][12] ([i915#12313]) -> [SKIP][13] +1 other test skip
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16753/shard-rkl-4/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13346/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
> 
>   * igt@kms_content_protection@atomic:
>     - shard-rkl:          [SKIP][14] ([i915#7118] / [i915#9424]) -> [SKIP][15]
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16753/shard-rkl-8/igt@kms_content_protection@atomic.html
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13346/shard-rkl-6/igt@kms_content_protection@atomic.html
> 
>   * igt@kms_content_protection@content-type-change:
>     - shard-rkl:          [SKIP][16] ([i915#9424]) -> [SKIP][17]
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16753/shard-rkl-5/igt@kms_content_protection@content-type-change.html
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13346/shard-rkl-6/igt@kms_content_protection@content-type-change.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x170:
>     - shard-rkl:          [SKIP][18] ([i915#13049]) -> [SKIP][19] +2 other tests skip
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16753/shard-rkl-2/igt@kms_cursor_crc@cursor-onscreen-512x170.html
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13346/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-64x21:
>     - shard-rkl:          [FAIL][20] ([i915#13566]) -> [SKIP][21]
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16753/shard-rkl-2/igt@kms_cursor_crc@cursor-onscreen-64x21.html
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13346/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-64x21.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
>     - shard-rkl:          [SKIP][22] ([i915#3555]) -> [SKIP][23] +2 other tests skip
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16753/shard-rkl-8/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13346/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
>     - shard-rkl:          [SKIP][24] ([i915#3555] / [i915#3804]) -> [SKIP][25]
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16753/shard-rkl-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13346/shard-rkl-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
> 
>   * igt@kms_dsc@dsc-fractional-bpp:
>     - shard-rkl:          [SKIP][26] ([i915#3840]) -> [SKIP][27] +1 other test skip
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16753/shard-rkl-2/igt@kms_dsc@dsc-fractional-bpp.html
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13346/shard-rkl-6/igt@kms_dsc@dsc-fractional-bpp.html
> 
>   * igt@kms_panel_fitting@legacy:
>     - shard-rkl:          [SKIP][28] ([i915#6301]) -> [SKIP][29]
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16753/shard-rkl-5/igt@kms_panel_fitting@legacy.html
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13346/shard-rkl-6/igt@kms_panel_fitting@legacy.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
>     - shard-rkl:          [SKIP][30] ([i915#5289]) -> [SKIP][31]
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16753/shard-rkl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13346/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
> 
>   * igt@kms_vrr@seamless-rr-switch-drrs:
>     - shard-rkl:          [SKIP][32] ([i915#9906]) -> [SKIP][33]
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16753/shard-rkl-5/igt@kms_vrr@seamless-rr-switch-drrs.html
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13346/shard-rkl-6/igt@kms_vrr@seamless-rr-switch-drrs.html
> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_16753_full and IGTPW_13346_full:
> 
> ### New IGT tests (1) ###
> 
>   * igt@kms_properties@connector-properties-legacy@pipe-a-vga-1:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.20] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_13346_full that come from known issues:

...cut...

