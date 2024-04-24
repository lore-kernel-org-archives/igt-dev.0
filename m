Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64EEBC4345F
	for <igt-dev@archiver.kernel.org>; Wed, 24 Apr 2024 06:09:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0326C10F3C8;
	Wed, 24 Apr 2024 06:09:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BWSY0mXV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30E0910FD88
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Apr 2024 06:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713938953; x=1745474953;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=wU0JGCbzPv6bvw10MdhsyQutm7taPRxH/dB5bTSXHLI=;
 b=BWSY0mXV0N30XRroWX0Zt+nWZxE7dMAeeWXhgMkzEHroTM1lcVPeYcsv
 Bk54sPkM+Dmi/PNEgHaAny8mFU2S5nvCYbYOT8gcGoWO7q+LFSFHIOH/p
 Wn7O+KHNRn3jHshsay/Qt0dVcr3SYdZG/3yD4d96bKVgeI6uyF5kCq1Nu
 S77VCLZqk58quZxETp20P3rK6i+n3+fwCCpL75KAEWguQU1X95ktqLCZV
 YP9wROy31EkJPrtc18Toutjr/yJQaZBZgybYEYJWMnqB/o1J6q6Ql32il
 KdP7iPfPIcAIRZCogoTjAQAC3jFUq0JdQIN1AWz9ubVlUC8FO+PkBSy/s g==;
X-CSE-ConnectionGUID: Ye3U1ghYTXmTXugsO7/EFg==
X-CSE-MsgGUID: PP1Ya9+TTHC5kezCdrmdfg==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="27065829"
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; d="scan'208";a="27065829"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 23:09:00 -0700
X-CSE-ConnectionGUID: 1qJG9x3oQoKH/fflydXtxw==
X-CSE-MsgGUID: TgIHwZZNQ8+qs2zUZr8m1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; d="scan'208";a="24667170"
Received: from rbenbass-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.36])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 23:08:59 -0700
Date: Wed, 24 Apr 2024 08:08:56 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIENJLnhlRlVMTA==?= =?utf-8?Q?=3A?= failure for Use
 xe2 render-copy on newer hardware
Message-ID: <20240424060856.njyj6r5q5nus7yy4@zkempczy-mobl2>
References: <20240423070449.150518-1-zbigniew.kempczynski@intel.com>
 <171388563470.1608578.14215744779942776964@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <171388563470.1608578.14215744779942776964@8e613ede5ea5>
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

On Tue, Apr 23, 2024 at 03:20:34PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Use xe2 render-copy on newer hardware                               
>    URL:     https://patchwork.freedesktop.org/series/132752/                    
>    State:   failure                                                             
>    Details: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132752v1/index.html 
> 
>         CI Bug Log - changes from XEIGT_7816_full -> XEIGTPW_11054_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with XEIGTPW_11054_full absolutely need to
>    be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in XEIGTPW_11054_full, please notify your bug team
>    (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
> Participating hosts (3 -> 1)
> 
>    ERROR: It appears as if the changes made in XEIGTPW_11054_full prevented
>    too many machines from booting.
> 
>    Missing (2): shard-adlp shard-lnl

I've checked the results on the page:

https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11054/shards-all.html?testfilter=render

and I see no regression regarding Xe2+ render-copy. I'm going to merge
the patch.

--
Zbigniew

> 
> Known issues
> 
>    Here are the changes found in XEIGTPW_11054_full that come from known
>    issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@kms_addfb_basic@bad-pitch-1024:
> 
>           * shard-dg2-set2: PASS -> SKIP (Intel XE#1201 / i915#6077)
>      * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-4-4-rc-ccs:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1201 / Intel XE#801) +7
>             other tests skip
>      * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-4-4-mc-ccs:
> 
>           * shard-dg2-set2: NOTRUN -> FAIL (Intel XE#650) +3 other tests fail
>      * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-dp-4:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1201 / Intel XE#787) +51
>             other tests skip
>      * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-7:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1201 / Intel XE#455 /
>             Intel XE#787) +15 other tests skip
>      * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1152 / Intel XE#1201) +3
>             other tests skip
>      * igt@kms_content_protection@srm@pipe-a-dp-4:
> 
>           * shard-dg2-set2: NOTRUN -> FAIL (Intel XE#1178)
>      * igt@kms_cursor_crc@cursor-offscreen-64x64:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1201)
>      * igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-a-hdmi-a-6:
> 
>           * shard-dg2-set2: NOTRUN -> DMESG-WARN (Intel XE#1214 / Intel
>             XE#282) +2 other tests dmesg-warn
>      * igt@kms_cursor_edge_walk@64x64-top-bottom:
> 
>           * shard-dg2-set2: PASS -> FAIL (Intel XE#581)
>      * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
> 
>           * shard-dg2-set2: PASS -> DMESG-WARN (Intel XE#1214 / Intel XE#282)
>             +6 other tests dmesg-warn
>      * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
> 
>           * shard-dg2-set2: PASS -> DMESG-WARN (Intel XE#1214) +1 other test
>             dmesg-warn
>      * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4:
> 
>           * shard-dg2-set2: NOTRUN -> DMESG-WARN (Intel XE#1214)
>      * igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1201 / Intel XE#651)
>      * igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64:
> 
>           * shard-dg2-set2: NOTRUN -> FAIL (Intel XE#616)
>      * igt@kms_plane_scaling@planes-upscale-factor-0-25:
> 
>           * shard-dg2-set2: PASS -> SKIP (Intel XE#1201) +16 other tests skip
>      * igt@kms_pm_rpm@basic-rte:
> 
>           * shard-dg2-set2: PASS -> FAIL (Intel XE#1203)
>      * igt@kms_pm_rpm@modeset-non-lpsp:
> 
>           * shard-dg2-set2: PASS -> SKIP (Intel XE#1201 / Intel XE#1211)
>      * igt@kms_rotation_crc@sprite-rotation-180:
> 
>           * shard-dg2-set2: PASS -> SKIP (Intel XE#1201 / Intel XE#829) +4
>             other tests skip
>      * igt@xe_evict@evict-threads-large:
> 
>           * shard-dg2-set2: PASS -> INCOMPLETE (Intel XE#1195 / Intel XE#1473
>             / Intel XE#392) +1 other test incomplete
>      * igt@xe_exec_fault_mode@many-invalid-userptr-fault:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1201 / Intel XE#288)
>      * igt@xe_exec_threads@threads-hang-userptr-rebind-err:
> 
>           * shard-dg2-set2: PASS -> FAIL (Intel XE#1256)
>      * igt@xe_gt_freq@freq_low_max:
> 
>           * shard-dg2-set2: PASS -> FAIL (Intel XE#1045 / Intel XE#1204)
> 
>     Possible fixes
> 
>      * igt@kms_addfb_basic@invalid-set-prop-any:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / i915#6077) -> PASS +1 other
>             test pass
>      * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-4:
> 
>           * shard-dg2-set2: FAIL (Intel XE#827) -> PASS +3 other tests pass
>      * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#829) -> PASS +1
>             other test pass
>      * igt@kms_cursor_edge_walk@256x256-right-edge@pipe-d-hdmi-a-6:
> 
>           * shard-dg2-set2: DMESG-WARN (Intel XE#1214 / Intel XE#282) -> PASS
>             +3 other tests pass
>      * igt@kms_cursor_legacy@torture-bo@pipe-a:
> 
>           * shard-dg2-set2: DMESG-WARN (Intel XE#1214 / Intel XE#877) -> PASS
>             +1 other test pass
>      * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#455) -> PASS
>      * igt@kms_fbcon_fbt@fbc-suspend:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201) -> PASS
>      * igt@kms_flip@flip-vs-suspend-interruptible:
> 
>           * shard-dg2-set2: DMESG-WARN (Intel XE#1162 / Intel XE#1214) ->
>             PASS
>      * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6:
> 
>           * shard-dg2-set2: DMESG-WARN (Intel XE#1214) -> PASS +1 other test
>             pass
>      * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#1226) -> PASS +7
>             other tests pass
>      * igt@kms_getfb@getfb2-handle-not-fb:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#687) -> PASS
>      * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
> 
>           * shard-dg2-set2: FAIL (Intel XE#616) -> PASS +1 other test pass
>      * igt@kms_pm_rpm@dpms-lpsp:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#1211) -> PASS
>      * igt@xe_evict@evict-beng-mixed-threads-large:
> 
>           * shard-dg2-set2: TIMEOUT (Intel XE#1473 / Intel XE#392 / Intel
>             XE#931) -> PASS
>      * igt@xe_evict@evict-cm-threads-large-multi-vm:
> 
>           * shard-dg2-set2: INCOMPLETE (Intel XE#1195 / Intel XE#1473) ->
>             PASS
>      * igt@xe_pm@d3-mmap-system:
> 
>           * shard-dg2-set2: FAIL (Intel XE#1221) -> PASS
> 
>     Warnings
> 
>      * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#829) -> SKIP
>             (Intel XE#1124 / Intel XE#1201) +2 other tests skip
>      * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1124 / Intel XE#1201) -> SKIP
>             (Intel XE#1201 / Intel XE#829)
>      * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#367) -> SKIP
>             (Intel XE#1201)
>      * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#455 / Intel
>             XE#787) -> SKIP (Intel XE#1201 / Intel XE#829) +2 other tests
>             skip
>      * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs:
> 
>           * shard-dg2-set2: FAIL (Intel XE#650) -> SKIP (Intel XE#1201 /
>             Intel XE#829) +1 other test skip
>      * igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#829) -> SKIP
>             (Intel XE#1201 / Intel XE#1252)
>      * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#829) -> SKIP
>             (Intel XE#1201 / Intel XE#455 / Intel XE#787)
>      * igt@kms_chamelium_audio@hdmi-audio:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#373) -> SKIP
>             (Intel XE#1201) +3 other tests skip
>      * igt@kms_content_protection@atomic:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#1226) -> SKIP
>             (Intel XE#1201 / Intel XE#455)
>      * igt@kms_content_protection@lic-type-0:
> 
>           * shard-dg2-set2: FAIL (Intel XE#1204) -> SKIP (Intel XE#1201 /
>             Intel XE#455)
>      * igt@kms_content_protection@mei-interface:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#455) -> SKIP
>             (Intel XE#1201) +2 other tests skip
>      * igt@kms_content_protection@srm:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#455) -> FAIL
>             (Intel XE#1178)
>      * igt@kms_cursor_crc@cursor-random-256x256:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#1226) ->
>             DMESG-WARN (Intel XE#1214 / Intel XE#282) +1 other test
>             dmesg-warn
>      * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#455) -> SKIP
>             (Intel XE#1201 / Intel XE#1234)
>      * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
> 
>           * shard-dg2-set2: DMESG-WARN (Intel XE#1214 / Intel XE#282 / Intel
>             XE#910) -> DMESG-WARN (Intel XE#1214 / Intel XE#282)
>      * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
> 
>           * shard-dg2-set2: DMESG-WARN (Intel XE#1214 / Intel XE#282) ->
>             DMESG-WARN (Intel XE#1214 / Intel XE#282 / Intel XE#910)
>      * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
> 
>           * shard-dg2-set2: DMESG-WARN (Intel XE#1214 / Intel XE#282) -> SKIP
>             (Intel XE#1201)
>      * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#455 / i915#3804)
>             -> SKIP (Intel XE#1201 / i915#3804)
>      * igt@kms_flip@2x-flip-vs-suspend-interruptible:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#1226) ->
>             DMESG-WARN (Intel XE#1214)
>      * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#651) -> SKIP
>             (Intel XE#1201) +4 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#1226) -> SKIP
>             (Intel XE#1201 / Intel XE#651) +3 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#653) -> SKIP
>             (Intel XE#1201) +4 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#1226) -> SKIP
>             (Intel XE#1201 / Intel XE#653) +4 other tests skip
>      * igt@kms_plane_cursor@viewport:
> 
>           * shard-dg2-set2: FAIL (Intel XE#581) -> FAIL (Intel XE#616)
>      * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format:
> 
>           * shard-dg2-set2: TIMEOUT (Intel XE#380 / Intel XE#904 / Intel
>             XE#909) -> INCOMPLETE (Intel XE#1195 / Intel XE#904 / Intel
>             XE#909)
>      * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a-hdmi-a-6:
> 
>           * shard-dg2-set2: TIMEOUT (Intel XE#904 / Intel XE#909) ->
>             INCOMPLETE (Intel XE#1195 / Intel XE#904 / Intel XE#909) +1 other
>             test incomplete
>      * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:
> 
>           * shard-dg2-set2: TIMEOUT (Intel XE#295 / Intel XE#380 / Intel
>             XE#909) -> INCOMPLETE (Intel XE#1195 / Intel XE#909)
>      * igt@kms_pm_dc@dc3co-vpb-simulation:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#1226) -> SKIP
>             (Intel XE#1122 / Intel XE#1201)
>      * igt@kms_pm_rpm@legacy-planes:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#1226) -> SKIP
>             (Intel XE#1201 / Intel XE#1211)
>      * igt@kms_psr@fbc-psr2-primary-blt:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#929) -> SKIP
>             (Intel XE#1201) +4 other tests skip
>      * igt@kms_psr@psr2-dpms:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#1226) -> SKIP
>             (Intel XE#1201 / Intel XE#929) +1 other test skip
>      * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1127 / Intel XE#1201) -> SKIP
>             (Intel XE#1201 / Intel XE#829)
>      * igt@kms_writeback@writeback-pixel-formats:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#756) -> SKIP
>             (Intel XE#1201)
>      * igt@xe_evict@evict-beng-large-multi-vm-cm:
> 
>           * shard-dg2-set2: FAIL (Intel XE#1041) -> DMESG-FAIL (Intel XE#821)
>      * igt@xe_evict@evict-beng-mixed-many-threads-large:
> 
>           * shard-dg2-set2: TIMEOUT (Intel XE#1041 / Intel XE#1473 / Intel
>             XE#392) -> INCOMPLETE (Intel XE#1195 / Intel XE#1473 / Intel
>             XE#392)
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Build changes
> 
>      * IGT: IGT_7816 -> IGTPW_11054
>      * Linux: xe-1158-b2461ae195a8859f0627817898b0311a7b697c72 ->
>        xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf
> 
>    IGTPW_11054: fffff5774ca9e3bdbed475d30338eaff2b40d802 @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    IGT_7816: 2e8f3e06fbd7335cf65a93115c72f0e167a570a2 @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    xe-1158-b2461ae195a8859f0627817898b0311a7b697c72:
>    b2461ae195a8859f0627817898b0311a7b697c72
>    xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf:
>    861eed75446fe9dbac9d28d11f44caa47cebeebf
