Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0A68C43458
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jul 2026 16:55:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E32610E07F;
	Thu,  9 Jul 2026 16:55:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MyBNVB7f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1FB810E0BD
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jul 2026 16:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783616126; x=1815152126;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=zyiVJ7iMcSyInQMAL63js1WNuqAu3HSNhifnE8VFEPg=;
 b=MyBNVB7fMNqJ+zioKvHYqqnMMz3doNQLTZI34iLRrc6AzWw8wbkVqfJJ
 F4QLlUzbuQtGSpSUQK6g7wm50XEviCRDpQEvtb9norhz5uAllecLLR1vi
 rasUKJrZhWwgjpMmbehx50lFHnw3NTJmGd4lMr336DHkJOh0J+c45PUGI
 2VehKw2W6MPGNtob0HL17qcfe1P2YiAHAV/QdOYOA5BgmLse32iXEzE9W
 0/wH1/9AC+wOGk3OfcL2ETuuG8HLuUVMgW8hjmPKSKoqZeqG78ikS6sCm
 hpC2ERy6WxA5o+OEXNS9lLXgq7Cy0QMv4uJvSHoiWN0RCx/3OmBYmTRi6 g==;
X-CSE-ConnectionGUID: HWDbMUpURYGO19/5rFahFg==
X-CSE-MsgGUID: zBuS+PeSS92zWqkwuxV5tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84277935"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="84277935"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 09:55:26 -0700
X-CSE-ConnectionGUID: sP/lNG5pQ/Gtf0TXil648w==
X-CSE-MsgGUID: Ci2PKS+WQnqRiluhw1/4dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="252906134"
Received: from unknown (HELO [10.241.241.7]) ([10.241.241.7])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 09:55:26 -0700
Message-ID: <ea8832b7-95ad-4e8c-a4af-59df3a2b36a7@linux.intel.com>
Date: Thu, 9 Jul 2026 09:55:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GVUxMOiBmYWlsdXJlIGZvciBsaWIvaWd0X2Rl?=
 =?UTF-8?Q?bugfs=3A_Add_=22errno=22_to_debug_print?=
To: igt-dev@lists.freedesktop.org
References: <20260708225223.866079-1-ngai-mint.kwan@linux.intel.com>
 <178356938559.167178.17752415598872127990@6beec6c84f66>
Content-Language: en-US
From: Ngai-Mint Kwan <ngai-mint.kwan@linux.intel.com>
In-Reply-To: <178356938559.167178.17752415598872127990@6beec6c84f66>
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

On 2026-07-08 20:56, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	lib/igt_debugfs: Add "errno" to debug print
> *URL:* 	https://patchwork.freedesktop.org/series/170041/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15494/index.html
>
>
>   CI Bug Log - changes from XEIGT_8994_FULL -> XEIGTPW_15494_FULL
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with XEIGTPW_15494_FULL absolutely need 
> to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_15494_FULL, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (2 -> 2)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> XEIGTPW_15494_FULL:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>   * igt@kms_setmode@invalid-clone-single-crtc@pipe-a-dp-2-hdmi-a-3:
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8994/shard-bmg-7/igt@kms_setmode@invalid-clone-single-crtc@pipe-a-dp-2-hdmi-a-3.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15494/shard-bmg-9/igt@kms_setmode@invalid-clone-single-crtc@pipe-a-dp-2-hdmi-a-3.html>
>         +5 other tests fail
>
>
>         Warnings
>
>   * igt@xe_prefetch_fault@prefetch-fault:
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8994/shard-bmg-4/igt@xe_prefetch_fault@prefetch-fault.html>
>         (Intel XE#7599
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15494/shard-bmg-4/igt@xe_prefetch_fault@prefetch-fault.html>
>         +1 other test skip
>
These new issues are unrelated to the submitted patch.

Ngai-Mint Kwan
>
>
>     Known issues
>
> Here are the changes found in XEIGTPW_15494_FULL that come from known 
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
>     igt@kms_big_fb@x-tiled-32bpp-rotate-90:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15494/shard-bmg-4/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html>
>         (Intel XE#2327
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327>) +1
>         other test skip
>  *
>
>     igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15494/shard-bmg-3/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +4
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15494/shard-bmg-8/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2.html>
>         (Intel XE#2652
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652>) +8
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15494/shard-bmg-9/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs.html>
>         (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +3
>         other tests skip
>  *
>
>     igt@kms_chamelium_color@gamma:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15494/shard-bmg-3/igt@kms_chamelium_color@gamma.html>
>         (Intel XE#2325
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325> /
>         Intel XE#7358
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358>)
>  *
>
>     igt@kms_chamelium_frames@hdmi-cmp-planar-formats:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15494/shard-bmg-5/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html>
>         (Intel XE#2252
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252>) +1
>         other test skip
>  *
>
>     igt@kms_content_protection@uevent:
>
>       o shard-bmg: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15494/shard-bmg-3/igt@kms_content_protection@uevent.html>
>         (Intel XE#6707
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707> /
>         Intel XE#7439
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439>) +1
>         other test fail
>  *
>
>     igt@kms_cursor_crc@cursor-random-32x32:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15494/shard-bmg-2/igt@kms_cursor_crc@cursor-random-32x32.html>
>         (Intel XE#2320
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320>) +1
>         other test skip
>  *
>
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic:
>
>       o shard-bmg: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15494/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html>
>         (Intel XE#7571
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571>)
>  *
>
>     igt@kms_dsc@dsc-fractional-bpp-with-bpc-ultrajoiner:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15494/shard-bmg-4/igt@kms_dsc@dsc-fractional-bpp-with-bpc-ultrajoiner.html>
>         (Intel XE#8265
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265>)
>  *
>
>     igt@kms_feature_discovery@display-3x:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15494/shard-bmg-10/igt@kms_feature_discovery@display-3x.html>
>         (Intel XE#2373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373> /
>         Intel XE#7448
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7448>)
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank@c-edp1:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8994/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15494/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301> /
>         Intel XE#3149
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149>) +1
>         other test fail
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15494/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html>
>         (Intel XE#7178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178> /
>         Intel XE#7351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351>)
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-blt:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15494/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-blt.html>
>         (Intel XE#7061
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061> /
>         Intel XE#7356
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356>) +1
>         other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15494/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html>
>         (Intel XE#4141
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141>) +3
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15494/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>)
>         +18 other tests skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15494/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt.html>
>         (Intel XE#6312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312>) +1
>         other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-blt:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15494/shard-lnl-1/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-blt.html>
>         (Intel XE#7865
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15494/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>)
>         +14 other tests skip
>  *
>
>     igt@kms_hdr@invalid-hdr:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15494/shard-bmg-10/igt@kms_hdr@invalid-hdr.html>
>         (Intel XE#1503
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503>)
>  *
>
>     igt@kms_joiner@basic-max-non-joiner:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15494/shard-bmg-9/igt@kms_joiner@basic-max-non-joiner.html>
>         (Intel XE#4298
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298> /
>         Intel XE#5873
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5873>)
>  *
>
>     igt@kms_joiner@basic-ultra-joiner:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15494/shard-bmg-9/igt@kms_joiner@basic-ultra-joiner.html>
>         (Intel XE#6911
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911> /
>         Intel XE#7378
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7378>)
>  *
>
>     igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15494/shard-bmg-3/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier.html>
>         (Intel XE#7283
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283>)
>  *
>
>     igt@kms_pm_backlight@basic-brightness:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15494/shard-bmg-5/igt@kms_pm_backlight@basic-brightness.html>
>         (Intel XE#7376
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376> /
>         Intel XE#7760
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760> /
>         Intel XE#870
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>)
>  *
>
>     igt@kms_pm_rpm@dpms-mode-unset-lpsp:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15494/shard-bmg-9/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html>
>         (Intel XE#1439
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439> /
>         Intel XE#7402
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7402> /
>         Intel XE#836
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/836>)
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15494/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html>
>         (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +1
>         other test skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15494/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html>
>         (Intel XE#2893
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893> /
>         Intel XE#4608
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608> /
>         Intel XE#7304
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304>)
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-a-edp-1:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15494/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-a-edp-1.html>
>         (Intel XE#4608
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608>)
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15494/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1.html>
>         (Intel XE#4608
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608> /
>         Intel XE#7304
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304>)
>  *
>
>     igt@kms_psr@psr2-basic:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15494/shard-bmg-6/igt@kms_psr@psr2-basic.html>
>         (Intel XE#2234
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234> /
>         Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850>)
>  *
>
>     igt@kms_rotation_crc@bad-pixel-format:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15494/shard-bmg-9/igt@kms_rotation_crc@bad-pixel-format.html>
>         (Intel XE#3904
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904> /
>         Intel XE#7342
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342>)
>  *
>
>     igt@kms_scaling_modes@scaling-mode-full-aspect:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15494/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-full-aspect.html>
>         (Intel XE#2413
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413>)
>  *
>
>     igt@kms_sharpness_filter@filter-tap:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15494/shard-bmg-6/igt@kms_sharpness_filter@filter-tap.html>
>         (Intel XE#6503
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503>)
>  *
>
>     igt@xe_compute@ccs-mode-compute-kernel:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15494/shard-bmg-8/igt@xe_compute@ccs-mode-compute-kernel.html>
>         (Intel XE#6599
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599>)
>  *
>
>     igt@xe_evict@evict-small:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15494/shard-lnl-5/igt@xe_evict@evict-small.html>
>         (Intel XE#6540
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540>)
>  *
>
>     igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-rebind:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15494/shard-lnl-7/igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-rebind.html>
>         (Intel XE#7482
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482>)
>  *
>
>     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15494/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html>
>         (Intel XE#2322
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322> /
>         Intel XE#7372
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372>) +1
>         other test skip
>  *
>
>     igt@xe_exec_fault_mode@many-multi-queue-invalid-fault:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15494/shard-bmg-5/igt@xe_exec_fault_mode@many-multi-queue-invalid-fault.html>
>         (Intel XE#8374
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374>) +1
>         other test skip
>  *
>
>     igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-priority:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15494/shard-lnl-2/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-priority.html>
>         (Intel XE#8364
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364>)
>  *
>
>     igt@xe_exec_multi_queue@max-queues-basic:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15494/shard-bmg-4/igt@xe_exec_multi_queue@max-queues-basic.html>
>         (Intel XE#8364
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364>) +9
>         other tests skip
>  *
>
>     igt@xe_exec_reset@multi-queue-close-execqueues:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15494/shard-lnl-4/igt@xe_exec_reset@multi-queue-close-execqueues.html>
>         (Intel XE#8369
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369>)
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15494/shard-bmg-5/igt@xe_exec_reset@multi-queue-close-execqueues.html>
>         (Intel XE#8369
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369>)
>  *
>
>     igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-invalidate-race:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15494/shard-lnl-8/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-invalidate-race.html>
>         (Intel XE#8378
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378>)
>  *
>
>     igt@xe_exec_threads@threads-multi-queue-hang-fd-userptr-invalidate-race:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15494/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-hang-fd-userptr-invalidate-race.html>
>         (Intel XE#8378
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378>) +1
>         other test skip
>  *
>
>     igt@xe_live_ktest@xe_eudebug:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15494/shard-bmg-4/igt@xe_live_ktest@xe_eudebug.html>
>         (Intel XE#2833
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833>)
>  *
>
>     igt@xe_multigpu_svm@mgpu-coherency-fail-basic:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15494/shard-bmg-5/igt@xe_multigpu_svm@mgpu-coherency-fail-basic.html>
>         (Intel XE#6964
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964>)
>  *
>
>     igt@xe_pat@l2-flush-opt-svm-pat-restrict:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15494/shard-bmg-6/igt@xe_pat@l2-flush-opt-svm-pat-restrict.html>
>         (Intel XE#7590
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590>)
>  *
>
>     igt@xe_pat@pat-index-xehpc:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15494/shard-bmg-8/igt@xe_pat@pat-index-xehpc.html>
>         (Intel XE#1420
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420> /
>         Intel XE#7590
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590>)
>  *
>
>     igt@xe_pm@d3cold-basic:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15494/shard-bmg-3/igt@xe_pm@d3cold-basic.html>
>         (Intel XE#2284
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284> /
>         Intel XE#7370
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370>)
>  *
>
>     igt@xe_sriov_scheduling@nonpreempt-engine-resets-normal-priority@numvfs-random-gt0-rcs0:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8994/shard-bmg-9/igt@xe_sriov_scheduling@nonpreempt-engine-resets-normal-priority@numvfs-random-gt0-rcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15494/shard-bmg-1/igt@xe_sriov_scheduling@nonpreempt-engine-resets-normal-priority@numvfs-random-gt0-rcs0.html>
>         (Intel XE#7992
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992>) +1
>         other test fail
>  *
>
>     igt@xe_sriov_scheduling@nonpreempt-engine-resets-normal-priority@numvfs-random-gt1-vcs0:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8994/shard-bmg-9/igt@xe_sriov_scheduling@nonpreempt-engine-resets-normal-priority@numvfs-random-gt1-vcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15494/shard-bmg-1/igt@xe_sriov_scheduling@nonpreempt-engine-resets-normal-priority@numvfs-random-gt1-vcs0.html>
>         (Intel XE#8340
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8340>)
>  *
>
>     igt@xe_wedged@wedged-mode-toggle:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8994/shard-lnl-3/igt@xe_wedged@wedged-mode-toggle.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15494/shard-lnl-4/igt@xe_wedged@wedged-mode-toggle.html>
>         (Intel XE#8007
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007>)
>
>
>         Possible fixes
>
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>
>       o shard-bmg: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8994/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html>
>         (Intel XE#7084
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084> /
>         Intel XE#8150
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15494/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html>
>         +1 other test pass
>  *
>
>     igt@kms_cursor_legacy@flip-vs-cursor-legacy:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8994/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html>
>         (Intel XE#7571
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15494/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html>
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8994/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15494/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html>
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8994/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301> /
>         Intel XE#3149
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15494/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html>
>         +1 other test pass
>  *
>
>     igt@kms_pm_dc@dc6-psr:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8994/shard-lnl-8/igt@kms_pm_dc@dc6-psr.html>
>         (Intel XE#8399
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15494/shard-lnl-5/igt@kms_pm_dc@dc6-psr.html>
>  *
>
>     igt@xe_exec_reset@long-spin-many-preempt-gt0-threads:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8994/shard-bmg-10/igt@xe_exec_reset@long-spin-many-preempt-gt0-threads.html>
>         (Intel XE#7956
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7956>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15494/shard-bmg-8/igt@xe_exec_reset@long-spin-many-preempt-gt0-threads.html>
>  *
>
>     igt@xe_sriov_flr@flr-vf1-clear:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8994/shard-bmg-8/igt@xe_sriov_flr@flr-vf1-clear.html>
>         (Intel XE#6569
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15494/shard-bmg-7/igt@xe_sriov_flr@flr-vf1-clear.html>
>  *
>
>     igt@xe_sysfs_scheduler@preempt_timeout_us-min-max@ccs:
>
>       o shard-lnl: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8994/shard-lnl-3/igt@xe_sysfs_scheduler@preempt_timeout_us-min-max@ccs.html>
>         (Intel XE#8007
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15494/shard-lnl-4/igt@xe_sysfs_scheduler@preempt_timeout_us-min-max@ccs.html>
>         +1 other test pass
>
>
>         Warnings
>
>  *
>
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8994/shard-lnl-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html>
>         (Intel XE#3414
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414> /
>         Intel XE#3904
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904> /
>         Intel XE#7342
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15494/shard-lnl-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html>
>         (Intel XE#3904
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904> /
>         Intel XE#7342
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342>)
>         +10 other tests skip
>  *
>
>     igt@kms_tiled_display@basic-test-pattern:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8994/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html>
>         (Intel XE#1729
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729> /
>         Intel XE#7424
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15494/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html>
>         (Intel XE#2426
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426> /
>         Intel XE#5848
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848>)
>  *
>
>     igt@xe_evict@evict-beng-threads-large-multi-vm:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8994/shard-lnl-3/igt@xe_evict@evict-beng-threads-large-multi-vm.html>
>         (Intel XE#6540
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540> /
>         Intel XE#688
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15494/shard-lnl-2/igt@xe_evict@evict-beng-threads-large-multi-vm.html>
>         (Intel XE#6540
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540>)
>         +68 other tests skip
>
>
>     Build changes
>
>   * IGT: IGT_8994 -> IGTPW_15494
>   * Linux: xe-5368-d2b771941e0c8aec7b6648b0c47d81161136944d ->
>     xe-5370-ab9c4156ab48d805163a92976fabf872e4ddcd4d
>
> IGTPW_15494: 15494
> IGT_8994: 59469572ae481848d6bd469242aef7c5333b39ad @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-5368-d2b771941e0c8aec7b6648b0c47d81161136944d: 
> d2b771941e0c8aec7b6648b0c47d81161136944d
> xe-5370-ab9c4156ab48d805163a92976fabf872e4ddcd4d: 
> ab9c4156ab48d805163a92976fabf872e4ddcd4d
>

