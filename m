Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD7BC369C2
	for <igt-dev@archiver.kernel.org>; Fri, 25 Apr 2025 10:07:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9340410E900;
	Fri, 25 Apr 2025 10:07:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PwltlNnX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F54C10E8FE;
 Fri, 25 Apr 2025 10:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745575656; x=1777111656;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=DNlic/RmO657v+7X9x+wBBZyy9Nu1E+1nZwWYRQSoPw=;
 b=PwltlNnXkKwUtF3B2zuUL3f15lPGgz44wsKxqq0cMdsknJZrF1mCdgak
 l5AVbyFCQDDjnGVgdyqR6orwJpdXc1K7JeC1KhiljnLtjn21gF0DQZzsR
 pwx35JtbR3KOk17+7bbFNlrct47Jq4hVUMWgi+hasoJENV9IOsE46dGky
 E7TFtyYWug+Qz4kaQDxnIDdbYNrMjp1oHG51/VgG+JTfGoEr3Ku7lUlTX
 FAy5uHau3L09srDg/ATFoQZM4xaLnodT9pqSyxMGKNZihk63kpV84EPRa
 K49rTrI9f83LhFmZMgBAbYV+fehtze7TIp033u11i7tMJUUkKR+bQ1jIA g==;
X-CSE-ConnectionGUID: pXbXmPUUSSqs7xykR0bBaQ==
X-CSE-MsgGUID: F5r9vmM6Qkm17EETT7pG/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="47369007"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="47369007"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 03:07:31 -0700
X-CSE-ConnectionGUID: A7+e4AE0TOidMldr9TJXwA==
X-CSE-MsgGUID: b71SVaGfQziEB4NdBVnxeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="163930291"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.245.80.134])
 ([10.245.80.134])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 03:07:30 -0700
Message-ID: <07c0972e-e855-4125-9571-d3d60bd29866@linux.intel.com>
Date: Fri, 25 Apr 2025 12:07:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciB4ZV9mYXVsdF9p?=
 =?UTF-8?Q?njection=3A_Improve_probe_fault_injection_handling?=
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250417131312.1016503-1-marcin.bernatowicz@linux.intel.com>
 <174496011807.17178.4632694896865855992@b68e5b3b99e1>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <174496011807.17178.4632694896865855992@b68e5b3b99e1>
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



On 4/18/2025 9:08 AM, Patchwork wrote:
> == Series Details ==
> 
> Series: xe_fault_injection: Improve probe fault injection handling
> URL   : https://patchwork.freedesktop.org/series/147916/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8326_FULL -> XEIGTPW_13001_FULL
> ====================================================
> 
> Summary
> -------
> 
>    **FAILURE**
> 
>    Serious unknown changes coming with XEIGTPW_13001_FULL absolutely need to be
>    verified manually.
>    
>    If you think the reported changes have nothing to do with the changes
>    introduced in XEIGTPW_13001_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>    Here are the unknown changes that may have been introduced in XEIGTPW_13001_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>    * igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-a-hdmi-a-6-dp-4:
>      - shard-dg2-set2:     [PASS][1] -> [ABORT][2] +1 other test abort
>     [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-dg2-436/igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-a-hdmi-a-6-dp-4.html
>     [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-463/igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-a-hdmi-a-6-dp-4.html
> 
>    * igt@xe_pmu@engine-activity-idle:
>      - shard-lnl:          [PASS][3] -> [FAIL][4] +4 other tests fail
>     [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-lnl-7/igt@xe_pmu@engine-activity-idle.html
>     [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-lnl-4/igt@xe_pmu@engine-activity-idle.html
> 
>    * igt@xe_pmu@engine-activity-idle@engine-drm_xe_engine_class_video_enhance1:
>      - shard-bmg:          [PASS][5] -> [FAIL][6] +3 other tests fail
>     [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-bmg-7/igt@xe_pmu@engine-activity-idle@engine-drm_xe_engine_class_video_enhance1.html
>     [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-1/igt@xe_pmu@engine-activity-idle@engine-drm_xe_engine_class_video_enhance1.html
> 

Not related to the change.
-- 
marcin

>    
> Known issues
> ------------
> 
>    Here are the changes found in XEIGTPW_13001_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>    * igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-on:
>      - shard-lnl:          [PASS][7] -> [ABORT][8] ([Intel XE#4624])
>     [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-lnl-4/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-on.html
>     [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-lnl-8/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-on.html
> 
>    * igt@kms_async_flips@test-cursor-atomic:
>      - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#664])
>     [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-lnl-1/igt@kms_async_flips@test-cursor-atomic.html
> 
>    * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][10] ([Intel XE#316]) +2 other tests skip
>     [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-463/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html
> 
>    * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
>      - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2327]) +1 other test skip
>     [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-7/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html
> 
>    * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
>      - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#1407])
>     [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-lnl-8/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
> 
>    * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#1124]) +4 other tests skip
>     [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
> 
>    * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
>      - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#1124]) +5 other tests skip
>     [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-lnl-1/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html
> 
>    * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
>      - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#1124]) +4 other tests skip
>     [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html
> 
>    * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
>      - shard-dg2-set2:     [PASS][16] -> [SKIP][17] ([Intel XE#2191])
>     [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-dg2-432/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
>     [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
> 
>    * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#2191])
>     [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-464/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
> 
>    * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
>      - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#1512])
>     [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-lnl-7/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
> 
>    * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#367]) +1 other test skip
>     [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-436/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
> 
>    * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
>      - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#367])
>     [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-6/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
> 
>    * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#787]) +234 other tests skip
>     [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2.html
> 
>    * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
>      - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#2887]) +6 other tests skip
>     [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-lnl-7/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html
> 
>    * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#2907])
>     [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
> 
>    * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
>      - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#3432])
>     [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html
> 
>    * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-2:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#455] / [Intel XE#787]) +45 other tests skip
>     [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-2.html
> 
>    * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:
>      - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2887]) +6 other tests skip
>     [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html
> 
>    * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:
>      - shard-dg2-set2:     [PASS][28] -> [DMESG-WARN][29] ([Intel XE#1727] / [Intel XE#3113])
>     [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html
>     [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html
> 
>    * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:
>      - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][30] ([Intel XE#3124])
>     [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html
> 
>    * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
>      - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2652] / [Intel XE#787]) +8 other tests skip
>     [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html
> 
>    * igt@kms_cdclk@mode-transition-all-outputs:
>      - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#4418])
>     [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-lnl-1/igt@kms_cdclk@mode-transition-all-outputs.html
> 
>    * igt@kms_chamelium_color@ctm-0-50:
>      - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2325])
>     [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-1/igt@kms_chamelium_color@ctm-0-50.html
> 
>    * igt@kms_chamelium_color@ctm-green-to-red:
>      - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#306])
>     [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-lnl-5/igt@kms_chamelium_color@ctm-green-to-red.html
> 
>    * igt@kms_chamelium_color@ctm-red-to-blue:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#306])
>     [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-432/igt@kms_chamelium_color@ctm-red-to-blue.html
> 
>    * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
>      - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#373]) +4 other tests skip
>     [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-lnl-1/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
> 
>    * igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:
>      - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2252]) +3 other tests skip
>     [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-3/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html
> 
>    * igt@kms_chamelium_hpd@hdmi-hpd:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#373]) +7 other tests skip
>     [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd.html
> 
>    * igt@kms_content_protection@atomic:
>      - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#3278]) +1 other test skip
>     [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-lnl-8/igt@kms_content_protection@atomic.html
> 
>    * igt@kms_content_protection@atomic@pipe-a-dp-2:
>      - shard-bmg:          NOTRUN -> [FAIL][40] ([Intel XE#1178])
>     [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-6/igt@kms_content_protection@atomic@pipe-a-dp-2.html
> 
>    * igt@kms_content_protection@srm@pipe-a-dp-4:
>      - shard-dg2-set2:     NOTRUN -> [FAIL][41] ([Intel XE#1178]) +1 other test fail
>     [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-463/igt@kms_content_protection@srm@pipe-a-dp-4.html
> 
>    * igt@kms_content_protection@type1:
>      - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2341])
>     [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-2/igt@kms_content_protection@type1.html
> 
>    * igt@kms_cursor_crc@cursor-offscreen-128x42:
>      - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#1424]) +2 other tests skip
>     [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-lnl-5/igt@kms_cursor_crc@cursor-offscreen-128x42.html
> 
>    * igt@kms_cursor_crc@cursor-onscreen-512x170:
>      - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#2321]) +1 other test skip
>     [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-lnl-8/igt@kms_cursor_crc@cursor-onscreen-512x170.html
> 
>    * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
>      - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2321])
>     [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
> 
>    * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#308])
>     [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-463/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
> 
>    * igt@kms_cursor_crc@cursor-sliding-32x10:
>      - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2320]) +3 other tests skip
>     [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-32x10.html
> 
>    * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
>      - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#309]) +2 other tests skip
>     [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-lnl-1/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
> 
>    * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#309])
>     [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html
> 
>    * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
>      - shard-bmg:          [PASS][50] -> [SKIP][51] ([Intel XE#2291]) +6 other tests skip
>     [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
>     [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
> 
>    * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
>      - shard-dg2-set2:     [PASS][52] -> [SKIP][53] ([Intel XE#309]) +3 other tests skip
>     [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-dg2-463/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
>     [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
> 
>    * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
>      - shard-bmg:          [PASS][54] -> [FAIL][55] ([Intel XE#1475]) +1 other test fail
>     [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
>     [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
> 
>    * igt@kms_display_modes@extended-mode-basic:
>      - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#4302])
>     [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-lnl-4/igt@kms_display_modes@extended-mode-basic.html
> 
>    * igt@kms_dp_aux_dev:
>      - shard-dg2-set2:     [PASS][57] -> [SKIP][58] ([Intel XE#3009])
>     [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-dg2-463/igt@kms_dp_aux_dev.html
>     [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-464/igt@kms_dp_aux_dev.html
> 
>    * igt@kms_dp_linktrain_fallback@dp-fallback:
>      - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#4294])
>     [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-lnl-2/igt@kms_dp_linktrain_fallback@dp-fallback.html
> 
>    * igt@kms_fbcon_fbt@psr-suspend:
>      - shard-lnl:          [PASS][60] -> [FAIL][61] ([Intel XE#4164])
>     [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-lnl-1/igt@kms_fbcon_fbt@psr-suspend.html
>     [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-lnl-3/igt@kms_fbcon_fbt@psr-suspend.html
> 
>    * igt@kms_feature_discovery@display-2x:
>      - shard-bmg:          [PASS][62] -> [SKIP][63] ([Intel XE#2373])
>     [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-bmg-3/igt@kms_feature_discovery@display-2x.html
>     [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-4/igt@kms_feature_discovery@display-2x.html
> 
>    * igt@kms_flip@2x-blocking-absolute-wf_vblank:
>      - shard-dg2-set2:     [PASS][64] -> [SKIP][65] ([Intel XE#310]) +7 other tests skip
>     [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-dg2-432/igt@kms_flip@2x-blocking-absolute-wf_vblank.html
>     [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-464/igt@kms_flip@2x-blocking-absolute-wf_vblank.html
> 
>    * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#310]) +3 other tests skip
>     [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-464/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html
> 
>    * igt@kms_flip@2x-flip-vs-dpms-on-nop:
>      - shard-bmg:          [PASS][67] -> [SKIP][68] ([Intel XE#2316]) +6 other tests skip
>     [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
>     [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
> 
>    * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:
>      - shard-bmg:          NOTRUN -> [FAIL][69] ([Intel XE#3321]) +1 other test fail
>     [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html
> 
>    * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
>      - shard-bmg:          [PASS][70] -> [FAIL][71] ([Intel XE#3321]) +2 other tests fail
>     [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
>     [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
> 
>    * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
>      - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#1421]) +1 other test skip
>     [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-lnl-1/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
> 
>    * igt@kms_flip@bo-too-big-interruptible@a-edp1:
>      - shard-lnl:          NOTRUN -> [TIMEOUT][73] ([Intel XE#1504]) +1 other test timeout
>     [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-lnl-1/igt@kms_flip@bo-too-big-interruptible@a-edp1.html
> 
>    * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
>      - shard-bmg:          [PASS][74] -> [FAIL][75] ([Intel XE#2882]) +2 other tests fail
>     [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-bmg-1/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
>     [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
> 
>    * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
>      - shard-lnl:          [PASS][76] -> [FAIL][77] ([Intel XE#301]) +2 other tests fail
>     [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
>     [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
> 
>    * igt@kms_flip@flip-vs-expired-vblank@a-dp4:
>      - shard-dg2-set2:     [PASS][78] -> [FAIL][79] ([Intel XE#301] / [Intel XE#3321])
>     [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html
>     [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html
> 
>    * igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1:
>      - shard-lnl:          [PASS][80] -> [FAIL][81] ([Intel XE#886]) +1 other test fail
>     [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-lnl-8/igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1.html
>     [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-lnl-6/igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1.html
> 
>    * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
>      - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#1401]) +1 other test skip
>     [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html
> 
>    * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
>      - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
>     [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html
> 
>    * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
>      - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#2293] / [Intel XE#2380])
>     [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html
> 
>    * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
>      - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#2293])
>     [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html
> 
>    * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:
>      - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#651]) +8 other tests skip
>     [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html
> 
>    * igt@kms_frontbuffer_tracking@drrs-suspend:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#651]) +12 other tests skip
>     [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-suspend.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
>      - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#4141]) +6 other tests skip
>     [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:
>      - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#2312]) +4 other tests skip
>     [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:
>      - shard-dg2-set2:     [PASS][90] -> [SKIP][91] ([Intel XE#656]) +9 other tests skip
>     [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html
>     [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html
> 
>    * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
>      - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#2311]) +11 other tests skip
>     [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
>      - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#2313]) +10 other tests skip
>     [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render:
>      - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#656]) +29 other tests skip
>     [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
>      - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#1469])
>     [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
> 
>    * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#653]) +15 other tests skip
>     [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc.html
> 
>    * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#656]) +10 other tests skip
>     [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
> 
>    * igt@kms_hdr@static-swap:
>      - shard-bmg:          [PASS][98] -> [SKIP][99] ([Intel XE#1503]) +1 other test skip
>     [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-bmg-1/igt@kms_hdr@static-swap.html
>     [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-4/igt@kms_hdr@static-swap.html
> 
>    * igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:
>      - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#1450]) +1 other test skip
>     [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-lnl-5/igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1.html
> 
>    * igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1:
>      - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#1450] / [Intel XE#2568]) +1 other test skip
>     [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-lnl-5/igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1.html
> 
>    * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#2925])
>     [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-464/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
> 
>    * igt@kms_panel_fitting@atomic-fastset:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#455]) +11 other tests skip
>     [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-436/igt@kms_panel_fitting@atomic-fastset.html
> 
>    * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
>      - shard-dg2-set2:     NOTRUN -> [FAIL][104] ([Intel XE#616]) +2 other tests fail
>     [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-463/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html
> 
>    * igt@kms_plane_multiple@2x-tiling-4:
>      - shard-bmg:          [PASS][105] -> [SKIP][106] ([Intel XE#4596])
>     [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-4.html
>     [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-4.html
> 
>    * igt@kms_plane_multiple@2x-tiling-x:
>      - shard-dg2-set2:     [PASS][107] -> [SKIP][108] ([Intel XE#4596])
>     [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-dg2-463/igt@kms_plane_multiple@2x-tiling-x.html
>     [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-x.html
>      - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#4596])
>     [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-lnl-1/igt@kms_plane_multiple@2x-tiling-x.html
> 
>    * igt@kms_plane_multiple@tiling-yf:
>      - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#2493])
>     [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-lnl-3/igt@kms_plane_multiple@tiling-yf.html
> 
>    * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b:
>      - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#2763]) +11 other tests skip
>     [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-lnl-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html
> 
>    * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:
>      - shard-bmg:          NOTRUN -> [SKIP][112] ([Intel XE#2763]) +9 other tests skip
>     [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html
> 
>    * igt@kms_pm_dc@dc5-psr:
>      - shard-lnl:          [PASS][113] -> [FAIL][114] ([Intel XE#718])
>     [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-lnl-1/igt@kms_pm_dc@dc5-psr.html
>     [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-lnl-6/igt@kms_pm_dc@dc5-psr.html
> 
>    * igt@kms_pm_dc@dc6-dpms:
>      - shard-lnl:          NOTRUN -> [FAIL][115] ([Intel XE#718])
>     [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-lnl-1/igt@kms_pm_dc@dc6-dpms.html
> 
>    * igt@kms_pm_dc@dc6-psr:
>      - shard-bmg:          NOTRUN -> [SKIP][116] ([Intel XE#2392])
>     [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-3/igt@kms_pm_dc@dc6-psr.html
> 
>    * igt@kms_pm_rpm@dpms-non-lpsp:
>      - shard-dg2-set2:     [PASS][117] -> [SKIP][118] ([Intel XE#836])
>     [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-dg2-433/igt@kms_pm_rpm@dpms-non-lpsp.html
>     [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-464/igt@kms_pm_rpm@dpms-non-lpsp.html
> 
>    * igt@kms_pm_rpm@i2c:
>      - shard-dg2-set2:     [PASS][119] -> [FAIL][120] ([Intel XE#4731])
>     [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-dg2-463/igt@kms_pm_rpm@i2c.html
>     [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-432/igt@kms_pm_rpm@i2c.html
> 
>    * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:
>      - shard-lnl:          NOTRUN -> [SKIP][121] ([Intel XE#2893]) +1 other test skip
>     [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-lnl-3/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html
> 
>    * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
>      - shard-lnl:          NOTRUN -> [SKIP][122] ([Intel XE#2893] / [Intel XE#4608])
>     [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html
> 
>    * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:
>      - shard-lnl:          NOTRUN -> [SKIP][123] ([Intel XE#4608]) +2 other tests skip
>     [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1.html
> 
>    * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
>      - shard-bmg:          NOTRUN -> [SKIP][124] ([Intel XE#1489]) +5 other tests skip
>     [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html
> 
>    * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#1489]) +6 other tests skip
>     [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-432/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html
> 
>    * igt@kms_psr2_su@page_flip-xrgb8888:
>      - shard-lnl:          NOTRUN -> [SKIP][126] ([Intel XE#1128])
>     [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-lnl-7/igt@kms_psr2_su@page_flip-xrgb8888.html
> 
>    * igt@kms_psr@fbc-psr2-cursor-plane-move:
>      - shard-bmg:          NOTRUN -> [SKIP][127] ([Intel XE#2234] / [Intel XE#2850]) +6 other tests skip
>     [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-6/igt@kms_psr@fbc-psr2-cursor-plane-move.html
>      - shard-lnl:          NOTRUN -> [SKIP][128] ([Intel XE#1406]) +4 other tests skip
>     [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-lnl-1/igt@kms_psr@fbc-psr2-cursor-plane-move.html
> 
>    * igt@kms_psr@fbc-psr2-cursor-plane-move@edp-1:
>      - shard-lnl:          NOTRUN -> [SKIP][129] ([Intel XE#4609]) +1 other test skip
>     [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-lnl-1/igt@kms_psr@fbc-psr2-cursor-plane-move@edp-1.html
> 
>    * igt@kms_psr@fbc-psr2-sprite-plane-move:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][130] ([Intel XE#2850] / [Intel XE#929]) +6 other tests skip
>     [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-463/igt@kms_psr@fbc-psr2-sprite-plane-move.html
> 
>    * igt@kms_rotation_crc@bad-pixel-format:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][131] ([Intel XE#3414]) +1 other test skip
>     [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-436/igt@kms_rotation_crc@bad-pixel-format.html
> 
>    * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>      - shard-lnl:          NOTRUN -> [SKIP][132] ([Intel XE#3414] / [Intel XE#3904])
>     [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-lnl-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
> 
>    * igt@kms_setmode@basic@pipe-b-edp-1:
>      - shard-lnl:          [PASS][133] -> [FAIL][134] ([Intel XE#2883]) +2 other tests fail
>     [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-lnl-5/igt@kms_setmode@basic@pipe-b-edp-1.html
>     [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-lnl-3/igt@kms_setmode@basic@pipe-b-edp-1.html
> 
>    * igt@kms_setmode@clone-exclusive-crtc:
>      - shard-bmg:          [PASS][135] -> [SKIP][136] ([Intel XE#1435])
>     [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-bmg-3/igt@kms_setmode@clone-exclusive-crtc.html
>     [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-4/igt@kms_setmode@clone-exclusive-crtc.html
>      - shard-lnl:          NOTRUN -> [SKIP][137] ([Intel XE#1435])
>     [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-lnl-6/igt@kms_setmode@clone-exclusive-crtc.html
> 
>    * igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-b-hdmi-a-6-dp-4:
>      - shard-dg2-set2:     [PASS][138] -> [DMESG-WARN][139] ([Intel XE#4212])
>     [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-dg2-436/igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-b-hdmi-a-6-dp-4.html
>     [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-463/igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-b-hdmi-a-6-dp-4.html
> 
>    * igt@kms_tv_load_detect@load-detect:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][140] ([Intel XE#330])
>     [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-464/igt@kms_tv_load_detect@load-detect.html
> 
>    * igt@kms_writeback@writeback-fb-id:
>      - shard-bmg:          NOTRUN -> [SKIP][141] ([Intel XE#756])
>     [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-6/igt@kms_writeback@writeback-fb-id.html
> 
>    * igt@kms_writeback@writeback-invalid-parameters:
>      - shard-lnl:          NOTRUN -> [SKIP][142] ([Intel XE#756])
>     [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-lnl-5/igt@kms_writeback@writeback-invalid-parameters.html
> 
>    * igt@xe_compute_preempt@compute-preempt:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][143] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
>     [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-432/igt@xe_compute_preempt@compute-preempt.html
> 
>    * igt@xe_eudebug@attach-debug-metadata:
>      - shard-bmg:          NOTRUN -> [SKIP][144] ([Intel XE#2905]) +4 other tests skip
>     [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-3/igt@xe_eudebug@attach-debug-metadata.html
> 
>    * igt@xe_eudebug@basic-vm-bind-ufence-reconnect:
>      - shard-bmg:          NOTRUN -> [SKIP][145] ([Intel XE#2905] / [Intel XE#3889]) +1 other test skip
>     [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html
> 
>    * igt@xe_eudebug_online@interrupt-all-set-breakpoint:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][146] ([Intel XE#2905]) +9 other tests skip
>     [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-436/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html
> 
>    * igt@xe_eudebug_online@resume-dss:
>      - shard-lnl:          NOTRUN -> [SKIP][147] ([Intel XE#2905]) +5 other tests skip
>     [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-lnl-3/igt@xe_eudebug_online@resume-dss.html
> 
>    * igt@xe_eudebug_online@set-breakpoint-sigint-debugger:
>      - shard-bmg:          NOTRUN -> [SKIP][148] ([Intel XE#4577])
>     [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-4/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html
> 
>    * igt@xe_eudebug_sriov@deny-eudebug:
>      - shard-lnl:          NOTRUN -> [SKIP][149] ([Intel XE#4518])
>     [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-lnl-8/igt@xe_eudebug_sriov@deny-eudebug.html
> 
>    * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:
>      - shard-lnl:          NOTRUN -> [SKIP][150] ([Intel XE#688]) +4 other tests skip
>     [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-lnl-4/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen.html
> 
>    * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][151] ([Intel XE#1392])
>     [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html
> 
>    * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
>      - shard-dg2-set2:     [PASS][152] -> [SKIP][153] ([Intel XE#1392]) +7 other tests skip
>     [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
>     [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
> 
>    * igt@xe_exec_basic@multigpu-no-exec-rebind:
>      - shard-bmg:          NOTRUN -> [SKIP][154] ([Intel XE#2322]) +2 other tests skip
>     [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exec-rebind.html
> 
>    * igt@xe_exec_basic@multigpu-once-userptr-invalidate:
>      - shard-lnl:          NOTRUN -> [SKIP][155] ([Intel XE#1392]) +4 other tests skip
>     [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-lnl-6/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html
> 
>    * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][156] ([Intel XE#288]) +17 other tests skip
>     [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
> 
>    * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
>      - shard-lnl:          NOTRUN -> [SKIP][157] ([Intel XE#2229]) +1 other test skip
>     [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-lnl-1/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
> 
>    * igt@xe_live_ktest@xe_eudebug:
>      - shard-bmg:          NOTRUN -> [SKIP][158] ([Intel XE#2833])
>     [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-2/igt@xe_live_ktest@xe_eudebug.html
> 
>    * igt@xe_media_fill@media-fill:
>      - shard-bmg:          NOTRUN -> [SKIP][159] ([Intel XE#2459] / [Intel XE#2596])
>     [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-1/igt@xe_media_fill@media-fill.html
> 
>    * igt@xe_oa@disabled-read-error:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][160] ([Intel XE#2541] / [Intel XE#3573]) +3 other tests skip
>     [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-464/igt@xe_oa@disabled-read-error.html
> 
>    * igt@xe_oa@enable-disable@rcs-0:
>      - shard-bmg:          NOTRUN -> [FAIL][161] ([Intel XE#4804])
>     [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-7/igt@xe_oa@enable-disable@rcs-0.html
> 
>    * igt@xe_pm@d3cold-multiple-execs:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][162] ([Intel XE#2284] / [Intel XE#366])
>     [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-432/igt@xe_pm@d3cold-multiple-execs.html
> 
>    * igt@xe_pm@s3-d3hot-basic-exec:
>      - shard-lnl:          NOTRUN -> [SKIP][163] ([Intel XE#584])
>     [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-lnl-7/igt@xe_pm@s3-d3hot-basic-exec.html
> 
>    * igt@xe_pm@s4-d3hot-basic-exec:
>      - shard-lnl:          NOTRUN -> [ABORT][164] ([Intel XE#1794])
>     [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html
> 
>    * igt@xe_pmu@all-fn-engine-activity-load:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][165] ([Intel XE#4650])
>     [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-464/igt@xe_pmu@all-fn-engine-activity-load.html
> 
>    * igt@xe_pmu@fn-engine-activity-sched-if-idle:
>      - shard-bmg:          NOTRUN -> [SKIP][166] ([Intel XE#4650])
>     [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-4/igt@xe_pmu@fn-engine-activity-sched-if-idle.html
> 
>    * igt@xe_pxp@pxp-stale-queue-post-termination-irq:
>      - shard-bmg:          NOTRUN -> [SKIP][167] ([Intel XE#4733]) +1 other test skip
>     [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-7/igt@xe_pxp@pxp-stale-queue-post-termination-irq.html
> 
>    * igt@xe_pxp@pxp-termination-key-update-post-suspend:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][168] ([Intel XE#4733]) +3 other tests skip
>     [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-432/igt@xe_pxp@pxp-termination-key-update-post-suspend.html
> 
>    * igt@xe_query@multigpu-query-invalid-query:
>      - shard-lnl:          NOTRUN -> [SKIP][169] ([Intel XE#944])
>     [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-lnl-4/igt@xe_query@multigpu-query-invalid-query.html
> 
>    * igt@xe_query@multigpu-query-mem-usage:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][170] ([Intel XE#944]) +1 other test skip
>     [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-464/igt@xe_query@multigpu-query-mem-usage.html
> 
>    * igt@xe_query@multigpu-query-topology:
>      - shard-bmg:          NOTRUN -> [SKIP][171] ([Intel XE#944])
>     [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-4/igt@xe_query@multigpu-query-topology.html
> 
>    * igt@xe_render_copy@render-stress-2-copies:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][172] ([Intel XE#4814])
>     [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-436/igt@xe_render_copy@render-stress-2-copies.html
> 
>    * igt@xe_spin_batch@spin-mem-copy:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][173] ([Intel XE#4821])
>     [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-432/igt@xe_spin_batch@spin-mem-copy.html
> 
>    * igt@xe_sriov_auto_provisioning@fair-allocation:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][174] ([Intel XE#4130])
>     [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-432/igt@xe_sriov_auto_provisioning@fair-allocation.html
> 
>    * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:
>      - shard-lnl:          NOTRUN -> [SKIP][175] ([Intel XE#4130])
>     [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-lnl-5/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html
> 
>    * igt@xe_sriov_flr@flr-vfs-parallel:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][176] ([Intel XE#4273])
>     [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-464/igt@xe_sriov_flr@flr-vfs-parallel.html
> 
>    * igt@xe_sriov_scheduling@nonpreempt-engine-resets:
>      - shard-bmg:          NOTRUN -> [SKIP][177] ([Intel XE#4351])
>     [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-3/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html
> 
>    
> #### Possible fixes ####
> 
>    * igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-off:
>      - shard-lnl:          [ABORT][178] ([Intel XE#4624]) -> [PASS][179] +1 other test pass
>     [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-lnl-7/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-off.html
>     [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-lnl-3/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-off.html
> 
>    * igt@kms_async_flips@async-flip-with-page-flip-events-atomic:
>      - shard-lnl:          [FAIL][180] ([Intel XE#3719] / [Intel XE#911]) -> [PASS][181] +3 other tests pass
>     [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html
>     [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html
> 
>    * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
>      - shard-dg2-set2:     [SKIP][182] ([Intel XE#2191]) -> [PASS][183]
>     [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
>     [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-432/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
> 
>    * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>      - shard-bmg:          [DMESG-WARN][184] ([Intel XE#3428]) -> [PASS][185] +2 other tests pass
>     [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
>     [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
> 
>    * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
>      - shard-dg2-set2:     [SKIP][186] ([Intel XE#309]) -> [PASS][187] +2 other tests pass
>     [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-dg2-464/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
>     [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-436/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
> 
>    * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
>      - shard-bmg:          [SKIP][188] ([Intel XE#2291]) -> [PASS][189] +4 other tests pass
>     [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
>     [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
> 
>    * igt@kms_display_modes@extended-mode-basic:
>      - shard-bmg:          [SKIP][190] ([Intel XE#4302]) -> [PASS][191]
>     [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-bmg-4/igt@kms_display_modes@extended-mode-basic.html
>     [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-1/igt@kms_display_modes@extended-mode-basic.html
> 
>    * igt@kms_dp_linktrain_fallback@dp-fallback:
>      - shard-bmg:          [SKIP][192] ([Intel XE#4294]) -> [PASS][193]
>     [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-bmg-4/igt@kms_dp_linktrain_fallback@dp-fallback.html
>     [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-3/igt@kms_dp_linktrain_fallback@dp-fallback.html
>      - shard-dg2-set2:     [SKIP][194] ([Intel XE#4331]) -> [PASS][195]
>     [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-dg2-464/igt@kms_dp_linktrain_fallback@dp-fallback.html
>     [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-432/igt@kms_dp_linktrain_fallback@dp-fallback.html
> 
>    * igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:
>      - shard-bmg:          [FAIL][196] ([Intel XE#3321]) -> [PASS][197] +1 other test pass
>     [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html
>     [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html
> 
>    * igt@kms_flip@2x-modeset-vs-vblank-race:
>      - shard-bmg:          [SKIP][198] ([Intel XE#2316]) -> [PASS][199] +6 other tests pass
>     [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-bmg-4/igt@kms_flip@2x-modeset-vs-vblank-race.html
>     [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-1/igt@kms_flip@2x-modeset-vs-vblank-race.html
> 
>    * igt@kms_flip@2x-plain-flip-fb-recreate:
>      - shard-dg2-set2:     [SKIP][200] ([Intel XE#310]) -> [PASS][201] +2 other tests pass
>     [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-dg2-464/igt@kms_flip@2x-plain-flip-fb-recreate.html
>     [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-432/igt@kms_flip@2x-plain-flip-fb-recreate.html
> 
>    * igt@kms_flip@flip-vs-expired-vblank-interruptible:
>      - shard-dg2-set2:     [FAIL][202] ([Intel XE#301]) -> [PASS][203] +1 other test pass
>     [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
>     [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
> 
>    * igt@kms_flip@flip-vs-expired-vblank@c-dp4:
>      - shard-dg2-set2:     [FAIL][204] ([Intel XE#301] / [Intel XE#3321]) -> [PASS][205]
>     [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html
>     [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html
> 
>    * igt@kms_flip@plain-flip-ts-check-interruptible:
>      - shard-lnl:          [FAIL][206] ([Intel XE#886]) -> [PASS][207] +1 other test pass
>     [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-lnl-3/igt@kms_flip@plain-flip-ts-check-interruptible.html
>     [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-lnl-1/igt@kms_flip@plain-flip-ts-check-interruptible.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:
>      - shard-dg2-set2:     [SKIP][208] ([Intel XE#656]) -> [PASS][209] +7 other tests pass
>     [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html
>     [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html
> 
>    * igt@kms_joiner@basic-force-big-joiner:
>      - shard-dg2-set2:     [SKIP][210] ([Intel XE#4328]) -> [PASS][211]
>     [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-dg2-464/igt@kms_joiner@basic-force-big-joiner.html
>     [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-432/igt@kms_joiner@basic-force-big-joiner.html
> 
>    * igt@kms_plane_cursor@viewport:
>      - shard-dg2-set2:     [FAIL][212] ([Intel XE#616]) -> [PASS][213] +1 other test pass
>     [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-dg2-436/igt@kms_plane_cursor@viewport.html
>     [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-436/igt@kms_plane_cursor@viewport.html
> 
>    * igt@kms_plane_multiple@2x-tiling-none:
>      - shard-dg2-set2:     [SKIP][214] ([Intel XE#4596]) -> [PASS][215]
>     [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-none.html
>     [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-432/igt@kms_plane_multiple@2x-tiling-none.html
> 
>    * igt@kms_plane_scaling@2x-scaler-multi-pipe:
>      - shard-bmg:          [SKIP][216] ([Intel XE#2571]) -> [PASS][217]
>     [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-bmg-4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
>     [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-3/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
> 
>    * igt@kms_pm_dc@dc6-psr:
>      - shard-lnl:          [FAIL][218] ([Intel XE#718]) -> [PASS][219] +1 other test pass
>     [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-lnl-6/igt@kms_pm_dc@dc6-psr.html
>     [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-lnl-2/igt@kms_pm_dc@dc6-psr.html
> 
>    * igt@kms_pm_rpm@modeset-non-lpsp:
>      - shard-dg2-set2:     [SKIP][220] ([Intel XE#836]) -> [PASS][221]
>     [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp.html
>     [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-463/igt@kms_pm_rpm@modeset-non-lpsp.html
> 
>    * igt@kms_setmode@clone-exclusive-crtc:
>      - shard-dg2-set2:     [SKIP][222] ([Intel XE#455]) -> [PASS][223]
>     [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-dg2-464/igt@kms_setmode@clone-exclusive-crtc.html
>     [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-436/igt@kms_setmode@clone-exclusive-crtc.html
> 
>    * igt@xe_exec_basic@multigpu-once-rebind:
>      - shard-dg2-set2:     [SKIP][224] ([Intel XE#1392]) -> [PASS][225] +5 other tests pass
>     [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-dg2-432/igt@xe_exec_basic@multigpu-once-rebind.html
>     [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-464/igt@xe_exec_basic@multigpu-once-rebind.html
> 
>    * igt@xe_module_load@load:
>      - shard-dg2-set2:     ([PASS][226], [PASS][227], [SKIP][228], [PASS][229], [PASS][230], [PASS][231], [PASS][232], [PASS][233], [PASS][234], [PASS][235], [PASS][236], [PASS][237], [PASS][238], [PASS][239], [PASS][240], [PASS][241], [PASS][242], [PASS][243], [PASS][244], [PASS][245], [PASS][246], [PASS][247], [PASS][248], [PASS][249], [PASS][250], [PASS][251]) ([Intel XE#378]) -> ([PASS][252], [PASS][253], [PASS][254], [PASS][255], [PASS][256], [PASS][257], [PASS][258], [PASS][259], [PASS][260], [PASS][261], [PASS][262], [PASS][263], [PASS][264], [PASS][265], [PASS][266], [PASS][267], [PASS][268], [PASS][269], [PASS][270], [PASS][271], [PASS][272], [PASS][273], [PASS][274], [PASS][275], [PASS][276])
>     [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-dg2-463/igt@xe_module_load@load.html
>     [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-dg2-436/igt@xe_module_load@load.html
>     [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-dg2-436/igt@xe_module_load@load.html
>     [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-dg2-436/igt@xe_module_load@load.html
>     [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-dg2-436/igt@xe_module_load@load.html
>     [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-dg2-433/igt@xe_module_load@load.html
>     [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-dg2-464/igt@xe_module_load@load.html
>     [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-dg2-464/igt@xe_module_load@load.html
>     [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-dg2-464/igt@xe_module_load@load.html
>     [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-dg2-464/igt@xe_module_load@load.html
>     [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-dg2-436/igt@xe_module_load@load.html
>     [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-dg2-436/igt@xe_module_load@load.html
>     [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-dg2-432/igt@xe_module_load@load.html
>     [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-dg2-432/igt@xe_module_load@load.html
>     [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-dg2-464/igt@xe_module_load@load.html
>     [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-dg2-464/igt@xe_module_load@load.html
>     [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-dg2-463/igt@xe_module_load@load.html
>     [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-dg2-433/igt@xe_module_load@load.html
>     [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-dg2-433/igt@xe_module_load@load.html
>     [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-dg2-463/igt@xe_module_load@load.html
>     [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-dg2-463/igt@xe_module_load@load.html
>     [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-dg2-433/igt@xe_module_load@load.html
>     [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-dg2-463/igt@xe_module_load@load.html
>     [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-dg2-464/igt@xe_module_load@load.html
>     [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-dg2-432/igt@xe_module_load@load.html
>     [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-dg2-432/igt@xe_module_load@load.html
>     [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-432/igt@xe_module_load@load.html
>     [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-463/igt@xe_module_load@load.html
>     [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-463/igt@xe_module_load@load.html
>     [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-463/igt@xe_module_load@load.html
>     [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-432/igt@xe_module_load@load.html
>     [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-432/igt@xe_module_load@load.html
>     [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-432/igt@xe_module_load@load.html
>     [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-432/igt@xe_module_load@load.html
>     [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-463/igt@xe_module_load@load.html
>     [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-463/igt@xe_module_load@load.html
>     [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-436/igt@xe_module_load@load.html
>     [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-463/igt@xe_module_load@load.html
>     [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-464/igt@xe_module_load@load.html
>     [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-464/igt@xe_module_load@load.html
>     [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-464/igt@xe_module_load@load.html
>     [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-432/igt@xe_module_load@load.html
>     [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-436/igt@xe_module_load@load.html
>     [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-436/igt@xe_module_load@load.html
>     [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-436/igt@xe_module_load@load.html
>     [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-464/igt@xe_module_load@load.html
>     [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-464/igt@xe_module_load@load.html
>     [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-464/igt@xe_module_load@load.html
>     [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-464/igt@xe_module_load@load.html
>     [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-436/igt@xe_module_load@load.html
>     [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-464/igt@xe_module_load@load.html
> 
>    * igt@xe_pm@s4-basic:
>      - shard-lnl:          [ABORT][277] ([Intel XE#1794]) -> [PASS][278]
>     [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-lnl-2/igt@xe_pm@s4-basic.html
>     [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-lnl-6/igt@xe_pm@s4-basic.html
> 
>    
> #### Warnings ####
> 
>    * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6:
>      - shard-dg2-set2:     [SKIP][279] ([Intel XE#787]) -> [SKIP][280] ([Intel XE#455] / [Intel XE#787]) +10 other tests skip
>     [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-dg2-433/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6.html
>     [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-464/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6.html
> 
>    * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-6:
>      - shard-dg2-set2:     [SKIP][281] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][282] ([Intel XE#787]) +7 other tests skip
>     [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-6.html
>     [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-463/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-6.html
> 
>    * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
>      - shard-dg2-set2:     [INCOMPLETE][283] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [INCOMPLETE][284] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
>     [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
>     [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
> 
>    * igt@kms_cdclk@mode-transition-all-outputs:
>      - shard-dg2-set2:     [SKIP][285] ([Intel XE#4440]) -> [SKIP][286] ([Intel XE#4418])
>     [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-dg2-464/igt@kms_cdclk@mode-transition-all-outputs.html
>     [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-463/igt@kms_cdclk@mode-transition-all-outputs.html
> 
>    * igt@kms_content_protection@atomic:
>      - shard-bmg:          [SKIP][287] ([Intel XE#2341]) -> [FAIL][288] ([Intel XE#1178])
>     [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-bmg-4/igt@kms_content_protection@atomic.html
>     [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-6/igt@kms_content_protection@atomic.html
> 
>    * igt@kms_content_protection@atomic-dpms:
>      - shard-dg2-set2:     [FAIL][289] ([Intel XE#1178]) -> [SKIP][290] ([Intel XE#455]) +1 other test skip
>     [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-dg2-463/igt@kms_content_protection@atomic-dpms.html
>     [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-464/igt@kms_content_protection@atomic-dpms.html
> 
>    * igt@kms_content_protection@lic-type-0:
>      - shard-dg2-set2:     [SKIP][291] ([Intel XE#455]) -> [FAIL][292] ([Intel XE#1178]) +1 other test fail
>     [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-dg2-464/igt@kms_content_protection@lic-type-0.html
>     [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-432/igt@kms_content_protection@lic-type-0.html
> 
>    * igt@kms_content_protection@srm:
>      - shard-bmg:          [FAIL][293] ([Intel XE#1178]) -> [SKIP][294] ([Intel XE#2341]) +1 other test skip
>     [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-bmg-2/igt@kms_content_protection@srm.html
>     [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-4/igt@kms_content_protection@srm.html
> 
>    * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
>      - shard-dg2-set2:     [SKIP][295] ([i915#3804]) -> [SKIP][296] ([Intel XE#4494] / [i915#3804])
>     [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-dg2-436/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
>     [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-436/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
> 
>    * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
>      - shard-bmg:          [SKIP][297] ([Intel XE#2316]) -> [FAIL][298] ([Intel XE#3321])
>     [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
>     [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
> 
>    * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
>      - shard-bmg:          [SKIP][299] ([Intel XE#2311]) -> [SKIP][300] ([Intel XE#2312]) +11 other tests skip
>     [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
>     [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
> 
>    * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
>      - shard-bmg:          [SKIP][301] ([Intel XE#2312]) -> [SKIP][302] ([Intel XE#2311]) +15 other tests skip
>     [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
>     [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>    * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
>      - shard-dg2-set2:     [SKIP][303] ([Intel XE#651]) -> [SKIP][304] ([Intel XE#656]) +15 other tests skip
>     [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
>     [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
>      - shard-bmg:          [SKIP][305] ([Intel XE#2312]) -> [SKIP][306] ([Intel XE#4141]) +7 other tests skip
>     [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
>     [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
>      - shard-bmg:          [SKIP][307] ([Intel XE#4141]) -> [SKIP][308] ([Intel XE#2312]) +4 other tests skip
>     [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
>     [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
> 
>    * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:
>      - shard-dg2-set2:     [SKIP][309] ([Intel XE#656]) -> [SKIP][310] ([Intel XE#651]) +18 other tests skip
>     [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html
>     [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:
>      - shard-bmg:          [SKIP][311] ([Intel XE#2313]) -> [SKIP][312] ([Intel XE#2312]) +12 other tests skip
>     [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html
>     [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
>      - shard-dg2-set2:     [SKIP][313] ([Intel XE#656]) -> [SKIP][314] ([Intel XE#653]) +18 other tests skip
>     [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
>     [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
> 
>    * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
>      - shard-dg2-set2:     [SKIP][315] ([Intel XE#653]) -> [SKIP][316] ([Intel XE#656]) +18 other tests skip
>     [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
>     [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
> 
>    * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
>      - shard-bmg:          [SKIP][317] ([Intel XE#2312]) -> [SKIP][318] ([Intel XE#2313]) +16 other tests skip
>     [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
>     [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
> 
>    * igt@kms_plane_multiple@2x-tiling-yf:
>      - shard-dg2-set2:     [SKIP][319] ([Intel XE#4596]) -> [SKIP][320] ([Intel XE#455])
>     [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-yf.html
>     [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-dg2-463/igt@kms_plane_multiple@2x-tiling-yf.html
> 
>    * igt@xe_module_load@load:
>      - shard-bmg:          ([PASS][321], [PASS][322], [PASS][323], [PASS][324], [PASS][325], [PASS][326], [PASS][327], [PASS][328], [DMESG-WARN][329], [PASS][330], [PASS][331], [PASS][332], [PASS][333], [PASS][334], [PASS][335], [PASS][336], [PASS][337], [SKIP][338], [PASS][339], [PASS][340], [PASS][341], [PASS][342], [PASS][343], [PASS][344], [PASS][345], [PASS][346]) ([Intel XE#2457] / [Intel XE#3428]) -> ([PASS][347], [PASS][348], [PASS][349], [PASS][350], [PASS][351], [PASS][352], [PASS][353], [PASS][354], [PASS][355], [PASS][356], [PASS][357], [PASS][358], [SKIP][359], [PASS][360], [PASS][361], [PASS][362], [PASS][363], [PASS][364], [PASS][365], [PASS][366], [PASS][367], [PASS][368], [PASS][369], [PASS][370], [PASS][371], [PASS][372]) ([Intel XE#2457])
>     [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-bmg-1/igt@xe_module_load@load.html
>     [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-bmg-4/igt@xe_module_load@load.html
>     [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-bmg-4/igt@xe_module_load@load.html
>     [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-bmg-2/igt@xe_module_load@load.html
>     [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-bmg-1/igt@xe_module_load@load.html
>     [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-bmg-3/igt@xe_module_load@load.html
>     [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-bmg-3/igt@xe_module_load@load.html
>     [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-bmg-3/igt@xe_module_load@load.html
>     [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-bmg-6/igt@xe_module_load@load.html
>     [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-bmg-6/igt@xe_module_load@load.html
>     [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-bmg-6/igt@xe_module_load@load.html
>     [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-bmg-7/igt@xe_module_load@load.html
>     [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-bmg-7/igt@xe_module_load@load.html
>     [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-bmg-7/igt@xe_module_load@load.html
>     [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-bmg-2/igt@xe_module_load@load.html
>     [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-bmg-2/igt@xe_module_load@load.html
>     [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-bmg-7/igt@xe_module_load@load.html
>     [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-bmg-6/igt@xe_module_load@load.html
>     [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-bmg-4/igt@xe_module_load@load.html
>     [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-bmg-4/igt@xe_module_load@load.html
>     [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-bmg-1/igt@xe_module_load@load.html
>     [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-bmg-1/igt@xe_module_load@load.html
>     [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-bmg-6/igt@xe_module_load@load.html
>     [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-bmg-4/igt@xe_module_load@load.html
>     [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-bmg-3/igt@xe_module_load@load.html
>     [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/shard-bmg-2/igt@xe_module_load@load.html
>     [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-7/igt@xe_module_load@load.html
>     [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-7/igt@xe_module_load@load.html
>     [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-7/igt@xe_module_load@load.html
>     [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-3/igt@xe_module_load@load.html
>     [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-2/igt@xe_module_load@load.html
>     [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-2/igt@xe_module_load@load.html
>     [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-3/igt@xe_module_load@load.html
>     [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-3/igt@xe_module_load@load.html
>     [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-7/igt@xe_module_load@load.html
>     [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-1/igt@xe_module_load@load.html
>     [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-1/igt@xe_module_load@load.html
>     [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-1/igt@xe_module_load@load.html
>     [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-1/igt@xe_module_load@load.html
>     [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-6/igt@xe_module_load@load.html
>     [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-6/igt@xe_module_load@load.html
>     [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-6/igt@xe_module_load@load.html
>     [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-4/igt@xe_module_load@load.html
>     [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-4/igt@xe_module_load@load.html
>     [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-4/igt@xe_module_load@load.html
>     [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-4/igt@xe_module_load@load.html
>     [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-4/igt@xe_module_load@load.html
>     [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-6/igt@xe_module_load@load.html
>     [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-2/igt@xe_module_load@load.html
>     [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-3/igt@xe_module_load@load.html
>     [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-1/igt@xe_module_load@load.html
>     [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/shard-bmg-2/igt@xe_module_load@load.html
> 
>    
>    [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>    [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
>    [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>    [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
>    [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>    [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>    [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>    [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>    [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>    [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>    [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>    [Intel XE#1450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450
>    [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
>    [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
>    [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>    [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>    [Intel XE#1504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504
>    [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
>    [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>    [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>    [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>    [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>    [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
>    [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
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
>    [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
>    [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
>    [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
>    [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
>    [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
>    [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
>    [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
>    [Intel XE#2568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568
>    [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
>    [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
>    [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>    [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
>    [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>    [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
>    [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>    [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>    [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
>    [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
>    [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>    [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
>    [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
>    [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
>    [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
>    [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
>    [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>    [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>    [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>    [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>    [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
>    [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
>    [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
>    [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>    [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
>    [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
>    [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
>    [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>    [Intel XE#3428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428
>    [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>    [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
>    [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>    [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>    [Intel XE#3719]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3719
>    [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>    [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
>    [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
>    [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>    [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
>    [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>    [Intel XE#4164]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4164
>    [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
>    [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
>    [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
>    [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
>    [Intel XE#4328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4328
>    [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
>    [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
>    [Intel XE#4418]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418
>    [Intel XE#4440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4440
>    [Intel XE#4494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494
>    [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
>    [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
>    [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>    [Intel XE#4577]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4577
>    [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
>    [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
>    [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
>    [Intel XE#4624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4624
>    [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
>    [Intel XE#4731]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4731
>    [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>    [Intel XE#4804]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4804
>    [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
>    [Intel XE#4821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4821
>    [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
>    [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>    [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>    [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>    [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>    [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
>    [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>    [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
>    [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>    [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>    [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
>    [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>    [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
>    [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>    [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>    [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
> 
> 
> Build changes
> -------------
> 
>    * IGT: IGT_8326 -> IGTPW_13001
>    * Linux: xe-2965-1afb38d5acb616dc76381ec0d80b081106146bbd -> xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6
> 
>    IGTPW_13001: 13001
>    IGT_8326: 8326
>    xe-2965-1afb38d5acb616dc76381ec0d80b081106146bbd: 1afb38d5acb616dc76381ec0d80b081106146bbd
>    xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6: 830407db6fa5a871d1a6fcba1e51b42899ff57f6
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13001/index.html
> 

