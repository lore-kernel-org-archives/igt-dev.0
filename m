Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC00DCCD18E
	for <igt-dev@archiver.kernel.org>; Wed, 15 Oct 2025 04:43:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9534810E042;
	Wed, 15 Oct 2025 04:43:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K0zivMVr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30AE510E042
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Oct 2025 04:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760503402; x=1792039402;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to; bh=xvHA3mB+0L0Eu2th5Ak4j1dkHcVoi7P0nQNWCEEHEO8=;
 b=K0zivMVrJpSkmyLHFvP3F7gW/i/IBEa05JILf6plW60IwHhPxaF7kTml
 HZArwARSpHUnSOenWCOzaIV6w37accHZTDChRrWMCyrQZuxaQAVerw76n
 kuLOgvWADxcQr1RLGXY32YoMdRSILDwByJf3FfKM0HjqX317pQk0+TL04
 pgscUVQNgkjba5qXywuRFJheWQsm+IsCQdMRdyrIFIwjHgT4wwZ2Xe1y6
 51PO5dkDXDsSoRXVPuIW0Tfs+U1Jy+GWQhaHnEDkoFKaE49maRRAC6LoQ
 tFbVjowvKeocSWVCdHkqO9ukaBp5kVwpiphf5/FNWRrZyTT13bsVy2aCH Q==;
X-CSE-ConnectionGUID: Q+39bGFeTFeDDrZ2dHYaIw==
X-CSE-MsgGUID: 5QGpXtzmSqq1maD0nxJ9MA==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="50234228"
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; d="scan'208,217";a="50234228"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 21:43:21 -0700
X-CSE-ConnectionGUID: v5HUB7pBSTSe2Y6JqNDVPw==
X-CSE-MsgGUID: X/2hw4cyR7+vyUQEmdIhRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; 
 d="scan'208,217";a="181278777"
Received: from bmclain-mobl1.amr.corp.intel.com (HELO [10.125.20.218])
 ([10.125.20.218])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 21:43:19 -0700
Content-Type: multipart/alternative;
 boundary="------------iFiZVvhl0Kejx3GMyXLS0hHn"
Message-ID: <e8d7ae6f-0cdd-446a-a01c-db992b160eff@intel.com>
Date: Wed, 15 Oct 2025 10:13:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_extend_lobf?=
 =?UTF-8?Q?_test_for_supported_connectors_=28rev3=29?=
To: igt-dev@lists.freedesktop.org
References: <20250922074401.2494339-1-kunal1.joshi@intel.com>
 <175876614268.364597.3686002471693698924@1538d3639d33>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <175876614268.364597.3686002471693698924@1538d3639d33>
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

This is a multi-part message in MIME format.
--------------iFiZVvhl0Kejx3GMyXLS0hHn
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

Changes are made only in kms_vrr test, Failures reported
are not related to the patch series.

Will merge this patch series.

On 25-09-2025 07:39, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	extend lobf test for supported connectors (rev3)
> *URL:* 	https://patchwork.freedesktop.org/series/154689/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/index.html
>
>
>   CI Bug Log - changes from XEIGT_8552_FULL -> XEIGTPW_13810_FULL
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with XEIGTPW_13810_FULL absolutely need 
> to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_13810_FULL, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (4 -> 3)
>
> Missing (1): shard-adlp
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> XEIGTPW_13810_FULL:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>  *
>
>     igt@kms_pm_rpm@basic-rte:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-2/igt@kms_pm_rpm@basic-rte.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-1/igt@kms_pm_rpm@basic-rte.html>
>
Not related.
>
>  *
>
>  *
>
>     igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-vram01:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-1/igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-vram01.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-1/igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-vram01.html>
>         +6 other tests dmesg-warn
>
Not related.
>
>  *
>
>
>         Warnings
>
>   * igt@xe_sriov_auto_provisioning@selfconfig-basic:
>       o shard-bmg: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-3/igt@xe_sriov_auto_provisioning@selfconfig-basic.html>
>         (Intel XE#6190
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6190>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-1/igt@xe_sriov_auto_provisioning@selfconfig-basic.html>
>
Not related.
>
>  *
>
>
>     Known issues
>
> Here are the changes found in XEIGTPW_13810_FULL that come from known 
> issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@kms_big_fb@x-tiled-8bpp-rotate-270:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html>
>         (Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +4
>         other tests skip
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-4/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html>
>         (Intel XE#2327
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327>) +1
>         other test skip
>  *
>
>     igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html>
>         (Intel XE#607
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/607>)
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-lnl-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +1
>         other test skip
>  *
>
>     igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-464/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>)
>         +11 other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-addfb-size-overflow:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html>
>         (Intel XE#610
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/610>)
>  *
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +2
>         other tests skip
>  *
>
>     igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html>
>         (Intel XE#2314
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314> /
>         Intel XE#2894
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894>)
>  *
>
>     igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html>
>         (Intel XE#2191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>) +1
>         other test skip
>  *
>
>     igt@kms_bw@linear-tiling-1-displays-1920x1080p:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-8/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>  *
>
>     igt@kms_bw@linear-tiling-3-displays-3840x2160p:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-463/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +1
>         other test skip
>  *
>
>     igt@kms_bw@linear-tiling-4-displays-2160x1440p:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-lnl-8/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html>
>         (Intel XE#1512
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512>)
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html>
>         (Intel XE#3432
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432>)
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2.html>
>         (Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>)
>         +174 other tests skip
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html>
>         (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +5
>         other tests skip
>  *
>
>     igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-lnl-2/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc.html>
>         (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +4
>         other tests skip
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html>
>         (Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> /
>         Intel XE#3113
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113> /
>         Intel XE#4345
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345>)
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html>
>         (Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> /
>         Intel XE#3113
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113>)
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html>
>         (Intel XE#2907
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907>) +1
>         other test skip
>  *
>
>     igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +41
>         other tests skip
>  *
>
>     igt@kms_chamelium_color@ctm-limited-range:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-432/igt@kms_chamelium_color@ctm-limited-range.html>
>         (Intel XE#306
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) +4
>         other tests skip
>  *
>
>     igt@kms_chamelium_color@ctm-red-to-blue:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-8/igt@kms_chamelium_color@ctm-red-to-blue.html>
>         (Intel XE#2325
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-lnl-7/igt@kms_chamelium_color@ctm-red-to-blue.html>
>         (Intel XE#306
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>)
>  *
>
>     igt@kms_chamelium_hpd@common-hpd-after-suspend:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-5/igt@kms_chamelium_hpd@common-hpd-after-suspend.html>
>         (Intel XE#2252
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252>) +4
>         other tests skip
>  *
>
>     igt@kms_chamelium_hpd@vga-hpd:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-466/igt@kms_chamelium_hpd@vga-hpd.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +11
>         other tests skip
>  *
>
>     igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-lnl-7/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>)
>  *
>
>     igt@kms_content_protection@atomic:
>
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-463/igt@kms_content_protection@atomic.html>
>         (Intel XE#1178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>) +4
>         other tests fail
>  *
>
>     igt@kms_content_protection@dp-mst-lic-type-1:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-463/igt@kms_content_protection@dp-mst-lic-type-1.html>
>         (Intel XE#307
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>)
>  *
>
>     igt@kms_content_protection@mei-interface:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-5/igt@kms_content_protection@mei-interface.html>
>         (Intel XE#2341
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341>) +1
>         other test skip
>  *
>
>     igt@kms_content_protection@type1:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-lnl-3/igt@kms_content_protection@type1.html>
>         (Intel XE#3278
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278>)
>  *
>
>     igt@kms_cursor_crc@cursor-offscreen-512x170:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-464/igt@kms_cursor_crc@cursor-offscreen-512x170.html>
>         (Intel XE#308
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>) +2
>         other tests skip
>  *
>
>     igt@kms_cursor_crc@cursor-random-512x170:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-2/igt@kms_cursor_crc@cursor-random-512x170.html>
>         (Intel XE#2321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321>)
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-64x21:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-64x21.html>
>         (Intel XE#2320
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320>) +2
>         other tests skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-lnl-2/igt@kms_cursor_crc@cursor-sliding-64x21.html>
>         (Intel XE#1424
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424>)
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html>
>         (Intel XE#2291
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291>) +3
>         other tests skip
>  *
>
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html>
>         (Intel XE#2286
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286>)
>  *
>
>     igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-466/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html>
>         (Intel XE#4494
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494> /
>         i915#3804
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804>)
>  *
>
>     igt@kms_dp_aux_dev:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-4/igt@kms_dp_aux_dev.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-6/igt@kms_dp_aux_dev.html>
>         (Intel XE#3009
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009>)
>  *
>
>     igt@kms_dp_linktrain_fallback@dp-fallback:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-7/igt@kms_dp_linktrain_fallback@dp-fallback.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html>
>         (Intel XE#4294
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294>)
>  *
>
>     igt@kms_dsc@dsc-basic:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-lnl-2/igt@kms_dsc@dsc-basic.html>
>         (Intel XE#2244
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244>)
>  *
>
>     igt@kms_feature_discovery@display-2x:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-7/igt@kms_feature_discovery@display-2x.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-6/igt@kms_feature_discovery@display-2x.html>
>         (Intel XE#2373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373>)
>  *
>
>     igt@kms_feature_discovery@display-3x:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-2/igt@kms_feature_discovery@display-3x.html>
>         (Intel XE#2373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373>)
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-464/igt@kms_feature_discovery@display-3x.html>
>         (Intel XE#703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/703>)
>  *
>
>     igt@kms_feature_discovery@psr2:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-436/igt@kms_feature_discovery@psr2.html>
>         (Intel XE#1135
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135>)
>  *
>
>     igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-8/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html>
>         (Intel XE#2316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) +2
>         other tests skip
>  *
>
>     igt@kms_flip@2x-plain-flip:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-lnl-1/igt@kms_flip@2x-plain-flip.html>
>         (Intel XE#1421
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421>)
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank-interruptible:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html>
>         (Intel XE#3321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321>) +1
>         other test fail
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank@c-edp1:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301> /
>         Intel XE#3149
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149>) +1
>         other test fail
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html>
>         (Intel XE#1401
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401> /
>         Intel XE#1745
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html>
>         (Intel XE#1401
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html>
>         (Intel XE#1397
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397> /
>         Intel XE#1745
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode.html>
>         (Intel XE#1397
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +24
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-blt:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-blt.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +1
>         other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>)
>         +11 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html>
>         (Intel XE#5390
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390>) +6
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +37
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>)
>         +16 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html>
>         (Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +38
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) +1
>         other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html>
>         (Intel XE#656
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +15
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@pipe-fbc-rte:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html>
>         (Intel XE#5672
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5672>)
>  *
>
>     igt@kms_hdr@static-toggle:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-2/igt@kms_hdr@static-toggle.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-6/igt@kms_hdr@static-toggle.html>
>         (Intel XE#1503
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503>)
>  *
>
>     igt@kms_panel_fitting@legacy:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-5/igt@kms_panel_fitting@legacy.html>
>         (Intel XE#2486
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486>)
>  *
>
>     igt@kms_plane_multiple@2x-tiling-4:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-4.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-4.html>
>         (Intel XE#4596
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596>)
>  *
>
>     igt@kms_plane_multiple@2x-tiling-yf:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-466/igt@kms_plane_multiple@2x-tiling-yf.html>
>         (Intel XE#5021
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021>)
>  *
>
>     igt@kms_plane_multiple@tiling-yf:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-433/igt@kms_plane_multiple@tiling-yf.html>
>         (Intel XE#5020
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020>)
>  *
>
>     igt@kms_pm_backlight@brightness-with-dpms:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-436/igt@kms_pm_backlight@brightness-with-dpms.html>
>         (Intel XE#2938
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938>)
>  *
>
>     igt@kms_pm_dc@dc5-dpms:
>
>       o shard-lnl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-lnl-2/igt@kms_pm_dc@dc5-dpms.html>
>         (Intel XE#718
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/718>)
>  *
>
>     igt@kms_pm_dc@dc5-retention-flops:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-466/igt@kms_pm_dc@dc5-retention-flops.html>
>         (Intel XE#3309
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309>)
>  *
>
>     igt@kms_pm_dc@dc6-psr:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-463/igt@kms_pm_dc@dc6-psr.html>
>         (Intel XE#1129
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129>)
>  *
>
>     igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html>
>         (Intel XE#1439
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439> /
>         Intel XE#3141
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141> /
>         Intel XE#836
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/836>)
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-464/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>)
>         +12 other tests skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#2893
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893> /
>         Intel XE#4608
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608>)
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#4608
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608>) +1
>         other test skip
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +4
>         other tests skip
>  *
>
>     igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-lnl-8/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#2893
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893>) +2
>         other tests skip
>  *
>
>     igt@kms_psr@fbc-psr-sprite-render:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-render.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> /
>         Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +17
>         other tests skip
>  *
>
>     igt@kms_psr@psr2-sprite-blt:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-5/igt@kms_psr@psr2-sprite-blt.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#2234
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234> /
>         Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850>) +5
>         other tests skip
>  *
>
>     igt@kms_rotation_crc@bad-tiling:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-432/igt@kms_rotation_crc@bad-tiling.html>
>         (Intel XE#3414
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414>) +3
>         other tests skip
>  *
>
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html>
>         (Intel XE#1127
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127>) +1
>         other test skip
>  *
>
>     igt@kms_rotation_crc@sprite-rotation-90:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-lnl-1/igt@kms_rotation_crc@sprite-rotation-90.html>
>         (Intel XE#3414
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414> /
>         Intel XE#3904
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904>)
>  *
>
>     igt@kms_setmode@invalid-clone-single-crtc:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-5/igt@kms_setmode@invalid-clone-single-crtc.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html>
>         (Intel XE#1435
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435>)
>  *
>
>     igt@kms_setmode@invalid-clone-single-crtc-stealing:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-lnl-8/igt@kms_setmode@invalid-clone-single-crtc-stealing.html>
>         (Intel XE#1435
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435>)
>  *
>
>     igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
>
>       o shard-bmg: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-1/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html>
>         (Intel XE#6190
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6190>)
>  *
>
>     igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-1/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-1/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01.html>
>         (Intel XE#6213
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6213>) +1
>         other test abort
>  *
>
>     igt@xe_compute_preempt@compute-preempt-many:
>
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-466/igt@xe_compute_preempt@compute-preempt-many.html>
>         (Intel XE#5890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5890>) +1
>         other test fail
>  *
>
>     igt@xe_configfs@survivability-mode:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-432/igt@xe_configfs@survivability-mode.html>
>         (Intel XE#6010
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6010>)
>  *
>
>     igt@xe_copy_basic@mem-set-linear-0xfffe:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0xfffe.html>
>         (Intel XE#1126
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126>)
>  *
>
>     igt@xe_eu_stall@invalid-event-report-count:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-434/igt@xe_eu_stall@invalid-event-report-count.html>
>         (Intel XE#5626
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626>) +3
>         other tests skip
>  *
>
>     igt@xe_eudebug@basic-read-event:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-2/igt@xe_eudebug@basic-read-event.html>
>         (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837>) +6
>         other tests skip
>  *
>
>     igt@xe_eudebug_online@interrupt-other-debuggable:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-lnl-1/igt@xe_eudebug_online@interrupt-other-debuggable.html>
>         (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837>) +3
>         other tests skip
>  *
>
>     igt@xe_evict@evict-large-external-cm:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-lnl-1/igt@xe_evict@evict-large-external-cm.html>
>         (Intel XE#688
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +1
>         other test skip
>  *
>
>     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html>
>         (Intel XE#2322
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322>) +1
>         other test skip
>  *
>
>     igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html>
>         (Intel XE#1392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +1
>         other test skip
>  *
>
>     igt@xe_exec_basic@multigpu-no-exec-rebind:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-rebind.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-rebind.html>
>         (Intel XE#1392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +4
>         other tests skip
>  *
>
>     igt@xe_exec_basic@multigpu-once-null-rebind:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-lnl-1/igt@xe_exec_basic@multigpu-once-null-rebind.html>
>         (Intel XE#1392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>)
>  *
>
>     igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html>
>         (Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +28
>         other tests skip
>  *
>
>     igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-436/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html>
>         (Intel XE#2360
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360>)
>  *
>
>     igt@xe_exec_sip_eudebug@breakpoint-writesip:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-432/igt@xe_exec_sip_eudebug@breakpoint-writesip.html>
>         (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837>)
>         +16 other tests skip
>  *
>
>     igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontunmap-eocheck:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-466/igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontunmap-eocheck.html>
>         (Intel XE#4915
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915>)
>         +326 other tests skip
>  *
>
>     igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge.html>
>         (Intel XE#4943
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943>)
>         +14 other tests skip
>  *
>
>     igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-free-huge-nomemset:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-lnl-1/igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-free-huge-nomemset.html>
>         (Intel XE#4943
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943>)
>         +10 other tests skip
>  *
>
>     igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-436/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html>
>         (Intel XE#2229
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229>)
>  *
>
>     igt@xe_media_fill@media-fill:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-5/igt@xe_media_fill@media-fill.html>
>         (Intel XE#2459
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459> /
>         Intel XE#2596
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-lnl-8/igt@xe_media_fill@media-fill.html>
>         (Intel XE#560
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/560>)
>  *
>
>     igt@xe_mmap@vram:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-lnl-5/igt@xe_mmap@vram.html>
>         (Intel XE#1416
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416>)
>  *
>
>     igt@xe_oa@mmio-triggered-reports-read:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-434/igt@xe_oa@mmio-triggered-reports-read.html>
>         (Intel XE#6032
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6032>)
>  *
>
>     igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-436/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html>
>         (Intel XE#3573
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573>) +8
>         other tests skip
>  *
>
>     igt@xe_pat@pat-index-xehpc:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-lnl-4/igt@xe_pat@pat-index-xehpc.html>
>         (Intel XE#1420
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420> /
>         Intel XE#2838
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838>)
>  *
>
>     igt@xe_pat@pat-index-xelp:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-5/igt@xe_pat@pat-index-xelp.html>
>         (Intel XE#2245
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245>)
>  *
>
>     igt@xe_pm@d3cold-mmap-vram:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-463/igt@xe_pm@d3cold-mmap-vram.html>
>         (Intel XE#2284
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284> /
>         Intel XE#366
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-lnl-3/igt@xe_pm@d3cold-mmap-vram.html>
>         (Intel XE#2284
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284> /
>         Intel XE#366
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>)
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-5/igt@xe_pm@d3cold-mmap-vram.html>
>         (Intel XE#2284
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284>)
>  *
>
>     igt@xe_pm@d3cold-mocs:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-463/igt@xe_pm@d3cold-mocs.html>
>         (Intel XE#2284
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284>)
>  *
>
>     igt@xe_pm@s3-mocs:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-lnl-2/igt@xe_pm@s3-mocs.html>
>         (Intel XE#584
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/584>)
>  *
>
>     igt@xe_pm@vram-d3cold-threshold:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-466/igt@xe_pm@vram-d3cold-threshold.html>
>         (Intel XE#579
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/579>)
>  *
>
>     igt@xe_pmu@fn-engine-activity-load:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-436/igt@xe_pmu@fn-engine-activity-load.html>
>         (Intel XE#4650
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650>)
>  *
>
>     igt@xe_pxp@display-pxp-fb:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-8/igt@xe_pxp@display-pxp-fb.html>
>         (Intel XE#4733
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733>) +1
>         other test skip
>  *
>
>     igt@xe_pxp@pxp-termination-key-update-post-rpm:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-436/igt@xe_pxp@pxp-termination-key-update-post-rpm.html>
>         (Intel XE#4733
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733>) +3
>         other tests skip
>  *
>
>     igt@xe_query@multigpu-query-engines:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-434/igt@xe_query@multigpu-query-engines.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +4
>         other tests skip
>  *
>
>     igt@xe_query@multigpu-query-gt-list:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-7/igt@xe_query@multigpu-query-gt-list.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +1
>         other test skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-lnl-7/igt@xe_query@multigpu-query-gt-list.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +1
>         other test skip
>  *
>
>     igt@xe_render_copy@render-stress-0-copies:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-464/igt@xe_render_copy@render-stress-0-copies.html>
>         (Intel XE#4814
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814>)
>  *
>
>     igt@xe_spin_batch@spin-mem-copy:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-432/igt@xe_spin_batch@spin-mem-copy.html>
>         (Intel XE#4821
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4821>)
>  *
>
>     igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-463/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html>
>         (Intel XE#4130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-lnl-1/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html>
>         (Intel XE#4130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130>)
>  *
>
>     igt@xe_sriov_flr@flr-vf1-clear:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-436/igt@xe_sriov_flr@flr-vf1-clear.html>
>         (Intel XE#3342
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342>)
>
Not related
>
>  *
>
>
>         Possible fixes
>
>  *
>
>     igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html>
>         (Intel XE#2291
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html>
>         +2 other tests pass
>  *
>
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html>
>         (Intel XE#4633
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html>
>  *
>
>     igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html>
>         (Intel XE#2316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html>
>         +5 other tests pass
>  *
>
>     igt@kms_flip@2x-flip-vs-suspend:
>
>       o shard-bmg: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-7/igt@kms_flip@2x-flip-vs-suspend.html>
>         (Intel XE#2049
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049> /
>         Intel XE#2597
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-3/igt@kms_flip@2x-flip-vs-suspend.html>
>         +1 other test pass
>  *
>
>     igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a6-dp4:
>
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-dg2-463/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a6-dp4.html>
>         (Intel XE#2049
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049> /
>         Intel XE#2597
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-466/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a6-dp4.html>
>         +2 other tests pass
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank-interruptible:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html>
>         +1 other test pass
>  *
>
>     igt@kms_hdr@static-toggle-dpms:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-6/igt@kms_hdr@static-toggle-dpms.html>
>         (Intel XE#1503
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-8/igt@kms_hdr@static-toggle-dpms.html>
>  *
>
>     igt@kms_joiner@basic-force-big-joiner:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html>
>         (Intel XE#3012
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-3/igt@kms_joiner@basic-force-big-joiner.html>
>  *
>
>     igt@kms_plane_multiple@2x-tiling-none:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-none.html>
>         (Intel XE#4596
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-none.html>
>  *
>
>     igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html>
>         (Intel XE#1392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-464/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html>
>         +2 other tests pass
>  *
>
>     igt@xe_exec_compute_mode@many-execqueues-basic:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-7/igt@xe_exec_compute_mode@many-execqueues-basic.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-6/igt@xe_exec_compute_mode@many-execqueues-basic.html>
>         +1 other test pass
>  *
>
>     igt@xe_exec_reset@parallel-gt-reset:
>
>       o shard-bmg: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-7/igt@xe_exec_reset@parallel-gt-reset.html>
>         (Intel XE#3876
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-1/igt@xe_exec_reset@parallel-gt-reset.html>
>  *
>
>     {igt@xe_exec_system_allocator@many-64k-new-prefetch}:
>
>       o shard-lnl: CRASH
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-lnl-5/igt@xe_exec_system_allocator@many-64k-new-prefetch.html>
>         (Intel XE#6192
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6192>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-lnl-5/igt@xe_exec_system_allocator@many-64k-new-prefetch.html>
>         +10 other tests pass
>  *
>
>     {igt@xe_exec_system_allocator@many-stride-malloc-prefetch}:
>
>       o shard-bmg: CRASH
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-8/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html>
>         (Intel XE#6192
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6192>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-8/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html>
>         +6 other tests pass
>  *
>
>     igt@xe_pmu@gt-frequency:
>
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-dg2-434/igt@xe_pmu@gt-frequency.html>
>         (Intel XE#4819
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4819>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-466/igt@xe_pmu@gt-frequency.html>
>         +1 other test pass
>  *
>
>     igt@xe_sriov_auto_provisioning@exclusive-ranges@numvfs-random:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-5/igt@xe_sriov_auto_provisioning@exclusive-ranges@numvfs-random.html>
>         (Intel XE#5937
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-3/igt@xe_sriov_auto_provisioning@exclusive-ranges@numvfs-random.html>
>         +1 other test pass
>
>
>         Warnings
>
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>)
>         +11 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>)
>         +10 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html>
>         (Intel XE#5390
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390>) +6
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html>
>         (Intel XE#5390
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) +3
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>)
>         +10 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) +8
>         other tests skip
>  *
>
>     igt@xe_peer2peer@read:
>
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-dg2-434/igt@xe_peer2peer@read.html>
>         (Intel XE#1173
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-432/igt@xe_peer2peer@read.html>
>         (Intel XE#1061
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061>)
>
Not related

Thanks and Regards
Kunal Joshi

>  *
>
> {name}: This element is suppressed. This means it is ignored when 
> computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
>
>
>     Build changes
>
>   * IGT: IGT_8552 -> IGTPW_13810
>
> IGTPW_13810: 13810
> IGT_8552: 8552
> xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf: 
> a4d9163251f4832a7d34d4b59449f9a68b9b7adf
>

--------------iFiZVvhl0Kejx3GMyXLS0hHn
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hello,<br>
      <br>
      Changes are made only in kms_vrr test, Failures reported<br>
      are not related to the patch series.<br>
      <br>
      Will merge this patch series.<br>
      <br>
    </p>
    <div class="moz-cite-prefix">On 25-09-2025 07:39, Patchwork wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:175876614268.364597.3686002471693698924@1538d3639d33">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>extend lobf test for supported connectors (rev3)</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a
                href="https://patchwork.freedesktop.org/series/154689/"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/154689/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/index.html"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from XEIGT_8552_FULL -&gt;
        XEIGTPW_13810_FULL</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with XEIGTPW_13810_FULL
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in XEIGTPW_13810_FULL, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (4 -&gt; 3)</h2>
      <p>Missing (1): shard-adlp </p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        XEIGTPW_13810_FULL:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>
          <p>igt@kms_pm_rpm@basic-rte:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-2/igt@kms_pm_rpm@basic-rte.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-1/igt@kms_pm_rpm@basic-rte.html"
                moz-do-not-send="true">FAIL</a></li>
          </ul>
        </li>
      </ul>
    </blockquote>
    Not related.
    <blockquote type="cite"
      cite="mid:175876614268.364597.3686002471693698924@1538d3639d33">
      <ul>
        <li>
          <ul>
          </ul>
          <br>
        </li>
        <li>
          <p>igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-vram01:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-1/igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-vram01.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-1/igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-vram01.html"
                moz-do-not-send="true">DMESG-WARN</a> +6 other tests
              dmesg-warn</li>
          </ul>
        </li>
      </ul>
    </blockquote>
    Not related.
    <blockquote type="cite"
      cite="mid:175876614268.364597.3686002471693698924@1538d3639d33">
      <ul>
        <li>
          <ul>
          </ul>
          <br>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>igt@xe_sriov_auto_provisioning@selfconfig-basic:
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-3/igt@xe_sriov_auto_provisioning@selfconfig-basic.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6190"
                moz-do-not-send="true">Intel XE#6190</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-1/igt@xe_sriov_auto_provisioning@selfconfig-basic.html"
                moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
      </ul>
    </blockquote>
    Not related.
    <blockquote type="cite"
      cite="mid:175876614268.364597.3686002471693698924@1538d3639d33">
      <ul>
        <li>
          <ul>
          </ul>
          <br>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in XEIGTPW_13810_FULL that come from
        known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316"
                moz-do-not-send="true">Intel XE#316</a>) +4 other tests
              skip</li>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-4/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327"
                moz-do-not-send="true">Intel XE#2327</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607"
                moz-do-not-send="true">Intel XE#607</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-lnl-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124"
                moz-do-not-send="true">Intel XE#1124</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-464/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124"
                moz-do-not-send="true">Intel XE#1124</a>) +11 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610"
                moz-do-not-send="true">Intel XE#610</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124"
                moz-do-not-send="true">Intel XE#1124</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314"
                moz-do-not-send="true">Intel XE#2314</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894"
                moz-do-not-send="true">Intel XE#2894</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191"
                moz-do-not-send="true">Intel XE#2191</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-8/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367"
                moz-do-not-send="true">Intel XE#367</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-463/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367"
                moz-do-not-send="true">Intel XE#367</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-lnl-8/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512"
                moz-do-not-send="true">Intel XE#1512</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432"
                moz-do-not-send="true">Intel XE#3432</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) +174 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887"
                moz-do-not-send="true">Intel XE#2887</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-lnl-2/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887"
                moz-do-not-send="true">Intel XE#2887</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"
                moz-do-not-send="true">Intel XE#1727</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113"
                moz-do-not-send="true">Intel XE#3113</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345"
                moz-do-not-send="true">Intel XE#4345</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"
                moz-do-not-send="true">Intel XE#1727</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113"
                moz-do-not-send="true">Intel XE#3113</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907"
                moz-do-not-send="true">Intel XE#2907</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) +41 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-limited-range:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-432/igt@kms_chamelium_color@ctm-limited-range.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306"
                moz-do-not-send="true">Intel XE#306</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-8/igt@kms_chamelium_color@ctm-red-to-blue.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325"
                moz-do-not-send="true">Intel XE#2325</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-lnl-7/igt@kms_chamelium_color@ctm-red-to-blue.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306"
                moz-do-not-send="true">Intel XE#306</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-5/igt@kms_chamelium_hpd@common-hpd-after-suspend.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252"
                moz-do-not-send="true">Intel XE#2252</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@vga-hpd:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-466/igt@kms_chamelium_hpd@vga-hpd.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373"
                moz-do-not-send="true">Intel XE#373</a>) +11 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-lnl-7/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373"
                moz-do-not-send="true">Intel XE#373</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@atomic:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-463/igt@kms_content_protection@atomic.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178"
                moz-do-not-send="true">Intel XE#1178</a>) +4 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-463/igt@kms_content_protection@dp-mst-lic-type-1.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307"
                moz-do-not-send="true">Intel XE#307</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@mei-interface:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-5/igt@kms_content_protection@mei-interface.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341"
                moz-do-not-send="true">Intel XE#2341</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@type1:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-lnl-3/igt@kms_content_protection@type1.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278"
                moz-do-not-send="true">Intel XE#3278</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-464/igt@kms_cursor_crc@cursor-offscreen-512x170.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308"
                moz-do-not-send="true">Intel XE#308</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-random-512x170:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-2/igt@kms_cursor_crc@cursor-random-512x170.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321"
                moz-do-not-send="true">Intel XE#2321</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-64x21:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-64x21.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320"
                moz-do-not-send="true">Intel XE#2320</a>) +2 other tests
              skip</li>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-lnl-2/igt@kms_cursor_crc@cursor-sliding-64x21.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424"
                moz-do-not-send="true">Intel XE#1424</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291"
                moz-do-not-send="true">Intel XE#2291</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286"
                moz-do-not-send="true">Intel XE#2286</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-466/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494"
                moz-do-not-send="true">Intel XE#4494</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804"
                moz-do-not-send="true">i915#3804</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dp_aux_dev:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-4/igt@kms_dp_aux_dev.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-6/igt@kms_dp_aux_dev.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009"
                moz-do-not-send="true">Intel XE#3009</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-7/igt@kms_dp_linktrain_fallback@dp-fallback.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294"
                moz-do-not-send="true">Intel XE#4294</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-basic:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-lnl-2/igt@kms_dsc@dsc-basic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244"
                moz-do-not-send="true">Intel XE#2244</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@display-2x:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-7/igt@kms_feature_discovery@display-2x.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-6/igt@kms_feature_discovery@display-2x.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373"
                moz-do-not-send="true">Intel XE#2373</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@display-3x:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-2/igt@kms_feature_discovery@display-3x.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373"
                moz-do-not-send="true">Intel XE#2373</a>)</li>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-464/igt@kms_feature_discovery@display-3x.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703"
                moz-do-not-send="true">Intel XE#703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@psr2:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-436/igt@kms_feature_discovery@psr2.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135"
                moz-do-not-send="true">Intel XE#1135</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-8/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316"
                moz-do-not-send="true">Intel XE#2316</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-plain-flip:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-lnl-1/igt@kms_flip@2x-plain-flip.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421"
                moz-do-not-send="true">Intel XE#1421</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321"
                moz-do-not-send="true">Intel XE#3321</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301"
                moz-do-not-send="true">Intel XE#301</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149"
                moz-do-not-send="true">Intel XE#3149</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401"
                moz-do-not-send="true">Intel XE#1401</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745"
                moz-do-not-send="true">Intel XE#1745</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401"
                moz-do-not-send="true">Intel XE#1401</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397"
                moz-do-not-send="true">Intel XE#1397</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745"
                moz-do-not-send="true">Intel XE#1745</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397"
                moz-do-not-send="true">Intel XE#1397</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) +24 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-blt:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651"
                moz-do-not-send="true">Intel XE#651</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311"
                moz-do-not-send="true">Intel XE#2311</a>) +11 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390"
                moz-do-not-send="true">Intel XE#5390</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651"
                moz-do-not-send="true">Intel XE#651</a>) +37 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313"
                moz-do-not-send="true">Intel XE#2313</a>) +16 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653"
                moz-do-not-send="true">Intel XE#653</a>) +38 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312"
                moz-do-not-send="true">Intel XE#2312</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656"
                moz-do-not-send="true">Intel XE#656</a>) +15 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5672"
                moz-do-not-send="true">Intel XE#5672</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@static-toggle:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-2/igt@kms_hdr@static-toggle.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-6/igt@kms_hdr@static-toggle.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503"
                moz-do-not-send="true">Intel XE#1503</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_panel_fitting@legacy:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-5/igt@kms_panel_fitting@legacy.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486"
                moz-do-not-send="true">Intel XE#2486</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-4:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-4.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-4.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596"
                moz-do-not-send="true">Intel XE#4596</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-yf:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-466/igt@kms_plane_multiple@2x-tiling-yf.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021"
                moz-do-not-send="true">Intel XE#5021</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@tiling-yf:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-433/igt@kms_plane_multiple@tiling-yf.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020"
                moz-do-not-send="true">Intel XE#5020</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_backlight@brightness-with-dpms:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-436/igt@kms_pm_backlight@brightness-with-dpms.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938"
                moz-do-not-send="true">Intel XE#2938</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc5-dpms:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-lnl-2/igt@kms_pm_dc@dc5-dpms.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718"
                moz-do-not-send="true">Intel XE#718</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc5-retention-flops:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-466/igt@kms_pm_dc@dc5-retention-flops.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309"
                moz-do-not-send="true">Intel XE#3309</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc6-psr:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-463/igt@kms_pm_dc@dc6-psr.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129"
                moz-do-not-send="true">Intel XE#1129</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439"
                moz-do-not-send="true">Intel XE#1439</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141"
                moz-do-not-send="true">Intel XE#3141</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836"
                moz-do-not-send="true">Intel XE#836</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-464/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406"
                moz-do-not-send="true">Intel XE#1406</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489"
                moz-do-not-send="true">Intel XE#1489</a>) +12 other
              tests skip</li>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406"
                moz-do-not-send="true">Intel XE#1406</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893"
                moz-do-not-send="true">Intel XE#2893</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608"
                moz-do-not-send="true">Intel XE#4608</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406"
                moz-do-not-send="true">Intel XE#1406</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608"
                moz-do-not-send="true">Intel XE#4608</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406"
                moz-do-not-send="true">Intel XE#1406</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489"
                moz-do-not-send="true">Intel XE#1489</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-lnl-8/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406"
                moz-do-not-send="true">Intel XE#1406</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893"
                moz-do-not-send="true">Intel XE#2893</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr-sprite-render:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-render.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406"
                moz-do-not-send="true">Intel XE#1406</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850"
                moz-do-not-send="true">Intel XE#2850</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929"
                moz-do-not-send="true">Intel XE#929</a>) +17 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2-sprite-blt:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-5/igt@kms_psr@psr2-sprite-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406"
                moz-do-not-send="true">Intel XE#1406</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234"
                moz-do-not-send="true">Intel XE#2234</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850"
                moz-do-not-send="true">Intel XE#2850</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@bad-tiling:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-432/igt@kms_rotation_crc@bad-tiling.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414"
                moz-do-not-send="true">Intel XE#3414</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127"
                moz-do-not-send="true">Intel XE#1127</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@sprite-rotation-90:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-lnl-1/igt@kms_rotation_crc@sprite-rotation-90.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414"
                moz-do-not-send="true">Intel XE#3414</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904"
                moz-do-not-send="true">Intel XE#3904</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_setmode@invalid-clone-single-crtc:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-5/igt@kms_setmode@invalid-clone-single-crtc.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435"
                moz-do-not-send="true">Intel XE#1435</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-lnl-8/igt@kms_setmode@invalid-clone-single-crtc-stealing.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435"
                moz-do-not-send="true">Intel XE#1435</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-1/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html"
                moz-do-not-send="true">TIMEOUT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6190"
                moz-do-not-send="true">Intel XE#6190</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-1/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-1/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01.html"
                moz-do-not-send="true">ABORT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6213"
                moz-do-not-send="true">Intel XE#6213</a>) +1 other test
              abort</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_compute_preempt@compute-preempt-many:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-466/igt@xe_compute_preempt@compute-preempt-many.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5890"
                moz-do-not-send="true">Intel XE#5890</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_configfs@survivability-mode:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-432/igt@xe_configfs@survivability-mode.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6010"
                moz-do-not-send="true">Intel XE#6010</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0xfffe.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126"
                moz-do-not-send="true">Intel XE#1126</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eu_stall@invalid-event-report-count:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-434/igt@xe_eu_stall@invalid-event-report-count.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626"
                moz-do-not-send="true">Intel XE#5626</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug@basic-read-event:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-2/igt@xe_eudebug@basic-read-event.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837"
                moz-do-not-send="true">Intel XE#4837</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug_online@interrupt-other-debuggable:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-lnl-1/igt@xe_eudebug_online@interrupt-other-debuggable.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837"
                moz-do-not-send="true">Intel XE#4837</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-large-external-cm:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-lnl-1/igt@xe_evict@evict-large-external-cm.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688"
                moz-do-not-send="true">Intel XE#688</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322"
                moz-do-not-send="true">Intel XE#2322</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392"
                moz-do-not-send="true">Intel XE#1392</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-no-exec-rebind:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-rebind.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-rebind.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392"
                moz-do-not-send="true">Intel XE#1392</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-lnl-1/igt@xe_exec_basic@multigpu-once-null-rebind.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392"
                moz-do-not-send="true">Intel XE#1392</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288"
                moz-do-not-send="true">Intel XE#288</a>) +28 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-436/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360"
                moz-do-not-send="true">Intel XE#2360</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_sip_eudebug@breakpoint-writesip:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-432/igt@xe_exec_sip_eudebug@breakpoint-writesip.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837"
                moz-do-not-send="true">Intel XE#4837</a>) +16 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontunmap-eocheck:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-466/igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontunmap-eocheck.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915"
                moz-do-not-send="true">Intel XE#4915</a>) +326 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943"
                moz-do-not-send="true">Intel XE#4943</a>) +14 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-free-huge-nomemset:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-lnl-1/igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-free-huge-nomemset.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943"
                moz-do-not-send="true">Intel XE#4943</a>) +10 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-436/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229"
                moz-do-not-send="true">Intel XE#2229</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_media_fill@media-fill:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-5/igt@xe_media_fill@media-fill.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459"
                moz-do-not-send="true">Intel XE#2459</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596"
                moz-do-not-send="true">Intel XE#2596</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-lnl-8/igt@xe_media_fill@media-fill.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/560"
                moz-do-not-send="true">Intel XE#560</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_mmap@vram:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-lnl-5/igt@xe_mmap@vram.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416"
                moz-do-not-send="true">Intel XE#1416</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@mmio-triggered-reports-read:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-434/igt@xe_oa@mmio-triggered-reports-read.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6032"
                moz-do-not-send="true">Intel XE#6032</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@oa-unit-exclusive-stream-sample-oa:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-436/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573"
                moz-do-not-send="true">Intel XE#3573</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pat@pat-index-xehpc:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-lnl-4/igt@xe_pat@pat-index-xehpc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420"
                moz-do-not-send="true">Intel XE#1420</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838"
                moz-do-not-send="true">Intel XE#2838</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pat@pat-index-xelp:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-5/igt@xe_pat@pat-index-xelp.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245"
                moz-do-not-send="true">Intel XE#2245</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@d3cold-mmap-vram:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-463/igt@xe_pm@d3cold-mmap-vram.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284"
                moz-do-not-send="true">Intel XE#2284</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366"
                moz-do-not-send="true">Intel XE#366</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-lnl-3/igt@xe_pm@d3cold-mmap-vram.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284"
                moz-do-not-send="true">Intel XE#2284</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366"
                moz-do-not-send="true">Intel XE#366</a>)</li>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-5/igt@xe_pm@d3cold-mmap-vram.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284"
                moz-do-not-send="true">Intel XE#2284</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@d3cold-mocs:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-463/igt@xe_pm@d3cold-mocs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284"
                moz-do-not-send="true">Intel XE#2284</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s3-mocs:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-lnl-2/igt@xe_pm@s3-mocs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584"
                moz-do-not-send="true">Intel XE#584</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@vram-d3cold-threshold:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-466/igt@xe_pm@vram-d3cold-threshold.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579"
                moz-do-not-send="true">Intel XE#579</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pmu@fn-engine-activity-load:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-436/igt@xe_pmu@fn-engine-activity-load.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650"
                moz-do-not-send="true">Intel XE#4650</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pxp@display-pxp-fb:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-8/igt@xe_pxp@display-pxp-fb.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733"
                moz-do-not-send="true">Intel XE#4733</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pxp@pxp-termination-key-update-post-rpm:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-436/igt@xe_pxp@pxp-termination-key-update-post-rpm.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733"
                moz-do-not-send="true">Intel XE#4733</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-engines:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-434/igt@xe_query@multigpu-query-engines.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944"
                moz-do-not-send="true">Intel XE#944</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-gt-list:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-7/igt@xe_query@multigpu-query-gt-list.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944"
                moz-do-not-send="true">Intel XE#944</a>) +1 other test
              skip</li>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-lnl-7/igt@xe_query@multigpu-query-gt-list.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944"
                moz-do-not-send="true">Intel XE#944</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_render_copy@render-stress-0-copies:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-464/igt@xe_render_copy@render-stress-0-copies.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814"
                moz-do-not-send="true">Intel XE#4814</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_spin_batch@spin-mem-copy:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-432/igt@xe_spin_batch@spin-mem-copy.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4821"
                moz-do-not-send="true">Intel XE#4821</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-463/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130"
                moz-do-not-send="true">Intel XE#4130</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-lnl-1/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130"
                moz-do-not-send="true">Intel XE#4130</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_sriov_flr@flr-vf1-clear:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-436/igt@xe_sriov_flr@flr-vf1-clear.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342"
                moz-do-not-send="true">Intel XE#3342</a>)</li>
          </ul>
        </li>
      </ul>
    </blockquote>
    Not related
    <blockquote type="cite"
      cite="mid:175876614268.364597.3686002471693698924@1538d3639d33">
      <ul>
        <li>
          <ul>
          </ul>
          <br>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291"
                moz-do-not-send="true">Intel XE#2291</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html"
                moz-do-not-send="true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633"
                moz-do-not-send="true">Intel XE#4633</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316"
                moz-do-not-send="true">Intel XE#2316</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html"
                moz-do-not-send="true">PASS</a> +5 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-suspend:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-7/igt@kms_flip@2x-flip-vs-suspend.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049"
                moz-do-not-send="true">Intel XE#2049</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597"
                moz-do-not-send="true">Intel XE#2597</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-3/igt@kms_flip@2x-flip-vs-suspend.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a6-dp4:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-dg2-463/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a6-dp4.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049"
                moz-do-not-send="true">Intel XE#2049</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597"
                moz-do-not-send="true">Intel XE#2597</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-466/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a6-dp4.html"
                moz-do-not-send="true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301"
                moz-do-not-send="true">Intel XE#301</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@static-toggle-dpms:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-6/igt@kms_hdr@static-toggle-dpms.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503"
                moz-do-not-send="true">Intel XE#1503</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-8/igt@kms_hdr@static-toggle-dpms.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@basic-force-big-joiner:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012"
                moz-do-not-send="true">Intel XE#3012</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-3/igt@kms_joiner@basic-force-big-joiner.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-none:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-none.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596"
                moz-do-not-send="true">Intel XE#4596</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-none.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392"
                moz-do-not-send="true">Intel XE#1392</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-464/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html"
                moz-do-not-send="true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_compute_mode@many-execqueues-basic:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-7/igt@xe_exec_compute_mode@many-execqueues-basic.html"
                moz-do-not-send="true">FAIL</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-6/igt@xe_exec_compute_mode@many-execqueues-basic.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_reset@parallel-gt-reset:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-7/igt@xe_exec_reset@parallel-gt-reset.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876"
                moz-do-not-send="true">Intel XE#3876</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-1/igt@xe_exec_reset@parallel-gt-reset.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>{igt@xe_exec_system_allocator@many-64k-new-prefetch}:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-lnl-5/igt@xe_exec_system_allocator@many-64k-new-prefetch.html"
                moz-do-not-send="true">CRASH</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6192"
                moz-do-not-send="true">Intel XE#6192</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-lnl-5/igt@xe_exec_system_allocator@many-64k-new-prefetch.html"
                moz-do-not-send="true">PASS</a> +10 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>{igt@xe_exec_system_allocator@many-stride-malloc-prefetch}:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-8/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html"
                moz-do-not-send="true">CRASH</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6192"
                moz-do-not-send="true">Intel XE#6192</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-8/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html"
                moz-do-not-send="true">PASS</a> +6 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pmu@gt-frequency:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-dg2-434/igt@xe_pmu@gt-frequency.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4819"
                moz-do-not-send="true">Intel XE#4819</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-466/igt@xe_pmu@gt-frequency.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_sriov_auto_provisioning@exclusive-ranges@numvfs-random:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-5/igt@xe_sriov_auto_provisioning@exclusive-ranges@numvfs-random.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937"
                moz-do-not-send="true">Intel XE#5937</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-3/igt@xe_sriov_auto_provisioning@exclusive-ranges@numvfs-random.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312"
                moz-do-not-send="true">Intel XE#2312</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311"
                moz-do-not-send="true">Intel XE#2311</a>) +11 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311"
                moz-do-not-send="true">Intel XE#2311</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312"
                moz-do-not-send="true">Intel XE#2312</a>) +10 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312"
                moz-do-not-send="true">Intel XE#2312</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390"
                moz-do-not-send="true">Intel XE#5390</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390"
                moz-do-not-send="true">Intel XE#5390</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312"
                moz-do-not-send="true">Intel XE#2312</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312"
                moz-do-not-send="true">Intel XE#2312</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313"
                moz-do-not-send="true">Intel XE#2313</a>) +10 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313"
                moz-do-not-send="true">Intel XE#2313</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312"
                moz-do-not-send="true">Intel XE#2312</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_peer2peer@read:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8552/shard-dg2-434/igt@xe_peer2peer@read.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173"
                moz-do-not-send="true">Intel XE#1173</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13810/shard-dg2-432/igt@xe_peer2peer@read.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061"
                moz-do-not-send="true">Intel XE#1061</a>)</li>
          </ul>
        </li>
      </ul>
    </blockquote>
    <p>Not related</p>
    <p>Thanks and Regards<br>
      Kunal Joshi</p>
    <blockquote type="cite"
      cite="mid:175876614268.364597.3686002471693698924@1538d3639d33">
      <ul>
        <li>
          <ul>
          </ul>
          <br>
        </li>
      </ul>
      <p>{name}: This element is suppressed. This means it is ignored
        when computing<br>
        the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
      <h2>Build changes</h2>
      <ul>
        <li>IGT: IGT_8552 -&gt; IGTPW_13810</li>
      </ul>
      <p>IGTPW_13810: 13810<br>
        IGT_8552: 8552<br>
        xe-3825-a4d9163251f4832a7d34d4b59449f9a68b9b7adf:
        a4d9163251f4832a7d34d4b59449f9a68b9b7adf</p>
    </blockquote>
    <br>
  </body>
</html>

--------------iFiZVvhl0Kejx3GMyXLS0hHn--
