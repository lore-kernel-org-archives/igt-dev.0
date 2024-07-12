Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69082C2BD09
	for <igt-dev@archiver.kernel.org>; Fri, 12 Jul 2024 08:38:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28F1610EC65;
	Fri, 12 Jul 2024 08:38:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qy6nPK/u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7958410EC62
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Jul 2024 08:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720773537; x=1752309537;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=sVmjPJOoOHG/e2aQfVPIfpNwdu6zG5areWa7OUSCnXE=;
 b=Qy6nPK/u43cj1tgp8zwwCdlSRyV62T1iUSmdvzuHpHR1CyXuXb+WBXCg
 sEP5/NzDu+i6wSMk2AmMmKOIT7qZJf7WPorczkOLfMPM9PFUPrtOPOMHV
 WMJf5rSGsNY1mWonXNHpL4QMJ7Wq8tZRYdDmUVFh2ZOTT4FrGT5U+qX+x
 dis5SA8N7FzPFsbYkX17mq0jX5x9k9qR2zsysT5+8XI/2l/m3RlPJh6V5
 5ACqhcmrFuPAyCmyxqMNazLaNHQ1w0RwA8hgdyL3FAdjSin54Ek9AsRnj
 US9yn2tK/A4VxmozG+V4zw6iV84I2CZ4kLSegE7TclkLZtr3TBvnN5c/R A==;
X-CSE-ConnectionGUID: CQF9Sb3hR5Co0PkOXvUlJg==
X-CSE-MsgGUID: +pp3JQ5aSYaDWdxGYBFoWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="35747670"
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; d="scan'208";a="35747670"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2024 01:38:57 -0700
X-CSE-ConnectionGUID: yoM8wtkrQnOP/isASIY9SA==
X-CSE-MsgGUID: Zz2AecN3QVy7U1vFrcqcYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; d="scan'208";a="53152096"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.246.0.122])
 ([10.246.0.122])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2024 01:38:56 -0700
Message-ID: <fbfe1946-31d5-44bf-b753-2e5808d888ed@linux.intel.com>
Date: Fri, 12 Jul 2024 10:38:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2ExeFULL=3A_failure_for_tests/intel-ci?=
 =?UTF-8?Q?/xe=2Eblocklist=3A_Blocklist_SR-IOV_stress_tests?=
To: igt-dev@lists.freedesktop.org, lgci.bug.filing@intel.com
References: <20240711151437.996509-1-marcin.bernatowicz@linux.intel.com>
 <172072378016.146352.3095901512173700856@2413ebb6fbb6>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <172072378016.146352.3095901512173700856@2413ebb6fbb6>
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

On 7/11/2024 8:49 PM, Patchwork wrote:
> *Patch Details*
> *Series:*	tests/intel-ci/xe.blocklist: Blocklist SR-IOV stress tests
> *URL:*	https://patchwork.freedesktop.org/series/136001/ 
> <https://patchwork.freedesktop.org/series/136001/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/index.html 
> <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/index.html>
> 
> 
>   CI Bug Log - changes from XEIGT_7924_full -> XEIGTPW_11401_full
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with XEIGTPW_11401_full absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_11401_full, please notify your bug team 
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
> XEIGTPW_11401_full:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@kms_cursor_crc:
> 
>       o shard-lnl: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-lnl-6/igt@kms_cursor_crc.html>
>   *
> 
>     igt@kms_cursor_legacy@torture-move@pipe-b:
> 
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7924/shard-lnl-7/igt@kms_cursor_legacy@torture-move@pipe-b.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-lnl-4/igt@kms_cursor_legacy@torture-move@pipe-b.html> +1 other test incomplete
>   *
> 
>     igt@xe_gt_freq@freq_basic_api:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7924/shard-dg2-436/igt@xe_gt_freq@freq_basic_api.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-dg2-434/igt@xe_gt_freq@freq_basic_api.html>
>   *
> 
>     igt@xe_pm@s2idle-d3hot-basic-exec:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7924/shard-dg2-464/igt@xe_pm@s2idle-d3hot-basic-exec.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-dg2-433/igt@xe_pm@s2idle-d3hot-basic-exec.html>

Not related to the change.

Regards,
marcin

> 
> 
>     Known issues
> 
> Here are the changes found in XEIGTPW_11401_full that come from known 
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
>     igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-lnl-8/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html> (Intel XE#660 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/660>)
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
> 
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7924/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html> (Intel XE#1659 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659>)
>   *
> 
>     igt@kms_big_fb@linear-8bpp-rotate-270:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-lnl-2/igt@kms_big_fb@linear-8bpp-rotate-270.html> (Intel XE#1407 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407>) +3 other tests skip
>   *
> 
>     igt@kms_big_fb@y-tiled-32bpp-rotate-180:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-lnl-4/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +15 other tests skip
>   *
> 
>     igt@kms_bw@linear-tiling-2-displays-3840x2160p:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-lnl-4/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html> (Intel XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>   *
> 
>     igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-lnl-4/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html> (Intel XE#1399 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399>) +17 other tests skip
>   *
> 
>     igt@kms_cdclk@mode-transition:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-lnl-5/igt@kms_cdclk@mode-transition.html> (Intel XE#314 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/314> / Intel XE#599 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/599>)
>   *
> 
>     igt@kms_cdclk@mode-transition@pipe-b-edp-1:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-lnl-5/igt@kms_cdclk@mode-transition@pipe-b-edp-1.html> (Intel XE#314 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/314>) +2 other tests skip
>   *
> 
>     igt@kms_chamelium_color@degamma:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-lnl-4/igt@kms_chamelium_color@degamma.html> (Intel XE#306 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) +3 other tests skip
>   *
> 
>     igt@kms_chamelium_hpd@hdmi-hpd-fast:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-lnl-6/igt@kms_chamelium_hpd@hdmi-hpd-fast.html> (Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +10 other tests skip
>   *
> 
>     igt@kms_content_protection@dp-mst-lic-type-1:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-lnl-8/igt@kms_content_protection@dp-mst-lic-type-1.html> (Intel XE#307 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>)
>   *
> 
>     igt@kms_cursor_crc@cursor-sliding-512x170:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-lnl-8/igt@kms_cursor_crc@cursor-sliding-512x170.html> (Intel XE#1413 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413>) +1 other test skip
>   *
> 
>     igt@kms_cursor_crc@cursor-sliding-64x21:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-lnl-5/igt@kms_cursor_crc@cursor-sliding-64x21.html> (Intel XE#1424 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424>) +5 other tests skip
>   *
> 
>     igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-lnl-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html> (Intel XE#309 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>) +5 other tests skip
>   *
> 
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-lnl-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html> (Intel XE#323 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>) +1 other test skip
>   *
> 
>     igt@kms_cursor_legacy@torture-move:
> 
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7924/shard-lnl-7/igt@kms_cursor_legacy@torture-move.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-lnl-4/igt@kms_cursor_legacy@torture-move.html> (Intel XE#1330 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330>)
>   *
> 
>     igt@kms_cursor_legacy@torture-move@pipe-a:
> 
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7924/shard-lnl-7/igt@kms_cursor_legacy@torture-move@pipe-a.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-lnl-4/igt@kms_cursor_legacy@torture-move@pipe-a.html> (Intel XE#1330 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330>)
>   *
> 
>     igt@kms_feature_discovery@dp-mst:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-lnl-7/igt@kms_feature_discovery@dp-mst.html> (Intel XE#1137 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137>)
>   *
> 
>     igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-lnl-2/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html> (Intel XE#1421 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421>) +8 other tests skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode.html> (Intel XE#1401 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401>) +7 other tests skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html> (Intel XE#1401 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401> / Intel XE#1745 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745>) +7 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +23 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html> (Intel XE#1469 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469>)
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html> (Intel XE#656 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +49 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-suspend:
> 
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7924/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-suspend.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-lnl-5/igt@kms_frontbuffer_tracking@psr-suspend.html> (Intel XE#2050 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050>)
>   *
> 
>     igt@kms_hdr@invalid-metadata-sizes:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-lnl-6/igt@kms_hdr@invalid-metadata-sizes.html> (Intel XE#599 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/599>) +11 other tests skip
>   *
> 
>     igt@kms_hdr@static-toggle-dpms:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7924/shard-dg2-463/igt@kms_hdr@static-toggle-dpms.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-dg2-464/igt@kms_hdr@static-toggle-dpms.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) +1 other test incomplete
>   *
> 
>     igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7924/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html> (Intel XE#361 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/361>)
>   *
> 
>     igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a-edp-1:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-lnl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a-edp-1.html> (Intel XE#498 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/498>) +5 other tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-b-edp-1:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-lnl-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-b-edp-1.html> (Intel XE#305 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/305>) +27 other tests skip
>   *
> 
>     igt@kms_pm_dc@dc6-dpms:
> 
>       o shard-lnl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-lnl-7/igt@kms_pm_dc@dc6-dpms.html> (Intel XE#1430 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430>)
>   *
> 
>     igt@kms_pm_dc@deep-pkgc:
> 
>       o shard-lnl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-lnl-4/igt@kms_pm_dc@deep-pkgc.html> (Intel XE#2029 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029>)
>   *
> 
>     igt@kms_psr@pr-sprite-render:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-lnl-8/igt@kms_psr@pr-sprite-render.html> (Intel XE#1406 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406>) +4 other tests skip
>   *
> 
>     igt@kms_psr@psr-suspend@edp-1:
> 
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7924/shard-lnl-1/igt@kms_psr@psr-suspend@edp-1.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-lnl-1/igt@kms_psr@psr-suspend@edp-1.html> (Intel XE#2052 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2052>) +1 other test dmesg-warn
>   *
> 
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-lnl-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html> (Intel XE#1127 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127>)
>   *
> 
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-lnl-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html> (Intel XE#1437 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437>) +3 other tests skip
>   *
> 
>     igt@kms_setmode@basic-clone-single-crtc:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-lnl-1/igt@kms_setmode@basic-clone-single-crtc.html> (Intel XE#1435 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435>) +1 other test skip
>   *
> 
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-lnl-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html> (Intel XE#362 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/362>)
>   *
> 
>     igt@kms_writeback@writeback-check-output-xrgb2101010:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-lnl-8/igt@kms_writeback@writeback-check-output-xrgb2101010.html> (Intel XE#756 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>) +1 other test skip
>   *
> 
>     igt@xe_evict@evict-beng-mixed-threads-large:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7924/shard-dg2-434/igt@xe_evict@evict-beng-mixed-threads-large.html> -> TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-dg2-436/igt@xe_evict@evict-beng-mixed-threads-large.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> / Intel XE#392 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/392>)
>   *
> 
>     igt@xe_evict@evict-beng-threads-large-multi-vm:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-lnl-5/igt@xe_evict@evict-beng-threads-large-multi-vm.html> (Intel XE#688 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +9 other tests skip
>   *
> 
>     igt@xe_evict@evict-large-multi-vm-cm:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7924/shard-dg2-434/igt@xe_evict@evict-large-multi-vm-cm.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-dg2-436/igt@xe_evict@evict-large-multi-vm-cm.html> (Intel XE#1600 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600>)
>   *
> 
>     igt@xe_evict@evict-threads-large:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7924/shard-dg2-435/igt@xe_evict@evict-threads-large.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-dg2-435/igt@xe_evict@evict-threads-large.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> / Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> / Intel XE#392 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/392>)
>   *
> 
>     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-lnl-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html> (Intel XE#1392 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +10 other tests skip
>   *
> 
>     igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate:
> 
>       o shard-lnl: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-lnl-4/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate.html> (Intel XE#1169 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169> / Intel XE#1330 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330>)
>   *
> 
>     igt@xe_gt_freq@freq_range_idle:
> 
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7924/shard-lnl-1/igt@xe_gt_freq@freq_range_idle.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-lnl-4/igt@xe_gt_freq@freq_range_idle.html> (Intel XE#1462 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1462>)
>   *
> 
>     igt@xe_live_ktest@xe_migrate:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7924/shard-dg2-464/igt@xe_live_ktest@xe_migrate.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-dg2-464/igt@xe_live_ktest@xe_migrate.html> (Intel XE#1192 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>   *
> 
>     igt@xe_pat@pat-index-xehpc:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-lnl-8/igt@xe_pat@pat-index-xehpc.html> (Intel XE#1420 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420>)
>   *
> 
>     igt@xe_peer2peer@read:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-lnl-6/igt@xe_peer2peer@read.html> (Intel XE#1061 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061>) +1 other test skip
>   *
> 
>     igt@xe_pm@d3hot-mmap-vram:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-lnl-2/igt@xe_pm@d3hot-mmap-vram.html> (Intel XE#1948 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948>)
>   *
> 
>     igt@xe_pm@s3-mocs:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-lnl-4/igt@xe_pm@s3-mocs.html> (Intel XE#584 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/584>) +1 other test skip
>   *
> 
>     igt@xe_pm@s3-vm-bind-userptr:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7924/shard-dg2-466/igt@xe_pm@s3-vm-bind-userptr.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-dg2-433/igt@xe_pm@s3-vm-bind-userptr.html> (Intel XE#1551 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551> / Intel XE#569 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/569>)
>   *
> 
>     igt@xe_pm@s4-d3hot-basic-exec:
> 
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7924/shard-lnl-8/igt@xe_pm@s4-d3hot-basic-exec.html> -> ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html> (Intel XE#1358 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358> / Intel XE#1607 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607>)
>   *
> 
>     igt@xe_pm_residency@idle-residency:
> 
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7924/shard-lnl-7/igt@xe_pm_residency@idle-residency.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-lnl-2/igt@xe_pm_residency@idle-residency.html> (Intel XE#1442 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1442>)
>   *
> 
>     igt@xe_query@multigpu-query-invalid-size:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-lnl-5/igt@xe_query@multigpu-query-invalid-size.html> (Intel XE#944 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +4 other tests skip
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@core_setmaster@master-drop-set-shared-fd:
> 
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7924/shard-dg2-433/igt@core_setmaster@master-drop-set-shared-fd.html> (Intel XE#1162 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-dg2-466/igt@core_setmaster@master-drop-set-shared-fd.html>
>   *
> 
>     igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-4:
> 
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7924/shard-dg2-433/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-4.html> (Intel XE#827 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/827>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-dg2-435/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-4.html> +1 other test pass
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> 
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7924/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html> (Intel XE#1659 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html>
>   *
> 
>     igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4:
> 
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7924/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4.html> (Intel XE#2019 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-dg2-466/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4.html> +2 other tests pass
>   *
> 
>     igt@kms_flip@blocking-wf_vblank:
> 
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7924/shard-lnl-2/igt@kms_flip@blocking-wf_vblank.html> (Intel XE#886 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-lnl-6/igt@kms_flip@blocking-wf_vblank.html> +1 other test pass
>   *
> 
>     igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-dp-4:
> 
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7924/shard-dg2-433/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-dp-4.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-dg2-464/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-dp-4.html> +1 other test pass
>   *
> 
>     {igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-4}:
> 
>       o shard-lnl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7924/shard-lnl-4/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-4.html> (Intel XE#324 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-lnl-6/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-4.html> +5 other tests pass
>   *
> 
>     igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7924/shard-dg2-463/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-dg2-466/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html> +1 other test pass
>   *
> 
>     igt@xe_evict@evict-beng-cm-threads-large:
> 
>       o shard-dg2-set2: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7924/shard-dg2-433/igt@xe_evict@evict-beng-cm-threads-large.html> (Intel XE#1041 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041> / Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> / Intel XE#392 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/392>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-dg2-435/igt@xe_evict@evict-beng-cm-threads-large.html>
>   *
> 
>     igt@xe_evict@evict-beng-mixed-many-threads-small:
> 
>       o shard-dg2-set2: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7924/shard-dg2-464/igt@xe_evict@evict-beng-mixed-many-threads-small.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> / Intel XE#402 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/402>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-small.html>
>   *
> 
>     igt@xe_module_load@reload-no-display:
> 
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7924/shard-dg2-463/igt@xe_module_load@reload-no-display.html> (Intel XE#1204 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-dg2-463/igt@xe_module_load@reload-no-display.html>
>   *
> 
>     {igt@xe_oa@oa-regs-whitelisted@ccs-0}:
> 
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7924/shard-lnl-4/igt@xe_oa@oa-regs-whitelisted@ccs-0.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-lnl-2/igt@xe_oa@oa-regs-whitelisted@ccs-0.html> +1 other test pass
>   *
> 
>     igt@xe_pm_residency@toggle-gt-c6:
> 
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7924/shard-lnl-4/igt@xe_pm_residency@toggle-gt-c6.html> (Intel XE#958 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/958>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html>
> 
> 
>         Warnings
> 
>   *
> 
>     igt@kms_cursor_crc@cursor-rapid-movement-512x512:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7924/shard-dg2-463/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-dg2-463/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#308 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-suspend-interruptible:
> 
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7924/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend-interruptible.html> (Intel XE#2019 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019>) -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-dg2-435/igt@kms_flip@2x-flip-vs-suspend-interruptible.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> / Intel XE#2019 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019>)
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render:
> 
>       o shard-lnl: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7924/shard-lnl-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render.html> (Intel XE#656 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>)
>   *
> 
>     igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
> 
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7924/shard-dg2-464/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html> (Intel XE#616 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/616>) -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-dg2-435/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html> (Intel XE#1551 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551>) +1 other test dmesg-fail
>   *
> 
>     igt@kms_tiled_display@basic-test-pattern:
> 
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7924/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern.html> (Intel XE#1729 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#362 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/362>)
>   *
> 
>     igt@xe_evict@evict-beng-threads-large:
> 
>       o shard-dg2-set2: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7924/shard-dg2-434/igt@xe_evict@evict-beng-threads-large.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>) -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-dg2-466/igt@xe_evict@evict-beng-threads-large.html> (Intel XE#1000 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000>)
>   *
> 
>     igt@xe_evict@evict-mixed-many-threads-large:
> 
>       o shard-dg2-set2: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7924/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-large.html> (Intel XE#1041 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041> / Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> / Intel XE#392 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/392>) -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-large.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> / Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> / Intel XE#392 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/392>)
>   *
> 
>     igt@xe_live_ktest@xe_mocs:
> 
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7924/shard-dg2-433/igt@xe_live_ktest@xe_mocs.html> (Intel XE#1999 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-dg2-433/igt@xe_live_ktest@xe_mocs.html> (Intel XE#1192 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>   *
> 
>     igt@xe_wedged@basic-wedged:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7924/shard-dg2-434/igt@xe_wedged@basic-wedged.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11401/shard-dg2-434/igt@xe_wedged@basic-wedged.html> (Intel XE#1760 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760>)
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * IGT: IGT_7924 -> IGTPW_11401
>   * Linux: xe-1591-36e90f69c967f4cbcdd02c40c9ef25694ffb1a13 ->
>     xe-1596-e07122bf67b924e3cf597c65a6fb6b36b394f069
> 
> IGTPW_11401: 11401
> IGT_7924: 6e6ecdef9f167ff987f6d323f3ff6429c01b25e0 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-1591-36e90f69c967f4cbcdd02c40c9ef25694ffb1a13: 
> 36e90f69c967f4cbcdd02c40c9ef25694ffb1a13
> xe-1596-e07122bf67b924e3cf597c65a6fb6b36b394f069: 
> e07122bf67b924e3cf597c65a6fb6b36b394f069
> 
