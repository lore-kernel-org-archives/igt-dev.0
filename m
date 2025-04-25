Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E6BAC369D3
	for <igt-dev@archiver.kernel.org>; Fri, 25 Apr 2025 15:00:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9D4F10E31D;
	Fri, 25 Apr 2025 15:00:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MyfdEtyT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 898CB10E31D;
 Fri, 25 Apr 2025 15:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745593203; x=1777129203;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=r29pEb8I3Fpj1vAuAK/Yxd5hyTAEqG5QFVOjFHYTicA=;
 b=MyfdEtyTr/xPmNXYlPwFnwc+wReLqUgeUMWFseYEJ/2xgXobYfwIH8qg
 YBd0XzdWMG2x8jJi71udgABFekH2EO8ZMGxbsZ2pwRuKF6ON62LpYy/sA
 gevI7hcYLXUhogfrOBaIhGDuW0UC6Xi4ZSX6ln6VjlBx3ZJMWdOcnP807
 bL0zkCZdBH0mNN6vdbtcwiXeuETtKO/Nq26j5kr5WlR2jsVxAQpYqbBrA
 nl3dC+x5btPwWklKzad/ouCknLbceB6xmspMAv99zFSBEY9C5uAAQUYuY
 T3F2ZbSmMXH6KjY17EyrX/vF21D9kSD/Bqa0/JN7gvOS9wzpJs6KvCh93 g==;
X-CSE-ConnectionGUID: ju+E3GNsRj6viwMZvxiJsw==
X-CSE-MsgGUID: bxcFyhGuTimYH6l8wVyB/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="34873576"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="34873576"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 08:00:02 -0700
X-CSE-ConnectionGUID: pJ1qMqojS0qvjuv/zDwYhg==
X-CSE-MsgGUID: BLd88LcARz6sxHuENUWIWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="133429694"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.245.80.134])
 ([10.245.80.134])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 08:00:01 -0700
Message-ID: <09cd9fcd-7b15-4073-a3e7-5120cafda5d1@linux.intel.com>
Date: Fri, 25 Apr 2025 16:59:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciB4ZV9mYXVsdF9p?=
 =?UTF-8?Q?njection=3A_Improve_probe_fault_injection_handling_=28rev2=29?=
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250424095853.1396156-1-marcin.bernatowicz@linux.intel.com>
 <174559143065.11342.7288310059036586470@c664b1dc75d1>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <174559143065.11342.7288310059036586470@c664b1dc75d1>
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



On 4/25/2025 4:30 PM, Patchwork wrote:
> == Series Details ==
> 
> Series: xe_fault_injection: Improve probe fault injection handling (rev2)
> URL   : https://patchwork.freedesktop.org/series/147916/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8336_FULL -> XEIGTPW_13038_FULL
> ====================================================
> 
> Summary
> -------
> 
>    **FAILURE**
> 
>    Serious unknown changes coming with XEIGTPW_13038_FULL absolutely need to be
>    verified manually.
>    
>    If you think the reported changes have nothing to do with the changes
>    introduced in XEIGTPW_13038_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>    Here are the unknown changes that may have been introduced in XEIGTPW_13038_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>    * igt@fbdev@pan:
>      - shard-dg2-set2:     [PASS][1] -> [FAIL][2]
>     [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-dg2-464/igt@fbdev@pan.html
>     [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-dg2-435/igt@fbdev@pan.html

Not related to the change

> 
>    * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
>      - shard-bmg:          NOTRUN -> [ABORT][3]

Not related to the change, it's a different new subtest.
--
marcin>     [3]: 
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
> 
>    
> Known issues
> ------------
> 
>    Here are the changes found in XEIGTPW_13038_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>    * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-2-4-rc-ccs-cc:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][4] ([Intel XE#3767]) +15 other tests skip
>     [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-2-4-rc-ccs-cc.html
> 
>    * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
>      - shard-lnl:          NOTRUN -> [SKIP][5] ([Intel XE#1407])
>     [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-lnl-7/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
> 
>    * igt@kms_big_fb@linear-32bpp-rotate-90:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][6] ([Intel XE#316]) +2 other tests skip
>     [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-dg2-464/igt@kms_big_fb@linear-32bpp-rotate-90.html
> 
>    * igt@kms_big_fb@linear-64bpp-rotate-90:
>      - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2327]) +2 other tests skip
>     [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-1/igt@kms_big_fb@linear-64bpp-rotate-90.html
> 
>    * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][8] ([Intel XE#1124]) +10 other tests skip
>     [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-dg2-436/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
> 
>    * igt@kms_big_fb@y-tiled-addfb:
>      - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#1467])
>     [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-lnl-5/igt@kms_big_fb@y-tiled-addfb.html
> 
>    * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
>      - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#607])
>     [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-4/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
>      - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#607])
>     [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
> 
>    * igt@kms_big_fb@yf-tiled-addfb:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#619])
>     [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb.html
> 
>    * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>      - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#1124]) +7 other tests skip
>     [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>    * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>      - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#1124]) +5 other tests skip
>     [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>    * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#2191])
>     [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-dg2-464/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
> 
>    * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
>      - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#1512])
>     [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-lnl-7/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
> 
>    * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
>      - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#367]) +2 other tests skip
>     [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-2/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
> 
>    * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#367]) +1 other test skip
>     [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-dg2-463/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html
> 
>    * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
>      - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#367])
>     [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-lnl-3/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
> 
>    * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-dp-2:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#455] / [Intel XE#787]) +31 other tests skip
>     [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-dp-2.html
> 
>    * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:
>      - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#2887]) +4 other tests skip
>     [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-lnl-6/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html
> 
>    * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
>      - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2887]) +7 other tests skip
>     [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-4/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html
> 
>    * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#2907])
>     [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
> 
>    * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:
>      - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2652] / [Intel XE#787]) +12 other tests skip
>     [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html
> 
>    * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
>      - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#3432])
>     [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html
> 
>    * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
>      - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#3432]) +1 other test skip
>     [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html
> 
>    * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#787]) +167 other tests skip
>     [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html
> 
>    * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
>      - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#2669]) +3 other tests skip
>     [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-lnl-4/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
> 
>    * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
>      - shard-dg2-set2:     [PASS][29] -> [INCOMPLETE][30] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
>     [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html
>     [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html
> 
>    * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
>      - shard-dg2-set2:     [PASS][31] -> [INCOMPLETE][32] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345])
>     [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
>     [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
> 
>    * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:
>      - shard-dg2-set2:     [PASS][33] -> [INCOMPLETE][34] ([Intel XE#3124])
>     [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html
>     [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html
> 
>    * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:
>      - shard-dg2-set2:     [PASS][35] -> [DMESG-WARN][36] ([Intel XE#1727] / [Intel XE#3113])
>     [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html
>     [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html
> 
>    * igt@kms_cdclk@mode-transition-all-outputs:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#4418])
>     [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-dg2-466/igt@kms_cdclk@mode-transition-all-outputs.html
> 
>    * igt@kms_chamelium_color@ctm-0-75:
>      - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#306])
>     [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-lnl-5/igt@kms_chamelium_color@ctm-0-75.html
> 
>    * igt@kms_chamelium_color@ctm-negative:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#306])
>     [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-dg2-463/igt@kms_chamelium_color@ctm-negative.html
> 
>    * igt@kms_chamelium_hpd@common-hpd-after-suspend:
>      - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2252]) +7 other tests skip
>     [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-2/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
>      - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#373]) +7 other tests skip
>     [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-dg2-436/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
> 
>    * igt@kms_chamelium_hpd@vga-hpd:
>      - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#373]) +6 other tests skip
>     [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-lnl-5/igt@kms_chamelium_hpd@vga-hpd.html
> 
>    * igt@kms_content_protection@dp-mst-lic-type-1:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#307])
>     [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-1.html
> 
>    * igt@kms_content_protection@dp-mst-type-0:
>      - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2390])
>     [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-2/igt@kms_content_protection@dp-mst-type-0.html
> 
>    * igt@kms_content_protection@srm@pipe-a-dp-2:
>      - shard-bmg:          NOTRUN -> [FAIL][45] ([Intel XE#1178]) +1 other test fail
>     [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-2/igt@kms_content_protection@srm@pipe-a-dp-2.html
> 
>    * igt@kms_content_protection@srm@pipe-a-dp-4:
>      - shard-dg2-set2:     NOTRUN -> [FAIL][46] ([Intel XE#1178]) +2 other tests fail
>     [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-dg2-436/igt@kms_content_protection@srm@pipe-a-dp-4.html
> 
>    * igt@kms_content_protection@type1:
>      - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#3278])
>     [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-lnl-7/igt@kms_content_protection@type1.html
> 
>    * igt@kms_content_protection@uevent:
>      - shard-dg2-set2:     NOTRUN -> [FAIL][48] ([Intel XE#1188]) +1 other test fail
>     [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-dg2-466/igt@kms_content_protection@uevent.html
>      - shard-bmg:          NOTRUN -> [FAIL][49] ([Intel XE#1188]) +1 other test fail
>     [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-1/igt@kms_content_protection@uevent.html
> 
>    * igt@kms_cursor_crc@cursor-offscreen-128x42:
>      - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2320]) +2 other tests skip
>     [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-4/igt@kms_cursor_crc@cursor-offscreen-128x42.html
>      - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#1424]) +1 other test skip
>     [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-lnl-8/igt@kms_cursor_crc@cursor-offscreen-128x42.html
> 
>    * igt@kms_cursor_crc@cursor-offscreen-512x170:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#308])
>     [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x170.html
>      - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2321]) +1 other test skip
>     [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-512x170.html
> 
>    * igt@kms_cursor_crc@cursor-onscreen-512x512:
>      - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#2321])
>     [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-lnl-1/igt@kms_cursor_crc@cursor-onscreen-512x512.html
> 
>    * igt@kms_cursor_crc@cursor-random-max-size:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#455]) +6 other tests skip
>     [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-dg2-435/igt@kms_cursor_crc@cursor-random-max-size.html
> 
>    * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
>      - shard-bmg:          [PASS][56] -> [SKIP][57] ([Intel XE#2291]) +2 other tests skip
>     [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-3/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
>     [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
>      - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#309]) +2 other tests skip
>     [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-lnl-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
> 
>    * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>      - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#323])
>     [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-lnl-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
> 
>    * igt@kms_display_modes@extended-mode-basic:
>      - shard-bmg:          [PASS][60] -> [SKIP][61] ([Intel XE#4302])
>     [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-7/igt@kms_display_modes@extended-mode-basic.html
>     [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-4/igt@kms_display_modes@extended-mode-basic.html
> 
>    * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
>      - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#1340]) +1 other test skip
>     [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
> 
>    * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#4494])
>     [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html
> 
>    * igt@kms_dsc@dsc-with-output-formats:
>      - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#2244])
>     [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-8/igt@kms_dsc@dsc-with-output-formats.html
> 
>    * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#4422]) +1 other test skip
>     [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-dg2-436/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html
> 
>    * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
>      - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#4422])
>     [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-1/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
>      - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#4422])
>     [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-lnl-7/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
> 
>    * igt@kms_feature_discovery@dp-mst:
>      - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#2375])
>     [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-5/igt@kms_feature_discovery@dp-mst.html
> 
>    * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:
>      - shard-dg2-set2:     [PASS][69] -> [FAIL][70] ([Intel XE#301] / [Intel XE#3321])
>     [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html
>     [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html
> 
>    * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
>      - shard-bmg:          [PASS][71] -> [FAIL][72] ([Intel XE#3321]) +7 other tests fail
>     [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
>     [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
> 
>    * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
>      - shard-dg2-set2:     [PASS][73] -> [FAIL][74] ([Intel XE#301]) +6 other tests fail
>     [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
>     [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
> 
>    * igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:
>      - shard-bmg:          NOTRUN -> [FAIL][75] ([Intel XE#3321])
>     [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
> 
>    * igt@kms_flip@2x-nonexisting-fb-interruptible:
>      - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#1421]) +4 other tests skip
>     [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-lnl-6/igt@kms_flip@2x-nonexisting-fb-interruptible.html
> 
>    * igt@kms_flip@2x-plain-flip-fb-recreate:
>      - shard-bmg:          [PASS][77] -> [SKIP][78] ([Intel XE#2316]) +5 other tests skip
>     [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate.html
>     [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate.html
> 
>    * igt@kms_flip@bo-too-big-interruptible@a-edp1:
>      - shard-lnl:          NOTRUN -> [TIMEOUT][79] ([Intel XE#1504]) +1 other test timeout
>     [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-lnl-6/igt@kms_flip@bo-too-big-interruptible@a-edp1.html
> 
>    * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:
>      - shard-dg2-set2:     NOTRUN -> [FAIL][80] ([Intel XE#301] / [Intel XE#3321])
>     [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html
> 
>    * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp2:
>      - shard-dg2-set2:     NOTRUN -> [FAIL][81] ([Intel XE#301]) +3 other tests fail
>     [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp2.html
> 
>    * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
>      - shard-lnl:          [PASS][82] -> [FAIL][83] ([Intel XE#301]) +1 other test fail
>     [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
>     [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
> 
>    * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1:
>      - shard-lnl:          [PASS][84] -> [FAIL][85] ([Intel XE#886]) +3 other tests fail
>     [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-lnl-7/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html
>     [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-lnl-1/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html
> 
>    * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
>      - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#2293] / [Intel XE#2380]) +2 other tests skip
>     [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
> 
>    * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode:
>      - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#1401]) +1 other test skip
>     [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode.html
> 
>    * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
>      - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
>     [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
> 
>    * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
>      - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#1397] / [Intel XE#1745])
>     [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
> 
>    * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode:
>      - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#1397])
>     [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html
> 
>    * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
>      - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#2293]) +2 other tests skip
>     [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
> 
>    * igt@kms_force_connector_basic@force-connector-state:
>      - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#352])
>     [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-lnl-3/igt@kms_force_connector_basic@force-connector-state.html
> 
>    * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:
>      - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#2311]) +20 other tests skip
>     [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html
> 
>    * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
>      - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#2312]) +6 other tests skip
>     [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
>      - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#4141]) +6 other tests skip
>     [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
>      - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#656]) +19 other tests skip
>     [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-tiling-y:
>      - shard-lnl:          NOTRUN -> [SKIP][97] ([Intel XE#1469])
>     [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-lnl-5/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
> 
>    * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#651]) +25 other tests skip
>     [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
> 
>    * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt:
>      - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#651]) +9 other tests skip
>     [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][100] ([Intel XE#658])
>     [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
> 
>    * igt@kms_frontbuffer_tracking@plane-fbc-rte:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][101] ([Intel XE#1158])
>     [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-dg2-466/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
>      - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#2350])
>     [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-2/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
> 
>    * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#653]) +22 other tests skip
>     [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
> 
>    * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
>      - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#2313]) +18 other tests skip
>     [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
> 
>    * igt@kms_getfb@getfb-reject-ccs:
>      - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#2502])
>     [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-2/igt@kms_getfb@getfb-reject-ccs.html
>      - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#605])
>     [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-dg2-432/igt@kms_getfb@getfb-reject-ccs.html
> 
>    * igt@kms_joiner@basic-force-big-joiner:
>      - shard-bmg:          [PASS][107] -> [SKIP][108] ([Intel XE#3012])
>     [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-3/igt@kms_joiner@basic-force-big-joiner.html
>     [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-4/igt@kms_joiner@basic-force-big-joiner.html
> 
>    * igt@kms_joiner@basic-max-non-joiner:
>      - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#4298])
>     [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-6/igt@kms_joiner@basic-max-non-joiner.html
> 
>    * igt@kms_plane@pixel-format-source-clamping:
>      - shard-lnl:          NOTRUN -> [INCOMPLETE][110] ([Intel XE#4735])
>     [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-lnl-4/igt@kms_plane@pixel-format-source-clamping.html
> 
>    * igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0:
>      - shard-lnl:          NOTRUN -> [WARN][111] ([Intel XE#4801])
>     [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-lnl-4/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html
> 
>    * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
>      - shard-dg2-set2:     NOTRUN -> [FAIL][112] ([Intel XE#616]) +3 other tests fail
>     [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-dg2-466/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html
> 
>    * igt@kms_plane_lowres@tiling-none@pipe-b-edp-1:
>      - shard-lnl:          NOTRUN -> [SKIP][113] ([Intel XE#599]) +3 other tests skip
>     [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-lnl-5/igt@kms_plane_lowres@tiling-none@pipe-b-edp-1.html
> 
>    * igt@kms_plane_scaling@intel-max-src-size:
>      - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#2685] / [Intel XE#3307])
>     [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-1/igt@kms_plane_scaling@intel-max-src-size.html
> 
>    * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c:
>      - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#2763]) +4 other tests skip
>     [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-8/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c.html
> 
>    * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b:
>      - shard-lnl:          NOTRUN -> [SKIP][116] ([Intel XE#2763]) +7 other tests skip
>     [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-lnl-4/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b.html
> 
>    * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][117] ([Intel XE#2763] / [Intel XE#455]) +3 other tests skip
>     [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
> 
>    * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][118] ([Intel XE#2763]) +5 other tests skip
>     [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html
> 
>    * igt@kms_pm_backlight@bad-brightness:
>      - shard-bmg:          NOTRUN -> [SKIP][119] ([Intel XE#870])
>     [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-3/igt@kms_pm_backlight@bad-brightness.html
> 
>    * igt@kms_pm_dc@dc6-dpms:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][120] ([Intel XE#908])
>     [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-dg2-464/igt@kms_pm_dc@dc6-dpms.html
> 
>    * igt@kms_pm_dc@dc6-psr:
>      - shard-lnl:          [PASS][121] -> [FAIL][122] ([Intel XE#718]) +1 other test fail
>     [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-lnl-2/igt@kms_pm_dc@dc6-psr.html
>     [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-lnl-1/igt@kms_pm_dc@dc6-psr.html
> 
>    * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
>      - shard-bmg:          NOTRUN -> [SKIP][123] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
>     [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-4/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
> 
>    * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
>      - shard-bmg:          NOTRUN -> [SKIP][124] ([Intel XE#1489]) +4 other tests skip
>     [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html
> 
>    * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
>      - shard-lnl:          NOTRUN -> [SKIP][125] ([Intel XE#2893] / [Intel XE#4608]) +1 other test skip
>     [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html
> 
>    * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1:
>      - shard-lnl:          NOTRUN -> [SKIP][126] ([Intel XE#4608]) +3 other tests skip
>     [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1.html
> 
>    * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
>      - shard-lnl:          NOTRUN -> [SKIP][127] ([Intel XE#2893])
>     [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-lnl-1/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html
> 
>    * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][128] ([Intel XE#1489]) +5 other tests skip
>     [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-dg2-432/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
> 
>    * igt@kms_psr@fbc-pr-cursor-blt:
>      - shard-bmg:          NOTRUN -> [SKIP][129] ([Intel XE#2234] / [Intel XE#2850]) +13 other tests skip
>     [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-3/igt@kms_psr@fbc-pr-cursor-blt.html
> 
>    * igt@kms_psr@fbc-psr-sprite-render:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][130] ([Intel XE#2850] / [Intel XE#929]) +15 other tests skip
>     [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-render.html
> 
>    * igt@kms_psr@fbc-psr2-cursor-blt@edp-1:
>      - shard-lnl:          NOTRUN -> [SKIP][131] ([Intel XE#4609]) +2 other tests skip
>     [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-lnl-1/igt@kms_psr@fbc-psr2-cursor-blt@edp-1.html
> 
>    * igt@kms_psr@pr-primary-blt:
>      - shard-lnl:          NOTRUN -> [SKIP][132] ([Intel XE#1406]) +5 other tests skip
>     [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-lnl-5/igt@kms_psr@pr-primary-blt.html
> 
>    * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][133] ([Intel XE#2939])
>     [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-dg2-436/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> 
>    * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>      - shard-bmg:          NOTRUN -> [SKIP][134] ([Intel XE#2414])
>     [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-8/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
> 
>    * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
>      - shard-bmg:          NOTRUN -> [SKIP][135] ([Intel XE#2330]) +1 other test skip
>     [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
>      - shard-dg2-set2:     NOTRUN -> [SKIP][136] ([Intel XE#1127]) +1 other test skip
>     [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
>      - shard-lnl:          NOTRUN -> [SKIP][137] ([Intel XE#1127])
>     [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-lnl-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
> 
>    * igt@kms_rotation_crc@sprite-rotation-90:
>      - shard-lnl:          NOTRUN -> [SKIP][138] ([Intel XE#3414] / [Intel XE#3904])
>     [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-lnl-3/igt@kms_rotation_crc@sprite-rotation-90.html
> 
>    * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
>      - shard-bmg:          NOTRUN -> [SKIP][139] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
>     [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-5/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
> 
>    * igt@kms_setmode@invalid-clone-single-crtc:
>      - shard-lnl:          NOTRUN -> [SKIP][140] ([Intel XE#1435])
>     [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-lnl-3/igt@kms_setmode@invalid-clone-single-crtc.html
> 
>    * igt@kms_tiled_display@basic-test-pattern:
>      - shard-dg2-set2:     NOTRUN -> [FAIL][141] ([Intel XE#1729])
>     [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern.html
> 
>    * igt@kms_vrr@cmrr:
>      - shard-bmg:          NOTRUN -> [SKIP][142] ([Intel XE#2168])
>     [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-1/igt@kms_vrr@cmrr.html
>      - shard-dg2-set2:     NOTRUN -> [SKIP][143] ([Intel XE#2168])
>     [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-dg2-435/igt@kms_vrr@cmrr.html
> 
>    * igt@kms_vrr@lobf:
>      - shard-lnl:          NOTRUN -> [SKIP][144] ([Intel XE#1499])
>     [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-lnl-1/igt@kms_vrr@lobf.html
> 
>    * igt@kms_writeback@writeback-check-output-xrgb2101010:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][145] ([Intel XE#756])
>     [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-dg2-435/igt@kms_writeback@writeback-check-output-xrgb2101010.html
> 
>    * igt@xe_compute_preempt@compute-preempt:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][146] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
>     [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-dg2-432/igt@xe_compute_preempt@compute-preempt.html
> 
>    * igt@xe_eudebug@basic-close:
>      - shard-lnl:          NOTRUN -> [SKIP][147] ([Intel XE#4837]) +7 other tests skip
>     [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-lnl-7/igt@xe_eudebug@basic-close.html
> 
>    * igt@xe_eudebug@basic-read-event:
>      - shard-bmg:          NOTRUN -> [SKIP][148] ([Intel XE#4837]) +7 other tests skip
>     [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-3/igt@xe_eudebug@basic-read-event.html
> 
>    * igt@xe_eudebug_online@debugger-reopen:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][149] ([Intel XE#4837]) +8 other tests skip
>     [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-dg2-432/igt@xe_eudebug_online@debugger-reopen.html
> 
>    * igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd:
>      - shard-lnl:          NOTRUN -> [SKIP][150] ([Intel XE#688]) +1 other test skip
>     [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-lnl-6/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd.html
> 
>    * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
>      - shard-dg2-set2:     [PASS][151] -> [SKIP][152] ([Intel XE#1392]) +4 other tests skip
>     [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-dg2-434/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
>     [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
> 
>    * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][153] ([Intel XE#1392])
>     [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html
> 
>    * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:
>      - shard-bmg:          NOTRUN -> [SKIP][154] ([Intel XE#2322]) +4 other tests skip
>     [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html
> 
>    * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
>      - shard-lnl:          NOTRUN -> [SKIP][155] ([Intel XE#1392]) +6 other tests skip
>     [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-lnl-3/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
> 
>    * igt@xe_exec_fault_mode@twice-userptr-prefetch:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][156] ([Intel XE#288]) +24 other tests skip
>     [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-prefetch.html
> 
>    * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][157] ([Intel XE#2360])
>     [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
> 
>    * igt@xe_huc_copy@huc_copy:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][158] ([Intel XE#255])
>     [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-dg2-464/igt@xe_huc_copy@huc_copy.html
> 
>    * igt@xe_live_ktest@xe_eudebug:
>      - shard-bmg:          NOTRUN -> [SKIP][159] ([Intel XE#2833])
>     [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-4/igt@xe_live_ktest@xe_eudebug.html
> 
>    * igt@xe_oa@non-privileged-access-vaddr:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][160] ([Intel XE#2541] / [Intel XE#3573]) +3 other tests skip
>     [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-dg2-463/igt@xe_oa@non-privileged-access-vaddr.html
> 
>    * igt@xe_oa@syncs-syncobj-wait-cfg:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][161] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501]) +1 other test skip
>     [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-dg2-432/igt@xe_oa@syncs-syncobj-wait-cfg.html
> 
>    * igt@xe_pat@pat-index-xehpc:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][162] ([Intel XE#2838] / [Intel XE#979])
>     [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-dg2-466/igt@xe_pat@pat-index-xehpc.html
> 
>    * igt@xe_pat@pat-index-xelpg:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][163] ([Intel XE#979])
>     [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-dg2-464/igt@xe_pat@pat-index-xelpg.html
> 
>    * igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
>      - shard-dg2-set2:     NOTRUN -> [FAIL][164] ([Intel XE#1173]) +1 other test fail
>     [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-dg2-466/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html
> 
>    * igt@xe_pm@s4-d3cold-basic-exec:
>      - shard-lnl:          NOTRUN -> [SKIP][165] ([Intel XE#2284] / [Intel XE#366])
>     [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-lnl-4/igt@xe_pm@s4-d3cold-basic-exec.html
>      - shard-bmg:          NOTRUN -> [SKIP][166] ([Intel XE#2284])
>     [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-2/igt@xe_pm@s4-d3cold-basic-exec.html
> 
>    * igt@xe_pmu@fn-engine-activity-sched-if-idle:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][167] ([Intel XE#4650])
>     [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-dg2-432/igt@xe_pmu@fn-engine-activity-sched-if-idle.html
> 
>    * igt@xe_query@multigpu-query-cs-cycles:
>      - shard-bmg:          NOTRUN -> [SKIP][168] ([Intel XE#944]) +2 other tests skip
>     [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-2/igt@xe_query@multigpu-query-cs-cycles.html
> 
>    * igt@xe_query@multigpu-query-invalid-extension:
>      - shard-lnl:          NOTRUN -> [SKIP][169] ([Intel XE#944]) +1 other test skip
>     [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-lnl-3/igt@xe_query@multigpu-query-invalid-extension.html
> 
>    * igt@xe_query@multigpu-query-topology:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][170] ([Intel XE#944])
>     [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-dg2-466/igt@xe_query@multigpu-query-topology.html
> 
>    * igt@xe_render_copy@render-stress-4-copies:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][171] ([Intel XE#4814]) +1 other test skip
>     [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-dg2-466/igt@xe_render_copy@render-stress-4-copies.html
> 
>    * igt@xe_sriov_auto_provisioning@selfconfig-basic:
>      - shard-lnl:          NOTRUN -> [SKIP][172] ([Intel XE#4130])
>     [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-lnl-6/igt@xe_sriov_auto_provisioning@selfconfig-basic.html
> 
>    * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][173] ([Intel XE#4130])
>     [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-dg2-466/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html
> 
>    * igt@xe_sriov_flr@flr-vf1-clear:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][174] ([Intel XE#3342]) +1 other test skip
>     [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-dg2-463/igt@xe_sriov_flr@flr-vf1-clear.html
> 
>    
> #### Possible fixes ####
> 
>    * igt@kms_atomic_transition@modeset-transition:
>      - shard-bmg:          [DMESG-FAIL][175] ([Intel XE#3428]) -> [PASS][176]
>     [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-6/igt@kms_atomic_transition@modeset-transition.html
>     [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-8/igt@kms_atomic_transition@modeset-transition.html
> 
>    * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
>      - shard-dg2-set2:     [INCOMPLETE][177] ([Intel XE#2705] / [Intel XE#4212]) -> [PASS][178]
>     [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
>     [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
> 
>    * igt@kms_cursor_crc@cursor-onscreen-64x64:
>      - shard-bmg:          [SKIP][179] ([Intel XE#2320]) -> [PASS][180]
>     [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-64x64.html
>     [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-64x64.html
> 
>    * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
>      - shard-bmg:          [SKIP][181] ([Intel XE#2291]) -> [PASS][182] +4 other tests pass
>     [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
>     [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
> 
>    * igt@kms_dp_link_training@non-uhbr-sst:
>      - shard-bmg:          [SKIP][183] ([Intel XE#4354]) -> [PASS][184]
>     [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-4/igt@kms_dp_link_training@non-uhbr-sst.html
>     [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-2/igt@kms_dp_link_training@non-uhbr-sst.html
> 
>    * igt@kms_dp_linktrain_fallback@dp-fallback:
>      - shard-bmg:          [SKIP][185] ([Intel XE#4294]) -> [PASS][186]
>     [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-5/igt@kms_dp_linktrain_fallback@dp-fallback.html
>     [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-1/igt@kms_dp_linktrain_fallback@dp-fallback.html
> 
>    * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
>      - shard-dg2-set2:     [FAIL][187] ([Intel XE#2882] / [Intel XE#3098]) -> [PASS][188]
>     [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-dg2-432/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
>     [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-dg2-432/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
> 
>    * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-hdmi-a2-dp2:
>      - shard-dg2-set2:     [FAIL][189] ([Intel XE#3098]) -> [PASS][190]
>     [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-dg2-432/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-hdmi-a2-dp2.html
>     [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-dg2-432/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-hdmi-a2-dp2.html
> 
>    * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ac-hdmi-a2-dp2:
>      - shard-dg2-set2:     [FAIL][191] ([Intel XE#2882]) -> [PASS][192]
>     [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-dg2-432/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ac-hdmi-a2-dp2.html
>     [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-dg2-432/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ac-hdmi-a2-dp2.html
> 
>    * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ad-hdmi-a2-dp2:
>      - shard-dg2-set2:     [FAIL][193] -> [PASS][194]
>     [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-dg2-432/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ad-hdmi-a2-dp2.html
>     [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-dg2-432/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ad-hdmi-a2-dp2.html
> 
>    * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
>      - shard-dg2-set2:     [FAIL][195] ([Intel XE#886]) -> [PASS][196] +1 other test pass
>     [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-dg2-432/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
>     [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-dg2-435/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
> 
>    * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3:
>      - shard-bmg:          [FAIL][197] ([Intel XE#3321]) -> [PASS][198]
>     [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html
>     [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html
> 
>    * igt@kms_flip@2x-nonexisting-fb:
>      - shard-bmg:          [DMESG-WARN][199] ([Intel XE#3428]) -> [PASS][200] +13 other tests pass
>     [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html
>     [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-8/igt@kms_flip@2x-nonexisting-fb.html
> 
>    * igt@kms_flip@2x-plain-flip-interruptible:
>      - shard-bmg:          [SKIP][201] ([Intel XE#2316]) -> [PASS][202] +7 other tests pass
>     [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-4/igt@kms_flip@2x-plain-flip-interruptible.html
>     [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-2/igt@kms_flip@2x-plain-flip-interruptible.html
> 
>    * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
>      - shard-lnl:          [FAIL][203] ([Intel XE#301]) -> [PASS][204]
>     [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
>     [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
> 
>    * igt@kms_flip@flip-vs-expired-vblank@d-dp4:
>      - shard-dg2-set2:     [FAIL][205] ([Intel XE#301] / [Intel XE#3321]) -> [PASS][206]
>     [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@d-dp4.html
>     [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@d-dp4.html
> 
>    * igt@kms_hdr@invalid-hdr:
>      - shard-dg2-set2:     [SKIP][207] ([Intel XE#455]) -> [PASS][208]
>     [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-dg2-432/igt@kms_hdr@invalid-hdr.html
>     [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
>      - shard-bmg:          [SKIP][209] ([Intel XE#1503]) -> [PASS][210]
>     [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-5/igt@kms_hdr@invalid-hdr.html
>     [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-8/igt@kms_hdr@invalid-hdr.html
> 
>    * igt@kms_plane_scaling@2x-scaler-multi-pipe:
>      - shard-bmg:          [SKIP][211] ([Intel XE#2571]) -> [PASS][212]
>     [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-5/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
>     [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-3/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
> 
>    * igt@kms_setmode@invalid-clone-single-crtc:
>      - shard-bmg:          [SKIP][213] ([Intel XE#1435]) -> [PASS][214]
>     [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-5/igt@kms_setmode@invalid-clone-single-crtc.html
>     [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html
> 
>    * igt@kms_vblank@accuracy-idle@pipe-d-dp-2:
>      - shard-bmg:          [FAIL][215] -> [PASS][216] +3 other tests pass
>     [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-6/igt@kms_vblank@accuracy-idle@pipe-d-dp-2.html
>     [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-2/igt@kms_vblank@accuracy-idle@pipe-d-dp-2.html
> 
>    * igt@kms_vrr@negative-basic:
>      - shard-bmg:          [SKIP][217] ([Intel XE#1499]) -> [PASS][218]
>     [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-4/igt@kms_vrr@negative-basic.html
>     [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-7/igt@kms_vrr@negative-basic.html
> 
>    * igt@xe_evict@evict-large-external-cm:
>      - shard-bmg:          [DMESG-WARN][219] ([Intel XE#1473] / [Intel XE#3428]) -> [PASS][220] +1 other test pass
>     [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-6/igt@xe_evict@evict-large-external-cm.html
>     [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-3/igt@xe_evict@evict-large-external-cm.html
> 
>    * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:
>      - shard-dg2-set2:     [SKIP][221] ([Intel XE#1392]) -> [PASS][222] +6 other tests pass
>     [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html
>     [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-dg2-435/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html
> 
>    * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
>      - shard-dg2-set2:     [FAIL][223] ([Intel XE#1999]) -> [PASS][224] +2 other tests pass
>     [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-dg2-463/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
>     [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-dg2-432/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
> 
>    * igt@xe_pm@s4-exec-after:
>      - shard-lnl:          [ABORT][225] ([Intel XE#1794]) -> [PASS][226]
>     [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-lnl-2/igt@xe_pm@s4-exec-after.html
>     [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-lnl-1/igt@xe_pm@s4-exec-after.html
> 
>    * igt@xe_pmu@gt-frequency:
>      - shard-lnl:          [FAIL][227] ([Intel XE#4817]) -> [PASS][228] +1 other test pass
>     [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-lnl-4/igt@xe_pmu@gt-frequency.html
>     [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-lnl-8/igt@xe_pmu@gt-frequency.html
> 
>    
> #### Warnings ####
> 
>    * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
>      - shard-dg2-set2:     [INCOMPLETE][229] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345]) -> [INCOMPLETE][230] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
>     [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
>     [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
> 
>    * igt@kms_content_protection@lic-type-0:
>      - shard-bmg:          [FAIL][231] ([Intel XE#1178]) -> [SKIP][232] ([Intel XE#2341])
>     [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-1/igt@kms_content_protection@lic-type-0.html
>     [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-4/igt@kms_content_protection@lic-type-0.html
> 
>    * igt@kms_content_protection@srm:
>      - shard-bmg:          [SKIP][233] ([Intel XE#2341]) -> [FAIL][234] ([Intel XE#1178]) +1 other test fail
>     [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-5/igt@kms_content_protection@srm.html
>     [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-2/igt@kms_content_protection@srm.html
> 
>    * igt@kms_dp_aux_dev:
>      - shard-bmg:          [DMESG-WARN][235] ([Intel XE#3428]) -> [SKIP][236] ([Intel XE#3009])
>     [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-6/igt@kms_dp_aux_dev.html
>     [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-4/igt@kms_dp_aux_dev.html
> 
>    * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:
>      - shard-bmg:          [SKIP][237] ([Intel XE#2311]) -> [SKIP][238] ([Intel XE#2312]) +12 other tests skip
>     [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html
>     [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html
> 
>    * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
>      - shard-bmg:          [SKIP][239] ([Intel XE#2312]) -> [SKIP][240] ([Intel XE#2311]) +17 other tests skip
>     [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
>     [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
>      - shard-bmg:          [SKIP][241] ([Intel XE#2312]) -> [SKIP][242] ([Intel XE#4141]) +2 other tests skip
>     [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html
>     [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
>      - shard-bmg:          [SKIP][243] ([Intel XE#4141]) -> [SKIP][244] ([Intel XE#2312]) +9 other tests skip
>     [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
>     [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt:
>      - shard-bmg:          [SKIP][245] ([Intel XE#2313]) -> [SKIP][246] ([Intel XE#2312]) +12 other tests skip
>     [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html
>     [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
>      - shard-bmg:          [SKIP][247] ([Intel XE#2312]) -> [SKIP][248] ([Intel XE#2313]) +20 other tests skip
>     [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
>     [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
> 
>    * igt@kms_plane_multiple@2x-tiling-none:
>      - shard-bmg:          [DMESG-WARN][249] ([Intel XE#3428]) -> [SKIP][250] ([Intel XE#4596])
>     [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-none.html
>     [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-none.html
> 
>    * igt@kms_plane_multiple@2x-tiling-yf:
>      - shard-bmg:          [SKIP][251] ([Intel XE#2493]) -> [SKIP][252] ([Intel XE#4596])
>     [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-yf.html
>     [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-yf.html
> 
>    * igt@kms_plane_scaling@intel-max-src-size:
>      - shard-dg2-set2:     [ABORT][253] ([Intel XE#4760]) -> [SKIP][254] ([Intel XE#455])
>     [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size.html
>     [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size.html
> 
>    * igt@xe_module_load@load:
>      - shard-bmg:          ([PASS][255], [PASS][256], [PASS][257], [PASS][258], [PASS][259], [PASS][260], [PASS][261], [SKIP][262], [PASS][263], [PASS][264], [DMESG-WARN][265], [PASS][266], [DMESG-WARN][267], [PASS][268], [PASS][269], [PASS][270], [PASS][271], [PASS][272], [PASS][273], [PASS][274], [PASS][275], [PASS][276], [PASS][277], [PASS][278], [PASS][279], [PASS][280]) ([Intel XE#2457] / [Intel XE#3428]) -> ([PASS][281], [PASS][282], [PASS][283], [PASS][284], [PASS][285], [PASS][286], [PASS][287], [SKIP][288], [PASS][289], [PASS][290], [PASS][291], [PASS][292], [PASS][293], [PASS][294], [PASS][295], [PASS][296], [PASS][297], [PASS][298], [PASS][299], [PASS][300], [PASS][301], [PASS][302], [PASS][303], [PASS][304], [PASS][305], [PASS][306]) ([Intel XE#2457])
>     [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-3/igt@xe_module_load@load.html
>     [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-6/igt@xe_module_load@load.html
>     [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-4/igt@xe_module_load@load.html
>     [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-5/igt@xe_module_load@load.html
>     [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-1/igt@xe_module_load@load.html
>     [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-1/igt@xe_module_load@load.html
>     [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-1/igt@xe_module_load@load.html
>     [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-3/igt@xe_module_load@load.html
>     [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-2/igt@xe_module_load@load.html
>     [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-5/igt@xe_module_load@load.html
>     [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-6/igt@xe_module_load@load.html
>     [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-6/igt@xe_module_load@load.html
>     [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-6/igt@xe_module_load@load.html
>     [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-2/igt@xe_module_load@load.html
>     [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-8/igt@xe_module_load@load.html
>     [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-2/igt@xe_module_load@load.html
>     [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-7/igt@xe_module_load@load.html
>     [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-7/igt@xe_module_load@load.html
>     [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-8/igt@xe_module_load@load.html
>     [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-4/igt@xe_module_load@load.html
>     [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-4/igt@xe_module_load@load.html
>     [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-5/igt@xe_module_load@load.html
>     [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-8/igt@xe_module_load@load.html
>     [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-3/igt@xe_module_load@load.html
>     [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-7/igt@xe_module_load@load.html
>     [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-3/igt@xe_module_load@load.html
>     [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-4/igt@xe_module_load@load.html
>     [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-6/igt@xe_module_load@load.html
>     [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-8/igt@xe_module_load@load.html
>     [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-8/igt@xe_module_load@load.html
>     [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-3/igt@xe_module_load@load.html
>     [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-3/igt@xe_module_load@load.html
>     [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-2/igt@xe_module_load@load.html
>     [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-8/igt@xe_module_load@load.html
>     [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-4/igt@xe_module_load@load.html
>     [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-4/igt@xe_module_load@load.html
>     [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-1/igt@xe_module_load@load.html
>     [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-1/igt@xe_module_load@load.html
>     [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-1/igt@xe_module_load@load.html
>     [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-5/igt@xe_module_load@load.html
>     [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-3/igt@xe_module_load@load.html
>     [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-5/igt@xe_module_load@load.html
>     [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-2/igt@xe_module_load@load.html
>     [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-2/igt@xe_module_load@load.html
>     [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-7/igt@xe_module_load@load.html
>     [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-7/igt@xe_module_load@load.html
>     [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-4/igt@xe_module_load@load.html
>     [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-7/igt@xe_module_load@load.html
>     [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-2/igt@xe_module_load@load.html
>     [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-5/igt@xe_module_load@load.html
>     [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-8/igt@xe_module_load@load.html
>     [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/shard-bmg-6/igt@xe_module_load@load.html
> 
>    
>    [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>    [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>    [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
>    [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
>    [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>    [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
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
>    [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>    [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
>    [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
>    [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>    [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>    [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>    [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>    [Intel XE#1504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504
>    [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
>    [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>    [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
>    [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>    [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>    [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
>    [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
>    [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>    [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>    [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
>    [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>    [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>    [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
>    [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
>    [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>    [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
>    [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>    [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
>    [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>    [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>    [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>    [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>    [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
>    [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
>    [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
>    [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
>    [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
>    [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
>    [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
>    [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
>    [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
>    [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
>    [Intel XE#2502]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2502
>    [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
>    [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
>    [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
>    [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>    [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
>    [Intel XE#2685]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2685
>    [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
>    [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>    [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
>    [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
>    [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>    [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>    [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
>    [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>    [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
>    [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
>    [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
>    [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
>    [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>    [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
>    [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>    [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>    [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>    [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>    [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
>    [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
>    [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
>    [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
>    [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>    [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>    [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
>    [Intel XE#3307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307
>    [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
>    [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
>    [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>    [Intel XE#3428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428
>    [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>    [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
>    [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
>    [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>    [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>    [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>    [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
>    [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>    [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
>    [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>    [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
>    [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
>    [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
>    [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
>    [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
>    [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
>    [Intel XE#4418]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418
>    [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
>    [Intel XE#4494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494
>    [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
>    [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
>    [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>    [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
>    [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
>    [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
>    [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
>    [Intel XE#4735]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4735
>    [Intel XE#4760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760
>    [Intel XE#4801]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4801
>    [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
>    [Intel XE#4817]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4817
>    [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
>    [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>    [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
>    [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
>    [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>    [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
>    [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>    [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>    [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>    [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
>    [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>    [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
>    [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>    [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>    [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
>    [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>    [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>    [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
>    [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>    [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>    [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
> 
> 
> Build changes
> -------------
> 
>    * IGT: IGT_8336 -> IGTPW_13038
> 
>    IGTPW_13038: 13038
>    IGT_8336: 8336
>    xe-2994-6176f71822602f52bc4327965090275c5570ed0d: 6176f71822602f52bc4327965090275c5570ed0d
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13038/index.html
> 

