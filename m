Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD6B2D65521
	for <igt-dev@archiver.kernel.org>; Tue, 26 Nov 2024 16:42:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D77F10E950;
	Tue, 26 Nov 2024 16:42:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ijBkEyV0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 494D110E940;
 Tue, 26 Nov 2024 16:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732639338; x=1764175338;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=sx7zsEx13hcrtWabYz8W1ov++0jNw2Juy2RV/mzWOmk=;
 b=ijBkEyV0+uMnzceQJ4sSaWvAfJ8Yn1/3lKkCV/ggouUpnvNWOHXFP6Jy
 qhScSS7HrKNVfzq42tpLbbpBgEIuNIGmcUicEdJWztGm+uK+k8PhUIhoB
 KynSsMLkCmXBXsiTQwttkewDUFrCianP8pcNEghb8ueEgV2q0UMfHbbd5
 zMjiGnToXOke7mCxUVGTpgb7r8cqQVIOk95aoydtT6h/eBGqZr88JcxcK
 f8y5uUZGTS92f5ug7pxihq0Qn4jB3sp0v1EOlXw7pQHjyDDrcO2llrwt0
 j17onsmha15E3jw3MhQAYCGQz1H3CIkyxaGPsFnA6TyqVTWN0dEPECmYH w==;
X-CSE-ConnectionGUID: 2gG9H7yYQpaEzpnYMwmiTQ==
X-CSE-MsgGUID: AlXZlIUxQx6KSWcxTboCpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="43307035"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="43307035"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 08:42:17 -0800
X-CSE-ConnectionGUID: LcJOilUFT/ez+E+9r8lVwQ==
X-CSE-MsgGUID: mNum60dHQW61WLVh4PzV1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="122512749"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 08:42:16 -0800
Date: Tue, 26 Nov 2024 17:42:13 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIENJLnhlRlVMTA==?= =?utf-8?Q?=3A?= failure for
 Ignore more warns in xe_wedged tests (rev3)
Message-ID: <20241126164213.ozrkupe2cyr7f5th@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20241108201839.119079-1-kamil.konieczny@linux.intel.com>
 <173119879475.1946529.11584229732756860169@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <173119879475.1946529.11584229732756860169@2413ebb6fbb6>
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
On 2024-11-10 at 00:33:14 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Ignore more warns in xe_wedged tests (rev3)
> URL   : https://patchwork.freedesktop.org/series/140511/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8101_full -> XEIGTPW_12072_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_12072_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_12072_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_12072_full:
> 

Below regressions are unrelated to change in xe_wedged test,

Regards,
Kamil

> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@core_getversion@all-cards:
>     - shard-dg2-set2:     [PASS][1] -> [FAIL][2] +1 other test fail
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8101/shard-dg2-435/igt@core_getversion@all-cards.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12072/shard-dg2-434/igt@core_getversion@all-cards.html
> 
>   * igt@core_hotunplug@unbind-rebind:
>     - shard-lnl:          [PASS][3] -> [DMESG-WARN][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8101/shard-lnl-4/igt@core_hotunplug@unbind-rebind.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12072/shard-lnl-1/igt@core_hotunplug@unbind-rebind.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][5] -> [DMESG-WARN][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8101/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12072/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_cursor_crc@cursor-random-128x128:
>     - shard-dg2-set2:     [PASS][7] -> [SKIP][8] +3 other tests skip
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8101/shard-dg2-435/igt@kms_cursor_crc@cursor-random-128x128.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12072/shard-dg2-432/igt@kms_cursor_crc@cursor-random-128x128.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][9] +3 other tests skip
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12072/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_psr@fbc-psr2-no-drrs:
>     - shard-lnl:          [PASS][10] -> [FAIL][11] +1 other test fail
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8101/shard-lnl-4/igt@kms_psr@fbc-psr2-no-drrs.html
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12072/shard-lnl-6/igt@kms_psr@fbc-psr2-no-drrs.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90:
>     - shard-bmg:          NOTRUN -> [SKIP][12]
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12072/shard-bmg-6/igt@kms_rotation_crc@sprite-rotation-90.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
>     - shard-dg2-set2:     [SKIP][13] ([Intel XE#373]) -> [SKIP][14]
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8101/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12072/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
>     - shard-dg2-set2:     [SKIP][15] ([Intel XE#455]) -> [SKIP][16]
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8101/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12072/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:
>     - shard-dg2-set2:     [SKIP][17] ([Intel XE#2890]) -> [SKIP][18]
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8101/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12072/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
>     - shard-dg2-set2:     [SKIP][19] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][20]
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8101/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12072/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
>     - shard-dg2-set2:     [SKIP][21] ([Intel XE#653]) -> [SKIP][22]
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8101/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12072/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_hdr@static-toggle-dpms:
>     - shard-dg2-set2:     [SKIP][23] ([Intel XE#2423] / [i915#2575]) -> [SKIP][24] +1 other test skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8101/shard-dg2-434/igt@kms_hdr@static-toggle-dpms.html
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12072/shard-dg2-432/igt@kms_hdr@static-toggle-dpms.html
> 
>   * igt@kms_pm_backlight@basic-brightness:
>     - shard-dg2-set2:     [SKIP][25] ([Intel XE#870]) -> [SKIP][26]
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8101/shard-dg2-464/igt@kms_pm_backlight@basic-brightness.html
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12072/shard-dg2-432/igt@kms_pm_backlight@basic-brightness.html
> 
>   * igt@kms_pm_dc@dc5-retention-flops:
>     - shard-dg2-set2:     [SKIP][27] ([Intel XE#3309]) -> [SKIP][28]
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8101/shard-dg2-433/igt@kms_pm_dc@dc5-retention-flops.html
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12072/shard-dg2-434/igt@kms_pm_dc@dc5-retention-flops.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_12072_full that come from known issues:
> 
> ### IGT changes ###

...cut...

>   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
>   [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
>   [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8101 -> IGTPW_12072
>   * Linux: xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25 -> xe-2193-5d94c05a3b9625a569b92a4ed208ce04e241f122
> 
>   IGTPW_12072: ba67f6a70cd24baa8b58795c7bd22bd2b8028525 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8101: 1235576931b5abdcb2c755672d194fb540fa6fb1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25: 5521311ecd7ffbb0adf016dbf83bd0165fc94d25
>   xe-2193-5d94c05a3b9625a569b92a4ed208ce04e241f122: 5d94c05a3b9625a569b92a4ed208ce04e241f122
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12072/index.html
