Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC59C25B10
	for <igt-dev@archiver.kernel.org>; Mon, 13 May 2024 14:23:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC46210E7E7;
	Mon, 13 May 2024 14:23:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mzlWZNMt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46BB010E7E0;
 Mon, 13 May 2024 14:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715610236; x=1747146236;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=gYPVkoIus6UEghB4V+Yt2g138LD5vnTrfbAcNEgESTY=;
 b=mzlWZNMt4f5asoduiGkfg4xclagrTZ+7Ng1XJFnGodMX9KHjGDCkSkuw
 ECP4OPfxX0cLgkP7kkt4duLnXb9H/QuOyuOrcAdSQK0WjI1CL2/G0Tp23
 F2RACpPoVujqAXYOjxKzuHvrZn2hFoSsPpyHaNoPQlmgf8UbuxVaAi6hp
 JSCBMSSyo+V7oRXFowWXdv3P0aSxMosMTcpWRYLAfUNo/lo9YUQI23ddp
 uvXWntyjVU5GWvbIeZ/qKWN0oDIBc85TrjsYcho77cv5oe92ybJGmKR/3
 p5j+9aAOwNmzhte/lVuAhVMYIZJA/NWz+v2RhXZPg4ruQioj6UuPm5MWp g==;
X-CSE-ConnectionGUID: 3ED3LL98QbO1k8VcXmra3g==
X-CSE-MsgGUID: 3JILRh8zRs299d3qcfa8Fw==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="11680008"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="11680008"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 07:23:45 -0700
X-CSE-ConnectionGUID: l+ZIi3ybT/Knnheyo/Rvbg==
X-CSE-MsgGUID: Fsfxj6FRTi6U98123uYVFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="30301478"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 07:23:44 -0700
Date: Mon, 13 May 2024 16:23:41 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIENJLnhlRlVMTDogZmFpbHVy?= =?utf-8?Q?e?= for
 lib/i915/perf: Accumulate clocks for MPEC format too
Message-ID: <20240513142341.6ox7hfhyvovnhbfe@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20240510170450.2404385-1-ashutosh.dixit@intel.com>
 <171537193299.2056296.7918395261750009572@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171537193299.2056296.7918395261750009572@8e613ede5ea5>
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

Hi igt-dev,
On 2024-05-10 at 20:12:12 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/i915/perf: Accumulate clocks for MPEC format too
> URL   : https://patchwork.freedesktop.org/series/133460/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_7846_full -> XEIGTPW_11128_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_11128_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_11128_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (3 -> 1)
> ------------------------------
> 
>   ERROR: It appears as if the changes made in XEIGTPW_11128_full prevented too many machines from booting.
> 
>   Missing    (2): shard-adlp shard-lnl 
> 
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_11128_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####

Unrelated to i915/perf change. No need for respin as this is
already merged.

Regards,
Kamil

> 
>   * igt@kms_addfb_basic@bad-pitch-63:
>     - shard-dg2-set2:     [PASS][1] -> [SKIP][2] ([Intel XE#1201] / [i915#6077])
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7846/shard-dg2-434/igt@kms_addfb_basic@bad-pitch-63.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11128/shard-dg2-466/igt@kms_addfb_basic@bad-pitch-63.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>     - shard-dg2-set2:     [PASS][3] -> [SKIP][4] ([Intel XE#1201] / [Intel XE#829]) +2 other tests skip
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7846/shard-dg2-466/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11128/shard-dg2-466/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][5] ([Intel XE#1124] / [Intel XE#1201])
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11128/shard-dg2-433/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html
> 
>   * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][6] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11128/shard-dg2-433/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][7] ([Intel XE#1201] / [Intel XE#787]) +68 other tests skip
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11128/shard-dg2-466/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-dp-4.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][8] ([Intel XE#650]) +7 other tests fail
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11128/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-7:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +20 other tests skip
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11128/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-7.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][10] ([Intel XE#1201] / [Intel XE#829])
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11128/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html
> 
>   * igt@kms_content_protection@atomic@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][11] ([Intel XE#1178])
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11128/shard-dg2-435/igt@kms_content_protection@atomic@pipe-a-dp-4.html
> 
>   * igt@kms_content_protection@uevent@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][12] ([Intel XE#1188])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11128/shard-dg2-436/igt@kms_content_protection@uevent@pipe-a-dp-4.html
> 
>   * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
>     - shard-dg2-set2:     [PASS][13] -> [DMESG-WARN][14] ([Intel XE#1214] / [Intel XE#282]) +4 other tests dmesg-warn
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7846/shard-dg2-463/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11128/shard-dg2-463/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@forked-move:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#1201]) +1 other test skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11128/shard-dg2-466/igt@kms_cursor_legacy@forked-move.html
> 
>   * igt@kms_cursor_legacy@single-bo@pipe-c:
>     - shard-dg2-set2:     [PASS][16] -> [INCOMPLETE][17] ([Intel XE#1195])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7846/shard-dg2-434/igt@kms_cursor_legacy@single-bo@pipe-c.html
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11128/shard-dg2-436/igt@kms_cursor_legacy@single-bo@pipe-c.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel XE#651]) +4 other tests skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11128/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#653]) +2 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11128/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_invalid_mode@zero-clock:
>     - shard-dg2-set2:     [PASS][20] -> [SKIP][21] ([Intel XE#1201]) +18 other tests skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7846/shard-dg2-463/igt@kms_invalid_mode@zero-clock.html
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11128/shard-dg2-466/igt@kms_invalid_mode@zero-clock.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][22] ([Intel XE#616]) +2 other tests fail
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11128/shard-dg2-436/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455])
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11128/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#1201] / [Intel XE#305]) +2 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11128/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#1201] / [Intel XE#455]) +4 other tests skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11128/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#1201] / [Intel XE#929])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11128/shard-dg2-434/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
> 
>   * igt@xe_evict@evict-beng-threads-large:
>     - shard-dg2-set2:     [PASS][27] -> [TIMEOUT][28] ([Intel XE#1473])
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7846/shard-dg2-464/igt@xe_evict@evict-beng-threads-large.html
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11128/shard-dg2-435/igt@xe_evict@evict-beng-threads-large.html
> 
>   * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-imm:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#1201] / [Intel XE#288])
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11128/shard-dg2-463/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-imm.html
> 
>   * igt@xe_pm@s3-basic-exec:
>     - shard-dg2-set2:     [PASS][30] -> [DMESG-WARN][31] ([Intel XE#1214])
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7846/shard-dg2-464/igt@xe_pm@s3-basic-exec.html
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11128/shard-dg2-463/igt@xe_pm@s3-basic-exec.html
> 
>   * igt@xe_pm@s3-d3cold-basic-exec:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#1201] / [Intel XE#366])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11128/shard-dg2-434/igt@xe_pm@s3-d3cold-basic-exec.html
> 
>   * igt@xe_pm@s4-exec-after:
>     - shard-dg2-set2:     [PASS][33] -> [DMESG-WARN][34] ([Intel XE#1162] / [Intel XE#1214]) +2 other tests dmesg-warn
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7846/shard-dg2-434/igt@xe_pm@s4-exec-after.html
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11128/shard-dg2-436/igt@xe_pm@s4-exec-after.html
> 
>   * igt@xe_query@multigpu-query-cs-cycles:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#1201] / [Intel XE#944])
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11128/shard-dg2-433/igt@xe_query@multigpu-query-cs-cycles.html
> 
>   
> #### Possible fixes ####
> 

...cut...

>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [i915#6077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7846 -> IGTPW_11128
>   * Linux: xe-1263-92f877dd46245e4a44b6d24b5e303b8c03c40c75 -> xe-1274-23ec6ba1c106dcbbc3bc85cafb1a01849460b08e
> 
>   IGTPW_11128: 11128
>   IGT_7846: 4a5fd4e7cb2798636f6464e2bd61399f3242b322 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1263-92f877dd46245e4a44b6d24b5e303b8c03c40c75: 92f877dd46245e4a44b6d24b5e303b8c03c40c75
>   xe-1274-23ec6ba1c106dcbbc3bc85cafb1a01849460b08e: 23ec6ba1c106dcbbc3bc85cafb1a01849460b08e
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133460v1/index.html
