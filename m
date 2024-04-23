Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 427E9C4345F
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 06:12:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB5D410E70B;
	Tue, 23 Apr 2024 06:12:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MNPShdle";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C0FD10E70B
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 06:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713852758; x=1745388758;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=mhVg4XQM/7KWSH51fWCsu3gGWC75Ax2Ff3XYwVfLN7M=;
 b=MNPShdleARBwqhyUviqOoWTVRLeh/CaRCAxtGjwQhxbFYuIJKU9Hj5mj
 nxRRuUgiq+/Lqy859xM6/2D3mCaeCbT2xLJQsA49uW4iLt39WlcTrppsJ
 i7FSnknZ4VdbDrAXqvQ+wrFggaS7zbL6mQY6RE/MBx6ZsBORgdbg4jMHW
 yczVIzY36zfczjuwO6Hx0TuD/VODRw6UoQIbXIyhAlq0QgD6ZkyBotqqV
 483r240+obE2EcKFDOmXWpy9NeInU0+Ttm0IbStnFt+GMz+TwbxmETUsF
 ZI3H1zU5Q9Aba6ZaRn0zXrxf9XfCj1eVnPEL2kktNy5dIq8eC6lE8n385 g==;
X-CSE-ConnectionGUID: uQlDqAXUSdSlGKen6JwHeA==
X-CSE-MsgGUID: xgKI6N3QRva5fIUxlwEYdw==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="13203900"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="13203900"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 23:12:38 -0700
X-CSE-ConnectionGUID: S09DHjB4QJGGoHnFDRGLXw==
X-CSE-MsgGUID: +q4wg6cJRuq/Wl1GHFkVGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="24276513"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.22])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 23:12:37 -0700
Date: Tue, 23 Apr 2024 08:12:34 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_CI=2ExeFULL=3A_failure_for_tests=2Fxe=5Fe?=
 =?utf-8?Q?vict|exec=5Fthreads?= =?utf-8?Q?=3A?= Use fd reopen to avoid
 corrupting global data (rev3)
Message-ID: <20240423061234.awqo4rsazniw666n@zkempczy-mobl2>
References: <20240422144713.76025-1-zbigniew.kempczynski@intel.com>
 <171383116237.1571015.9083230809059639295@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <171383116237.1571015.9083230809059639295@8e613ede5ea5>
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

On Tue, Apr 23, 2024 at 12:12:42AM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  tests/xe_evict|exec_threads: Use fd reopen to avoid corrupting      
>             global data (rev3)                                                  
>    URL:     https://patchwork.freedesktop.org/series/132562/                    
>    State:   failure                                                             
>    Details: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132562v3/index.html 
> 
>         CI Bug Log - changes from XEIGT_7815_full -> XEIGTPW_11050_full
> 
> Summary
> 
>    WARNING
> 
>    Minor unknown changes coming with XEIGTPW_11050_full need to be verified
>    manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in XEIGTPW_11050_full, please notify your bug team
>    (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
> Participating hosts (2 -> 1)
> 
>    Missing (1): shard-adlp
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    XEIGTPW_11050_full:
> 
>   IGT changes
> 
>     Warnings
> 
>      * igt@kms_tiled_display@basic-test-pattern:
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#362) -> FAIL

Unrelated to the change. I'm touching other two tests only.

--
Zbigniew

> 
>     Suppressed
> 
>    The following results come from untrusted machines, tests, or statuses.
>    They do not affect the overall result.
> 
>      * {igt@xe_pm@s4-vm-bind-prefetch}:
>           * shard-dg2-set2: FAIL (Intel XE#1043) -> DMESG-FAIL
> 
> Known issues
> 
>    Here are the changes found in XEIGTPW_11050_full that come from known
>    issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@kms_addfb_basic@bad-pitch-32:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1201 / i915#6077)
>      * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1201 / Intel XE#455) +4
>             other tests skip
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
> 
>           * shard-dg2-set2: PASS -> SKIP (Intel XE#1201 / Intel XE#829) +2
>             other tests skip
>      * igt@kms_big_fb@linear-16bpp-rotate-270:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1201 / Intel XE#316)
>      * igt@kms_big_fb@x-tiled-addfb-size-overflow:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1201 / Intel XE#829)
>      * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1124 / Intel XE#1201) +2
>             other tests skip
>      * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1201 / Intel XE#367)
>      * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-7:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1201 / Intel XE#787) +79
>             other tests skip
>      * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-dp-4:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1201 / Intel XE#455 /
>             Intel XE#787) +23 other tests skip
>      * igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-7:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1201) +3 other tests
>             skip
>      * igt@kms_chamelium_color@ctm-0-50:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1201 / Intel XE#306)
>      * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1201 / Intel XE#373) +1
>             other test skip
>      * igt@kms_content_protection@dp-mst-type-1:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1201 / Intel XE#307)
>      * igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-d-hdmi-a-6:
> 
>           * shard-dg2-set2: PASS -> DMESG-WARN (Intel XE#1214 / Intel XE#282)
>             +8 other tests dmesg-warn
>      * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
> 
>           * shard-dg2-set2: PASS -> SKIP (Intel XE#1201) +13 other tests skip
>      * igt@kms_cursor_legacy@cursor-vs-flip-varying-size:
> 
>           * shard-dg2-set2: NOTRUN -> DMESG-WARN (Intel XE#1214 / Intel
>             XE#282) +3 other tests dmesg-warn
>      * igt@kms_feature_discovery@psr2:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1135 / Intel XE#1201)
>      * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1201 / Intel XE#651) +7
>             other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1201 / Intel XE#653) +6
>             other tests skip
>      * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
> 
>           * shard-dg2-set2: NOTRUN -> FAIL (Intel XE#616) +7 other tests fail
>      * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1201 / Intel XE#498) +2
>             other tests skip
>      * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-6:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1201 / Intel XE#455 /
>             Intel XE#498)
>      * igt@kms_pm_rpm@basic-rte:
> 
>           * shard-dg2-set2: PASS -> FAIL (Intel XE#1203)
>      * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
> 
>           * shard-dg2-set2: PASS -> SKIP (Intel XE#1201 / Intel XE#1211)
>      * igt@kms_psr@psr2-sprite-blt:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1201 / Intel XE#929) +5
>             other tests skip
>      * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1127 / Intel XE#1201)
>      * igt@kms_universal_plane@cursor-fb-leak:
> 
>           * shard-dg2-set2: PASS -> FAIL (Intel XE#771 / Intel XE#899)
>      * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:
> 
>           * shard-dg2-set2: PASS -> FAIL (Intel XE#899)
>      * igt@kms_vblank@ts-continuation-dpms-suspend:
> 
>           * shard-dg2-set2: PASS -> DMESG-WARN (Intel XE#1162 / Intel
>             XE#1214) +1 other test dmesg-warn
>      * igt@kms_writeback@writeback-fb-id-xrgb2101010:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1201 / Intel XE#756)
>      * igt@xe_create@multigpu-create-massive-size:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1201 / Intel XE#944) +1
>             other test skip
>      * igt@xe_evict@evict-beng-large-multi-vm-cm:
> 
>           * shard-dg2-set2: PASS -> DMESG-FAIL (Intel XE#821)
>      * igt@xe_evict@evict-beng-threads-large:
> 
>           * shard-dg2-set2: PASS -> TIMEOUT (Intel XE#1473)
>      * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-race:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1201 / Intel XE#288) +3
>             other tests skip
>      * igt@xe_huc_copy@huc_copy:
> 
>           * shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1201 / Intel XE#255)
>      * igt@xe_live_ktest@xe_migrate:
> 
>           * shard-dg2-set2: PASS -> SKIP (Intel XE#1192 / Intel XE#1201)
>      * igt@xe_module_load@reload:
> 
>           * shard-dg2-set2: PASS -> ABORT (Intel XE#1205 / Intel XE#1216)
>      * igt@xe_module_load@reload-no-display:
> 
>           * shard-dg2-set2: PASS -> DMESG-WARN (Intel XE#1214) +1 other test
>             dmesg-warn
>      * igt@xe_pm@d3hot-basic:
> 
>           * shard-dg2-set2: PASS -> FAIL (Intel XE#355)
>      * igt@xe_pm@s4-multiple-execs:
> 
>           * shard-dg2-set2: NOTRUN -> FAIL (Intel XE#1043 / Intel XE#845)
> 
>     Possible fixes
> 
>      * igt@kms_big_fb@x-tiled-16bpp-rotate-0:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#829) -> PASS +2
>             other tests pass
>      * igt@kms_cursor_legacy@single-bo@all-pipes:
> 
>           * shard-dg2-set2: DMESG-WARN (Intel XE#1214 / Intel XE#282) -> PASS
>             +9 other tests pass
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
> 
>           * shard-dg2-set2: DMESG-WARN (Intel XE#1214) -> PASS +1 other test
>             pass
>      * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#1226) -> PASS +9
>             other tests pass
>      * igt@kms_pm_rpm@dpms-lpsp:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#1211) -> PASS +1
>             other test pass
>      * igt@kms_vrr@negative-basic:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#455) -> PASS
>      * igt@xe_evict@evict-beng-mixed-many-threads-small:
> 
>           * shard-dg2-set2: TIMEOUT (Intel XE#1473 / Intel XE#402) -> PASS
>      * igt@xe_evict@evict-mixed-threads-large:
> 
>           * shard-dg2-set2: INCOMPLETE (Intel XE#1195 / Intel XE#1473 / Intel
>             XE#392) -> PASS
>      * igt@xe_exec_compute_mode@once-bindexecqueue-userptr:
> 
>           * shard-dg2-set2: ABORT (Intel XE#1304 / Intel XE#1364) -> PASS
>      * igt@xe_exec_threads@threads-fd-userptr-rebind:
> 
>           * shard-dg2-set2: TIMEOUT (Intel XE#1206 / Intel XE#1261 / Intel
>             XE#1356) -> PASS
>      * {igt@xe_pm@s2idle-vm-bind-userptr}:
> 
>           * shard-dg2-set2: INCOMPLETE (Intel XE#1195 / Intel XE#1694) ->
>             PASS
> 
>     Warnings
> 
>      * igt@kms_big_fb@linear-64bpp-rotate-270:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#316) -> SKIP
>             (Intel XE#1201 / Intel XE#829)
>      * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#829) -> SKIP
>             (Intel XE#1124 / Intel XE#1201) +1 other test skip
>      * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1124 / Intel XE#1201) -> SKIP
>             (Intel XE#1201 / Intel XE#829) +2 other tests skip
>      * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#367) -> SKIP
>             (Intel XE#1201)
>      * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#829) -> SKIP
>             (Intel XE#1201 / Intel XE#455 / Intel XE#787)
>      * igt@kms_ccs@crc-primary-basic-y-tiled-ccs:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#455 / Intel
>             XE#787) -> SKIP (Intel XE#1201 / Intel XE#829) +3 other tests
>             skip
>      * igt@kms_chamelium_frames@hdmi-crc-fast:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#373) -> SKIP
>             (Intel XE#1201)
>      * igt@kms_chamelium_hpd@vga-hpd-without-ddc:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#1226) -> SKIP
>             (Intel XE#1201 / Intel XE#373)
>      * igt@kms_content_protection@atomic:
> 
>           * shard-dg2-set2: FAIL (Intel XE#1178) -> SKIP (Intel XE#1201 /
>             Intel XE#455)
>      * igt@kms_content_protection@uevent:
> 
>           * shard-dg2-set2: FAIL (Intel XE#1188) -> SKIP (Intel XE#1201 /
>             Intel XE#1234)
>      * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#455) -> SKIP
>             (Intel XE#1201)
>      * igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size:
> 
>           * shard-dg2-set2: DMESG-WARN (Intel XE#1214 / Intel XE#282) -> SKIP
>             (Intel XE#1201)
>      * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#1226) -> SKIP
>             (Intel XE#1201)
>      * igt@kms_feature_discovery@dp-mst:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1137 / Intel XE#1201) -> SKIP
>             (Intel XE#1201)
>      * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-plflip-blt:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#1226 / Intel
>             XE#1235) -> SKIP (Intel XE#1201 / Intel XE#651)
>      * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#651) -> SKIP
>             (Intel XE#1201) +4 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#1226) -> SKIP
>             (Intel XE#1201 / Intel XE#651) +1 other test skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#1226 / Intel
>             XE#1235) -> SKIP (Intel XE#1201 / Intel XE#653)
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#653) -> SKIP
>             (Intel XE#1201 / Intel XE#1234)
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#653) -> SKIP
>             (Intel XE#1201) +5 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#1226) -> SKIP
>             (Intel XE#1201 / Intel XE#653) +3 other tests skip
>      * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
> 
>           * shard-dg2-set2: FAIL (Intel XE#616) -> DMESG-FAIL (Intel XE#1162)
>             +1 other test dmesg-fail
>      * igt@kms_plane_cursor@primary:
> 
>           * shard-dg2-set2: FAIL (Intel XE#581) -> FAIL (Intel XE#616)
>      * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#1226) -> SKIP
>             (Intel XE#1201 / Intel XE#455 / Intel XE#498)
>      * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:
> 
>           * shard-dg2-set2: INCOMPLETE (Intel XE#1195 / Intel XE#904 / Intel
>             XE#909) -> TIMEOUT (Intel XE#380 / Intel XE#904 / Intel XE#909)
>             +1 other test timeout
>      * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6:
> 
>           * shard-dg2-set2: INCOMPLETE (Intel XE#1195 / Intel XE#904 / Intel
>             XE#909) -> TIMEOUT (Intel XE#904 / Intel XE#909) +1 other test
>             timeout
>      * igt@kms_pm_dc@dc5-psr:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1129 / Intel XE#1201) -> SKIP
>             (Intel XE#1201)
>      * igt@kms_psr@fbc-pr-cursor-render:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#1226 / Intel
>             XE#1234) -> SKIP (Intel XE#1201 / Intel XE#929)
>      * igt@kms_psr@fbc-pr-sprite-plane-onoff:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#929) -> SKIP
>             (Intel XE#1201) +3 other tests skip
>      * igt@kms_psr@fbc-psr2-primary-blt:
> 
>           * shard-dg2-set2: SKIP (Intel XE#1201 / Intel XE#1226) -> SKIP
>             (Intel XE#1201 / Intel XE#929) +1 other test skip
>      * igt@xe_evict@evict-beng-cm-threads-large:
> 
>           * shard-dg2-set2: FAIL (Intel XE#1259) -> INCOMPLETE (Intel XE#1195
>             / Intel XE#1473 / Intel XE#392)
>      * igt@xe_evict@evict-mixed-many-threads-large:
> 
>           * shard-dg2-set2: INCOMPLETE (Intel XE#1195 / Intel XE#1473 / Intel
>             XE#392) -> TIMEOUT (Intel XE#1041 / Intel XE#1473 / Intel XE#392)
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Build changes
> 
>      * IGT: IGT_7815 -> IGTPW_11050
>      * Linux: xe-1137-ff2f70f345aaee3cbcf93a3a06ff3a5ab88e1d7a ->
>        xe-1143-a53d157b0bd321e30804e935e010d77fc575b033
> 
>    IGTPW_11050: b178ef16da1a8b3b1216e98b39687e8c0e4ea997 @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    IGT_7815: d5d516bfdf77898e934b4c7ed947a43711cfb226 @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    xe-1137-ff2f70f345aaee3cbcf93a3a06ff3a5ab88e1d7a:
>    ff2f70f345aaee3cbcf93a3a06ff3a5ab88e1d7a
>    xe-1143-a53d157b0bd321e30804e935e010d77fc575b033:
>    a53d157b0bd321e30804e935e010d77fc575b033
