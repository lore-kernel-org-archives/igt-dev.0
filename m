Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EC8AC30658
	for <igt-dev@archiver.kernel.org>; Fri,  5 Jul 2024 09:38:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23F6D10E8D7;
	Fri,  5 Jul 2024 09:38:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ffg5PJsY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD01F10E8C7;
 Fri,  5 Jul 2024 09:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720172291; x=1751708291;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=e4Z5bLCU+/IHduA2Rlp8vQg2ThYfE9J2i7pUpiVGktc=;
 b=Ffg5PJsYJpc0SjdhToEWyocQLV78UefoiOW4cMypXYAd5XrCS37XI9aZ
 A9WBPcQ2xf+cZT7NN151PcmAMg03+A3TJrSve4wWpQoMll2EP/JYsQ+eU
 BFj7MUC3F6mnuTPVwyX2fI6GyiD2CVFEbU+DYhUBp+YpAYZ9xe9lfZUkY
 SfAcR92lhtnDRPuVA8z42OyTC1Ta7F6aBOV5QJsDd8g+Ys18+THQRoM2F
 Z/hO9fWXF82o++WaZB42wdbrFuzS9+jfBgXTuPjXdUesyW6OJ5zqyV2o9
 PKDP192XDYJ5ijsPuSU8DZTS6MaCLEHNFWbT7WSbbPeSlg9wmDcWaxc+w A==;
X-CSE-ConnectionGUID: rvPW8M/JTiGa87dNW55wlA==
X-CSE-MsgGUID: yNVVWhCGTOG6/xFF/fqfhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="21225239"
X-IronPort-AV: E=Sophos;i="6.09,184,1716274800"; d="scan'208";a="21225239"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2024 02:38:11 -0700
X-CSE-ConnectionGUID: blC6yivEQRiaJZjFxUl2QQ==
X-CSE-MsgGUID: 9cECqMk/TY+TBW/dSO8EpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,184,1716274800"; d="scan'208";a="47579052"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.245.84.149])
 ([10.245.84.149])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2024 02:38:09 -0700
Message-ID: <e082bc19-1109-4c0f-9473-18c159ac64e6@linux.intel.com>
Date: Fri, 5 Jul 2024 11:38:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2ExeFULL=3A_failure_for_lib/igt=5Fdevi?=
 =?UTF-8?Q?ce=5Fscan=3A_Skip_attributes_in_subdirectories?=
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20240704164437.1543161-1-marcin.bernatowicz@linux.intel.com>
 <172013925565.29931.7572281404839371680@2413ebb6fbb6>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <172013925565.29931.7572281404839371680@2413ebb6fbb6>
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



On 7/5/2024 2:27 AM, Patchwork wrote:
> *Patch Details*
> *Series:*	lib/igt_device_scan: Skip attributes in subdirectories
> *URL:*	https://patchwork.freedesktop.org/series/135769/ 
> <https://patchwork.freedesktop.org/series/135769/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11372/index.html 
> <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11372/index.html>
> 
> 
>   CI Bug Log - changes from XEIGT_7916_full -> XEIGTPW_11372_full
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with XEIGTPW_11372_full absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_11372_full, please notify your bug team 
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
> XEIGTPW_11372_full:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@xe_gt_freq@freq_range_exec:
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/shard-dg2-433/igt@xe_gt_freq@freq_range_exec.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11372/shard-dg2-435/igt@xe_gt_freq@freq_range_exec.html>

Not related to the change. Change is connected with device 
selection/filtering, so either wrong or no device issue would be hit,
which does not happen in this and any other tests.

Regards,
marcin

> 
> 
>         Suppressed
> 
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
> 
>   * igt@xe_exec_basic@many-execqueues-many-vm-basic:
>       o {shard-lnl}: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/shard-lnl-2/igt@xe_exec_basic@many-execqueues-many-vm-basic.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11372/shard-lnl-6/igt@xe_exec_basic@many-execqueues-many-vm-basic.html>
> 
> 
>     Known issues
> 
> Here are the changes found in XEIGTPW_11372_full that come from known 
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
>     igt@kms_big_fb@linear-8bpp-rotate-270:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11372/shard-dg2-463/igt@kms_big_fb@linear-8bpp-rotate-270.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#316 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>)
>   *
> 
>     igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11372/shard-dg2-463/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +2 other tests skip
>   *
> 
>     igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11372/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +9 other tests skip
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11372/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +34 other tests skip
>   *
> 
>     igt@kms_chamelium_color@ctm-0-50:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11372/shard-dg2-435/igt@kms_chamelium_color@ctm-0-50.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#306 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>)
>   *
> 
>     igt@kms_chamelium_hpd@hdmi-hpd-fast:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11372/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-fast.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>)
>   *
> 
>     igt@kms_cursor_crc@cursor-offscreen-512x512:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11372/shard-dg2-433/igt@kms_cursor_crc@cursor-offscreen-512x512.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#308 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>) +1 other test skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11372/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +11 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11372/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +9 other tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11372/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#305 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/305> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1 other test skip
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-6:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11372/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-6.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#305 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/305>) +2 other tests skip
>   *
> 
>     igt@kms_pm_backlight@bad-brightness:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11372/shard-dg2-464/igt@kms_pm_backlight@bad-brightness.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#870 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>)
>   *
> 
>     igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11372/shard-dg2-433/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>)
>   *
> 
>     igt@kms_psr@fbc-psr2-primary-blt:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11372/shard-dg2-434/igt@kms_psr@fbc-psr2-primary-blt.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#929 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +3 other tests skip
>   *
> 
>     igt@kms_rotation_crc@primary-rotation-270:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11372/shard-dg2-434/igt@kms_rotation_crc@primary-rotation-270.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#327 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/327>)
>   *
> 
>     igt@kms_setmode@basic-clone-single-crtc:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11372/shard-dg2-436/igt@kms_setmode@basic-clone-single-crtc.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1 other test skip
>   *
> 
>     igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11372/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html> (Intel XE#899 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/899>)
>   *
> 
>     igt@kms_writeback@writeback-fb-id-xrgb2101010:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11372/shard-dg2-464/igt@kms_writeback@writeback-fb-id-xrgb2101010.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#756 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>)
>   *
> 
>     igt@xe_exec_balancer@many-cm-virtual-userptr-invalidate-race:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/shard-dg2-436/igt@xe_exec_balancer@many-cm-virtual-userptr-invalidate-race.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11372/shard-dg2-466/igt@xe_exec_balancer@many-cm-virtual-userptr-invalidate-race.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>)
>   *
> 
>     igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11372/shard-dg2-466/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +8 other tests skip
>   *
> 
>     igt@xe_gt_freq@freq_fixed_idle:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/shard-dg2-434/igt@xe_gt_freq@freq_fixed_idle.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11372/shard-dg2-434/igt@xe_gt_freq@freq_fixed_idle.html> (Intel XE#1414 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1414>)
>   *
> 
>     igt@xe_pm@s4-d3hot-basic-exec:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/shard-dg2-434/igt@xe_pm@s4-d3hot-basic-exec.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11372/shard-dg2-435/igt@xe_pm@s4-d3hot-basic-exec.html> (Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>) +1 other test dmesg-warn
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:
> 
>       o {shard-lnl}: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html> (Intel XE#1659 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11372/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html>
>   *
> 
>     igt@kms_pipe_crc_basic@suspend-read-crc:
> 
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/shard-dg2-434/igt@kms_pipe_crc_basic@suspend-read-crc.html> (Intel XE#1162 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162> / Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11372/shard-dg2-466/igt@kms_pipe_crc_basic@suspend-read-crc.html>
>   *
> 
>     igt@kms_plane@plane-position-covered:
> 
>       o {shard-lnl}: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/shard-lnl-5/igt@kms_plane@plane-position-covered.html> (Intel XE#324 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11372/shard-lnl-7/igt@kms_plane@plane-position-covered.html> +4 other tests pass
>   *
> 
>     {igt@kms_plane@plane-position-covered@pipe-b-plane-4}:
> 
>       o {shard-lnl}: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/shard-lnl-5/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html> (Intel XE#324 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11372/shard-lnl-7/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html> +6 other tests pass
>   *
> 
>     igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:
> 
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html> (Intel XE#899 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/899>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11372/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html>
>   *
> 
>     igt@xe_evict@evict-mixed-many-threads-small:
> 
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> / Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11372/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-small.html>
>   *
> 
>     igt@xe_evict@evict-mixed-threads-large:
> 
>       o shard-dg2-set2: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/shard-dg2-463/igt@xe_evict@evict-mixed-threads-large.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> / Intel XE#392 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/392>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11372/shard-dg2-464/igt@xe_evict@evict-mixed-threads-large.html>
>   *
> 
>     igt@xe_exec_basic@many-execqueues-bindexecqueue-rebind:
> 
>       o {shard-lnl}: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/shard-lnl-5/igt@xe_exec_basic@many-execqueues-bindexecqueue-rebind.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11372/shard-lnl-5/igt@xe_exec_basic@many-execqueues-bindexecqueue-rebind.html>
>   *
> 
>     igt@xe_exec_reset@parallel-gt-reset:
> 
>       o shard-dg2-set2: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/shard-dg2-434/igt@xe_exec_reset@parallel-gt-reset.html> (Intel XE#2105 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11372/shard-dg2-434/igt@xe_exec_reset@parallel-gt-reset.html>
>   *
> 
>     igt@xe_module_load@reload:
> 
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/shard-dg2-463/igt@xe_module_load@reload.html> (Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11372/shard-dg2-435/igt@xe_module_load@reload.html> +4 other tests pass
>   *
> 
>     igt@xe_pm@s2idle-vm-bind-userptr:
> 
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/shard-dg2-435/igt@xe_pm@s2idle-vm-bind-userptr.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> / Intel XE#1694 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11372/shard-dg2-434/igt@xe_pm@s2idle-vm-bind-userptr.html>
> 
> 
>         Warnings
> 
>   *
> 
>     igt@kms_content_protection@lic-type-0:
> 
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/shard-dg2-435/igt@kms_content_protection@lic-type-0.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11372/shard-dg2-464/igt@kms_content_protection@lic-type-0.html> (Intel XE#1204 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204>) +1 other test fail
>   *
> 
>     igt@xe_evict@evict-beng-mixed-many-threads-large:
> 
>       o shard-dg2-set2: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/shard-dg2-433/igt@xe_evict@evict-beng-mixed-many-threads-large.html> (Intel XE#1041 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041> / Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> / Intel XE#392 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/392>) -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11372/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-large.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> / Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> / Intel XE#392 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/392>)
>   *
> 
>     igt@xe_evict@evict-beng-threads-large:
> 
>       o shard-dg2-set2: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/shard-dg2-464/igt@xe_evict@evict-beng-threads-large.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>) -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11372/shard-dg2-435/igt@xe_evict@evict-beng-threads-large.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> / Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>)
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * IGT: IGT_7916 -> IGTPW_11372
>   * Linux: xe-1562-2bf4c5214910654a6a50082c90f0f4596ea6b0c6 ->
>     xe-1565-55e18f9be7b75c5226a57eff4a3b3eb6110815c6
> 
> IGTPW_11372: 11372
> IGT_7916: 971cfc9d6afc8242db25d1eabd4ae00890d9144a @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-1562-2bf4c5214910654a6a50082c90f0f4596ea6b0c6: 
> 2bf4c5214910654a6a50082c90f0f4596ea6b0c6
> xe-1565-55e18f9be7b75c5226a57eff4a3b3eb6110815c6: 
> 55e18f9be7b75c5226a57eff4a3b3eb6110815c6
> 
