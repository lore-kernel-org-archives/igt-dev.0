Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99BAFC52D7B
	for <igt-dev@archiver.kernel.org>; Tue, 13 Aug 2024 07:13:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C6A910E2CC;
	Tue, 13 Aug 2024 07:13:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wbm3UrSY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F18510E2CC
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Aug 2024 07:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723533190; x=1755069190;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=/Ye3QlUF6bH3jE/NQC/MGgz+hkTRl8tVH3rNPzrRNJY=;
 b=Wbm3UrSYEmO/q4hATuILXoeEfxupNukfo3/bQeV5OhbodNNvrDePB/UV
 1OUUgr89WDDB938wPXxactAkgWgGaRb8IS19BgiWjO8IhnChD9VXNONFa
 1NzsBLZMLJtSOJBpLCmoa+6M4aUYp+/vY2uT0yx6qHlHPfTYp49bZ7qqF
 CTThgF7d1TV1TneZEyOxOYk+cNmCevWTfnSe0+MyFaYnc79jToD+Mii3+
 hKsj/FObTrSgg0EOwCK07lrw0733m8qfiMz8o3WvTG/Z/TK4nuJ1Q7luW
 QuqPGpTRPoerCudv4+K3mriRP6yK1Lpr2vrqILEie9XZfGfPdMaDl0nHx w==;
X-CSE-ConnectionGUID: JvMgJIcLSD+HfOc2C0Kfjg==
X-CSE-MsgGUID: k4ARVMArR8Wg5VB5sTP8fA==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="32354197"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="32354197"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 00:13:10 -0700
X-CSE-ConnectionGUID: iZqSAmtFS+6YkUtFmb1Xhg==
X-CSE-MsgGUID: FE/yjbumQI6ZXyh5JVPsxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="59311659"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.245.96.225])
 ([10.245.96.225])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 00:13:08 -0700
Message-ID: <06384b82-86ba-4771-bdbb-5b0c9182004b@linux.intel.com>
Date: Tue, 13 Aug 2024 09:13:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2ExeFULL=3A_failure_for_tests/intel/xe?=
 =?UTF-8?Q?=5Fhuc=5Fcopy=3A_Enhance_HuC_status_check_for_VF_mode?=
To: igt-dev@lists.freedesktop.org
References: <20240812180812.1310155-1-marcin.bernatowicz@linux.intel.com>
 <172351307624.596344.6410981986144568279@2413ebb6fbb6>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <172351307624.596344.6410981986144568279@2413ebb6fbb6>
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



On 8/13/2024 3:37 AM, Patchwork wrote:
> *Patch Details*
> *Series:*	tests/intel/xe_huc_copy: Enhance HuC status check for VF mode
> *URL:*	https://patchwork.freedesktop.org/series/137198/ 
> <https://patchwork.freedesktop.org/series/137198/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/index.html 
> <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/index.html>
> 
> 
>   CI Bug Log - changes from XEIGT_7966_full -> XEIGTPW_11559_full
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with XEIGTPW_11559_full absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_11559_full, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
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
> XEIGTPW_11559_full:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-lnl-6/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-lnl-6/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html>
> 
> 
>         Warnings
> 
>   * igt@xe_oa@whitelisted-registers-userspace-config:
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-433/igt@xe_oa@whitelisted-registers-userspace-config.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#2207 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2207>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-432/igt@xe_oa@whitelisted-registers-userspace-config.html> +4 other tests skip
> 

Not related to the change. This change is isolated to the xe_huc_copy 
and does not impact other tests.

Regards,
marcin

> 
>         Suppressed
> 
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
> 
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs:
> 
>       o {shard-bmg}: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html> (Intel XE#2436 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436>) -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html>
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-c-hdmi-a-3:
> 
>       o {shard-bmg}: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-c-hdmi-a-3.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-c-hdmi-a-3.html> +4 other tests incomplete
>   *
> 
>     igt@kms_frontbuffer_tracking@basic:
> 
>       o {shard-bmg}: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-bmg-6/igt@kms_frontbuffer_tracking@basic.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-bmg-3/igt@kms_frontbuffer_tracking@basic.html> +1 other test dmesg-warn
>   *
> 
>     igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
> 
>       o {shard-bmg}: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-bmg-8/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-bmg-8/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html>
> 
> 
>     Known issues
> 
> Here are the changes found in XEIGTPW_11559_full that come from known 
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
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html> (Intel XE#911 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/911>) +3 other tests fail
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
> 
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html> (Intel XE#1659 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659>)
>   *
> 
>     igt@kms_big_fb@linear-16bpp-rotate-90:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-lnl-4/igt@kms_big_fb@linear-16bpp-rotate-90.html> (Intel XE#1407 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407>)
>   *
> 
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-lnl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +2 other tests skip
>   *
> 
>     igt@kms_bw@linear-tiling-4-displays-1920x1080p:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-lnl-8/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html> (Intel XE#1512 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512>)
>   *
> 
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-lnl-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html> (Intel XE#1399 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399>) +2 other tests skip
>   *
> 
>     igt@kms_chamelium_frames@hdmi-cmp-planes-random:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-lnl-6/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html> (Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +1 other test skip
>   *
> 
>     igt@kms_cursor_crc@cursor-onscreen-32x10:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-32x10.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>)
>   *
> 
>     igt@kms_cursor_crc@cursor-random-512x512:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-lnl-1/igt@kms_cursor_crc@cursor-random-512x512.html> (Intel XE#1413 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413>)
>   *
> 
>     igt@kms_cursor_crc@cursor-sliding-128x42:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-128x42.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-433/igt@kms_cursor_crc@cursor-sliding-128x42.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) +1 other test incomplete
>   *
> 
>     igt@kms_cursor_crc@cursor-sliding-256x85:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-lnl-2/igt@kms_cursor_crc@cursor-sliding-256x85.html> (Intel XE#1424 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424>)
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-lnl-2/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html> (Intel XE#309 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>) +2 other tests skip
>   *
> 
>     igt@kms_dsc@dsc-with-bpc-formats:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-lnl-2/igt@kms_dsc@dsc-with-bpc-formats.html> (Intel XE#599 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/599>) +1 other test skip
>   *
> 
>     igt@kms_flip@2x-wf_vblank-ts-check:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-lnl-5/igt@kms_flip@2x-wf_vblank-ts-check.html> (Intel XE#1421 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421>) +1 other test skip
>   *
> 
>     igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1:
> 
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-lnl-7/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-lnl-3/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html> (Intel XE#886 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) +2 other tests fail
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html> (Intel XE#1401 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401> / Intel XE#1745 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode.html> (Intel XE#1401 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-tiling-y:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-tiling-y.html> (Intel XE#1469 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-blt:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-blt.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +1 other test skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-wc:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-wc.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>)
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +1 other test skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html> (Intel XE#656 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +7 other tests skip
>   *
> 
>     igt@kms_plane@plane-position-hole:
> 
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-lnl-3/igt@kms_plane@plane-position-hole.html> -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-lnl-5/igt@kms_plane@plane-position-hole.html> (Intel XE#324 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) +1 other test dmesg-fail
>   *
> 
>     igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-2:
> 
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-2.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-lnl-3/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-2.html> (Intel XE#324 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) +1 other test dmesg-warn
>   *
> 
>     igt@kms_plane_cursor@viewport@pipe-b-edp-1-size-128:
> 
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-lnl-5/igt@kms_plane_cursor@viewport@pipe-b-edp-1-size-128.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-lnl-7/igt@kms_plane_cursor@viewport@pipe-b-edp-1-size-128.html> (Intel XE#1471 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1471>) +1 other test fail
>   *
> 
>     igt@kms_psr@fbc-psr2-sprite-plane-onoff:
> 
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-lnl-6/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-lnl-4/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html> (Intel XE#1649 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649>) +1 other test fail
>   *
> 
>     igt@kms_psr@pr-sprite-render:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-lnl-1/igt@kms_psr@pr-sprite-render.html> (Intel XE#1406 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406>) +1 other test skip
>   *
> 
>     igt@kms_rotation_crc@bad-tiling:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-lnl-6/igt@kms_rotation_crc@bad-tiling.html> (Intel XE#1437 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437>)
>   *
> 
>     igt@kms_rotation_crc@primary-rotation-90:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-433/igt@kms_rotation_crc@primary-rotation-90.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#327 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/327>)
>   *
> 
>     igt@xe_evict@evict-cm-threads-large-multi-vm:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-lnl-3/igt@xe_evict@evict-cm-threads-large-multi-vm.html> (Intel XE#688 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>)
>   *
> 
>     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-lnl-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html> (Intel XE#1392 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>)
>   *
> 
>     igt@xe_exec_reset@parallel-gt-reset:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-432/igt@xe_exec_reset@parallel-gt-reset.html> -> TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-435/igt@xe_exec_reset@parallel-gt-reset.html> (Intel XE#2105 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105>)
>   *
> 
>     igt@xe_live_ktest@xe_dma_buf:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-434/igt@xe_live_ktest@xe_dma_buf.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-463/igt@xe_live_ktest@xe_dma_buf.html> (Intel XE#1192 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-lnl-6/igt@xe_live_ktest@xe_dma_buf.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-lnl-6/igt@xe_live_ktest@xe_dma_buf.html> (Intel XE#1192 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192>)
>   *
> 
>     igt@xe_oa@mmio-triggered-reports:
> 
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-lnl-6/igt@xe_oa@mmio-triggered-reports.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-lnl-6/igt@xe_oa@mmio-triggered-reports.html> (Intel XE#2249 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249>)
>   *
> 
>     igt@xe_oa@mmio-triggered-reports@ccs-0:
> 
>       o shard-lnl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-lnl-6/igt@xe_oa@mmio-triggered-reports@ccs-0.html> (Intel XE#2249 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249>)
>   *
> 
>     igt@xe_pm@s2idle-vm-bind-userptr:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-436/igt@xe_pm@s2idle-vm-bind-userptr.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-466/igt@xe_pm@s2idle-vm-bind-userptr.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> / Intel XE#1694 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694>)
>   *
> 
>     igt@xe_pm@s4-d3hot-basic-exec:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-435/igt@xe_pm@s4-d3hot-basic-exec.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-466/igt@xe_pm@s4-d3hot-basic-exec.html> (Intel XE#2019 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019>) +1 other test dmesg-warn
>   *
> 
>     igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
> 
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-lnl-8/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html> (Intel XE#944 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
> 
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-lnl-4/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html> (Intel XE#1701 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-lnl-4/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html> +1 other test pass
>   *
> 
>     igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
> 
>       o {shard-bmg}: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html> (Intel XE#1426 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html> +1 other test pass
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-a-dp-2:
> 
>       o {shard-bmg}: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-a-dp-2.html> (Intel XE#2436 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-a-dp-2.html>
>   *
> 
>     igt@kms_cursor_crc@cursor-suspend:
> 
>       o shard-lnl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-lnl-6/igt@kms_cursor_crc@cursor-suspend.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-lnl-2/igt@kms_cursor_crc@cursor-suspend.html> +1 other test pass
>   *
> 
>     igt@kms_cursor_legacy@torture-bo@pipe-a:
> 
>       o shard-lnl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-lnl-6/igt@kms_cursor_legacy@torture-bo@pipe-a.html> (Intel XE#877 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-lnl-6/igt@kms_cursor_legacy@torture-bo@pipe-a.html> +1 other test pass
>   *
> 
>     igt@kms_flip@2x-absolute-wf_vblank-interruptible@cd-dp2-hdmi-a3:
> 
>       o {shard-bmg}: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-bmg-3/igt@kms_flip@2x-absolute-wf_vblank-interruptible@cd-dp2-hdmi-a3.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-bmg-3/igt@kms_flip@2x-absolute-wf_vblank-interruptible@cd-dp2-hdmi-a3.html> +1 other test pass
>   *
> 
>     igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@bc-dp2-hdmi-a3:
> 
>       o {shard-bmg}: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-bmg-2/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@bc-dp2-hdmi-a3.html> (Intel XE#877 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-bmg-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@bc-dp2-hdmi-a3.html> +7 other tests pass
>   *
> 
>     igt@kms_flip@wf_vblank-ts-check@b-edp1:
> 
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-lnl-7/igt@kms_flip@wf_vblank-ts-check@b-edp1.html> (Intel XE#886 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-lnl-5/igt@kms_flip@wf_vblank-ts-check@b-edp1.html> +1 other test pass
>   *
> 
>     igt@kms_plane@plane-position-covered:
> 
>       o shard-lnl: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-lnl-3/igt@kms_plane@plane-position-covered.html> (Intel XE#324 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-lnl-2/igt@kms_plane@plane-position-covered.html> +1 other test pass
>   *
> 
>     igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-4:
> 
>       o shard-lnl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-4.html> (Intel XE#324 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-lnl-3/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-4.html> +5 other tests pass
>   *
> 
>     igt@kms_plane_cursor@viewport@pipe-d-hdmi-a-6-size-256:
> 
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-466/igt@kms_plane_cursor@viewport@pipe-d-hdmi-a-6-size-256.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-433/igt@kms_plane_cursor@viewport@pipe-d-hdmi-a-6-size-256.html> +1 other test pass
>   *
> 
>     igt@kms_pm_backlight@basic-brightness:
> 
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-lnl-8/igt@kms_pm_backlight@basic-brightness.html> (Intel XE#870 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-lnl-8/igt@kms_pm_backlight@basic-brightness.html>
>   *
> 
>     igt@kms_pm_dc@dc6-dpms:
> 
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-lnl-1/igt@kms_pm_dc@dc6-dpms.html> (Intel XE#1430 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html>
>   *
> 
>     igt@kms_pm_rpm@system-suspend-modeset:
> 
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-lnl-1/igt@kms_pm_rpm@system-suspend-modeset.html> (Intel XE#2028 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-lnl-5/igt@kms_pm_rpm@system-suspend-modeset.html> +5 other tests pass
>   *
> 
>     igt@kms_psr@fbc-psr2-primary-render:
> 
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-lnl-2/igt@kms_psr@fbc-psr2-primary-render.html> (Intel XE#1649 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-lnl-2/igt@kms_psr@fbc-psr2-primary-render.html> +1 other test pass
>   *
> 
>     igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
> 
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html> (Intel XE#899 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/899>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html> +1 other test pass
>   *
> 
>     igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-4:
> 
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-432/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-4.html> (Intel XE#1551 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-435/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-4.html> +1 other test pass
>   *
> 
>     igt@kms_vrr@flip-basic:
> 
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-lnl-2/igt@kms_vrr@flip-basic.html> (Intel XE#2443 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-lnl-8/igt@kms_vrr@flip-basic.html> +3 other tests pass
>   *
> 
>     igt@xe_evict@evict-beng-mixed-threads-large:
> 
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-434/igt@xe_evict@evict-beng-mixed-threads-large.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> / Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-463/igt@xe_evict@evict-beng-mixed-threads-large.html>
>   *
> 
>     igt@xe_evict@evict-mixed-threads-large:
> 
>       o shard-dg2-set2: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-434/igt@xe_evict@evict-mixed-threads-large.html> +2 other tests pass
>       o {shard-bmg}: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-bmg-3/igt@xe_evict@evict-mixed-threads-large.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> / Intel XE#2472 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-bmg-3/igt@xe_evict@evict-mixed-threads-large.html>
>   *
> 
>     igt@xe_exec_reset@parallel-gt-reset:
> 
>       o {shard-bmg}: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-bmg-5/igt@xe_exec_reset@parallel-gt-reset.html> (Intel XE#2105 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-bmg-3/igt@xe_exec_reset@parallel-gt-reset.html>
>   *
> 
>     igt@xe_module_load@reload:
> 
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-436/igt@xe_module_load@reload.html> (Intel XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-432/igt@xe_module_load@reload.html>
>   *
> 
>     igt@xe_pm@s4-multiple-execs:
> 
>       o shard-lnl: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html> (Intel XE#1358 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358> / Intel XE#1794 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-lnl-1/igt@xe_pm@s4-multiple-execs.html>
>   *
> 
>     igt@xe_pm@s4-vm-bind-unbind-all:
> 
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-435/igt@xe_pm@s4-vm-bind-unbind-all.html> (Intel XE#2019 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019> / Intel XE#2280 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-433/igt@xe_pm@s4-vm-bind-unbind-all.html>
> 
> 
>         Warnings
> 
>   *
> 
>     igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-466/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#623 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/623>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-432/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html> (Intel XE#623 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/623>)
>   *
> 
>     igt@kms_async_flips@invalid-async-flip:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-432/igt@kms_async_flips@invalid-async-flip.html> (Intel XE#873 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/873>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-463/igt@kms_async_flips@invalid-async-flip.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#873 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/873>)
>   *
> 
>     igt@kms_big_fb@4-tiled-32bpp-rotate-270:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-433/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#316 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-432/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html> (Intel XE#316 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +2 other tests skip
>   *
> 
>     igt@kms_big_fb@linear-8bpp-rotate-270:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-432/igt@kms_big_fb@linear-8bpp-rotate-270.html> (Intel XE#316 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-435/igt@kms_big_fb@linear-8bpp-rotate-270.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#316 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>)
>   *
> 
>     igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-435/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#607 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/607>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html> (Intel XE#607 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/607>)
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +3 other tests skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-addfb:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb.html> (Intel XE#619 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/619>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#619 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/619>)
>   *
> 
>     igt@kms_big_fb@yf-tiled-addfb-size-overflow:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html> (Intel XE#610 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/610>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#610 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/610>)
>   *
> 
>     igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +6 other tests skip
>   *
> 
>     igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-463/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-432/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html> (Intel XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +4 other tests skip
>   *
> 
>     igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html> (Intel XE#2191 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#2191 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>) +1 other test skip
>   *
> 
>     igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-435/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#2191 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html> (Intel XE#2191 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>)
>   *
> 
>     igt@kms_bw@linear-tiling-3-displays-2560x1440p:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html> (Intel XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>   *
> 
>     igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-b-dp-4:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-b-dp-4.html> (Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-463/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-b-dp-4.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +48 other tests skip
>   *
> 
>     igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-432/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-463/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +13 other tests skip
>   *
> 
>     igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-466/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +21 other tests skip
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html> (Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +76 other tests skip
>   *
> 
>     igt@kms_cdclk@mode-transition-all-outputs:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-433/igt@kms_cdclk@mode-transition-all-outputs.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#314 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/314>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-432/igt@kms_cdclk@mode-transition-all-outputs.html> (Intel XE#314 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/314>)
>   *
> 
>     igt@kms_chamelium_color@ctm-0-75:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-432/igt@kms_chamelium_color@ctm-0-75.html> (Intel XE#306 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-463/igt@kms_chamelium_color@ctm-0-75.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#306 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) +2 other tests skip
>   *
> 
>     igt@kms_chamelium_color@ctm-limited-range:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-433/igt@kms_chamelium_color@ctm-limited-range.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#306 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-432/igt@kms_chamelium_color@ctm-limited-range.html> (Intel XE#306 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>)
>   *
> 
>     igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-432/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html> (Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-435/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +5 other tests skip
>   *
> 
>     igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html> (Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +9 other tests skip
>   *
> 
>     igt@kms_content_protection@dp-mst-lic-type-0:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-463/igt@kms_content_protection@dp-mst-lic-type-0.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#307 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-0.html> (Intel XE#307 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>)
>   *
> 
>     igt@kms_content_protection@dp-mst-type-1:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-432/igt@kms_content_protection@dp-mst-type-1.html> (Intel XE#307 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-466/igt@kms_content_protection@dp-mst-type-1.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#307 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>) +1 other test skip
>   *
> 
>     igt@kms_content_protection@lic-type-1:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-432/igt@kms_content_protection@lic-type-1.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-434/igt@kms_content_protection@lic-type-1.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +12 other tests skip
>   *
> 
>     igt@kms_cursor_crc@cursor-onscreen-512x170:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x170.html> (Intel XE#308 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-463/igt@kms_cursor_crc@cursor-onscreen-512x170.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#308 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>)
>   *
> 
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-466/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#323 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html> (Intel XE#323 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>) +3 other tests skip
>   *
> 
>     igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-436/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / i915#3804 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html> (i915#3804 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804>)
>   *
> 
>     igt@kms_fbcon_fbt@psr:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-432/igt@kms_fbcon_fbt@psr.html> (Intel XE#776 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/776>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-463/igt@kms_fbcon_fbt@psr.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#776 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/776>)
>   *
> 
>     igt@kms_feature_discovery@dp-mst:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-466/igt@kms_feature_discovery@dp-mst.html> (Intel XE#1137 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-432/igt@kms_feature_discovery@dp-mst.html> (Intel XE#1137 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +17 other tests skip
>   *
> 
>     igt@kms_force_connector_basic@prune-stale-modes:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-435/igt@kms_force_connector_basic@prune-stale-modes.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / i915#5274 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-432/igt@kms_force_connector_basic@prune-stale-modes.html> (i915#5274 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274>)
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +19 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +24 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-tiling-y:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-tiling-y.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#658 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/658>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-tiling-y.html> (Intel XE#658 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/658>)
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +22 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-slowdraw:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-slowdraw.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-slowdraw.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +29 other tests skip
>   *
> 
>     igt@kms_getfb@getfb-reject-ccs:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-432/igt@kms_getfb@getfb-reject-ccs.html> (Intel XE#605 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/605>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-434/igt@kms_getfb@getfb-reject-ccs.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#605 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/605>)
>   *
> 
>     igt@kms_hdmi_inject@inject-audio:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-433/igt@kms_hdmi_inject@inject-audio.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#417 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/417>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-432/igt@kms_hdmi_inject@inject-audio.html> (Intel XE#417 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/417>)
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#498 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/498>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#498 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/498>) +1 other test skip
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#498 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/498>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html> (Intel XE#498 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/498>) +2 other tests skip
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#498 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/498>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#498 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/498>) +3 other tests skip
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html> (Intel XE#498 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/498>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#498 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/498>) +5 other tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html> (Intel XE#2318 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#2318 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318>) +2 other tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html> (Intel XE#2318 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#2318 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1 other test skip
>   *
> 
>     igt@kms_pm_backlight@fade-with-suspend:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-433/igt@kms_pm_backlight@fade-with-suspend.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#870 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-432/igt@kms_pm_backlight@fade-with-suspend.html> (Intel XE#870 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>)
>   *
> 
>     igt@kms_pm_dc@dc6-dpms:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-435/igt@kms_pm_dc@dc6-dpms.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#908 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/908>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html> (Intel XE#908 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/908>)
>   *
> 
>     igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-466/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-432/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html> (Intel XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +3 other tests skip
>   *
> 
>     igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html> (Intel XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-466/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +2 other tests skip
>   *
> 
>     igt@kms_psr2_su@page_flip-p010:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-466/igt@kms_psr2_su@page_flip-p010.html> (Intel XE#1122 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-432/igt@kms_psr2_su@page_flip-p010.html> (Intel XE#1122 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122>) +1 other test skip
>   *
> 
>     igt@kms_psr@fbc-psr-sprite-plane-onoff:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-436/igt@kms_psr@fbc-psr-sprite-plane-onoff.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#929 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-432/igt@kms_psr@fbc-psr-sprite-plane-onoff.html> (Intel XE#929 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +15 other tests skip
>   *
> 
>     igt@kms_psr@fbc-psr-sprite-render:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-432/igt@kms_psr@fbc-psr-sprite-render.html> (Intel XE#929 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-463/igt@kms_psr@fbc-psr-sprite-render.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#929 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +12 other tests skip
>   *
> 
>     igt@kms_rotation_crc@primary-rotation-270:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-466/igt@kms_rotation_crc@primary-rotation-270.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#327 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/327>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-432/igt@kms_rotation_crc@primary-rotation-270.html> (Intel XE#327 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/327>)
>   *
> 
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html> (Intel XE#1127 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html> (Intel XE#1127 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>   *
> 
>     igt@kms_rotation_crc@sprite-rotation-270:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-270.html> (Intel XE#327 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/327>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-433/igt@kms_rotation_crc@sprite-rotation-270.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#327 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/327>)
>   *
> 
>     igt@kms_tv_load_detect@load-detect:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-432/igt@kms_tv_load_detect@load-detect.html> (Intel XE#330 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/330>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-433/igt@kms_tv_load_detect@load-detect.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#330 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/330>)
>   *
> 
>     igt@kms_vrr@lobf:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-434/igt@kms_vrr@lobf.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-434/igt@kms_vrr@lobf.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#2168 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168>)
>   *
> 
>     igt@kms_writeback@writeback-check-output:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-435/igt@kms_writeback@writeback-check-output.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#756 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-432/igt@kms_writeback@writeback-check-output.html> (Intel XE#756 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>)
>   *
> 
>     igt@sriov_basic@enable-vfs-autoprobe-off:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-463/igt@sriov_basic@enable-vfs-autoprobe-off.html> (Intel XE#1091 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html> (Intel XE#1091 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091>)
>   *
> 
>     igt@xe_compute_preempt@compute-preempt-many:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-many.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#1280 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-432/igt@xe_compute_preempt@compute-preempt-many.html> (Intel XE#1280 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +3 other tests skip
>   *
> 
>     igt@xe_copy_basic@mem-set-linear-0xfffe:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfffe.html> (Intel XE#1126 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfffe.html> (Intel XE#1126 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126>)
>   *
> 
>     igt@xe_evict@evict-mixed-many-threads-large:
> 
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-432/igt@xe_evict@evict-mixed-many-threads-large.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>) -> TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-large.html> (Intel XE#1041 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041> / Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>)
>   *
> 
>     igt@xe_exec_fault_mode@many-userptr:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-432/igt@xe_exec_fault_mode@many-userptr.html> (Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-466/igt@xe_exec_fault_mode@many-userptr.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +15 other tests skip
>   *
> 
>     igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-434/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html> (Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +24 other tests skip
>   *
> 
>     igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-463/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#2360 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html> (Intel XE#2360 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360>)
>   *
> 
>     igt@xe_media_fill@media-fill:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-463/igt@xe_media_fill@media-fill.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#560 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/560>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-432/igt@xe_media_fill@media-fill.html> (Intel XE#560 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/560>)
>   *
> 
>     igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-466/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#2207 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2207>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-435/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +25 other tests skip
>   *
> 
>     igt@xe_oa@polling-small-buf:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-432/igt@xe_oa@polling-small-buf.html> (Intel XE#2207 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2207>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-463/igt@xe_oa@polling-small-buf.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +3 other tests skip
>   *
> 
>     igt@xe_pat@display-vs-wb-transient:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-466/igt@xe_pat@display-vs-wb-transient.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#1337 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-432/igt@xe_pat@display-vs-wb-transient.html> (Intel XE#1337 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337>)
>   *
> 
>     igt@xe_pat@pat-index-xehpc:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-463/igt@xe_pat@pat-index-xehpc.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#979 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/979>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-432/igt@xe_pat@pat-index-xehpc.html> (Intel XE#979 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/979>)
>   *
> 
>     igt@xe_pm@d3cold-basic-exec:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-432/igt@xe_pm@d3cold-basic-exec.html> (Intel XE#2284 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284> / Intel XE#366 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-463/igt@xe_pm@d3cold-basic-exec.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#2284 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284> / Intel XE#366 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>) +1 other test skip
>   *
> 
>     igt@xe_pm@d3cold-multiple-execs:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-463/igt@xe_pm@d3cold-multiple-execs.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#2284 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284> / Intel XE#366 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-432/igt@xe_pm@d3cold-multiple-execs.html> (Intel XE#2284 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284> / Intel XE#366 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>)
>   *
> 
>     igt@xe_pm@s3-vm-bind-unbind-all:
> 
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-436/igt@xe_pm@s3-vm-bind-unbind-all.html> (Intel XE#1162 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162>) -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-463/igt@xe_pm@s3-vm-bind-unbind-all.html> (Intel XE#1162 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162> / Intel XE#1941 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1941>)
>   *
> 
>     igt@xe_query@multigpu-query-engines:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-466/igt@xe_query@multigpu-query-engines.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#944 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-432/igt@xe_query@multigpu-query-engines.html> (Intel XE#944 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +3 other tests skip
>   *
> 
>     igt@xe_query@multigpu-query-invalid-cs-cycles:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/shard-dg2-432/igt@xe_query@multigpu-query-invalid-cs-cycles.html> (Intel XE#944 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11559/shard-dg2-463/igt@xe_query@multigpu-query-invalid-cs-cycles.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#944 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * IGT: IGT_7966 -> IGTPW_11559
>   * Linux: xe-1747-a95e3e46063ddcea598b2ac865173debffba13fe ->
>     xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093
> 
> IGTPW_11559: 11559
> IGT_7966: f16c5f500adc5fa41bd52a3ef2a84165da4fb596 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-1747-a95e3e46063ddcea598b2ac865173debffba13fe: 
> a95e3e46063ddcea598b2ac865173debffba13fe
> xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093: 
> 4f95bd933f4dacd22752bf8d6e548e8cc445d093
> 
