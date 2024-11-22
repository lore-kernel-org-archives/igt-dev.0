Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78C84D75E3B
	for <igt-dev@archiver.kernel.org>; Fri, 22 Nov 2024 13:29:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DD6510EB8B;
	Fri, 22 Nov 2024 13:29:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JJ4o1/e6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B53010EB8B
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Nov 2024 13:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732282160; x=1763818160;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=7NEqg6jcn232n194AlGaLdvarAwEf/+62lZhElFwfdU=;
 b=JJ4o1/e6X0dfFxp9YLcZcoyVgC22Dnry6YIBemN2HxAPk5o3HY2rXrlQ
 eTp89rzuReX69WPLZUsjPFbCAQYcT3YpZipr7Vhu4FphyJPpRLNPxbVj6
 YM/a23AUFXWDMUIpbA3635dB3tDKl35QdLPXeuaMkshCCds4evVTnjY8s
 ZndREHLB/Si7uT3N9SOGPIjhoNKlbrlBeJogRPRXGX/pAsrOAPqKkQAeh
 W1UZVX/BKfEsiQwsyB++nXYEMC+QkovIdqSXh517L5VG/FVJes4qEEQrF
 +pfHeJb0Py3r+vesCzsamdDLJqoot43vy5V+NWREfi14wLoUbRuYGGe6K A==;
X-CSE-ConnectionGUID: diXr8jYwTxa0tuYyGTyuNQ==
X-CSE-MsgGUID: FTGyuc2mTXiwxVpfEZZRgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="43502301"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208";a="43502301"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2024 05:29:18 -0800
X-CSE-ConnectionGUID: QIo5bHoBRQ21UvFl9UmckQ==
X-CSE-MsgGUID: PC9rGJ2sTFmuwwRNWBZ7Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208";a="113853001"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.246.1.187])
 ([10.246.1.187])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2024 05:29:16 -0800
Message-ID: <c4870292-ca43-49bb-9fd4-ae431d28b53a@linux.intel.com>
Date: Fri, 22 Nov 2024 14:29:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Improvement?=
 =?UTF-8?Q?s_for_xe=5Fsriov=5Fflr_test_and_xe=5Fmmio_lib_=28rev3=29?=
To: igt-dev@lists.freedesktop.org, lgci.bug.filing@intel.com
References: <20241121141851.631877-1-marcin.bernatowicz@linux.intel.com>
 <173224271265.1449436.1779646471458126789@b555e5b46a47>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <173224271265.1449436.1779646471458126789@b555e5b46a47>
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



On 11/22/2024 3:31 AM, Patchwork wrote:
> *Patch Details*
> *Series:*	Improvements for xe_sriov_flr test and xe_mmio lib (rev3)
> *URL:*	https://patchwork.freedesktop.org/series/141556/ <https:// 
> patchwork.freedesktop.org/series/141556/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/ 
> index.html <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/ 
> index.html>
> 
> 
>   CI Bug Log - changes from XEIGT_8119_full -> XEIGTPW_12162_full
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with XEIGTPW_12162_full absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_12162_full, please notify your bug team (I915-ci- 
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
> XEIGTPW_12162_full:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@core_hotunplug@unbind-rebind:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-bmg-4/igt@core_hotunplug@unbind-rebind.html> ->
>         INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGTPW_12162/shard-bmg-8/igt@core_hotunplug@unbind-rebind.html>
>   *
> 
>     igt@kms_cursor_crc@cursor-alpha-opaque@pipe-a-dp-2:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-bmg-1/igt@kms_cursor_crc@cursor-alpha-
>         opaque@pipe-a-dp-2.html> -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12162/shard-bmg-8/igt@kms_cursor_crc@cursor-
>         alpha-opaque@pipe-a-dp-2.html>
>   *
> 
>     igt@kms_dp_aux_dev:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-bmg-8/igt@kms_dp_aux_dev.html> -> SKIP <https://
>         intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-bmg-6/
>         igt@kms_dp_aux_dev.html>
>   *
> 
>     igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-d:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-
>         factor-0-25@pipe-d.html> -> DMESG-WARN <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12162/shard-bmg-4/
>         igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-d.html> +2
>         other tests dmesg-warn
>   *
> 
>     igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-vram01:
> 
>       o shard-dg2-set2: NOTRUN -> INCOMPLETE <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12162/shard-dg2-435/
>         igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-
>         vram01.html>
>   *
> 
>     igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc:
> 
>       o shard-lnl: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-lnl-2/igt@xe_fault_injection@vm-bind-
>         fail-xe_vma_ops_alloc.html>
>   *
> 
>     igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-lnl-8/igt@xe_fault_injection@vm-create-fail-
>         xe_vm_create_scratch.html> -> ABORT <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12162/shard-lnl-5/
>         igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html>
> 
> 
>         Warnings
> 
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-
>         scndscrn-cur-indfb-draw-render.html> (Intel XE#2136 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-
>         draw-render.html>
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-pri-
>         indfb-multidraw.html> (Intel XE#2136 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-
>         multidraw.html>
>   *
> 
>     igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:
> 
>       o shard-bmg: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8119/shard-bmg-6/igt@xe_fault_injection@vm-bind-fail-
>         vm_bind_ioctl_ops_execute.html> -> FAIL <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12162/shard-bmg-2/
>         igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html>


Not related to the change.

Regards,
marcin
> 
> 
>     New tests
> 
> New tests have been introduced between XEIGT_8119_full and 
> XEIGTPW_12162_full:
> 
> 
>       New IGT tests (1)
> 
>   * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-4:
>       o Statuses : 1 pass(s)
>       o Exec time: [0.42] s
> 
> 
>     Known issues
> 
> Here are the changes found in XEIGTPW_12162_full that come from known 
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
>     igt@core_getstats:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-463/igt@core_getstats.html> -> SKIP <https://
>         intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-dg2-466/
>         igt@core_getstats.html> (Intel XE#2423 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2423>)
>   *
> 
>     igt@fbdev@unaligned-write:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-435/igt@fbdev@unaligned-write.html> -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         dg2-466/igt@fbdev@unaligned-write.html> (Intel XE#2134 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2134>)
>   *
> 
>     igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-6:
> 
>       o shard-dg2-set2: NOTRUN -> DMESG-WARN <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12162/shard-dg2-435/
>         igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-
>         a-6.html> (Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/3468>) +1 other test dmesg-warn
>   *
> 
>     igt@kms_async_flips@crc:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-bmg-6/igt@kms_async_flips@crc.html> -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         bmg-1/igt@kms_async_flips@crc.html> (Intel XE#1727 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel
>         XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>)
>   *
> 
>     igt@kms_async_flips@crc@pipe-a-dp-2:
> 
>       o shard-bmg: NOTRUN -> DMESG-FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12162/shard-bmg-1/
>         igt@kms_async_flips@crc@pipe-a-dp-2.html> (Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> /
>         Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3468>)
>   *
> 
>     igt@kms_async_flips@crc@pipe-a-hdmi-a-3:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-bmg-6/igt@kms_async_flips@crc@pipe-a-hdmi-
>         a-3.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGTPW_12162/shard-bmg-1/igt@kms_async_flips@crc@pipe-a-hdmi-
>         a-3.html> (Intel XE#3557 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/3557>)
>   *
> 
>     igt@kms_big_fb@4-tiled-8bpp-rotate-270:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12162/shard-dg2-436/igt@kms_big_fb@4-
>         tiled-8bpp-rotate-270.html> (Intel XE#316 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/316>)
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-435/igt@kms_big_fb@4-tiled-max-hw-
>         stride-32bpp-rotate-0-hflip.html> -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12162/shard-dg2-434/
>         igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html>
>         (Intel XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2136>) +24 other tests skip
>   *
> 
>     igt@kms_big_fb@linear-64bpp-rotate-270:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-bmg-8/igt@kms_big_fb@linear-64bpp-
>         rotate-270.html> (Intel XE#2327 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2327>) +1 other test skip
>   *
> 
>     igt@kms_big_fb@x-tiled-8bpp-rotate-270:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-lnl-5/igt@kms_big_fb@x-tiled-8bpp-
>         rotate-270.html> (Intel XE#1407 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1407>) +1 other test skip
>   *
> 
>     igt@kms_big_fb@y-tiled-32bpp-rotate-0:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-lnl-5/igt@kms_big_fb@y-tiled-32bpp-
>         rotate-0.html> (Intel XE#1124 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1124>)
>   *
> 
>     igt@kms_big_fb@y-tiled-addfb:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12162/shard-dg2-463/igt@kms_big_fb@y-tiled-
>         addfb.html> (Intel XE#619 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/619>)
>   *
> 
>     igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-bmg-1/igt@kms_big_fb@yf-tiled-16bpp-
>         rotate-270.html> (Intel XE#1124 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1124>) +2 other tests skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12162/shard-dg2-436/igt@kms_big_fb@yf-
>         tiled-8bpp-rotate-270.html> (Intel XE#1124 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +1 other test
>         skip
>   *
> 
>     igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-bmg-1/igt@kms_bw@connected-linear-
>         tiling-4-displays-2560x1440p.html> (Intel XE#2314 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2314> / Intel
>         XE#2894 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894>)
>   *
> 
>     igt@kms_bw@linear-tiling-2-displays-2160x1440p:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-lnl-5/igt@kms_bw@linear-tiling-2-
>         displays-2160x1440p.html> (Intel XE#367 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-bmg-6/igt@kms_bw@linear-tiling-2-
>         displays-2160x1440p.html> (Intel XE#367 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>   *
> 
>     igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-lnl-7/igt@kms_ccs@bad-pixel-format-4-
>         tiled-mtl-rc-ccs-cc.html> (Intel XE#2887 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +5 other
>         tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-c-dp-2:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-bmg-8/igt@kms_ccs@crc-primary-
>         basic-4-tiled-lnl-ccs@pipe-c-dp-2.html> (Intel XE#2652 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2652> / Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +3
>         other tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-
>         bmg-ccs.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-bmg-4/igt@kms_ccs@crc-primary-
>         suspend-4-tiled-bmg-ccs.html> (Intel XE#3468 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) +1 other test
>         incomplete
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-
>         basic-4-tiled-mtl-rc-ccs.html> (Intel XE#2887 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +6 other
>         tests skip
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-
>     hdmi-a-6:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12162/shard-dg2-463/igt@kms_ccs@crc-sprite-
>         planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html> (Intel
>         XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/787>) +76 other tests skip
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-lnl-2/igt@kms_ccs@random-ccs-data-4-
>         tiled-bmg-ccs.html> (Intel XE#2669 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2669>) +3 other
>         tests skip
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> INCOMPLETE <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12162/shard-dg2-433/
>         igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html>
>         (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1727> / Intel XE#3113 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3113>)
>   *
> 
>     igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12162/shard-dg2-463/igt@kms_ccs@random-ccs-
>         data-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html> (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/787>) +12 other tests skip
>   *
> 
>     igt@kms_cdclk@plane-scaling:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-bmg-2/igt@kms_cdclk@plane-
>         scaling.html> (Intel XE#2724 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2724>)
>   *
> 
>     igt@kms_chamelium_audio@hdmi-audio:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12162/shard-dg2-463/
>         igt@kms_chamelium_audio@hdmi-audio.html> (Intel XE#373 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +2 other tests
>         skip
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-lnl-3/igt@kms_chamelium_audio@hdmi-
>         audio.html> (Intel XE#373 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/373>) +3 other tests skip
>   *
> 
>     igt@kms_chamelium_color@gamma:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-bmg-2/
>         igt@kms_chamelium_color@gamma.html> (Intel XE#2325 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2325>) +1 other test
>         skip
>   *
> 
>     igt@kms_chamelium_edid@dp-mode-timings:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-bmg-8/igt@kms_chamelium_edid@dp-mode-
>         timings.html> (Intel XE#2252 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2252>) +4 other tests skip
>   *
> 
>     igt@kms_color@ctm-0-25:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-bmg-6/igt@kms_color@ctm-0-25.html> -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         bmg-1/igt@kms_color@ctm-0-25.html> (Intel XE#877 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/877>) +1 other test
>         dmesg-warn
>   *
> 
>     igt@kms_cursor_crc@cursor-offscreen-512x512:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-bmg-8/igt@kms_cursor_crc@cursor-
>         offscreen-512x512.html> (Intel XE#2321 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2321>) +2 other
>         tests skip
>   *
> 
>     igt@kms_cursor_crc@cursor-sliding-512x170:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12162/shard-dg2-463/
>         igt@kms_cursor_crc@cursor-sliding-512x170.html> (Intel XE#308
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>)
>   *
> 
>     igt@kms_cursor_crc@cursor-sliding-64x64:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-433/igt@kms_cursor_crc@cursor-
>         sliding-64x64.html> -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-dg2-466/igt@kms_cursor_crc@cursor-
>         sliding-64x64.html> (Intel XE#2423 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +80 other tests skip
>   *
> 
>     igt@kms_cursor_edge_walk@256x256-right-edge:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-lnl-8/igt@kms_cursor_edge_walk@256x256-right-
>         edge.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGTPW_12162/shard-lnl-7/igt@kms_cursor_edge_walk@256x256-right-
>         edge.html> (Intel XE#2577 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2577>) +1 other test fail
>   *
> 
>     igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-lnl-4/igt@kms_cursor_legacy@cursora-
>         vs-flipb-atomic-transitions-varying-size.html> (Intel XE#309
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>)
>   *
> 
>     igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-
>         toggle.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGTPW_12162/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-
>         toggle.html> (Intel XE#2291 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2291>) +1 other test skip
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
> 
>       o shard-bmg: NOTRUN -> DMESG-WARN <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12162/shard-bmg-8/
>         igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html> (Intel
>         XE#877 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>)
>   *
> 
>     igt@kms_flip@2x-blocking-absolute-wf_vblank@ab-hdmi-a6-dp4:
> 
>       o shard-dg2-set2: NOTRUN -> DMESG-WARN <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12162/shard-dg2-435/
>         igt@kms_flip@2x-blocking-absolute-wf_vblank@ab-hdmi-a6-dp4.html>
>         (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1727>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-
>         interruptible@cd-dp2-hdmi-a3.html> -> FAIL <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12162/shard-bmg-4/igt@kms_flip@2x-
>         flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3.html> (Intel
>         XE#3486 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3486>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ab-
>         dp2-hdmi-a3.html> -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-bmg-1/igt@kms_flip@2x-flip-vs-
>         expired-vblank@ab-dp2-hdmi-a3.html> (Intel XE#2882 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2882>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12162/shard-dg2-433/igt@kms_flip@2x-flip-vs-
>         expired-vblank@bc-hdmi-a6-dp4.html> (Intel XE#301 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/301>) +5 other tests
>         fail
>   *
> 
>     igt@kms_flip@2x-modeset-vs-vblank-race:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-bmg-6/igt@kms_flip@2x-modeset-vs-
>         vblank-race.html> (Intel XE#2316 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2316>)
>   *
> 
>     igt@kms_flip@2x-plain-flip-fb-recreate:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-
>         recreate.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12162/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-
>         recreate.html> (Intel XE#2316 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2316>) +4 other tests skip
>   *
> 
>     igt@kms_flip@busy-flip:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12162/shard-dg2-434/igt@kms_flip@busy-
>         flip.html> (Intel XE#2423 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2423> / i915#2575 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) +48 other
>         tests skip
>   *
> 
>     igt@kms_flip@flip-vs-absolute-wf_vblank@b-dp2:
> 
>       o shard-bmg: NOTRUN -> DMESG-WARN <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12162/shard-bmg-1/igt@kms_flip@flip-vs-
>         absolute-wf_vblank@b-dp2.html> (Intel XE#3468 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) +14 other
>         tests dmesg-warn
>   *
> 
>     igt@kms_flip@wf_vblank-ts-check:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-lnl-5/igt@kms_flip@wf_vblank-ts-check.html> ->
>         FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/
>         shard-lnl-2/igt@kms_flip@wf_vblank-ts-check.html> (Intel XE#3149
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149> /
>         Intel XE#886 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/886>)
>   *
> 
>     igt@kms_flip@wf_vblank-ts-check@b-edp1:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-lnl-5/igt@kms_flip@wf_vblank-ts-check@b-
>         edp1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGTPW_12162/shard-lnl-2/igt@kms_flip@wf_vblank-ts-check@b-
>         edp1.html> (Intel XE#886 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/886>) +1 other test fail
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-
>     downscaling:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-bmg-8/
>         igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-
>         downscaling.html> (Intel XE#2380 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2380>) +1 other test
>         skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-lnl-2/
>         igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-
>         downscaling.html> (Intel XE#1401 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1401> / Intel
>         XE#1745 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1745>) +1 other test skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-
>     downscaling@pipe-a-default-mode:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-lnl-2/
>         igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-
>         downscaling@pipe-a-default-mode.html> (Intel XE#1401 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1401>) +1 other test
>         skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-
>     upscaling@pipe-a-valid-mode:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12162/shard-dg2-433/
>         igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-
>         upscaling@pipe-a-valid-mode.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +4 other tests
>         skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-bmg-6/
>         igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-
>         move.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2312>) +3 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-bmg-2/
>         igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-
>         blt.html> (Intel XE#2311 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2311>) +9 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-
>         primscrn-cur-indfb-draw-mmap-wc.html> -> SKIP <https://intel-
>         gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-dg2-434/
>         igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-
>         mmap-wc.html> (Intel XE#2136 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2136> / Intel XE#2351 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) +7 other
>         tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move:
> 
>       o shard-bmg: NOTRUN -> INCOMPLETE <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12162/shard-bmg-1/
>         igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-
>         move.html> (Intel XE#1727 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1727> / Intel XE#2050 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2050>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12162/shard-dg2-463/
>         igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-
>         render.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/651>) +5 other tests skip
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-lnl-5/
>         igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-
>         render.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/651>) +3 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-bmg-8/
>         igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-
>         onoff.html> (Intel XE#2313 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2313>) +10 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12162/shard-dg2-433/
>         igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-
>         move.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/653>) +1 other test skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12162/shard-dg2-466/
>         igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html> (Intel
>         XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2136> / Intel XE#2351 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2351>) +18 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-bmg-4/
>         igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html> (Intel
>         XE#2352 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352>)
>   *
> 
>     igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-hdmi-a-3:
> 
>       o shard-bmg: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-bmg-6/
>         igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-hdmi-a-3.html>
>         (Intel XE#2333 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2333>) +4 other tests fail
>   *
> 
>     igt@kms_frontbuffer_tracking@plane-fbc-rte:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-bmg-2/
>         igt@kms_frontbuffer_tracking@plane-fbc-rte.html> (Intel XE#2350
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350>)
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-lnl-4/
>         igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-
>         render.html> (Intel XE#656 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/656>) +9 other tests skip
>   *
> 
>     igt@kms_hdmi_inject@inject-audio:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-lnl-7/igt@kms_hdmi_inject@inject-
>         audio.html> (Intel XE#1470 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1470> / Intel XE#2853 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2853>)
>   *
> 
>     igt@kms_hdr@static-toggle-suspend:
> 
>       o shard-bmg: NOTRUN -> DMESG-FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12162/shard-bmg-4/igt@kms_hdr@static-toggle-
>         suspend.html> (Intel XE#3468 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3468>) +9 other tests dmesg-fail
>   *
> 
>     igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-3:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-bmg-8/igt@kms_pipe_crc_basic@suspend-read-
>         crc@pipe-b-hdmi-a-3.html> -> INCOMPLETE <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12162/shard-bmg-2/
>         igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-3.html>
>         (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1727> / Intel XE#3468 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3468>) +1 other test incomplete
>   *
> 
>     igt@kms_plane_alpha_blend@alpha-basic@pipe-a-dp-2:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-bmg-8/igt@kms_plane_alpha_blend@alpha-basic@pipe-
>         a-dp-2.html> -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-bmg-1/
>         igt@kms_plane_alpha_blend@alpha-basic@pipe-a-dp-2.html> (Intel
>         XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3468>) +17 other tests dmesg-fail
>   *
> 
>     igt@kms_plane_lowres@tiling-y:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-bmg-8/igt@kms_plane_lowres@tiling-
>         y.html> (Intel XE#2393 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2393>)
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-
>     factor-0-25@pipe-a:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-bmg-8/igt@kms_plane_scaling@planes-
>         downscale-factor-0-25-upscale-factor-0-25@pipe-a.html> (Intel
>         XE#2763 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2763>) +4 other tests skip
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12162/shard-dg2-436/
>         igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-
>         factor-0-25@pipe-a.html> (Intel XE#2763 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) +2 other
>         tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-
>     factor-0-25@pipe-d:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12162/shard-dg2-436/
>         igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-
>         factor-0-25@pipe-d.html> (Intel XE#2763 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2763> / Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>)
>   *
> 
>     igt@kms_plane_scaling@planes-upscale-factor-0-25:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-
>         factor-0-25.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12162/shard-bmg-4/
>         igt@kms_plane_scaling@planes-upscale-factor-0-25.html> (Intel
>         XE#2566 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2566>) +1 other test dmesg-warn
>   *
> 
>     igt@kms_pm_lpsp@kms-lpsp@pipe-a-hdmi-a-6:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12162/shard-dg2-436/igt@kms_pm_lpsp@kms-
>         lpsp@pipe-a-hdmi-a-6.html> (Intel XE#3527 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3527>)
>   *
> 
>     igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12162/shard-dg2-466/igt@kms_pm_rpm@dpms-
>         mode-unset-non-lpsp.html> (Intel XE#2446 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2446>)
>   *
> 
>     igt@kms_pm_rpm@dpms-non-lpsp:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-435/igt@kms_pm_rpm@dpms-non-lpsp.html> ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/
>         shard-dg2-434/igt@kms_pm_rpm@dpms-non-lpsp.html> (Intel XE#2446
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446>) +1
>         other test skip
>   *
> 
>     igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-bmg-4/igt@kms_psr2_sf@fbc-pr-cursor-
>         plane-move-continuous-sf.html> (Intel XE#1489 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +3 other
>         tests skip
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-lnl-4/igt@kms_psr2_sf@fbc-pr-cursor-
>         plane-move-continuous-sf.html> (Intel XE#2893 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2893>)
>   *
> 
>     igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12162/shard-dg2-463/igt@kms_psr2_sf@fbc-
>         psr2-overlay-plane-update-continuous-sf.html> (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>)
>   *
> 
>     igt@kms_psr@fbc-psr2-dpms:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12162/shard-dg2-436/igt@kms_psr@fbc-psr2-
>         dpms.html> (Intel XE#2850 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2850> / Intel XE#929 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +3 other tests
>         skip
>   *
> 
>     igt@kms_psr@fbc-psr2-primary-render:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12162/shard-dg2-434/igt@kms_psr@fbc-psr2-
>         primary-render.html> (Intel XE#2136 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) +52 other
>         tests skip
>   *
> 
>     igt@kms_psr@pr-dpms:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-lnl-3/igt@kms_psr@pr-dpms.html>
>         (Intel XE#1406 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1406>)
>   *
> 
>     igt@kms_psr@psr-primary-page-flip:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-bmg-4/igt@kms_psr@psr-primary-page-
>         flip.html> (Intel XE#2234 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2234> / Intel XE#2850 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2850>) +4 other
>         tests skip
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12162/shard-dg2-466/igt@kms_psr@psr-primary-
>         page-flip.html> (Intel XE#2351 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2351>)
>   *
> 
>     igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-bmg-8/igt@kms_rotation_crc@primary-4-tiled-
>         reflect-x-180.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12162/shard-bmg-6/
>         igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html> (Intel
>         XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1727>) +1 other test incomplete
>   *
> 
>     igt@kms_rotation_crc@sprite-rotation-270:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-bmg-8/igt@kms_rotation_crc@sprite-
>         rotation-270.html> (Intel XE#3414 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3414>)
>   *
> 
>     igt@kms_rotation_crc@sprite-rotation-90:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-lnl-6/igt@kms_rotation_crc@sprite-
>         rotation-90.html> (Intel XE#3414 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3414>)
>   *
> 
>     igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-lnl-8/igt@kms_universal_plane@cursor-fb-
>         leak@pipe-c-edp-1.html> -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12162/shard-lnl-8/
>         igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html> (Intel
>         XE#899 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/899>) +1 other test fail
>   *
> 
>     igt@kms_vrr@cmrr@pipe-a-edp-1:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html> -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.html> (Intel XE#2159
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159>) +1
>         other test fail
>   *
> 
>     igt@kms_vrr@seamless-rr-switch-drrs:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-lnl-5/igt@kms_vrr@seamless-rr-switch-
>         drrs.html> (Intel XE#1499 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1499>)
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-bmg-2/igt@kms_vrr@seamless-rr-switch-
>         drrs.html> (Intel XE#1499 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1499>) +1 other test skip
>   *
> 
>     igt@kms_writeback@writeback-check-output:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12162/shard-dg2-463/
>         igt@kms_writeback@writeback-check-output.html> (Intel XE#756
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>)
>   *
> 
>     igt@kms_writeback@writeback-check-output-xrgb2101010:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-bmg-1/igt@kms_writeback@writeback-
>         check-output-xrgb2101010.html> (Intel XE#756 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/756>)
>   *
> 
>     igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-vram01-vram01:
> 
>       o shard-dg2-set2: NOTRUN -> DMESG-FAIL <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12162/shard-dg2-435/
>         igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-vram01-
>         vram01.html> (Intel XE#1727 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1727> / Intel XE#3468 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) +4 other
>         tests dmesg-fail
>   *
> 
>     igt@xe_eudebug@basic-vm-bind:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-lnl-3/igt@xe_eudebug@basic-vm-
>         bind.html> (Intel XE#2905 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2905>) +1 other test skip
>   *
> 
>     igt@xe_eudebug@multigpu-basic-client:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-bmg-2/igt@xe_eudebug@multigpu-basic-
>         client.html> (Intel XE#2905 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2905>) +5 other tests skip
>   *
> 
>     igt@xe_eudebug_online@resume-dss:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12162/shard-dg2-463/
>         igt@xe_eudebug_online@resume-dss.html> (Intel XE#2905 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) +2 other
>         tests skip
>   *
> 
>     igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-lnl-6/igt@xe_evict_ccs@evict-
>         overcommit-parallel-nofree-samefd.html> (Intel XE#688 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +4 other tests
>         skip
>   *
> 
>     igt@xe_exec_balancer@once-parallel-rebind:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-436/igt@xe_exec_balancer@once-parallel-
>         rebind.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGTPW_12162/shard-dg2-466/igt@xe_exec_balancer@once-parallel-
>         rebind.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1130>) +147 other tests skip
>   *
> 
>     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-bmg-1/igt@xe_exec_basic@multigpu-
>         many-execqueues-many-vm-basic-defer-mmap.html> (Intel XE#2322
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322>) +3
>         other tests skip
>   *
> 
>     igt@xe_exec_basic@multigpu-once-basic-defer-bind:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-lnl-1/igt@xe_exec_basic@multigpu-
>         once-basic-defer-bind.html> (Intel XE#1392 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +1 other test
>         skip
>   *
> 
>     igt@xe_exec_fault_mode@many-basic-prefetch:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12162/shard-dg2-463/
>         igt@xe_exec_fault_mode@many-basic-prefetch.html> (Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +2
>         other tests skip
>   *
> 
>     igt@xe_exec_fault_mode@twice-userptr-rebind:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-bmg-2/igt@xe_exec_fault_mode@twice-userptr-
>         rebind.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-bmg-4/igt@xe_exec_fault_mode@twice-
>         userptr-rebind.html> (Intel XE#1727 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) +3 other
>         tests dmesg-warn
>   *
> 
>     igt@xe_exec_sip_eudebug@wait-writesip-nodebug:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-bmg-4/igt@xe_exec_sip_eudebug@wait-writesip-
>         nodebug.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-bmg-1/igt@xe_exec_sip_eudebug@wait-
>         writesip-nodebug.html> (Intel XE#3468 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3468> / Intel
>         XE#3514 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3514>)
>   *
> 
>     igt@xe_exec_sip_eudebug@wait-writesip-
>     nodebug@drm_xe_engine_class_render0:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-bmg-4/igt@xe_exec_sip_eudebug@wait-writesip-
>         nodebug@drm_xe_engine_class_render0.html> -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         bmg-1/igt@xe_exec_sip_eudebug@wait-writesip-
>         nodebug@drm_xe_engine_class_render0.html> (Intel XE#3468
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) +71
>         other tests dmesg-warn
>   *
> 
>     igt@xe_exec_threads@threads-bal-mixed-fd-basic:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-435/igt@xe_exec_threads@threads-bal-mixed-fd-
>         basic.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-dg2-435/igt@xe_exec_threads@threads-
>         bal-mixed-fd-basic.html> (Intel XE#1727 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1727>)
>   *
> 
>     igt@xe_exec_threads@threads-fd-userptr-invalidate:
> 
>       o shard-bmg: NOTRUN -> DMESG-WARN <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12162/shard-bmg-1/
>         igt@xe_exec_threads@threads-fd-userptr-invalidate.html> (Intel
>         XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>)
>   *
> 
>     igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:
> 
>       o shard-lnl: NOTRUN -> DMESG-WARN <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12162/shard-lnl-6/
>         igt@xe_fault_injection@inject-fault-probe-function-
>         xe_guc_relay_init.html> (Intel XE#3343 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3343>)
>       o shard-bmg: NOTRUN -> DMESG-WARN <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12162/shard-bmg-8/
>         igt@xe_fault_injection@inject-fault-probe-function-
>         xe_guc_relay_init.html> (Intel XE#3343 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3343>)
>   *
> 
>     igt@xe_gt_freq@freq_reset_multiple:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-lnl-3/igt@xe_gt_freq@freq_reset_multiple.html> ->
>         DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGTPW_12162/shard-lnl-3/igt@xe_gt_freq@freq_reset_multiple.html>
>         (Intel XE#3184 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3184>)
>   *
> 
>     igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-bmg-4/
>         igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html> (Intel
>         XE#2229 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229>)
>   *
> 
>     igt@xe_live_ktest@xe_eudebug:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-bmg-2/
>         igt@xe_live_ktest@xe_eudebug.html> (Intel XE#2833 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2833>)
>   *
> 
>     igt@xe_module_load@load:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-bmg-1/igt@xe_module_load@load.html>
>         (Intel XE#2457 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2457>)
>   *
> 
>     igt@xe_module_load@many-reload:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-bmg-6/igt@xe_module_load@many-reload.html> ->
>         DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGTPW_12162/shard-bmg-2/igt@xe_module_load@many-reload.html>
>         (Intel XE#3467 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3467>)
>   *
> 
>     igt@xe_oa@syncs-userptr-wait:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12162/shard-dg2-436/igt@xe_oa@syncs-userptr-
>         wait.html> (Intel XE#2541 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2541>)
>   *
> 
>     igt@xe_pm@d3cold-basic:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-lnl-4/igt@xe_pm@d3cold-basic.html>
>         (Intel XE#2284 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2284> / Intel XE#366 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/366>)
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-bmg-4/igt@xe_pm@d3cold-basic.html>
>         (Intel XE#2284 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2284>) +1 other test skip
>   *
> 
>     igt@xe_pm@d3hot-mmap-system:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-bmg-8/igt@xe_pm@d3hot-mmap-system.html> -> DMESG-
>         WARN <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/
>         shard-bmg-1/igt@xe_pm@d3hot-mmap-system.html> (Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> /
>         Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3468>) +7 other tests dmesg-warn
>   *
> 
>     igt@xe_pm@s2idle-vm-bind-userptr:
> 
>       o shard-bmg: NOTRUN -> DMESG-WARN <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12162/shard-bmg-1/igt@xe_pm@s2idle-vm-bind-
>         userptr.html> (Intel XE#1616 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1616> / Intel XE#1727 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel
>         XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>)
>   *
> 
>     igt@xe_pm@s3-vm-bind-userptr:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-bmg-6/igt@xe_pm@s3-vm-bind-userptr.html> ->
>         DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGTPW_12162/shard-bmg-4/igt@xe_pm@s3-vm-bind-userptr.html>
>         (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1727> / Intel XE#3468 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3468> / Intel XE#569 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/569>)
>   *
> 
>     igt@xe_pm@s4-basic-exec:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12162/shard-dg2-434/igt@xe_pm@s4-basic-
>         exec.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1130>) +70 other tests skip
>   *
> 
>     igt@xe_pm@s4-vm-bind-userptr:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-bmg-6/igt@xe_pm@s4-vm-bind-userptr.html> ->
>         DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGTPW_12162/shard-bmg-1/igt@xe_pm@s4-vm-bind-userptr.html>
>         (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1727> / Intel XE#2280 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2280> / Intel XE#3468 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3468>)
>   *
> 
>     igt@xe_query@multigpu-query-invalid-query:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-bmg-4/igt@xe_query@multigpu-query-
>         invalid-query.html> (Intel XE#944 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>   *
> 
>     igt@xe_query@multigpu-query-topology:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-lnl-6/igt@xe_query@multigpu-query-
>         topology.html> (Intel XE#944 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/944>) +1 other test skip
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@core_getversion@basic:
> 
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-466/igt@core_getversion@basic.html> (Intel
>         XE#3440 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3440>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12162/shard-dg2-463/igt@core_getversion@basic.html>
>   *
> 
>     igt@core_hotunplug@hotrebind:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-466/igt@core_hotunplug@hotrebind.html> (Intel
>         XE#1885 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1885>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12162/shard-dg2-436/igt@core_hotunplug@hotrebind.html>
>         +1 other test pass
>   *
> 
>     igt@core_setmaster_vs_auth:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-466/igt@core_setmaster_vs_auth.html> (Intel
>         XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2423>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12162/shard-dg2-433/igt@core_setmaster_vs_auth.html>
>   *
> 
>     igt@kms_atomic_interruptible@atomic-setmode@pipe-a-hdmi-a-6:
> 
>       o shard-dg2-set2: DMESG-WARN <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGT_8119/shard-dg2-435/
>         igt@kms_atomic_interruptible@atomic-setmode@pipe-a-hdmi-
>         a-6.html> (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/1727> / Intel XE#3468 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         dg2-463/igt@kms_atomic_interruptible@atomic-setmode@pipe-a-hdmi-
>         a-6.html> +1 other test pass
>   *
> 
>     igt@kms_big_fb@4-tiled-16bpp-rotate-180:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-466/igt@kms_big_fb@4-tiled-16bpp-
>         rotate-180.html> (Intel XE#2136 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2136> / Intel XE#2351 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         dg2-433/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html> +6 other
>         tests pass
>   *
> 
>     igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-
>         displays-2560x1440p.html> (Intel XE#2314 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2314> / Intel
>         XE#2894 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2894>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12162/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-
>         displays-2560x1440p.html>
>   *
> 
>     igt@kms_cursor_crc@cursor-onscreen-128x128:
> 
>       o shard-bmg: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8119/shard-bmg-2/igt@kms_cursor_crc@cursor-
>         onscreen-128x128.html> (Intel XE#3468 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         bmg-8/igt@kms_cursor_crc@cursor-onscreen-128x128.html> +29 other
>         tests pass
>   *
> 
>     igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-d-dp-2:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8119/shard-bmg-1/igt@kms_cursor_edge_walk@256x256-top-
>         bottom@pipe-d-dp-2.html> (Intel XE#3468 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         bmg-8/igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-d-
>         dp-2.html> +126 other tests pass
>   *
> 
>     igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
> 
>       o shard-bmg: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8119/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-
>         atomic-transitions-varying-size.html> (Intel XE#3226 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3226>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-
>         varying-size.html>
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-
>         legacy.html> (Intel XE#2291 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2291>) -> PASS <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12162/shard-bmg-4/
>         igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html> +5 other
>         tests pass
>   *
> 
>     igt@kms_dither@fb-8bpc-vs-panel-6bpc:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html>
>         (Intel XE#1340 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1340>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12162/shard-bmg-8/igt@kms_dither@fb-8bpc-vs-
>         panel-6bpc.html>
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-
>         interruptible@bc-dp2-hdmi-a3.html> (Intel XE#3321 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3321> / Intel
>         XE#3486 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3486>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12162/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-
>         vblank-interruptible@bc-dp2-hdmi-a3.html>
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-
>         interruptible@bd-dp2-hdmi-a3.html> (Intel XE#3486 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3486>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-
>         dp2-hdmi-a3.html>
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@bc-
>         dp2-hdmi-a3.html> (Intel XE#2882 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2882>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html>
>   *
> 
>     igt@kms_flip@2x-flip-vs-suspend@ac-dp2-hdmi-a3:
> 
>       o shard-bmg: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8119/shard-bmg-2/igt@kms_flip@2x-flip-vs-suspend@ac-dp2-
>         hdmi-a3.html> (Intel XE#1727 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1727> / Intel XE#3468 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         bmg-4/igt@kms_flip@2x-flip-vs-suspend@ac-dp2-hdmi-a3.html> +13
>         other tests pass
>   *
> 
>     igt@kms_flip@2x-flip-vs-suspend@bd-dp2-hdmi-a3:
> 
>       o shard-bmg: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8119/shard-bmg-2/igt@kms_flip@2x-flip-vs-suspend@bd-dp2-
>         hdmi-a3.html> (Intel XE#1727 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1727> / Intel XE#2635 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2635> / Intel
>         XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3468>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12162/shard-bmg-4/igt@kms_flip@2x-flip-vs-suspend@bd-
>         dp2-hdmi-a3.html>
>   *
> 
>     igt@kms_flip@2x-nonexisting-fb:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html> (Intel
>         XE#2316 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2316>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12162/shard-bmg-1/igt@kms_flip@2x-nonexisting-fb.html>
>         +5 other tests pass
>   *
> 
>     igt@kms_flip@flip-vs-rmfb@d-hdmi-a3:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8119/shard-bmg-1/igt@kms_flip@flip-vs-rmfb@d-hdmi-
>         a3.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGTPW_12162/shard-bmg-2/igt@kms_flip@flip-vs-rmfb@d-hdmi-
>         a3.html> +5 other tests pass
>   *
> 
>     igt@kms_flip@flip-vs-suspend-interruptible:
> 
>       o shard-bmg: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8119/shard-bmg-8/igt@kms_flip@flip-vs-suspend-
>         interruptible.html> (Intel XE#1727 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel
>         XE#2597 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2597> / Intel XE#3468 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3468>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12162/shard-bmg-6/
>         igt@kms_flip@flip-vs-suspend-interruptible.html> +1 other test pass
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-4tile-
>         to-64bpp-4tile-downscaling.html> (Intel XE#2136 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-
>         downscaling.html> +21 other tests pass
>   *
> 
>     igt@kms_hdr@invalid-hdr:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-bmg-6/igt@kms_hdr@invalid-hdr.html> (Intel
>         XE#1503 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1503>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12162/shard-bmg-8/igt@kms_hdr@invalid-hdr.html>
>   *
> 
>     igt@kms_pipe_crc_basic@bad-source:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-466/igt@kms_pipe_crc_basic@bad-source.html>
>         (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12162/shard-dg2-433/
>         igt@kms_pipe_crc_basic@bad-source.html> +74 other tests pass
>   *
> 
>     igt@kms_pipe_crc_basic@nonblocking-crc:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8119/shard-bmg-6/igt@kms_pipe_crc_basic@nonblocking-
>         crc.html> (Intel XE#877 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/877>) -> PASS <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-bmg-2/
>         igt@kms_pipe_crc_basic@nonblocking-crc.html> +2 other tests pass
>   *
> 
>     igt@kms_pm_dc@dc5-psr:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-lnl-7/igt@kms_pm_dc@dc5-psr.html> (Intel XE#718
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/718>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/
>         shard-lnl-7/igt@kms_pm_dc@dc5-psr.html>
>   *
> 
>     igt@kms_pm_rpm@modeset-stress-extra-wait:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-434/igt@kms_pm_rpm@modeset-stress-extra-
>         wait.html> (Intel XE#2446 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2446>) -> PASS <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12162/shard-dg2-436/igt@kms_pm_rpm@modeset-
>         stress-extra-wait.html> +2 other tests pass
>   *
> 
>     igt@kms_pm_rpm@universal-planes-dpms:
> 
>       o shard-lnl: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8119/shard-lnl-2/igt@kms_pm_rpm@universal-planes-
>         dpms.html> (Intel XE#2042 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2042>) -> PASS <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12162/shard-lnl-6/igt@kms_pm_rpm@universal-
>         planes-dpms.html>
>   *
> 
>     igt@kms_pm_rpm@universal-planes-dpms@plane-32:
> 
>       o shard-lnl: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8119/shard-lnl-2/igt@kms_pm_rpm@universal-planes-
>         dpms@plane-32.html> -> PASS <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-lnl-6/igt@kms_pm_rpm@universal-
>         planes-dpms@plane-32.html>
>   *
> 
>     igt@kms_pm_rpm@universal-planes-dpms@plane-59:
> 
>       o shard-lnl: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8119/shard-lnl-2/igt@kms_pm_rpm@universal-planes-
>         dpms@plane-59.html> (Intel XE#3184 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3184>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         lnl-6/igt@kms_pm_rpm@universal-planes-dpms@plane-59.html>
>   *
> 
>     igt@kms_psr@fbc-psr2-primary-page-flip:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-lnl-4/igt@kms_psr@fbc-psr2-primary-page-
>         flip.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGTPW_12162/shard-lnl-5/igt@kms_psr@fbc-psr2-primary-page-
>         flip.html> +1 other test pass
>   *
> 
>     igt@kms_setmode@clone-exclusive-crtc:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html>
>         (Intel XE#1435 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1435>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12162/shard-bmg-4/igt@kms_setmode@clone-exclusive-
>         crtc.html>
>   *
> 
>     igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-3:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8119/shard-bmg-8/igt@kms_vblank@ts-continuation-dpms-
>         rpm@pipe-d-hdmi-a-3.html> (Intel XE#1727 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel
>         XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3468>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12162/shard-bmg-4/igt@kms_vblank@ts-continuation-dpms-
>         rpm@pipe-d-hdmi-a-3.html> +7 other tests pass
>   *
> 
>     igt@kms_vrr@max-min@pipe-a-edp-1:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-lnl-4/igt@kms_vrr@max-min@pipe-a-edp-1.html>
>         (Intel XE#1522 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1522>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12162/shard-lnl-1/igt@kms_vrr@max-min@pipe-a-
>         edp-1.html> +1 other test pass
>   *
> 
>     igt@xe_evict@evict-mixed-many-threads-small:
> 
>       o shard-bmg: TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-bmg-8/igt@xe_evict@evict-mixed-many-threads-
>         small.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1473> / Intel XE#2472 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2472>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html>
>   *
> 
>     igt@xe_exec_balancer@many-execqueues-virtual-rebind:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-434/igt@xe_exec_balancer@many-execqueues-
>         virtual-rebind.html> (Intel XE#1130 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         dg2-436/igt@xe_exec_balancer@many-execqueues-virtual-
>         rebind.html> +125 other tests pass
>   *
> 
>     igt@xe_exec_fault_mode@many-execqueues-rebind:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8119/shard-bmg-1/igt@xe_exec_fault_mode@many-execqueues-
>         rebind.html> (Intel XE#1727 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1727>) -> PASS <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12162/shard-bmg-2/
>         igt@xe_exec_fault_mode@many-execqueues-rebind.html> +4 other
>         tests pass
>   *
> 
>     igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate:
> 
>       o shard-dg2-set2: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGT_8119/shard-dg2-433/igt@xe_exec_threads@threads-
>         mixed-shared-vm-userptr-invalidate.html> (Intel XE#3371
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3371>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/
>         shard-dg2-435/igt@xe_exec_threads@threads-mixed-shared-vm-
>         userptr-invalidate.html>
>   *
> 
>     igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8119/shard-bmg-2/igt@xe_fault_injection@inject-fault-
>         probe-function-xe_sriov_init.html> (Intel XE#3467 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3467> / Intel
>         XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3468>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12162/shard-bmg-1/igt@xe_fault_injection@inject-fault-
>         probe-function-xe_sriov_init.html> +2 other tests pass
>   *
> 
>     igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:
> 
>       o shard-dg2-set2: DMESG-WARN <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGT_8119/shard-dg2-433/igt@xe_fault_injection@inject-
>         fault-probe-function-xe_tile_init_early.html> (Intel XE#3467
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/
>         shard-dg2-435/igt@xe_fault_injection@inject-fault-probe-
>         function-xe_tile_init_early.html>
>   *
> 
>     igt@xe_live_ktest@xe_bo:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-bmg-8/igt@xe_live_ktest@xe_bo.html> (Intel
>         XE#1192 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1192>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12162/shard-bmg-4/igt@xe_live_ktest@xe_bo.html> +1
>         other test pass
>   *
> 
>     igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
> 
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGT_8119/shard-dg2-434/
>         igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html> -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         dg2-466/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html> +1
>         other test pass
>   *
> 
>     igt@xe_module_load@reload-no-display:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8119/shard-bmg-6/igt@xe_module_load@reload-no-
>         display.html> (Intel XE#3467 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3467>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12162/shard-bmg-4/
>         igt@xe_module_load@reload-no-display.html> +3 other tests pass
>   *
> 
>     igt@xe_pm@s2idle-multiple-execs:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8119/shard-bmg-6/igt@xe_pm@s2idle-multiple-execs.html>
>         (Intel XE#1616 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1616> / Intel XE#3468 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3468>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12162/shard-bmg-8/
>         igt@xe_pm@s2idle-multiple-execs.html>
>   *
> 
>     igt@xe_pm@s2idle-vm-bind-prefetch:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8119/shard-bmg-1/igt@xe_pm@s2idle-vm-bind-prefetch.html>
>         (Intel XE#1616 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1616> / Intel XE#1727 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1727> / Intel XE#3468 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         bmg-4/igt@xe_pm@s2idle-vm-bind-prefetch.html>
>   *
> 
>     igt@xe_pm@s3-exec-after:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8119/shard-bmg-6/igt@xe_pm@s3-exec-after.html> (Intel
>         XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3468> / Intel XE#569 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/569>) -> PASS <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12162/shard-bmg-2/igt@xe_pm@s3-exec-after.html>
>   *
> 
>     igt@xe_pm@s4-d3hot-basic-exec:
> 
>       o shard-lnl: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html> (Intel
>         XE#1358 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1358> / Intel XE#1607 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1607>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12162/shard-lnl-3/igt@xe_pm@s4-
>         d3hot-basic-exec.html>
>   *
> 
>     igt@xe_pm@s4-multiple-execs:
> 
>       o shard-lnl: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html> (Intel
>         XE#1358 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1358> / Intel XE#1607 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1607> / Intel XE#1794 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1794>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         lnl-6/igt@xe_pm@s4-multiple-execs.html>
>   *
> 
>     igt@xe_vm@large-split-binds-4194304:
> 
>       o shard-dg2-set2: DMESG-WARN <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGT_8119/shard-dg2-435/igt@xe_vm@large-split-
>         binds-4194304.html> (Intel XE#1727 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         dg2-463/igt@xe_vm@large-split-binds-4194304.html> +2 other tests
>         pass
> 
> 
>         Warnings
> 
>   *
> 
>     igt@core_hotunplug@hotrebind-lateclose:
> 
>       o shard-dg2-set2: DMESG-WARN <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGT_8119/shard-dg2-433/igt@core_hotunplug@hotrebind-
>         lateclose.html> (Intel XE#3468 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3468>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12162/shard-dg2-466/
>         igt@core_hotunplug@hotrebind-lateclose.html> (Intel XE#1885
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885>)
>   *
> 
>     igt@core_hotunplug@hotunbind-rebind:
> 
>       o shard-dg2-set2: DMESG-WARN <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGT_8119/shard-dg2-463/igt@core_hotunplug@hotunbind-
>         rebind.html> (Intel XE#3468 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/3468> / Intel XE#3521 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3521>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         dg2-434/igt@core_hotunplug@hotunbind-rebind.html> (Intel XE#1885
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885>)
>   *
> 
>     igt@kms_async_flips@alternate-sync-async-flip:
> 
>       o shard-bmg: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8119/shard-bmg-1/igt@kms_async_flips@alternate-sync-
>         async-flip.html> (Intel XE#1727 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1727> / Intel XE#3468 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         bmg-2/igt@kms_async_flips@alternate-sync-async-flip.html> (Intel
>         XE#827 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/827>)
>   *
> 
>     igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-3:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8119/shard-bmg-1/igt@kms_async_flips@alternate-sync-
>         async-flip@pipe-c-hdmi-a-3.html> (Intel XE#3468 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         bmg-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-
>         a-3.html> (Intel XE#827 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/827>)
>   *
> 
>     igt@kms_async_flips@async-flip-suspend-resume:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-466/igt@kms_async_flips@async-flip-suspend-
>         resume.html> (Intel XE#2423 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2423> / i915#2575 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) -> DMESG-
>         WARN <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/
>         shard-dg2-435/igt@kms_async_flips@async-flip-suspend-
>         resume.html> (Intel XE#3468 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/3468>)
>   *
> 
>     igt@kms_async_flips@async-flip-with-page-flip-events:
> 
>       o shard-bmg: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8119/shard-bmg-2/igt@kms_async_flips@async-flip-with-
>         page-flip-events.html> (Intel XE#1727 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel
>         XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3468>) -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-bmg-1/igt@kms_async_flips@async-flip-
>         with-page-flip-events.html> (Intel XE#1727 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel
>         XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>)
>   *
> 
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-dp-2-4:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8119/shard-bmg-2/igt@kms_async_flips@async-flip-with-
>         page-flip-events@pipe-a-dp-2-4.html> (Intel XE#1727 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         bmg-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-
>         a-dp-2-4.html> (Intel XE#1727 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1727> / Intel XE#3468 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3468>)
>   *
> 
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-dp-2-linear:
> 
>       o shard-bmg: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8119/shard-bmg-2/igt@kms_async_flips@async-flip-with-
>         page-flip-events@pipe-a-dp-2-linear.html> (Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> /
>         Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3468>) -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-bmg-1/igt@kms_async_flips@async-flip-
>         with-page-flip-events@pipe-a-dp-2-linear.html> (Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>)
>   *
> 
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-dp-2-x:
> 
>       o shard-bmg: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8119/shard-bmg-2/igt@kms_async_flips@async-flip-with-
>         page-flip-events@pipe-a-dp-2-x.html> (Intel XE#3468 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         bmg-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-
>         a-dp-2-x.html> (Intel XE#1727 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1727> / Intel XE#3468 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3468>)
>   *
> 
>     igt@kms_big_fb@4-tiled-8bpp-rotate-90:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-433/igt@kms_big_fb@4-tiled-8bpp-
>         rotate-90.html> (Intel XE#316 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/316>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12162/shard-dg2-466/igt@kms_big_fb@4-
>         tiled-8bpp-rotate-90.html> (Intel XE#2136 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2136> / Intel
>         XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2351>) +1 other test skip
>   *
> 
>     igt@kms_big_fb@x-tiled-16bpp-rotate-270:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-434/igt@kms_big_fb@x-tiled-16bpp-
>         rotate-270.html> (Intel XE#2136 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2136>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12162/shard-dg2-435/
>         igt@kms_big_fb@x-tiled-16bpp-rotate-270.html> (Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +2
>         other tests skip
>   *
> 
>     igt@kms_big_fb@x-tiled-8bpp-rotate-270:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-435/igt@kms_big_fb@x-tiled-8bpp-
>         rotate-270.html> (Intel XE#316 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/316>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12162/shard-dg2-434/igt@kms_big_fb@x-
>         tiled-8bpp-rotate-270.html> (Intel XE#2136 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) +1 other test
>         skip
>   *
> 
>     igt@kms_big_fb@x-tiled-8bpp-rotate-90:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-466/igt@kms_big_fb@x-tiled-8bpp-
>         rotate-90.html> (Intel XE#2136 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2136> / Intel XE#2351 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         dg2-435/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html> (Intel
>         XE#316 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/316>) +1 other test skip
>   *
> 
>     igt@kms_big_fb@y-tiled-addfb-size-overflow:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-435/igt@kms_big_fb@y-tiled-addfb-size-
>         overflow.html> (Intel XE#610 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/610>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12162/shard-dg2-466/igt@kms_big_fb@y-tiled-
>         addfb-size-overflow.html> (Intel XE#2136 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2136>)
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-
>         stride-64bpp-rotate-180-hflip.html> (Intel XE#2136 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2136> / Intel
>         XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2351>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12162/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-
>         stride-64bpp-rotate-180-hflip.html> (Intel XE#1124 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +4 other
>         tests skip
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-
>         stride-64bpp-rotate-180-hflip-async-flip.html> (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/
>         shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-
>         rotate-180-hflip-async-flip.html> (Intel XE#1124 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +6 other
>         tests skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-433/igt@kms_big_fb@yf-tiled-64bpp-
>         rotate-90.html> (Intel XE#1124 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1124>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12162/shard-dg2-434/
>         igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html> (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) +3
>         other tests skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb-size-
>         offset-overflow.html> (Intel XE#607 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/607>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html>
>         (Intel XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2136>)
>   *
> 
>     igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-
>         stride-64bpp-rotate-180-async-flip.html> (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/
>         shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-
>         rotate-180-async-flip.html> (Intel XE#2136 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2136> / Intel
>         XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2351>) +4 other tests skip
>   *
> 
>     igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-435/igt@kms_bw@connected-linear-tiling-4-
>         displays-3840x2160p.html> (Intel XE#2191 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2191>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         dg2-434/igt@kms_bw@connected-linear-tiling-4-
>         displays-3840x2160p.html> (Intel XE#2423 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>   *
> 
>     igt@kms_bw@linear-tiling-2-displays-3840x2160p:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-463/igt@kms_bw@linear-tiling-2-
>         displays-3840x2160p.html> (Intel XE#367 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/367>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         dg2-434/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html>
>         (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>) +2 other tests skip
>   *
> 
>     igt@kms_bw@linear-tiling-4-displays-2160x1440p:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-466/igt@kms_bw@linear-tiling-4-
>         displays-2160x1440p.html> (Intel XE#2423 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/
>         shard-dg2-463/igt@kms_bw@linear-tiling-4-
>         displays-2160x1440p.html> (Intel XE#367 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +4 other tests
>         skip
>   *
> 
>     igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-tiled-
>         gen12-rc-ccs.html> (Intel XE#2136 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2136> / Intel
>         XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2351>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12162/shard-dg2-463/igt@kms_ccs@bad-rotation-90-y-
>         tiled-gen12-rc-ccs.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +1
>         other test skip
>   *
> 
>     igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-y-tiled-
>         gen12-rc-ccs.html> (Intel XE#2136 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         dg2-433/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html>
>         (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/787>) +6 other tests skip
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
> 
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-
>         tiled-dg2-rc-ccs-cc.html> (Intel XE#616 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/616>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-
>         cc.html> (Intel XE#2136 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2136>)
>   *
> 
>     igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-y-tiled-
>         gen12-mc-ccs.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/
>         shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-
>         ccs.html> (Intel XE#2136 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2136> / Intel XE#2351 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) +2 other
>         tests skip
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-bmg-
>         ccs.html> (Intel XE#2907 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2907>) -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-dg2-434/igt@kms_ccs@random-ccs-
>         data-4-tiled-bmg-ccs.html> (Intel XE#2136 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2136>)
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-
>         mc-ccs.html> (Intel XE#2136 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2136> / Intel XE#2351 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html>
>         (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1727>)
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-lnl-
>         ccs.html> (Intel XE#2136 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2136>) -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-dg2-463/igt@kms_ccs@random-ccs-
>         data-4-tiled-lnl-ccs.html> (Intel XE#2907 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2907>) +1 other test
>         skip
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-mtl-
>         mc-ccs.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/455> / Intel XE#787 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/787>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html>
>         (Intel XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2136>) +10 other tests skip
>   *
> 
>     igt@kms_chamelium_color@ctm-0-75:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-466/igt@kms_chamelium_color@ctm-0-75.html>
>         (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12162/shard-dg2-433/
>         igt@kms_chamelium_color@ctm-0-75.html> (Intel XE#306 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/306>) +1 other test skip
>   *
> 
>     igt@kms_chamelium_color@degamma:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-433/igt@kms_chamelium_color@degamma.html>
>         (Intel XE#306 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/306>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGTPW_12162/shard-dg2-434/igt@kms_chamelium_color@degamma.html>
>         (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>) +1 other test skip
>   *
> 
>     igt@kms_chamelium_hpd@vga-hpd:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-433/igt@kms_chamelium_hpd@vga-hpd.html>
>         (Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/373>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGTPW_12162/shard-dg2-466/igt@kms_chamelium_hpd@vga-hpd.html>
>         (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>) +8 other tests skip
>   *
> 
>     igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd-for-each-
>         pipe.html> (Intel XE#2423 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2423> / i915#2575 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         dg2-463/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html> (Intel
>         XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/373>) +11 other tests skip
>   *
> 
>     igt@kms_content_protection@atomic:
> 
>       o shard-bmg: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8119/shard-bmg-1/igt@kms_content_protection@atomic.html>
>         (Intel XE#2715 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2715> / Intel XE#3468 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3468>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12162/shard-bmg-6/
>         igt@kms_content_protection@atomic.html> (Intel XE#2341 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2341>)
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-436/igt@kms_content_protection@atomic.html>
>         (Intel XE#1178 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1178>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12162/shard-dg2-466/
>         igt@kms_content_protection@atomic.html> (Intel XE#2423 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>   *
> 
>     igt@kms_content_protection@dp-mst-lic-type-1:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-436/igt@kms_content_protection@dp-mst-lic-
>         type-1.html> (Intel XE#307 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/307>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12162/shard-dg2-434/
>         igt@kms_content_protection@dp-mst-lic-type-1.html> (Intel
>         XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>)
>   *
> 
>     igt@kms_content_protection@lic-type-0:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-bmg-2/igt@kms_content_protection@lic-type-0.html>
>         (Intel XE#1178 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1178>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12162/shard-bmg-6/igt@kms_content_protection@lic-
>         type-0.html> (Intel XE#2341 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2341>)
>   *
> 
>     igt@kms_content_protection@uevent:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-bmg-6/igt@kms_content_protection@uevent.html>
>         (Intel XE#2341 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2341>) -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-bmg-2/
>         igt@kms_content_protection@uevent.html> (Intel XE#3468 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3468>)
>   *
> 
>     igt@kms_cursor_crc@cursor-offscreen-512x512:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-466/igt@kms_cursor_crc@cursor-
>         offscreen-512x512.html> (Intel XE#2423 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/
>         shard-dg2-436/igt@kms_cursor_crc@cursor-offscreen-512x512.html>
>         (Intel XE#308 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/308>) +1 other test skip
>   *
> 
>     igt@kms_cursor_crc@cursor-random-32x10:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-466/igt@kms_cursor_crc@cursor-
>         random-32x10.html> (Intel XE#2423 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/
>         shard-dg2-435/igt@kms_cursor_crc@cursor-random-32x10.html>
>         (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/455>) +2 other tests skip
>   *
> 
>     igt@kms_cursor_crc@cursor-sliding-256x256:
> 
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-463/igt@kms_cursor_crc@cursor-
>         sliding-256x256.html> -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-dg2-434/igt@kms_cursor_crc@cursor-
>         sliding-256x256.html> (Intel XE#2423 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>   *
> 
>     igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-
>         varying-size.html> (Intel XE#2291 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2291>) -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html>
>         (Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3468>) +1 other test dmesg-warn
>   *
> 
>     igt@kms_cursor_legacy@torture-bo:
> 
>       o shard-dg2-set2: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGT_8119/shard-dg2-463/igt@kms_cursor_legacy@torture-
>         bo.html> (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/1727>) -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-dg2-466/
>         igt@kms_cursor_legacy@torture-bo.html> (Intel XE#2423 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>   *
> 
>     igt@kms_dsc@dsc-with-bpc-formats:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-433/igt@kms_dsc@dsc-with-bpc-formats.html>
>         (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/455>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGTPW_12162/shard-dg2-466/igt@kms_dsc@dsc-with-bpc-formats.html>
>         (Intel XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2136> / Intel XE#2351 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2351>) +3 other tests skip
>   *
> 
>     igt@kms_fbcon_fbt@fbc-suspend:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-bmg-4/igt@kms_fbcon_fbt@fbc-suspend.html> (Intel
>         XE#1695 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1695>) -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-bmg-4/igt@kms_fbcon_fbt@fbc-
>         suspend.html> (Intel XE#3468 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3468>)
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGT_8119/shard-dg2-463/igt@kms_fbcon_fbt@fbc-
>         suspend.html> (Intel XE#1727 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1727> / Intel XE#3468 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         dg2-466/igt@kms_fbcon_fbt@fbc-suspend.html> (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>)
>   *
> 
>     igt@kms_feature_discovery@display-4x:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-434/
>         igt@kms_feature_discovery@display-4x.html> (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/2575>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12162/shard-dg2-433/
>         igt@kms_feature_discovery@display-4x.html> (Intel XE#1138
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138>)
>   *
> 
>     igt@kms_flip@2x-blocking-absolute-wf_vblank:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-434/igt@kms_flip@2x-blocking-absolute-
>         wf_vblank.html> (Intel XE#2423 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2423> / i915#2575 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) -> DMESG-
>         WARN <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/
>         shard-dg2-435/igt@kms_flip@2x-blocking-absolute-wf_vblank.html>
>         (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1727>)
>   *
> 
>     igt@kms_flip@flip-vs-absolute-wf_vblank:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-bmg-6/igt@kms_flip@flip-vs-absolute-
>         wf_vblank.html> (Intel XE#2882 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2882>) -> DMESG-FAIL <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12162/shard-bmg-1/
>         igt@kms_flip@flip-vs-absolute-wf_vblank.html> (Intel XE#3468
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>)
>   *
> 
>     igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a3:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-bmg-6/igt@kms_flip@flip-vs-absolute-wf_vblank@b-
>         hdmi-a3.html> (Intel XE#2882 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2882>) -> DMESG-WARN <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12162/shard-bmg-1/
>         igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a3.html> (Intel
>         XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3468>) +2 other tests dmesg-warn
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank-interruptible:
> 
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-
>         interruptible.html> (Intel XE#301 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/301>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible.html>
>         (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>)
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank@c-dp2:
> 
>       o shard-bmg: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8119/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank@c-
>         dp2.html> (Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/3468>) -> DMESG-WARN <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12162/shard-bmg-4/igt@kms_flip@flip-vs-
>         expired-vblank@c-dp2.html> (Intel XE#3468 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) +2 other
>         tests dmesg-warn
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-
>         yftile-to-32bpp-yftileccs-upscaling.html> (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/
>         shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-yftile-
>         to-32bpp-yftileccs-upscaling.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1 other test skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-
>         yftile-to-32bpp-yftile-downscaling.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-
>         yftile-downscaling.html> (Intel XE#2136 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) +1 other test
>         skip
>   *
> 
>     igt@kms_force_connector_basic@prune-stale-modes:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-434/igt@kms_force_connector_basic@prune-
>         stale-modes.html> (Intel XE#2423 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/
>         shard-dg2-433/igt@kms_force_connector_basic@prune-stale-
>         modes.html> (i915#5274 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/5274>)
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-
>         primscrn-cur-indfb-draw-mmap-wc.html> (Intel XE#651 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/651>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-
>         draw-mmap-wc.html> (Intel XE#2136 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) +21 other
>         tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-
>         scndscrn-indfb-pgflip-blt.html> (Intel XE#2311 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-
>         pgflip-blt.html> (Intel XE#2312 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2312>) +13 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-suspend:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-
>         suspend.html> (Intel XE#2136 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2136> / Intel XE#2351 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         dg2-436/igt@kms_frontbuffer_tracking@drrs-suspend.html> (Intel
>         XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/651>) +11 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-
>         primscrn-cur-indfb-draw-mmap-wc.html> (Intel XE#2333 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2333>) -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-
>         draw-mmap-wc.html> (Intel XE#1727 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1727>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-
>         primscrn-pri-shrfb-draw-blt.html> (Intel XE#2333 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2333>) -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-
>         draw-blt.html> (Intel XE#3468 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3468>) +6 other tests dmesg-fail
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-rte:
> 
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGT_8119/shard-dg2-435/
>         igt@kms_frontbuffer_tracking@fbc-1p-rte.html> (Intel XE#3468
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/
>         shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-rte.html>
>         (Intel XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2136>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-
>         primscrn-cur-indfb-draw-render.html> (Intel XE#2333 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2333>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-
>         draw-render.html> (Intel XE#2312 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) +1 other test
>         skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
> 
>       o shard-bmg: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8119/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-
>         primscrn-pri-shrfb-draw-mmap-wc.html> (Intel XE#3468 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-
>         draw-mmap-wc.html> (Intel XE#1727 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1727>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-rte:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-
>         rte.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2312>) -> DMESG-FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12162/shard-bmg-1/
>         igt@kms_frontbuffer_tracking@fbc-2p-rte.html> (Intel XE#3468
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-
>         scndscrn-cur-indfb-draw-render.html> (Intel XE#2312 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-
>         draw-render.html> (Intel XE#2333 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2333>) +8 other
>         tests fail
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-
>         scndscrn-spr-indfb-draw-blt.html> (Intel XE#2312 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-
>         draw-blt.html> (Intel XE#1727 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1727> / Intel XE#3468 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3468>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
> 
>       o shard-bmg: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8119/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-
>         scndscrn-spr-indfb-draw-render.html> (Intel XE#3468 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-
>         draw-render.html> (Intel XE#2312 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) +2 other
>         tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
> 
>       o shard-bmg: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8119/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-
>         scndscrn-spr-indfb-onoff.html> (Intel XE#3468 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-
>         onoff.html> (Intel XE#2333 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2333>) +15 other tests fail
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-
>         rte.html> (Intel XE#2136 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2136>) -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-dg2-433/
>         igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html> (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +15
>         other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-
>         scndscrn-pri-shrfb-draw-render.html> (Intel XE#2312 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-
>         shrfb-draw-render.html> (Intel XE#2311 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) +23 other
>         tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-
>         scndscrn-shrfb-pgflip-blt.html> (Intel XE#651 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/651>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-
>         pgflip-blt.html> (Intel XE#2136 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2136> / Intel XE#2351 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) +12 other
>         tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-
>         tiling-y.html> (Intel XE#2136 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2136> / Intel XE#2351 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html>
>         (Intel XE#658 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/658>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-1p-
>         primscrn-pri-indfb-draw-render.html> (Intel XE#653 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/653>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-
>         indfb-draw-render.html> (Intel XE#2136 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) +24 other
>         tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-
>         scndscrn-cur-indfb-draw-mmap-wc.html> (Intel XE#2136 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2136> / Intel
>         XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2351>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12162/shard-dg2-433/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-
>         mmap-wc.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/653>) +9 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-
>         scndscrn-shrfb-plflip-blt.html> (Intel XE#2312 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-
>         plflip-blt.html> (Intel XE#2313 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2313>) +21 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-
>         tiling-linear.html> (Intel XE#2136 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html>
>         (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/653>) +21 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-
>         scndscrn-pri-shrfb-draw-render.html> (Intel XE#653 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/653>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-
>         draw-render.html> (Intel XE#2136 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2136> / Intel
>         XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2351>) +4 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-
>         scndscrn-shrfb-pgflip-blt.html> (Intel XE#2313 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-
>         blt.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2312>) +11 other tests skip
>   *
> 
>     igt@kms_joiner@basic-ultra-joiner:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-435/igt@kms_joiner@basic-ultra-joiner.html>
>         (Intel XE#2927 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2927>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12162/shard-dg2-434/igt@kms_joiner@basic-ultra-
>         joiner.html> (Intel XE#2136 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2136>)
>   *
> 
>     igt@kms_joiner@invalid-modeset-big-joiner:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-466/igt@kms_joiner@invalid-modeset-big-
>         joiner.html> (Intel XE#2136 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2136>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12162/shard-dg2-436/igt@kms_joiner@invalid-
>         modeset-big-joiner.html> (Intel XE#346 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/346>)
>   *
> 
>     igt@kms_lease@simple-lease:
> 
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGT_8119/shard-dg2-435/igt@kms_lease@simple-lease.html>
>         (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1727>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12162/shard-dg2-466/igt@kms_lease@simple-lease.html>
>         (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>)
>   *
> 
>     igt@kms_plane_multiple@tiling-y:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-433/igt@kms_plane_multiple@tiling-y.html>
>         (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/455>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGTPW_12162/shard-dg2-434/igt@kms_plane_multiple@tiling-y.html>
>         (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>) +9 other tests skip
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-
>         factor-0-25-with-pixel-format.html> (Intel XE#2763 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2763> / Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/
>         shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-
>         with-pixel-format.html> (Intel XE#2423 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-
>         factor-0-25-upscale-factor-0-25.html> (Intel XE#2423 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/
>         shard-dg2-436/igt@kms_plane_scaling@planes-downscale-
>         factor-0-25-upscale-factor-0-25.html> (Intel XE#2763 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2763> / Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>)
>   *
> 
>     igt@kms_pm_backlight@fade:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-434/igt@kms_pm_backlight@fade.html> (Intel
>         XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2136>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12162/shard-dg2-463/igt@kms_pm_backlight@fade.html>
>         (Intel XE#870 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/870>) +1 other test skip
>   *
> 
>     igt@kms_pm_dc@dc3co-vpb-simulation:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-463/igt@kms_pm_dc@dc3co-vpb-simulation.html>
>         (Intel XE#1122 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1122>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12162/shard-dg2-434/igt@kms_pm_dc@dc3co-vpb-
>         simulation.html> (Intel XE#2136 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2136> / Intel XE#2351 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2351>)
>   *
> 
>     igt@kms_pm_dc@dc5-retention-flops:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-434/igt@kms_pm_dc@dc5-retention-flops.html>
>         (Intel XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2136>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12162/shard-dg2-433/igt@kms_pm_dc@dc5-retention-
>         flops.html> (Intel XE#3309 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/3309>)
>   *
> 
>     igt@kms_pm_dc@dc6-dpms:
> 
>       o shard-bmg: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8119/shard-bmg-1/igt@kms_pm_dc@dc6-dpms.html> (Intel
>         XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1727> / Intel XE#3468 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3468>) -> DMESG-FAIL <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12162/shard-bmg-1/
>         igt@kms_pm_dc@dc6-dpms.html> (Intel XE#3468 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3468>)
>   *
> 
>     igt@kms_pm_dc@dc6-psr:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-433/igt@kms_pm_dc@dc6-psr.html> (Intel
>         XE#1129 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1129>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12162/shard-dg2-434/igt@kms_pm_dc@dc6-psr.html> (Intel
>         XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2136> / Intel XE#2351 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2351>)
>   *
> 
>     igt@kms_pm_dc@deep-pkgc:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-433/igt@kms_pm_dc@deep-pkgc.html> (Intel
>         XE#908 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/908>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGTPW_12162/shard-dg2-466/igt@kms_pm_dc@deep-pkgc.html> (Intel
>         XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>)
>   *
> 
>     igt@kms_pm_lpsp@kms-lpsp:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-466/igt@kms_pm_lpsp@kms-lpsp.html> (Intel
>         XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2136>) -> FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12162/shard-dg2-436/igt@kms_pm_lpsp@kms-lpsp.html>
>         (Intel XE#3527 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3527>)
>   *
> 
>     igt@kms_pm_rpm@cursor-dpms:
> 
>       o shard-dg2-set2: DMESG-WARN <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGT_8119/shard-dg2-433/igt@kms_pm_rpm@cursor-dpms.html>
>         (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1727> / Intel XE#3468 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3468>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12162/shard-dg2-434/
>         igt@kms_pm_rpm@cursor-dpms.html> (Intel XE#2446 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2446>)
>   *
> 
>     igt@kms_pm_rpm@legacy-planes-dpms:
> 
>       o shard-bmg: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8119/shard-bmg-2/igt@kms_pm_rpm@legacy-planes-dpms.html>
>         (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1727> / Intel XE#2864 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2864> / Intel XE#3468 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         bmg-6/igt@kms_pm_rpm@legacy-planes-dpms.html> (Intel XE#3468
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>)
>   *
> 
>     igt@kms_pm_rpm@legacy-planes-dpms@plane-59:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8119/shard-bmg-2/igt@kms_pm_rpm@legacy-planes-
>         dpms@plane-59.html> (Intel XE#1727 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel
>         XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3468>) -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-bmg-6/igt@kms_pm_rpm@legacy-planes-
>         dpms@plane-59.html> (Intel XE#3468 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) +2 other
>         tests dmesg-warn
>   *
> 
>     igt@kms_pm_rpm@legacy-planes-dpms@plane-68:
> 
>       o shard-bmg: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8119/shard-bmg-2/igt@kms_pm_rpm@legacy-planes-
>         dpms@plane-68.html> (Intel XE#1727 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel
>         XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3468>) -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-bmg-6/igt@kms_pm_rpm@legacy-planes-
>         dpms@plane-68.html> (Intel XE#1727 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel
>         XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>)
>   *
> 
>     igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
> 
>       o shard-dg2-set2: DMESG-WARN <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGT_8119/shard-dg2-435/igt@kms_pm_rpm@modeset-lpsp-
>         stress-no-wait.html> (Intel XE#3468 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         dg2-434/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html> (Intel
>         XE#2446 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2446>) +1 other test skip
>   *
> 
>     igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-466/igt@kms_pm_rpm@modeset-non-lpsp-stress-
>         no-wait.html> (Intel XE#2446 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2446>) -> DMESG-WARN <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12162/shard-dg2-463/
>         igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html> (Intel
>         XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>)
>   *
> 
>     igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-433/igt@kms_psr2_sf@fbc-pr-overlay-primary-
>         update-sf-dmg-area.html> (Intel XE#1489 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         dg2-434/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-
>         area.html> (Intel XE#2136 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2136>) +7 other tests skip
>   *
> 
>     igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-466/igt@kms_psr2_sf@psr2-overlay-primary-
>         update-sf-dmg-area.html> (Intel XE#2136 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         dg2-463/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-
>         area.html> (Intel XE#1489 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1489>) +6 other tests skip
>   *
> 
>     igt@kms_psr@fbc-pr-suspend:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-434/igt@kms_psr@fbc-pr-suspend.html> (Intel
>         XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2136> / Intel XE#2351 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2351>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12162/shard-dg2-463/
>         igt@kms_psr@fbc-pr-suspend.html> (Intel XE#2850 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2850> / Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>)
>   *
> 
>     igt@kms_psr@fbc-psr2-sprite-plane-move:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-plane-
>         move.html> (Intel XE#2136 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2136>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12162/shard-dg2-463/igt@kms_psr@fbc-psr2-
>         sprite-plane-move.html> (Intel XE#2850 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2850> / Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +7
>         other tests skip
>   *
> 
>     igt@kms_psr@pr-cursor-plane-onoff:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-463/igt@kms_psr@pr-cursor-plane-onoff.html>
>         (Intel XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2850> / Intel XE#929 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/929>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12162/shard-dg2-434/igt@kms_psr@pr-cursor-
>         plane-onoff.html> (Intel XE#2136 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) +9 other
>         tests skip
>   *
> 
>     igt@kms_psr@psr-dpms:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-436/igt@kms_psr@psr-dpms.html> (Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> /
>         Intel XE#929 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/929>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGTPW_12162/shard-dg2-434/igt@kms_psr@psr-dpms.html> (Intel
>         XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2136> / Intel XE#2351 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2351>) +5 other tests skip
>   *
> 
>     igt@kms_psr@psr-sprite-plane-onoff:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-466/igt@kms_psr@psr-sprite-plane-onoff.html>
>         (Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2351>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12162/shard-dg2-463/igt@kms_psr@psr-sprite-plane-
>         onoff.html> (Intel XE#2850 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2850> / Intel XE#929 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/929>)
>   *
> 
>     igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-434/igt@kms_psr_stress_test@invalidate-
>         primary-flip-overlay.html> (Intel XE#2136 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         dg2-433/igt@kms_psr_stress_test@invalidate-primary-flip-
>         overlay.html> (Intel XE#2939 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2939>)
>   *
> 
>     igt@kms_rotation_crc@primary-rotation-90:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-434/igt@kms_rotation_crc@primary-
>         rotation-90.html> (Intel XE#2423 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/
>         shard-dg2-436/igt@kms_rotation_crc@primary-rotation-90.html>
>         (Intel XE#3414 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3414>)
>   *
> 
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-433/igt@kms_rotation_crc@primary-yf-tiled-
>         reflect-x-180.html> (Intel XE#1127 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1127>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-
>         x-180.html> (Intel XE#2423 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2423> / i915#2575 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>   *
> 
>     igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-435/igt@kms_rotation_crc@sprite-rotation-90-
>         pos-100-0.html> (Intel XE#3414 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3414>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12162/shard-dg2-434/
>         igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html> (Intel
>         XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>)
>   *
> 
>     igt@kms_tiled_display@basic-test-pattern:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-466/igt@kms_tiled_display@basic-test-
>         pattern.html> (Intel XE#2423 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2423> / i915#2575 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         dg2-463/igt@kms_tiled_display@basic-test-pattern.html> (Intel
>         XE#362 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/362>)
>   *
> 
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-
>         with-chamelium.html> (Intel XE#2509 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2509>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         bmg-8/igt@kms_tiled_display@basic-test-pattern-with-
>         chamelium.html> (Intel XE#2426 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2426>)
>   *
> 
>     igt@kms_vrr@lobf:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-463/igt@kms_vrr@lobf.html> (Intel XE#2168
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/
>         shard-dg2-466/igt@kms_vrr@lobf.html> (Intel XE#2423 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>   *
> 
>     igt@kms_vrr@negative-basic:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-bmg-6/igt@kms_vrr@negative-basic.html> (Intel
>         XE#1499 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1499>) -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-bmg-8/igt@kms_vrr@negative-
>         basic.html> (Intel XE#3468 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/3468>)
>   *
> 
>     igt@kms_writeback@writeback-fb-id:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-466/igt@kms_writeback@writeback-fb-id.html>
>         (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12162/shard-dg2-463/
>         igt@kms_writeback@writeback-fb-id.html> (Intel XE#756 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/756>)
>   *
> 
>     igt@kms_writeback@writeback-invalid-parameters:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-463/igt@kms_writeback@writeback-invalid-
>         parameters.html> (Intel XE#756 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/756>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12162/shard-dg2-466/
>         igt@kms_writeback@writeback-invalid-parameters.html> (Intel
>         XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>)
>   *
> 
>     igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-433/igt@sriov_basic@enable-vfs-bind-unbind-
>         each-numvfs-all.html> (Intel XE#1091 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1091> / Intel
>         XE#2849 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2849>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12162/shard-dg2-434/igt@sriov_basic@enable-vfs-bind-
>         unbind-each-numvfs-all.html> (Intel XE#2423 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +1 other test skip
>   *
> 
>     igt@xe_ccs@suspend-resume:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-466/igt@xe_ccs@suspend-resume.html> (Intel
>         XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1130>) -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-dg2-435/igt@xe_ccs@suspend-
>         resume.html> (Intel XE#1727 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1727> / Intel XE#3468 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3468>)
>   *
> 
>     igt@xe_compute_preempt@compute-preempt:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-463/igt@xe_compute_preempt@compute-
>         preempt.html> (Intel XE#1280 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1280> / Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         dg2-434/igt@xe_compute_preempt@compute-preempt.html> (Intel
>         XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1130>) +1 other test skip
>   *
> 
>     igt@xe_copy_basic@mem-copy-linear-0x369:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-466/igt@xe_copy_basic@mem-copy-
>         linear-0x369.html> (Intel XE#1130 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         dg2-436/igt@xe_copy_basic@mem-copy-linear-0x369.html> (Intel
>         XE#1123 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1123>) +1 other test skip
>   *
> 
>     igt@xe_copy_basic@mem-set-linear-0x369:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-433/igt@xe_copy_basic@mem-set-
>         linear-0x369.html> (Intel XE#1126 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1126>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         dg2-434/igt@xe_copy_basic@mem-set-linear-0x369.html> (Intel
>         XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>   *
> 
>     igt@xe_eudebug@basic-client-th:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-466/igt@xe_eudebug@basic-client-th.html>
>         (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1130>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12162/shard-dg2-433/igt@xe_eudebug@basic-client-
>         th.html> (Intel XE#2905 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2905>) +7 other tests skip
>   *
> 
>     igt@xe_eudebug_online@basic-breakpoint:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-433/igt@xe_eudebug_online@basic-
>         breakpoint.html> (Intel XE#2905 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2905>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12162/shard-dg2-434/
>         igt@xe_eudebug_online@basic-breakpoint.html> (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) +8
>         other tests skip
>   *
> 
>     igt@xe_evict@evict-beng-large-multi-vm-cm:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-466/igt@xe_evict@evict-beng-large-multi-vm-
>         cm.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/1130>) -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-dg2-436/igt@xe_evict@evict-beng-
>         large-multi-vm-cm.html> (Intel XE#1600 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1600>)
>   *
> 
>     igt@xe_evict@evict-beng-mixed-many-threads-large:
> 
>       o shard-bmg: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8119/shard-bmg-8/igt@xe_evict@evict-beng-mixed-many-
>         threads-large.html> (Intel XE#1473 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1473>) -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         bmg-1/igt@xe_evict@evict-beng-mixed-many-threads-large.html>
>         (Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1473> / Intel XE#3468 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3468>)
>   *
> 
>     igt@xe_exec_balancer@twice-cm-virtual-basic:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-434/igt@xe_exec_balancer@twice-cm-virtual-
>         basic.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1130>) -> DMESG-WARN <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12162/shard-dg2-433/
>         igt@xe_exec_balancer@twice-cm-virtual-basic.html> (Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>)
>   *
> 
>     igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-
>     invalidate:
> 
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-463/igt@xe_exec_compute_mode@many-execqueues-
>         bindexecqueue-userptr-invalidate.html> -> SKIP <https://intel-
>         gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-dg2-434/
>         igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-
>         invalidate.html> (Intel XE#1130 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1130>)
>   *
> 
>     igt@xe_exec_fault_mode@once-basic:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-463/igt@xe_exec_fault_mode@once-basic.html>
>         (Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/288>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGTPW_12162/shard-dg2-466/igt@xe_exec_fault_mode@once-
>         basic.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1130>) +23 other tests skip
>   *
> 
>     igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-466/igt@xe_exec_fault_mode@once-userptr-
>         invalidate-race-imm.html> (Intel XE#1130 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         dg2-436/igt@xe_exec_fault_mode@once-userptr-invalidate-race-
>         imm.html> (Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/288>) +22 other tests skip
>   *
> 
>     igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-463/igt@xe_exec_mix_modes@exec-spinner-
>         interrupted-lr.html> (Intel XE#2360 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2360>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html>
>         (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1130>)
>   *
> 
>     igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-466/igt@xe_fault_injection@inject-fault-
>         probe-function-xe_ggtt_init_early.html> (Intel XE#1130 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         dg2-463/igt@xe_fault_injection@inject-fault-probe-function-
>         xe_ggtt_init_early.html> (Intel XE#3467 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3467>) +1 other test
>         dmesg-warn
>   *
> 
>     igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8119/shard-bmg-1/igt@xe_fault_injection@inject-fault-
>         probe-function-xe_guc_ads_init.html> (Intel XE#3343 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3343> / Intel
>         XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3468>) -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-bmg-8/igt@xe_fault_injection@inject-
>         fault-probe-function-xe_guc_ads_init.html> (Intel XE#3343
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343>)
>   *
> 
>     igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8119/shard-bmg-4/igt@xe_fault_injection@inject-fault-
>         probe-function-xe_guc_ct_init.html> (Intel XE#3343 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3343>) -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         bmg-6/igt@xe_fault_injection@inject-fault-probe-function-
>         xe_guc_ct_init.html> (Intel XE#3343 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3343> / Intel
>         XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3468>) +1 other test dmesg-warn
>   *
> 
>     igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:
> 
>       o shard-dg2-set2: DMESG-WARN <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGT_8119/shard-dg2-436/igt@xe_fault_injection@inject-
>         fault-probe-function-xe_guc_relay_init.html> (Intel XE#3343
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/
>         shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-
>         function-xe_guc_relay_init.html> (Intel XE#1130 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) +1 other test
>         skip
>   *
> 
>     igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-466/igt@xe_fault_injection@inject-fault-
>         probe-function-xe_uc_fw_init.html> (Intel XE#1130 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         dg2-436/igt@xe_fault_injection@inject-fault-probe-function-
>         xe_uc_fw_init.html> (Intel XE#3343 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3343>)
>   *
> 
>     igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init:
> 
>       o shard-dg2-set2: DMESG-WARN <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGT_8119/shard-dg2-435/igt@xe_fault_injection@inject-
>         fault-probe-function-xe_wa_init.html> (Intel XE#3467 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3467>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         dg2-466/igt@xe_fault_injection@inject-fault-probe-function-
>         xe_wa_init.html> (Intel XE#1130 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1130>) +3 other tests skip
>   *
> 
>     igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:
> 
>       o shard-bmg: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8119/shard-bmg-8/igt@xe_fault_injection@vm-bind-fail-
>         xe_pt_update_ops_prepare.html> (Intel XE#3467 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3467>) -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         bmg-1/igt@xe_fault_injection@vm-bind-fail-
>         xe_pt_update_ops_prepare.html> (Intel XE#3467 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3467> / Intel
>         XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>)
>   *
> 
>     igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run:
> 
>       o shard-bmg: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8119/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-
>         xe_pt_update_ops_run.html> (Intel XE#3468 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         bmg-1/igt@xe_fault_injection@vm-bind-fail-
>         xe_pt_update_ops_run.html> (Intel XE#3467 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3467> / Intel
>         XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>)
>   *
> 
>     igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-
>         xe_vma_ops_alloc.html> -> DMESG-FAIL <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12162/shard-bmg-8/
>         igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html>
>         (Intel XE#3467 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3467>)
>   *
> 
>     igt@xe_mmap@small-bar:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-466/igt@xe_mmap@small-bar.html> (Intel
>         XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1130>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12162/shard-dg2-435/igt@xe_mmap@small-bar.html> (Intel
>         XE#512 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/512>)
>   *
> 
>     igt@xe_module_load@reload:
> 
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-434/igt@xe_module_load@reload.html> (Intel
>         XE#3546 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3546>) -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-dg2-433/
>         igt@xe_module_load@reload.html> (Intel XE#3467 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3467>) +1 other test
>         dmesg-warn
>   *
> 
>     igt@xe_oa@invalid-oa-format-id:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-463/igt@xe_oa@invalid-oa-format-id.html>
>         (Intel XE#2541 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2541>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12162/shard-dg2-466/igt@xe_oa@invalid-oa-format-
>         id.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/1130>) +7 other tests skip
>   *
> 
>     igt@xe_oa@invalid-remove-userspace-config:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-434/igt@xe_oa@invalid-remove-userspace-
>         config.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1130>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12162/shard-dg2-436/igt@xe_oa@invalid-
>         remove-userspace-config.html> (Intel XE#2541 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2541>) +6 other
>         tests skip
>   *
> 
>     igt@xe_pat@display-vs-wb-transient:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-433/igt@xe_pat@display-vs-wb-transient.html>
>         (Intel XE#1337 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1337>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12162/shard-dg2-434/igt@xe_pat@display-vs-wb-
>         transient.html> (Intel XE#1130 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1130>)
>   *
> 
>     igt@xe_peer2peer@read:
> 
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-463/igt@xe_peer2peer@read.html> (Intel
>         XE#1173 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1173>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12162/shard-dg2-466/igt@xe_peer2peer@read.html> (Intel
>         XE#1061 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061>)
>   *
> 
>     igt@xe_pm@d3cold-mmap-vram:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-436/igt@xe_pm@d3cold-mmap-vram.html> (Intel
>         XE#2284 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2284> / Intel XE#366 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/366>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12162/shard-dg2-466/igt@xe_pm@d3cold-mmap-
>         vram.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1130>)
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-bmg-1/igt@xe_pm@d3cold-mmap-vram.html> (Intel
>         XE#2284 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2284>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12162/shard-bmg-2/igt@xe_pm@d3cold-mmap-vram.html>
>         (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1130>)
>   *
> 
>     igt@xe_pm@d3cold-multiple-execs:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-466/igt@xe_pm@d3cold-multiple-execs.html>
>         (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1130>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12162/shard-dg2-463/igt@xe_pm@d3cold-multiple-
>         execs.html> (Intel XE#2284 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2284> / Intel XE#366 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/366>)
>   *
> 
>     igt@xe_pm@d3hot-multiple-execs:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-434/igt@xe_pm@d3hot-multiple-execs.html>
>         (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1130>) -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-dg2-433/igt@xe_pm@d3hot-multiple-
>         execs.html> (Intel XE#3468 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/3468>)
>   *
> 
>     igt@xe_pm@s2idle-basic-exec:
> 
>       o shard-dg2-set2: DMESG-WARN <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGT_8119/shard-dg2-435/igt@xe_pm@s2idle-basic-
>         exec.html> (Intel XE#1727 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1727> / Intel XE#3468 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         dg2-466/igt@xe_pm@s2idle-basic-exec.html> (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>   *
> 
>     igt@xe_pm@s4-vm-bind-unbind-all:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-466/igt@xe_pm@s4-vm-bind-unbind-all.html>
>         (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1130>) -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12162/shard-dg2-433/igt@xe_pm@s4-vm-bind-unbind-
>         all.html> (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/1727> / Intel XE#2280 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2280> / Intel
>         XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>)
>   *
> 
>     igt@xe_pm@vram-d3cold-threshold:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-434/igt@xe_pm@vram-d3cold-threshold.html>
>         (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1130>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12162/shard-dg2-463/igt@xe_pm@vram-d3cold-
>         threshold.html> (Intel XE#579 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/579>)
>   *
> 
>     igt@xe_query@multigpu-query-uc-fw-version-guc:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-463/igt@xe_query@multigpu-query-uc-fw-
>         version-guc.html> (Intel XE#944 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/944>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12162/shard-dg2-434/igt@xe_query@multigpu-
>         query-uc-fw-version-guc.html> (Intel XE#1130 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) +1 other test
>         skip
>   *
> 
>     igt@xe_query@multigpu-query-uc-fw-version-huc:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-434/igt@xe_query@multigpu-query-uc-fw-
>         version-huc.html> (Intel XE#1130 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/shard-
>         dg2-463/igt@xe_query@multigpu-query-uc-fw-version-huc.html>
>         (Intel XE#944 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/944>) +2 other tests skip
>   *
> 
>     igt@xe_tlb@basic-tlb:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-434/igt@xe_tlb@basic-tlb.html> (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) ->
>         FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12162/
>         shard-dg2-435/igt@xe_tlb@basic-tlb.html> (Intel XE#2922
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2922>)
>   *
> 
>     igt@xe_wedged@basic-wedged:
> 
>       o shard-dg2-set2: DMESG-WARN <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGT_8119/shard-dg2-463/igt@xe_wedged@basic-wedged.html>
>         (Intel XE#2919 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2919>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12162/shard-dg2-466/igt@xe_wedged@basic-wedged.html>
>         (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1130>)
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8119/shard-bmg-4/igt@xe_wedged@basic-wedged.html> (Intel
>         XE#2919 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2919>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12162/shard-bmg-2/igt@xe_wedged@basic-wedged.html>
>         (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1130>)
>   *
> 
>     igt@xe_wedged@wedged-mode-toggle:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8119/shard-dg2-434/igt@xe_wedged@wedged-mode-toggle.html>
>         (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1130>) -> ABORT <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12162/shard-dg2-463/igt@xe_wedged@wedged-mode-
>         toggle.html> (Intel XE#3075 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/3075> / Intel XE#3084 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3084>)
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * IGT: IGT_8119 -> IGTPW_12162
> 
> IGTPW_12162: 12162
> IGT_8119: 8119
> xe-2257-e46649e7764a9f6868ccbcba7b8b23b413303380: 
> e46649e7764a9f6868ccbcba7b8b23b413303380
> 

