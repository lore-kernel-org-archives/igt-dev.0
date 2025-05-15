Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04578C2D0CD
	for <igt-dev@archiver.kernel.org>; Thu, 15 May 2025 14:03:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E4E110E8B8;
	Thu, 15 May 2025 14:03:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bza8pW/3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 718B210E8B5;
 Thu, 15 May 2025 14:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747317833; x=1778853833;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=PlIzY+9fR4dZKL6ARPuZTRrg83B9W4qxKKInFA2F9eY=;
 b=Bza8pW/3ihc30wJ7/YCETZ8aXEBNVUf0u/U1J/xqJObUNPNujUoy0E7E
 LJjh9AcZKI3hNTP8N6K+hB0793KL93VtD5rGML3n9cGr/ypMDnwCMrnH3
 6Ur/iGUh8q7StQzEkI2azlcPT5VcNP9m+AKSk4IhOjG/yhdfe2sjiKKNY
 DMIUrotHudNrLU+fdjUiFpPqW5ZdDGUhHSczTez0/mtZr8QzuT/w9shsO
 vDz/APyu5ozxbj/9giG4IcMNPfl8AHxn88P2wwwatPgZ9B/WTUTa5Dowl
 rPgqmR09uaStMP2GpY97Paql/TiTl82owZSCUPunpgdl2pwev9g7gmAhk A==;
X-CSE-ConnectionGUID: lBDO8/RZTXaWocmWigNPWw==
X-CSE-MsgGUID: LjfoHX/dRHeEAyEDGb+RxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="49242008"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; d="scan'208";a="49242008"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 07:03:52 -0700
X-CSE-ConnectionGUID: qLTO35qpRU2Fw9IrLEMmkA==
X-CSE-MsgGUID: aKkMOkY/TPu5NA27J/NgpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; d="scan'208";a="169313938"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.246.1.132])
 ([10.246.1.132])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 07:03:51 -0700
Message-ID: <aaeb9e55-bc69-4bf4-b454-ebdaaf683aca@linux.intel.com>
Date: Thu, 15 May 2025 16:03:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_tests/intel?=
 =?UTF-8?Q?/xe=5Fsriov=5Fscheduling=3A_Close_open_handles_before_disabling_V?=
 =?UTF-8?Q?Fs?=
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250514142543.345665-1-marcin.bernatowicz@linux.intel.com>
 <174726954273.82414.531912051978219119@c664b1dc75d1>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <174726954273.82414.531912051978219119@c664b1dc75d1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 5/15/2025 2:39 AM, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/xe_sriov_scheduling: Close open handles before disabling VFs
> URL   : https://patchwork.freedesktop.org/series/149013/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8364_FULL -> XEIGTPW_13127_FULL
> ====================================================
> 
> Summary
> -------
> 
>    **FAILURE**
> 
>    Serious unknown changes coming with XEIGTPW_13127_FULL absolutely need to be
>    verified manually.
>    
>    If you think the reported changes have nothing to do with the changes
>    introduced in XEIGTPW_13127_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in CI.
> 
>    
> 
> Participating hosts (4 -> 3)
> ------------------------------
> 
>    Missing    (1): shard-adlp
> 
> Possible new issues
> -------------------
> 
>    Here are the unknown changes that may have been introduced in XEIGTPW_13127_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>    * igt@kms_async_flips@test-cursor-atomic@pipe-b-edp-1:
>      - shard-lnl:          NOTRUN -> [SKIP][1]
>     [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-lnl-1/igt@kms_async_flips@test-cursor-atomic@pipe-b-edp-1.html
> 
>    * igt@xe_pmu@gt-frequency:
>      - shard-lnl:          [PASS][2] -> [FAIL][3] +1 other test fail
>     [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-lnl-8/igt@xe_pmu@gt-frequency.html
>     [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-lnl-1/igt@xe_pmu@gt-frequency.html
> 
Not related to the change.
--
marcin>
> Known issues
> ------------
> 
>    Here are the changes found in XEIGTPW_13127_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>    * igt@core_setmaster@master-drop-set-user:
>      - shard-dg2-set2:     NOTRUN -> [FAIL][4] ([Intel XE#4208])
>     [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-464/igt@core_setmaster@master-drop-set-user.html
> 
>    * igt@fbdev@write:
>      - shard-dg2-set2:     [PASS][5] -> [SKIP][6] ([Intel XE#2134]) +1 other test skip
>     [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-463/igt@fbdev@write.html
>     [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-464/igt@fbdev@write.html
> 
>    * igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries:
>      - shard-dg2-set2:     [PASS][7] -> [SKIP][8] ([Intel XE#4208] / [Intel XE#4618])
>     [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-432/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html
>     [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-464/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html
> 
>    * igt@kms_3d:
>      - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#1465])
>     [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-lnl-5/igt@kms_3d.html
> 
>    * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic:
>      - shard-lnl:          [PASS][10] -> [FAIL][11] ([Intel XE#911])
>     [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic.html
>     [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic.html
> 
>    * igt@kms_async_flips@invalid-async-flip:
>      - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#873])
>     [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-5/igt@kms_async_flips@invalid-async-flip.html
>      - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#873])
>     [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-lnl-3/igt@kms_async_flips@invalid-async-flip.html
> 
>    * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
>      - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#1407]) +4 other tests skip
>     [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-lnl-5/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
> 
>    * igt@kms_big_fb@linear-64bpp-rotate-270:
>      - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2327]) +3 other tests skip
>     [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-5/igt@kms_big_fb@linear-64bpp-rotate-270.html
> 
>    * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#316]) +1 other test skip
>     [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-433/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
> 
>    * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
>      - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#1124]) +4 other tests skip
>     [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-4/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html
> 
>    * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#1124]) +4 other tests skip
>     [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html
> 
>    * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
>      - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#1124]) +5 other tests skip
>     [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-lnl-5/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html
> 
>    * igt@kms_big_fb@yf-tiled-addfb:
>      - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2328])
>     [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb.html
>      - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#1467])
>     [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-lnl-7/igt@kms_big_fb@yf-tiled-addfb.html
> 
>    * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
>      - shard-bmg:          [PASS][22] -> [SKIP][23] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
>     [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
>     [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
>      - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#2191])
>     [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-lnl-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
> 
>    * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
>      - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
>     [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-1/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
>      - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#1512]) +1 other test skip
>     [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-lnl-6/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
> 
>    * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#367]) +1 other test skip
>     [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
>      - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#367])
>     [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-8/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
> 
>    * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#787]) +181 other tests skip
>     [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2.html
> 
>    * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-edp-1:
>      - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#2669]) +3 other tests skip
>     [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-lnl-6/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-edp-1.html
> 
>    * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:
>      - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2887]) +8 other tests skip
>     [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-4/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html
> 
>    * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#455] / [Intel XE#787]) +31 other tests skip
>     [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2.html
> 
>    * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:
>      - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#2887]) +10 other tests skip
>     [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-lnl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html
> 
>    * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
>      - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#3432])
>     [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
> 
>    * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
>      - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][35] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345]) +1 other test incomplete
>     [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
> 
>    * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
>      - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2652] / [Intel XE#787]) +16 other tests skip
>     [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-3/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html
> 
>    * igt@kms_cdclk@plane-scaling:
>      - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2724])
>     [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-3/igt@kms_cdclk@plane-scaling.html
> 
>    * igt@kms_chamelium_color@ctm-negative:
>      - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2325])
>     [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-4/igt@kms_chamelium_color@ctm-negative.html
> 
>    * igt@kms_chamelium_color@gamma:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#306])
>     [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-432/igt@kms_chamelium_color@gamma.html
> 
>    * igt@kms_chamelium_hpd@hdmi-hpd:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#373]) +2 other tests skip
>     [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd.html
> 
>    * igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:
>      - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2252])
>     [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-4/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html
> 
>    * igt@kms_chamelium_hpd@vga-hpd-without-ddc:
>      - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#373]) +3 other tests skip
>     [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-lnl-7/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html
> 
>    * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
>      - shard-bmg:          NOTRUN -> [FAIL][43] ([Intel XE#1178]) +1 other test fail
>     [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-3/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html
> 
>    * igt@kms_content_protection@legacy@pipe-a-dp-2:
>      - shard-dg2-set2:     NOTRUN -> [FAIL][44] ([Intel XE#1178])
>     [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-432/igt@kms_content_protection@legacy@pipe-a-dp-2.html
> 
>    * igt@kms_content_protection@uevent:
>      - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#3278])
>     [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-lnl-1/igt@kms_content_protection@uevent.html
> 
>    * igt@kms_cursor_crc@cursor-random-256x85:
>      - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2320]) +3 other tests skip
>     [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-7/igt@kms_cursor_crc@cursor-random-256x85.html
> 
>    * igt@kms_cursor_crc@cursor-random-32x32:
>      - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#1424]) +2 other tests skip
>     [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-lnl-1/igt@kms_cursor_crc@cursor-random-32x32.html
> 
>    * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
>      - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#2321])
>     [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-lnl-4/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
>      - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2321])
>     [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-1/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
> 
>    * igt@kms_cursor_crc@cursor-sliding-64x64:
>      - shard-dg2-set2:     [PASS][50] -> [SKIP][51] ([Intel XE#4208] / [i915#2575]) +79 other tests skip
>     [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-64x64.html
>     [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-464/igt@kms_cursor_crc@cursor-sliding-64x64.html
> 
>    * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
>      - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2291])
>     [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-5/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html
> 
>    * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
>      - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#309]) +2 other tests skip
>     [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-lnl-1/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
> 
>    * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
>      - shard-bmg:          [PASS][54] -> [SKIP][55] ([Intel XE#2291]) +4 other tests skip
>     [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
>     [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
> 
>    * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
>      - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#1508])
>     [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-7/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
> 
>    * igt@kms_display_modes@extended-mode-basic:
>      - shard-bmg:          [PASS][57] -> [SKIP][58] ([Intel XE#4302])
>     [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-bmg-3/igt@kms_display_modes@extended-mode-basic.html
>     [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-4/igt@kms_display_modes@extended-mode-basic.html
> 
>    * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#4494])
>     [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html
> 
>    * igt@kms_dp_link_training@non-uhbr-sst:
>      - shard-bmg:          [PASS][60] -> [SKIP][61] ([Intel XE#4354])
>     [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-bmg-3/igt@kms_dp_link_training@non-uhbr-sst.html
>     [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-5/igt@kms_dp_link_training@non-uhbr-sst.html
> 
>    * igt@kms_dp_linktrain_fallback@dp-fallback:
>      - shard-bmg:          [PASS][62] -> [SKIP][63] ([Intel XE#4294])
>     [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-bmg-8/igt@kms_dp_linktrain_fallback@dp-fallback.html
>     [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html
> 
>    * igt@kms_dsc@dsc-fractional-bpp:
>      - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#2244]) +1 other test skip
>     [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-3/igt@kms_dsc@dsc-fractional-bpp.html
> 
>    * igt@kms_dsc@dsc-with-output-formats-with-bpc:
>      - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#2244]) +1 other test skip
>     [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-lnl-1/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
> 
>    * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
>      - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#4422])
>     [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-8/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
>      - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#4422])
>     [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-lnl-5/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
> 
>    * igt@kms_fbcon_fbt@psr-suspend:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#776])
>     [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-434/igt@kms_fbcon_fbt@psr-suspend.html
> 
>    * igt@kms_feature_discovery@display-2x:
>      - shard-bmg:          [PASS][69] -> [SKIP][70] ([Intel XE#2373])
>     [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-bmg-7/igt@kms_feature_discovery@display-2x.html
>     [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-5/igt@kms_feature_discovery@display-2x.html
> 
>    * igt@kms_feature_discovery@display-4x:
>      - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#1138])
>     [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-lnl-8/igt@kms_feature_discovery@display-4x.html
> 
>    * igt@kms_flip@2x-flip-vs-panning:
>      - shard-bmg:          [PASS][72] -> [SKIP][73] ([Intel XE#2316]) +5 other tests skip
>     [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-bmg-8/igt@kms_flip@2x-flip-vs-panning.html
>     [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning.html
> 
>    * igt@kms_flip@2x-plain-flip-ts-check:
>      - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#1421]) +4 other tests skip
>     [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-lnl-1/igt@kms_flip@2x-plain-flip-ts-check.html
> 
>    * igt@kms_flip@flip-vs-expired-vblank-interruptible:
>      - shard-bmg:          [PASS][75] -> [FAIL][76] ([Intel XE#3321]) +6 other tests fail
>     [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
>     [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
> 
>    * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:
>      - shard-dg2-set2:     NOTRUN -> [FAIL][77] ([Intel XE#301]) +7 other tests fail
>     [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html
> 
>    * igt@kms_flip@flip-vs-expired-vblank@d-dp4:
>      - shard-dg2-set2:     [PASS][78] -> [FAIL][79] ([Intel XE#301] / [Intel XE#3321])
>     [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@d-dp4.html
>     [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@d-dp4.html
> 
>    * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
>      - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#1397] / [Intel XE#1745]) +1 other test skip
>     [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
> 
>    * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode:
>      - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#1397]) +1 other test skip
>     [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode.html
> 
>    * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#455]) +10 other tests skip
>     [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
> 
>    * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
>      - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#1401]) +2 other tests skip
>     [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html
> 
>    * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
>      - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#2293] / [Intel XE#2380]) +1 other test skip
>     [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html
>      - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#1401] / [Intel XE#1745]) +2 other tests skip
>     [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html
> 
>    * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
>      - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#2293]) +1 other test skip
>     [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html
> 
>    * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
>      - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#2311]) +15 other tests skip
>     [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:
>      - shard-dg2-set2:     [PASS][88] -> [SKIP][89] ([Intel XE#2351] / [Intel XE#4208]) +9 other tests skip
>     [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html
>     [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:
>      - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#4141]) +3 other tests skip
>     [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
>      - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#2312]) +11 other tests skip
>     [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-tiling-y:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#658])
>     [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
>      - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#2352])
>     [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
> 
>    * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][94] ([Intel XE#651]) +13 other tests skip
>     [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html
> 
>    * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
>      - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#651]) +12 other tests skip
>     [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:
>      - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#2313]) +10 other tests skip
>     [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-stridechange:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#653]) +10 other tests skip
>     [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-stridechange.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
>      - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#1469])
>     [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
> 
>    * igt@kms_frontbuffer_tracking@plane-fbc-rte:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#1158])
>     [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-434/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
> 
>    * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:
>      - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#656]) +22 other tests skip
>     [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html
> 
>    * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][101] ([Intel XE#2351] / [Intel XE#4208]) +3 other tests skip
>     [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html
> 
>    * igt@kms_getfb@getfb2-accept-ccs:
>      - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#2340])
>     [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-1/igt@kms_getfb@getfb2-accept-ccs.html
>      - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#2340])
>     [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-lnl-1/igt@kms_getfb@getfb2-accept-ccs.html
> 
>    * igt@kms_hdr@invalid-hdr:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][104] ([Intel XE#4208] / [i915#2575]) +19 other tests skip
>     [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-464/igt@kms_hdr@invalid-hdr.html
> 
>    * igt@kms_hdr@static-toggle-dpms:
>      - shard-bmg:          [PASS][105] -> [SKIP][106] ([Intel XE#1503])
>     [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-bmg-8/igt@kms_hdr@static-toggle-dpms.html
>     [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-6/igt@kms_hdr@static-toggle-dpms.html
> 
>    * igt@kms_joiner@basic-big-joiner:
>      - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#346])
>     [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-6/igt@kms_joiner@basic-big-joiner.html
>      - shard-lnl:          NOTRUN -> [SKIP][108] ([Intel XE#346])
>     [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-lnl-6/igt@kms_joiner@basic-big-joiner.html
> 
>    * igt@kms_joiner@basic-max-non-joiner:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#4298])
>     [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-435/igt@kms_joiner@basic-max-non-joiner.html
> 
>    * igt@kms_joiner@invalid-modeset-big-joiner:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#346])
>     [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-432/igt@kms_joiner@invalid-modeset-big-joiner.html
> 
>    * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
>      - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#2934])
>     [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
>      - shard-lnl:          NOTRUN -> [SKIP][112] ([Intel XE#2934])
>     [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-lnl-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
> 
>    * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>      - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#2501])
>     [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>    * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256:
>      - shard-dg2-set2:     NOTRUN -> [FAIL][114] ([Intel XE#616]) +2 other tests fail
>     [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-432/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256.html
> 
>    * igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:
>      - shard-lnl:          NOTRUN -> [SKIP][115] ([Intel XE#599]) +3 other tests skip
>     [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-lnl-1/igt@kms_plane_lowres@tiling-x@pipe-b-edp-1.html
> 
>    * igt@kms_plane_multiple@2x-tiling-4:
>      - shard-bmg:          [PASS][116] -> [SKIP][117] ([Intel XE#4596])
>     [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-4.html
>     [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-4.html
> 
>    * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-2:
>      - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][118] ([Intel XE#4212])
>     [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-2.html
> 
>    * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2:
>      - shard-dg2-set2:     NOTRUN -> [ABORT][119] ([Intel XE#4760])
>     [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html
> 
>    * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][120] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
>     [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d.html
> 
>    * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a:
>      - shard-lnl:          NOTRUN -> [SKIP][121] ([Intel XE#2763]) +5 other tests skip
>     [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-lnl-5/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a.html
> 
>    * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][122] ([Intel XE#2763]) +5 other tests skip
>     [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c.html
> 
>    * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
>      - shard-bmg:          NOTRUN -> [SKIP][123] ([Intel XE#2763]) +9 other tests skip
>     [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
> 
>    * igt@kms_pm_backlight@bad-brightness:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][124] ([Intel XE#870])
>     [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-463/igt@kms_pm_backlight@bad-brightness.html
> 
>    * igt@kms_pm_dc@dc3co-vpb-simulation:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#1122]) +1 other test skip
>     [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-435/igt@kms_pm_dc@dc3co-vpb-simulation.html
> 
>    * igt@kms_pm_dc@dc5-psr:
>      - shard-bmg:          NOTRUN -> [SKIP][126] ([Intel XE#2392])
>     [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-5/igt@kms_pm_dc@dc5-psr.html
> 
>    * igt@kms_pm_dc@dc5-retention-flops:
>      - shard-lnl:          NOTRUN -> [SKIP][127] ([Intel XE#3309])
>     [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-lnl-7/igt@kms_pm_dc@dc5-retention-flops.html
>      - shard-bmg:          NOTRUN -> [SKIP][128] ([Intel XE#3309])
>     [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-3/igt@kms_pm_dc@dc5-retention-flops.html
> 
>    * igt@kms_pm_dc@dc6-dpms:
>      - shard-lnl:          [PASS][129] -> [FAIL][130] ([Intel XE#718])
>     [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html
>     [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-lnl-6/igt@kms_pm_dc@dc6-dpms.html
> 
>    * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
>      - shard-lnl:          NOTRUN -> [SKIP][131] ([Intel XE#2893]) +1 other test skip
>     [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-lnl-5/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html
> 
>    * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
>      - shard-lnl:          NOTRUN -> [SKIP][132] ([Intel XE#2893] / [Intel XE#4608])
>     [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html
> 
>    * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1:
>      - shard-lnl:          NOTRUN -> [SKIP][133] ([Intel XE#4608]) +2 other tests skip
>     [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1.html
> 
>    * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
>      - shard-bmg:          NOTRUN -> [SKIP][134] ([Intel XE#1489]) +1 other test skip
>     [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-4/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html
> 
>    * igt@kms_psr2_sf@psr2-cursor-plane-update-sf:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][135] ([Intel XE#1489]) +1 other test skip
>     [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-463/igt@kms_psr2_sf@psr2-cursor-plane-update-sf.html
> 
>    * igt@kms_psr@fbc-psr2-cursor-plane-move:
>      - shard-bmg:          NOTRUN -> [SKIP][136] ([Intel XE#2234] / [Intel XE#2850]) +8 other tests skip
>     [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-4/igt@kms_psr@fbc-psr2-cursor-plane-move.html
> 
>    * igt@kms_psr@fbc-psr2-dpms:
>      - shard-lnl:          NOTRUN -> [SKIP][137] ([Intel XE#1406]) +3 other tests skip
>     [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-lnl-8/igt@kms_psr@fbc-psr2-dpms.html
> 
>    * igt@kms_psr@fbc-psr2-dpms@edp-1:
>      - shard-lnl:          NOTRUN -> [SKIP][138] ([Intel XE#4609]) +2 other tests skip
>     [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-lnl-8/igt@kms_psr@fbc-psr2-dpms@edp-1.html
> 
>    * igt@kms_psr@fbc-psr2-primary-render:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][139] ([Intel XE#4208]) +90 other tests skip
>     [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-464/igt@kms_psr@fbc-psr2-primary-render.html
> 
>    * igt@kms_psr@psr-cursor-render:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][140] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
>     [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-434/igt@kms_psr@psr-cursor-render.html
> 
>    * igt@kms_psr@psr2-primary-render:
>      - shard-bmg:          NOTRUN -> [SKIP][141] ([Intel XE#2234])
>     [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-3/igt@kms_psr@psr2-primary-render.html
> 
>    * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][142] ([Intel XE#2939])
>     [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-436/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
> 
>    * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>      - shard-lnl:          NOTRUN -> [SKIP][143] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
>     [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-lnl-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
> 
>    * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
>      - shard-bmg:          NOTRUN -> [SKIP][144] ([Intel XE#3414] / [Intel XE#3904]) +2 other tests skip
>     [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-1/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
>      - shard-dg2-set2:     NOTRUN -> [SKIP][145] ([Intel XE#3414]) +1 other test skip
>     [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
> 
>    * igt@kms_setmode@invalid-clone-single-crtc:
>      - shard-bmg:          [PASS][146] -> [SKIP][147] ([Intel XE#1435])
>     [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-bmg-2/igt@kms_setmode@invalid-clone-single-crtc.html
>     [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html
> 
>    * igt@kms_vrr@seamless-rr-switch-drrs:
>      - shard-bmg:          NOTRUN -> [SKIP][148] ([Intel XE#1499])
>     [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-2/igt@kms_vrr@seamless-rr-switch-drrs.html
>      - shard-lnl:          NOTRUN -> [SKIP][149] ([Intel XE#1499])
>     [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-lnl-3/igt@kms_vrr@seamless-rr-switch-drrs.html
> 
>    * igt@kms_writeback@writeback-invalid-parameters:
>      - shard-lnl:          NOTRUN -> [SKIP][150] ([Intel XE#756])
>     [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-lnl-4/igt@kms_writeback@writeback-invalid-parameters.html
> 
>    * igt@xe_compute_preempt@compute-preempt@engine-drm_xe_engine_class_compute:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][151] ([Intel XE#1280] / [Intel XE#455])
>     [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-463/igt@xe_compute_preempt@compute-preempt@engine-drm_xe_engine_class_compute.html
> 
>    * igt@xe_eudebug_online@interrupt-other-debuggable:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][152] ([Intel XE#4837]) +3 other tests skip
>     [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-463/igt@xe_eudebug_online@interrupt-other-debuggable.html
> 
>    * igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:
>      - shard-lnl:          NOTRUN -> [SKIP][153] ([Intel XE#688]) +1 other test skip
>     [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-lnl-6/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html
> 
>    * igt@xe_exec_basic@many-null-rebind:
>      - shard-dg2-set2:     [PASS][154] -> [SKIP][155] ([Intel XE#4208]) +183 other tests skip
>     [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-433/igt@xe_exec_basic@many-null-rebind.html
>     [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-464/igt@xe_exec_basic@many-null-rebind.html
> 
>    * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
>      - shard-bmg:          NOTRUN -> [SKIP][156] ([Intel XE#2322]) +5 other tests skip
>     [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
> 
>    * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind:
>      - shard-dg2-set2:     [PASS][157] -> [SKIP][158] ([Intel XE#1392]) +3 other tests skip
>     [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-436/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html
>     [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html
> 
>    * igt@xe_exec_basic@multigpu-once-userptr:
>      - shard-lnl:          NOTRUN -> [SKIP][159] ([Intel XE#1392]) +6 other tests skip
>     [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-lnl-7/igt@xe_exec_basic@multigpu-once-userptr.html
> 
>    * igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][160] ([Intel XE#288]) +12 other tests skip
>     [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch.html
> 
>    * igt@xe_exec_sip_eudebug@breakpoint-writesip:
>      - shard-lnl:          NOTRUN -> [SKIP][161] ([Intel XE#4837]) +9 other tests skip
>     [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-lnl-4/igt@xe_exec_sip_eudebug@breakpoint-writesip.html
> 
>    * igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug:
>      - shard-bmg:          NOTRUN -> [SKIP][162] ([Intel XE#4837]) +8 other tests skip
>     [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-6/igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug.html
> 
>    * igt@xe_exec_system_allocator@process-many-execqueues-free-race:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][163] ([Intel XE#4915]) +66 other tests skip
>     [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-432/igt@xe_exec_system_allocator@process-many-execqueues-free-race.html
> 
>    * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-huge:
>      - shard-bmg:          NOTRUN -> [SKIP][164] ([Intel XE#4943]) +7 other tests skip
>     [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-huge.html
> 
>    * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-new-huge:
>      - shard-lnl:          NOTRUN -> [SKIP][165] ([Intel XE#4943]) +8 other tests skip
>     [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-lnl-6/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-new-huge.html
> 
>    * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset:
>      - shard-lnl:          [PASS][166] -> [FAIL][167] ([Intel XE#5018])
>     [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-lnl-2/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html
>     [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-lnl-6/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html
> 
>    * igt@xe_huc_copy@huc_copy:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][168] ([Intel XE#255])
>     [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-435/igt@xe_huc_copy@huc_copy.html
> 
>    * igt@xe_live_ktest@xe_bo:
>      - shard-dg2-set2:     [PASS][169] -> [SKIP][170] ([Intel XE#2229] / [Intel XE#455]) +1 other test skip
>     [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-433/igt@xe_live_ktest@xe_bo.html
>     [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-464/igt@xe_live_ktest@xe_bo.html
> 
>    * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
>      - shard-dg2-set2:     [PASS][171] -> [SKIP][172] ([Intel XE#2229])
>     [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-433/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
>     [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-464/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
> 
>    * igt@xe_oa@closed-fd-and-unmapped-access:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][173] ([Intel XE#2541] / [Intel XE#3573]) +2 other tests skip
>     [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-432/igt@xe_oa@closed-fd-and-unmapped-access.html
> 
>    * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
>      - shard-dg2-set2:     NOTRUN -> [FAIL][174] ([Intel XE#1173])
>     [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-463/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html
> 
>    * igt@xe_pm@d3cold-basic-exec:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][175] ([Intel XE#2284] / [Intel XE#366])
>     [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-432/igt@xe_pm@d3cold-basic-exec.html
>      - shard-bmg:          NOTRUN -> [SKIP][176] ([Intel XE#2284])
>     [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-1/igt@xe_pm@d3cold-basic-exec.html
> 
>    * igt@xe_pm@s3-d3cold-basic-exec:
>      - shard-lnl:          NOTRUN -> [SKIP][177] ([Intel XE#2284] / [Intel XE#366])
>     [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-lnl-8/igt@xe_pm@s3-d3cold-basic-exec.html
> 
>    * igt@xe_pm@s3-multiple-execs:
>      - shard-lnl:          NOTRUN -> [SKIP][178] ([Intel XE#584]) +1 other test skip
>     [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-lnl-1/igt@xe_pm@s3-multiple-execs.html
> 
>    * igt@xe_pm@s4-exec-after:
>      - shard-lnl:          [PASS][179] -> [ABORT][180] ([Intel XE#1794])
>     [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-lnl-1/igt@xe_pm@s4-exec-after.html
>     [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-lnl-2/igt@xe_pm@s4-exec-after.html
> 
>    * igt@xe_pmu@fn-engine-activity-sched-if-idle:
>      - shard-lnl:          NOTRUN -> [SKIP][181] ([Intel XE#4650])
>     [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-lnl-4/igt@xe_pmu@fn-engine-activity-sched-if-idle.html
>      - shard-bmg:          NOTRUN -> [SKIP][182] ([Intel XE#4650])
>     [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-1/igt@xe_pmu@fn-engine-activity-sched-if-idle.html
> 
>    * igt@xe_pmu@gt-frequency:
>      - shard-dg2-set2:     NOTRUN -> [FAIL][183] ([Intel XE#4819]) +1 other test fail
>     [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-434/igt@xe_pmu@gt-frequency.html
> 
>    * igt@xe_pxp@display-black-pxp-fb:
>      - shard-bmg:          NOTRUN -> [SKIP][184] ([Intel XE#4733])
>     [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-2/igt@xe_pxp@display-black-pxp-fb.html
> 
>    * igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][185] ([Intel XE#4733])
>     [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-432/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html
> 
>    * igt@xe_query@multigpu-query-hwconfig:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][186] ([Intel XE#944]) +1 other test skip
>     [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-436/igt@xe_query@multigpu-query-hwconfig.html
> 
>    * igt@xe_query@multigpu-query-pxp-status:
>      - shard-bmg:          NOTRUN -> [SKIP][187] ([Intel XE#944]) +2 other tests skip
>     [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-1/igt@xe_query@multigpu-query-pxp-status.html
> 
>    * igt@xe_query@multigpu-query-topology-l3-bank-mask:
>      - shard-lnl:          NOTRUN -> [SKIP][188] ([Intel XE#944])
>     [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-lnl-1/igt@xe_query@multigpu-query-topology-l3-bank-mask.html
> 
>    * igt@xe_render_copy@render-stress-0-copies:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][189] ([Intel XE#4814])
>     [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-432/igt@xe_render_copy@render-stress-0-copies.html
> 
>    * igt@xe_sriov_auto_provisioning@selfconfig-basic:
>      - shard-bmg:          NOTRUN -> [SKIP][190] ([Intel XE#4130]) +1 other test skip
>     [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-4/igt@xe_sriov_auto_provisioning@selfconfig-basic.html
> 
>    * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:
>      - shard-lnl:          NOTRUN -> [SKIP][191] ([Intel XE#4130])
>     [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-lnl-7/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html
> 
>    * igt@xe_sriov_flr@flr-twice:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][192] ([Intel XE#4273])
>     [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-435/igt@xe_sriov_flr@flr-twice.html
> 
>    
> #### Possible fixes ####
> 
>    * igt@fbdev@read:
>      - shard-dg2-set2:     [SKIP][193] ([Intel XE#2134]) -> [PASS][194] +1 other test pass
>     [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-464/igt@fbdev@read.html
>     [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-463/igt@fbdev@read.html
> 
>    * igt@kms_async_flips@test-cursor-atomic:
>      - shard-lnl:          [SKIP][195] ([Intel XE#664]) -> [PASS][196]
>     [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-lnl-7/igt@kms_async_flips@test-cursor-atomic.html
>     [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-lnl-1/igt@kms_async_flips@test-cursor-atomic.html
> 
>    * igt@kms_big_fb@x-tiled-addfb-size-offset-overflow:
>      - shard-dg2-set2:     [SKIP][197] ([Intel XE#2351] / [Intel XE#4208]) -> [PASS][198] +8 other tests pass
>     [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-464/igt@kms_big_fb@x-tiled-addfb-size-offset-overflow.html
>     [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-433/igt@kms_big_fb@x-tiled-addfb-size-offset-overflow.html
> 
>    * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
>      - shard-bmg:          [SKIP][199] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][200]
>     [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
>     [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
> 
>    * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>      - shard-bmg:          [INCOMPLETE][201] ([Intel XE#3862]) -> [PASS][202] +1 other test pass
>     [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
>     [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
> 
>    * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
>      - shard-bmg:          [SKIP][203] ([Intel XE#2291]) -> [PASS][204] +5 other tests pass
>     [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
>     [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
> 
>    * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
>      - shard-bmg:          [FAIL][205] ([Intel XE#4667]) -> [PASS][206]
>     [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
>     [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
> 
>    * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
>      - shard-bmg:          [SKIP][207] ([Intel XE#1340]) -> [PASS][208]
>     [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-bmg-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
>     [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
> 
>    * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
>      - shard-bmg:          [FAIL][209] ([Intel XE#3321]) -> [PASS][210]
>     [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
>     [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
> 
>    * igt@kms_flip@2x-plain-flip-fb-recreate:
>      - shard-bmg:          [SKIP][211] ([Intel XE#2316]) -> [PASS][212] +15 other tests pass
>     [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html
>     [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate.html
> 
>    * igt@kms_flip@flip-vs-expired-vblank@b-dp4:
>      - shard-dg2-set2:     [FAIL][213] ([Intel XE#301] / [Intel XE#3321]) -> [PASS][214]
>     [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@b-dp4.html
>     [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@b-dp4.html
> 
>    * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
>      - shard-dg2-set2:     [FAIL][215] ([Intel XE#301]) -> [PASS][216] +2 other tests pass
>     [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html
>     [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html
> 
>    * igt@kms_flip@flip-vs-suspend:
>      - shard-dg2-set2:     [INCOMPLETE][217] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][218]
>     [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-432/igt@kms_flip@flip-vs-suspend.html
>     [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-436/igt@kms_flip@flip-vs-suspend.html
> 
>    * igt@kms_flip@flip-vs-suspend-interruptible:
>      - shard-bmg:          [INCOMPLETE][219] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][220] +1 other test pass
>     [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible.html
>     [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-7/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>    * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
>      - shard-dg2-set2:     [SKIP][221] ([Intel XE#4208]) -> [PASS][222] +223 other tests pass
>     [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
>     [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
> 
>    * igt@kms_lease@invalid-create-leases:
>      - shard-dg2-set2:     [SKIP][223] ([Intel XE#4208] / [i915#2575]) -> [PASS][224] +98 other tests pass
>     [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-464/igt@kms_lease@invalid-create-leases.html
>     [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-432/igt@kms_lease@invalid-create-leases.html
> 
>    * igt@kms_plane_multiple@2x-tiling-x:
>      - shard-bmg:          [SKIP][225] ([Intel XE#4596]) -> [PASS][226] +1 other test pass
>     [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-x.html
>     [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-x.html
> 
>    * igt@kms_plane_scaling@intel-max-src-size:
>      - shard-bmg:          [SKIP][227] ([Intel XE#2685] / [Intel XE#3307]) -> [PASS][228]
>     [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-bmg-7/igt@kms_plane_scaling@intel-max-src-size.html
>     [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-6/igt@kms_plane_scaling@intel-max-src-size.html
> 
>    * igt@kms_pm_dc@dc6-psr:
>      - shard-lnl:          [FAIL][229] ([Intel XE#718]) -> [PASS][230]
>     [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html
>     [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-lnl-1/igt@kms_pm_dc@dc6-psr.html
> 
>    * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>      - shard-lnl:          [SKIP][231] ([Intel XE#4692]) -> [PASS][232]
>     [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-lnl-7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
>     [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-lnl-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> 
>    * igt@kms_setmode@basic@pipe-b-edp-1:
>      - shard-lnl:          [FAIL][233] ([Intel XE#2883]) -> [PASS][234] +2 other tests pass
>     [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-lnl-5/igt@kms_setmode@basic@pipe-b-edp-1.html
>     [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-lnl-3/igt@kms_setmode@basic@pipe-b-edp-1.html
> 
>    * igt@kms_setmode@invalid-clone-single-crtc-stealing:
>      - shard-bmg:          [SKIP][235] ([Intel XE#1435]) -> [PASS][236]
>     [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
>     [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-1/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
> 
>    * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr:
>      - shard-dg2-set2:     [SKIP][237] ([Intel XE#1392]) -> [PASS][238]
>     [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr.html
>     [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr.html
> 
>    * igt@xe_module_load@load:
>      - shard-dg2-set2:     ([PASS][239], [PASS][240], [PASS][241], [SKIP][242], [PASS][243], [PASS][244], [PASS][245], [PASS][246], [PASS][247], [PASS][248], [PASS][249], [PASS][250], [PASS][251], [PASS][252], [PASS][253], [PASS][254], [PASS][255], [PASS][256], [PASS][257], [PASS][258], [PASS][259], [PASS][260], [PASS][261], [PASS][262], [PASS][263]) ([Intel XE#378]) -> ([PASS][264], [PASS][265], [PASS][266], [PASS][267], [PASS][268], [PASS][269], [PASS][270], [PASS][271], [PASS][272], [PASS][273], [PASS][274], [PASS][275], [PASS][276], [PASS][277], [PASS][278], [PASS][279], [PASS][280], [PASS][281], [PASS][282], [PASS][283], [PASS][284], [PASS][285], [PASS][286], [PASS][287], [PASS][288])
>     [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-464/igt@xe_module_load@load.html
>     [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-435/igt@xe_module_load@load.html
>     [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-464/igt@xe_module_load@load.html
>     [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-464/igt@xe_module_load@load.html
>     [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-464/igt@xe_module_load@load.html
>     [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-464/igt@xe_module_load@load.html
>     [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-463/igt@xe_module_load@load.html
>     [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-463/igt@xe_module_load@load.html
>     [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-463/igt@xe_module_load@load.html
>     [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-433/igt@xe_module_load@load.html
>     [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-464/igt@xe_module_load@load.html
>     [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-464/igt@xe_module_load@load.html
>     [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-432/igt@xe_module_load@load.html
>     [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-436/igt@xe_module_load@load.html
>     [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-433/igt@xe_module_load@load.html
>     [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-433/igt@xe_module_load@load.html
>     [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-436/igt@xe_module_load@load.html
>     [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-436/igt@xe_module_load@load.html
>     [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-433/igt@xe_module_load@load.html
>     [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-435/igt@xe_module_load@load.html
>     [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-435/igt@xe_module_load@load.html
>     [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-464/igt@xe_module_load@load.html
>     [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-434/igt@xe_module_load@load.html
>     [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-434/igt@xe_module_load@load.html
>     [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-432/igt@xe_module_load@load.html
>     [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-433/igt@xe_module_load@load.html
>     [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-464/igt@xe_module_load@load.html
>     [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-435/igt@xe_module_load@load.html
>     [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-435/igt@xe_module_load@load.html
>     [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-464/igt@xe_module_load@load.html
>     [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-434/igt@xe_module_load@load.html
>     [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-434/igt@xe_module_load@load.html
>     [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-436/igt@xe_module_load@load.html
>     [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-436/igt@xe_module_load@load.html
>     [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-463/igt@xe_module_load@load.html
>     [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-464/igt@xe_module_load@load.html
>     [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-464/igt@xe_module_load@load.html
>     [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-463/igt@xe_module_load@load.html
>     [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-433/igt@xe_module_load@load.html
>     [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-435/igt@xe_module_load@load.html
>     [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-463/igt@xe_module_load@load.html
>     [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-464/igt@xe_module_load@load.html
>     [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-432/igt@xe_module_load@load.html
>     [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-435/igt@xe_module_load@load.html
>     [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-432/igt@xe_module_load@load.html
>     [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-434/igt@xe_module_load@load.html
>     [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-432/igt@xe_module_load@load.html
>     [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-432/igt@xe_module_load@load.html
>     [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-464/igt@xe_module_load@load.html
>     [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-464/igt@xe_module_load@load.html
> 
>    * igt@xe_module_load@reload-no-display:
>      - shard-dg2-set2:     [FAIL][289] ([Intel XE#4208]) -> [PASS][290] +2 other tests pass
>     [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-464/igt@xe_module_load@reload-no-display.html
>     [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-434/igt@xe_module_load@reload-no-display.html
> 
>    * igt@xe_pm@s4-mocs:
>      - shard-lnl:          [ABORT][291] ([Intel XE#1794]) -> [PASS][292]
>     [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-lnl-2/igt@xe_pm@s4-mocs.html
>     [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-lnl-4/igt@xe_pm@s4-mocs.html
> 
>    
> #### Warnings ####
> 
>    * igt@kms_async_flips@invalid-async-flip:
>      - shard-dg2-set2:     [SKIP][293] ([Intel XE#4208] / [i915#2575]) -> [SKIP][294] ([Intel XE#873])
>     [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-464/igt@kms_async_flips@invalid-async-flip.html
>     [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-434/igt@kms_async_flips@invalid-async-flip.html
> 
>    * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
>      - shard-dg2-set2:     [SKIP][295] ([Intel XE#316]) -> [SKIP][296] ([Intel XE#2351] / [Intel XE#4208])
>     [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-435/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
>     [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-464/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
> 
>    * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
>      - shard-dg2-set2:     [SKIP][297] ([Intel XE#4208]) -> [SKIP][298] ([Intel XE#316]) +1 other test skip
>     [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-464/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
>     [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-432/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
> 
>    * igt@kms_big_fb@linear-16bpp-rotate-90:
>      - shard-dg2-set2:     [SKIP][299] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][300] ([Intel XE#316])
>     [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-433/igt@kms_big_fb@linear-16bpp-rotate-90.html
>     [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-433/igt@kms_big_fb@linear-16bpp-rotate-90.html
> 
>    * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
>      - shard-dg2-set2:     [SKIP][301] ([Intel XE#316]) -> [SKIP][302] ([Intel XE#4208]) +1 other test skip
>     [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-436/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
>     [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-464/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
> 
>    * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
>      - shard-dg2-set2:     [SKIP][303] ([Intel XE#1124]) -> [SKIP][304] ([Intel XE#4208]) +9 other tests skip
>     [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html
>     [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html
> 
>    * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
>      - shard-dg2-set2:     [SKIP][305] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][306] ([Intel XE#1124]) +5 other tests skip
>     [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
>     [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
> 
>    * igt@kms_big_fb@yf-tiled-addfb:
>      - shard-dg2-set2:     [SKIP][307] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][308] ([Intel XE#619])
>     [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb.html
>     [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb.html
> 
>    * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
>      - shard-dg2-set2:     [SKIP][309] ([Intel XE#4208]) -> [SKIP][310] ([Intel XE#610])
>     [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-464/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
>     [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
> 
>    * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>      - shard-dg2-set2:     [SKIP][311] ([Intel XE#4208]) -> [SKIP][312] ([Intel XE#1124]) +7 other tests skip
>     [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
>     [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
> 
>    * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>      - shard-dg2-set2:     [SKIP][313] ([Intel XE#1124]) -> [SKIP][314] ([Intel XE#2351] / [Intel XE#4208]) +3 other tests skip
>     [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
>     [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
> 
>    * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
>      - shard-dg2-set2:     [SKIP][315] ([Intel XE#2191]) -> [SKIP][316] ([Intel XE#4208] / [i915#2575]) +1 other test skip
>     [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
>     [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-464/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
> 
>    * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
>      - shard-dg2-set2:     [SKIP][317] ([Intel XE#4208] / [i915#2575]) -> [SKIP][318] ([Intel XE#2191]) +2 other tests skip
>     [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
>     [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-435/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
> 
>    * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
>      - shard-dg2-set2:     [SKIP][319] ([Intel XE#367]) -> [SKIP][320] ([Intel XE#4208] / [i915#2575])
>     [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-433/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html
>     [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-464/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html
> 
>    * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
>      - shard-dg2-set2:     [SKIP][321] ([Intel XE#4208] / [i915#2575]) -> [SKIP][322] ([Intel XE#367]) +1 other test skip
>     [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-464/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
>     [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
> 
>    * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
>      - shard-dg2-set2:     [SKIP][323] ([Intel XE#4208]) -> [SKIP][324] ([Intel XE#2907]) +2 other tests skip
>     [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-433/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
>     [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-436/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
> 
>    * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
>      - shard-dg2-set2:     [SKIP][325] ([Intel XE#2907]) -> [SKIP][326] ([Intel XE#4208])
>     [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-435/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
>     [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
> 
>    * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
>      - shard-dg2-set2:     [SKIP][327] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][328] ([Intel XE#455] / [Intel XE#787]) +5 other tests skip
>     [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-464/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html
>     [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-435/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html
> 
>    * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:
>      - shard-dg2-set2:     [SKIP][329] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][330] ([Intel XE#2351] / [Intel XE#4208])
>     [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-463/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html
>     [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html
> 
>    * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs:
>      - shard-dg2-set2:     [SKIP][331] ([Intel XE#4208]) -> [SKIP][332] ([Intel XE#455] / [Intel XE#787]) +7 other tests skip
>     [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs.html
>     [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs.html
> 
>    * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:
>      - shard-dg2-set2:     [SKIP][333] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][334] ([Intel XE#4208]) +12 other tests skip
>     [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html
>     [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html
> 
>    * igt@kms_chamelium_color@ctm-limited-range:
>      - shard-dg2-set2:     [SKIP][335] ([Intel XE#4208] / [i915#2575]) -> [SKIP][336] ([Intel XE#306]) +1 other test skip
>     [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-464/igt@kms_chamelium_color@ctm-limited-range.html
>     [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-432/igt@kms_chamelium_color@ctm-limited-range.html
> 
>    * igt@kms_chamelium_color@ctm-red-to-blue:
>      - shard-dg2-set2:     [SKIP][337] ([Intel XE#306]) -> [SKIP][338] ([Intel XE#4208] / [i915#2575]) +1 other test skip
>     [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-463/igt@kms_chamelium_color@ctm-red-to-blue.html
>     [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-464/igt@kms_chamelium_color@ctm-red-to-blue.html
> 
>    * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
>      - shard-dg2-set2:     [SKIP][339] ([Intel XE#373]) -> [SKIP][340] ([Intel XE#4208] / [i915#2575]) +7 other tests skip
>     [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-433/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
>     [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-464/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
> 
>    * igt@kms_chamelium_hpd@vga-hpd:
>      - shard-dg2-set2:     [SKIP][341] ([Intel XE#4208] / [i915#2575]) -> [SKIP][342] ([Intel XE#373]) +10 other tests skip
>     [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-464/igt@kms_chamelium_hpd@vga-hpd.html
>     [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-433/igt@kms_chamelium_hpd@vga-hpd.html
> 
>    * igt@kms_content_protection@dp-mst-type-1:
>      - shard-dg2-set2:     [SKIP][343] ([Intel XE#307]) -> [SKIP][344] ([Intel XE#4208] / [i915#2575])
>     [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-434/igt@kms_content_protection@dp-mst-type-1.html
>     [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-464/igt@kms_content_protection@dp-mst-type-1.html
> 
>    * igt@kms_content_protection@legacy:
>      - shard-bmg:          [SKIP][345] ([Intel XE#2341]) -> [FAIL][346] ([Intel XE#1178]) +1 other test fail
>     [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-bmg-6/igt@kms_content_protection@legacy.html
>     [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-1/igt@kms_content_protection@legacy.html
>      - shard-dg2-set2:     [SKIP][347] ([Intel XE#4208] / [i915#2575]) -> [FAIL][348] ([Intel XE#1178])
>     [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-464/igt@kms_content_protection@legacy.html
>     [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-432/igt@kms_content_protection@legacy.html
> 
>    * igt@kms_content_protection@srm:
>      - shard-bmg:          [FAIL][349] ([Intel XE#1178]) -> [SKIP][350] ([Intel XE#2341]) +1 other test skip
>     [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-bmg-1/igt@kms_content_protection@srm.html
>     [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-6/igt@kms_content_protection@srm.html
>      - shard-dg2-set2:     [FAIL][351] ([Intel XE#1178]) -> [SKIP][352] ([Intel XE#4208] / [i915#2575])
>     [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-432/igt@kms_content_protection@srm.html
>     [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-464/igt@kms_content_protection@srm.html
> 
>    * igt@kms_cursor_crc@cursor-onscreen-512x512:
>      - shard-dg2-set2:     [SKIP][353] ([Intel XE#308]) -> [SKIP][354] ([Intel XE#4208] / [i915#2575]) +1 other test skip
>     [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x512.html
>     [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-464/igt@kms_cursor_crc@cursor-onscreen-512x512.html
> 
>    * igt@kms_cursor_crc@cursor-sliding-512x170:
>      - shard-dg2-set2:     [SKIP][355] ([Intel XE#4208] / [i915#2575]) -> [SKIP][356] ([Intel XE#308]) +1 other test skip
>     [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-464/igt@kms_cursor_crc@cursor-sliding-512x170.html
>     [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-512x170.html
> 
>    * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
>      - shard-dg2-set2:     [SKIP][357] ([Intel XE#4208] / [i915#2575]) -> [SKIP][358] ([Intel XE#323])
>     [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-464/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
>     [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
> 
>    * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
>      - shard-dg2-set2:     [SKIP][359] ([Intel XE#323]) -> [SKIP][360] ([Intel XE#4208] / [i915#2575])
>     [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
>     [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-464/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
> 
>    * igt@kms_dp_link_training@non-uhbr-mst:
>      - shard-dg2-set2:     [SKIP][361] ([Intel XE#4354]) -> [SKIP][362] ([Intel XE#4208])
>     [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-432/igt@kms_dp_link_training@non-uhbr-mst.html
>     [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-464/igt@kms_dp_link_training@non-uhbr-mst.html
> 
>    * igt@kms_dp_link_training@uhbr-sst:
>      - shard-dg2-set2:     [SKIP][363] ([Intel XE#4208]) -> [SKIP][364] ([Intel XE#4356])
>     [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-464/igt@kms_dp_link_training@uhbr-sst.html
>     [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-463/igt@kms_dp_link_training@uhbr-sst.html
> 
>    * igt@kms_dsc@dsc-with-output-formats-with-bpc:
>      - shard-dg2-set2:     [SKIP][365] ([Intel XE#4208]) -> [SKIP][366] ([Intel XE#455]) +4 other tests skip
>     [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-464/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
>     [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-435/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
> 
>    * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
>      - shard-dg2-set2:     [SKIP][367] ([Intel XE#4422]) -> [SKIP][368] ([Intel XE#4208]) +1 other test skip
>     [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-433/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html
>     [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-464/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html
> 
>    * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
>      - shard-dg2-set2:     [SKIP][369] ([Intel XE#4208]) -> [SKIP][370] ([Intel XE#4422])
>     [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-433/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
>     [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-432/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
> 
>    * igt@kms_feature_discovery@psr1:
>      - shard-dg2-set2:     [SKIP][371] ([Intel XE#4208] / [i915#2575]) -> [SKIP][372] ([Intel XE#1135])
>     [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-464/igt@kms_feature_discovery@psr1.html
>     [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-463/igt@kms_feature_discovery@psr1.html
> 
>    * igt@kms_feature_discovery@psr2:
>      - shard-dg2-set2:     [SKIP][373] ([Intel XE#1135]) -> [SKIP][374] ([Intel XE#4208] / [i915#2575])
>     [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-463/igt@kms_feature_discovery@psr2.html
>     [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-464/igt@kms_feature_discovery@psr2.html
> 
>    * igt@kms_flip@2x-flip-vs-expired-vblank:
>      - shard-dg2-set2:     [FAIL][375] ([Intel XE#301]) -> [SKIP][376] ([Intel XE#4208] / [i915#2575])
>     [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank.html
>     [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank.html
> 
>    * igt@kms_flip@flip-vs-expired-vblank-interruptible:
>      - shard-dg2-set2:     [SKIP][377] ([Intel XE#4208] / [i915#2575]) -> [FAIL][378] ([Intel XE#301])
>     [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
>     [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
> 
>    * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
>      - shard-dg2-set2:     [SKIP][379] ([Intel XE#455]) -> [SKIP][380] ([Intel XE#4208]) +3 other tests skip
>     [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
>     [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
> 
>    * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
>      - shard-dg2-set2:     [SKIP][381] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][382] ([Intel XE#455]) +1 other test skip
>     [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
>     [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
> 
>    * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
>      - shard-dg2-set2:     [SKIP][383] ([Intel XE#455]) -> [SKIP][384] ([Intel XE#2351] / [Intel XE#4208]) +3 other tests skip
>     [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
>     [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
> 
>    * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
>      - shard-dg2-set2:     [SKIP][385] ([Intel XE#4208]) -> [SKIP][386] ([Intel XE#651]) +24 other tests skip
>     [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
>     [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
> 
>    * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
>      - shard-bmg:          [SKIP][387] ([Intel XE#2312]) -> [SKIP][388] ([Intel XE#2311]) +23 other tests skip
>     [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
>     [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
> 
>    * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
>      - shard-bmg:          [SKIP][389] ([Intel XE#2311]) -> [SKIP][390] ([Intel XE#2312]) +20 other tests skip
>     [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
>     [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
> 
>    * igt@kms_frontbuffer_tracking@drrs-suspend:
>      - shard-dg2-set2:     [SKIP][391] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][392] ([Intel XE#651]) +9 other tests skip
>     [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-suspend.html
>     [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-suspend.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
>      - shard-bmg:          [SKIP][393] ([Intel XE#4141]) -> [SKIP][394] ([Intel XE#2312]) +9 other tests skip
>     [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
>     [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
>      - shard-bmg:          [SKIP][395] ([Intel XE#2312]) -> [SKIP][396] ([Intel XE#4141]) +10 other tests skip
>     [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
>     [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
> 
>    * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:
>      - shard-dg2-set2:     [SKIP][397] ([Intel XE#651]) -> [SKIP][398] ([Intel XE#2351] / [Intel XE#4208]) +13 other tests skip
>     [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html
>     [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html
> 
>    * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt:
>      - shard-dg2-set2:     [SKIP][399] ([Intel XE#651]) -> [SKIP][400] ([Intel XE#4208]) +12 other tests skip
>     [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html
>     [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html
> 
>    * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
>      - shard-dg2-set2:     [SKIP][401] ([Intel XE#658]) -> [SKIP][402] ([Intel XE#2351] / [Intel XE#4208])
>     [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
>     [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:
>      - shard-dg2-set2:     [SKIP][403] ([Intel XE#4208]) -> [SKIP][404] ([Intel XE#653]) +21 other tests skip
>     [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html
>     [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
>      - shard-bmg:          [SKIP][405] ([Intel XE#2313]) -> [SKIP][406] ([Intel XE#2312]) +17 other tests skip
>     [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
>     [406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
>      - shard-dg2-set2:     [SKIP][407] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][408] ([Intel XE#653]) +11 other tests skip
>     [407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html
>     [408]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html
> 
>    * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
>      - shard-dg2-set2:     [SKIP][409] ([Intel XE#653]) -> [SKIP][410] ([Intel XE#4208]) +18 other tests skip
>     [409]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
>     [410]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
> 
>    * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
>      - shard-bmg:          [SKIP][411] ([Intel XE#2312]) -> [SKIP][412] ([Intel XE#2313]) +27 other tests skip
>     [411]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
>     [412]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
> 
>    * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
>      - shard-dg2-set2:     [SKIP][413] ([Intel XE#653]) -> [SKIP][414] ([Intel XE#2351] / [Intel XE#4208]) +11 other tests skip
>     [413]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
>     [414]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
> 
>    * igt@kms_hdr@brightness-with-hdr:
>      - shard-bmg:          [SKIP][415] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][416] ([Intel XE#3544])
>     [415]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html
>     [416]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html
> 
>    * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
>      - shard-dg2-set2:     [SKIP][417] ([Intel XE#4208]) -> [SKIP][418] ([Intel XE#2925])
>     [417]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-464/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
>     [418]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-432/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
> 
>    * igt@kms_panel_fitting@legacy:
>      - shard-dg2-set2:     [SKIP][419] ([Intel XE#4208] / [i915#2575]) -> [SKIP][420] ([Intel XE#455]) +5 other tests skip
>     [419]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-464/igt@kms_panel_fitting@legacy.html
>     [420]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-433/igt@kms_panel_fitting@legacy.html
> 
>    * igt@kms_plane_cursor@primary:
>      - shard-dg2-set2:     [SKIP][421] ([Intel XE#4208] / [i915#2575]) -> [FAIL][422] ([Intel XE#616])
>     [421]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-464/igt@kms_plane_cursor@primary.html
>     [422]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-432/igt@kms_plane_cursor@primary.html
> 
>    * igt@kms_plane_multiple@2x-tiling-y:
>      - shard-bmg:          [SKIP][423] ([Intel XE#5021]) -> [SKIP][424] ([Intel XE#4596])
>     [423]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-y.html
>     [424]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-y.html
>      - shard-dg2-set2:     [SKIP][425] ([Intel XE#5021]) -> [SKIP][426] ([Intel XE#4208] / [i915#2575])
>     [425]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-436/igt@kms_plane_multiple@2x-tiling-y.html
>     [426]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-y.html
> 
>    * igt@kms_plane_multiple@2x-tiling-yf:
>      - shard-bmg:          [SKIP][427] ([Intel XE#4596]) -> [SKIP][428] ([Intel XE#5021])
>     [427]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-yf.html
>     [428]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-yf.html
> 
>    * igt@kms_plane_multiple@tiling-y:
>      - shard-dg2-set2:     [SKIP][429] ([Intel XE#4208] / [i915#2575]) -> [SKIP][430] ([Intel XE#5020])
>     [429]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-464/igt@kms_plane_multiple@tiling-y.html
>     [430]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-435/igt@kms_plane_multiple@tiling-y.html
> 
>    * igt@kms_plane_scaling@intel-max-src-size:
>      - shard-dg2-set2:     [SKIP][431] ([Intel XE#455]) -> [ABORT][432] ([Intel XE#4760])
>     [431]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size.html
>     [432]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size.html
> 
>    * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
>      - shard-dg2-set2:     [SKIP][433] ([Intel XE#4208] / [i915#2575]) -> [SKIP][434] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
>     [433]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
>     [434]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
> 
>    * igt@kms_plane_scaling@planes-downscale-factor-0-25:
>      - shard-dg2-set2:     [SKIP][435] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][436] ([Intel XE#4208] / [i915#2575])
>     [435]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25.html
>     [436]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-25.html
> 
>    * igt@kms_pm_backlight@fade:
>      - shard-dg2-set2:     [SKIP][437] ([Intel XE#4208]) -> [SKIP][438] ([Intel XE#870])
>     [437]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-464/igt@kms_pm_backlight@fade.html
>     [438]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-433/igt@kms_pm_backlight@fade.html
> 
>    * igt@kms_pm_dc@dc5-psr:
>      - shard-dg2-set2:     [SKIP][439] ([Intel XE#4208]) -> [SKIP][440] ([Intel XE#1129])
>     [439]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-464/igt@kms_pm_dc@dc5-psr.html
>     [440]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-432/igt@kms_pm_dc@dc5-psr.html
> 
>    * igt@kms_pm_dc@dc5-retention-flops:
>      - shard-dg2-set2:     [SKIP][441] ([Intel XE#4208]) -> [SKIP][442] ([Intel XE#3309])
>     [441]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-433/igt@kms_pm_dc@dc5-retention-flops.html
>     [442]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-433/igt@kms_pm_dc@dc5-retention-flops.html
> 
>    * igt@kms_properties@get_properties-sanity-atomic:
>      - shard-dg2-set2:     [SKIP][443] ([Intel XE#4208] / [i915#2575]) -> [FAIL][444] ([Intel XE#5017])
>     [443]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-464/igt@kms_properties@get_properties-sanity-atomic.html
>     [444]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-433/igt@kms_properties@get_properties-sanity-atomic.html
> 
>    * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
>      - shard-dg2-set2:     [SKIP][445] ([Intel XE#4208]) -> [SKIP][446] ([Intel XE#1489]) +10 other tests skip
>     [445]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html
>     [446]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-432/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html
> 
>    * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
>      - shard-dg2-set2:     [SKIP][447] ([Intel XE#1489]) -> [SKIP][448] ([Intel XE#4208]) +9 other tests skip
>     [447]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html
>     [448]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-464/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html
> 
>    * igt@kms_psr2_su@frontbuffer-xrgb8888:
>      - shard-dg2-set2:     [SKIP][449] ([Intel XE#4208]) -> [SKIP][450] ([Intel XE#1122])
>     [449]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-464/igt@kms_psr2_su@frontbuffer-xrgb8888.html
>     [450]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-435/igt@kms_psr2_su@frontbuffer-xrgb8888.html
> 
>    * igt@kms_psr@fbc-psr-no-drrs:
>      - shard-dg2-set2:     [SKIP][451] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][452] ([Intel XE#2351] / [Intel XE#4208]) +2 other tests skip
>     [451]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-434/igt@kms_psr@fbc-psr-no-drrs.html
>     [452]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-464/igt@kms_psr@fbc-psr-no-drrs.html
> 
>    * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
>      - shard-dg2-set2:     [SKIP][453] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][454] ([Intel XE#4208]) +6 other tests skip
>     [453]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-434/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html
>     [454]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-464/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html
> 
>    * igt@kms_psr@psr-dpms:
>      - shard-dg2-set2:     [SKIP][455] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][456] ([Intel XE#2850] / [Intel XE#929]) +8 other tests skip
>     [455]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-464/igt@kms_psr@psr-dpms.html
>     [456]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-435/igt@kms_psr@psr-dpms.html
> 
>    * igt@kms_psr@psr2-basic:
>      - shard-dg2-set2:     [SKIP][457] ([Intel XE#4208]) -> [SKIP][458] ([Intel XE#2850] / [Intel XE#929]) +14 other tests skip
>     [457]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-464/igt@kms_psr@psr2-basic.html
>     [458]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-435/igt@kms_psr@psr2-basic.html
> 
>    * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>      - shard-dg2-set2:     [SKIP][459] ([Intel XE#1127]) -> [SKIP][460] ([Intel XE#4208] / [i915#2575])
>     [459]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
>     [460]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-464/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
> 
>    * igt@kms_rotation_crc@sprite-rotation-270:
>      - shard-dg2-set2:     [SKIP][461] ([Intel XE#4208] / [i915#2575]) -> [SKIP][462] ([Intel XE#3414]) +2 other tests skip
>     [461]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-464/igt@kms_rotation_crc@sprite-rotation-270.html
>     [462]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-270.html
> 
>    * igt@kms_tiled_display@basic-test-pattern:
>      - shard-dg2-set2:     [FAIL][463] ([Intel XE#1729]) -> [SKIP][464] ([Intel XE#362])
>     [463]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern.html
>     [464]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
> 
>    * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>      - shard-dg2-set2:     [SKIP][465] ([Intel XE#4208] / [i915#2575]) -> [SKIP][466] ([Intel XE#1500])
>     [465]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>     [466]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>    * igt@kms_tv_load_detect@load-detect:
>      - shard-dg2-set2:     [SKIP][467] ([Intel XE#330]) -> [SKIP][468] ([Intel XE#4208] / [i915#2575])
>     [467]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-433/igt@kms_tv_load_detect@load-detect.html
>     [468]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-464/igt@kms_tv_load_detect@load-detect.html
> 
>    * igt@kms_vrr@flip-dpms:
>      - shard-dg2-set2:     [SKIP][469] ([Intel XE#455]) -> [SKIP][470] ([Intel XE#4208] / [i915#2575]) +8 other tests skip
>     [469]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-435/igt@kms_vrr@flip-dpms.html
>     [470]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-464/igt@kms_vrr@flip-dpms.html
> 
>    * igt@kms_writeback@writeback-check-output:
>      - shard-dg2-set2:     [SKIP][471] ([Intel XE#4208] / [i915#2575]) -> [SKIP][472] ([Intel XE#756])
>     [471]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-464/igt@kms_writeback@writeback-check-output.html
>     [472]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-463/igt@kms_writeback@writeback-check-output.html
> 
>    * igt@kms_writeback@writeback-fb-id:
>      - shard-dg2-set2:     [SKIP][473] ([Intel XE#756]) -> [SKIP][474] ([Intel XE#4208] / [i915#2575]) +2 other tests skip
>     [473]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-435/igt@kms_writeback@writeback-fb-id.html
>     [474]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-464/igt@kms_writeback@writeback-fb-id.html
> 
>    * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
>      - shard-dg2-set2:     [SKIP][475] ([Intel XE#4208] / [i915#2575]) -> [SKIP][476] ([Intel XE#1091] / [Intel XE#2849])
>     [475]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-464/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
>     [476]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-432/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
> 
>    * igt@testdisplay:
>      - shard-dg2-set2:     [ABORT][477] ([Intel XE#2705]) -> [SKIP][478] ([Intel XE#4208])
>     [477]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-435/igt@testdisplay.html
>     [478]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-464/igt@testdisplay.html
> 
>    * igt@xe_compute_preempt@compute-preempt:
>      - shard-dg2-set2:     [SKIP][479] ([Intel XE#4208]) -> [SKIP][480] ([Intel XE#1280] / [Intel XE#455])
>     [479]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-464/igt@xe_compute_preempt@compute-preempt.html
>     [480]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-463/igt@xe_compute_preempt@compute-preempt.html
> 
>    * igt@xe_copy_basic@mem-copy-linear-0x3fff:
>      - shard-dg2-set2:     [SKIP][481] ([Intel XE#1123]) -> [SKIP][482] ([Intel XE#4208])
>     [481]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
>     [482]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
> 
>    * igt@xe_copy_basic@mem-copy-linear-0xfd:
>      - shard-dg2-set2:     [SKIP][483] ([Intel XE#4208]) -> [SKIP][484] ([Intel XE#1123])
>     [483]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0xfd.html
>     [484]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfd.html
> 
>    * igt@xe_eu_stall@blocking-read:
>      - shard-dg2-set2:     [SKIP][485] ([Intel XE#4208]) -> [SKIP][486] ([Intel XE#4497]) +2 other tests skip
>     [485]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-433/igt@xe_eu_stall@blocking-read.html
>     [486]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-435/igt@xe_eu_stall@blocking-read.html
> 
>    * igt@xe_eu_stall@invalid-gt-id:
>      - shard-dg2-set2:     [SKIP][487] ([Intel XE#4497]) -> [SKIP][488] ([Intel XE#4208])
>     [487]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-463/igt@xe_eu_stall@invalid-gt-id.html
>     [488]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-464/igt@xe_eu_stall@invalid-gt-id.html
> 
>    * igt@xe_eudebug@basic-close:
>      - shard-dg2-set2:     [SKIP][489] ([Intel XE#4837]) -> [SKIP][490] ([Intel XE#4208]) +13 other tests skip
>     [489]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-434/igt@xe_eudebug@basic-close.html
>     [490]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-464/igt@xe_eudebug@basic-close.html
> 
>    * igt@xe_eudebug_sriov@deny-eudebug:
>      - shard-dg2-set2:     [SKIP][491] ([Intel XE#4208]) -> [SKIP][492] ([Intel XE#4518]) +1 other test skip
>     [491]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-464/igt@xe_eudebug_sriov@deny-eudebug.html
>     [492]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-432/igt@xe_eudebug_sriov@deny-eudebug.html
> 
>    * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:
>      - shard-dg2-set2:     [SKIP][493] ([Intel XE#4208]) -> [SKIP][494] ([Intel XE#1392])
>     [493]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-464/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html
>     [494]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html
> 
>    * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-imm:
>      - shard-dg2-set2:     [SKIP][495] ([Intel XE#288]) -> [SKIP][496] ([Intel XE#4208]) +25 other tests skip
>     [495]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-463/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-imm.html
>     [496]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-464/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-imm.html
> 
>    * igt@xe_exec_fault_mode@twice-userptr-prefetch:
>      - shard-dg2-set2:     [SKIP][497] ([Intel XE#4208]) -> [SKIP][498] ([Intel XE#288]) +30 other tests skip
>     [497]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-464/igt@xe_exec_fault_mode@twice-userptr-prefetch.html
>     [498]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-prefetch.html
> 
>    * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
>      - shard-dg2-set2:     [SKIP][499] ([Intel XE#4208]) -> [SKIP][500] ([Intel XE#2360])
>     [499]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-464/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
>     [500]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
> 
>    * igt@xe_exec_sip_eudebug@breakpoint-writesip:
>      - shard-dg2-set2:     [SKIP][501] ([Intel XE#4208]) -> [SKIP][502] ([Intel XE#4837]) +16 other tests skip
>     [501]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-464/igt@xe_exec_sip_eudebug@breakpoint-writesip.html
>     [502]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-432/igt@xe_exec_sip_eudebug@breakpoint-writesip.html
> 
>    * igt@xe_exec_system_allocator@many-large-malloc-nomemset:
>      - shard-dg2-set2:     [SKIP][503] ([Intel XE#4208]) -> [SKIP][504] ([Intel XE#4915]) +206 other tests skip
>     [503]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-464/igt@xe_exec_system_allocator@many-large-malloc-nomemset.html
>     [504]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-433/igt@xe_exec_system_allocator@many-large-malloc-nomemset.html
> 
>    * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc:
>      - shard-dg2-set2:     [SKIP][505] ([Intel XE#4915]) -> [SKIP][506] ([Intel XE#4208]) +179 other tests skip
>     [505]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-433/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc.html
>     [506]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-464/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc.html
> 
>    * igt@xe_oa@invalid-create-userspace-config:
>      - shard-dg2-set2:     [SKIP][507] ([Intel XE#4208]) -> [SKIP][508] ([Intel XE#2541] / [Intel XE#3573]) +3 other tests skip
>     [507]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-464/igt@xe_oa@invalid-create-userspace-config.html
>     [508]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-463/igt@xe_oa@invalid-create-userspace-config.html
> 
>    * igt@xe_oa@syncs-syncobj-cfg:
>      - shard-dg2-set2:     [SKIP][509] ([Intel XE#4208]) -> [SKIP][510] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
>     [509]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-464/igt@xe_oa@syncs-syncobj-cfg.html
>     [510]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-435/igt@xe_oa@syncs-syncobj-cfg.html
> 
>    * igt@xe_oa@syncs-userptr-wait-cfg:
>      - shard-dg2-set2:     [SKIP][511] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501]) -> [SKIP][512] ([Intel XE#4208])
>     [511]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-435/igt@xe_oa@syncs-userptr-wait-cfg.html
>     [512]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-464/igt@xe_oa@syncs-userptr-wait-cfg.html
> 
>    * igt@xe_oa@whitelisted-registers-userspace-config:
>      - shard-dg2-set2:     [SKIP][513] ([Intel XE#2541] / [Intel XE#3573]) -> [SKIP][514] ([Intel XE#4208]) +6 other tests skip
>     [513]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-434/igt@xe_oa@whitelisted-registers-userspace-config.html
>     [514]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-464/igt@xe_oa@whitelisted-registers-userspace-config.html
> 
>    * igt@xe_peer2peer@read:
>      - shard-dg2-set2:     [SKIP][515] ([Intel XE#1061] / [Intel XE#4208]) -> [FAIL][516] ([Intel XE#1173])
>     [515]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-464/igt@xe_peer2peer@read.html
>     [516]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-463/igt@xe_peer2peer@read.html
> 
>    * igt@xe_pm@d3cold-mmap-system:
>      - shard-dg2-set2:     [SKIP][517] ([Intel XE#4208]) -> [SKIP][518] ([Intel XE#2284] / [Intel XE#366])
>     [517]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-464/igt@xe_pm@d3cold-mmap-system.html
>     [518]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-436/igt@xe_pm@d3cold-mmap-system.html
> 
>    * igt@xe_pm@s2idle-d3cold-basic-exec:
>      - shard-dg2-set2:     [SKIP][519] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][520] ([Intel XE#4208]) +1 other test skip
>     [519]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-435/igt@xe_pm@s2idle-d3cold-basic-exec.html
>     [520]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-464/igt@xe_pm@s2idle-d3cold-basic-exec.html
> 
>    * igt@xe_pmu@all-fn-engine-activity-load:
>      - shard-dg2-set2:     [SKIP][521] ([Intel XE#4208]) -> [SKIP][522] ([Intel XE#4650]) +1 other test skip
>     [521]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-464/igt@xe_pmu@all-fn-engine-activity-load.html
>     [522]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-463/igt@xe_pmu@all-fn-engine-activity-load.html
> 
>    * igt@xe_pxp@pxp-stale-bo-bind-post-suspend:
>      - shard-dg2-set2:     [SKIP][523] ([Intel XE#4733]) -> [SKIP][524] ([Intel XE#4208])
>     [523]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-434/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html
>     [524]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-464/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html
> 
>    * igt@xe_pxp@pxp-termination-key-update-post-termination-irq:
>      - shard-dg2-set2:     [SKIP][525] ([Intel XE#4208]) -> [SKIP][526] ([Intel XE#4733]) +1 other test skip
>     [525]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-464/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html
>     [526]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-434/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html
> 
>    * igt@xe_query@multigpu-query-oa-units:
>      - shard-dg2-set2:     [SKIP][527] ([Intel XE#944]) -> [SKIP][528] ([Intel XE#4208]) +2 other tests skip
>     [527]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-435/igt@xe_query@multigpu-query-oa-units.html
>     [528]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-464/igt@xe_query@multigpu-query-oa-units.html
> 
>    * igt@xe_query@multigpu-query-topology-l3-bank-mask:
>      - shard-dg2-set2:     [SKIP][529] ([Intel XE#4208]) -> [SKIP][530] ([Intel XE#944])
>     [529]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-433/igt@xe_query@multigpu-query-topology-l3-bank-mask.html
>     [530]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-434/igt@xe_query@multigpu-query-topology-l3-bank-mask.html
> 
>    * igt@xe_render_copy@render-stress-1-copies:
>      - shard-dg2-set2:     [SKIP][531] ([Intel XE#4814]) -> [SKIP][532] ([Intel XE#4208])
>     [531]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-435/igt@xe_render_copy@render-stress-1-copies.html
>     [532]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-464/igt@xe_render_copy@render-stress-1-copies.html
> 
>    * igt@xe_sriov_auto_provisioning@fair-allocation:
>      - shard-dg2-set2:     [SKIP][533] ([Intel XE#4208]) -> [SKIP][534] ([Intel XE#4130])
>     [533]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8364/shard-dg2-464/igt@xe_sriov_auto_provisioning@fair-allocation.html
>     [534]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/shard-dg2-436/igt@xe_sriov_auto_provisioning@fair-allocation.html
> 
>    
>    {name}: This element is suppressed. This means it is ignored when computing
>            the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>    [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
>    [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
>    [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>    [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>    [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>    [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>    [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
>    [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
>    [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
>    [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
>    [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
>    [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>    [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
>    [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
>    [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>    [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
>    [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>    [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>    [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>    [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>    [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>    [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>    [Intel XE#1465]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465
>    [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
>    [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
>    [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>    [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>    [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
>    [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>    [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
>    [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
>    [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>    [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
>    [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>    [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>    [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>    [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
>    [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>    [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
>    [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>    [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
>    [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>    [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>    [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
>    [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
>    [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>    [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
>    [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>    [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
>    [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
>    [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>    [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>    [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>    [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
>    [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>    [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
>    [Intel XE#2340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340
>    [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
>    [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
>    [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
>    [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
>    [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
>    [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
>    [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
>    [Intel XE#2501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501
>    [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
>    [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
>    [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
>    [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>    [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
>    [Intel XE#2685]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2685
>    [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
>    [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
>    [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>    [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
>    [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>    [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>    [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
>    [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>    [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
>    [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
>    [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
>    [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
>    [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
>    [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
>    [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>    [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>    [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>    [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>    [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>    [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
>    [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
>    [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>    [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>    [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
>    [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
>    [Intel XE#3307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307
>    [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
>    [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
>    [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
>    [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>    [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>    [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
>    [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
>    [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
>    [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
>    [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>    [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>    [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>    [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
>    [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
>    [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
>    [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>    [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
>    [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>    [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
>    [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
>    [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
>    [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
>    [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
>    [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
>    [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
>    [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
>    [Intel XE#4356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356
>    [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
>    [Intel XE#4494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494
>    [Intel XE#4497]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4497
>    [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
>    [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
>    [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>    [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
>    [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
>    [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
>    [Intel XE#4618]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4618
>    [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
>    [Intel XE#4667]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4667
>    [Intel XE#4692]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4692
>    [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>    [Intel XE#4760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760
>    [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
>    [Intel XE#4819]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4819
>    [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
>    [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
>    [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
>    [Intel XE#4983]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4983
>    [Intel XE#5017]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5017
>    [Intel XE#5018]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018
>    [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
>    [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
>    [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
>    [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>    [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
>    [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>    [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
>    [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>    [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>    [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>    [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
>    [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
>    [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>    [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
>    [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>    [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
>    [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>    [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>    [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
>    [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
>    [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>    [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>    [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
> 
> 
> Build changes
> -------------
> 
>    * IGT: IGT_8364 -> IGTPW_13127
>    * Linux: xe-3086-2e72fd09b4fb0823282977f0717159e47328a533 -> xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961
> 
>    IGTPW_13127: 13127
>    IGT_8364: 8364
>    xe-3086-2e72fd09b4fb0823282977f0717159e47328a533: 2e72fd09b4fb0823282977f0717159e47328a533
>    xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961: dd6a856541dd90fa4ef755783898fcfbea3b9961
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13127/index.html
> 

