Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33559C3DA60
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jul 2024 08:02:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD48C10E5A5;
	Thu, 18 Jul 2024 08:02:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GgVC6tjk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A5F110E5A1
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jul 2024 08:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721289762; x=1752825762;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=UPXCZwqxo5uEwqyKJwmxWjaL0O4tSSzHil1+1IToulU=;
 b=GgVC6tjkhb46TulWpsCgoytWrFFK6bGPX7QEQlhInUZ9K/Un7mBMcJAn
 uADehW+yigSVODga5hmcgqz+19HMDY6WSF1f07wr48dt5oPlgaqzl59zc
 GlHINV8kEQGkgvknR///0Q6VlYki2PVYoPPT+z9DAQUe78rFeefMnon91
 0CeaLvESmyEBhvsVvCM7PG52BGIQKSCHPRiBXHD5c5UKzu9dw5p6bwWBc
 y/X16JIeAJluXZkNf7yk7wjDWfNwflEkZJPG352lLCHplx01e1kpnUBzN
 iB3JAc5Ny5gKJz+qesrb9S5XBo31n115gOQXOmjiL2ooMlgGDdHiXxJck w==;
X-CSE-ConnectionGUID: yud28uopS26yMs8TBjfR6w==
X-CSE-MsgGUID: fmSIn0AHQbiphr4S4AAHNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18978381"
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; d="scan'208";a="18978381"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 01:02:41 -0700
X-CSE-ConnectionGUID: d/am3+jqSW6uG291tVVNcA==
X-CSE-MsgGUID: 6FBq1tdDS4+aOqHUn8MN6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; d="scan'208";a="55810687"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.246.28.172])
 ([10.246.28.172])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 01:02:40 -0700
Message-ID: <39c8c66f-1716-46f4-afa1-785067ffd741@linux.intel.com>
Date: Thu, 18 Jul 2024 10:02:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2ExeFULL=3A_failure_for_tests/intel-ci?=
 =?UTF-8?Q?/xe-sriov-vf=2Eblocklist=2Etxt=3A_Blocklist_for_SR-IOV_VF_BAT_run?=
 =?UTF-8?Q?s?=
To: igt-dev@lists.freedesktop.org, lgci.bug.filing@intel.com
References: <20240717153051.1000030-1-marcin.bernatowicz@linux.intel.com>
 <172125889924.271794.680296848999001703@2413ebb6fbb6>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <172125889924.271794.680296848999001703@2413ebb6fbb6>
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



On 7/18/2024 1:28 AM, Patchwork wrote:
> *Patch Details*
> *Series:*	tests/intel-ci/xe-sriov-vf.blocklist.txt: Blocklist for SR-IOV 
> VF BAT runs
> *URL:*	https://patchwork.freedesktop.org/series/136202/ 
> <https://patchwork.freedesktop.org/series/136202/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/index.html 
> <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/index.html>
> 
> 
>   CI Bug Log - changes from XEIGT_7928_full -> XEIGTPW_11423_full
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with XEIGTPW_11423_full absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_11423_full, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (3 -> 3)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in 
> XEIGTPW_11423_full:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7928/shard-dg2-466/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-dg2-434/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html>
>   *
> 
>     igt@kms_lease@page-flip-implicit-plane@pipe-b-edp-1:
> 
>       o shard-lnl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-lnl-3/igt@kms_lease@page-flip-implicit-plane@pipe-b-edp-1.html>
>   *
> 
>     igt@kms_vblank@ts-continuation-dpms-suspend:
> 
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7928/shard-lnl-6/igt@kms_vblank@ts-continuation-dpms-suspend.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-lnl-3/igt@kms_vblank@ts-continuation-dpms-suspend.html> +1 other test incomplete
>   *
> 
>     igt@xe_gt_freq@throttle_basic_api:
> 
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7928/shard-lnl-7/igt@xe_gt_freq@throttle_basic_api.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-lnl-7/igt@xe_gt_freq@throttle_basic_api.html>
>   *
> 
>     igt@xe_pm@s4-basic:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7928/shard-dg2-463/igt@xe_pm@s4-basic.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-dg2-434/igt@xe_pm@s4-basic.html>
> 

Not related to the change. The change does not impact existing runs.

Regards,
marcin

> 
>     Known issues
> 
> Here are the changes found in XEIGTPW_11423_full that come from known 
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
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
> 
>       o shard-lnl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html> (Intel XE#911 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/911>) +3 other tests fail
>   *
> 
>     igt@kms_atomic_transition@plane-toggle-modeset-transition:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7928/shard-dg2-466/igt@kms_atomic_transition@plane-toggle-modeset-transition.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-dg2-434/igt@kms_atomic_transition@plane-toggle-modeset-transition.html> (Intel XE#1426 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426>)
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
> 
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7928/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html> (Intel XE#1659 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659>)
>   *
> 
>     igt@kms_big_fb@linear-8bpp-rotate-90:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-lnl-6/igt@kms_big_fb@linear-8bpp-rotate-90.html> (Intel XE#1407 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407>)
>   *
> 
>     igt@kms_big_fb@x-tiled-64bpp-rotate-90:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-dg2-463/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#316 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +3 other tests skip
>   *
> 
>     igt@kms_big_fb@y-tiled-addfb:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-lnl-4/igt@kms_big_fb@y-tiled-addfb.html> (Intel XE#1467 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467>)
>   *
> 
>     igt@kms_big_fb@y-tiled-addfb-size-overflow:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-lnl-1/igt@kms_big_fb@y-tiled-addfb-size-overflow.html> (Intel XE#1428 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428>)
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +6 other tests skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-lnl-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +9 other tests skip
>   *
> 
>     igt@kms_big_joiner@basic:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-dg2-435/igt@kms_big_joiner@basic.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#346 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/346>)
>   *
> 
>     igt@kms_bw@linear-tiling-2-displays-2160x1440p:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>   *
> 
>     igt@kms_bw@linear-tiling-3-displays-2560x1440p:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-lnl-6/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html> (Intel XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>   *
> 
>     igt@kms_bw@linear-tiling-4-displays-2560x1440p:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-lnl-1/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html> (Intel XE#1512 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512>)
>   *
> 
>     igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-dg2-433/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +76 other tests skip
>   *
> 
>     igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-lnl-3/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html> (Intel XE#1399 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399>) +13 other tests skip
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html> (Intel XE#616 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/616>) +9 other tests fail
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#1252 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252>)
>   *
> 
>     igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-dg2-433/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +21 other tests skip
>   *
> 
>     igt@kms_cdclk@mode-transition:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-lnl-6/igt@kms_cdclk@mode-transition.html> (Intel XE#314 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/314> / Intel XE#599 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/599>)
>   *
> 
>     igt@kms_cdclk@mode-transition@pipe-b-edp-1:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-lnl-6/igt@kms_cdclk@mode-transition@pipe-b-edp-1.html> (Intel XE#314 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/314>) +2 other tests skip
>   *
> 
>     igt@kms_cdclk@plane-scaling:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-lnl-8/igt@kms_cdclk@plane-scaling.html> (Intel XE#1152 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152>) +3 other tests skip
>   *
> 
>     igt@kms_chamelium_color@ctm-limited-range:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-dg2-434/igt@kms_chamelium_color@ctm-limited-range.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#306 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) +1 other test skip
>   *
> 
>     igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +5 other tests skip
>   *
> 
>     igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-lnl-2/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html> (Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +8 other tests skip
>   *
> 
>     igt@kms_content_protection@dp-mst-lic-type-1:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-dg2-433/igt@kms_content_protection@dp-mst-lic-type-1.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#307 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>)
>   *
> 
>     igt@kms_content_protection@uevent:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-lnl-3/igt@kms_content_protection@uevent.html> (Intel XE#599 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/599>) +5 other tests skip
>   *
> 
>     igt@kms_cursor_crc@cursor-offscreen-512x512:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x512.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#308 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>) +1 other test skip
>   *
> 
>     igt@kms_cursor_crc@cursor-onscreen-256x85:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-lnl-6/igt@kms_cursor_crc@cursor-onscreen-256x85.html> (Intel XE#1424 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424>) +1 other test skip
>   *
> 
>     igt@kms_cursor_crc@cursor-onscreen-512x170:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-lnl-3/igt@kms_cursor_crc@cursor-onscreen-512x170.html> (Intel XE#1413 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413>) +1 other test skip
>   *
> 
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-lnl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html> (Intel XE#323 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>) +1 other test skip
>   *
> 
>     igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-lnl-1/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html> (Intel XE#309 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>) +5 other tests skip
>   *
> 
>     igt@kms_flip@2x-plain-flip:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-lnl-8/igt@kms_flip@2x-plain-flip.html> (Intel XE#1421 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421>) +9 other tests skip
>   *
> 
>     igt@kms_flip@flip-vs-suspend-interruptible:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7928/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> / Intel XE#2049 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049>)
>   *
> 
>     igt@kms_flip@flip-vs-suspend-interruptible@c-dp4:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7928/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible@c-dp4.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible@c-dp4.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) +2 other tests incomplete
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode.html> (Intel XE#1401 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401>) +6 other tests skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html> (Intel XE#1397 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397> / Intel XE#1745 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode.html> (Intel XE#1397 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html> (Intel XE#1401 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401> / Intel XE#1745 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745>) +6 other tests skip
>   *
> 
>     igt@kms_force_connector_basic@prune-stale-modes:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-dg2-463/igt@kms_force_connector_basic@prune-stale-modes.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / i915#5274 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274>)
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +21 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +21 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#658 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/658>)
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +18 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html> (Intel XE#656 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +38 other tests skip
>   *
> 
>     igt@kms_lease@page-flip-implicit-plane:
> 
>       o shard-lnl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-lnl-3/igt@kms_lease@page-flip-implicit-plane.html> (Intel XE#2205 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2205>)
>   *
> 
>     igt@kms_plane_multiple@tiling-y:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-dg2-463/igt@kms_plane_multiple@tiling-y.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +21 other tests skip
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#498 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/498>) +1 other test skip
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#498 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/498>) +2 other tests skip
>   *
> 
>     igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a-edp-1:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-lnl-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a-edp-1.html> (Intel XE#498 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/498>) +5 other tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-c-edp-1:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-lnl-3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-c-edp-1.html> (Intel XE#305 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/305>) +7 other tests skip
>   *
> 
>     igt@kms_pm_dc@dc3co-vpb-simulation:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-dg2-466/igt@kms_pm_dc@dc3co-vpb-simulation.html> (Intel XE#1122 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>   *
> 
>     igt@kms_pm_dc@dc5-psr:
> 
>       o shard-lnl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html> (Intel XE#718 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/718>)
>   *
> 
>     igt@kms_pm_dc@dc6-psr:
> 
>       o shard-lnl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-lnl-7/igt@kms_pm_dc@dc6-psr.html> (Intel XE#1430 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430>)
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-dg2-466/igt@kms_pm_dc@dc6-psr.html> (Intel XE#1129 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>   *
> 
>     igt@kms_pm_dc@deep-pkgc:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-dg2-434/igt@kms_pm_dc@deep-pkgc.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#908 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/908>)
>   *
> 
>     igt@kms_pm_rpm@modeset-non-lpsp:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-lnl-5/igt@kms_pm_rpm@modeset-non-lpsp.html> (Intel XE#1439 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439>) +1 other test skip
>   *
> 
>     igt@kms_psr2_sf@cursor-plane-update-sf:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-dg2-466/igt@kms_psr2_sf@cursor-plane-update-sf.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +2 other tests skip
>   *
> 
>     igt@kms_psr2_su@frontbuffer-xrgb8888:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-lnl-8/igt@kms_psr2_su@frontbuffer-xrgb8888.html> (Intel XE#1128 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128>)
>   *
> 
>     igt@kms_psr@fbc-pr-sprite-plane-onoff:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-lnl-8/igt@kms_psr@fbc-pr-sprite-plane-onoff.html> (Intel XE#1406 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406>) +2 other tests skip
>   *
> 
>     igt@kms_psr@fbc-psr2-no-drrs:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-dg2-463/igt@kms_psr@fbc-psr2-no-drrs.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#929 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +11 other tests skip
>   *
> 
>     igt@kms_rotation_crc@bad-tiling:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-dg2-435/igt@kms_rotation_crc@bad-tiling.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#327 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/327>) +2 other tests skip
>   *
> 
>     igt@kms_rotation_crc@primary-rotation-270:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-lnl-3/igt@kms_rotation_crc@primary-rotation-270.html> (Intel XE#1437 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437>) +1 other test skip
>   *
> 
>     igt@kms_setmode@invalid-clone-single-crtc-stealing:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-lnl-8/igt@kms_setmode@invalid-clone-single-crtc-stealing.html> (Intel XE#1435 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435>)
>   *
> 
>     igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7928/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html> (Intel XE#899 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/899>)
>   *
> 
>     igt@kms_writeback@writeback-fb-id:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-dg2-466/igt@kms_writeback@writeback-fb-id.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#756 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>) +1 other test skip
>   *
> 
>     igt@sriov_basic@enable-vfs-autoprobe-off:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-dg2-434/igt@sriov_basic@enable-vfs-autoprobe-off.html> (Intel XE#1091 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>   *
> 
>     igt@xe_copy_basic@mem-copy-linear-0xfffe:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0xfffe.html> (Intel XE#1123 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>   *
> 
>     igt@xe_copy_basic@mem-set-linear-0xfffe:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfffe.html> (Intel XE#1126 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>   *
> 
>     igt@xe_evict@evict-beng-cm-threads-small-multi-vm:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-lnl-6/igt@xe_evict@evict-beng-cm-threads-small-multi-vm.html> (Intel XE#688 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +11 other tests skip
>   *
> 
>     igt@xe_evict@evict-beng-large-multi-vm-cm:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7928/shard-dg2-435/igt@xe_evict@evict-beng-large-multi-vm-cm.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-dg2-436/igt@xe_evict@evict-beng-large-multi-vm-cm.html> (Intel XE#1600 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600>)
>   *
> 
>     igt@xe_evict@evict-threads-large:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7928/shard-dg2-463/igt@xe_evict@evict-threads-large.html> -> TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-dg2-466/igt@xe_evict@evict-threads-large.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> / Intel XE#392 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/392>) +1 other test timeout
>   *
> 
>     igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-lnl-7/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html> (Intel XE#1392 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +7 other tests skip
>   *
> 
>     igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +17 other tests skip
>   *
> 
>     igt@xe_gt_freq@freq_range_idle:
> 
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7928/shard-lnl-1/igt@xe_gt_freq@freq_range_idle.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-lnl-6/igt@xe_gt_freq@freq_range_idle.html> (Intel XE#1462 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1462>)
>   *
> 
>     igt@xe_gt_freq@freq_suspend:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-lnl-8/igt@xe_gt_freq@freq_suspend.html> (Intel XE#584 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/584>) +1 other test skip
>   *
> 
>     igt@xe_live_ktest@xe_bo:
> 
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7928/shard-lnl-5/igt@xe_live_ktest@xe_bo.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-lnl-3/igt@xe_live_ktest@xe_bo.html> (Intel XE#1192 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192>)
>   *
> 
>     igt@xe_mmap@small-bar:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-dg2-466/igt@xe_mmap@small-bar.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#512 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/512>)
>   *
> 
>     igt@xe_mmap@vram:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-lnl-1/igt@xe_mmap@vram.html> (Intel XE#1416 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416>)
>   *
> 
>     igt@xe_module_load@reload:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7928/shard-dg2-433/igt@xe_module_load@reload.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-dg2-436/igt@xe_module_load@reload.html> (Intel XE#2019 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019>) +3 other tests dmesg-warn
>   *
> 
>     igt@xe_pm@d3cold-basic:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-lnl-1/igt@xe_pm@d3cold-basic.html> (Intel XE#366 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>) +2 other tests skip
>   *
> 
>     igt@xe_pm@s3-multiple-execs:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7928/shard-dg2-463/igt@xe_pm@s3-multiple-execs.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-dg2-463/igt@xe_pm@s3-multiple-execs.html> (Intel XE#1551 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551> / Intel XE#569 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/569>) +1 other test dmesg-warn
>   *
> 
>     igt@xe_pm@s3-vm-bind-unbind-all:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7928/shard-dg2-435/igt@xe_pm@s3-vm-bind-unbind-all.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-dg2-466/igt@xe_pm@s3-vm-bind-unbind-all.html> (Intel XE#1162 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162>)
>   *
> 
>     igt@xe_pm@s4-basic-exec:
> 
>       o shard-lnl: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-lnl-2/igt@xe_pm@s4-basic-exec.html> (Intel XE#1358 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358> / Intel XE#1794 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>)
>   *
> 
>     igt@xe_pm@s4-vm-bind-userptr:
> 
>       o shard-lnl: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html> (Intel XE#1794 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>)
>   *
> 
>     igt@xe_pm_residency@toggle-gt-c6:
> 
>       o shard-lnl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-lnl-6/igt@xe_pm_residency@toggle-gt-c6.html> (Intel XE#1442 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1442>)
>   *
> 
>     igt@xe_query@multigpu-query-cs-cycles:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-dg2-464/igt@xe_query@multigpu-query-cs-cycles.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#944 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>   *
> 
>     igt@xe_query@multigpu-query-invalid-size:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-lnl-4/igt@xe_query@multigpu-query-invalid-size.html> (Intel XE#944 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +2 other tests skip
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@kms_big_fb@linear-32bpp-rotate-0:
> 
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7928/shard-dg2-433/igt@kms_big_fb@linear-32bpp-rotate-0.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-dg2-433/igt@kms_big_fb@linear-32bpp-rotate-0.html>
>   *
> 
>     {igt@kms_plane@plane-position-covered@pipe-a-plane-3}:
> 
>       o shard-lnl: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7928/shard-lnl-2/igt@kms_plane@plane-position-covered@pipe-a-plane-3.html> (Intel XE#324 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-lnl-4/igt@kms_plane@plane-position-covered@pipe-a-plane-3.html>
>   *
> 
>     {igt@kms_plane@plane-position-hole@pipe-b-plane-2}:
> 
>       o shard-lnl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7928/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-b-plane-2.html> (Intel XE#324 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-lnl-6/igt@kms_plane@plane-position-hole@pipe-b-plane-2.html> +2 other tests pass
>   *
> 
>     igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:
> 
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7928/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html> (Intel XE#899 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/899>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html> +1 other test pass
>   *
> 
>     igt@kms_vblank@ts-continuation-suspend:
> 
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7928/shard-dg2-466/igt@kms_vblank@ts-continuation-suspend.html> (Intel XE#2019 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-dg2-463/igt@kms_vblank@ts-continuation-suspend.html> +1 other test pass
>   *
> 
>     igt@xe_evict@evict-cm-threads-large:
> 
>       o shard-dg2-set2: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7928/shard-dg2-463/igt@xe_evict@evict-cm-threads-large.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> / Intel XE#392 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/392>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-dg2-464/igt@xe_evict@evict-cm-threads-large.html>
>   *
> 
>     igt@xe_exec_reset@parallel-close-fd:
> 
>       o shard-dg2-set2: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7928/shard-dg2-466/igt@xe_exec_reset@parallel-close-fd.html> (Intel XE#2273 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2273> / Intel XE#2309 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2309>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-dg2-463/igt@xe_exec_reset@parallel-close-fd.html>
>   *
> 
>     igt@xe_pm@s4-d3hot-basic-exec:
> 
>       o shard-lnl: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7928/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html> (Intel XE#1358 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358> / Intel XE#1607 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-lnl-6/igt@xe_pm@s4-d3hot-basic-exec.html>
>   *
> 
>     igt@xe_pm@s4-vm-bind-unbind-all:
> 
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7928/shard-dg2-434/igt@xe_pm@s4-vm-bind-unbind-all.html> (Intel XE#2019 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019> / Intel XE#2280 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-dg2-435/igt@xe_pm@s4-vm-bind-unbind-all.html>
>   *
> 
>     igt@xe_vm@mmap-style-bind-either-side-partial-hammer:
> 
>       o shard-dg2-set2: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7928/shard-dg2-434/igt@xe_vm@mmap-style-bind-either-side-partial-hammer.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-dg2-436/igt@xe_vm@mmap-style-bind-either-side-partial-hammer.html>
>   *
> 
>     igt@xe_vm@mmap-style-bind-either-side-partial-large-page-hammer:
> 
>       o shard-dg2-set2: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7928/shard-dg2-436/igt@xe_vm@mmap-style-bind-either-side-partial-large-page-hammer.html> (Intel XE#2268 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2268>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-dg2-435/igt@xe_vm@mmap-style-bind-either-side-partial-large-page-hammer.html>
> 
> 
>         Warnings
> 
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7928/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>)
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:
> 
>       o shard-lnl: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7928/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html> (Intel XE#1960 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1960>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>)
>   *
> 
>     igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
> 
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7928/shard-dg2-435/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html> (Intel XE#616 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/616>) -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-dg2-436/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html> (Intel XE#1551 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551>) +3 other tests dmesg-fail
>   *
> 
>     igt@kms_pm_dc@dc3co-vpb-simulation:
> 
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7928/shard-lnl-5/igt@kms_pm_dc@dc3co-vpb-simulation.html> (Intel XE#1909 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1909>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-lnl-8/igt@kms_pm_dc@dc3co-vpb-simulation.html> (Intel XE#736 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/736>)
>   *
> 
>     igt@xe_evict@evict-beng-mixed-many-threads-large:
> 
>       o shard-dg2-set2: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7928/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-large.html> (Intel XE#1041 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041> / Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> / Intel XE#392 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/392>) -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-large.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> / Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> / Intel XE#392 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/392>)
>   *
> 
>     igt@xe_evict@evict-beng-threads-large:
> 
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7928/shard-dg2-466/igt@xe_evict@evict-beng-threads-large.html> (Intel XE#1000 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000>) -> TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-dg2-436/igt@xe_evict@evict-beng-threads-large.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>)
>   *
> 
>     igt@xe_exec_reset@close-fd:
> 
>       o shard-lnl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7928/shard-lnl-8/igt@xe_exec_reset@close-fd.html> (Intel XE#2271 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2271>) -> ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-lnl-5/igt@xe_exec_reset@close-fd.html> (Intel XE#2271 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2271> / Intel XE#2309 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2309>)
>   *
> 
>     igt@xe_live_ktest@xe_mocs:
> 
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7928/shard-dg2-464/igt@xe_live_ktest@xe_mocs.html> (Intel XE#1999 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-dg2-433/igt@xe_live_ktest@xe_mocs.html> (Intel XE#1192 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>   *
> 
>     igt@xe_pm@s3-basic-exec:
> 
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7928/shard-lnl-2/igt@xe_pm@s3-basic-exec.html> (Intel XE#584 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/584>) -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-lnl-4/igt@xe_pm@s3-basic-exec.html> (Intel XE#1358 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358>)
>   *
> 
>     igt@xe_wedged@wedged-at-any-timeout:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7928/shard-dg2-466/igt@xe_wedged@wedged-at-any-timeout.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11423/shard-dg2-434/igt@xe_wedged@wedged-at-any-timeout.html> (Intel XE#1760 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760>)
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * IGT: IGT_7928 -> IGTPW_11423
> 
> IGTPW_11423: 11423
> IGT_7928: 294a7a487aab103c54b0deeb1559fcba371232d9 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-1619-cf52b34c47ed2a05c46193f0b9807ffd8838dbd8: 
> cf52b34c47ed2a05c46193f0b9807ffd8838dbd8
> 
