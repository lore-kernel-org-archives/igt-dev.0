Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17634CAC5AC
	for <igt-dev@archiver.kernel.org>; Fri, 26 Sep 2025 08:24:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD1ED10E9FF;
	Fri, 26 Sep 2025 08:24:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BBnSipEW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C17D10E9FF;
 Fri, 26 Sep 2025 08:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758875083; x=1790411083;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uqHuli0UNNdXgfAHDWfZ70gtTbLddqurU4he2oLJ6bI=;
 b=BBnSipEWZRRmn9ynssEPZMKH7UNlw2QRnDhzZSHX+yrmP3wBZvOy/l2a
 IaJESv4E2T4AHMI0PMHxSu49CfT9X0qbYmF3q6QPb9NCftw6vpwjESNJt
 9mYJF3WhWRdUVuFx9B2RKb1XiRDxQ3Dt0FYOn/9BsnJFnDP2H2+VNAU3E
 UqmEkEqjOhdNnBIpF7ImFsUNKU3kOWCnVPUxXcIi0C0bCfGpLf1Zhs0EU
 AN5tMULX2ls/o3+1cMwA60ziyvWqPo3QpB4VETPXXkQPhWFae/CBXTjFy
 vzh9U2B0NuS1bmO+ghBwrYSMWIYO9eYM6z83yNU8DRUbmp9aL+QErfXKb g==;
X-CSE-ConnectionGUID: xV2KtQ51T3KnE4uNTKmOtw==
X-CSE-MsgGUID: wXT0+8vhTB6bePaH7f5eBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="78847625"
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; d="scan'208";a="78847625"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 01:24:43 -0700
X-CSE-ConnectionGUID: HFuJVR5WSGCjUOJPiTv08Q==
X-CSE-MsgGUID: noQHsfhPQNSoWvLGdbHzzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; d="scan'208";a="182719320"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.244.246])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 01:24:41 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?UTF-8?B?4pyX?= Xe.CI.Full: failure for tests/syncobj_timeline:
 Exercise signaling of awaited points (rev2)
Date: Fri, 26 Sep 2025 10:24:38 +0200
Message-ID: <5114837.0VBMTVartN@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <175881862001.367706.6236820930503777984@1538d3639d33>
References: <20250925095806.1967580-2-janusz.krzysztofik@linux.intel.com>
 <175881862001.367706.6236820930503777984@1538d3639d33>
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

Hi all,

On Thursday, 25 September 2025 18:43:40 CEST Patchwork wrote:
> == Series Details ==
> 
> Series: tests/syncobj_timeline: Exercise signaling of awaited points (rev2)
> URL   : https://patchwork.freedesktop.org/series/154590/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8552_FULL -> XEIGTPW_13822_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_13822_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_13822_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.

New subtests introduced with this patch haven't been covered by this Xe run, 
then this report should be ignored.

>   
> 
> Participating hosts (4 -> 3)
> ------------------------------
> 
>   Missing    (1): shard-adlp 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_13822_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_exec_compute_mode@many-execqueues-userptr-unmap:
>     - shard-lnl:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-lnl-5/igt@xe_exec_compute_mode@many-execqueues-userptr-unmap.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-lnl-7/igt@xe_exec_compute_mode@many-execqueues-userptr-unmap.html

@I915-ci-infra@lists.freedesktop.org, please consider updating CBL filters.

Thanks,
Janusz

> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * {igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma}:
>     - shard-lnl:          [PASS][3] -> [FAIL][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-lnl-8/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-lnl-4/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_13822_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][5] ([Intel XE#316]) +3 other tests skip
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-dg2-436/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
>     - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#2327]) +1 other test skip
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-bmg-8/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][7] ([Intel XE#607])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][8] ([Intel XE#1124]) +11 other tests skip
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-dg2-433/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#1124]) +1 other test skip
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-bmg-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
>     - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#1124])
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-lnl-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#2191]) +1 other test skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-dg2-463/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#367]) +1 other test skip
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
>     - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#367])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#2907]) +2 other tests skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-dg2-463/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-hdmi-a-2:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#787]) +174 other tests skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-hdmi-a-2.html
> 
>   * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-2:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#455] / [Intel XE#787]) +42 other tests skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-dg2-432/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-2.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#3432])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-lnl-2/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:
>     - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2887]) +6 other tests skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc:
>     - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#2887]) +3 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-lnl-5/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][20] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345]) +1 other test incomplete
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
>     - shard-dg2-set2:     [PASS][21] -> [INCOMPLETE][22] ([Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][23] -> [INCOMPLETE][24] ([Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212])
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_chamelium_color@ctm-limited-range:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#306]) +4 other tests skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-dg2-433/igt@kms_chamelium_color@ctm-limited-range.html
> 
>   * igt@kms_chamelium_color@ctm-red-to-blue:
>     - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2325])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-bmg-7/igt@kms_chamelium_color@ctm-red-to-blue.html
>     - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#306])
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-lnl-8/igt@kms_chamelium_color@ctm-red-to-blue.html
> 
>   * igt@kms_chamelium_hpd@common-hpd-after-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2252]) +4 other tests skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-bmg-7/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#373]) +7 other tests skip
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#373])
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-lnl-4/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html
> 
>   * igt@kms_content_protection@mei-interface:
>     - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2341]) +1 other test skip
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-bmg-1/igt@kms_content_protection@mei-interface.html
> 
>   * igt@kms_content_protection@type1:
>     - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#3278])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-lnl-8/igt@kms_content_protection@type1.html
> 
>   * igt@kms_content_protection@uevent@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [FAIL][33] ([Intel XE#1188])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-bmg-5/igt@kms_content_protection@uevent@pipe-a-dp-2.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x170:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#308]) +2 other tests skip
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-dg2-433/igt@kms_cursor_crc@cursor-offscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x170:
>     - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#2321])
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-bmg-7/igt@kms_cursor_crc@cursor-random-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-64x21:
>     - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2320]) +2 other tests skip
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-64x21.html
>     - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#1424])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-lnl-2/igt@kms_cursor_crc@cursor-sliding-64x21.html
> 
>   * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
>     - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2291])
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-bmg-6/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
>     - shard-bmg:          [PASS][39] -> [DMESG-WARN][40] ([Intel XE#5354]) +1 other test dmesg-warn
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
>     - shard-bmg:          [PASS][41] -> [SKIP][42] ([Intel XE#2291]) +2 other tests skip
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
>     - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2286])
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-bmg-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#4494] / [i915#3804])
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#4422])
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-dg2-432/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html
> 
>   * igt@kms_fbcon_fbt@psr:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#776])
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-dg2-433/igt@kms_fbcon_fbt@psr.html
> 
>   * igt@kms_feature_discovery@chamelium:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#701])
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-dg2-433/igt@kms_feature_discovery@chamelium.html
> 
>   * igt@kms_feature_discovery@display-3x:
>     - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2373])
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-bmg-4/igt@kms_feature_discovery@display-3x.html
> 
>   * igt@kms_feature_discovery@psr2:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#1135])
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-dg2-433/igt@kms_feature_discovery@psr2.html
> 
>   * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][50] ([Intel XE#2049]) +1 other test incomplete
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-dg2-464/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
>     - shard-bmg:          [PASS][51] -> [SKIP][52] ([Intel XE#2316]) +2 other tests skip
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-1/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-bmg-6/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html
> 
>   * igt@kms_flip@2x-plain-flip:
>     - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#1421])
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-lnl-4/igt@kms_flip@2x-plain-flip.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
>     - shard-lnl:          [PASS][54] -> [FAIL][55] ([Intel XE#301])
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>     - shard-bmg:          [PASS][56] -> [INCOMPLETE][57] ([Intel XE#2049] / [Intel XE#2597]) +3 other tests incomplete
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-6/igt@kms_flip@flip-vs-suspend-interruptible.html
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-bmg-2/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#1401] / [Intel XE#1745])
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#1401])
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#1397] / [Intel XE#1745])
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#1397])
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#455]) +17 other tests skip
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#651]) +1 other test skip
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#2311]) +9 other tests skip
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#651]) +30 other tests skip
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
>     - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#5390]) +6 other tests skip
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#2313]) +14 other tests skip
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#2312]) +4 other tests skip
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:
>     - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#656]) +13 other tests skip
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
>     - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#5672])
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-bmg-5/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#653]) +37 other tests skip
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_joiner@basic-max-non-joiner:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#4298])
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-dg2-434/igt@kms_joiner@basic-max-non-joiner.html
> 
>   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#356])
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-dg2-466/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>   * igt@kms_panel_fitting@legacy:
>     - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2486])
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-bmg-7/igt@kms_panel_fitting@legacy.html
> 
>   * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][75] ([Intel XE#616]) +1 other test fail
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-dg2-466/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
> 
>   * igt@kms_plane_multiple@2x-tiling-yf:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#5021])
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-dg2-466/igt@kms_plane_multiple@2x-tiling-yf.html
> 
>   * igt@kms_plane_multiple@tiling-yf:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#5020])
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-dg2-463/igt@kms_plane_multiple@tiling-yf.html
> 
>   * igt@kms_pm_backlight@brightness-with-dpms:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#2938])
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-dg2-463/igt@kms_pm_backlight@brightness-with-dpms.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-lnl:          [PASS][79] -> [FAIL][80] ([Intel XE#718])
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-lnl-1/igt@kms_pm_dc@dc6-dpms.html
> 
>   * igt@kms_pm_dc@dc6-psr:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#1129])
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-dg2-434/igt@kms_pm_dc@dc6-psr.html
> 
>   * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
>     - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
> 
>   * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#1406] / [Intel XE#1489]) +11 other tests skip
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
>     - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#1406] / [Intel XE#2893] / [Intel XE#4608])
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#1406] / [Intel XE#4608]) +1 other test skip
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
>     - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#1406] / [Intel XE#1489]) +4 other tests skip
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-bmg-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html
> 
>   * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
>     - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#1406] / [Intel XE#2893]) +2 other tests skip
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-lnl-7/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html
> 
>   * igt@kms_psr2_su@frontbuffer-xrgb8888:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#1122] / [Intel XE#1406])
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-dg2-434/igt@kms_psr2_su@frontbuffer-xrgb8888.html
> 
>   * igt@kms_psr@fbc-psr-sprite-render:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +18 other tests skip
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-render.html
> 
>   * igt@kms_psr@psr2-sprite-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +4 other tests skip
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-bmg-4/igt@kms_psr@psr2-sprite-blt.html
> 
>   * igt@kms_rotation_crc@bad-tiling:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#3414]) +3 other tests skip
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-dg2-432/igt@kms_rotation_crc@bad-tiling.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#1127])
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90:
>     - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#3414] / [Intel XE#3904])
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-lnl-2/igt@kms_rotation_crc@sprite-rotation-90.html
> 
>   * igt@kms_setmode@invalid-clone-single-crtc-stealing:
>     - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#1435])
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-lnl-2/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
> 
>   * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
>     - shard-bmg:          NOTRUN -> [FAIL][95] ([Intel XE#5937])
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-bmg-6/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
> 
>   * igt@xe_configfs@survivability-mode:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#6010])
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-dg2-432/igt@xe_configfs@survivability-mode.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0xfffe:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#1126]) +1 other test skip
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0xfffe.html
> 
>   * igt@xe_eu_stall@blocking-re-enable:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#5626]) +3 other tests skip
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-dg2-433/igt@xe_eu_stall@blocking-re-enable.html
> 
>   * igt@xe_eudebug@basic-read-event:
>     - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#4837]) +6 other tests skip
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-bmg-7/igt@xe_eudebug@basic-read-event.html
> 
>   * igt@xe_eudebug_online@interrupt-other-debuggable:
>     - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#4837]) +3 other tests skip
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-lnl-7/igt@xe_eudebug_online@interrupt-other-debuggable.html
> 
>   * igt@xe_evict@evict-large-external-cm:
>     - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#688]) +1 other test skip
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-lnl-4/igt@xe_evict@evict-large-external-cm.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:
>     - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#2322]) +1 other test skip
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:
>     - shard-dg2-set2:     [PASS][103] -> [SKIP][104] ([Intel XE#1392]) +3 other tests skip
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-dg2-466/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html
> 
>   * igt@xe_exec_basic@multigpu-once-null-rebind:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#1392]) +2 other tests skip
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null-rebind.html
>     - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#1392])
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-lnl-4/igt@xe_exec_basic@multigpu-once-null-rebind.html
> 
>   * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#288]) +25 other tests skip
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-dg2-433/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html
> 
>   * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][108] ([Intel XE#2360])
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
> 
>   * igt@xe_exec_sip_eudebug@breakpoint-writesip:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#4837]) +13 other tests skip
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-dg2-434/igt@xe_exec_sip_eudebug@breakpoint-writesip.html
> 
>   * igt@xe_exec_system_allocator@process-many-stride-mmap-race-nomemset:
>     - shard-bmg:          [PASS][110] -> [ABORT][111] ([Intel XE#5790])
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-1/igt@xe_exec_system_allocator@process-many-stride-mmap-race-nomemset.html
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-bmg-6/igt@xe_exec_system_allocator@process-many-stride-mmap-race-nomemset.html
> 
>   * igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontunmap-eocheck:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][112] ([Intel XE#4915]) +290 other tests skip
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-dg2-432/igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontunmap-eocheck.html
> 
>   * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge:
>     - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#4943]) +12 other tests skip
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge.html
> 
>   * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-free-huge-nomemset:
>     - shard-lnl:          NOTRUN -> [SKIP][114] ([Intel XE#4943]) +10 other tests skip
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-lnl-3/igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-free-huge-nomemset.html
> 
>   * igt@xe_live_ktest@xe_eudebug:
>     - shard-lnl:          NOTRUN -> [SKIP][115] ([Intel XE#2833])
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-lnl-1/igt@xe_live_ktest@xe_eudebug.html
> 
>   * igt@xe_media_fill@media-fill:
>     - shard-lnl:          NOTRUN -> [SKIP][116] ([Intel XE#560])
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-lnl-7/igt@xe_media_fill@media-fill.html
> 
>   * igt@xe_mmap@vram:
>     - shard-lnl:          NOTRUN -> [SKIP][117] ([Intel XE#1416])
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-lnl-3/igt@xe_mmap@vram.html
> 
>   * igt@xe_oa@mmio-triggered-reports-read:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][118] ([Intel XE#6032])
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-dg2-463/igt@xe_oa@mmio-triggered-reports-read.html
> 
>   * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][119] ([Intel XE#3573]) +7 other tests skip
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-dg2-434/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html
> 
>   * igt@xe_pat@pat-index-xehpc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][120] ([Intel XE#2838] / [Intel XE#979])
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-dg2-466/igt@xe_pat@pat-index-xehpc.html
>     - shard-lnl:          NOTRUN -> [SKIP][121] ([Intel XE#1420] / [Intel XE#2838])
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-lnl-5/igt@xe_pat@pat-index-xehpc.html
> 
>   * igt@xe_pat@pat-index-xelp:
>     - shard-bmg:          NOTRUN -> [SKIP][122] ([Intel XE#2245])
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-bmg-4/igt@xe_pat@pat-index-xelp.html
> 
>   * igt@xe_pm@d3cold-mmap-vram:
>     - shard-lnl:          NOTRUN -> [SKIP][123] ([Intel XE#2284] / [Intel XE#366])
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-lnl-3/igt@xe_pm@d3cold-mmap-vram.html
>     - shard-bmg:          NOTRUN -> [SKIP][124] ([Intel XE#2284])
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-bmg-6/igt@xe_pm@d3cold-mmap-vram.html
> 
>   * igt@xe_pm@s2idle-d3cold-basic-exec:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#2284] / [Intel XE#366])
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-dg2-464/igt@xe_pm@s2idle-d3cold-basic-exec.html
> 
>   * igt@xe_pm@s3-basic-exec:
>     - shard-bmg:          [PASS][126] -> [DMESG-FAIL][127] ([Intel XE#5545])
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-5/igt@xe_pm@s3-basic-exec.html
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-bmg-6/igt@xe_pm@s3-basic-exec.html
> 
>   * igt@xe_pm@s3-mocs:
>     - shard-lnl:          NOTRUN -> [SKIP][128] ([Intel XE#584])
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-lnl-7/igt@xe_pm@s3-mocs.html
> 
>   * igt@xe_pm@vram-d3cold-threshold:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][129] ([Intel XE#579])
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-dg2-436/igt@xe_pm@vram-d3cold-threshold.html
> 
>   * igt@xe_pmu@fn-engine-activity-sched-if-idle:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][130] ([Intel XE#4650])
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-dg2-432/igt@xe_pmu@fn-engine-activity-sched-if-idle.html
> 
>   * igt@xe_pxp@display-pxp-fb:
>     - shard-bmg:          NOTRUN -> [SKIP][131] ([Intel XE#4733]) +1 other test skip
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-bmg-7/igt@xe_pxp@display-pxp-fb.html
> 
>   * igt@xe_pxp@pxp-termination-key-update-post-rpm:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][132] ([Intel XE#4733]) +2 other tests skip
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-dg2-434/igt@xe_pxp@pxp-termination-key-update-post-rpm.html
> 
>   * igt@xe_query@multigpu-query-gt-list:
>     - shard-bmg:          NOTRUN -> [SKIP][133] ([Intel XE#944]) +1 other test skip
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-bmg-7/igt@xe_query@multigpu-query-gt-list.html
>     - shard-lnl:          NOTRUN -> [SKIP][134] ([Intel XE#944]) +1 other test skip
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-lnl-4/igt@xe_query@multigpu-query-gt-list.html
> 
>   * igt@xe_query@multigpu-query-uc-fw-version-guc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][135] ([Intel XE#944]) +2 other tests skip
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-dg2-463/igt@xe_query@multigpu-query-uc-fw-version-guc.html
> 
>   * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:
>     - shard-lnl:          NOTRUN -> [SKIP][136] ([Intel XE#4130])
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-lnl-2/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html
> 
>   * igt@xe_sriov_flr@flr-vf1-clear:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][137] ([Intel XE#3342])
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-dg2-436/igt@xe_sriov_flr@flr-vf1-clear.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
>     - shard-bmg:          [SKIP][138] ([Intel XE#2291]) -> [PASS][139] +2 other tests pass
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
>     - shard-bmg:          [FAIL][140] ([Intel XE#4633]) -> [PASS][141]
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
> 
>   * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
>     - shard-bmg:          [SKIP][142] ([Intel XE#2316]) -> [PASS][143] +3 other tests pass
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend:
>     - shard-bmg:          [INCOMPLETE][144] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][145] +1 other test pass
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-7/igt@kms_flip@2x-flip-vs-suspend.html
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-bmg-3/igt@kms_flip@2x-flip-vs-suspend.html
> 
>   * igt@kms_flip@flip-vs-suspend:
>     - shard-dg2-set2:     [INCOMPLETE][146] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][147]
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-dg2-432/igt@kms_flip@flip-vs-suspend.html
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-dg2-464/igt@kms_flip@flip-vs-suspend.html
> 
>   * igt@kms_hdr@static-toggle-dpms:
>     - shard-bmg:          [SKIP][148] ([Intel XE#1503]) -> [PASS][149]
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-6/igt@kms_hdr@static-toggle-dpms.html
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-bmg-2/igt@kms_hdr@static-toggle-dpms.html
> 
>   * igt@kms_joiner@basic-force-big-joiner:
>     - shard-bmg:          [SKIP][150] ([Intel XE#3012]) -> [PASS][151]
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-bmg-7/igt@kms_joiner@basic-force-big-joiner.html
> 
>   * igt@kms_plane_multiple@2x-tiling-none:
>     - shard-bmg:          [SKIP][152] ([Intel XE#4596]) -> [PASS][153]
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-none.html
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-none.html
> 
>   * igt@kms_vrr@cmrr@pipe-a-edp-1:
>     - shard-lnl:          [FAIL][154] ([Intel XE#4459]) -> [PASS][155] +1 other test pass
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-lnl-8/igt@kms_vrr@cmrr@pipe-a-edp-1.html
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-null-rebind:
>     - shard-dg2-set2:     [SKIP][156] ([Intel XE#1392]) -> [PASS][157] +2 other tests pass
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-dg2-466/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html
> 
>   * igt@xe_exec_compute_mode@many-execqueues-basic:
>     - shard-bmg:          [FAIL][158] -> [PASS][159] +1 other test pass
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-7/igt@xe_exec_compute_mode@many-execqueues-basic.html
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-bmg-4/igt@xe_exec_compute_mode@many-execqueues-basic.html
> 
>   * {igt@xe_exec_system_allocator@many-64k-new-prefetch}:
>     - shard-lnl:          [CRASH][160] ([Intel XE#6192]) -> [PASS][161] +10 other tests pass
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-lnl-5/igt@xe_exec_system_allocator@many-64k-new-prefetch.html
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-lnl-2/igt@xe_exec_system_allocator@many-64k-new-prefetch.html
> 
>   * {igt@xe_exec_system_allocator@many-stride-malloc-prefetch}:
>     - shard-bmg:          [CRASH][162] ([Intel XE#6192]) -> [PASS][163] +3 other tests pass
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-8/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-bmg-4/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html
> 
>   * igt@xe_pmu@engine-activity-all-load:
>     - shard-bmg:          [DMESG-WARN][164] ([Intel XE#6190]) -> [PASS][165]
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-1/igt@xe_pmu@engine-activity-all-load.html
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-bmg-6/igt@xe_pmu@engine-activity-all-load.html
> 
>   * igt@xe_sriov_auto_provisioning@exclusive-ranges@numvfs-random:
>     - shard-bmg:          [FAIL][166] ([Intel XE#5937]) -> [PASS][167] +1 other test pass
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-5/igt@xe_sriov_auto_provisioning@exclusive-ranges@numvfs-random.html
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-bmg-5/igt@xe_sriov_auto_provisioning@exclusive-ranges@numvfs-random.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_content_protection@uevent:
>     - shard-bmg:          [SKIP][168] ([Intel XE#2341]) -> [FAIL][169] ([Intel XE#1188])
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-6/igt@kms_content_protection@uevent.html
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-bmg-5/igt@kms_content_protection@uevent.html
> 
>   * igt@kms_flip@bo-too-big-interruptible@a-edp1:
>     - shard-lnl:          [TIMEOUT][170] ([Intel XE#1504] / [Intel XE#5737]) -> [TIMEOUT][171] ([Intel XE#1504]) +1 other test timeout
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-lnl-2/igt@kms_flip@bo-too-big-interruptible@a-edp1.html
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-lnl-7/igt@kms_flip@bo-too-big-interruptible@a-edp1.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
>     - shard-bmg:          [SKIP][172] ([Intel XE#2312]) -> [SKIP][173] ([Intel XE#2311]) +11 other tests skip
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
>     - shard-bmg:          [SKIP][174] ([Intel XE#2311]) -> [SKIP][175] ([Intel XE#2312]) +5 other tests skip
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
>     - shard-bmg:          [SKIP][176] ([Intel XE#5390]) -> [SKIP][177] ([Intel XE#2312])
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen:
>     - shard-bmg:          [SKIP][178] ([Intel XE#2312]) -> [SKIP][179] ([Intel XE#5390]) +7 other tests skip
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen.html
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:
>     - shard-bmg:          [SKIP][180] ([Intel XE#2312]) -> [SKIP][181] ([Intel XE#2313]) +11 other tests skip
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
>     - shard-bmg:          [SKIP][182] ([Intel XE#2313]) -> [SKIP][183] ([Intel XE#2312]) +7 other tests skip
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-bmg:          [SKIP][184] ([Intel XE#2509]) -> [SKIP][185] ([Intel XE#2426])
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
>     - shard-bmg:          [ABORT][186] ([Intel XE#5466] / [Intel XE#5530]) -> [ABORT][187] ([Intel XE#4917] / [Intel XE#5466] / [Intel XE#5530])
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-bmg-2/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
> 
>   * igt@xe_peer2peer@read:
>     - shard-dg2-set2:     [FAIL][188] ([Intel XE#1173]) -> [SKIP][189] ([Intel XE#1061]) +1 other test skip
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-dg2-434/igt@xe_peer2peer@read.html
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/shard-dg2-432/igt@xe_peer2peer@read.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
>   [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
>   [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
>   [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
>   [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
>   [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416
>   [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>   [Intel XE#1504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504
>   [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>   [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
>   [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
>   [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
>   [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
>   [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
>   [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
>   [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
>   [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
>   [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
>   [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
>   [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
>   [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
>   [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
>   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>   [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
>   [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>   [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
>   [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
>   [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
>   [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
>   [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
>   [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
>   [Intel XE#4494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
>   [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
>   [Intel XE#4633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
>   [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
>   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>   [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
>   [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
>   [Intel XE#4917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
>   [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
>   [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
>   [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
>   [Intel XE#5300]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5300
>   [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
>   [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
>   [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
>   [Intel XE#5530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530
>   [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
>   [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
>   [Intel XE#5626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626
>   [Intel XE#5672]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5672
>   [Intel XE#5737]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5737
>   [Intel XE#5786]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786
>   [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
>   [Intel XE#5790]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5790
>   [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
>   [Intel XE#5937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937
>   [Intel XE#6010]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6010
>   [Intel XE#6032]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6032
>   [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
>   [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>   [Intel XE#6190]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6190
>   [Intel XE#6192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6192
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
>   [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
>   [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
>   [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8552 -> IGTPW_13822
>   * Linux: xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf -> xe-3829-7644974e648c270a56954b0344b1d0330698e1fa
> 
>   IGTPW_13822: 13822
>   IGT_8552: 8552
>   xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf: a4d9163251f4832a7d34d4b59449f9a68b9b7adf
>   xe-3829-7644974e648c270a56954b0344b1d0330698e1fa: 7644974e648c270a56954b0344b1d0330698e1fa
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13822/index.html
> 




