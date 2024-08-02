Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C976C3DA4A
	for <igt-dev@archiver.kernel.org>; Fri,  2 Aug 2024 11:19:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6E0610E031;
	Fri,  2 Aug 2024 11:19:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G8Md0yyq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8609510E031;
 Fri,  2 Aug 2024 11:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722597575; x=1754133575;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=zteVj3/fbFmG0puIXIjOcDzZtswIkgQml1MmeRGZ3gU=;
 b=G8Md0yyqshpDJ4b2V97Dm6Ce3Pc9wT0poy9UnE4nxzhikylXFBYV8GaG
 f7BEzAhZMwTIhP1993+vLrH7dA1hWSwzrMhVPUgseuHE+F7Zunbncky+L
 yApsvHCKwvvZXyswdRIo8dxQnKaLecpyHPr94qqSbjYEeaGzXZMoM/SEs
 gHFrLFKAPHPxyCz8DkTh5o6L7UdEOgjVy6oK4fMWD3F0KKiCEkgdNsWN7
 Xa1+g/vIqYg6Sil5YYq0rQgIfVU+4wQBEd8CR+EP3da8fq0rRuDPVuoUf
 sJkWS0GvM1zZkmNx+GirNJOdH3SUVPGg5fevkf0aQuMau5QaheUVJrl5G Q==;
X-CSE-ConnectionGUID: Myf8cnPxSYupTZKJ8NhnFg==
X-CSE-MsgGUID: vUHNO8fXRqWc0OD9SgMzpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="31259162"
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800"; d="scan'208";a="31259162"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2024 04:19:34 -0700
X-CSE-ConnectionGUID: YlZv4y9LR/SYpV5ESQJAxQ==
X-CSE-MsgGUID: lyy3M2c3Q2earZ00bt6jtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800"; d="scan'208";a="59703470"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2024 04:19:33 -0700
Date: Fri, 2 Aug 2024 13:19:16 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIENJLnhlRlVMTA==?= =?utf-8?Q?=3A?= failure for
 Print version in lsgpu tool
Message-ID: <20240802111916.5vpdoofixbrfdczk@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20240802092746.22001-1-kamil.konieczny@linux.intel.com>
 <172259706486.502967.10156993376786602073@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <172259706486.502967.10156993376786602073@2413ebb6fbb6>
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
On 2024-08-02 at 11:11:04 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Print version in lsgpu tool
> URL   : https://patchwork.freedesktop.org/series/136841/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_7952_full -> XEIGTPW_11523_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_11523_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_11523_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_11523_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@fbdev@unaligned-read:
>     - shard-lnl:          [PASS][1] -> [SKIP][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-3/igt@fbdev@unaligned-read.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11523/shard-lnl-4/igt@fbdev@unaligned-read.html
> 
>   * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
>     - shard-dg2-set2:     [PASS][3] -> [SKIP][4] +4 other tests skip
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11523/shard-dg2-432/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html
> 
>   * igt@kms_flip@plain-flip-fb-recreate-interruptible@b-edp1:
>     - shard-lnl:          [PASS][5] -> [FAIL][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-1/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-edp1.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11523/shard-lnl-6/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-edp1.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][7] +1 other test skip
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11523/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html
> 
>   * igt@xe_pm@s4-basic:
>     - shard-dg2-set2:     [PASS][8] -> [DMESG-WARN][9]
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@xe_pm@s4-basic.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11523/shard-dg2-433/igt@xe_pm@s4-basic.html
> 
>   * igt@xe_pm_residency@gt-c6-freeze@gt0:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][10]
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11523/shard-dg2-466/igt@xe_pm_residency@gt-c6-freeze@gt0.html
> 
>   
> #### Warnings ####
> 
>   * igt@core_hotunplug@hotrebind-lateclose:
>     - shard-dg2-set2:     [ABORT][11] ([Intel XE#2421]) -> [SKIP][12]
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@core_hotunplug@hotrebind-lateclose.html
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11523/shard-dg2-432/igt@core_hotunplug@hotrebind-lateclose.html
>     - shard-lnl:          [ABORT][13] ([Intel XE#2421]) -> [SKIP][14]
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-8/igt@core_hotunplug@hotrebind-lateclose.html
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11523/shard-lnl-4/igt@core_hotunplug@hotrebind-lateclose.html
> 
>   * igt@kms_big_fb@linear-64bpp-rotate-0:
>     - shard-dg2-set2:     [SKIP][15] ([Intel XE#1201]) -> [SKIP][16]
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-433/igt@kms_big_fb@linear-64bpp-rotate-0.html
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11523/shard-dg2-432/igt@kms_big_fb@linear-64bpp-rotate-0.html
> 
>   * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][17] ([Intel XE#316]) -> [SKIP][18]
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11523/shard-dg2-432/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
>     - shard-dg2-set2:     [SKIP][19] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][20]
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-463/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11523/shard-dg2-432/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html
> 
>   * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
>     - shard-dg2-set2:     [SKIP][21] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][22]
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11523/shard-dg2-432/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
>     - shard-dg2-set2:     [SKIP][23] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][24] +1 other test skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11523/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
>     - shard-dg2-set2:     [SKIP][25] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][26] +3 other tests skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11523/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render:
>     - shard-dg2-set2:     [SKIP][27] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][28] +2 other tests skip
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11523/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html
> 
>   * igt@kms_pm_dc@deep-pkgc:
>     - shard-dg2-set2:     [SKIP][29] ([Intel XE#908]) -> [SKIP][30]
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_pm_dc@deep-pkgc.html
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11523/shard-dg2-432/igt@kms_pm_dc@deep-pkgc.html
> 
>   * igt@kms_psr@fbc-psr2-suspend:
>     - shard-dg2-set2:     [SKIP][31] ([Intel XE#929]) -> [SKIP][32]
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-432/igt@kms_psr@fbc-psr2-suspend.html
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11523/shard-dg2-432/igt@kms_psr@fbc-psr2-suspend.html
> 
>   * igt@kms_psr@psr2-sprite-blt:
>     - shard-dg2-set2:     [SKIP][33] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][34]
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@kms_psr@psr2-sprite-blt.html
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11523/shard-dg2-432/igt@kms_psr@psr2-sprite-blt.html
> 
>   * igt@xe_module_load@many-reload:
>     - shard-dg2-set2:     [FAIL][35] ([Intel XE#2136]) -> [DMESG-FAIL][36]
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-dg2-435/igt@xe_module_load@many-reload.html
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11523/shard-dg2-434/igt@xe_module_load@many-reload.html
> 

This is unrelated to change in tools/lsgpu.

Regards,
Kamil

>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@kms_async_flips@alternate-sync-async-flip@pipe-d-dp-2:
>     - {shard-bmg}:        [PASS][37] -> [DMESG-WARN][38] +2 other tests dmesg-warn
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-dp-2.html
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11523/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-dp-2.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-dp-2-4:
>     - {shard-bmg}:        NOTRUN -> [DMESG-WARN][39] +3 other tests dmesg-warn
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11523/shard-bmg-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-dp-2-4.html
> 
>   * igt@kms_async_flips@test-time-stamp@pipe-d-dp-2:
>     - {shard-bmg}:        NOTRUN -> [INCOMPLETE][40] +2 other tests incomplete
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11523/shard-bmg-3/igt@kms_async_flips@test-time-stamp@pipe-d-dp-2.html
> 
>   * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
>     - {shard-bmg}:        [SKIP][41] ([Intel XE#2327]) -> [SKIP][42]
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-8/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11523/shard-bmg-5/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
>     - {shard-bmg}:        [SKIP][43] ([Intel XE#1124]) -> [SKIP][44]
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-6/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11523/shard-bmg-2/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_ccs@bad-rotation-90-y-tiled-ccs:
>     - {shard-bmg}:        [SKIP][45] ([Intel XE#2251]) -> [SKIP][46] +3 other tests skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-3/igt@kms_ccs@bad-rotation-90-y-tiled-ccs.html
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11523/shard-bmg-2/igt@kms_ccs@bad-rotation-90-y-tiled-ccs.html
> 
>   * igt@kms_chamelium_edid@dp-edid-resolution-list:
>     - {shard-bmg}:        NOTRUN -> [SKIP][47] +9 other tests skip
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11523/shard-bmg-2/igt@kms_chamelium_edid@dp-edid-resolution-list.html
> 
>   * igt@kms_content_protection@lic-type-0:
>     - {shard-bmg}:        [SKIP][48] -> [FAIL][49]
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-4/igt@kms_content_protection@lic-type-0.html
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11523/shard-bmg-2/igt@kms_content_protection@lic-type-0.html
> 
>   * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
>     - {shard-bmg}:        NOTRUN -> [FAIL][50]
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11523/shard-bmg-2/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html
> 
>   * igt@kms_content_protection@uevent:
>     - {shard-bmg}:        [FAIL][51] -> [SKIP][52]
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-5/igt@kms_content_protection@uevent.html
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11523/shard-bmg-4/igt@kms_content_protection@uevent.html
> 
>   * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
>     - {shard-bmg}:        [PASS][53] -> [INCOMPLETE][54]
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-6/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11523/shard-bmg-5/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
> 
>   * igt@kms_feature_discovery@display-4x:
>     - {shard-bmg}:        [SKIP][55] ([Intel XE#1138]) -> [SKIP][56]
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-4/igt@kms_feature_discovery@display-4x.html
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11523/shard-bmg-2/igt@kms_feature_discovery@display-4x.html
> 
>   * igt@kms_flip@2x-plain-flip-fb-recreate:
>     - {shard-bmg}:        [PASS][57] -> [SKIP][58] +24 other tests skip
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11523/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-render:
>     - {shard-bmg}:        [SKIP][59] ([Intel XE#2311]) -> [SKIP][60] +1 other test skip
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-render.html
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11523/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render:
>     - {shard-bmg}:        [FAIL][61] ([Intel XE#2333]) -> [SKIP][62] +1 other test skip
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11523/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt:
>     - {shard-bmg}:        [SKIP][63] ([Intel XE#2313]) -> [SKIP][64] +3 other tests skip
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt.html
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11523/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_plane_multiple@tiling-yf:
>     - {shard-bmg}:        [SKIP][65] ([Intel XE#2444]) -> [SKIP][66]
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-8/igt@kms_plane_multiple@tiling-yf.html
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11523/shard-bmg-7/igt@kms_plane_multiple@tiling-yf.html
> 
>   * igt@kms_psr@psr-primary-blt:
>     - {shard-bmg}:        [SKIP][67] ([Intel XE#2234]) -> [SKIP][68] +2 other tests skip
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-4/igt@kms_psr@psr-primary-blt.html
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11523/shard-bmg-2/igt@kms_psr@psr-primary-blt.html
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-off:
>     - {shard-bmg}:        [SKIP][69] ([Intel XE#1091]) -> [SKIP][70]
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-off.html
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11523/shard-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-off.html
> 
>   * igt@xe_evict@evict-beng-mixed-threads-large:
>     - {shard-bmg}:        [PASS][71] -> [TIMEOUT][72]
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-1/igt@xe_evict@evict-beng-mixed-threads-large.html
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11523/shard-bmg-6/igt@xe_evict@evict-beng-mixed-threads-large.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:
>     - {shard-bmg}:        [SKIP][73] ([Intel XE#2322]) -> [SKIP][74]
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11523/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_11523_full that come from known issues:
> 
> ### IGT changes ###
> 
...cut...
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7952 -> IGTPW_11523
>   * Linux: xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5 -> xe-1708-974ee82a5f44e91fd93895cc12fb1e76e55b229a
> 
>   IGTPW_11523: 11523
>   IGT_7952: 7952
>   xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5: d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5
>   xe-1708-974ee82a5f44e91fd93895cc12fb1e76e55b229a: 974ee82a5f44e91fd93895cc12fb1e76e55b229a
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11523/index.html
