Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C27FCC3DA7F
	for <igt-dev@archiver.kernel.org>; Wed, 31 Jul 2024 18:10:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7977210E249;
	Wed, 31 Jul 2024 18:10:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kn9tHqtk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E06F10E249;
 Wed, 31 Jul 2024 18:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722449417; x=1753985417;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+dSbDMNQ9fshD+dmO/3nO6BfVA7iBUCYXXvrLmB2mco=;
 b=Kn9tHqtkTpqGwsmUaHuxjmUgy/Mr/e7ZzW8abLEJs2u57Damj3iv0seT
 YaX9YJhkbKDdfo7unHdG4SpDEr9J29mfwaRNNoAvhcIOhAB5R92oF7eo+
 FYiyGF8JJITh9g/vFa1ZM74h7+4A5zBknh4eZu9G6NBNkWVKmKn2K+oLA
 oA+gZf0EwSVnjipRSFdT2HijqqsvV5s5e9d9AtVAQK7fF9d9sC6bV2Dnn
 at68a9quRsz8BRlnq3+TDluRYmw6MYwYIQh9G3pXQwOvJJLvZtMTDy9hg
 bj2fc0gMFtPtSEsz22CoV0c4oOo+u3mmjKZojCECTnbx8vrdsLFsdzxBD w==;
X-CSE-ConnectionGUID: g4hd+WAkT86Pz/mcR5kF6Q==
X-CSE-MsgGUID: kXp9r7V/SxWK03X3uYgxfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="20490839"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="20490839"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 11:10:16 -0700
X-CSE-ConnectionGUID: jzCkQMzBT8m44kKNWT2O1Q==
X-CSE-MsgGUID: wE0rM8j3TBamDIqvX70biA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="59085423"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2024 11:10:14 -0700
Date: Wed, 31 Jul 2024 20:10:11 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Zack Rusin <zack.rusin@broadcom.com>, I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIENJLnhlRlVMTA==?= =?utf-8?Q?=3A?= failure for Add
 vmwgfx prime tests (rev5)
Message-ID: <20240731181011.nojzrjhswji3f3cu@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Zack Rusin <zack.rusin@broadcom.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20240730190037.1134020-1-zack.rusin@broadcom.com>
 <172237439032.465564.17044125543683952126@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <172237439032.465564.17044125543683952126@2413ebb6fbb6>
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
On 2024-07-30 at 21:19:50 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Add vmwgfx prime tests (rev5)
> URL   : https://patchwork.freedesktop.org/series/133402/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_7942_full -> XEIGTPW_11499_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_11499_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_11499_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_11499_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_atomic@crtc-invalid-params-fence:
>     - shard-lnl:          NOTRUN -> [SKIP][1] +3 other tests skip
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11499/shard-lnl-4/igt@kms_atomic@crtc-invalid-params-fence.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-128x128:
>     - shard-lnl:          [PASS][2] -> [SKIP][3] +31 other tests skip
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-5/igt@kms_cursor_crc@cursor-rapid-movement-128x128.html
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11499/shard-lnl-1/igt@kms_cursor_crc@cursor-rapid-movement-128x128.html
> 
>   * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
>     - shard-dg2-set2:     [PASS][4] -> [DMESG-WARN][5] +1 other test dmesg-warn
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11499/shard-dg2-434/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
>     - shard-dg2-set2:     [PASS][6] -> [SKIP][7] +5 other tests skip
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11499/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_psr@fbc-psr-suspend@edp-1:
>     - shard-lnl:          NOTRUN -> [FAIL][8] +1 other test fail
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11499/shard-lnl-1/igt@kms_psr@fbc-psr-suspend@edp-1.html
> 
>   * igt@kms_psr@psr-cursor-plane-move:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][9] +2 other tests skip
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11499/shard-dg2-432/igt@kms_psr@psr-cursor-plane-move.html
> 
>   * igt@kms_vrr@flip-basic:
>     - shard-lnl:          [PASS][10] -> [FAIL][11] +5 other tests fail
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@kms_vrr@flip-basic.html
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11499/shard-lnl-5/igt@kms_vrr@flip-basic.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][12] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][13]
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11499/shard-dg2-432/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>     - shard-dg2-set2:     [SKIP][14] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][15]
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11499/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][16] ([Intel XE#1124]) -> [SKIP][17] +1 other test skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11499/shard-dg2-432/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
>     - shard-lnl:          [SKIP][18] ([Intel XE#367]) -> [SKIP][19]
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-5/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11499/shard-lnl-4/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:
>     - shard-dg2-set2:     [SKIP][20] ([Intel XE#1201]) -> [SKIP][21] +3 other tests skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11499/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html
> 
>   * igt@kms_chamelium_color@ctm-green-to-red:
>     - shard-lnl:          [SKIP][22] ([Intel XE#306]) -> [SKIP][23]
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_chamelium_color@ctm-green-to-red.html
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11499/shard-lnl-3/igt@kms_chamelium_color@ctm-green-to-red.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
>     - shard-lnl:          [SKIP][24] ([Intel XE#373]) -> [SKIP][25] +6 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-5/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11499/shard-lnl-4/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
> 
>   * igt@kms_content_protection@lic-type-1:
>     - shard-lnl:          [SKIP][26] ([Intel XE#599]) -> [SKIP][27] +1 other test skip
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_content_protection@lic-type-1.html
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11499/shard-lnl-8/igt@kms_content_protection@lic-type-1.html
> 
>   * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
>     - shard-lnl:          [SKIP][28] ([Intel XE#309]) -> [SKIP][29] +3 other tests skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11499/shard-lnl-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
> 
>   * igt@kms_feature_discovery@display-2x:
>     - shard-lnl:          [SKIP][30] ([Intel XE#702]) -> [SKIP][31]
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_feature_discovery@display-2x.html
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11499/shard-lnl-1/igt@kms_feature_discovery@display-2x.html
> 
>   * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
>     - shard-lnl:          [SKIP][32] ([Intel XE#1421]) -> [SKIP][33] +4 other tests skip
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-5/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11499/shard-lnl-1/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff:
>     - shard-dg2-set2:     [SKIP][34] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][35] +2 other tests skip
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11499/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt:
>     - shard-dg2-set2:     [SKIP][36] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][37] +2 other tests skip
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt.html
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11499/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:
>     - shard-lnl:          [SKIP][38] ([Intel XE#2318]) -> [SKIP][39] +1 other test skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11499/shard-lnl-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>     - shard-lnl:          [SKIP][40] ([Intel XE#1437]) -> [SKIP][41]
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11499/shard-lnl-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
> 
>   * igt@kms_scaling_modes@scaling-mode-none:
>     - shard-lnl:          [SKIP][42] ([Intel XE#374] / [Intel XE#599]) -> [SKIP][43]
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-2/igt@kms_scaling_modes@scaling-mode-none.html
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11499/shard-lnl-4/igt@kms_scaling_modes@scaling-mode-none.html
> 
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - shard-lnl:          [SKIP][44] ([Intel XE#1435]) -> [SKIP][45] +1 other test skip
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_setmode@basic-clone-single-crtc.html
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11499/shard-lnl-8/igt@kms_setmode@basic-clone-single-crtc.html
> 
>   * igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1:
>     - shard-lnl:          [FAIL][46] ([Intel XE#2180]) -> [FAIL][47] +1 other test fail
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-7/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11499/shard-lnl-7/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html
> 
>   * igt@kms_vrr@negative-basic:
>     - shard-lnl:          [SKIP][48] ([Intel XE#1499] / [Intel XE#599]) -> [SKIP][49]
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_vrr@negative-basic.html
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11499/shard-lnl-1/igt@kms_vrr@negative-basic.html
> 
>   * igt@kms_writeback@writeback-check-output:
>     - shard-lnl:          [SKIP][50] ([Intel XE#756]) -> [SKIP][51]
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@kms_writeback@writeback-check-output.html
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11499/shard-lnl-4/igt@kms_writeback@writeback-check-output.html
> 

Unrelated to vmwgfx changes as these are not Intel Xe nor i915
driver tests.

Regards,
Kamil


>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * {igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p}:
>     - shard-lnl:          [PASS][52] -> [SKIP][53]
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11499/shard-lnl-4/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_11499_full that come from known issues:
> 

...cut...

> 
> Build changes
> -------------
> 
>   * IGT: IGT_7942 -> IGTPW_11499
>   * Linux: xe-1684-3a93d4a1f4872fbdfe43e9b7f1a7dfd9236a642d -> xe-1691-acd846e309e206a4dbc83e4b857b6604aa0741af
> 
>   IGTPW_11499: 11499
>   IGT_7942: 0f02dc176959e6296866b1bafd3982e277a5e44b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1684-3a93d4a1f4872fbdfe43e9b7f1a7dfd9236a642d: 3a93d4a1f4872fbdfe43e9b7f1a7dfd9236a642d
>   xe-1691-acd846e309e206a4dbc83e4b857b6604aa0741af: acd846e309e206a4dbc83e4b857b6604aa0741af
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11499/index.html
