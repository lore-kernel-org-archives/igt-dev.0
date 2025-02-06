Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 610DCC02194
	for <igt-dev@archiver.kernel.org>; Thu,  6 Feb 2025 09:58:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F53B10E7FE;
	Thu,  6 Feb 2025 09:58:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MBgCDiEq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 669CB10E7FC
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Feb 2025 09:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738835887; x=1770371887;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=SM0NhyuD4QG5jomR2tQp5B/e+FJ8oFGgQfcyKpexmXQ=;
 b=MBgCDiEqW7St3KgsznhZDzATiT54lQqZYcRRl+rbO3irb2qGR2o2Mq8Q
 0MgaNrC47oewE6ufKZj6gF4BH+oDbK3ZD19iIWNs6bGWaox2ofaxPRcJG
 IOYtcyOKUc5Y0t20yk+mcl2Bz/cMSUqhP6IG2b4E7u7HKAmzavsUicmo9
 zW+RxYJEV4qtfBias2GSwdkoKbCWrNZ7DONvZgwsw0rRKDi6doo0XfoBh
 TYKb9VvGJwg6peY/YDmX99XaasdKFsXpuKDSL02hN6tLCNG6nHUmNacYI
 lWb+lsOKfPvaVhuHJAphUMa7F0liXz6NK0n2kXhCDEt8kApv/Qov2db5r Q==;
X-CSE-ConnectionGUID: ++5unzbjT8qT7B8HkyXoNQ==
X-CSE-MsgGUID: 1zA5TyZzT3Ck6tVt3encHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39326109"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; d="scan'208";a="39326109"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 01:58:07 -0800
X-CSE-ConnectionGUID: Urxdt2JhR4iBDTai1DM8Tg==
X-CSE-MsgGUID: J1Ur0Lp3TH6q0zhsY1tFZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111615285"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.246.3.119])
 ([10.246.3.119])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 01:58:04 -0800
Message-ID: <ed4a12e3-cd14-44eb-b162-bf55f29f87df@linux.intel.com>
Date: Thu, 6 Feb 2025 10:58:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_tests/intel?=
 =?UTF-8?Q?/xe=5Fsriov=5Fflr=3A_Add_parallel_FLR_subtest_for_SR-IOV_VFs_=28r?=
 =?UTF-8?Q?ev4=29?=
To: igt-dev@lists.freedesktop.org
References: <20250205171819.2485976-1-marcin.bernatowicz@linux.intel.com>
 <173879016234.1636718.3316742816790794846@b555e5b46a47>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <173879016234.1636718.3316742816790794846@b555e5b46a47>
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



On 2/5/2025 10:16 PM, Patchwork wrote:
> *Patch Details*
> *Series:*	tests/intel/xe_sriov_flr: Add parallel FLR subtest for SR-IOV 
> VFs (rev4)
> *URL:*	https://patchwork.freedesktop.org/series/142042/ <https:// 
> patchwork.freedesktop.org/series/142042/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12548/ 
> index.html <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12548/ 
> index.html>
> 
> 
>   CI Bug Log - changes from XEIGT_8224_full -> XEIGTPW_12548_full
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with XEIGTPW_12548_full absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_12548_full, please notify your bug team (I915-ci- 
> infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (4 -> 4)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in 
> XEIGTPW_12548_full:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@xe_module_load@reload-no-display:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-466/igt@xe_module_load@reload-no-
>         display.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12548/shard-dg2-464/igt@xe_module_load@reload-no-
>         display.html> +1 other test fail
>   *

Not related to the change.

> 
>     igt@xe_sriov_flr@flr-vfs-parallel (NEW):
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-bmg-8/igt@xe_sriov_flr@flr-vfs-
>         parallel.html> +1 other test skip
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12548/shard-dg2-436/igt@xe_sriov_flr@flr-
>         vfs-parallel.html>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-lnl-8/igt@xe_sriov_flr@flr-vfs-
>         parallel.html> +1 other test skip
> 

Expected SKIPs on those platforms (no SR-IOV).

> 
>     New tests
> 
> New tests have been introduced between XEIGT_8224_full and 
> XEIGTPW_12548_full:
> 
> 
>       New IGT tests (2)
> 
>   *
> 
>     igt@xe_sriov_flr@flr-twice:
> 
>       o Statuses : 3 skip(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@xe_sriov_flr@flr-vfs-parallel:
> 
>       o Statuses : 3 skip(s)
>       o Exec time: [0.0] s
> 
> 
>     Known issues
> 
> Here are the changes found in XEIGTPW_12548_full that come from known 
> issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-bmg-5/igt@kms_addfb_basic@addfb25-y-
>         tiled-small-legacy.html> (Intel XE#2233 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2233>)
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-lnl-6/igt@kms_addfb_basic@addfb25-y-
>         tiled-small-legacy.html> (Intel XE#1466 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1466>)
>   *
> 
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-
>     linear:
> 
>       o shard-lnl: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-lnl-5/igt@kms_async_flips@async-flip-
>         with-page-flip-events@pipe-a-edp-1-linear.html> (Intel XE#911
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/911>) +3
>         other tests fail
>   *
> 
>     igt@kms_async_flips@test-time-stamp:
> 
>       o shard-dg2-set2: NOTRUN -> DMESG-WARN <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-dg2-436/
>         igt@kms_async_flips@test-time-stamp.html> (Intel XE#1033
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033>) +9
>         other tests dmesg-warn
>   *
> 
>     igt@kms_atomic_transition@plane-all-modeset-transition:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-lnl-3/
>         igt@kms_atomic_transition@plane-all-modeset-transition.html>
>         (Intel XE#3279 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3279>)
>   *
> 
>     igt@kms_big_fb@4-tiled-32bpp-rotate-90:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-bmg-7/igt@kms_big_fb@4-tiled-32bpp-
>         rotate-90.html> (Intel XE#2327 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2327>) +7 other tests skip
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-
>         stride-32bpp-rotate-180-hflip-async-flip.html> (Intel XE#3658
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658>)
>   *
> 
>     igt@kms_big_fb@x-tiled-8bpp-rotate-270:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12548/shard-dg2-466/igt@kms_big_fb@x-
>         tiled-8bpp-rotate-270.html> (Intel XE#316 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +4 other tests
>         skip
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-lnl-2/igt@kms_big_fb@x-tiled-8bpp-
>         rotate-270.html> (Intel XE#1407 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1407>) +6 other tests skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12548/shard-dg2-466/igt@kms_big_fb@yf-
>         tiled-16bpp-rotate-0.html> (Intel XE#1124 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +6 other
>         tests skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-bmg-5/igt@kms_big_fb@yf-tiled-32bpp-
>         rotate-0.html> (Intel XE#1124 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1124>) +16 other tests skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-lnl-1/igt@kms_big_fb@yf-tiled-max-hw-
>         stride-64bpp-rotate-180-hflip.html> (Intel XE#1124 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +13 other
>         tests skip
>   *
> 
>     igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12548/shard-dg2-435/igt@kms_bw@connected-
>         linear-tiling-4-displays-2160x1440p.html> (Intel XE#2191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>)
>   *
> 
>     igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-lnl-8/igt@kms_bw@connected-linear-
>         tiling-4-displays-3840x2160p.html> (Intel XE#1512 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1512>) +2 other
>         tests skip
>   *
> 
>     igt@kms_bw@linear-tiling-1-displays-2560x1440p:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-bmg-5/igt@kms_bw@linear-tiling-1-
>         displays-2560x1440p.html> (Intel XE#367 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +2 other tests
>         skip
>   *
> 
>     igt@kms_bw@linear-tiling-3-displays-2160x1440p:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-lnl-7/igt@kms_bw@linear-tiling-3-
>         displays-2160x1440p.html> (Intel XE#367 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>   *
> 
>     igt@kms_bw@linear-tiling-4-displays-2160x1440p:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12548/shard-dg2-463/igt@kms_bw@linear-
>         tiling-4-displays-2160x1440p.html> (Intel XE#367 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>   *
> 
>     igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12548/shard-dg2-435/igt@kms_ccs@ccs-on-
>         another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html> (Intel
>         XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/787>) +33 other tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12548/shard-dg2-434/igt@kms_ccs@crc-primary-
>         basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html> (Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +167
>         other tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12548/shard-dg2-466/igt@kms_ccs@crc-primary-
>         rotation-180-4-tiled-bmg-ccs.html> (Intel XE#2907 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2907>)
>   *
> 
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-lnl-5/igt@kms_ccs@crc-primary-
>         rotation-180-4-tiled-mtl-rc-ccs-cc.html> (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +17
>         other tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12548/shard-dg2-435/igt@kms_ccs@crc-primary-
>         suspend-4-tiled-lnl-ccs.html> (Intel XE#3442 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3442>)
>   *
> 
>     igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-bmg-6/igt@kms_ccs@crc-primary-
>         suspend-4-tiled-mtl-mc-ccs.html> (Intel XE#3432 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3432>)
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-lnl-2/igt@kms_ccs@crc-primary-
>         suspend-4-tiled-mtl-mc-ccs.html> (Intel XE#3432 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3432>)
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-lnl-6/igt@kms_ccs@crc-sprite-planes-
>         basic-4-tiled-bmg-ccs@pipe-a-edp-1.html> (Intel XE#2669
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669>) +7
>         other tests skip
>   *
> 
>     igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-bmg-2/igt@kms_ccs@missing-ccs-buffer-
>         y-tiled-ccs.html> (Intel XE#2887 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +18 other
>         tests skip
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-
>         tiled-lnl-ccs@pipe-c-dp-2.html> (Intel XE#2652 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2652> / Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +17
>         other tests skip
>   *
> 
>     igt@kms_cdclk@plane-scaling:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-bmg-8/igt@kms_cdclk@plane-
>         scaling.html> (Intel XE#2724 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2724>)
>   *
> 
>     igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12548/shard-dg2-436/igt@kms_cdclk@plane-
>         scaling@pipe-b-dp-4.html> (Intel XE#1152 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1152>) +3 other
>         tests skip
>   *
> 
>     igt@kms_chamelium_audio@hdmi-audio-edid:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-bmg-1/igt@kms_chamelium_audio@hdmi-
>         audio-edid.html> (Intel XE#2252 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2252>) +9 other tests skip
>   *
> 
>     igt@kms_chamelium_color@ctm-negative:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12548/shard-dg2-435/
>         igt@kms_chamelium_color@ctm-negative.html> (Intel XE#306
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>)
>   *
> 
>     igt@kms_chamelium_color@degamma:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-bmg-8/
>         igt@kms_chamelium_color@degamma.html> (Intel XE#2325 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2325>) +1 other test
>         skip
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-lnl-1/
>         igt@kms_chamelium_color@degamma.html> (Intel XE#306 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/306>)
>   *
> 
>     igt@kms_chamelium_frames@dp-crc-single:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12548/shard-dg2-434/
>         igt@kms_chamelium_frames@dp-crc-single.html> (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +4
>         other tests skip
>   *
> 
>     igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-lnl-5/igt@kms_chamelium_hpd@vga-hpd-
>         enable-disable-mode.html> (Intel XE#373 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +12 other
>         tests skip
>   *
> 
>     igt@kms_content_protection@atomic-dpms:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12548/shard-dg2-466/
>         igt@kms_content_protection@atomic-dpms.html> (Intel XE#1178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>) +1
>         other test fail
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-lnl-3/
>         igt@kms_content_protection@atomic-dpms.html> (Intel XE#3278
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278>) +1
>         other test skip
>   *
> 
>     igt@kms_content_protection@atomic@pipe-a-dp-2:
> 
>       o shard-bmg: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-bmg-4/
>         igt@kms_content_protection@atomic@pipe-a-dp-2.html> (Intel
>         XE#1178 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1178>) +2 other tests fail
>   *
> 
>     igt@kms_content_protection@dp-mst-lic-type-0:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-lnl-1/igt@kms_content_protection@dp-
>         mst-lic-type-0.html> (Intel XE#307 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/307>) +1 other test skip
>   *
> 
>     igt@kms_content_protection@dp-mst-type-0:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-bmg-7/igt@kms_content_protection@dp-
>         mst-type-0.html> (Intel XE#2390 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2390>) +1 other test skip
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12548/shard-dg2-435/
>         igt@kms_content_protection@dp-mst-type-0.html> (Intel XE#307
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>)
>   *
> 
>     igt@kms_content_protection@type1:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-bmg-5/
>         igt@kms_content_protection@type1.html> (Intel XE#2341 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2341>)
>   *
> 
>     igt@kms_cursor_crc@cursor-offscreen-128x42:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-bmg-5/igt@kms_cursor_crc@cursor-
>         offscreen-128x42.html> (Intel XE#2320 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2320>) +6 other
>         tests skip
>   *
> 
>     igt@kms_cursor_crc@cursor-offscreen-512x512:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12548/shard-dg2-466/
>         igt@kms_cursor_crc@cursor-offscreen-512x512.html> (Intel XE#308
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>)
>   *
> 
>     igt@kms_cursor_crc@cursor-onscreen-512x170:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-lnl-1/igt@kms_cursor_crc@cursor-
>         onscreen-512x170.html> (Intel XE#2321 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2321>) +4 other
>         tests skip
>   *
> 
>     igt@kms_cursor_crc@cursor-random-512x170:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-bmg-6/igt@kms_cursor_crc@cursor-
>         random-512x170.html> (Intel XE#2321 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2321>) +3 other
>         tests skip
>   *
> 
>     igt@kms_cursor_crc@cursor-sliding-128x42:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-lnl-7/igt@kms_cursor_crc@cursor-
>         sliding-128x42.html> (Intel XE#1424 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1424>) +6 other
>         tests skip
>   *
> 
>     igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-lnl-4/igt@kms_cursor_legacy@2x-
>         cursor-vs-flip-legacy.html> (Intel XE#309 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/309>) +8 other tests
>         skip
>   *
> 
>     igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-466/igt@kms_cursor_legacy@cursor-vs-flip-
>         atomic-transitions.html> -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12548/shard-dg2-464/
>         igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html>
>         (Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>) +74 other tests skip
>   *
> 
>     igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-bmg-4/igt@kms_cursor_legacy@cursora-
>         vs-flipb-atomic-transitions.html> (Intel XE#2291 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2291>) +1 other test
>         skip
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipb-
>         atomic-transitions.html> -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12548/shard-bmg-4/
>         igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html>
>         (Intel XE#2291 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2291>)
>   *
> 
>     igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-bmg-8/igt@kms_dirtyfb@fbc-dirtyfb-
>         ioctl.html> (Intel XE#4210 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/4210>)
>   *
> 
>     igt@kms_dsc@dsc-basic:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-bmg-4/igt@kms_dsc@dsc-basic.html>
>         (Intel XE#2244 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2244>) +1 other test skip
>   *
> 
>     igt@kms_dsc@dsc-with-output-formats-with-bpc:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12548/shard-dg2-466/igt@kms_dsc@dsc-with-
>         output-formats-with-bpc.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +15 other
>         tests skip
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-lnl-2/igt@kms_dsc@dsc-with-output-
>         formats-with-bpc.html> (Intel XE#2244 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2244>) +1 other test
>         skip
>   *
> 
>     igt@kms_fbcon_fbt@psr-suspend:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-bmg-4/igt@kms_fbcon_fbt@psr-
>         suspend.html> (Intel XE#776 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/776>)
>   *
> 
>     igt@kms_feature_discovery@display-3x:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-lnl-4/
>         igt@kms_feature_discovery@display-3x.html> (Intel XE#703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/703>)
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-bmg-5/
>         igt@kms_feature_discovery@display-3x.html> (Intel XE#2373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12548/shard-dg2-436/igt@kms_flip@2x-flip-vs-
>         expired-vblank-interruptible@ab-hdmi-a6-dp4.html> (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301> /
>         Intel XE#3321 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3321>) +1 other test fail
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12548/shard-dg2-436/igt@kms_flip@2x-flip-vs-
>         expired-vblank-interruptible@bc-hdmi-a6-dp4.html> (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) +5
>         other tests fail
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
> 
>       o shard-dg2-set2: NOTRUN -> DMESG-FAIL <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-dg2-436/
>         igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-
>         dp4.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/1033>) +2 other tests dmesg-fail
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
> 
>       o shard-bmg: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-bmg-7/igt@kms_flip@2x-flip-vs-
>         expired-vblank@ab-dp2-hdmi-a3.html> (Intel XE#3321 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3321>) +6 other
>         tests fail
>   *
> 
>     igt@kms_flip@2x-flip-vs-modeset-vs-hang:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-bmg-4/igt@kms_flip@2x-flip-vs-
>         modeset-vs-hang.html> (Intel XE#2316 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) +1 other test
>         skip
>   *
> 
>     igt@kms_flip@2x-flip-vs-rmfb-interruptible:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-lnl-1/igt@kms_flip@2x-flip-vs-rmfb-
>         interruptible.html> (Intel XE#1421 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1421>) +3 other
>         tests skip
>   *
> 
>     igt@kms_flip@2x-flip-vs-wf_vblank:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-bmg-5/igt@kms_flip@2x-flip-vs-wf_vblank.html> ->
>         FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12548/
>         shard-bmg-7/igt@kms_flip@2x-flip-vs-wf_vblank.html> (Intel
>         XE#3098 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3098>) +2 other tests fail
>   *
> 
>     igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate-
>         interruptible.html> -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-
>         recreate-interruptible.html> (Intel XE#2316 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) +4 other
>         tests skip
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank-
>         interruptible@d-hdmi-a3.html> -> FAIL <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-bmg-1/
>         igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-
>         a3.html> (Intel XE#3321 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/3321>) +2 other tests fail
>   *
> 
>     igt@kms_flip@nonexisting-fb:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-bmg-7/igt@kms_flip@nonexisting-fb.html> -> DMESG-
>         WARN <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12548/
>         shard-bmg-5/igt@kms_flip@nonexisting-fb.html> (Intel XE#4172
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172>) +15
>         other tests dmesg-warn
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-4tile-
>         to-64bpp-4tile-downscaling.html> -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-dg2-464/
>         igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-
>         downscaling.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) +178 other
>         tests skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-
>     upscaling@pipe-a-default-mode:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-lnl-5/
>         igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-
>         ytilegen12rcccs-upscaling@pipe-a-default-mode.html> (Intel
>         XE#1401 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1401>) +3 other tests skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-bmg-6/
>         igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-
>         downscaling.html> (Intel XE#2293 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2293> / Intel
>         XE#2380 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2380>) +5 other tests skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-
>     upscaling:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-lnl-2/
>         igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-
>         ytilegen12rcccs-upscaling.html> (Intel XE#1401 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1401> / Intel
>         XE#1745 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1745>) +3 other tests skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-
>     upscaling@pipe-a-valid-mode:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-bmg-7/
>         igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-
>         ytilegen12rcccs-upscaling@pipe-a-valid-mode.html> (Intel XE#2293
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293>) +5
>         other tests skip
>   *
> 
>     igt@kms_force_connector_basic@prune-stale-modes:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-lnl-4/
>         igt@kms_force_connector_basic@prune-stale-modes.html> (Intel
>         XE#352 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/352>) +1 other test skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-bmg-1/
>         igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-
>         blt.html> (Intel XE#2311 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2311>) +28 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-suspend:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-lnl-6/
>         igt@kms_frontbuffer_tracking@drrs-suspend.html> (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +15
>         other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-bmg-8/
>         igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-
>         blt.html> (Intel XE#4141 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/4141>) +17 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12548/shard-dg2-464/
>         igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-
>         mmap-wc.html> (Intel XE#2351 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2351> / Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) +23 other
>         tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-lnl-3/
>         igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-
>         blt.html> (Intel XE#656 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/656>) +47 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-
>         scndscrn-pri-indfb-draw-blt.html> -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-dg2-464/
>         igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-
>         blt.html> (Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2351> / Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) +7 other
>         tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12548/shard-dg2-435/
>         igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-
>         mmap-wc.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/651>) +23 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-bmg-4/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-
>         blt.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2312>) +4 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-bmg-1/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-
>         blt.html> (Intel XE#2313 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2313>) +29 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-bmg-4/
>         igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html> (Intel
>         XE#2352 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352>)
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-lnl-5/
>         igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html> (Intel
>         XE#1469 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469>)
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12548/shard-dg2-466/
>         igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-
>         blt.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/653>) +23 other tests skip
>   *
> 
>     igt@kms_getfb@getfb-reject-ccs:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-bmg-8/igt@kms_getfb@getfb-reject-
>         ccs.html> (Intel XE#2502 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2502>)
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12548/shard-dg2-436/igt@kms_getfb@getfb-
>         reject-ccs.html> (Intel XE#605 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/605>)
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-lnl-8/igt@kms_getfb@getfb-reject-
>         ccs.html> (Intel XE#605 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/605>)
>   *
> 
>     igt@kms_hdmi_inject@inject-audio:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-lnl-1/igt@kms_hdmi_inject@inject-
>         audio.html> (Intel XE#1470 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1470> / Intel XE#2853 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2853>)
>   *
> 
>     igt@kms_hdr@static-toggle-dpms:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-lnl-3/igt@kms_hdr@static-toggle-
>         dpms.html> (Intel XE#1503 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1503>)
>   *
> 
>     igt@kms_joiner@basic-force-ultra-joiner:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-bmg-7/igt@kms_joiner@basic-force-
>         ultra-joiner.html> (Intel XE#2934 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2934>)
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-lnl-2/igt@kms_joiner@basic-force-
>         ultra-joiner.html> (Intel XE#2934 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2934>)
>   *
> 
>     igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-bmg-4/igt@kms_joiner@switch-modeset-
>         ultra-joiner-big-joiner.html> (Intel XE#4090 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4090>)
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12548/shard-dg2-434/igt@kms_joiner@switch-
>         modeset-ultra-joiner-big-joiner.html> (Intel XE#2925 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2925>)
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-lnl-1/igt@kms_joiner@switch-modeset-
>         ultra-joiner-big-joiner.html> (Intel XE#4090 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4090>)
>   *
> 
>     igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12548/shard-dg2-464/
>         igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-
>         formats.html> (Intel XE#4208 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4208> / i915#2575 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) +53 other
>         tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12548/shard-dg2-466/
>         igt@kms_plane_scaling@planes-downscale-factor-0-25-
>         upscale-20x20@pipe-b.html> (Intel XE#2763 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) +8 other
>         tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12548/shard-dg2-466/
>         igt@kms_plane_scaling@planes-downscale-factor-0-25-
>         upscale-20x20@pipe-d.html> (Intel XE#2763 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2763> / Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +4
>         other tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-lnl-5/igt@kms_plane_scaling@planes-
>         upscale-factor-0-25-downscale-factor-0-25.html> (Intel XE#2763
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) +27
>         other tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-bmg-2/igt@kms_plane_scaling@planes-
>         upscale-factor-0-25-downscale-factor-0-5.html> (Intel XE#2763
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) +14
>         other tests skip
>   *
> 
>     igt@kms_pm_backlight@basic-brightness:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12548/shard-dg2-436/
>         igt@kms_pm_backlight@basic-brightness.html> (Intel XE#870
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>)
>   *
> 
>     igt@kms_pm_dc@dc5-dpms:
> 
>       o shard-lnl: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-lnl-7/igt@kms_pm_dc@dc5-dpms.html>
>         (Intel XE#718 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/718>)
>   *
> 
>     igt@kms_pm_dc@dc5-psr:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-bmg-1/igt@kms_pm_dc@dc5-psr.html>
>         (Intel XE#2392 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2392>)
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12548/shard-dg2-466/igt@kms_pm_dc@dc5-
>         psr.html> (Intel XE#1129 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/1129>)
>   *
> 
>     igt@kms_pm_dc@deep-pkgc:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-bmg-2/igt@kms_pm_dc@deep-pkgc.html>
>         (Intel XE#2505 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2505>)
>       o shard-lnl: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-lnl-8/igt@kms_pm_dc@deep-pkgc.html>
>         (Intel XE#2029 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2029>)
>   *
> 
>     igt@kms_pm_rpm@dpms-non-lpsp:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-lnl-3/igt@kms_pm_rpm@dpms-non-
>         lpsp.html> (Intel XE#1439 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1439> / Intel XE#3141 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3141>)
>   *
> 
>     igt@kms_pm_rpm@universal-planes-dpms:
> 
>       o shard-dg2-set2: NOTRUN -> DMESG-WARN <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-dg2-434/
>         igt@kms_pm_rpm@universal-planes-dpms.html> (Intel XE#1033
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> /
>         Intel XE#2042 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2042>)
>   *
> 
>     igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-bmg-7/igt@kms_psr2_sf@fbc-pr-cursor-
>         plane-move-continuous-sf.html> (Intel XE#1489 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +7 other
>         tests skip
>   *
> 
>     igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-lnl-7/igt@kms_psr2_sf@fbc-pr-cursor-
>         plane-update-sf.html> (Intel XE#2893 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2893>) +4 other
>         tests skip
>   *
> 
>     igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12548/shard-dg2-436/igt@kms_psr2_sf@fbc-
>         psr2-primary-plane-update-sf-dmg-area.html> (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +3
>         other tests skip
>   *
> 
>     igt@kms_psr2_su@frontbuffer-xrgb8888:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-lnl-4/igt@kms_psr2_su@frontbuffer-
>         xrgb8888.html> (Intel XE#1128 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1128>)
>   *
> 
>     igt@kms_psr2_su@page_flip-p010:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12548/shard-dg2-434/
>         igt@kms_psr2_su@page_flip-p010.html> (Intel XE#1122 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1122>) +1 other test
>         skip
>   *
> 
>     igt@kms_psr@fbc-psr2-sprite-plane-move:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12548/shard-dg2-464/igt@kms_psr@fbc-psr2-
>         sprite-plane-move.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) +123 other
>         tests skip
>   *
> 
>     igt@kms_psr@pr-sprite-plane-move:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-lnl-7/igt@kms_psr@pr-sprite-plane-
>         move.html> (Intel XE#1406 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1406>) +4 other tests skip
>   *
> 
>     igt@kms_psr@psr-cursor-plane-onoff:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-bmg-1/igt@kms_psr@psr-cursor-plane-
>         onoff.html> (Intel XE#2234 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2234> / Intel XE#2850 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2850>) +14 other
>         tests skip
>   *
> 
>     igt@kms_psr@psr-dpms:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12548/shard-dg2-435/igt@kms_psr@psr-
>         dpms.html> (Intel XE#2850 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2850> / Intel XE#929 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +14 other
>         tests skip
>   *
> 
>     igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-bmg-5/igt@kms_psr_stress_test@flip-
>         primary-invalidate-overlay.html> (Intel XE#2414 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2414>)
>   *
> 
>     igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12548/shard-dg2-435/
>         igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html>
>         (Intel XE#2939 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2939>)
>   *
> 
>     igt@kms_rotation_crc@bad-tiling:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12548/shard-dg2-434/
>         igt@kms_rotation_crc@bad-tiling.html> (Intel XE#3414 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3414>) +2 other
>         tests skip
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-lnl-1/igt@kms_rotation_crc@bad-
>         tiling.html> (Intel XE#3414 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/3414> / Intel XE#3904 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3904>) +1 other test
>         skip
>   *
> 
>     igt@kms_rotation_crc@multiplane-rotation-cropping-top:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-435/igt@kms_rotation_crc@multiplane-rotation-
>         cropping-top.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12548/shard-dg2-463/
>         igt@kms_rotation_crc@multiplane-rotation-cropping-top.html>
>         (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1033>) +11 other tests dmesg-warn
>   *
> 
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-bmg-2/igt@kms_rotation_crc@primary-
>         yf-tiled-reflect-x-270.html> (Intel XE#3414 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3414> / Intel
>         XE#3904 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3904>) +1 other test skip
>   *
> 
>     igt@kms_scaling_modes@scaling-mode-center:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-bmg-6/igt@kms_scaling_modes@scaling-
>         mode-center.html> (Intel XE#2413 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2413>) +1 other test
>         skip
>   *
> 
>     igt@kms_setmode@basic-clone-single-crtc:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-bmg-2/igt@kms_setmode@basic-clone-
>         single-crtc.html> (Intel XE#1435 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1435>)
>   *
> 
>     igt@kms_setmode@invalid-clone-single-crtc:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-lnl-2/igt@kms_setmode@invalid-clone-
>         single-crtc.html> (Intel XE#1435 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1435>)
>   *
> 
>     igt@kms_vrr@cmrr@pipe-a-edp-1:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html> -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12548/shard-
>         lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html> (Intel XE#2159
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159>) +1
>         other test fail
>   *
> 
>     igt@kms_vrr@flip-basic:
> 
>       o shard-lnl: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-lnl-6/igt@kms_vrr@flip-basic.html>
>         (Intel XE#1522 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1522>) +5 other tests fail
>   *
> 
>     igt@kms_vrr@max-min:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-bmg-1/igt@kms_vrr@max-min.html>
>         (Intel XE#1499 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1499>) +3 other tests skip
>   *
> 
>     igt@kms_vrr@seamless-rr-switch-drrs:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-
>         drrs.html> (Intel XE#1499 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1499>) +1 other test skip
>   *
> 
>     igt@kms_writeback@writeback-pixel-formats:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-bmg-5/igt@kms_writeback@writeback-
>         pixel-formats.html> (Intel XE#756 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/756>)
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-lnl-4/igt@kms_writeback@writeback-
>         pixel-formats.html> (Intel XE#756 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/756>)
>   *
> 
>     igt@xe_compute_preempt@compute-threadgroup-preempt@engine-
>     drm_xe_engine_class_compute:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12548/shard-dg2-436/
>         igt@xe_compute_preempt@compute-threadgroup-preempt@engine-
>         drm_xe_engine_class_compute.html> (Intel XE#1280 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1280> / Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1
>         other test skip
>   *
> 
>     igt@xe_create@create-big-vram:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-lnl-5/igt@xe_create@create-big-
>         vram.html> (Intel XE#1062 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1062>)
>   *
> 
>     igt@xe_eudebug@basic-connect:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-lnl-5/igt@xe_eudebug@basic-
>         connect.html> (Intel XE#2905 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2905>) +11 other tests skip
>   *
> 
>     igt@xe_eudebug@exec-queue-placements:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-bmg-2/igt@xe_eudebug@exec-queue-
>         placements.html> (Intel XE#2905 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2905>) +10 other tests skip
>   *
> 
>     igt@xe_evict@evict-beng-large-multi-vm:
> 
>       o shard-dg2-set2: NOTRUN -> DMESG-WARN <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-dg2-436/
>         igt@xe_evict@evict-beng-large-multi-vm.html> (Intel XE#1033
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> /
>         Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1473>)
>   *
> 
>     igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-lnl-4/igt@xe_evict_ccs@evict-
>         overcommit-standalone-instantfree-samefd.html> (Intel XE#688
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +5
>         other tests skip
>   *
> 
>     igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-bmg-6/igt@xe_exec_basic@multigpu-no-
>         exec-bindexecqueue.html> (Intel XE#2322 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2322>) +5 other
>         tests skip
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-lnl-2/igt@xe_exec_basic@multigpu-no-
>         exec-bindexecqueue.html> (Intel XE#1392 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +4 other
>         tests skip
>   *
> 
>     igt@xe_exec_fault_mode@many-execqueues-basic-prefetch:
> 
>       o shard-bmg: NOTRUN -> DMESG-WARN <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12548/shard-bmg-2/
>         igt@xe_exec_fault_mode@many-execqueues-basic-prefetch.html>
>         (Intel XE#4172 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4172>) +4 other tests dmesg-warn
>   *
> 
>     igt@xe_exec_fault_mode@once-rebind-prefetch:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12548/shard-dg2-466/
>         igt@xe_exec_fault_mode@once-rebind-prefetch.html> (Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +13
>         other tests skip
>   *
> 
>     igt@xe_exec_sip_eudebug@breakpoint-writesip:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12548/shard-dg2-436/
>         igt@xe_exec_sip_eudebug@breakpoint-writesip.html> (Intel XE#2905
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) +7
>         other tests skip
>   *
> 
>     igt@xe_live_ktest@xe_dma_buf:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-bmg-4/igt@xe_live_ktest@xe_dma_buf.html> -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12548/shard-
>         bmg-2/igt@xe_live_ktest@xe_dma_buf.html> (Intel XE#1192
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192>)
>   *
> 
>     igt@xe_live_ktest@xe_migrate:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-lnl-5/
>         igt@xe_live_ktest@xe_migrate.html> (Intel XE#1192 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1192>)
>   *
> 
>     igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12548/shard-dg2-434/
>         igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html> (Intel
>         XE#2229 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229>)
>   *
> 
>     igt@xe_module_load@force-load:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12548/shard-dg2-463/
>         igt@xe_module_load@force-load.html> (Intel XE#378 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/378>)
>   *
> 
>     igt@xe_module_load@load:
> 
>       o shard-lnl: (PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-lnl-6/igt@xe_module_load@load.html>, PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-lnl-7/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8224/shard-lnl-7/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8224/shard-lnl-5/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8224/shard-lnl-5/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8224/shard-lnl-5/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8224/shard-lnl-8/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8224/shard-lnl-4/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8224/shard-lnl-4/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8224/shard-lnl-1/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8224/shard-lnl-1/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8224/shard-lnl-2/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8224/shard-lnl-3/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8224/shard-lnl-3/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8224/shard-lnl-3/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8224/shard-lnl-3/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8224/shard-lnl-7/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8224/shard-lnl-8/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8224/shard-lnl-6/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8224/shard-lnl-6/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8224/shard-lnl-1/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8224/shard-lnl-2/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8224/shard-lnl-5/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8224/shard-lnl-4/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8224/shard-lnl-8/
>         igt@xe_module_load@load.html>) -> (PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-lnl-8/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-lnl-4/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-lnl-4/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-lnl-7/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-lnl-4/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-lnl-1/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-lnl-8/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-lnl-2/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-lnl-5/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-lnl-8/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-lnl-2/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-lnl-5/
>         igt@xe_module_load@load.html>, SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-lnl-2/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-lnl-6/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-lnl-7/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-lnl-6/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-lnl-5/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-lnl-2/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-lnl-3/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-lnl-5/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-lnl-6/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-lnl-1/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-lnl-1/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-lnl-3/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-lnl-3/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-lnl-7/
>         igt@xe_module_load@load.html>) (Intel XE#378 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/378>)
>       o shard-bmg: (PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-bmg-4/igt@xe_module_load@load.html>, PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-4/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-4/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-4/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-6/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-5/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-5/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-7/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-7/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-7/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-8/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-1/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-1/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-5/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-5/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-8/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-8/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-2/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-6/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-2/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-6/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-6/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-1/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-2/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8224/shard-bmg-2/
>         igt@xe_module_load@load.html>) -> (PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-bmg-6/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-bmg-8/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-bmg-8/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-bmg-8/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-bmg-7/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-bmg-7/
>         igt@xe_module_load@load.html>, SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-bmg-1/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-bmg-1/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-bmg-2/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-bmg-2/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-bmg-6/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-bmg-5/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-bmg-5/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-bmg-6/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-bmg-6/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-bmg-5/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-bmg-5/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-bmg-4/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-bmg-4/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-bmg-2/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-bmg-1/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-bmg-1/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-bmg-1/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-bmg-4/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-bmg-7/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-bmg-7/
>         igt@xe_module_load@load.html>) (Intel XE#2457 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2457>)
>   *
> 
>     igt@xe_oa@closed-fd-and-unmapped-access:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12548/shard-dg2-436/igt@xe_oa@closed-fd-and-
>         unmapped-access.html> (Intel XE#2541 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2541> / Intel
>         XE#3573 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3573>) +5 other tests skip
>   *
> 
>     igt@xe_pat@pat-index-xehpc:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12548/shard-dg2-436/igt@xe_pat@pat-index-
>         xehpc.html> (Intel XE#2838 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2838> / Intel XE#979 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/979>)
>   *
> 
>     igt@xe_pat@pat-index-xelp:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-lnl-1/igt@xe_pat@pat-index-xelp.html>
>         (Intel XE#977 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/977>)
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-bmg-8/igt@xe_pat@pat-index-xelp.html>
>         (Intel XE#2245 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2245>)
>   *
> 
>     igt@xe_pat@pat-index-xelpg:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-bmg-1/igt@xe_pat@pat-index-
>         xelpg.html> (Intel XE#2236 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2236>)
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-lnl-5/igt@xe_pat@pat-index-
>         xelpg.html> (Intel XE#979 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/979>)
>   *
> 
>     igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12548/shard-dg2-436/
>         igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html>
>         (Intel XE#1173 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1173>)
>   *
> 
>     igt@xe_pm@d3cold-basic-exec:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12548/shard-dg2-435/igt@xe_pm@d3cold-basic-
>         exec.html> (Intel XE#2284 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2284> / Intel XE#366 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/366>) +1 other test skip
>   *
> 
>     igt@xe_pm@d3cold-mocs:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12548/shard-dg2-434/igt@xe_pm@d3cold-
>         mocs.html> (Intel XE#2284 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2284>)
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-lnl-1/igt@xe_pm@d3cold-mocs.html>
>         (Intel XE#2284 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2284>)
>   *
> 
>     igt@xe_pm@d3hot-mmap-vram:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-lnl-3/igt@xe_pm@d3hot-mmap-vram.html>
>         (Intel XE#1948 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1948>)
>   *
> 
>     igt@xe_pm@s3-d3cold-basic-exec:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-bmg-1/igt@xe_pm@s3-d3cold-basic-
>         exec.html> (Intel XE#2284 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2284>)
>   *
> 
>     igt@xe_pm@s3-exec-after:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-bmg-8/igt@xe_pm@s3-exec-after.html> -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12548/shard-
>         bmg-5/igt@xe_pm@s3-exec-after.html> (Intel XE#4172 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4172> / Intel XE#569
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/569>)
>   *
> 
>     igt@xe_pm@s3-multiple-execs:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-434/igt@xe_pm@s3-multiple-execs.html> ->
>         DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGTPW_12548/shard-dg2-436/igt@xe_pm@s3-multiple-execs.html>
>         (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1033> / Intel XE#569 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/569>)
>   *
> 
>     igt@xe_pm@s3-vm-bind-prefetch:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-lnl-1/igt@xe_pm@s3-vm-bind-
>         prefetch.html> (Intel XE#584 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/584>)
>   *
> 
>     igt@xe_pm@s4-basic:
> 
>       o shard-dg2-set2: NOTRUN -> ABORT <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12548/shard-dg2-466/igt@xe_pm@s4-basic.html>
>         (Intel XE#1358 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1358>)
>   *
> 
>     igt@xe_pm@s4-exec-after:
> 
>       o shard-bmg: NOTRUN -> ABORT <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-bmg-8/igt@xe_pm@s4-exec-after.html>
>         (Intel XE#1358 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1358> / Intel XE#1607 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1607>)
>       o shard-lnl: NOTRUN -> ABORT <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-lnl-1/igt@xe_pm@s4-exec-after.html>
>         (Intel XE#1358 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1358> / Intel XE#1607 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1607>)
>   *
> 
>     igt@xe_query@multigpu-query-invalid-cs-cycles:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-bmg-1/igt@xe_query@multigpu-query-
>         invalid-cs-cycles.html> (Intel XE#944 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +5 other tests
>         skip
>   *
> 
>     igt@xe_query@multigpu-query-topology-l3-bank-mask:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-lnl-4/igt@xe_query@multigpu-query-
>         topology-l3-bank-mask.html> (Intel XE#944 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +5 other tests
>         skip
>   *
> 
>     igt@xe_query@multigpu-query-uc-fw-version-guc:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12548/shard-dg2-435/igt@xe_query@multigpu-
>         query-uc-fw-version-guc.html> (Intel XE#944 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +2 other tests
>         skip
>   *
> 
>     igt@xe_sriov_auto_provisioning@fair-allocation:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-lnl-1/
>         igt@xe_sriov_auto_provisioning@fair-allocation.html> (Intel
>         XE#4130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130>)
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-bmg-8/
>         igt@xe_sriov_auto_provisioning@fair-allocation.html> (Intel
>         XE#4130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130>)
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@fbdev@nullptr:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-464/igt@fbdev@nullptr.html> (Intel XE#2134
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12548/
>         shard-dg2-434/igt@fbdev@nullptr.html>
>   *
> 
>     igt@kms_atomic@plane-invalid-params-fence:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-464/igt@kms_atomic@plane-invalid-params-
>         fence.html> (Intel XE#4208 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/4208> / i915#2575 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12548/shard-
>         dg2-434/igt@kms_atomic@plane-invalid-params-fence.html> +84
>         other tests pass
>   *
> 
>     igt@kms_atomic_interruptible@legacy-setmode@pipe-a-hdmi-a-6:
> 
>       o shard-dg2-set2: DMESG-WARN <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGT_8224/shard-dg2-434/
>         igt@kms_atomic_interruptible@legacy-setmode@pipe-a-hdmi-
>         a-6.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/1033>) -> PASS <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-dg2-434/
>         igt@kms_atomic_interruptible@legacy-setmode@pipe-a-hdmi-
>         a-6.html> +6 other tests pass
>   *
> 
>     igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-
>         displays-2560x1440p.html> (Intel XE#2314 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2314> / Intel
>         XE#2894 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2894>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12548/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-
>         displays-2560x1440p.html>
>   *
> 
>     igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
> 
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGT_8224/shard-dg2-463/igt@kms_ccs@crc-primary-
>         suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html> (Intel XE#3862
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12548/
>         shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-
>         ccs@pipe-d-dp-4.html> +1 other test pass
>   *
> 
>     igt@kms_cursor_legacy@cursor-vs-flip-atomic:
> 
>       o shard-bmg: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8224/shard-bmg-4/igt@kms_cursor_legacy@cursor-vs-flip-
>         atomic.html> (Intel XE#3226 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/3226>) -> PASS <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12548/shard-bmg-1/
>         igt@kms_cursor_legacy@cursor-vs-flip-atomic.html>
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-
>         atomic-transitions-varying-size.html> (Intel XE#2291 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2291>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12548/shard-
>         bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-
>         varying-size.html> +4 other tests pass
>   *
> 
>     igt@kms_display_modes@extended-mode-basic:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-bmg-6/igt@kms_display_modes@extended-mode-
>         basic.html> (Intel XE#2425 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2425>) -> PASS <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12548/shard-bmg-5/
>         igt@kms_display_modes@extended-mode-basic.html>
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4:
> 
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-
>         vblank@ad-hdmi-a6-dp4.html> (Intel XE#301 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/301>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12548/shard-
>         dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-
>         dp4.html> +1 other test pass
>   *
> 
>     igt@kms_flip@2x-plain-flip-ts-check-interruptible:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-bmg-4/igt@kms_flip@2x-plain-flip-ts-check-
>         interruptible.html> (Intel XE#2316 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12548/shard-
>         bmg-1/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html> +5
>         other tests pass
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-
>         a3.html> (Intel XE#3321 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/3321>) -> PASS <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-bmg-6/igt@kms_flip@flip-vs-expired-
>         vblank@c-hdmi-a3.html> +2 other tests pass
>   *
> 
>     igt@kms_flip@plain-flip-fb-recreate:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-bmg-5/igt@kms_flip@plain-flip-fb-recreate.html>
>         (Intel XE#2882 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2882>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12548/shard-bmg-2/igt@kms_flip@plain-flip-fb-
>         recreate.html> +1 other test pass
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-xtile-
>         to-32bpp-xtile-downscaling.html> (Intel XE#2351 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2351> / Intel
>         XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12548/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-
>         xtile-to-32bpp-xtile-downscaling.html> +11 other tests pass
>   *
> 
>     igt@kms_psr@fbc-psr2-sprite-render:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-lnl-8/igt@kms_psr@fbc-psr2-sprite-render.html>
>         (Intel XE#3924 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3924>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12548/shard-lnl-7/igt@kms_psr@fbc-psr2-sprite-
>         render.html> +1 other test pass
>   *
> 
>     igt@kms_setmode@invalid-clone-single-crtc-stealing:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-
>         stealing.html> (Intel XE#1435 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1435>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-bmg-1/
>         igt@kms_setmode@invalid-clone-single-crtc-stealing.html>
>   *
> 
>     igt@kms_universal_plane@cursor-fb-leak:
> 
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-463/igt@kms_universal_plane@cursor-fb-
>         leak.html> (Intel XE#771 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/771> / Intel XE#899 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/899>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12548/shard-
>         dg2-435/igt@kms_universal_plane@cursor-fb-leak.html>
>   *
> 
>     igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:
> 
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-463/igt@kms_universal_plane@cursor-fb-
>         leak@pipe-d-hdmi-a-6.html> (Intel XE#899 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/899>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12548/shard-
>         dg2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html>
>   *
> 
>     igt@xe_exec_balancer@once-parallel-rebind:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-464/igt@xe_exec_balancer@once-parallel-
>         rebind.html> (Intel XE#4208 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/4208>) -> PASS <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12548/shard-dg2-435/
>         igt@xe_exec_balancer@once-parallel-rebind.html> +209 other tests
>         pass
>   *
> 
>     igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-
>     prefetch:
> 
>       o shard-bmg: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8224/shard-bmg-1/igt@xe_exec_fault_mode@many-execqueues-
>         bindexecqueue-userptr-rebind-prefetch.html> -> PASS <https://
>         intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12548/shard-bmg-4/
>         igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-
>         rebind-prefetch.html>
>   *
> 
>     igt@xe_live_ktest@xe_migrate:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-bmg-2/igt@xe_live_ktest@xe_migrate.html> (Intel
>         XE#1192 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1192>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12548/shard-bmg-1/igt@xe_live_ktest@xe_migrate.html>
>   *
> 
>     igt@xe_module_load@reload:
> 
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-464/igt@xe_module_load@reload.html> -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12548/shard-
>         dg2-463/igt@xe_module_load@reload.html> +2 other tests pass
>   *
> 
>     igt@xe_oa@mmio-triggered-reports:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8224/shard-bmg-1/igt@xe_oa@mmio-triggered-reports.html>
>         (Intel XE#4172 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4172>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12548/shard-bmg-5/igt@xe_oa@mmio-triggered-
>         reports.html> +48 other tests pass
>   *
> 
>     igt@xe_pm@s3-vm-bind-prefetch:
> 
>       o shard-bmg: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8224/shard-bmg-6/igt@xe_pm@s3-vm-bind-prefetch.html>
>         (Intel XE#1358 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1358> / Intel XE#569 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/569>) -> PASS <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12548/shard-bmg-4/igt@xe_pm@s3-vm-bind-
>         prefetch.html>
>       o shard-dg2-set2: DMESG-WARN <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGT_8224/shard-dg2-463/igt@xe_pm@s3-vm-bind-
>         prefetch.html> (Intel XE#1033 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1033> / Intel XE#569 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/569>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12548/shard-
>         dg2-434/igt@xe_pm@s3-vm-bind-prefetch.html>
>   *
> 
>     igt@xe_pm@s3-vm-bind-userptr:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8224/shard-bmg-5/igt@xe_pm@s3-vm-bind-userptr.html>
>         (Intel XE#4172 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4172> / Intel XE#569 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/569>) -> PASS <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12548/shard-bmg-4/igt@xe_pm@s3-vm-bind-
>         userptr.html>
> 
> 
>         Warnings
> 
>   *
> 
>     igt@kms_atomic_transition@plane-all-modeset-transition-fencing-
>     internal-panels:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-464/igt@kms_atomic_transition@plane-all-
>         modeset-transition-fencing-internal-panels.html> (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208> /
>         i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/2575>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12548/shard-dg2-463/igt@kms_atomic_transition@plane-
>         all-modeset-transition-fencing-internal-panels.html> (Intel
>         XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/455>) +4 other tests skip
>   *
> 
>     igt@kms_big_fb@4-tiled-32bpp-rotate-90:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-464/igt@kms_big_fb@4-tiled-32bpp-
>         rotate-90.html> (Intel XE#2351 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2351> / Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12548/shard-
>         dg2-466/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html> (Intel
>         XE#316 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/316>) +2 other tests skip
>   *
> 
>     igt@kms_big_fb@4-tiled-8bpp-rotate-270:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-464/igt@kms_big_fb@4-tiled-8bpp-
>         rotate-270.html> (Intel XE#4208 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4208>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-dg2-436/
>         igt@kms_big_fb@4-tiled-8bpp-rotate-270.html> (Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +4
>         other tests skip
>   *
> 
>     igt@kms_big_fb@linear-64bpp-rotate-180:
> 
>       o shard-dg2-set2: DMESG-WARN <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGT_8224/shard-dg2-434/igt@kms_big_fb@linear-64bpp-
>         rotate-180.html> (Intel XE#1033 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1033>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-dg2-464/
>         igt@kms_big_fb@linear-64bpp-rotate-180.html> (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> /
>         Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>)
>   *
> 
>     igt@kms_big_fb@x-tiled-8bpp-rotate-90:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-466/igt@kms_big_fb@x-tiled-8bpp-
>         rotate-90.html> (Intel XE#316 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/316>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12548/shard-dg2-464/igt@kms_big_fb@x-
>         tiled-8bpp-rotate-90.html> (Intel XE#2351 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2351> / Intel
>         XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>)
>   *
> 
>     igt@kms_big_fb@y-tiled-8bpp-rotate-180:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-464/igt@kms_big_fb@y-tiled-8bpp-
>         rotate-180.html> (Intel XE#4208 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4208>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-dg2-434/
>         igt@kms_big_fb@y-tiled-8bpp-rotate-180.html> (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +2
>         other tests skip
>   *
> 
>     igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb-size-offset-
>         overflow.html> (Intel XE#2351 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2351> / Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12548/shard-
>         dg2-435/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html>
>         (Intel XE#607 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/607>)
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-
>         stride-64bpp-rotate-0-async-flip.html> (Intel XE#2351 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2351> / Intel
>         XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12548/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-
>         stride-64bpp-rotate-0-async-flip.html> (Intel XE#1124 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +3 other
>         tests skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-436/igt@kms_big_fb@yf-tiled-16bpp-
>         rotate-270.html> (Intel XE#1124 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1124>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-dg2-464/
>         igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html> (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) +2
>         other tests skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-
>         rotate-180.html> (Intel XE#1124 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1124>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-dg2-464/
>         igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html> (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> /
>         Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) +2 other tests skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-464/igt@kms_big_fb@yf-tiled-addfb-size-
>         offset-overflow.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12548/shard-
>         dg2-463/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html>
>         (Intel XE#607 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/607>)
>   *
> 
>     igt@kms_big_fb@yf-tiled-addfb-size-overflow:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-464/igt@kms_big_fb@yf-tiled-addfb-size-
>         overflow.html> (Intel XE#4208 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4208>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-dg2-466/
>         igt@kms_big_fb@yf-tiled-addfb-size-overflow.html> (Intel XE#610
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/610>)
>   *
> 
>     igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-464/igt@kms_bw@connected-linear-tiling-4-
>         displays-1920x1080p.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12548/
>         shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-
>         displays-1920x1080p.html> (Intel XE#2191 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2191>) +2 other
>         tests skip
>   *
> 
>     igt@kms_bw@linear-tiling-2-displays-3840x2160p:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-435/igt@kms_bw@linear-tiling-2-
>         displays-3840x2160p.html> (Intel XE#367 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/367>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12548/shard-
>         dg2-464/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html>
>         (Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>) +2 other tests skip
>   *
> 
>     igt@kms_bw@linear-tiling-3-displays-3840x2160p:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-464/igt@kms_bw@linear-tiling-3-
>         displays-3840x2160p.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12548/
>         shard-dg2-434/igt@kms_bw@linear-tiling-3-
>         displays-3840x2160p.html> (Intel XE#367 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +1 other test skip
>   *
> 
>     igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-464/igt@kms_ccs@bad-pixel-format-yf-tiled-
>         ccs.html> (Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/4208>) -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-dg2-466/igt@kms_ccs@bad-pixel-format-
>         yf-tiled-ccs.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +9
>         other tests skip
>   *
> 
>     igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-466/igt@kms_ccs@bad-rotation-90-y-tiled-
>         gen12-rc-ccs.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12548/
>         shard-dg2-464/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-
>         ccs.html> (Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2351> / Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) +3 other
>         tests skip
>   *
> 
>     igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-y-tiled-
>         ccs.html> (Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2351> / Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12548/shard-
>         dg2-436/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html> (Intel
>         XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/787>) +3 other tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:
> 
>       o shard-dg2-set2: DMESG-WARN <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGT_8224/shard-dg2-434/igt@kms_ccs@crc-primary-
>         rotation-180-4-tiled-dg2-rc-ccs-cc.html> (Intel XE#1033
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12548/
>         shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-
>         rc-ccs-cc.html> (Intel XE#4208 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4208>) +3 other tests skip
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-lnl-
>         ccs.html> (Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/4208>) -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-dg2-466/igt@kms_ccs@random-ccs-
>         data-4-tiled-lnl-ccs.html> (Intel XE#2907 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2907>)
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-mtl-
>         rc-ccs.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/455> / Intel XE#787 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/787>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12548/shard-
>         dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html>
>         (Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) +9 other tests skip
>   *
> 
>     igt@kms_chamelium_color@ctm-0-50:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-464/igt@kms_chamelium_color@ctm-0-50.html>
>         (Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-dg2-434/
>         igt@kms_chamelium_color@ctm-0-50.html> (Intel XE#306 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/306>)
>   *
> 
>     igt@kms_chamelium_color@ctm-red-to-blue:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-435/igt@kms_chamelium_color@ctm-red-to-
>         blue.html> (Intel XE#306 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/306>) -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-dg2-464/igt@kms_chamelium_color@ctm-
>         red-to-blue.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>   *
> 
>     igt@kms_chamelium_hpd@hdmi-hpd:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd.html>
>         (Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-dg2-435/
>         igt@kms_chamelium_hpd@hdmi-hpd.html> (Intel XE#373 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +15 other
>         tests skip
>   *
> 
>     igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd-with-
>         enabled-mode.html> (Intel XE#373 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/373>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12548/shard-
>         dg2-464/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html>
>         (Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>) +9 other tests skip
>   *
> 
>     igt@kms_content_protection@atomic:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-bmg-6/igt@kms_content_protection@atomic.html>
>         (Intel XE#2341 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2341>) -> FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12548/shard-bmg-4/
>         igt@kms_content_protection@atomic.html> (Intel XE#1178 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1178>)
>   *
> 
>     igt@kms_content_protection@dp-mst-lic-type-1:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-464/igt@kms_content_protection@dp-mst-lic-
>         type-1.html> (Intel XE#4208 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/4208> / i915#2575 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12548/shard-
>         dg2-466/igt@kms_content_protection@dp-mst-lic-type-1.html>
>         (Intel XE#307 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/307>)
>   *
> 
>     igt@kms_content_protection@uevent:
> 
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-435/igt@kms_content_protection@uevent.html>
>         (Intel XE#1188 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1188>) -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-dg2-436/
>         igt@kms_content_protection@uevent.html> (Intel XE#1033 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1033>) +1 other test
>         dmesg-fail
>   *
> 
>     igt@kms_cursor_crc@cursor-offscreen-max-size:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-463/igt@kms_cursor_crc@cursor-offscreen-max-
>         size.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/455>) -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-dg2-464/igt@kms_cursor_crc@cursor-
>         offscreen-max-size.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +2 other tests skip
>   *
> 
>     igt@kms_cursor_crc@cursor-onscreen-512x170:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-464/igt@kms_cursor_crc@cursor-
>         onscreen-512x170.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12548/
>         shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x170.html>
>         (Intel XE#308 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/308>) +3 other tests skip
>   *
> 
>     igt@kms_cursor_crc@cursor-sliding-128x128:
> 
>       o shard-dg2-set2: DMESG-WARN <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGT_8224/shard-dg2-434/igt@kms_cursor_crc@cursor-
>         sliding-128x128.html> (Intel XE#1033 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1033>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12548/shard-
>         dg2-464/igt@kms_cursor_crc@cursor-sliding-128x128.html> (Intel
>         XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>) +6 other tests skip
>   *
> 
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-464/igt@kms_cursor_legacy@basic-busy-flip-
>         before-cursor-legacy.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12548/
>         shard-dg2-436/igt@kms_cursor_legacy@basic-busy-flip-before-
>         cursor-legacy.html> (Intel XE#323 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/323>)
>   *
> 
>     igt@kms_feature_discovery@display-4x:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-435/
>         igt@kms_feature_discovery@display-4x.html> (Intel XE#1138
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12548/
>         shard-dg2-464/igt@kms_feature_discovery@display-4x.html> (Intel
>         XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>)
>   *
> 
>     igt@kms_feature_discovery@dp-mst:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-466/igt@kms_feature_discovery@dp-mst.html>
>         (Intel XE#1137 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1137>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12548/shard-dg2-464/igt@kms_feature_discovery@dp-
>         mst.html> (Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/4208> / i915#2575 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/2575>)
>   *
> 
>     igt@kms_feature_discovery@psr2:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-463/igt@kms_feature_discovery@psr2.html>
>         (Intel XE#1135 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1135>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12548/shard-dg2-464/
>         igt@kms_feature_discovery@psr2.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-
>         vblank.html> (Intel XE#2316 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2316>) -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12548/shard-bmg-7/igt@kms_flip@2x-flip-vs-
>         expired-vblank.html> (Intel XE#3321 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3321>)
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank:
> 
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank.html>
>         (Intel XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/301>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGTPW_12548/shard-dg2-464/igt@kms_flip@flip-vs-expired-
>         vblank.html> (Intel XE#4208 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/4208> / i915#2575 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank-interruptible:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-
>         interruptible.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12548/
>         shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-
>         interruptible.html> (Intel XE#301 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/301>)
>   *
> 
>     igt@kms_flip@flip-vs-suspend:
> 
>       o shard-dg2-set2: DMESG-WARN <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGT_8224/shard-dg2-463/igt@kms_flip@flip-vs-
>         suspend.html> (Intel XE#2955 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2955>) -> DMESG-WARN <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-dg2-463/
>         igt@kms_flip@flip-vs-suspend.html> (Intel XE#1033 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1033>)
>   *
> 
>     igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset:
> 
>       o shard-dg2-set2: DMESG-WARN <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGT_8224/shard-dg2-463/igt@kms_flip@single-buffer-flip-
>         vs-dpms-off-vs-modeset.html> -> DMESG-WARN <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-dg2-436/
>         igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset.html>
>         (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1033>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-
>         to-64bpp-ytile-upscaling.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12548/shard-
>         dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-
>         upscaling.html> (Intel XE#2351 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2351> / Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-
>         yftile-to-16bpp-yftile-upscaling.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12548/shard-
>         dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-
>         yftile-upscaling.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) +1 other test
>         skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-ytile-
>         to-32bpp-ytile-downscaling.html> (Intel XE#2351 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2351> / Intel
>         XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12548/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-
>         ytile-to-32bpp-ytile-downscaling.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +2 other tests
>         skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-
>     upscaling:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-ytile-
>         to-32bpp-ytilegen12rcccs-upscaling.html> (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12548/
>         shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-
>         ytilegen12rcccs-upscaling.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +2 other tests
>         skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-
>         primscrn-spr-indfb-draw-render.html> (Intel XE#2312 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12548/shard-
>         bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-
>         draw-render.html> (Intel XE#2311 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) +15 other
>         tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-
>         scndscrn-cur-indfb-onoff.html> (Intel XE#651 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/651>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12548/shard-
>         dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-
>         onoff.html> (Intel XE#4208 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/4208>) +13 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-
>         scndscrn-pri-shrfb-draw-mmap-wc.html> (Intel XE#2311 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12548/shard-
>         bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-
>         draw-mmap-wc.html> (Intel XE#2312 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) +7 other
>         tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-
>         scndscrn-spr-indfb-fullscreen.html> (Intel XE#651 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/651>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12548/shard-
>         dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-
>         fullscreen.html> (Intel XE#2351 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2351> / Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) +8 other
>         tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-suspend:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-
>         suspend.html> (Intel XE#2351 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2351> / Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12548/shard-
>         dg2-436/igt@kms_frontbuffer_tracking@drrs-suspend.html> (Intel
>         XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/651>) +10 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-pri-
>         indfb-multidraw.html> (Intel XE#4141 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4141>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12548/shard-
>         bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-
>         multidraw.html> (Intel XE#2312 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2312>) +6 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-
>         scndscrn-pri-shrfb-draw-render.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12548/shard-
>         dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-
>         draw-render.html> (Intel XE#1033 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1033>) +3 other
>         tests dmesg-warn
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-
>         scndscrn-spr-indfb-onoff.html> (Intel XE#2312 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12548/shard-
>         bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-
>         onoff.html> (Intel XE#4141 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/4141>) +5 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-
>         rte.html> (Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/4208>) -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-dg2-463/
>         igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html> (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +22
>         other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-
>         tiling-y.html> (Intel XE#2351 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2351> / Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12548/shard-
>         dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html>
>         (Intel XE#658 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/658>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-
>         scndscrn-spr-indfb-draw-render.html> (Intel XE#653 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/653>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12548/shard-
>         dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-
>         indfb-draw-render.html> (Intel XE#2351 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2351> / Intel
>         XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) +5 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-
>         tiling-4.html> (Intel XE#2351 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2351> / Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12548/shard-
>         dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html>
>         (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/653>) +8 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-
>         primscrn-indfb-plflip-blt.html> (Intel XE#2313 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12548/shard-
>         bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-
>         blt.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2312>) +13 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-
>         primscrn-shrfb-pgflip-blt.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12548/shard-
>         dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-
>         pgflip-blt.html> (Intel XE#653 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/653>) +22 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-
>         primscrn-spr-indfb-fullscreen.html> (Intel XE#2312 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12548/shard-
>         bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-
>         fullscreen.html> (Intel XE#2313 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2313>) +10 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-slowdraw:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-
>         slowdraw.html> (Intel XE#653 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/653>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12548/shard-dg2-464/
>         igt@kms_frontbuffer_tracking@psr-slowdraw.html> (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) +16
>         other tests skip
>   *
> 
>     igt@kms_joiner@basic-big-joiner:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-464/igt@kms_joiner@basic-big-joiner.html>
>         (Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12548/shard-dg2-434/igt@kms_joiner@basic-big-
>         joiner.html> (Intel XE#346 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/346>)
>   *
> 
>     igt@kms_joiner@basic-force-ultra-joiner:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-464/igt@kms_joiner@basic-force-ultra-
>         joiner.html> (Intel XE#4208 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/4208>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12548/shard-dg2-466/igt@kms_joiner@basic-
>         force-ultra-joiner.html> (Intel XE#2925 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2925>)
>   *
> 
>     igt@kms_joiner@invalid-modeset-ultra-joiner:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-434/igt@kms_joiner@invalid-modeset-ultra-
>         joiner.html> (Intel XE#2927 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2927>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12548/shard-dg2-464/igt@kms_joiner@invalid-
>         modeset-ultra-joiner.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>)
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-25:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-
>         factor-0-25.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12548/
>         shard-dg2-435/igt@kms_plane_scaling@planes-downscale-
>         factor-0-25.html> (Intel XE#2763 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2763> / Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>)
>   *
> 
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-463/igt@kms_plane_scaling@planes-
>         upscale-20x20-downscale-factor-0-25.html> (Intel XE#2763
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763> /
>         Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/455>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGTPW_12548/shard-dg2-464/igt@kms_plane_scaling@planes-
>         upscale-20x20-downscale-factor-0-25.html> (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208> /
>         i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/2575>) +1 other test skip
>   *
> 
>     igt@kms_pm_backlight@fade-with-dpms:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-434/igt@kms_pm_backlight@fade-with-dpms.html>
>         (Intel XE#870 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/870>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGTPW_12548/shard-dg2-464/igt@kms_pm_backlight@fade-with-
>         dpms.html> (Intel XE#4208 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/4208>) +1 other test skip
>   *
> 
>     igt@kms_pm_dc@dc3co-vpb-simulation:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-464/igt@kms_pm_dc@dc3co-vpb-simulation.html>
>         (Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2351> / Intel XE#4208 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4208>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-dg2-463/
>         igt@kms_pm_dc@dc3co-vpb-simulation.html> (Intel XE#1122
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122>)
>   *
> 
>     igt@kms_pm_dc@deep-pkgc:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-464/igt@kms_pm_dc@deep-pkgc.html> (Intel
>         XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12548/shard-dg2-463/igt@kms_pm_dc@deep-pkgc.html>
>         (Intel XE#908 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/908>)
>   *
> 
>     igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-overlay-plane-
>         move-continuous-exceed-fully-sf.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12548/shard-
>         dg2-434/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-
>         exceed-fully-sf.html> (Intel XE#1489 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +14 other
>         tests skip
>   *
> 
>     igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-overlay-plane-
>         move-continuous-exceed-sf.html> (Intel XE#1489 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12548/shard-
>         dg2-464/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-
>         exceed-sf.html> (Intel XE#4208 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4208>) +6 other tests skip
>   *
> 
>     igt@kms_psr2_su@page_flip-nv12:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-436/igt@kms_psr2_su@page_flip-nv12.html>
>         (Intel XE#1122 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1122>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12548/shard-dg2-464/igt@kms_psr2_su@page_flip-
>         nv12.html> (Intel XE#4208 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/4208>)
>   *
> 
>     igt@kms_psr@fbc-psr-sprite-plane-onoff:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-435/igt@kms_psr@fbc-psr-sprite-plane-
>         onoff.html> (Intel XE#2850 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2850> / Intel XE#929 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/929>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12548/shard-
>         dg2-464/igt@kms_psr@fbc-psr-sprite-plane-onoff.html> (Intel
>         XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2351> / Intel XE#4208 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4208>) +8 other tests skip
>   *
> 
>     igt@kms_psr@fbc-psr-sprite-render:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-436/igt@kms_psr@fbc-psr-sprite-render.html>
>         (Intel XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2850> / Intel XE#929 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/929>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12548/shard-dg2-464/igt@kms_psr@fbc-psr-
>         sprite-render.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) +11 other
>         tests skip
>   *
> 
>     igt@kms_psr@fbc-psr2-primary-render:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-464/igt@kms_psr@fbc-psr2-primary-render.html>
>         (Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12548/shard-dg2-436/igt@kms_psr@fbc-psr2-primary-
>         render.html> (Intel XE#2850 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2850> / Intel XE#929 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +13 other
>         tests skip
>   *
> 
>     igt@kms_psr@psr-sprite-blt:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-464/igt@kms_psr@psr-sprite-blt.html> (Intel
>         XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2351> / Intel XE#4208 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4208>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-dg2-434/
>         igt@kms_psr@psr-sprite-blt.html> (Intel XE#2850 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2850> / Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +4
>         other tests skip
>   *
> 
>     igt@kms_rotation_crc@bad-pixel-format:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-436/igt@kms_rotation_crc@bad-pixel-
>         format.html> (Intel XE#3414 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/3414>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12548/shard-dg2-464/
>         igt@kms_rotation_crc@bad-pixel-format.html> (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208> /
>         i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/2575>) +2 other tests skip
>   *
> 
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-
>         reflect-x-180.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12548/
>         shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-
>         x-180.html> (Intel XE#1127 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1127>) +1 other test skip
>   *
> 
>     igt@kms_rotation_crc@sprite-rotation-180:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-464/igt@kms_rotation_crc@sprite-
>         rotation-180.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGTPW_12548/shard-dg2-436/igt@kms_rotation_crc@sprite-
>         rotation-180.html> (Intel XE#1033 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1033>) +2 other
>         tests dmesg-warn
>   *
> 
>     igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-464/igt@kms_rotation_crc@sprite-rotation-90-
>         pos-100-0.html> (Intel XE#4208 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4208> / i915#2575 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12548/shard-
>         dg2-436/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html>
>         (Intel XE#3414 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3414>) +1 other test skip
>   *
> 
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-
>         with-chamelium.html> (Intel XE#1500 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1500>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12548/shard-
>         dg2-464/igt@kms_tiled_display@basic-test-pattern-with-
>         chamelium.html> (Intel XE#4208 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4208> / i915#2575 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>   *
> 
>     igt@kms_vrr@cmrr:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-464/igt@kms_vrr@cmrr.html> (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208> /
>         i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/2575>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12548/shard-dg2-466/igt@kms_vrr@cmrr.html> (Intel
>         XE#2168 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168>)
>   *
> 
>     igt@kms_writeback@writeback-fb-id:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-436/igt@kms_writeback@writeback-fb-id.html>
>         (Intel XE#756 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/756>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGTPW_12548/shard-dg2-464/igt@kms_writeback@writeback-fb-
>         id.html> (Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/4208> / i915#2575 <https://gitlab.freedesktop.org/
>         drm/i915/kernel/-/issues/2575>) +1 other test skip
>   *
> 
>     igt@testdisplay:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-464/igt@testdisplay.html> (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGTPW_12548/shard-dg2-436/igt@testdisplay.html> (Intel XE#2705
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705> /
>         Intel XE#4212 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4212>)
>   *
> 
>     igt@xe_compute_preempt@compute-preempt:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-464/igt@xe_compute_preempt@compute-
>         preempt.html> (Intel XE#4208 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4208>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-dg2-435/
>         igt@xe_compute_preempt@compute-preempt.html> (Intel XE#1280
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280> /
>         Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/455>) +1 other test skip
>   *
> 
>     igt@xe_compute_preempt@compute-preempt-many:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-463/igt@xe_compute_preempt@compute-preempt-
>         many.html> (Intel XE#1280 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1280> / Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12548/shard-
>         dg2-464/igt@xe_compute_preempt@compute-preempt-many.html> (Intel
>         XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>)
>   *
> 
>     igt@xe_copy_basic@mem-copy-linear-0xfffe:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-464/igt@xe_copy_basic@mem-copy-
>         linear-0xfffe.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12548/shard-
>         dg2-436/igt@xe_copy_basic@mem-copy-linear-0xfffe.html> (Intel
>         XE#1123 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123>)
>   *
> 
>     igt@xe_copy_basic@mem-set-linear-0xfd:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-464/igt@xe_copy_basic@mem-set-
>         linear-0xfd.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12548/shard-
>         dg2-466/igt@xe_copy_basic@mem-set-linear-0xfd.html> (Intel
>         XE#1126 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1126>) +1 other test skip
>   *
> 
>     igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-435/igt@xe_eudebug@basic-vm-bind-ufence-
>         delay-ack.html> (Intel XE#3889 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3889>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-dg2-464/
>         igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html> (Intel
>         XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>)
>   *
> 
>     igt@xe_eudebug@multiple-sessions:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-466/igt@xe_eudebug@multiple-sessions.html>
>         (Intel XE#2905 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2905>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12548/shard-dg2-464/igt@xe_eudebug@multiple-
>         sessions.html> (Intel XE#4208 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4208>) +7 other tests skip
>   *
> 
>     igt@xe_eudebug_online@debugger-reopen:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-464/igt@xe_eudebug_online@debugger-
>         reopen.html> (Intel XE#4208 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/4208>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12548/shard-dg2-435/
>         igt@xe_eudebug_online@debugger-reopen.html> (Intel XE#2905
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) +13
>         other tests skip
>   *
> 
>     igt@xe_exec_fault_mode@once-bindexecqueue-imm:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-466/igt@xe_exec_fault_mode@once-
>         bindexecqueue-imm.html> (Intel XE#288 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/288>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12548/shard-
>         dg2-464/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html>
>         (Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) +22 other tests skip
>   *
> 
>     igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-464/igt@xe_exec_fault_mode@twice-userptr-
>         invalidate-race.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12548/shard-
>         dg2-463/igt@xe_exec_fault_mode@twice-userptr-invalidate-
>         race.html> (Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/288>) +24 other tests skip
>   *
> 
>     igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-464/igt@xe_exec_mix_modes@exec-simple-batch-
>         store-lr.html> (Intel XE#4208 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4208>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-dg2-466/
>         igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html> (Intel
>         XE#2360 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2360>) +1 other test skip
>   *
> 
>     igt@xe_live_ktest@xe_eudebug:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-bmg-6/igt@xe_live_ktest@xe_eudebug.html> (Intel
>         XE#1192 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1192>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12548/shard-bmg-7/igt@xe_live_ktest@xe_eudebug.html>
>         (Intel XE#2833 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2833>)
>   *
> 
>     igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-464/igt@xe_oa@oa-unit-exclusive-stream-
>         sample-oa.html> (Intel XE#4208 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4208>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-dg2-436/igt@xe_oa@oa-
>         unit-exclusive-stream-sample-oa.html> (Intel XE#2541 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2541> / Intel
>         XE#3573 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3573>) +9 other tests skip
>   *
> 
>     igt@xe_oa@syncs-ufence-wait-cfg:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-436/igt@xe_oa@syncs-ufence-wait-cfg.html>
>         (Intel XE#2541 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2541> / Intel XE#3573 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3573>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-dg2-464/
>         igt@xe_oa@syncs-ufence-wait-cfg.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) +8 other
>         tests skip
>   *
> 
>     igt@xe_pat@display-vs-wb-transient:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-436/igt@xe_pat@display-vs-wb-transient.html>
>         (Intel XE#1337 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1337>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12548/shard-dg2-464/igt@xe_pat@display-vs-wb-
>         transient.html> (Intel XE#4208 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4208>)
>   *
> 
>     igt@xe_pat@pat-index-xelpg:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-464/igt@xe_pat@pat-index-xelpg.html> (Intel
>         XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12548/shard-dg2-434/igt@xe_pat@pat-index-xelpg.html>
>         (Intel XE#979 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/979>)
>   *
> 
>     igt@xe_peer2peer@read:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-464/igt@xe_peer2peer@read.html> (Intel
>         XE#1061 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1061> / Intel XE#4208 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4208>) -> FAIL <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-dg2-436/
>         igt@xe_peer2peer@read.html> (Intel XE#1173 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1173>)
>   *
> 
>     igt@xe_pm@d3cold-basic:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-466/igt@xe_pm@d3cold-basic.html> (Intel
>         XE#2284 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2284> / Intel XE#366 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/366>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12548/shard-dg2-464/igt@xe_pm@d3cold-
>         basic.html> (Intel XE#4208 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/4208>)
>   *
> 
>     igt@xe_pm@d3cold-multiple-execs:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-464/igt@xe_pm@d3cold-multiple-execs.html>
>         (Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12548/shard-dg2-435/igt@xe_pm@d3cold-multiple-
>         execs.html> (Intel XE#2284 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2284> / Intel XE#366 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/366>)
>   *
> 
>     igt@xe_pm@s3-basic:
> 
>       o shard-dg2-set2: DMESG-WARN <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGT_8224/shard-dg2-434/igt@xe_pm@s3-basic.html> (Intel
>         XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1033> / Intel XE#569 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/569>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12548/shard-dg2-464/igt@xe_pm@s3-basic.html>
>         (Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>)
>   *
> 
>     igt@xe_pm@s3-exec-after:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-464/igt@xe_pm@s3-exec-after.html> (Intel
>         XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12548/shard-dg2-466/igt@xe_pm@s3-exec-after.html>
>         (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1033> / Intel XE#569 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/569>)
>   *
> 
>     igt@xe_pm@s4-d3hot-basic-exec:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-464/igt@xe_pm@s4-d3hot-basic-exec.html>
>         (Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) -> ABORT <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12548/shard-dg2-463/igt@xe_pm@s4-d3hot-basic-exec.html>
>         (Intel XE#1358 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1358>)
>   *
> 
>     igt@xe_pm@s4-exec-after:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-464/igt@xe_pm@s4-exec-after.html> (Intel
>         XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) -> ABORT <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12548/shard-dg2-434/igt@xe_pm@s4-exec-after.html>
>         (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1033> / Intel XE#1358 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1358>)
>   *
> 
>     igt@xe_pm@s4-mocs:
> 
>       o shard-dg2-set2: ABORT <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8224/shard-dg2-466/igt@xe_pm@s4-mocs.html> (Intel XE#1033
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> /
>         Intel XE#1358 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1358>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12548/shard-dg2-464/igt@xe_pm@s4-mocs.html> (Intel
>         XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>)
>   *
> 
>     igt@xe_pm@s4-vm-bind-prefetch:
> 
>       o shard-dg2-set2: ABORT <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8224/shard-dg2-436/igt@xe_pm@s4-vm-bind-prefetch.html>
>         (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1033> / Intel XE#1358 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1358>) -> ABORT <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-dg2-435/igt@xe_pm@s4-
>         vm-bind-prefetch.html> (Intel XE#1358 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1358>)
>   *
> 
>     igt@xe_pm@s4-vm-bind-userptr:
> 
>       o shard-dg2-set2: ABORT <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8224/shard-dg2-434/igt@xe_pm@s4-vm-bind-userptr.html>
>         (Intel XE#1358 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1358>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12548/shard-dg2-464/igt@xe_pm@s4-vm-bind-userptr.html>
>         (Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>)
>   *
> 
>     igt@xe_pm@vram-d3cold-threshold:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-436/igt@xe_pm@vram-d3cold-threshold.html>
>         (Intel XE#579 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/579>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGTPW_12548/shard-dg2-464/igt@xe_pm@vram-d3cold-threshold.html>
>         (Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>)
>   *
> 
>     igt@xe_query@multigpu-query-invalid-cs-cycles:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-464/igt@xe_query@multigpu-query-invalid-cs-
>         cycles.html> (Intel XE#4208 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/4208>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12548/shard-dg2-466/igt@xe_query@multigpu-
>         query-invalid-cs-cycles.html> (Intel XE#944 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>   *
> 
>     igt@xe_sriov_auto_provisioning@fair-allocation:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-464/igt@xe_sriov_auto_provisioning@fair-
>         allocation.html> (Intel XE#4208 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4208>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12548/shard-dg2-434/
>         igt@xe_sriov_auto_provisioning@fair-allocation.html> (Intel
>         XE#4130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130>)
>   *
> 
>     igt@xe_sriov_flr@flr-each-isolation:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-464/igt@xe_sriov_flr@flr-each-isolation.html>
>         (Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12548/shard-dg2-436/igt@xe_sriov_flr@flr-each-
>         isolation.html> (Intel XE#3342 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3342>)
>   *
> 
>     igt@xe_sriov_flr@flr-vf1-clear:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8224/shard-dg2-435/igt@xe_sriov_flr@flr-vf1-clear.html>
>         (Intel XE#3342 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3342>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12548/shard-dg2-464/igt@xe_sriov_flr@flr-vf1-
>         clear.html> (Intel XE#4208 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/4208>)
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * IGT: IGT_8224 -> IGTPW_12548
>   * Linux: xe-2601-a7df3eccb725a8d72f8f3ed87ee7ad9419b17380 ->
>     xe-2604-9831501a0c70f94565d0874560e61718edc3b8a4
> 
> IGTPW_12548: 57bed37c12b70280013ab91f59901946a251454c @ https:// 
> gitlab.freedesktop.org/drm/igt-gpu-tools.git
> IGT_8224: c659b986ba648584d36b3cfece897bc84a33dcbb @ https:// 
> gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-2601-a7df3eccb725a8d72f8f3ed87ee7ad9419b17380: 
> a7df3eccb725a8d72f8f3ed87ee7ad9419b17380
> xe-2604-9831501a0c70f94565d0874560e61718edc3b8a4: 
> 9831501a0c70f94565d0874560e61718edc3b8a4
> 

