Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA76C19F32
	for <igt-dev@archiver.kernel.org>; Wed,  5 Mar 2025 12:57:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8632A10E09B;
	Wed,  5 Mar 2025 12:57:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EeRevpjl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 079A710E09B;
 Wed,  5 Mar 2025 12:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741179439; x=1772715439;
 h=message-id:date:mime-version:subject:to:references:cc:
 from:in-reply-to:content-transfer-encoding;
 bh=pW5prOcJvgJd6OKjs2otDYsQrrZ6jYEeMjnl6D6y0H0=;
 b=EeRevpjlBGTZxmbjtDhyZtWPmpVT+g8ANsFey5QPu7N8JSoV0+EdLvs0
 tJr4HiUwO6hzOI3A2w4fa3prue7orQynhBkMiD7g9kd9+zXWhcjwtOR2j
 90WyTSap8cwLLz4sFbmYjEmrpMSzedbpLp6QsYq+qXFm9bST3sJ+8yLRI
 dGOG0sDgjN/R2rY4gyjLggqQp4xdkkGlxDHNwNeqZRBMXaD0y0jCL1R4h
 MKorJ5ziLAek36BPL2OI3Z+ID91VG6eRBRhMiQJgHzZARXCUiBJYFahWv
 4zJS2Um+wiKWTjtV6CMIoD0xBVfS2lhSfvvnQHRUl2no7sT03/oat+WPv Q==;
X-CSE-ConnectionGUID: kqpkx6SFSTauxmc/lZnTpA==
X-CSE-MsgGUID: 8tByzn2rRz608I8M0fdbMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="45794539"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="45794539"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 04:57:19 -0800
X-CSE-ConnectionGUID: 0Qek5D1sTfCY6iYpNkJUfA==
X-CSE-MsgGUID: pqysV0ocThuQ4xR4uRORDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="123275325"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO [10.245.246.63])
 ([10.245.246.63])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 04:57:17 -0800
Message-ID: <7da56fe8-090b-4dfe-8f93-26f9b455c4b0@intel.com>
Date: Wed, 5 Mar 2025 13:57:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Ensure_that?=
 =?UTF-8?Q?_SR-IOV_and_eudebug_are_exclusive_for_Xe_=28rev3=29?=
To: igt-dev@lists.freedesktop.org
References: <20250304163227.49986-1-christoph.manszewski@intel.com>
 <174113847179.846965.1827734657022386608@b555e5b46a47>
Content-Language: en-US
Cc: I915-ci-infra@lists.freedesktop.org
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <174113847179.846965.1827734657022386608@b555e5b46a47>
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



On 5.03.2025 02:34, Patchwork wrote:
> == Series Details ==
> 
> Series: Ensure that SR-IOV and eudebug are exclusive for Xe (rev3)
> URL   : https://patchwork.freedesktop.org/series/144864/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8259_full -> XEIGTPW_12699_full
> ====================================================
> 
> Summary
> -------
> 
>    **FAILURE**
> 
>    Serious unknown changes coming with XEIGTPW_12699_full absolutely need to be
>    verified manually.
>    
>    If you think the reported changes have nothing to do with the changes
>    introduced in XEIGTPW_12699_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in CI.
> 
>    
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>    No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>    Here are the unknown changes that may have been introduced in XEIGTPW_12699_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>    * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:
>      - shard-dg2-set2:     NOTRUN -> [ABORT][1]
>     [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html
> 
>    * igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ac-hdmi-a6-dp4:
>      - shard-dg2-set2:     [PASS][2] -> [FAIL][3] +1 other test fail
>     [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-433/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ac-hdmi-a6-dp4.html
>     [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-434/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ac-hdmi-a6-dp4.html

These failures seem unrelated.

> 
>    * igt@xe_eudebug_sriov@deny-eudebug (NEW):
>      - shard-dg2-set2:     NOTRUN -> [SKIP][4] +1 other test skip
>     [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-434/igt@xe_eudebug_sriov@deny-eudebug.html
>      - shard-lnl:          NOTRUN -> [SKIP][5]
>     [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-5/igt@xe_eudebug_sriov@deny-eudebug.html
>      - shard-bmg:          NOTRUN -> [SKIP][6]
>     [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-2/igt@xe_eudebug_sriov@deny-eudebug.html

These skips are expected.

> 
>    
> New tests
> ---------
> 
>    New tests have been introduced between XEIGT_8259_full and XEIGTPW_12699_full:
> 
> ### New IGT tests (2) ###
> 
>    * igt@xe_eudebug_sriov@deny-eudebug:
>      - Statuses : 3 skip(s)
>      - Exec time: [0.0] s
> 
>    * igt@xe_eudebug_sriov@deny-sriov:
>      - Statuses :
>      - Exec time: [None] s
> 
>    
> 
> Known issues
> ------------
> 
>    Here are the changes found in XEIGTPW_12699_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>    * igt@core_hotunplug@hotreplug:
>      - shard-lnl:          NOTRUN -> [ABORT][7] ([Intel XE#3914])
>     [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-4/igt@core_hotunplug@hotreplug.html
> 
>    * igt@intel_hwmon@hwmon-write:
>      - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#1125])
>     [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-3/igt@intel_hwmon@hwmon-write.html
> 
>    * igt@kms_3d:
>      - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#1465])
>     [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-6/igt@kms_3d.html
> 
>    * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][10] ([Intel XE#623])
>     [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-464/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>    * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
>      - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#3157])
>     [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-3/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
> 
>    * igt@kms_async_flips@alternate-sync-async-flip:
>      - shard-bmg:          [PASS][12] -> [DMESG-WARN][13] ([Intel XE#4420])
>     [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip.html
>     [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip.html
> 
>    * igt@kms_async_flips@async-flip-suspend-resume@pipe-c-dp-4:
>      - shard-dg2-set2:     [PASS][14] -> [INCOMPLETE][15] ([Intel XE#4390]) +1 other test incomplete
>     [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-463/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-dp-4.html
>     [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-463/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-dp-4.html
> 
>    * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-6-4-mc-ccs:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#3767]) +15 other tests skip
>     [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-463/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-6-4-mc-ccs.html
> 
>    * igt@kms_async_flips@invalid-async-flip:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#873])
>     [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-436/igt@kms_async_flips@invalid-async-flip.html
> 
>    * igt@kms_atomic@plane-cursor-legacy@pipe-a-edp-1:
>      - shard-lnl:          [PASS][18] -> [DMESG-WARN][19] ([Intel XE#324]) +2 other tests dmesg-warn
>     [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-lnl-5/igt@kms_atomic@plane-cursor-legacy@pipe-a-edp-1.html
>     [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-8/igt@kms_atomic@plane-cursor-legacy@pipe-a-edp-1.html
> 
>    * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
>      - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#3279]) +1 other test skip
>     [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
> 
>    * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
>      - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2370])
>     [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
> 
>    * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>      - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#3658])
>     [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>    * igt@kms_big_fb@linear-32bpp-rotate-90:
>      - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#1407]) +2 other tests skip
>     [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-7/igt@kms_big_fb@linear-32bpp-rotate-90.html
> 
>    * igt@kms_big_fb@linear-8bpp-rotate-270:
>      - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2327]) +4 other tests skip
>     [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-2/igt@kms_big_fb@linear-8bpp-rotate-270.html
> 
>    * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#316]) +5 other tests skip
>     [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-432/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
> 
>    * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
>      - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#1124]) +19 other tests skip
>     [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-4/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html
> 
>    * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
>      - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#607])
>     [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
>      - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#607])
>     [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
>      - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#1477])
>     [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-6/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
> 
>    * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#1124]) +13 other tests skip
>     [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-464/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
>      - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#1124]) +10 other tests skip
>     [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-5/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
> 
>    * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
>      - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#2191])
>     [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
> 
>    * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#2191]) +1 other test skip
>     [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
> 
>    * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
>      - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
>     [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-8/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
> 
>    * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
>      - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#367]) +3 other tests skip
>     [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-4/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
>      - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#367])
>     [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-1/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
> 
>    * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#367]) +2 other tests skip
>     [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-434/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
>      - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#1512]) +2 other tests skip
>     [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-5/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
> 
>    * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc:
>      - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#2887]) +16 other tests skip
>     [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-8/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc.html
> 
>    * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#787]) +217 other tests skip
>     [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html
> 
>    * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-2:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#455] / [Intel XE#787]) +53 other tests skip
>     [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-432/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-2.html
> 
>    * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
>      - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#3432])
>     [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html
> 
>    * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#3442])
>     [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
> 
>    * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-hdmi-a-3:
>      - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2652] / [Intel XE#787]) +21 other tests skip
>     [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-hdmi-a-3.html
> 
>    * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
>      - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#3432]) +1 other test skip
>     [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html
> 
>    * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#2907]) +1 other test skip
>     [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
> 
>    * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
>      - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2887]) +21 other tests skip
>     [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
> 
>    * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
>      - shard-dg2-set2:     NOTRUN -> [ABORT][48] ([Intel XE#1727])
>     [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
> 
>    * igt@kms_cdclk@mode-transition:
>      - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2724])
>     [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-2/igt@kms_cdclk@mode-transition.html
> 
>    * igt@kms_cdclk@mode-transition-all-outputs:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#4418])
>     [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-433/igt@kms_cdclk@mode-transition-all-outputs.html
>      - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#4418])
>     [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-1/igt@kms_cdclk@mode-transition-all-outputs.html
> 
>    * igt@kms_cdclk@mode-transition@pipe-b-edp-1:
>      - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#4417]) +3 other tests skip
>     [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-6/igt@kms_cdclk@mode-transition@pipe-b-edp-1.html
> 
>    * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#4417]) +3 other tests skip
>     [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-434/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html
> 
>    * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#4416]) +3 other tests skip
>     [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-436/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html
> 
>    * igt@kms_chamelium_color@ctm-0-50:
>      - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2325]) +2 other tests skip
>     [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-8/igt@kms_chamelium_color@ctm-0-50.html
> 
>    * igt@kms_chamelium_color@ctm-limited-range:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#306])
>     [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-463/igt@kms_chamelium_color@ctm-limited-range.html
> 
>    * igt@kms_chamelium_color@ctm-max:
>      - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#306]) +1 other test skip
>     [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-1/igt@kms_chamelium_color@ctm-max.html
> 
>    * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#373]) +12 other tests skip
>     [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-464/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
> 
>    * igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:
>      - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2252]) +15 other tests skip
>     [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-7/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html
> 
>    * igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:
>      - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#373]) +10 other tests skip
>     [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-4/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html
> 
>    * igt@kms_content_protection@dp-mst-lic-type-1:
>      - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#307])
>     [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-5/igt@kms_content_protection@dp-mst-lic-type-1.html
> 
>    * igt@kms_content_protection@dp-mst-type-0:
>      - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#2390]) +1 other test skip
>     [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-7/igt@kms_content_protection@dp-mst-type-0.html
> 
>    * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
>      - shard-bmg:          NOTRUN -> [FAIL][63] ([Intel XE#1178]) +1 other test fail
>     [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-4/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html
> 
>    * igt@kms_content_protection@srm@pipe-a-dp-4:
>      - shard-dg2-set2:     NOTRUN -> [FAIL][64] ([Intel XE#1178]) +3 other tests fail
>     [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-434/igt@kms_content_protection@srm@pipe-a-dp-4.html
> 
>    * igt@kms_content_protection@type1:
>      - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#2341]) +1 other test skip
>     [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-2/igt@kms_content_protection@type1.html
>      - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#3278])
>     [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-5/igt@kms_content_protection@type1.html
> 
>    * igt@kms_cursor_crc@cursor-offscreen-256x85:
>      - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#2320]) +8 other tests skip
>     [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-256x85.html
> 
>    * igt@kms_cursor_crc@cursor-onscreen-512x170:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#308]) +1 other test skip
>     [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x170.html
>      - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#2321]) +1 other test skip
>     [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-512x170.html
> 
>    * igt@kms_cursor_crc@cursor-random-128x42:
>      - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#1424]) +6 other tests skip
>     [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-6/igt@kms_cursor_crc@cursor-random-128x42.html
> 
>    * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#323]) +1 other test skip
>     [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-464/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>    * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>      - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#323])
>     [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
> 
>    * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
>      - shard-bmg:          [PASS][73] -> [SKIP][74] ([Intel XE#2291])
>     [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
>     [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
>      - shard-dg2-set2:     [PASS][75] -> [SKIP][76] ([Intel XE#309]) +1 other test skip
>     [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-432/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
>     [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
> 
>    * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
>      - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#2291]) +1 other test skip
>     [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
> 
>    * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>      - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#2286])
>     [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
> 
>    * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
>      - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#1508])
>     [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-8/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
> 
>    * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
>      - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#4210])
>     [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-2/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
> 
>    * igt@kms_display_modes@extended-mode-basic:
>      - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#4302])
>     [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-8/igt@kms_display_modes@extended-mode-basic.html
> 
>    * igt@kms_dp_link_training@uhbr-mst:
>      - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#4354])
>     [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-6/igt@kms_dp_link_training@uhbr-mst.html
> 
>    * igt@kms_dp_link_training@uhbr-sst:
>      - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#4354])
>     [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-4/igt@kms_dp_link_training@uhbr-sst.html
> 
>    * igt@kms_dp_linktrain_fallback@dp-fallback:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#4331])
>     [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-464/igt@kms_dp_linktrain_fallback@dp-fallback.html
>      - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#4294])
>     [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-8/igt@kms_dp_linktrain_fallback@dp-fallback.html
> 
>    * igt@kms_dp_linktrain_fallback@dsc-fallback:
>      - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#4331])
>     [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-7/igt@kms_dp_linktrain_fallback@dsc-fallback.html
> 
>    * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
>      - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#2244]) +2 other tests skip
>     [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-8/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
> 
>    * igt@kms_dsc@dsc-with-bpc:
>      - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#2244])
>     [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-7/igt@kms_dsc@dsc-with-bpc.html
> 
>    * igt@kms_fbcon_fbt@psr-suspend:
>      - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#776])
>     [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-7/igt@kms_fbcon_fbt@psr-suspend.html
>      - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#776])
>     [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-436/igt@kms_fbcon_fbt@psr-suspend.html
> 
>    * igt@kms_feature_discovery@display-2x:
>      - shard-dg2-set2:     [PASS][91] -> [SKIP][92] ([Intel XE#702])
>     [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-434/igt@kms_feature_discovery@display-2x.html
>     [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-464/igt@kms_feature_discovery@display-2x.html
> 
>    * igt@kms_feature_discovery@display-4x:
>      - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#1138])
>     [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-8/igt@kms_feature_discovery@display-4x.html
> 
>    * igt@kms_feature_discovery@dp-mst:
>      - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#2375])
>     [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-7/igt@kms_feature_discovery@dp-mst.html
> 
>    * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
>      - shard-dg2-set2:     [PASS][95] -> [SKIP][96] ([Intel XE#310]) +3 other tests skip
>     [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-463/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html
>     [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-464/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html
> 
>    * igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:
>      - shard-bmg:          [PASS][97] -> [FAIL][98] ([Intel XE#3321]) +2 other tests fail
>     [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html
>     [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html
> 
>    * igt@kms_flip@2x-flip-vs-modeset:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#310]) +2 other tests skip
>     [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-464/igt@kms_flip@2x-flip-vs-modeset.html
>      - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#1421]) +6 other tests skip
>     [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-8/igt@kms_flip@2x-flip-vs-modeset.html
> 
>    * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
>      - shard-bmg:          [PASS][101] -> [SKIP][102] ([Intel XE#2316]) +1 other test skip
>     [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-bmg-8/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html
>     [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-4/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html
> 
>    * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
>      - shard-dg2-set2:     [PASS][103] -> [FAIL][104] ([Intel XE#3098] / [Intel XE#886])
>     [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-433/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
>     [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-434/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
> 
>    * igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ab-hdmi-a6-dp4:
>      - shard-dg2-set2:     [PASS][105] -> [FAIL][106] ([Intel XE#3098])
>     [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-433/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ab-hdmi-a6-dp4.html
>     [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-434/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ab-hdmi-a6-dp4.html
> 
>    * igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ac-dp2-hdmi-a3:
>      - shard-bmg:          [PASS][107] -> [FAIL][108] ([Intel XE#2882]) +5 other tests fail
>     [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-bmg-8/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ac-dp2-hdmi-a3.html
>     [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-8/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ac-dp2-hdmi-a3.html
> 
>    * igt@kms_flip@basic-plain-flip@d-hdmi-a3:
>      - shard-bmg:          [PASS][109] -> [DMESG-WARN][110] ([Intel XE#4330]) +8 other tests dmesg-warn
>     [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-bmg-7/igt@kms_flip@basic-plain-flip@d-hdmi-a3.html
>     [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-2/igt@kms_flip@basic-plain-flip@d-hdmi-a3.html
> 
>    * igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2:
>      - shard-bmg:          NOTRUN -> [FAIL][111] ([Intel XE#2882]) +2 other tests fail
>     [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-4/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2.html
> 
>    * igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:
>      - shard-lnl:          [PASS][112] -> [FAIL][113] ([Intel XE#886]) +1 other test fail
>     [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-lnl-3/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html
>     [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-4/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html
> 
>    * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a6:
>      - shard-dg2-set2:     [PASS][114] -> [FAIL][115] ([Intel XE#301])
>     [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a6.html
>     [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a6.html
> 
>    * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
>      - shard-lnl:          NOTRUN -> [FAIL][116] ([Intel XE#301]) +1 other test fail
>     [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
> 
>    * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
>      - shard-lnl:          NOTRUN -> [FAIL][117] ([Intel XE#301] / [Intel XE#3149]) +1 other test fail
>     [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
> 
>    * igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a2:
>      - shard-dg2-set2:     NOTRUN -> [FAIL][118] ([Intel XE#301]) +2 other tests fail
>     [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a2.html
> 
>    * igt@kms_flip@flip-vs-suspend@c-dp4:
>      - shard-dg2-set2:     [PASS][119] -> [INCOMPLETE][120] ([Intel XE#2049] / [Intel XE#2597])
>     [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-436/igt@kms_flip@flip-vs-suspend@c-dp4.html
>     [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-434/igt@kms_flip@flip-vs-suspend@c-dp4.html
> 
>    * igt@kms_flip@flip-vs-suspend@c-hdmi-a3:
>      - shard-bmg:          NOTRUN -> [INCOMPLETE][121] ([Intel XE#2049] / [Intel XE#2597])
>     [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-2/igt@kms_flip@flip-vs-suspend@c-hdmi-a3.html
> 
>    * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
>      - shard-bmg:          [PASS][122] -> [DMESG-WARN][123] ([Intel XE#2955])
>     [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-bmg-2/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
>     [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-2/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
> 
>    * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
>      - shard-bmg:          NOTRUN -> [SKIP][124] ([Intel XE#2293] / [Intel XE#2380]) +10 other tests skip
>     [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
> 
>    * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-default-mode:
>      - shard-lnl:          NOTRUN -> [SKIP][125] ([Intel XE#1401]) +3 other tests skip
>     [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-default-mode.html
> 
>    * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
>      - shard-lnl:          NOTRUN -> [SKIP][126] ([Intel XE#1401] / [Intel XE#1745]) +3 other tests skip
>     [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
> 
>    * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
>      - shard-lnl:          NOTRUN -> [SKIP][127] ([Intel XE#1397] / [Intel XE#1745])
>     [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html
> 
>    * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:
>      - shard-lnl:          NOTRUN -> [SKIP][128] ([Intel XE#1397])
>     [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html
> 
>    * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
>      - shard-bmg:          NOTRUN -> [SKIP][129] ([Intel XE#2293]) +10 other tests skip
>     [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html
> 
>    * igt@kms_force_connector_basic@force-connector-state:
>      - shard-lnl:          NOTRUN -> [SKIP][130] ([Intel XE#352])
>     [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-6/igt@kms_force_connector_basic@force-connector-state.html
> 
>    * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
>      - shard-bmg:          NOTRUN -> [SKIP][131] ([Intel XE#2311]) +39 other tests skip
>     [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
>      - shard-bmg:          NOTRUN -> [SKIP][132] ([Intel XE#4141]) +18 other tests skip
>     [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
>      - shard-lnl:          NOTRUN -> [SKIP][133] ([Intel XE#656]) +43 other tests skip
>     [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:
>      - shard-dg2-set2:     [PASS][134] -> [SKIP][135] ([Intel XE#656]) +3 other tests skip
>     [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html
>     [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-tiling-y:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][136] ([Intel XE#658])
>     [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
>      - shard-lnl:          NOTRUN -> [SKIP][137] ([Intel XE#1469])
>     [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
>      - shard-bmg:          NOTRUN -> [SKIP][138] ([Intel XE#2352])
>     [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
> 
>    * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][139] ([Intel XE#651]) +32 other tests skip
>     [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html
> 
>    * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:
>      - shard-lnl:          NOTRUN -> [SKIP][140] ([Intel XE#651]) +17 other tests skip
>     [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
>      - shard-bmg:          NOTRUN -> [SKIP][141] ([Intel XE#2313]) +44 other tests skip
>     [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][142] ([Intel XE#656]) +7 other tests skip
>     [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
> 
>    * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
>      - shard-bmg:          NOTRUN -> [SKIP][143] ([Intel XE#2312]) +24 other tests skip
>     [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
> 
>    * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][144] ([Intel XE#653]) +26 other tests skip
>     [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html
> 
>    * igt@kms_hdmi_inject@inject-audio:
>      - shard-lnl:          NOTRUN -> [SKIP][145] ([Intel XE#1470] / [Intel XE#2853])
>     [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-5/igt@kms_hdmi_inject@inject-audio.html
> 
>    * igt@kms_joiner@basic-big-joiner:
>      - shard-bmg:          NOTRUN -> [SKIP][146] ([Intel XE#346])
>     [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-4/igt@kms_joiner@basic-big-joiner.html
> 
>    * igt@kms_joiner@basic-force-big-joiner:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][147] ([Intel XE#4328])
>     [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-464/igt@kms_joiner@basic-force-big-joiner.html
> 
>    * igt@kms_joiner@invalid-modeset-ultra-joiner:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][148] ([Intel XE#2927])
>     [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-433/igt@kms_joiner@invalid-modeset-ultra-joiner.html
>      - shard-lnl:          NOTRUN -> [SKIP][149] ([Intel XE#2927])
>     [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-7/igt@kms_joiner@invalid-modeset-ultra-joiner.html
> 
>    * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
>      - shard-bmg:          NOTRUN -> [SKIP][150] ([Intel XE#4090])
>     [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-2/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
>      - shard-lnl:          NOTRUN -> [SKIP][151] ([Intel XE#4090])
>     [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-1/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
> 
>    * igt@kms_panel_fitting@atomic-fastset:
>      - shard-bmg:          NOTRUN -> [SKIP][152] ([Intel XE#2486])
>     [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-2/igt@kms_panel_fitting@atomic-fastset.html
> 
>    * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
>      - shard-dg2-set2:     NOTRUN -> [FAIL][153] ([Intel XE#616]) +5 other tests fail
>     [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-436/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html
> 
>    * igt@kms_plane_lowres@tiling-4:
>      - shard-lnl:          NOTRUN -> [SKIP][154] ([Intel XE#599]) +3 other tests skip
>     [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-4/igt@kms_plane_lowres@tiling-4.html
> 
>    * igt@kms_plane_scaling@2x-scaler-multi-pipe:
>      - shard-lnl:          NOTRUN -> [SKIP][155] ([Intel XE#309]) +2 other tests skip
>     [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-5/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
> 
>    * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][156] ([Intel XE#2763] / [Intel XE#455]) +3 other tests skip
>     [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
> 
>    * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c:
>      - shard-lnl:          NOTRUN -> [SKIP][157] ([Intel XE#2763]) +19 other tests skip
>     [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c.html
> 
>    * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][158] ([Intel XE#2763]) +5 other tests skip
>     [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html
> 
>    * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:
>      - shard-bmg:          NOTRUN -> [SKIP][159] ([Intel XE#2763]) +14 other tests skip
>     [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b.html
> 
>    * igt@kms_pm_backlight@fade:
>      - shard-bmg:          NOTRUN -> [SKIP][160] ([Intel XE#870]) +2 other tests skip
>     [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-7/igt@kms_pm_backlight@fade.html
> 
>    * igt@kms_pm_backlight@fade-with-suspend:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][161] ([Intel XE#870]) +1 other test skip
>     [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-463/igt@kms_pm_backlight@fade-with-suspend.html
> 
>    * igt@kms_pm_dc@dc3co-vpb-simulation:
>      - shard-bmg:          NOTRUN -> [SKIP][162] ([Intel XE#2391])
>     [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-7/igt@kms_pm_dc@dc3co-vpb-simulation.html
>      - shard-dg2-set2:     NOTRUN -> [SKIP][163] ([Intel XE#1122])
>     [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-432/igt@kms_pm_dc@dc3co-vpb-simulation.html
>      - shard-lnl:          NOTRUN -> [SKIP][164] ([Intel XE#736])
>     [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-7/igt@kms_pm_dc@dc3co-vpb-simulation.html
> 
>    * igt@kms_pm_dc@dc5-psr:
>      - shard-bmg:          NOTRUN -> [SKIP][165] ([Intel XE#2392])
>     [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-7/igt@kms_pm_dc@dc5-psr.html
> 
>    * igt@kms_pm_dc@dc5-retention-flops:
>      - shard-bmg:          NOTRUN -> [SKIP][166] ([Intel XE#3309])
>     [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-2/igt@kms_pm_dc@dc5-retention-flops.html
> 
>    * igt@kms_pm_dc@dc6-dpms:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][167] ([Intel XE#908]) +1 other test skip
>     [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html
>      - shard-lnl:          NOTRUN -> [FAIL][168] ([Intel XE#1430])
>     [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-1/igt@kms_pm_dc@dc6-dpms.html
>      - shard-bmg:          NOTRUN -> [FAIL][169] ([Intel XE#1430])
>     [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-4/igt@kms_pm_dc@dc6-dpms.html
> 
>    * igt@kms_pm_dc@dc6-psr:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][170] ([Intel XE#1129])
>     [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-433/igt@kms_pm_dc@dc6-psr.html
> 
>    * igt@kms_pm_dc@deep-pkgc:
>      - shard-bmg:          NOTRUN -> [SKIP][171] ([Intel XE#2505])
>     [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-8/igt@kms_pm_dc@deep-pkgc.html
>      - shard-lnl:          NOTRUN -> [FAIL][172] ([Intel XE#2029])
>     [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html
> 
>    * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
>      - shard-dg2-set2:     [PASS][173] -> [SKIP][174] ([Intel XE#836])
>     [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-436/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
>     [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-464/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
> 
>    * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][175] ([Intel XE#1489]) +11 other tests skip
>     [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-434/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html
> 
>    * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
>      - shard-lnl:          NOTRUN -> [SKIP][176] ([Intel XE#2893]) +2 other tests skip
>     [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-3/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html
> 
>    * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
>      - shard-bmg:          NOTRUN -> [SKIP][177] ([Intel XE#1489]) +15 other tests skip
>     [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-7/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
> 
>    * igt@kms_psr2_su@page_flip-nv12:
>      - shard-lnl:          NOTRUN -> [SKIP][178] ([Intel XE#1128])
>     [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-4/igt@kms_psr2_su@page_flip-nv12.html
> 
>    * igt@kms_psr@fbc-pr-cursor-blt:
>      - shard-bmg:          NOTRUN -> [SKIP][179] ([Intel XE#2234] / [Intel XE#2850]) +26 other tests skip
>     [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-4/igt@kms_psr@fbc-pr-cursor-blt.html
> 
>    * igt@kms_psr@fbc-psr2-primary-render:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][180] ([Intel XE#2850] / [Intel XE#929]) +20 other tests skip
>     [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-432/igt@kms_psr@fbc-psr2-primary-render.html
> 
>    * igt@kms_psr@pr-dpms:
>      - shard-lnl:          NOTRUN -> [SKIP][181] ([Intel XE#1406]) +3 other tests skip
>     [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-6/igt@kms_psr@pr-dpms.html
> 
>    * igt@kms_psr@psr2-cursor-render@edp-1:
>      - shard-lnl:          [PASS][182] -> [FAIL][183] ([Intel XE#3924]) +1 other test fail
>     [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-lnl-6/igt@kms_psr@psr2-cursor-render@edp-1.html
>     [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-7/igt@kms_psr@psr2-cursor-render@edp-1.html
> 
>    * igt@kms_psr@psr2-primary-render:
>      - shard-bmg:          NOTRUN -> [SKIP][184] ([Intel XE#2234])
>     [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-2/igt@kms_psr@psr2-primary-render.html
> 
>    * igt@kms_rotation_crc@primary-rotation-90:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][185] ([Intel XE#3414]) +2 other tests skip
>     [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-432/igt@kms_rotation_crc@primary-rotation-90.html
> 
>    * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>      - shard-bmg:          NOTRUN -> [SKIP][186] ([Intel XE#2330])
>     [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
> 
>    * igt@kms_rotation_crc@sprite-rotation-90:
>      - shard-lnl:          NOTRUN -> [SKIP][187] ([Intel XE#3414] / [Intel XE#3904])
>     [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-1/igt@kms_rotation_crc@sprite-rotation-90.html
> 
>    * igt@kms_setmode@basic-clone-single-crtc:
>      - shard-bmg:          NOTRUN -> [SKIP][188] ([Intel XE#1435]) +2 other tests skip
>     [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-4/igt@kms_setmode@basic-clone-single-crtc.html
> 
>    * igt@kms_setmode@invalid-clone-single-crtc-stealing:
>      - shard-lnl:          NOTRUN -> [SKIP][189] ([Intel XE#1435])
>     [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
> 
>    * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][190] ([Intel XE#1500])
>     [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>      - shard-lnl:          NOTRUN -> [SKIP][191] ([Intel XE#362])
>     [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>    * igt@kms_vrr@cmrr:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][192] ([Intel XE#2168])
>     [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-433/igt@kms_vrr@cmrr.html
> 
>    * igt@kms_vrr@flip-suspend:
>      - shard-bmg:          NOTRUN -> [SKIP][193] ([Intel XE#1499]) +3 other tests skip
>     [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-4/igt@kms_vrr@flip-suspend.html
> 
>    * igt@kms_vrr@flipline:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][194] ([Intel XE#455]) +21 other tests skip
>     [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-432/igt@kms_vrr@flipline.html
> 
>    * igt@kms_vrr@negative-basic:
>      - shard-dg2-set2:     [PASS][195] -> [SKIP][196] ([Intel XE#455])
>     [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-434/igt@kms_vrr@negative-basic.html
>     [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-464/igt@kms_vrr@negative-basic.html
> 
>    * igt@kms_writeback@writeback-fb-id:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][197] ([Intel XE#756])
>     [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-432/igt@kms_writeback@writeback-fb-id.html
> 
>    * igt@kms_writeback@writeback-fb-id-xrgb2101010:
>      - shard-bmg:          NOTRUN -> [SKIP][198] ([Intel XE#756]) +1 other test skip
>     [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-2/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
>      - shard-lnl:          NOTRUN -> [SKIP][199] ([Intel XE#756])
>     [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-1/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
> 
>    * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][200] ([Intel XE#1091] / [Intel XE#2849])
>     [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-463/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
>      - shard-lnl:          NOTRUN -> [SKIP][201] ([Intel XE#1091] / [Intel XE#2849])
>     [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-4/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
>      - shard-bmg:          NOTRUN -> [SKIP][202] ([Intel XE#1091] / [Intel XE#2849])
>     [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-8/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
> 
>    * igt@xe_compute@ccs-mode-basic:
>      - shard-lnl:          NOTRUN -> [SKIP][203] ([Intel XE#1447])
>     [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-4/igt@xe_compute@ccs-mode-basic.html
> 
>    * igt@xe_copy_basic@mem-set-linear-0x369:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][204] ([Intel XE#1126])
>     [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x369.html
> 
>    * igt@xe_eudebug@basic-vm-bind-ufence-reconnect:
>      - shard-bmg:          NOTRUN -> [SKIP][205] ([Intel XE#3889]) +2 other tests skip
>     [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-8/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html
>      - shard-dg2-set2:     NOTRUN -> [SKIP][206] ([Intel XE#3889])
>     [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-463/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html
>      - shard-lnl:          NOTRUN -> [SKIP][207] ([Intel XE#3889])
>     [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-3/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html
> 
>    * igt@xe_eudebug_online@resume-dss:
>      - shard-lnl:          NOTRUN -> [SKIP][208] ([Intel XE#2905]) +7 other tests skip
>     [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-1/igt@xe_eudebug_online@resume-dss.html
> 
>    * igt@xe_eudebug_online@single-step:
>      - shard-bmg:          NOTRUN -> [SKIP][209] ([Intel XE#2905]) +24 other tests skip
>     [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-4/igt@xe_eudebug_online@single-step.html
> 
>    * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:
>      - shard-lnl:          NOTRUN -> [SKIP][210] ([Intel XE#688]) +4 other tests skip
>     [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-3/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen.html
> 
>    * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][211] ([Intel XE#1392]) +3 other tests skip
>     [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html
> 
>    * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
>      - shard-dg2-set2:     [PASS][212] -> [SKIP][213] ([Intel XE#1392]) +5 other tests skip
>     [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-434/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
>     [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
> 
>    * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:
>      - shard-lnl:          NOTRUN -> [SKIP][214] ([Intel XE#1392]) +10 other tests skip
>     [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-5/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html
> 
>    * igt@xe_exec_basic@multigpu-once-null-rebind:
>      - shard-bmg:          NOTRUN -> [SKIP][215] ([Intel XE#2322]) +17 other tests skip
>     [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-8/igt@xe_exec_basic@multigpu-once-null-rebind.html
> 
>    * igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate:
>      - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][216] ([Intel XE#4330]) +1 other test dmesg-warn
>     [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-464/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate.html
> 
>    * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][217] ([Intel XE#288]) +36 other tests skip
>     [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
> 
>    * igt@xe_exec_sip_eudebug@breakpoint-writesip:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][218] ([Intel XE#2905]) +11 other tests skip
>     [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-463/igt@xe_exec_sip_eudebug@breakpoint-writesip.html
> 
>    * igt@xe_exec_threads@threads-hang-shared-vm-rebind:
>      - shard-dg2-set2:     [PASS][219] -> [DMESG-WARN][220] ([Intel XE#4330]) +8 other tests dmesg-warn
>     [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-433/igt@xe_exec_threads@threads-hang-shared-vm-rebind.html
>     [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-433/igt@xe_exec_threads@threads-hang-shared-vm-rebind.html
> 
>    * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][221] ([Intel XE#2229])
>     [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-433/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
>      - shard-lnl:          NOTRUN -> [SKIP][222] ([Intel XE#2229])
>     [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
> 
>    * igt@xe_media_fill@media-fill:
>      - shard-bmg:          NOTRUN -> [SKIP][223] ([Intel XE#2459] / [Intel XE#2596])
>     [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-4/igt@xe_media_fill@media-fill.html
> 
>    * igt@xe_mmap@pci-membarrier-parallel:
>      - shard-lnl:          NOTRUN -> [SKIP][224] ([Intel XE#4045])
>     [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-6/igt@xe_mmap@pci-membarrier-parallel.html
> 
>    * igt@xe_mmap@small-bar:
>      - shard-bmg:          NOTRUN -> [SKIP][225] ([Intel XE#586])
>     [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-8/igt@xe_mmap@small-bar.html
> 
>    * igt@xe_module_load@force-load:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][226] ([Intel XE#378])
>     [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-463/igt@xe_module_load@force-load.html
> 
>    * igt@xe_oa@whitelisted-registers-userspace-config:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][227] ([Intel XE#2541] / [Intel XE#3573]) +9 other tests skip
>     [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-436/igt@xe_oa@whitelisted-registers-userspace-config.html
> 
>    * igt@xe_pm@d3cold-mmap-vram:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][228] ([Intel XE#2284] / [Intel XE#366]) +3 other tests skip
>     [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-434/igt@xe_pm@d3cold-mmap-vram.html
> 
>    * igt@xe_pm@s3-d3cold-basic-exec:
>      - shard-bmg:          NOTRUN -> [SKIP][229] ([Intel XE#2284]) +3 other tests skip
>     [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-8/igt@xe_pm@s3-d3cold-basic-exec.html
> 
>    * igt@xe_pm@s4-basic-exec:
>      - shard-dg2-set2:     NOTRUN -> [ABORT][230] ([Intel XE#4268])
>     [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-436/igt@xe_pm@s4-basic-exec.html
>      - shard-lnl:          NOTRUN -> [ABORT][231] ([Intel XE#4268])
>     [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-8/igt@xe_pm@s4-basic-exec.html
> 
>    * igt@xe_pm@s4-d3cold-basic-exec:
>      - shard-lnl:          NOTRUN -> [SKIP][232] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
>     [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-6/igt@xe_pm@s4-d3cold-basic-exec.html
> 
>    * igt@xe_pm@s4-exec-after:
>      - shard-bmg:          NOTRUN -> [ABORT][233] ([Intel XE#4268])
>     [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-8/igt@xe_pm@s4-exec-after.html
> 
>    * igt@xe_pm_residency@cpg-basic:
>      - shard-bmg:          NOTRUN -> [DMESG-WARN][234] ([Intel XE#4330]) +5 other tests dmesg-warn
>     [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-2/igt@xe_pm_residency@cpg-basic.html
>      - shard-lnl:          NOTRUN -> [SKIP][235] ([Intel XE#584]) +2 other tests skip
>     [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-1/igt@xe_pm_residency@cpg-basic.html
> 
>    * igt@xe_query@multigpu-query-config:
>      - shard-bmg:          NOTRUN -> [SKIP][236] ([Intel XE#944]) +4 other tests skip
>     [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-4/igt@xe_query@multigpu-query-config.html
> 
>    * igt@xe_query@multigpu-query-topology:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][237] ([Intel XE#944]) +3 other tests skip
>     [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-432/igt@xe_query@multigpu-query-topology.html
> 
>    * igt@xe_query@multigpu-query-topology-l3-bank-mask:
>      - shard-lnl:          NOTRUN -> [SKIP][238] ([Intel XE#944]) +3 other tests skip
>     [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-5/igt@xe_query@multigpu-query-topology-l3-bank-mask.html
> 
>    * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
>      - shard-bmg:          NOTRUN -> [SKIP][239] ([Intel XE#4130]) +2 other tests skip
>     [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-2/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html
> 
>    * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][240] ([Intel XE#4130]) +1 other test skip
>     [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-432/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html
> 
>    * igt@xe_sriov_flr@flr-each-isolation:
>      - shard-lnl:          NOTRUN -> [SKIP][241] ([Intel XE#3342])
>     [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-8/igt@xe_sriov_flr@flr-each-isolation.html
> 
>    * igt@xe_sriov_flr@flr-vfs-parallel:
>      - shard-bmg:          NOTRUN -> [SKIP][242] ([Intel XE#4273]) +1 other test skip
>     [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-4/igt@xe_sriov_flr@flr-vfs-parallel.html
> 
>    * igt@xe_sriov_scheduling@equal-throughput:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][243] ([Intel XE#4351])
>     [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-432/igt@xe_sriov_scheduling@equal-throughput.html
>      - shard-bmg:          NOTRUN -> [SKIP][244] ([Intel XE#4351])
>     [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-4/igt@xe_sriov_scheduling@equal-throughput.html
> 
>    
> #### Possible fixes ####
> 
>    * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing:
>      - shard-dg2-set2:     [DMESG-WARN][245] ([Intel XE#4330]) -> [PASS][246] +30 other tests pass
>     [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-434/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing.html
>     [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-434/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing.html
> 
>    * igt@kms_big_fb@4-tiled-8bpp-rotate-0:
>      - shard-dg2-set2:     [SKIP][247] ([Intel XE#829]) -> [PASS][248]
>     [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-436/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html
>     [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-436/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html
> 
>    * igt@kms_cursor_crc@cursor-suspend:
>      - shard-lnl:          [DMESG-WARN][249] ([Intel XE#2932]) -> [PASS][250] +1 other test pass
>     [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-lnl-1/igt@kms_cursor_crc@cursor-suspend.html
>     [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-8/igt@kms_cursor_crc@cursor-suspend.html
> 
>    * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
>      - shard-bmg:          [SKIP][251] ([Intel XE#2291]) -> [PASS][252] +1 other test pass
>     [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
>     [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
> 
>    * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
>      - shard-dg2-set2:     [SKIP][253] ([Intel XE#309]) -> [PASS][254] +3 other tests pass
>     [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-464/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
>     [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-434/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
> 
>    * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
>      - shard-bmg:          [DMESG-WARN][255] ([Intel XE#877]) -> [PASS][256] +1 other test pass
>     [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
>     [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
> 
>    * igt@kms_flip@2x-blocking-wf_vblank:
>      - shard-bmg:          [SKIP][257] ([Intel XE#2316]) -> [PASS][258] +2 other tests pass
>     [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-bmg-4/igt@kms_flip@2x-blocking-wf_vblank.html
>     [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-2/igt@kms_flip@2x-blocking-wf_vblank.html
> 
>    * igt@kms_flip@2x-dpms-vs-vblank-race:
>      - shard-dg2-set2:     [SKIP][259] -> [PASS][260] +5 other tests pass
>     [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-436/igt@kms_flip@2x-dpms-vs-vblank-race.html
>     [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-433/igt@kms_flip@2x-dpms-vs-vblank-race.html
> 
>    * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
>      - shard-bmg:          [FAIL][261] ([Intel XE#3321]) -> [PASS][262] +1 other test pass
>     [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
>     [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
> 
>    * igt@kms_flip@2x-plain-flip-fb-recreate:
>      - shard-bmg:          [INCOMPLETE][263] ([Intel XE#2049]) -> [PASS][264] +1 other test pass
>     [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate.html
>     [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-7/igt@kms_flip@2x-plain-flip-fb-recreate.html
> 
>    * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
>      - shard-dg2-set2:     [SKIP][265] ([Intel XE#310]) -> [PASS][266] +3 other tests pass
>     [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-464/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
>     [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-434/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
> 
>    * igt@kms_flip@2x-plain-flip-ts-check@ac-dp2-hdmi-a3:
>      - shard-bmg:          [FAIL][267] ([Intel XE#2882]) -> [PASS][268] +4 other tests pass
>     [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-bmg-7/igt@kms_flip@2x-plain-flip-ts-check@ac-dp2-hdmi-a3.html
>     [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-2/igt@kms_flip@2x-plain-flip-ts-check@ac-dp2-hdmi-a3.html
> 
>    * igt@kms_flip@flip-vs-dpms-off-vs-modeset:
>      - shard-dg2-set2:     [DMESG-WARN][269] ([Intel XE#2955]) -> [PASS][270]
>     [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-432/igt@kms_flip@flip-vs-dpms-off-vs-modeset.html
>     [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-432/igt@kms_flip@flip-vs-dpms-off-vs-modeset.html
> 
>    * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:
>      - shard-dg2-set2:     [FAIL][271] ([Intel XE#301]) -> [PASS][272] +3 other tests pass
>     [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html
>     [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html
> 
>    * igt@kms_flip@flip-vs-panning@d-dp2:
>      - shard-bmg:          [DMESG-WARN][273] ([Intel XE#4330]) -> [PASS][274] +8 other tests pass
>     [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-bmg-4/igt@kms_flip@flip-vs-panning@d-dp2.html
>     [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-8/igt@kms_flip@flip-vs-panning@d-dp2.html
> 
>    * igt@kms_flip@flip-vs-suspend-interruptible:
>      - shard-bmg:          [INCOMPLETE][275] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][276] +1 other test pass
>     [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible.html
>     [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-4/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>    * igt@kms_flip@plain-flip-fb-recreate@a-edp1:
>      - shard-lnl:          [FAIL][277] ([Intel XE#886]) -> [PASS][278] +1 other test pass
>     [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-lnl-3/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html
>     [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-7/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:
>      - shard-dg2-set2:     [SKIP][279] ([Intel XE#656]) -> [PASS][280] +2 other tests pass
>     [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html
>     [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html
> 
>    * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-d:
>      - shard-dg2-set2:     [DMESG-WARN][281] ([Intel XE#2566] / [Intel XE#4330]) -> [PASS][282] +1 other test pass
>     [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-d.html
>     [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-d.html
> 
>    * igt@kms_pm_rpm@dpms-non-lpsp:
>      - shard-dg2-set2:     [SKIP][283] ([Intel XE#836]) -> [PASS][284]
>     [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-464/igt@kms_pm_rpm@dpms-non-lpsp.html
>     [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-436/igt@kms_pm_rpm@dpms-non-lpsp.html
> 
>    * igt@kms_pm_rpm@system-suspend-modeset:
>      - shard-dg2-set2:     [DMESG-WARN][285] ([Intel XE#2042] / [Intel XE#4330]) -> [PASS][286]
>     [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-434/igt@kms_pm_rpm@system-suspend-modeset.html
>     [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-434/igt@kms_pm_rpm@system-suspend-modeset.html
> 
>    * igt@kms_sequence@get-forked@pipe-b-edp-1:
>      - shard-lnl:          [INCOMPLETE][287] -> [PASS][288] +1 other test pass
>     [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-lnl-1/igt@kms_sequence@get-forked@pipe-b-edp-1.html
>     [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-3/igt@kms_sequence@get-forked@pipe-b-edp-1.html
> 
>    * igt@kms_setmode@clone-exclusive-crtc:
>      - shard-dg2-set2:     [SKIP][289] ([Intel XE#455]) -> [PASS][290]
>     [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-464/igt@kms_setmode@clone-exclusive-crtc.html
>     [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-436/igt@kms_setmode@clone-exclusive-crtc.html
> 
>    * igt@xe_evict@evict-beng-large-multi-vm:
>      - shard-dg2-set2:     [DMESG-WARN][291] ([Intel XE#1473] / [Intel XE#4330]) -> [PASS][292]
>     [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-434/igt@xe_evict@evict-beng-large-multi-vm.html
>     [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-436/igt@xe_evict@evict-beng-large-multi-vm.html
> 
>    * igt@xe_evict@evict-large-external-cm:
>      - shard-bmg:          [DMESG-WARN][293] ([Intel XE#1473] / [Intel XE#4330]) -> [PASS][294]
>     [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-bmg-4/igt@xe_evict@evict-large-external-cm.html
>     [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-7/igt@xe_evict@evict-large-external-cm.html
> 
>    * igt@xe_evict@evict-small-external:
>      - shard-dg2-set2:     [INCOMPLETE][295] ([Intel XE#1473]) -> [PASS][296]
>     [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-432/igt@xe_evict@evict-small-external.html
>     [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-433/igt@xe_evict@evict-small-external.html
> 
>    * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:
>      - shard-dg2-set2:     [SKIP][297] ([Intel XE#1392]) -> [PASS][298] +2 other tests pass
>     [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html
>     [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-434/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html
> 
>    * igt@xe_module_load@load:
>      - shard-lnl:          ([PASS][299], [PASS][300], [PASS][301], [PASS][302], [PASS][303], [PASS][304], [PASS][305], [PASS][306], [PASS][307], [PASS][308], [SKIP][309], [PASS][310], [PASS][311], [PASS][312], [PASS][313], [PASS][314], [PASS][315], [PASS][316], [PASS][317], [PASS][318], [PASS][319], [PASS][320], [PASS][321], [PASS][322], [PASS][323], [PASS][324]) ([Intel XE#378]) -> ([PASS][325], [PASS][326], [PASS][327], [PASS][328], [PASS][329], [PASS][330], [PASS][331], [PASS][332], [PASS][333], [PASS][334], [PASS][335], [PASS][336], [PASS][337], [PASS][338], [PASS][339], [PASS][340], [PASS][341], [PASS][342], [PASS][343], [PASS][344], [PASS][345], [PASS][346], [PASS][347], [PASS][348], [PASS][349])
>     [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-lnl-5/igt@xe_module_load@load.html
>     [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-lnl-5/igt@xe_module_load@load.html
>     [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-lnl-6/igt@xe_module_load@load.html
>     [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-lnl-3/igt@xe_module_load@load.html
>     [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-lnl-1/igt@xe_module_load@load.html
>     [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-lnl-3/igt@xe_module_load@load.html
>     [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-lnl-5/igt@xe_module_load@load.html
>     [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-lnl-6/igt@xe_module_load@load.html
>     [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-lnl-6/igt@xe_module_load@load.html
>     [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-lnl-6/igt@xe_module_load@load.html
>     [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-lnl-1/igt@xe_module_load@load.html
>     [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-lnl-3/igt@xe_module_load@load.html
>     [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-lnl-8/igt@xe_module_load@load.html
>     [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-lnl-8/igt@xe_module_load@load.html
>     [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-lnl-3/igt@xe_module_load@load.html
>     [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-lnl-7/igt@xe_module_load@load.html
>     [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-lnl-1/igt@xe_module_load@load.html
>     [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-lnl-8/igt@xe_module_load@load.html
>     [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-lnl-8/igt@xe_module_load@load.html
>     [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-lnl-4/igt@xe_module_load@load.html
>     [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-lnl-4/igt@xe_module_load@load.html
>     [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-lnl-1/igt@xe_module_load@load.html
>     [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-lnl-4/igt@xe_module_load@load.html
>     [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-lnl-4/igt@xe_module_load@load.html
>     [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-lnl-7/igt@xe_module_load@load.html
>     [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-lnl-7/igt@xe_module_load@load.html
>     [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-5/igt@xe_module_load@load.html
>     [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-7/igt@xe_module_load@load.html
>     [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-4/igt@xe_module_load@load.html
>     [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-5/igt@xe_module_load@load.html
>     [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-8/igt@xe_module_load@load.html
>     [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-5/igt@xe_module_load@load.html
>     [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-8/igt@xe_module_load@load.html
>     [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-1/igt@xe_module_load@load.html
>     [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-1/igt@xe_module_load@load.html
>     [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-3/igt@xe_module_load@load.html
>     [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-1/igt@xe_module_load@load.html
>     [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-7/igt@xe_module_load@load.html
>     [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-7/igt@xe_module_load@load.html
>     [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-7/igt@xe_module_load@load.html
>     [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-4/igt@xe_module_load@load.html
>     [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-3/igt@xe_module_load@load.html
>     [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-3/igt@xe_module_load@load.html
>     [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-6/igt@xe_module_load@load.html
>     [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-6/igt@xe_module_load@load.html
>     [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-6/igt@xe_module_load@load.html
>     [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-8/igt@xe_module_load@load.html
>     [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-1/igt@xe_module_load@load.html
>     [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-8/igt@xe_module_load@load.html
>     [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-4/igt@xe_module_load@load.html
>     [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-lnl-4/igt@xe_module_load@load.html
>      - shard-bmg:          ([PASS][350], [PASS][351], [PASS][352], [PASS][353], [PASS][354], [PASS][355], [PASS][356], [PASS][357], [PASS][358], [PASS][359], [PASS][360], [PASS][361], [PASS][362], [PASS][363], [PASS][364], [PASS][365], [PASS][366], [PASS][367], [PASS][368], [SKIP][369]) ([Intel XE#2457]) -> ([PASS][370], [PASS][371], [PASS][372], [PASS][373], [PASS][374], [PASS][375], [PASS][376], [PASS][377], [PASS][378], [PASS][379], [PASS][380], [PASS][381], [PASS][382], [PASS][383], [PASS][384], [PASS][385], [PASS][386], [PASS][387])
>     [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-bmg-4/igt@xe_module_load@load.html
>     [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-bmg-8/igt@xe_module_load@load.html
>     [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-bmg-8/igt@xe_module_load@load.html
>     [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-bmg-8/igt@xe_module_load@load.html
>     [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-bmg-7/igt@xe_module_load@load.html
>     [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-bmg-7/igt@xe_module_load@load.html
>     [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-bmg-7/igt@xe_module_load@load.html
>     [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-bmg-4/igt@xe_module_load@load.html
>     [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-bmg-7/igt@xe_module_load@load.html
>     [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-bmg-4/igt@xe_module_load@load.html
>     [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-bmg-2/igt@xe_module_load@load.html
>     [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-bmg-4/igt@xe_module_load@load.html
>     [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-bmg-4/igt@xe_module_load@load.html
>     [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-bmg-8/igt@xe_module_load@load.html
>     [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-bmg-2/igt@xe_module_load@load.html
>     [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-bmg-2/igt@xe_module_load@load.html
>     [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-bmg-2/igt@xe_module_load@load.html
>     [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-bmg-2/igt@xe_module_load@load.html
>     [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-bmg-4/igt@xe_module_load@load.html
>     [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-bmg-2/igt@xe_module_load@load.html
>     [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-4/igt@xe_module_load@load.html
>     [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-4/igt@xe_module_load@load.html
>     [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-7/igt@xe_module_load@load.html
>     [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-7/igt@xe_module_load@load.html
>     [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-7/igt@xe_module_load@load.html
>     [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-2/igt@xe_module_load@load.html
>     [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-4/igt@xe_module_load@load.html
>     [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-8/igt@xe_module_load@load.html
>     [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-2/igt@xe_module_load@load.html
>     [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-8/igt@xe_module_load@load.html
>     [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-7/igt@xe_module_load@load.html
>     [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-4/igt@xe_module_load@load.html
>     [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-4/igt@xe_module_load@load.html
>     [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-8/igt@xe_module_load@load.html
>     [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-2/igt@xe_module_load@load.html
>     [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-4/igt@xe_module_load@load.html
>     [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-8/igt@xe_module_load@load.html
>     [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-2/igt@xe_module_load@load.html
>      - shard-dg2-set2:     ([PASS][388], [PASS][389], [PASS][390], [PASS][391], [PASS][392], [PASS][393], [PASS][394], [PASS][395], [PASS][396], [PASS][397], [PASS][398], [PASS][399], [PASS][400], [PASS][401], [PASS][402], [PASS][403], [PASS][404], [PASS][405], [PASS][406], [PASS][407], [PASS][408], [PASS][409], [PASS][410], [SKIP][411], [PASS][412], [PASS][413]) ([Intel XE#378]) -> ([PASS][414], [PASS][415], [PASS][416], [PASS][417], [PASS][418], [PASS][419], [PASS][420], [PASS][421], [PASS][422], [PASS][423], [PASS][424], [PASS][425], [PASS][426], [PASS][427], [PASS][428], [PASS][429], [PASS][430], [PASS][431], [PASS][432], [PASS][433], [PASS][434], [PASS][435], [PASS][436], [PASS][437], [PASS][438])
>     [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-434/igt@xe_module_load@load.html
>     [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-434/igt@xe_module_load@load.html
>     [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-434/igt@xe_module_load@load.html
>     [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-434/igt@xe_module_load@load.html
>     [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-432/igt@xe_module_load@load.html
>     [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-432/igt@xe_module_load@load.html
>     [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-432/igt@xe_module_load@load.html
>     [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-434/igt@xe_module_load@load.html
>     [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-432/igt@xe_module_load@load.html
>     [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-436/igt@xe_module_load@load.html
>     [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-436/igt@xe_module_load@load.html
>     [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-436/igt@xe_module_load@load.html
>     [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-433/igt@xe_module_load@load.html
>     [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-464/igt@xe_module_load@load.html
>     [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-433/igt@xe_module_load@load.html
>     [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-433/igt@xe_module_load@load.html
>     [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-433/igt@xe_module_load@load.html
>     [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-463/igt@xe_module_load@load.html
>     [406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-463/igt@xe_module_load@load.html
>     [407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-464/igt@xe_module_load@load.html
>     [408]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-463/igt@xe_module_load@load.html
>     [409]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-464/igt@xe_module_load@load.html
>     [410]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-463/igt@xe_module_load@load.html
>     [411]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-464/igt@xe_module_load@load.html
>     [412]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-464/igt@xe_module_load@load.html
>     [413]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-464/igt@xe_module_load@load.html
>     [414]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-433/igt@xe_module_load@load.html
>     [415]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-436/igt@xe_module_load@load.html
>     [416]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-463/igt@xe_module_load@load.html
>     [417]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-436/igt@xe_module_load@load.html
>     [418]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-433/igt@xe_module_load@load.html
>     [419]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-436/igt@xe_module_load@load.html
>     [420]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-436/igt@xe_module_load@load.html
>     [421]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-432/igt@xe_module_load@load.html
>     [422]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-432/igt@xe_module_load@load.html
>     [423]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-434/igt@xe_module_load@load.html
>     [424]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-434/igt@xe_module_load@load.html
>     [425]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-432/igt@xe_module_load@load.html
>     [426]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-464/igt@xe_module_load@load.html
>     [427]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-464/igt@xe_module_load@load.html
>     [428]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-464/igt@xe_module_load@load.html
>     [429]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-434/igt@xe_module_load@load.html
>     [430]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-464/igt@xe_module_load@load.html
>     [431]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-463/igt@xe_module_load@load.html
>     [432]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-463/igt@xe_module_load@load.html
>     [433]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-433/igt@xe_module_load@load.html
>     [434]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-463/igt@xe_module_load@load.html
>     [435]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-464/igt@xe_module_load@load.html
>     [436]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-464/igt@xe_module_load@load.html
>     [437]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-432/igt@xe_module_load@load.html
>     [438]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-433/igt@xe_module_load@load.html
> 
>    * igt@xe_module_load@reload-no-display:
>      - shard-dg2-set2:     [FAIL][439] -> [PASS][440]
>     [439]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-436/igt@xe_module_load@reload-no-display.html
>     [440]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-436/igt@xe_module_load@reload-no-display.html
> 
>    
> #### Warnings ####
> 
>    * igt@kms_big_fb@linear-64bpp-rotate-90:
>      - shard-dg2-set2:     [SKIP][441] ([Intel XE#829]) -> [SKIP][442] ([Intel XE#316])
>     [441]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-436/igt@kms_big_fb@linear-64bpp-rotate-90.html
>     [442]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-433/igt@kms_big_fb@linear-64bpp-rotate-90.html
> 
>    * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
>      - shard-dg2-set2:     [SKIP][443] ([Intel XE#829]) -> [SKIP][444] ([Intel XE#1124])
>     [443]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-436/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html
>     [444]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-436/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html
> 
>    * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
>      - shard-dg2-set2:     [SKIP][445] ([Intel XE#829]) -> [SKIP][446] ([Intel XE#2907]) +1 other test skip
>     [445]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-436/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
>     [446]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
> 
>    * igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-d-hdmi-a-6:
>      - shard-dg2-set2:     [SKIP][447] ([Intel XE#787]) -> [SKIP][448] ([Intel XE#455] / [Intel XE#787]) +4 other tests skip
>     [447]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-433/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-d-hdmi-a-6.html
>     [448]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-464/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-d-hdmi-a-6.html
> 
>    * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6:
>      - shard-dg2-set2:     [SKIP][449] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][450] ([Intel XE#787]) +7 other tests skip
>     [449]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html
>     [450]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html
> 
>    * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
>      - shard-dg2-set2:     [INCOMPLETE][451] ([Intel XE#3862]) -> [DMESG-WARN][452] ([Intel XE#4199])
>     [451]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
>     [452]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
> 
>    * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
>      - shard-dg2-set2:     [INCOMPLETE][453] ([Intel XE#3862]) -> [DMESG-WARN][454] ([Intel XE#4330])
>     [453]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html
>     [454]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html
> 
>    * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
>      - shard-dg2-set2:     [SKIP][455] ([Intel XE#829]) -> [SKIP][456] ([Intel XE#455] / [Intel XE#787])
>     [455]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html
>     [456]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html
> 
>    * igt@kms_chamelium_color@ctm-green-to-red:
>      - shard-dg2-set2:     [SKIP][457] -> [SKIP][458] ([Intel XE#306])
>     [457]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-436/igt@kms_chamelium_color@ctm-green-to-red.html
>     [458]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-436/igt@kms_chamelium_color@ctm-green-to-red.html
> 
>    * igt@kms_chamelium_hpd@common-hpd-after-hibernate:
>      - shard-dg2-set2:     [SKIP][459] -> [SKIP][460] ([Intel XE#373])
>     [459]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-436/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html
>     [460]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-433/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html
> 
>    * igt@kms_content_protection@legacy:
>      - shard-bmg:          [DMESG-FAIL][461] ([Intel XE#4330]) -> [FAIL][462] ([Intel XE#1178]) +1 other test fail
>     [461]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-bmg-2/igt@kms_content_protection@legacy.html
>     [462]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-8/igt@kms_content_protection@legacy.html
>      - shard-dg2-set2:     [SKIP][463] ([Intel XE#455]) -> [FAIL][464] ([Intel XE#1178]) +1 other test fail
>     [463]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-464/igt@kms_content_protection@legacy.html
>     [464]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-432/igt@kms_content_protection@legacy.html
> 
>    * igt@kms_content_protection@uevent:
>      - shard-dg2-set2:     [SKIP][465] -> [SKIP][466] ([Intel XE#455]) +1 other test skip
>     [465]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-436/igt@kms_content_protection@uevent.html
>     [466]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-464/igt@kms_content_protection@uevent.html
> 
>    * igt@kms_dp_link_training@uhbr-sst:
>      - shard-dg2-set2:     [SKIP][467] -> [SKIP][468] ([Intel XE#4356])
>     [467]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-436/igt@kms_dp_link_training@uhbr-sst.html
>     [468]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-432/igt@kms_dp_link_training@uhbr-sst.html
> 
>    * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
>      - shard-bmg:          [FAIL][469] ([Intel XE#3321]) -> [SKIP][470] ([Intel XE#2316])
>     [469]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
>     [470]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
> 
>    * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
>      - shard-dg2-set2:     [DMESG-WARN][471] ([Intel XE#2955]) -> [SKIP][472] ([Intel XE#310])
>     [471]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-432/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
>     [472]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-464/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
> 
>    * igt@kms_flip@flip-vs-expired-vblank-interruptible:
>      - shard-dg2-set2:     [DMESG-FAIL][473] ([Intel XE#4330]) -> [FAIL][474] ([Intel XE#301])
>     [473]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
>     [474]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
> 
>    * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:
>      - shard-dg2-set2:     [DMESG-WARN][475] ([Intel XE#4330]) -> [FAIL][476] ([Intel XE#301])
>     [475]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html
>     [476]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html
> 
>    * igt@kms_flip@flip-vs-suspend:
>      - shard-dg2-set2:     [DMESG-WARN][477] ([Intel XE#2955]) -> [INCOMPLETE][478] ([Intel XE#2049] / [Intel XE#2597])
>     [477]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-436/igt@kms_flip@flip-vs-suspend.html
>     [478]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-434/igt@kms_flip@flip-vs-suspend.html
> 
>    * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt:
>      - shard-dg2-set2:     [SKIP][479] -> [SKIP][480] ([Intel XE#656])
>     [479]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt.html
>     [480]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
>      - shard-bmg:          [SKIP][481] ([Intel XE#4141]) -> [SKIP][482] ([Intel XE#2312]) +4 other tests skip
>     [481]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
>     [482]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:
>      - shard-bmg:          [SKIP][483] ([Intel XE#2312]) -> [SKIP][484] ([Intel XE#4141])
>     [483]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html
>     [484]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html
> 
>    * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt:
>      - shard-dg2-set2:     [SKIP][485] -> [SKIP][486] ([Intel XE#651]) +3 other tests skip
>     [485]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt.html
>     [486]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt.html
> 
>    * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:
>      - shard-bmg:          [SKIP][487] ([Intel XE#2312]) -> [SKIP][488] ([Intel XE#2311]) +5 other tests skip
>     [487]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html
>     [488]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html
> 
>    * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt:
>      - shard-bmg:          [SKIP][489] ([Intel XE#2311]) -> [SKIP][490] ([Intel XE#2312]) +1 other test skip
>     [489]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt.html
>     [490]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt.html
> 
>    * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:
>      - shard-dg2-set2:     [SKIP][491] ([Intel XE#651]) -> [SKIP][492] ([Intel XE#656]) +6 other tests skip
>     [491]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html
>     [492]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html
> 
>    * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
>      - shard-dg2-set2:     [SKIP][493] ([Intel XE#656]) -> [SKIP][494] ([Intel XE#651]) +9 other tests skip
>     [493]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
>     [494]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
> 
>    * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render:
>      - shard-dg2-set2:     [SKIP][495] -> [SKIP][496] ([Intel XE#653])
>     [495]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render.html
>     [496]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render.html
> 
>    * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:
>      - shard-bmg:          [SKIP][497] ([Intel XE#2313]) -> [SKIP][498] ([Intel XE#2312]) +4 other tests skip
>     [497]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html
>     [498]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html
> 
>    * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
>      - shard-dg2-set2:     [SKIP][499] ([Intel XE#653]) -> [SKIP][500] ([Intel XE#656]) +4 other tests skip
>     [499]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
>     [500]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
> 
>    * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc:
>      - shard-dg2-set2:     [SKIP][501] ([Intel XE#783]) -> [SKIP][502] ([Intel XE#653]) +1 other test skip
>     [501]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html
>     [502]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html
> 
>    * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
>      - shard-bmg:          [SKIP][503] ([Intel XE#2312]) -> [SKIP][504] ([Intel XE#2313]) +2 other tests skip
>     [503]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
>     [504]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
> 
>    * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
>      - shard-dg2-set2:     [SKIP][505] ([Intel XE#656]) -> [SKIP][506] ([Intel XE#653]) +7 other tests skip
>     [505]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html
>     [506]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html
> 
>    * igt@kms_pm_backlight@fade-with-dpms:
>      - shard-dg2-set2:     [SKIP][507] -> [SKIP][508] ([Intel XE#870])
>     [507]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-436/igt@kms_pm_backlight@fade-with-dpms.html
>     [508]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-464/igt@kms_pm_backlight@fade-with-dpms.html
> 
>    * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
>      - shard-dg2-set2:     [SKIP][509] -> [SKIP][510] ([Intel XE#1489]) +1 other test skip
>     [509]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-436/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html
>     [510]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html
> 
>    * igt@kms_psr@psr-cursor-plane-move:
>      - shard-dg2-set2:     [SKIP][511] -> [SKIP][512] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
>     [511]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-436/igt@kms_psr@psr-cursor-plane-move.html
>     [512]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-464/igt@kms_psr@psr-cursor-plane-move.html
> 
>    * igt@kms_tiled_display@basic-test-pattern:
>      - shard-dg2-set2:     [SKIP][513] ([Intel XE#362]) -> [FAIL][514] ([Intel XE#1729])
>     [513]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8259/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
>     [514]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern.html
> 
>    
>    [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
>    [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>    [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>    [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
>    [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>    [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
>    [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
>    [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
>    [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>    [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>    [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
>    [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>    [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>    [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>    [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>    [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>    [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
>    [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>    [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
>    [Intel XE#1465]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465
>    [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
>    [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
>    [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>    [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
>    [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>    [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>    [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
>    [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
>    [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
>    [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>    [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
>    [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>    [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
>    [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
>    [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>    [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
>    [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>    [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
>    [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>    [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
>    [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>    [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>    [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
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
>    [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
>    [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
>    [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
>    [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
>    [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
>    [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
>    [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
>    [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
>    [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
>    [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
>    [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
>    [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
>    [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
>    [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
>    [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
>    [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
>    [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
>    [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>    [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
>    [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>    [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
>    [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>    [Intel XE#2853]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853
>    [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>    [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
>    [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>    [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
>    [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
>    [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
>    [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
>    [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
>    [Intel XE#2932]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932
>    [Intel XE#2955]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955
>    [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>    [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>    [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>    [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>    [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>    [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
>    [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
>    [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
>    [Intel XE#3157]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3157
>    [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>    [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>    [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>    [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
>    [Intel XE#3279]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279
>    [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
>    [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
>    [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
>    [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>    [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>    [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
>    [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
>    [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
>    [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
>    [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
>    [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
>    [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>    [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>    [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>    [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
>    [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
>    [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
>    [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
>    [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>    [Intel XE#3914]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3914
>    [Intel XE#3924]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3924
>    [Intel XE#4045]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4045
>    [Intel XE#4090]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090
>    [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
>    [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>    [Intel XE#4199]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4199
>    [Intel XE#4210]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210
>    [Intel XE#4268]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268
>    [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
>    [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
>    [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
>    [Intel XE#4328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4328
>    [Intel XE#4330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330
>    [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
>    [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
>    [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
>    [Intel XE#4356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356
>    [Intel XE#4390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4390
>    [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
>    [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
>    [Intel XE#4418]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418
>    [Intel XE#4420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4420
>    [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>    [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
>    [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
>    [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>    [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
>    [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>    [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
>    [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>    [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>    [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>    [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
>    [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>    [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
>    [Intel XE#736]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/736
>    [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>    [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
>    [Intel XE#783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/783
>    [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>    [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
>    [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
>    [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>    [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
>    [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
>    [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>    [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
>    [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>    [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> 
> 
> Build changes
> -------------
> 
>    * IGT: IGT_8259 -> IGTPW_12699
> 
>    IGTPW_12699: 12699
>    IGT_8259: 4252087362da9aa06b1a2280f7439bbb0af03aa6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    xe-2754-ff2d693d88726e29a1d87291105135c31c21fa26: ff2d693d88726e29a1d87291105135c31c21fa26
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12699/index.html
> 
