Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72FA7CAC589
	for <igt-dev@archiver.kernel.org>; Tue,  9 Sep 2025 08:47:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2210310E23A;
	Tue,  9 Sep 2025 08:47:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eCpmVnf3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7463D10E23A
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Sep 2025 08:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757407667; x=1788943667;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=gN/Vvl4330j2FFCM0LQUOLHRYGdWFVVl2dOJAcRby38=;
 b=eCpmVnf3mkxQDskaP/bofMhe5CrTc90pWt+EL9hNDtuMW1gE+rnzyJtq
 d0AsHIEd0g92LrW+rpvS/6a8c44WtNjPGqAHt187jIIV1hwg+xBOppPvn
 7JIruMNgObSS+4YFb85oTOYuZIWjuQrDnoljk5H+gZBWn3dB/WqUy/U1w
 rwJs0CtD5wn0Bz8tAaOYjJhHIXlMeWU2VzCPQG1yIV1Kb6v4z7Dn004Yp
 Vv5HAWsiCaCuOWSI2nKn/aQkH5Eg8CCXIpowG/6zd/bxmAg1mhZC1jFNI
 xqd0riNSO/82iJp4+SRMJ6/s3S/ZZ94OLTPQBCv4i9WekJJly1erg80+e Q==;
X-CSE-ConnectionGUID: 07l3LOcFSpGcPREIvzAWjA==
X-CSE-MsgGUID: ypN4YZEpQIqj5NE9bR+PxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59634399"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59634399"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 01:47:47 -0700
X-CSE-ConnectionGUID: rkpHCDOlR2mPc8WwWSR+sQ==
X-CSE-MsgGUID: Ut0AyaXnSGmU9peQeBaa5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; d="scan'208";a="177324435"
Received: from unknown (HELO [172.28.180.113]) ([172.28.180.113])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 01:47:46 -0700
Message-ID: <cbcca40a-63c3-4b0b-b753-8431f63c605a@linux.intel.com>
Date: Tue, 9 Sep 2025 10:47:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_tests/intel?=
 =?UTF-8?Q?/xe=5Fpm=3A_Don=E2=80=99t_fail_when_runtime_PM_is_disabled?=
To: igt-dev@lists.freedesktop.org, lgci.bug.filing@intel.com
References: <20250904091009.1584332-1-marcin.bernatowicz@linux.intel.com>
 <175704536586.305944.2681718649927204639@1538d3639d33>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <175704536586.305944.2681718649927204639@1538d3639d33>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



On 9/5/2025 6:09 AM, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/xe_pm: Don’t fail when runtime PM is disabled
> URL   : https://patchwork.freedesktop.org/series/154016/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8524_FULL -> XEIGTPW_13695_FULL
> ====================================================
> 
> Summary
> -------
> 
>    **FAILURE**
> 
>    Serious unknown changes coming with XEIGTPW_13695_FULL absolutely need to be
>    verified manually.
>    
>    If you think the reported changes have nothing to do with the changes
>    introduced in XEIGTPW_13695_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>    Here are the unknown changes that may have been introduced in XEIGTPW_13695_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>    * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-hdmi-a6-dp4:
>      - shard-dg2-set2:     [PASS][1] -> [FAIL][2] +1 other test fail
>     [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-dg2-434/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-hdmi-a6-dp4.html
>     [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-dg2-466/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-hdmi-a6-dp4.html
> 

Not related to the change.
--
marcin>
> Known issues
> ------------
> 
>    Here are the changes found in XEIGTPW_13695_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>    * igt@kms_async_flips@test-cursor:
>      - shard-lnl:          NOTRUN -> [SKIP][3] ([Intel XE#664])
>     [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-lnl-8/igt@kms_async_flips@test-cursor.html
> 
>    * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][4] ([Intel XE#316]) +3 other tests skip
>     [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-dg2-464/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html
> 
>    * igt@kms_big_fb@linear-64bpp-rotate-90:
>      - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2327]) +1 other test skip
>     [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-bmg-6/igt@kms_big_fb@linear-64bpp-rotate-90.html
> 
>    * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
>      - shard-lnl:          NOTRUN -> [SKIP][6] ([Intel XE#1407]) +2 other tests skip
>     [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-lnl-1/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
> 
>    * igt@kms_big_fb@y-tiled-addfb-size-overflow:
>      - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#610])
>     [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-bmg-2/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
> 
>    * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
>      - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#1124]) +7 other tests skip
>     [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-bmg-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
> 
>    * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
>      - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#1124]) +3 other tests skip
>     [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-lnl-4/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html
> 
>    * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
>      - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#607])
>     [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-bmg-4/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
>      - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#607])
>     [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
> 
>    * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#610])
>     [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
> 
>    * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#1124]) +9 other tests skip
>     [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
> 
>    * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#367]) +1 other test skip
>     [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-dg2-436/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
> 
>    * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
>      - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#367])
>     [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-bmg-6/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
> 
>    * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs:
>      - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2887]) +5 other tests skip
>     [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-bmg-6/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs.html
>      - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#2887]) +3 other tests skip
>     [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-lnl-5/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs.html
> 
>    * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2:
>      - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
>     [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-bmg-3/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2.html
> 
>    * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#3442])
>     [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
> 
>    * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
>      - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#3432])
>     [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html
> 
>    * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1:
>      - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#2669]) +3 other tests skip
>     [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-lnl-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1.html
> 
>    * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#787]) +139 other tests skip
>     [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html
> 
>    * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:
>      - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][23] ([Intel XE#2705] / [Intel XE#4212] / [Intel XE#4345])
>     [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html
> 
>    * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:
>      - shard-dg2-set2:     [PASS][24] -> [INCOMPLETE][25] ([Intel XE#2705] / [Intel XE#4212])
>     [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html
>     [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html
> 
>    * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
>      - shard-dg2-set2:     [PASS][26] -> [INCOMPLETE][27] ([Intel XE#3124])
>     [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html
>     [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html
> 
>    * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:
>      - shard-dg2-set2:     [PASS][28] -> [DMESG-WARN][29] ([Intel XE#1727] / [Intel XE#3113])
>     [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html
>     [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html
> 
>    * igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#455] / [Intel XE#787]) +26 other tests skip
>     [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2.html
> 
>    * igt@kms_cdclk@plane-scaling:
>      - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#4416]) +3 other tests skip
>     [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-lnl-4/igt@kms_cdclk@plane-scaling.html
> 
>    * igt@kms_chamelium_color@ctm-max:
>      - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#306])
>     [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-lnl-8/igt@kms_chamelium_color@ctm-max.html
>      - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2325])
>     [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-bmg-1/igt@kms_chamelium_color@ctm-max.html
>      - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#306])
>     [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-dg2-432/igt@kms_chamelium_color@ctm-max.html
> 
>    * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
>      - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#2252]) +3 other tests skip
>     [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-bmg-5/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
> 
>    * igt@kms_chamelium_edid@hdmi-mode-timings:
>      - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#373]) +2 other tests skip
>     [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-lnl-3/igt@kms_chamelium_edid@hdmi-mode-timings.html
> 
>    * igt@kms_chamelium_hpd@vga-hpd:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#373]) +5 other tests skip
>     [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-dg2-466/igt@kms_chamelium_hpd@vga-hpd.html
> 
>    * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
>      - shard-bmg:          NOTRUN -> [FAIL][38] ([Intel XE#1178]) +1 other test fail
>     [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-bmg-5/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html
> 
>    * igt@kms_content_protection@dp-mst-type-0:
>      - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#307])
>     [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-lnl-8/igt@kms_content_protection@dp-mst-type-0.html
> 
>    * igt@kms_content_protection@srm:
>      - shard-dg2-set2:     NOTRUN -> [FAIL][40] ([Intel XE#1178]) +1 other test fail
>     [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-dg2-432/igt@kms_content_protection@srm.html
> 
>    * igt@kms_cursor_crc@cursor-offscreen-512x512:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#308])
>     [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-dg2-436/igt@kms_cursor_crc@cursor-offscreen-512x512.html
>      - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#2321])
>     [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-lnl-1/igt@kms_cursor_crc@cursor-offscreen-512x512.html
> 
>    * igt@kms_cursor_crc@cursor-onscreen-128x42:
>      - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2320]) +1 other test skip
>     [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-128x42.html
> 
>    * igt@kms_cursor_crc@cursor-random-512x512:
>      - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2321]) +2 other tests skip
>     [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-bmg-2/igt@kms_cursor_crc@cursor-random-512x512.html
> 
>    * igt@kms_cursor_crc@cursor-sliding-32x32:
>      - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#1424]) +1 other test skip
>     [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-lnl-1/igt@kms_cursor_crc@cursor-sliding-32x32.html
> 
>    * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
>      - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2291])
>     [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-bmg-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
>      - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#309]) +2 other tests skip
>     [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-lnl-4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
> 
>    * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
>      - shard-bmg:          [PASS][48] -> [SKIP][49] ([Intel XE#2291]) +1 other test skip
>     [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-bmg-3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
>     [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-bmg-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
> 
>    * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#323])
>     [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-dg2-463/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
> 
>    * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
>      - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#1508])
>     [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-bmg-7/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
> 
>    * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#4494])
>     [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html
> 
>    * igt@kms_dp_link_training@non-uhbr-mst:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#4354])
>     [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-dg2-463/igt@kms_dp_link_training@non-uhbr-mst.html
> 
>    * igt@kms_dsc@dsc-with-bpc-formats:
>      - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2244])
>     [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-bmg-8/igt@kms_dsc@dsc-with-bpc-formats.html
> 
>    * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#4422])
>     [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-dg2-435/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
> 
>    * igt@kms_feature_discovery@display-3x:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#703])
>     [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-dg2-435/igt@kms_feature_discovery@display-3x.html
> 
>    * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:
>      - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#1421])
>     [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-lnl-3/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html
> 
>    * igt@kms_flip@2x-flip-vs-dpms-on-nop:
>      - shard-bmg:          [PASS][58] -> [SKIP][59] ([Intel XE#2316]) +6 other tests skip
>     [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-bmg-7/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
>     [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
> 
>    * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode:
>      - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#1401]) +1 other test skip
>     [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode.html
> 
>    * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
>      - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#1397] / [Intel XE#1745])
>     [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
> 
>    * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode:
>      - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#1397])
>     [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode.html
> 
>    * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:
>      - shard-lnl:          NOTRUN -> [FAIL][63] ([Intel XE#4683]) +1 other test fail
>     [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html
> 
>    * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
>      - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#2293] / [Intel XE#2380]) +3 other tests skip
>     [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
> 
>    * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#455]) +12 other tests skip
>     [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
>      - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
>     [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
> 
>    * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode:
>      - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#2293]) +3 other tests skip
>     [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html
> 
>    * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
>      - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#2312]) +4 other tests skip
>     [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
> 
>    * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
>      - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#656]) +10 other tests skip
>     [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
> 
>    * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#651]) +23 other tests skip
>     [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
>      - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#5390]) +4 other tests skip
>     [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html
> 
>    * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render:
>      - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#2311]) +14 other tests skip
>     [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render.html
> 
>    * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:
>      - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#651]) +4 other tests skip
>     [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html
> 
>    * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
>      - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#1469])
>     [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:
>      - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#2313]) +11 other tests skip
>     [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#653]) +21 other tests skip
>     [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
> 
>    * igt@kms_hdr@invalid-hdr:
>      - shard-dg2-set2:     [PASS][77] -> [SKIP][78] ([Intel XE#455])
>     [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
>     [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-dg2-432/igt@kms_hdr@invalid-hdr.html
> 
>    * igt@kms_hdr@static-toggle:
>      - shard-bmg:          [PASS][79] -> [SKIP][80] ([Intel XE#1503]) +1 other test skip
>     [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-bmg-5/igt@kms_hdr@static-toggle.html
>     [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-bmg-6/igt@kms_hdr@static-toggle.html
> 
>    * igt@kms_joiner@basic-big-joiner:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#346])
>     [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-dg2-436/igt@kms_joiner@basic-big-joiner.html
> 
>    * igt@kms_joiner@invalid-modeset-big-joiner:
>      - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#346])
>     [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-bmg-5/igt@kms_joiner@invalid-modeset-big-joiner.html
> 
>    * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256:
>      - shard-dg2-set2:     NOTRUN -> [FAIL][83] ([Intel XE#616]) +3 other tests fail
>     [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-dg2-432/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256.html
> 
>    * igt@kms_plane_multiple@2x-tiling-4:
>      - shard-bmg:          [PASS][84] -> [SKIP][85] ([Intel XE#4596])
>     [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-4.html
>     [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-4.html
> 
>    * igt@kms_plane_multiple@2x-tiling-yf:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#5021])
>     [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-dg2-466/igt@kms_plane_multiple@2x-tiling-yf.html
> 
>    * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
>      - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#2763]) +4 other tests skip
>     [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html
>      - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#2763]) +3 other tests skip
>     [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-lnl-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html
> 
>    * igt@kms_pm_dc@dc3co-vpb-simulation:
>      - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#736])
>     [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-lnl-2/igt@kms_pm_dc@dc3co-vpb-simulation.html
> 
>    * igt@kms_pm_dc@dc5-psr:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#1129]) +1 other test skip
>     [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-dg2-463/igt@kms_pm_dc@dc5-psr.html
> 
>    * igt@kms_pm_dc@deep-pkgc:
>      - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#2505])
>     [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-bmg-3/igt@kms_pm_dc@deep-pkgc.html
> 
>    * igt@kms_pm_rpm@modeset-lpsp:
>      - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
>     [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-bmg-2/igt@kms_pm_rpm@modeset-lpsp.html
> 
>    * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
>      - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#1406] / [Intel XE#2893])
>     [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-lnl-3/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html
> 
>    * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][94] ([Intel XE#1406] / [Intel XE#1489]) +7 other tests skip
>     [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-dg2-432/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html
> 
>    * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:
>      - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#1406] / [Intel XE#4608])
>     [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1.html
> 
>    * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
>      - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#1406] / [Intel XE#1489]) +4 other tests skip
>     [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-bmg-8/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html
> 
>    * igt@kms_psr2_su@page_flip-p010:
>      - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#1406] / [Intel XE#2387])
>     [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-bmg-6/igt@kms_psr2_su@page_flip-p010.html
> 
>    * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
>      - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#1406]) +3 other tests skip
>     [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-lnl-2/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html
> 
>    * igt@kms_psr@fbc-psr2-cursor-plane-onoff@edp-1:
>      - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#1406] / [Intel XE#4609])
>     [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-lnl-2/igt@kms_psr@fbc-psr2-cursor-plane-onoff@edp-1.html
> 
>    * igt@kms_psr@psr-dpms:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][100] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +9 other tests skip
>     [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-dg2-436/igt@kms_psr@psr-dpms.html
> 
>    * igt@kms_psr@psr-sprite-plane-onoff:
>      - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +7 other tests skip
>     [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-bmg-2/igt@kms_psr@psr-sprite-plane-onoff.html
> 
>    * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#1127])
>     [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
> 
>    * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#3414])
>     [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
>      - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#3414] / [Intel XE#3904])
>     [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-bmg-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
> 
>    * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
>      - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#3414] / [Intel XE#3904])
>     [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-lnl-4/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
> 
>    * igt@kms_vrr@lobf:
>      - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#2168])
>     [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-bmg-1/igt@kms_vrr@lobf.html
>      - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#2168])
>     [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-dg2-466/igt@kms_vrr@lobf.html
>      - shard-lnl:          NOTRUN -> [SKIP][108] ([Intel XE#1499])
>     [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-lnl-5/igt@kms_vrr@lobf.html
> 
>    * igt@kms_vrr@seamless-rr-switch-drrs:
>      - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#1499]) +1 other test skip
>     [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-bmg-8/igt@kms_vrr@seamless-rr-switch-drrs.html
> 
>    * igt@xe_compute@ccs-mode-compute-kernel:
>      - shard-bmg:          NOTRUN -> [FAIL][110] ([Intel XE#5963])
>     [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-bmg-5/igt@xe_compute@ccs-mode-compute-kernel.html
>      - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#1447])
>     [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-lnl-5/igt@xe_compute@ccs-mode-compute-kernel.html
> 
>    * igt@xe_compute_preempt@compute-preempt-many-all-ram@engine-drm_xe_engine_class_compute:
>      - shard-dg2-set2:     NOTRUN -> [FAIL][112] ([Intel XE#5890]) +1 other test fail
>     [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-dg2-435/igt@xe_compute_preempt@compute-preempt-many-all-ram@engine-drm_xe_engine_class_compute.html
> 
>    * igt@xe_eu_stall@non-blocking-re-enable:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#5626]) +1 other test skip
>     [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-dg2-432/igt@xe_eu_stall@non-blocking-re-enable.html
> 
>    * igt@xe_eudebug@discovery-empty-clients:
>      - shard-lnl:          NOTRUN -> [SKIP][114] ([Intel XE#4837]) +5 other tests skip
>     [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-lnl-2/igt@xe_eudebug@discovery-empty-clients.html
> 
>    * igt@xe_eudebug@vm-bind-clear-faultable:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][115] ([Intel XE#4837]) +10 other tests skip
>     [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-dg2-466/igt@xe_eudebug@vm-bind-clear-faultable.html
> 
>    * igt@xe_eudebug_online@basic-breakpoint:
>      - shard-bmg:          NOTRUN -> [SKIP][116] ([Intel XE#4837]) +10 other tests skip
>     [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-bmg-7/igt@xe_eudebug_online@basic-breakpoint.html
> 
>    * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:
>      - shard-lnl:          NOTRUN -> [SKIP][117] ([Intel XE#688]) +2 other tests skip
>     [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-lnl-3/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html
> 
>    * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:
>      - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#2322]) +4 other tests skip
>     [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html
> 
>    * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:
>      - shard-dg2-set2:     [PASS][119] -> [SKIP][120] ([Intel XE#1392]) +6 other tests skip
>     [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html
>     [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html
> 
>    * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
>      - shard-lnl:          NOTRUN -> [SKIP][121] ([Intel XE#1392]) +2 other tests skip
>     [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-lnl-5/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html
> 
>    * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][122] ([Intel XE#288]) +15 other tests skip
>     [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
> 
>    * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][123] ([Intel XE#2360])
>     [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-dg2-435/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html
> 
>    * igt@xe_exec_system_allocator@many-large-mmap-new-nomemset:
>      - shard-bmg:          [PASS][124] -> [ABORT][125] ([Intel XE#5790])
>     [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-bmg-2/igt@xe_exec_system_allocator@many-large-mmap-new-nomemset.html
>     [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-bmg-2/igt@xe_exec_system_allocator@many-large-mmap-new-nomemset.html
> 
>    * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][126] ([Intel XE#4915]) +213 other tests skip
>     [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-dg2-436/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc.html
> 
>    * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge:
>      - shard-bmg:          NOTRUN -> [SKIP][127] ([Intel XE#4943]) +14 other tests skip
>     [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-bmg-7/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge.html
> 
>    * igt@xe_exec_system_allocator@twice-large-mmap-free-huge:
>      - shard-lnl:          NOTRUN -> [SKIP][128] ([Intel XE#4943]) +8 other tests skip
>     [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-lnl-5/igt@xe_exec_system_allocator@twice-large-mmap-free-huge.html
> 
>    * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][129] ([Intel XE#2229])
>     [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-dg2-432/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
> 
>    * igt@xe_mmap@pci-membarrier:
>      - shard-lnl:          NOTRUN -> [SKIP][130] ([Intel XE#5100])
>     [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-lnl-7/igt@xe_mmap@pci-membarrier.html
> 
>    * igt@xe_mmap@vram:
>      - shard-lnl:          NOTRUN -> [SKIP][131] ([Intel XE#1416])
>     [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-lnl-5/igt@xe_mmap@vram.html
> 
>    * igt@xe_module_load@force-load:
>      - shard-lnl:          NOTRUN -> [SKIP][132] ([Intel XE#378])
>     [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-lnl-1/igt@xe_module_load@force-load.html
> 
>    * igt@xe_oa@closed-fd-and-unmapped-access:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][133] ([Intel XE#3573]) +5 other tests skip
>     [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-dg2-433/igt@xe_oa@closed-fd-and-unmapped-access.html
> 
>    * igt@xe_pat@display-vs-wb-transient:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][134] ([Intel XE#1337])
>     [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-dg2-435/igt@xe_pat@display-vs-wb-transient.html
> 
>    * igt@xe_peer2peer@read:
>      - shard-bmg:          NOTRUN -> [SKIP][135] ([Intel XE#2427])
>     [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-bmg-1/igt@xe_peer2peer@read.html
> 
>    * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
>      - shard-dg2-set2:     NOTRUN -> [FAIL][136] ([Intel XE#1173]) +1 other test fail
>     [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-dg2-466/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html
> 
>    * igt@xe_pm@d3cold-basic-exec:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][137] ([Intel XE#2284] / [Intel XE#366])
>     [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-dg2-432/igt@xe_pm@d3cold-basic-exec.html
> 
>    * igt@xe_pm@s4-basic:
>      - shard-bmg:          [PASS][138] -> [DMESG-FAIL][139] ([Intel XE#5545])
>     [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-bmg-6/igt@xe_pm@s4-basic.html
>     [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-bmg-2/igt@xe_pm@s4-basic.html
> 
>    * igt@xe_pm_residency@cpg-basic:
>      - shard-lnl:          NOTRUN -> [SKIP][140] ([Intel XE#584])
>     [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-lnl-8/igt@xe_pm_residency@cpg-basic.html
> 
>    * igt@xe_pmu@all-fn-engine-activity-load:
>      - shard-lnl:          NOTRUN -> [SKIP][141] ([Intel XE#4650])
>     [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-lnl-7/igt@xe_pmu@all-fn-engine-activity-load.html
> 
>    * igt@xe_pmu@fn-engine-activity-sched-if-idle:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][142] ([Intel XE#4650])
>     [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-dg2-435/igt@xe_pmu@fn-engine-activity-sched-if-idle.html
> 
>    * igt@xe_pxp@display-black-pxp-fb:
>      - shard-bmg:          NOTRUN -> [SKIP][143] ([Intel XE#4733]) +1 other test skip
>     [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-bmg-7/igt@xe_pxp@display-black-pxp-fb.html
>      - shard-dg2-set2:     NOTRUN -> [SKIP][144] ([Intel XE#4733]) +2 other tests skip
>     [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-dg2-433/igt@xe_pxp@display-black-pxp-fb.html
> 
>    * igt@xe_query@multigpu-query-config:
>      - shard-lnl:          NOTRUN -> [SKIP][145] ([Intel XE#944])
>     [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-lnl-1/igt@xe_query@multigpu-query-config.html
> 
>    * igt@xe_query@multigpu-query-uc-fw-version-guc:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][146] ([Intel XE#944]) +2 other tests skip
>     [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-dg2-433/igt@xe_query@multigpu-query-uc-fw-version-guc.html
> 
>    * igt@xe_query@multigpu-query-uc-fw-version-huc:
>      - shard-bmg:          NOTRUN -> [SKIP][147] ([Intel XE#944]) +1 other test skip
>     [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-bmg-1/igt@xe_query@multigpu-query-uc-fw-version-huc.html
> 
>    * igt@xe_sriov_auto_provisioning@fair-allocation:
>      - shard-lnl:          NOTRUN -> [SKIP][148] ([Intel XE#4130]) +1 other test skip
>     [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-lnl-3/igt@xe_sriov_auto_provisioning@fair-allocation.html
>      - shard-dg2-set2:     NOTRUN -> [SKIP][149] ([Intel XE#4130])
>     [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-dg2-432/igt@xe_sriov_auto_provisioning@fair-allocation.html
> 
>    
> #### Possible fixes ####
> 
>    * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1:
>      - shard-lnl:          [FAIL][150] -> [PASS][151] +3 other tests pass
>     [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html
>     [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html
> 
>    * igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1:
>      - shard-lnl:          [FAIL][152] ([Intel XE#5993]) -> [PASS][153] +3 other tests pass
>     [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html
>     [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html
> 
>    * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>      - shard-bmg:          [INCOMPLETE][154] ([Intel XE#3862]) -> [PASS][155] +1 other test pass
>     [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
>     [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
> 
>    * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2:
>      - shard-bmg:          [FAIL][156] ([Intel XE#5376]) -> [PASS][157] +1 other test pass
>     [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2.html
>     [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2.html
> 
>    * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
>      - shard-dg2-set2:     [INCOMPLETE][158] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [PASS][159]
>     [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
>     [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
> 
>    * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
>      - shard-bmg:          [SKIP][160] ([Intel XE#2291]) -> [PASS][161]
>     [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-bmg-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
>     [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-bmg-5/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
> 
>    * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
>      - shard-bmg:          [FAIL][162] ([Intel XE#1475]) -> [PASS][163]
>     [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
>     [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
> 
>    * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
>      - shard-bmg:          [SKIP][164] ([Intel XE#1340]) -> [PASS][165]
>     [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
>     [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-bmg-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
> 
>    * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
>      - shard-bmg:          [SKIP][166] ([Intel XE#2316]) -> [PASS][167] +4 other tests pass
>     [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-bmg-6/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html
>     [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-bmg-8/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html
> 
>    * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
>      - shard-lnl:          [FAIL][168] ([Intel XE#301]) -> [PASS][169] +1 other test pass
>     [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
>     [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
> 
>    * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6:
>      - shard-dg2-set2:     [FAIL][170] ([Intel XE#301]) -> [PASS][171] +1 other test pass
>     [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6.html
>     [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6.html
> 
>    * igt@kms_flip@flip-vs-suspend:
>      - shard-bmg:          [INCOMPLETE][172] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][173] +1 other test pass
>     [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-bmg-6/igt@kms_flip@flip-vs-suspend.html
>     [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-bmg-5/igt@kms_flip@flip-vs-suspend.html
> 
>    * igt@kms_flip@flip-vs-suspend@d-dp4:
>      - shard-dg2-set2:     [INCOMPLETE][174] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][175] +1 other test pass
>     [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-dg2-433/igt@kms_flip@flip-vs-suspend@d-dp4.html
>     [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-dg2-433/igt@kms_flip@flip-vs-suspend@d-dp4.html
> 
>    * igt@kms_pm_dc@dc6-dpms:
>      - shard-lnl:          [FAIL][176] ([Intel XE#718]) -> [PASS][177]
>     [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-lnl-4/igt@kms_pm_dc@dc6-dpms.html
>     [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-lnl-8/igt@kms_pm_dc@dc6-dpms.html
> 
>    * igt@kms_vrr@flipline:
>      - shard-lnl:          [FAIL][178] ([Intel XE#4227]) -> [PASS][179] +1 other test pass
>     [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-lnl-8/igt@kms_vrr@flipline.html
>     [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-lnl-8/igt@kms_vrr@flipline.html
> 
>    * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
>      - shard-dg2-set2:     [SKIP][180] ([Intel XE#1392]) -> [PASS][181] +3 other tests pass
>     [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
>     [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-dg2-466/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
> 
>    * igt@xe_exec_reset@parallel-gt-reset:
>      - shard-dg2-set2:     [DMESG-WARN][182] ([Intel XE#3876]) -> [PASS][183]
>     [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-dg2-433/igt@xe_exec_reset@parallel-gt-reset.html
>     [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-dg2-435/igt@xe_exec_reset@parallel-gt-reset.html
> 
>    * {igt@xe_exec_system_allocator@many-stride-malloc-prefetch}:
>      - shard-bmg:          [WARN][184] ([Intel XE#5786]) -> [PASS][185]
>     [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-bmg-7/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html
>     [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-bmg-1/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html
> 
>    * igt@xe_exec_threads@threads-cm-fd-rebind:
>      - shard-bmg:          [FAIL][186] -> [PASS][187]
>     [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-bmg-7/igt@xe_exec_threads@threads-cm-fd-rebind.html
>     [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-bmg-7/igt@xe_exec_threads@threads-cm-fd-rebind.html
> 
>    
> #### Warnings ####
> 
>    * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
>      - shard-dg2-set2:     [INCOMPLETE][188] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) -> [INCOMPLETE][189] ([Intel XE#2705] / [Intel XE#4212] / [Intel XE#4345])
>     [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
>     [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
> 
>    * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
>      - shard-dg2-set2:     [INCOMPLETE][190] ([Intel XE#2705] / [Intel XE#4212] / [Intel XE#4522]) -> [INCOMPLETE][191] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
>     [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
>     [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
> 
>    * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
>      - shard-dg2-set2:     [INCOMPLETE][192] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [INCOMPLETE][193] ([Intel XE#2705] / [Intel XE#4212])
>     [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
>     [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
> 
>    * igt@kms_content_protection@legacy:
>      - shard-bmg:          [SKIP][194] ([Intel XE#2341]) -> [FAIL][195] ([Intel XE#1178]) +1 other test fail
>     [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-bmg-6/igt@kms_content_protection@legacy.html
>     [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-bmg-5/igt@kms_content_protection@legacy.html
> 
>    * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
>      - shard-bmg:          [SKIP][196] ([Intel XE#2312]) -> [SKIP][197] ([Intel XE#2311]) +8 other tests skip
>     [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
>     [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
>      - shard-bmg:          [SKIP][198] ([Intel XE#5390]) -> [SKIP][199] ([Intel XE#2312]) +3 other tests skip
>     [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
>     [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
>      - shard-bmg:          [SKIP][200] ([Intel XE#2312]) -> [SKIP][201] ([Intel XE#5390]) +1 other test skip
>     [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
>     [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
> 
>    * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
>      - shard-bmg:          [SKIP][202] ([Intel XE#2311]) -> [SKIP][203] ([Intel XE#2312]) +11 other tests skip
>     [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
>     [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
> 
>    * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
>      - shard-bmg:          [SKIP][204] ([Intel XE#2313]) -> [SKIP][205] ([Intel XE#2312]) +11 other tests skip
>     [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html
>     [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html
> 
>    * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
>      - shard-bmg:          [SKIP][206] ([Intel XE#2312]) -> [SKIP][207] ([Intel XE#2313]) +5 other tests skip
>     [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
>     [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
> 
>    * igt@kms_hdr@brightness-with-hdr:
>      - shard-bmg:          [SKIP][208] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][209] ([Intel XE#3544])
>     [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html
>     [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html
> 
>    * igt@kms_plane_multiple@2x-tiling-y:
>      - shard-bmg:          [SKIP][210] ([Intel XE#4596]) -> [SKIP][211] ([Intel XE#5021])
>     [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-y.html
>     [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-y.html
> 
>    * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>      - shard-bmg:          [SKIP][212] ([Intel XE#2426]) -> [SKIP][213] ([Intel XE#2509])
>     [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>     [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>    * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
>      - shard-bmg:          [ABORT][214] ([Intel XE#5466] / [Intel XE#5530]) -> [ABORT][215] ([Intel XE#4917] / [Intel XE#5466] / [Intel XE#5530])
>     [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8524/shard-bmg-4/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
>     [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/shard-bmg-4/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
> 
>    
>    {name}: This element is suppressed. This means it is ignored when computing
>            the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>    [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>    [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>    [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
>    [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
>    [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>    [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
>    [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
>    [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>    [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
>    [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>    [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>    [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>    [Intel XE#1416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416
>    [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>    [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>    [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>    [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
>    [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
>    [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
>    [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>    [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>    [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>    [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
>    [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>    [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>    [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>    [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
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
>    [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
>    [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>    [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>    [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>    [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
>    [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>    [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
>    [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
>    [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
>    [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
>    [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>    [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
>    [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
>    [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
>    [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
>    [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>    [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
>    [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
>    [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>    [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>    [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>    [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>    [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
>    [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>    [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>    [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>    [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>    [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>    [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
>    [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
>    [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
>    [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>    [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>    [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
>    [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>    [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>    [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
>    [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
>    [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
>    [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
>    [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>    [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>    [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>    [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
>    [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
>    [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
>    [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>    [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
>    [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
>    [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
>    [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
>    [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
>    [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
>    [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
>    [Intel XE#4494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494
>    [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
>    [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>    [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
>    [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
>    [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
>    [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
>    [Intel XE#4683]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4683
>    [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>    [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
>    [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
>    [Intel XE#4917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
>    [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
>    [Intel XE#5007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007
>    [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
>    [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
>    [Intel XE#5300]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5300
>    [Intel XE#5376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5376
>    [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
>    [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
>    [Intel XE#5530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530
>    [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
>    [Intel XE#5626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626
>    [Intel XE#5786]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786
>    [Intel XE#5790]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5790
>    [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
>    [Intel XE#5890]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5890
>    [Intel XE#5963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5963
>    [Intel XE#5993]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5993
>    [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
>    [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
>    [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>    [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>    [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>    [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>    [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
>    [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>    [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
>    [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
>    [Intel XE#736]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/736
>    [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>    [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
>    [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>    [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> 
> 
> Build changes
> -------------
> 
>    * IGT: IGT_8524 -> IGTPW_13695
> 
>    IGTPW_13695: 13695
>    IGT_8524: 8524
>    xe-3677-3345c879b0492f1283042ae6bdecb0e65ec4ff97: 3345c879b0492f1283042ae6bdecb0e65ec4ff97
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13695/index.html
> 

