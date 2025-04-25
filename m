Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B08C369C2
	for <igt-dev@archiver.kernel.org>; Fri, 25 Apr 2025 09:56:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12A9410E8FD;
	Fri, 25 Apr 2025 09:56:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cj1xZKkQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D550610E094;
 Fri, 25 Apr 2025 09:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745574999; x=1777110999;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=glGVLs44PTNwZP2mdqwNoT2IdZbHv4fwH+FvE3jSWEU=;
 b=cj1xZKkQ3GBMBAZQlzpdujtjCN1/EXPWF4vjwxJM+/qlPQt3af12Urd2
 hBRiRmoL2RxpM9LBV5Hni004ItxktPRCIv4PZh88FGtdbbwF9gwqjwwDZ
 kVsuPuYWhifGJb4yRy7Rl49y2Z5pl0Fv/t1BPj/c9xJuvDviKb2znCUtF
 5bBDyDg/iRtmVd46j7npQgXKACQJG6TQOjYM8tNFJdp7leQyWcuF/sbtA
 IVspkylbRPqNWbi/O+0mxh0HlBOj6C2rpdUfTCOwIUC2xro3f5zcBOSgj
 OWd0r0GhyjVCyKUDku2EeUELeukXbLzr2UCghFqrLkm0/WICUgAoftdpl w==;
X-CSE-ConnectionGUID: rhmlXkt6Q0C9QNWxSTIFeQ==
X-CSE-MsgGUID: O0put3V4SzGXRagAQjttGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="51041373"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="51041373"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 02:56:38 -0700
X-CSE-ConnectionGUID: hzZuzC/YTVOnEo4isZ3WNA==
X-CSE-MsgGUID: GQZDB575RoSQ3ek+KC6c6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="132759705"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.245.80.134])
 ([10.245.80.134])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 02:56:37 -0700
Message-ID: <73863ff3-2ffc-493d-882e-68a8c11adf09@linux.intel.com>
Date: Fri, 25 Apr 2025 11:56:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciB0ZXN0cy94ZV9m?=
 =?UTF-8?Q?ault=5Finjection=3A_Skip_OA_test_if_Xe_OA_interface_is_not_availa?=
 =?UTF-8?Q?ble?=
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250423125210.1385220-1-marcin.bernatowicz@linux.intel.com>
 <174552426741.8339.486793667045071379@c664b1dc75d1>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <174552426741.8339.486793667045071379@c664b1dc75d1>
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



On 4/24/2025 9:51 PM, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/xe_fault_injection: Skip OA test if Xe OA interface is not available
> URL   : https://patchwork.freedesktop.org/series/148132/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8333_FULL -> XEIGTPW_13032_FULL
> ====================================================
> 
> Summary
> -------
> 
>    **WARNING**
> 
>    Minor unknown changes coming with XEIGTPW_13032_FULL need to be verified
>    manually.
>    
>    If you think the reported changes have nothing to do with the changes
>    introduced in XEIGTPW_13032_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>    Here are the unknown changes that may have been introduced in XEIGTPW_13032_FULL:
> 
> ### IGT changes ###
> 
> #### Warnings ####
> 
>    * igt@kms_hdr@static-toggle:
>      - shard-bmg:          [SKIP][1] ([Intel XE#1503]) -> [SKIP][2]
>     [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8333/shard-bmg-6/igt@kms_hdr@static-toggle.html
>     [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-bmg-6/igt@kms_hdr@static-toggle.html
> 

Not related to the change.
-- 
marcin

>    
> Known issues
> ------------
> 
>    Here are the changes found in XEIGTPW_13032_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>    * igt@intel_hwmon@hwmon-read:
>      - shard-lnl:          NOTRUN -> [SKIP][3] ([Intel XE#1125])
>     [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-lnl-5/igt@intel_hwmon@hwmon-read.html
> 
>    * igt@intel_hwmon@hwmon-write:
>      - shard-bmg:          NOTRUN -> [FAIL][4] ([Intel XE#4665])
>     [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-bmg-7/igt@intel_hwmon@hwmon-write.html
> 
>    * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-2-4-rc-ccs-cc:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][5] ([Intel XE#3767]) +15 other tests skip
>     [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-2-4-rc-ccs-cc.html
> 
>    * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][6] ([Intel XE#2550] / [Intel XE#3767]) +15 other tests skip
>     [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-dg2-466/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html
> 
>    * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][7] ([Intel XE#316]) +2 other tests skip
>     [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-dg2-466/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
> 
>    * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
>      - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2327]) +1 other test skip
>     [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-bmg-5/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
> 
>    * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
>      - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#1124]) +8 other tests skip
>     [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-bmg-2/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
> 
>    * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
>      - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#1124]) +2 other tests skip
>     [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-lnl-7/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html
> 
>    * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
>      - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#607])
>     [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-bmg-3/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
> 
>    * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#1124]) +8 other tests skip
>     [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>    * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#2191])
>     [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
> 
>    * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
>      - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#367]) +1 other test skip
>     [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-bmg-1/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
> 
>    * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#367]) +1 other test skip
>     [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-dg2-466/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html
> 
>    * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
>      - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2887]) +8 other tests skip
>     [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-bmg-6/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html
> 
>    * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
>      - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#2887]) +4 other tests skip
>     [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-lnl-6/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html
> 
>    * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#455] / [Intel XE#787]) +19 other tests skip
>     [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-dg2-464/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html
> 
>    * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:
>      - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
>     [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-bmg-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html
> 
>    * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>      - shard-bmg:          [PASS][20] -> [INCOMPLETE][21] ([Intel XE#3862]) +1 other test incomplete
>     [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8333/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
>     [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
> 
>    * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
>      - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#3432])
>     [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html
> 
>    * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
>      - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#3432])
>     [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html
> 
>    * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#787]) +111 other tests skip
>     [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html
> 
>    * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#2907])
>     [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
> 
>    * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
>      - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][26] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
>     [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html
> 
>    * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:
>      - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][27] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
>     [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html
> 
>    * igt@kms_cdclk@mode-transition-all-outputs:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#4418])
>     [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-dg2-435/igt@kms_cdclk@mode-transition-all-outputs.html
>      - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#4418])
>     [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-lnl-1/igt@kms_cdclk@mode-transition-all-outputs.html
> 
>    * igt@kms_cdclk@plane-scaling:
>      - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#4416]) +3 other tests skip
>     [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-lnl-3/igt@kms_cdclk@plane-scaling.html
> 
>    * igt@kms_chamelium_color@ctm-green-to-red:
>      - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2325]) +1 other test skip
>     [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-bmg-2/igt@kms_chamelium_color@ctm-green-to-red.html
> 
>    * igt@kms_chamelium_color@ctm-limited-range:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#306]) +1 other test skip
>     [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-dg2-434/igt@kms_chamelium_color@ctm-limited-range.html
> 
>    * igt@kms_chamelium_color@ctm-max:
>      - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#306])
>     [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-lnl-7/igt@kms_chamelium_color@ctm-max.html
> 
>    * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
>      - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#373]) +2 other tests skip
>     [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-lnl-6/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
> 
>    * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
>      - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#2252]) +3 other tests skip
>     [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-bmg-8/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
> 
>    * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#373]) +1 other test skip
>     [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
> 
>    * igt@kms_content_protection@dp-mst-lic-type-1:
>      - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2390])
>     [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-bmg-5/igt@kms_content_protection@dp-mst-lic-type-1.html
> 
>    * igt@kms_content_protection@legacy@pipe-a-dp-2:
>      - shard-dg2-set2:     NOTRUN -> [FAIL][38] ([Intel XE#1178]) +1 other test fail
>     [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-dg2-432/igt@kms_content_protection@legacy@pipe-a-dp-2.html
>      - shard-bmg:          NOTRUN -> [FAIL][39] ([Intel XE#1178])
>     [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-bmg-2/igt@kms_content_protection@legacy@pipe-a-dp-2.html
> 
>    * igt@kms_cursor_crc@cursor-sliding-256x85:
>      - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2320]) +3 other tests skip
>     [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-256x85.html
> 
>    * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
>      - shard-bmg:          [PASS][41] -> [SKIP][42] ([Intel XE#2291]) +6 other tests skip
>     [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8333/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
>     [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
> 
>    * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
>      - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2291])
>     [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
> 
>    * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>      - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2286])
>     [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-bmg-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
> 
>    * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
>      - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#1508])
>     [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-bmg-2/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
> 
>    * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
>      - shard-bmg:          [PASS][46] -> [SKIP][47] ([Intel XE#1340])
>     [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8333/shard-bmg-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
>     [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-bmg-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
> 
>    * igt@kms_dp_link_training@non-uhbr-sst:
>      - shard-bmg:          [PASS][48] -> [SKIP][49] ([Intel XE#4354])
>     [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8333/shard-bmg-3/igt@kms_dp_link_training@non-uhbr-sst.html
>     [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-bmg-4/igt@kms_dp_link_training@non-uhbr-sst.html
> 
>    * igt@kms_feature_discovery@chamelium:
>      - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2372])
>     [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-bmg-5/igt@kms_feature_discovery@chamelium.html
> 
>    * igt@kms_feature_discovery@psr2:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#1135])
>     [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-dg2-464/igt@kms_feature_discovery@psr2.html
> 
>    * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
>      - shard-bmg:          NOTRUN -> [FAIL][52] ([Intel XE#2882]) +2 other tests fail
>     [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-bmg-8/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
> 
>    * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
>      - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2316])
>     [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html
> 
>    * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3:
>      - shard-bmg:          [PASS][54] -> [FAIL][55] ([Intel XE#3321])
>     [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8333/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3.html
>     [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3.html
> 
>    * igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:
>      - shard-bmg:          NOTRUN -> [FAIL][56] ([Intel XE#3321]) +4 other tests fail
>     [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
> 
>    * igt@kms_flip@2x-flip-vs-modeset:
>      - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#1421]) +1 other test skip
>     [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-lnl-5/igt@kms_flip@2x-flip-vs-modeset.html
> 
>    * igt@kms_flip@2x-plain-flip-interruptible:
>      - shard-bmg:          [PASS][58] -> [SKIP][59] ([Intel XE#2316]) +7 other tests skip
>     [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8333/shard-bmg-3/igt@kms_flip@2x-plain-flip-interruptible.html
>     [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-bmg-4/igt@kms_flip@2x-plain-flip-interruptible.html
> 
>    * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:
>      - shard-dg2-set2:     [PASS][60] -> [FAIL][61] ([Intel XE#301]) +6 other tests fail
>     [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8333/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html
>     [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html
> 
>    * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
>      - shard-lnl:          [PASS][62] -> [FAIL][63] ([Intel XE#301]) +1 other test fail
>     [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8333/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
>     [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
> 
>    * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6:
>      - shard-dg2-set2:     NOTRUN -> [FAIL][64] ([Intel XE#301]) +1 other test fail
>     [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6.html
> 
>    * igt@kms_flip@flip-vs-expired-vblank@c-dp4:
>      - shard-dg2-set2:     NOTRUN -> [FAIL][65] ([Intel XE#301] / [Intel XE#3321]) +2 other tests fail
>     [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html
> 
>    * igt@kms_flip@flip-vs-suspend:
>      - shard-bmg:          [PASS][66] -> [INCOMPLETE][67] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
>     [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8333/shard-bmg-6/igt@kms_flip@flip-vs-suspend.html
>     [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-bmg-1/igt@kms_flip@flip-vs-suspend.html
> 
>    * igt@kms_flip@flip-vs-suspend@c-dp4:
>      - shard-dg2-set2:     [PASS][68] -> [INCOMPLETE][69] ([Intel XE#2049] / [Intel XE#2597])
>     [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8333/shard-dg2-434/igt@kms_flip@flip-vs-suspend@c-dp4.html
>     [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-dg2-435/igt@kms_flip@flip-vs-suspend@c-dp4.html
> 
>    * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
>      - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#2380]) +1 other test skip
>     [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
> 
>    * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
>      - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#1401] / [Intel XE#1745])
>     [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
> 
>    * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode:
>      - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#1401])
>     [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode.html
> 
>    * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
>      - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#2293] / [Intel XE#2380])
>     [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html
> 
>    * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
>      - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2293])
>     [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
> 
>    * igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw:
>      - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#651]) +4 other tests skip
>     [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw.html
> 
>    * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
>      - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#656]) +5 other tests skip
>     [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
> 
>    * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
>      - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#2312]) +6 other tests skip
>     [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>    * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#651]) +23 other tests skip
>     [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
>      - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#4141]) +5 other tests skip
>     [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
> 
>    * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move:
>      - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#2311]) +12 other tests skip
>     [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
>      - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2313]) +12 other tests skip
>     [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#653]) +24 other tests skip
>     [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html
> 
>    * igt@kms_hdr@invalid-metadata-sizes:
>      - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#1503])
>     [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-bmg-4/igt@kms_hdr@invalid-metadata-sizes.html
> 
>    * igt@kms_joiner@basic-force-big-joiner:
>      - shard-bmg:          [PASS][84] -> [SKIP][85] ([Intel XE#3012])
>     [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8333/shard-bmg-8/igt@kms_joiner@basic-force-big-joiner.html
>     [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-bmg-4/igt@kms_joiner@basic-force-big-joiner.html
> 
>    * igt@kms_joiner@basic-max-non-joiner:
>      - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#4298])
>     [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-bmg-1/igt@kms_joiner@basic-max-non-joiner.html
> 
>    * igt@kms_joiner@invalid-modeset-ultra-joiner:
>      - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#2927])
>     [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-bmg-8/igt@kms_joiner@invalid-modeset-ultra-joiner.html
> 
>    * igt@kms_pipe_crc_basic@suspend-read-crc:
>      - shard-bmg:          [PASS][88] -> [DMESG-WARN][89] ([Intel XE#3428]) +2 other tests dmesg-warn
>     [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8333/shard-bmg-3/igt@kms_pipe_crc_basic@suspend-read-crc.html
>     [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-bmg-6/igt@kms_pipe_crc_basic@suspend-read-crc.html
> 
>    * igt@kms_plane_cursor@overlay:
>      - shard-dg2-set2:     [PASS][90] -> [FAIL][91] ([Intel XE#616])
>     [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8333/shard-dg2-433/igt@kms_plane_cursor@overlay.html
>     [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-dg2-432/igt@kms_plane_cursor@overlay.html
> 
>    * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-2-size-64:
>      - shard-dg2-set2:     NOTRUN -> [FAIL][92] ([Intel XE#616])
>     [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-dg2-432/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-2-size-64.html
> 
>    * igt@kms_plane_multiple@2x-tiling-x:
>      - shard-bmg:          [PASS][93] -> [SKIP][94] ([Intel XE#4596])
>     [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8333/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-x.html
>     [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-x.html
> 
>    * igt@kms_plane_multiple@2x-tiling-y:
>      - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#4596])
>     [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-y.html
> 
>    * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:
>      - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#2763]) +9 other tests skip
>     [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-bmg-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html
> 
>    * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b:
>      - shard-lnl:          NOTRUN -> [SKIP][97] ([Intel XE#2763]) +3 other tests skip
>     [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-lnl-7/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b.html
> 
>    * igt@kms_pm_backlight@bad-brightness:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#870])
>     [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-dg2-463/igt@kms_pm_backlight@bad-brightness.html
> 
>    * igt@kms_pm_backlight@basic-brightness:
>      - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#870])
>     [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-bmg-4/igt@kms_pm_backlight@basic-brightness.html
> 
>    * igt@kms_pm_backlight@brightness-with-dpms:
>      - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#2938])
>     [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-bmg-3/igt@kms_pm_backlight@brightness-with-dpms.html
> 
>    * igt@kms_pm_dc@dc3co-vpb-simulation:
>      - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#2391])
>     [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-bmg-8/igt@kms_pm_dc@dc3co-vpb-simulation.html
> 
>    * igt@kms_pm_dc@dc5-dpms:
>      - shard-lnl:          [PASS][102] -> [FAIL][103] ([Intel XE#718])
>     [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8333/shard-lnl-3/igt@kms_pm_dc@dc5-dpms.html
>     [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-lnl-3/igt@kms_pm_dc@dc5-dpms.html
> 
>    * igt@kms_pm_dc@dc5-dpms-negative:
>      - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#1131])
>     [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-lnl-4/igt@kms_pm_dc@dc5-dpms-negative.html
> 
>    * igt@kms_pm_dc@dc6-psr:
>      - shard-lnl:          NOTRUN -> [FAIL][105] ([Intel XE#718])
>     [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-lnl-6/igt@kms_pm_dc@dc6-psr.html
> 
>    * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
>      - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#1489]) +4 other tests skip
>     [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-bmg-8/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html
> 
>    * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#1489]) +5 other tests skip
>     [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-dg2-433/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html
> 
>    * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:
>      - shard-lnl:          NOTRUN -> [SKIP][108] ([Intel XE#4608])
>     [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1.html
> 
>    * igt@kms_psr2_su@page_flip-nv12:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#1122]) +1 other test skip
>     [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-dg2-434/igt@kms_psr2_su@page_flip-nv12.html
> 
>    * igt@kms_psr@fbc-pr-cursor-plane-onoff:
>      - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#1406]) +1 other test skip
>     [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-lnl-5/igt@kms_psr@fbc-pr-cursor-plane-onoff.html
> 
>    * igt@kms_psr@fbc-psr-sprite-plane-move:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][111] ([Intel XE#2850] / [Intel XE#929]) +6 other tests skip
>     [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-plane-move.html
> 
>    * igt@kms_psr@fbc-psr2-sprite-render@edp-1:
>      - shard-lnl:          NOTRUN -> [SKIP][112] ([Intel XE#4609])
>     [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-lnl-8/igt@kms_psr@fbc-psr2-sprite-render@edp-1.html
> 
>    * igt@kms_psr@psr-primary-page-flip:
>      - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#2234] / [Intel XE#2850]) +10 other tests skip
>     [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-bmg-1/igt@kms_psr@psr-primary-page-flip.html
> 
>    * igt@kms_psr@psr2-cursor-render@edp-1:
>      - shard-lnl:          [PASS][114] -> [FAIL][115] ([Intel XE#3924]) +1 other test fail
>     [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8333/shard-lnl-3/igt@kms_psr@psr2-cursor-render@edp-1.html
>     [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-lnl-7/igt@kms_psr@psr2-cursor-render@edp-1.html
> 
>    * igt@kms_rotation_crc@sprite-rotation-270:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([Intel XE#3414])
>     [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-dg2-435/igt@kms_rotation_crc@sprite-rotation-270.html
> 
>    * igt@kms_rotation_crc@sprite-rotation-90:
>      - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#3414] / [Intel XE#3904])
>     [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-bmg-2/igt@kms_rotation_crc@sprite-rotation-90.html
> 
>    * igt@kms_tiled_display@basic-test-pattern:
>      - shard-dg2-set2:     NOTRUN -> [FAIL][118] ([Intel XE#1729])
>     [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern.html
> 
>    * igt@kms_vrr@flip-suspend:
>      - shard-bmg:          NOTRUN -> [SKIP][119] ([Intel XE#1499]) +1 other test skip
>     [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-bmg-3/igt@kms_vrr@flip-suspend.html
> 
>    * igt@kms_vrr@negative-basic:
>      - shard-bmg:          [PASS][120] -> [SKIP][121] ([Intel XE#1499])
>     [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8333/shard-bmg-7/igt@kms_vrr@negative-basic.html
>     [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-bmg-5/igt@kms_vrr@negative-basic.html
> 
>    * igt@kms_writeback@writeback-invalid-parameters:
>      - shard-bmg:          NOTRUN -> [SKIP][122] ([Intel XE#756])
>     [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-bmg-3/igt@kms_writeback@writeback-invalid-parameters.html
> 
>    * igt@testdisplay:
>      - shard-dg2-set2:     NOTRUN -> [ABORT][123] ([Intel XE#2705])
>     [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-dg2-432/igt@testdisplay.html
> 
>    * igt@xe_compute_preempt@compute-preempt-many-all-ram@engine-drm_xe_engine_class_compute:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][124] ([Intel XE#455]) +14 other tests skip
>     [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-dg2-464/igt@xe_compute_preempt@compute-preempt-many-all-ram@engine-drm_xe_engine_class_compute.html
> 
>    * igt@xe_copy_basic@mem-copy-linear-0x369:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#1123])
>     [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0x369.html
> 
>    * igt@xe_eu_stall@invalid-event-report-count:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][126] ([Intel XE#4497]) +1 other test skip
>     [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-dg2-432/igt@xe_eu_stall@invalid-event-report-count.html
> 
>    * igt@xe_eudebug@basic-connect:
>      - shard-lnl:          NOTRUN -> [SKIP][127] ([Intel XE#4837]) +2 other tests skip
>     [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-lnl-1/igt@xe_eudebug@basic-connect.html
> 
>    * igt@xe_eudebug@basic-vm-access-parameters:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][128] ([Intel XE#4837]) +8 other tests skip
>     [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-dg2-463/igt@xe_eudebug@basic-vm-access-parameters.html
> 
>    * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
>      - shard-bmg:          NOTRUN -> [SKIP][129] ([Intel XE#4837]) +9 other tests skip
>     [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-bmg-6/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html
> 
>    * igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd:
>      - shard-lnl:          NOTRUN -> [SKIP][130] ([Intel XE#688])
>     [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-lnl-5/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd.html
> 
>    * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
>      - shard-dg2-set2:     [PASS][131] -> [SKIP][132] ([Intel XE#1392]) +5 other tests skip
>     [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8333/shard-dg2-466/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html
>     [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html
> 
>    * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][133] ([Intel XE#1392])
>     [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html
> 
>    * igt@xe_exec_basic@multigpu-once-null-defer-mmap:
>      - shard-bmg:          NOTRUN -> [SKIP][134] ([Intel XE#2322]) +4 other tests skip
>     [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-bmg-2/igt@xe_exec_basic@multigpu-once-null-defer-mmap.html
> 
>    * igt@xe_exec_basic@multigpu-once-userptr-invalidate:
>      - shard-lnl:          NOTRUN -> [SKIP][135] ([Intel XE#1392]) +2 other tests skip
>     [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-lnl-3/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html
> 
>    * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][136] ([Intel XE#288]) +19 other tests skip
>     [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-dg2-464/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race.html
> 
>    * igt@xe_exec_threads@threads-hang-userptr-invalidate:
>      - shard-dg2-set2:     [PASS][137] -> [DMESG-WARN][138] ([Intel XE#3876])
>     [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8333/shard-dg2-432/igt@xe_exec_threads@threads-hang-userptr-invalidate.html
>     [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-dg2-466/igt@xe_exec_threads@threads-hang-userptr-invalidate.html
> 
>    * igt@xe_oa@non-privileged-map-oa-buffer:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][139] ([Intel XE#2541] / [Intel XE#3573]) +3 other tests skip
>     [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-dg2-432/igt@xe_oa@non-privileged-map-oa-buffer.html
> 
>    * igt@xe_pat@display-vs-wb-transient:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][140] ([Intel XE#1337])
>     [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-dg2-432/igt@xe_pat@display-vs-wb-transient.html
> 
>    * igt@xe_pat@pat-index-xehpc:
>      - shard-bmg:          NOTRUN -> [SKIP][141] ([Intel XE#1420])
>     [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-bmg-1/igt@xe_pat@pat-index-xehpc.html
> 
>    * igt@xe_pat@pat-index-xelpg:
>      - shard-bmg:          NOTRUN -> [SKIP][142] ([Intel XE#2236])
>     [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-bmg-8/igt@xe_pat@pat-index-xelpg.html
> 
>    * igt@xe_pm@s3-d3cold-basic-exec:
>      - shard-bmg:          NOTRUN -> [SKIP][143] ([Intel XE#2284])
>     [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-bmg-4/igt@xe_pm@s3-d3cold-basic-exec.html
> 
>    * igt@xe_pm@s4-d3cold-basic-exec:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][144] ([Intel XE#2284] / [Intel XE#366])
>     [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-dg2-466/igt@xe_pm@s4-d3cold-basic-exec.html
> 
>    * igt@xe_pm@s4-exec-after:
>      - shard-lnl:          [PASS][145] -> [ABORT][146] ([Intel XE#1794])
>     [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8333/shard-lnl-1/igt@xe_pm@s4-exec-after.html
>     [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-lnl-2/igt@xe_pm@s4-exec-after.html
> 
>    * igt@xe_pxp@pxp-optout:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][147] ([Intel XE#4733])
>     [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-dg2-432/igt@xe_pxp@pxp-optout.html
> 
>    * igt@xe_pxp@pxp-stale-queue-post-suspend:
>      - shard-bmg:          NOTRUN -> [SKIP][148] ([Intel XE#4733]) +2 other tests skip
>     [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-bmg-4/igt@xe_pxp@pxp-stale-queue-post-suspend.html
> 
>    * igt@xe_query@multigpu-query-oa-units:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][149] ([Intel XE#944]) +2 other tests skip
>     [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-dg2-464/igt@xe_query@multigpu-query-oa-units.html
> 
>    * igt@xe_sriov_auto_provisioning@fair-allocation:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][150] ([Intel XE#4130])
>     [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-dg2-435/igt@xe_sriov_auto_provisioning@fair-allocation.html
> 
>    * igt@xe_sriov_flr@flr-vf1-clear:
>      - shard-lnl:          NOTRUN -> [SKIP][151] ([Intel XE#3342])
>     [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-lnl-3/igt@xe_sriov_flr@flr-vf1-clear.html
> 
>    * igt@xe_sriov_scheduling@nonpreempt-engine-resets:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][152] ([Intel XE#4351])
>     [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-dg2-466/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html
> 
>    
> #### Possible fixes ####
> 
>    * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
>      - shard-lnl:          [FAIL][153] ([Intel XE#911]) -> [PASS][154] +3 other tests pass
>     [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8333/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
>     [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
> 
>    * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
>      - shard-dg2-set2:     [INCOMPLETE][155] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> [PASS][156]
>     [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8333/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
>     [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
> 
>    * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:
>      - shard-dg2-set2:     [INCOMPLETE][157] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [PASS][158]
>     [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8333/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html
>     [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html
> 
>    * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
>      - shard-bmg:          [SKIP][159] ([Intel XE#2291]) -> [PASS][160]
>     [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8333/shard-bmg-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
>     [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-bmg-3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
> 
>    * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
>      - shard-bmg:          [FAIL][161] ([Intel XE#1475]) -> [PASS][162]
>     [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8333/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
>     [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
> 
>    * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
>      - shard-dg2-set2:     [FAIL][163] ([Intel XE#886]) -> [PASS][164]
>     [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8333/shard-dg2-432/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html
>     [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-dg2-434/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html
> 
>    * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:
>      - shard-dg2-set2:     [FAIL][165] ([Intel XE#301] / [Intel XE#3321]) -> [PASS][166] +1 other test pass
>     [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8333/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html
>     [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html
> 
>    * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4:
>      - shard-dg2-set2:     [FAIL][167] ([Intel XE#301]) -> [PASS][168] +4 other tests pass
>     [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8333/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html
>     [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html
> 
>    * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
>      - shard-bmg:          [FAIL][169] ([Intel XE#3321]) -> [PASS][170] +2 other tests pass
>     [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8333/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
>     [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
> 
>    * igt@kms_flip@2x-flip-vs-suspend:
>      - shard-dg2-set2:     [INCOMPLETE][171] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][172]
>     [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8333/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend.html
>     [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend.html
> 
>    * igt@kms_flip@plain-flip-ts-check@b-edp1:
>      - shard-lnl:          [FAIL][173] ([Intel XE#886]) -> [PASS][174] +2 other tests pass
>     [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8333/shard-lnl-3/igt@kms_flip@plain-flip-ts-check@b-edp1.html
>     [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-lnl-7/igt@kms_flip@plain-flip-ts-check@b-edp1.html
> 
>    * igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a3:
>      - shard-bmg:          [FAIL][175] ([Intel XE#2882]) -> [PASS][176] +3 other tests pass
>     [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8333/shard-bmg-6/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a3.html
>     [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-bmg-1/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a3.html
> 
>    * igt@kms_hdr@static-swap:
>      - shard-bmg:          [SKIP][177] ([Intel XE#4879]) -> [PASS][178]
>     [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8333/shard-bmg-6/igt@kms_hdr@static-swap.html
>     [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-bmg-1/igt@kms_hdr@static-swap.html
> 
>    * igt@kms_plane_cursor@viewport:
>      - shard-dg2-set2:     [FAIL][179] ([Intel XE#616]) -> [PASS][180] +1 other test pass
>     [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8333/shard-dg2-463/igt@kms_plane_cursor@viewport.html
>     [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-dg2-464/igt@kms_plane_cursor@viewport.html
> 
>    * igt@kms_pm_dc@dc5-psr:
>      - shard-lnl:          [FAIL][181] ([Intel XE#718]) -> [PASS][182]
>     [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8333/shard-lnl-4/igt@kms_pm_dc@dc5-psr.html
>     [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html
> 
>    * igt@kms_setmode@basic@pipe-b-edp-1:
>      - shard-lnl:          [FAIL][183] ([Intel XE#2883]) -> [PASS][184] +2 other tests pass
>     [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8333/shard-lnl-4/igt@kms_setmode@basic@pipe-b-edp-1.html
>     [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-lnl-6/igt@kms_setmode@basic@pipe-b-edp-1.html
> 
>    * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
>      - shard-dg2-set2:     [SKIP][185] ([Intel XE#1392]) -> [PASS][186] +3 other tests pass
>     [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8333/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html
>     [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-dg2-434/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html
> 
>    * igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:
>      - shard-bmg:          [DMESG-WARN][187] -> [PASS][188] +7 other tests pass
>     [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8333/shard-bmg-6/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html
>     [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-bmg-3/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html
> 
>    * igt@xe_pm@s3-exec-after:
>      - shard-bmg:          [DMESG-WARN][189] ([Intel XE#3428] / [Intel XE#569]) -> [PASS][190]
>     [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8333/shard-bmg-6/igt@xe_pm@s3-exec-after.html
>     [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-bmg-4/igt@xe_pm@s3-exec-after.html
> 
>    * igt@xe_pm@s4-basic-exec:
>      - shard-lnl:          [ABORT][191] ([Intel XE#1794]) -> [PASS][192]
>     [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8333/shard-lnl-2/igt@xe_pm@s4-basic-exec.html
>     [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-lnl-7/igt@xe_pm@s4-basic-exec.html
> 
>    
> #### Warnings ####
> 
>    * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
>      - shard-dg2-set2:     [INCOMPLETE][193] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345]) -> [INCOMPLETE][194] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
>     [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8333/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
>     [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
> 
>    * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
>      - shard-dg2-set2:     [INCOMPLETE][195] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [INCOMPLETE][196] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
>     [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8333/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
>     [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
> 
>    * igt@kms_content_protection@atomic:
>      - shard-bmg:          [FAIL][197] ([Intel XE#1178]) -> [SKIP][198] ([Intel XE#2341]) +1 other test skip
>     [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8333/shard-bmg-3/igt@kms_content_protection@atomic.html
>     [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-bmg-4/igt@kms_content_protection@atomic.html
> 
>    * igt@kms_content_protection@legacy:
>      - shard-bmg:          [SKIP][199] ([Intel XE#2341]) -> [FAIL][200] ([Intel XE#1178])
>     [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8333/shard-bmg-6/igt@kms_content_protection@legacy.html
>     [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-bmg-2/igt@kms_content_protection@legacy.html
> 
>    * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:
>      - shard-lnl:          [SKIP][201] ([Intel XE#1397] / [Intel XE#1745]) -> [ABORT][202] ([Intel XE#4528])
>     [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8333/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html
>     [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html
> 
>    * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode:
>      - shard-lnl:          [SKIP][203] ([Intel XE#1397]) -> [ABORT][204] ([Intel XE#4528])
>     [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8333/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode.html
>     [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode.html
> 
>    * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
>      - shard-bmg:          [SKIP][205] ([Intel XE#2311]) -> [SKIP][206] ([Intel XE#2312]) +21 other tests skip
>     [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8333/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
>     [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
> 
>    * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
>      - shard-bmg:          [SKIP][207] ([Intel XE#2312]) -> [SKIP][208] ([Intel XE#2311]) +9 other tests skip
>     [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8333/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
>     [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
>      - shard-bmg:          [SKIP][209] ([Intel XE#4141]) -> [SKIP][210] ([Intel XE#2312]) +6 other tests skip
>     [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8333/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
>     [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
>      - shard-bmg:          [SKIP][211] ([Intel XE#2312]) -> [SKIP][212] ([Intel XE#4141]) +4 other tests skip
>     [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8333/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
>     [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc:
>      - shard-bmg:          [SKIP][213] ([Intel XE#2312]) -> [SKIP][214] ([Intel XE#2313]) +4 other tests skip
>     [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8333/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html
>     [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html
> 
>    * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
>      - shard-bmg:          [SKIP][215] ([Intel XE#2313]) -> [SKIP][216] ([Intel XE#2312]) +19 other tests skip
>     [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8333/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
>     [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
> 
>    * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>      - shard-bmg:          [SKIP][217] ([Intel XE#2426]) -> [SKIP][218] ([Intel XE#2509])
>     [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8333/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>     [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>    
>    [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>    [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>    [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>    [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
>    [Intel XE#1131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131
>    [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
>    [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>    [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
>    [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
>    [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>    [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
>    [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>    [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>    [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
>    [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>    [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
>    [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>    [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>    [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>    [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
>    [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>    [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
>    [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>    [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>    [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>    [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>    [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>    [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
>    [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>    [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>    [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
>    [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
>    [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
>    [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>    [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
>    [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>    [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
>    [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>    [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>    [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
>    [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>    [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
>    [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
>    [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
>    [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
>    [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
>    [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>    [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
>    [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
>    [Intel XE#2550]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550
>    [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
>    [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>    [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
>    [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>    [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>    [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>    [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
>    [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
>    [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>    [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
>    [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
>    [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
>    [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>    [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
>    [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>    [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
>    [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
>    [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>    [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
>    [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
>    [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>    [Intel XE#3428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428
>    [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>    [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
>    [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>    [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>    [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>    [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
>    [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
>    [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
>    [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>    [Intel XE#3924]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3924
>    [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
>    [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>    [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
>    [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
>    [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
>    [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
>    [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
>    [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
>    [Intel XE#4418]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418
>    [Intel XE#4497]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4497
>    [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
>    [Intel XE#4528]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4528
>    [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>    [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
>    [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
>    [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
>    [Intel XE#4665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4665
>    [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>    [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
>    [Intel XE#4879]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4879
>    [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
>    [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
>    [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>    [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>    [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>    [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>    [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>    [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
>    [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>    [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>    [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>    [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>    [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
>    [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>    [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> 
> 
> Build changes
> -------------
> 
>    * IGT: IGT_8333 -> IGTPW_13032
>    * Linux: xe-2988-ccc6bbc95e31e177fd86bc3cc5b909575bcdf0e3 -> xe-2989-a8900c1b61e733563cb6dfa5173ff5cd8bb0e494
> 
>    IGTPW_13032: d76bf793e4c366bd44f0b974dd9e109ce2983621 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    IGT_8333: 1d01b63833a43f8354882205125d1ed76080109e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    xe-2988-ccc6bbc95e31e177fd86bc3cc5b909575bcdf0e3: ccc6bbc95e31e177fd86bc3cc5b909575bcdf0e3
>    xe-2989-a8900c1b61e733563cb6dfa5173ff5cd8bb0e494: a8900c1b61e733563cb6dfa5173ff5cd8bb0e494
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13032/index.html
> 

