Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 934F4C25B10
	for <igt-dev@archiver.kernel.org>; Fri, 10 May 2024 08:33:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33D7510E144;
	Fri, 10 May 2024 08:33:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iUwlYRyp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EA8E10E144;
 Fri, 10 May 2024 08:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715330023; x=1746866023;
 h=message-id:date:mime-version:subject:to:references:cc:
 from:in-reply-to:content-transfer-encoding;
 bh=MjA8BqkmBRfqjp4tMkh6F//mUREFfX1qye0jXG2VPSw=;
 b=iUwlYRypY6ZbVYeUrMXfnKMSnrSOmvdo/xldIv9Cai52VmjB7AG6//kS
 5aImqrKQqaQAQB3vzhXYc40HiDLf9/datG+3luId1GDIBQ7461P2yDYFv
 5krcbZjI5N/0jDVLr1mmX9RUt3nqGa3KXOySvsCpBZZ571FcbN/xlfTO8
 rAAOp5KiVnOFDJwfc19IfwFmtg0B+tpyVnbJsErEvWhql3T9YLR32vyZh
 Miktt4ZOk1+HqRfnG2ueCjOFE1wIXMc3GeO2JdXf9ZbQ28XJJsSPfl7jy
 nvdR2cG/zvARz3Y9Cdyt/xg2cFvX8uraIBLvrk4rpWGOIE5lDBI1f7+g5 w==;
X-CSE-ConnectionGUID: EabPMscqRRGGIoAllhknBw==
X-CSE-MsgGUID: GOPfWA5yQQ2AmREISRNzZg==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11161501"
X-IronPort-AV: E=Sophos;i="6.08,150,1712646000"; d="scan'208";a="11161501"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 01:33:42 -0700
X-CSE-ConnectionGUID: 1fJzYRcgSOe0J3L2hKm7Mw==
X-CSE-MsgGUID: sz299eXrQ/6zXxGysoUmOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,150,1712646000"; d="scan'208";a="34404335"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.246.28.172])
 ([10.246.28.172])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 01:33:42 -0700
Message-ID: <82a10631-a19f-4d23-a09a-0cf4207ae284@linux.intel.com>
Date: Fri, 10 May 2024 10:33:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2ExeFULL=3A_failure_for_lib/igt=5Fsrio?=
 =?UTF-8?Q?v=5Fdevice=3A_Adjust_the_igt=5Fsriov=5Fis=5Fpf_function?=
To: igt-dev@lists.freedesktop.org
References: <20240509141556.4128166-1-marcin.bernatowicz@linux.intel.com>
 <171528342342.2038581.7693805110698119531@8e613ede5ea5>
Content-Language: en-US
Cc: I915-ci-infra@lists.freedesktop.org
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <171528342342.2038581.7693805110698119531@8e613ede5ea5>
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



On 5/9/2024 9:37 PM, Patchwork wrote:
> *Patch Details*
> *Series:*	lib/igt_sriov_device: Adjust the igt_sriov_is_pf function
> *URL:*	https://patchwork.freedesktop.org/series/133390/ 
> <https://patchwork.freedesktop.org/series/133390/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133390v1/index.html 
> <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133390v1/index.html>
> 
> 
>   CI Bug Log - changes from XEIGT_7845_full -> XEIGTPW_11119_full
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with XEIGTPW_11119_full absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_11119_full, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (3 -> 1)
> 
> ERROR: It appears as if the changes made in XEIGTPW_11119_full prevented 
> too many machines from booting.

The change cannot do this.

Regards,
Marcin
> 
> Missing (2): shard-adlp shard-lnl
> 
> 
>     Known issues
> 
> Here are the changes found in XEIGTPW_11119_full that come from known 
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
>     igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-4:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7845/shard-dg2-435/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-4.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11119/shard-dg2-463/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-4.html> (Intel XE#827 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/827>) +1 other test fail
>   *
> 
>     igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-b-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11119/shard-dg2-433/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html> (Intel XE#650 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/650>) +3 other tests fail
>   *
> 
>     igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-7:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11119/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-7.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +35 other tests skip
>   *
> 
>     igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-7:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11119/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-7.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +11 other tests skip
>   *
> 
>     igt@kms_cdclk@mode-transition@pipe-c-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11119/shard-dg2-434/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#314 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/314>) +3 other tests skip
>   *
> 
>     igt@kms_chamelium_color@gamma:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11119/shard-dg2-433/igt@kms_chamelium_color@gamma.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#306 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>)
>   *
> 
>     igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11119/shard-dg2-434/igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html> (Intel XE#1178 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>)
>   *
> 
>     igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-d-hdmi-a-6:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7845/shard-dg2-463/igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-d-hdmi-a-6.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11119/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-d-hdmi-a-6.html> (Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> / Intel XE#282 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282>) +4 other tests dmesg-warn
>   *
> 
>     igt@kms_cursor_edge_walk@128x128-right-edge:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7845/shard-dg2-434/igt@kms_cursor_edge_walk@128x128-right-edge.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11119/shard-dg2-436/igt@kms_cursor_edge_walk@128x128-right-edge.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) +10 other tests skip
>   *
> 
>     igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7845/shard-dg2-466/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11119/shard-dg2-464/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html> (Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> / Intel XE#282 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282> / Intel XE#910 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/910>) +1 other test dmesg-warn
>   *
> 
>     igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
> 
>       o shard-dg2-set2: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11119/shard-dg2-436/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html> (Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> / Intel XE#282 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282> / Intel XE#910 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/910>)
>   *
> 
>     igt@kms_cursor_legacy@forked-move@all-pipes:
> 
>       o shard-dg2-set2: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11119/shard-dg2-436/igt@kms_cursor_legacy@forked-move@all-pipes.html> (Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> / Intel XE#282 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a6-hdmi-a7:
> 
>       o shard-dg2-set2: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11119/shard-dg2-464/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a6-hdmi-a7.html> (Intel XE#1162 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162> / Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>) +5 other tests dmesg-warn
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11119/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +1 other test skip
>   *
> 
>     igt@kms_hdr@invalid-hdr:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7845/shard-dg2-463/igt@kms_hdr@invalid-hdr.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11119/shard-dg2-466/igt@kms_hdr@invalid-hdr.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>)
>   *
> 
>     igt@kms_hdr@static-toggle-suspend@pipe-a-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11119/shard-dg2-433/igt@kms_hdr@static-toggle-suspend@pipe-a-dp-4.html> (Intel XE#616 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/616>)
>   *
> 
>     igt@kms_pipe_crc_basic@suspend-read-crc:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7845/shard-dg2-463/igt@kms_pipe_crc_basic@suspend-read-crc.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11119/shard-dg2-434/igt@kms_pipe_crc_basic@suspend-read-crc.html> (Intel XE#1162 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162> / Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>) +2 other tests dmesg-warn
>   *
> 
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11119/shard-dg2-433/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#305 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/305> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>)
>   *
> 
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11119/shard-dg2-433/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#305 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/305>) +2 other tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-6:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11119/shard-dg2-433/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-6.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +2 other tests skip
>   *
> 
>     igt@kms_pm_dc@dc3co-vpb-simulation:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11119/shard-dg2-435/igt@kms_pm_dc@dc3co-vpb-simulation.html> (Intel XE#1122 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>   *
> 
>     igt@kms_universal_plane@cursor-fb-leak:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7845/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11119/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak.html> (Intel XE#771 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/771> / Intel XE#899 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/899>)
>   *
> 
>     igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7845/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11119/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html> (Intel XE#899 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/899>)
>   *
> 
>     igt@xe_evict@evict-beng-threads-large:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7845/shard-dg2-433/igt@xe_evict@evict-beng-threads-large.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11119/shard-dg2-466/igt@xe_evict@evict-beng-threads-large.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> / Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>)
>   *
> 
>     igt@xe_evict@evict-large-multi-vm-cm:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7845/shard-dg2-466/igt@xe_evict@evict-large-multi-vm-cm.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11119/shard-dg2-436/igt@xe_evict@evict-large-multi-vm-cm.html> (Intel XE#1600 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600>)
>   *
> 
>     igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11119/shard-dg2-435/igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>)
>   *
> 
>     igt@xe_live_ktest@xe_migrate:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7845/shard-dg2-463/igt@xe_live_ktest@xe_migrate.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11119/shard-dg2-466/igt@xe_live_ktest@xe_migrate.html> (Intel XE#1192 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>   *
> 
>     igt@xe_pm@s2idle-exec-after:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7845/shard-dg2-464/igt@xe_pm@s2idle-exec-after.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11119/shard-dg2-436/igt@xe_pm@s2idle-exec-after.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +23 other tests skip
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7845/shard-dg2-436/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#829 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/829>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11119/shard-dg2-436/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html> +3 other tests pass
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:
> 
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7845/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html> (Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11119/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html>
>   *
> 
>     igt@kms_cursor_legacy@forked-bo@all-pipes:
> 
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7845/shard-dg2-463/igt@kms_cursor_legacy@forked-bo@all-pipes.html> (Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> / Intel XE#282 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11119/shard-dg2-436/igt@kms_cursor_legacy@forked-bo@all-pipes.html> +5 other tests pass
>   *
> 
>     igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6:
> 
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7845/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6.html> (Intel XE#1162 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162> / Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11119/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6.html> +4 other tests pass
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7845/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11119/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html> +8 other tests pass
>   *
> 
>     igt@kms_sequence@get-forked-busy:
> 
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7845/shard-dg2-435/igt@kms_sequence@get-forked-busy.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11119/shard-dg2-433/igt@kms_sequence@get-forked-busy.html> +4 other tests pass
>   *
> 
>     igt@xe_evict@evict-beng-mixed-many-threads-small:
> 
>       o shard-dg2-set2: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7845/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> / Intel XE#402 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/402>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11119/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-small.html>
>   *
> 
>     igt@xe_evict@evict-threads-large:
> 
>       o shard-dg2-set2: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7845/shard-dg2-435/igt@xe_evict@evict-threads-large.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> / Intel XE#392 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/392>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11119/shard-dg2-464/igt@xe_evict@evict-threads-large.html> +1 other test pass
>   *
> 
>     igt@xe_live_ktest@xe_bo:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7845/shard-dg2-434/igt@xe_live_ktest@xe_bo.html> (Intel XE#1192 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11119/shard-dg2-433/igt@xe_live_ktest@xe_bo.html> +1 other test pass
> 
> 
>         Warnings
> 
>   *
> 
>     igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7845/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#607 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/607>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11119/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>   *
> 
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7845/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#829 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/829>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11119/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>   *
> 
>     igt@kms_bw@linear-tiling-1-displays-2160x1440p:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7845/shard-dg2-436/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11119/shard-dg2-464/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>   *
> 
>     igt@kms_bw@linear-tiling-3-displays-1920x1080p:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7845/shard-dg2-466/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11119/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>   *
> 
>     igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7845/shard-dg2-434/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11119/shard-dg2-436/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +1 other test skip
>   *
> 
>     igt@kms_chamelium_frames@hdmi-aspect-ratio:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7845/shard-dg2-436/igt@kms_chamelium_frames@hdmi-aspect-ratio.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11119/shard-dg2-436/igt@kms_chamelium_frames@hdmi-aspect-ratio.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>   *
> 
>     igt@kms_chamelium_frames@hdmi-frame-dump:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7845/shard-dg2-436/igt@kms_chamelium_frames@hdmi-frame-dump.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11119/shard-dg2-433/igt@kms_chamelium_frames@hdmi-frame-dump.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>)
>   *
> 
>     igt@kms_content_protection@atomic-dpms:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7845/shard-dg2-464/igt@kms_content_protection@atomic-dpms.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11119/shard-dg2-434/igt@kms_content_protection@atomic-dpms.html> (Intel XE#1178 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>)
>   *
> 
>     igt@kms_content_protection@dp-mst-lic-type-0:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7845/shard-dg2-464/igt@kms_content_protection@dp-mst-lic-type-0.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#307 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11119/shard-dg2-436/igt@kms_content_protection@dp-mst-lic-type-0.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>   *
> 
>     igt@kms_cursor_legacy@forked-move:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7845/shard-dg2-436/igt@kms_cursor_legacy@forked-move.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11119/shard-dg2-436/igt@kms_cursor_legacy@forked-move.html> (Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> / Intel XE#282 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282>)
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7845/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#1234 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1234>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11119/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>)
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7845/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11119/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +2 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-pgflip-blt:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7845/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-pgflip-blt.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#1235 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1235>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11119/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-pgflip-blt.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7845/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11119/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +2 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7845/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11119/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +4 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7845/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11119/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>)
>   *
> 
>     igt@kms_hdmi_inject@inject-audio:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7845/shard-dg2-433/igt@kms_hdmi_inject@inject-audio.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#417 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/417>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11119/shard-dg2-436/igt@kms_hdmi_inject@inject-audio.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>   *
> 
>     igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
> 
>       o shard-dg2-set2: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7845/shard-dg2-436/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html> (Intel XE#1162 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162>) -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11119/shard-dg2-464/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html> (Intel XE#616 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/616>) +1 other test fail
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:
> 
>       o shard-dg2-set2: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7845/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html> (Intel XE#380 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/380> / Intel XE#904 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/904> / Intel XE#909 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/909>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11119/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format:
> 
>       o shard-dg2-set2: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7845/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html> (Intel XE#380 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/380> / Intel XE#904 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/904> / Intel XE#909 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/909>) -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11119/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> / Intel XE#904 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/904> / Intel XE#909 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/909>)
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a-hdmi-a-6:
> 
>       o shard-dg2-set2: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7845/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a-hdmi-a-6.html> (Intel XE#904 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/904> / Intel XE#909 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/909>) -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11119/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a-hdmi-a-6.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> / Intel XE#904 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/904> / Intel XE#909 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/909>)
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7845/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#305 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/305> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11119/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>   *
> 
>     igt@kms_psr2_su@frontbuffer-xrgb8888:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7845/shard-dg2-466/igt@kms_psr2_su@frontbuffer-xrgb8888.html> (Intel XE#1122 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11119/shard-dg2-436/igt@kms_psr2_su@frontbuffer-xrgb8888.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>   *
> 
>     igt@kms_psr@psr2-primary-render:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7845/shard-dg2-463/igt@kms_psr@psr2-primary-render.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#929 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11119/shard-dg2-436/igt@kms_psr@psr2-primary-render.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +1 other test skip
>   *
> 
>     igt@kms_scaling_modes@scaling-mode-center:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7845/shard-dg2-433/igt@kms_scaling_modes@scaling-mode-center.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11119/shard-dg2-436/igt@kms_scaling_modes@scaling-mode-center.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>   *
> 
>     igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7845/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11119/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +5 other tests skip
>   *
> 
>     igt@xe_pm@d3cold-basic-exec:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7845/shard-dg2-435/igt@xe_pm@d3cold-basic-exec.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#366 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11119/shard-dg2-436/igt@xe_pm@d3cold-basic-exec.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>   *
> 
>     igt@xe_query@multigpu-query-invalid-size:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7845/shard-dg2-434/igt@xe_query@multigpu-query-invalid-size.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#944 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11119/shard-dg2-436/igt@xe_query@multigpu-query-invalid-size.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * IGT: IGT_7845 -> IGTPW_11119
> 
> IGTPW_11119: 11119
> IGT_7845: 7845
> xe-1263-92f877dd46245e4a44b6d24b5e303b8c03c40c75: 
> 92f877dd46245e4a44b6d24b5e303b8c03c40c75
> 
