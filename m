Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6139BC25B75
	for <igt-dev@archiver.kernel.org>; Mon, 13 May 2024 12:59:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1A6F10E133;
	Mon, 13 May 2024 12:59:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AdUinW/X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD86F10E133;
 Mon, 13 May 2024 12:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715605167; x=1747141167;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cuZp58JWPaA6AY1KgJps8smkFehJv7Q3ZDG73TZScQE=;
 b=AdUinW/XFwvBBPjEREPiys2mziI3IHfbZ6Ds9CGsEoJewoa63bVNmLYr
 JVbGefqz63HZeMRSsSvBgoeUHStNC0FNqZ6uN4vWhmTTZfKQroh55e8mq
 AM8OfRvyF6isd/DdtY7FirTcQvF6Gkco/i/pXDMGnKzv+KY6WeKnNMU+B
 RzGV8Q8MItp2q325BVrQDJTAELBOdn99JYKZPChFt7uuwrpMUk1i+yRxp
 AU28s40GUye4yr2EjCvvgntwb+IwIwoQM7pi/W/uxStEmGDrNow0KnOXa
 jrqXKCFtpceAdL/P+axsUqfIXJnkofKrKiKac+/HBumY0wi+gto+S9wLw g==;
X-CSE-ConnectionGUID: C2SiPSFMSn6R4gzgpgDopA==
X-CSE-MsgGUID: KJ8qvl5FTiWbZRrUbKREeA==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="22204677"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="22204677"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 05:59:25 -0700
X-CSE-ConnectionGUID: 6V7yzEkpQleHswACF/qRuw==
X-CSE-MsgGUID: a9DcsWIURkKuxiJVfqSyiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="61147592"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 05:59:24 -0700
Date: Mon, 13 May 2024 14:59:21 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_CI=2ExeFULL=3A_failure_for_lib=2Figt=5Fkm?=
 =?utf-8?Q?s=3A_move_settin?= =?utf-8?Q?g?=
 DRM_CLIENT_CAP_WRITEBACK_CONNECTORS to kms_writeback (rev3)
Message-ID: <20240513125921.2rlaqggdpzsoteh7@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20240510-wb_igt_fix-v2-1-e14eef87319b@quicinc.com>
 <171537756990.2056703.3805664490181253383@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171537756990.2056703.3805664490181253383@8e613ede5ea5>
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
On 2024-05-10 at 21:46:09 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/igt_kms: move setting DRM_CLIENT_CAP_WRITEBACK_CONNECTORS to kms_writeback (rev3)
> URL   : https://patchwork.freedesktop.org/series/131961/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_7846_full -> XEIGTPW_11129_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_11129_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_11129_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (3 -> 1)
> ------------------------------
> 
>   ERROR: It appears as if the changes made in XEIGTPW_11129_full prevented too many machines from booting.
> 
>   Missing    (2): shard-adlp shard-lnl 

It is unlikly that igt test could do such a fail
(it is not xe/i915_module --load).

> 
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_11129_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_addfb_basic@addfb25-modifier-no-flag:
>     - shard-dg2-set2:     [PASS][1] -> [SKIP][2] ([Intel XE#1201] / [i915#6077]) +1 other test skip
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7846/shard-dg2-463/igt@kms_addfb_basic@addfb25-modifier-no-flag.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11129/shard-dg2-436/igt@kms_addfb_basic@addfb25-modifier-no-flag.html
> 
>   * igt@kms_big_fb@x-tiled-16bpp-rotate-180:
>     - shard-dg2-set2:     [PASS][3] -> [SKIP][4] ([Intel XE#1201] / [Intel XE#829]) +3 other tests skip
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7846/shard-dg2-463/igt@kms_big_fb@x-tiled-16bpp-rotate-180.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11129/shard-dg2-436/igt@kms_big_fb@x-tiled-16bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][5] ([Intel XE#1124] / [Intel XE#1201])
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11129/shard-dg2-433/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html
> 
>   * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][6] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11129/shard-dg2-436/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][7] ([Intel XE#1201] / [Intel XE#787]) +49 other tests skip
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11129/shard-dg2-435/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-dp-4.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-7:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][8] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +14 other tests skip
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11129/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-7.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][9] ([Intel XE#650]) +11 other tests fail
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11129/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][10] ([Intel XE#1201] / [Intel XE#1252])
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11129/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html
> 
>   * igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-7:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#1201]) +4 other tests skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11129/shard-dg2-464/igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-7.html
> 
>   * igt@kms_content_protection@atomic@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][12] ([Intel XE#1178])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11129/shard-dg2-463/igt@kms_content_protection@atomic@pipe-a-dp-4.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#1201] / [Intel XE#308])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11129/shard-dg2-433/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
>     - shard-dg2-set2:     [PASS][14] -> [DMESG-WARN][15] ([Intel XE#1214] / [Intel XE#282]) +4 other tests dmesg-warn
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7846/shard-dg2-433/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11129/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@forked-move@all-pipes:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][16] ([Intel XE#1214] / [Intel XE#282]) +1 other test dmesg-warn
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11129/shard-dg2-464/igt@kms_cursor_legacy@forked-move@all-pipes.html
> 
>   * igt@kms_fbcon_fbt@fbc-suspend:
>     - shard-dg2-set2:     [PASS][17] -> [FAIL][18] ([Intel XE#1609])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7846/shard-dg2-463/igt@kms_fbcon_fbt@fbc-suspend.html
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11129/shard-dg2-433/igt@kms_fbcon_fbt@fbc-suspend.html
> 
>   * igt@kms_flip@plain-flip-fb-recreate@b-hdmi-a6:
>     - shard-dg2-set2:     [PASS][19] -> [INCOMPLETE][20] ([Intel XE#1195]) +3 other tests incomplete
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7846/shard-dg2-463/igt@kms_flip@plain-flip-fb-recreate@b-hdmi-a6.html
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11129/shard-dg2-434/igt@kms_flip@plain-flip-fb-recreate@b-hdmi-a6.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:
>     - shard-dg2-set2:     [PASS][21] -> [DMESG-WARN][22] ([Intel XE#1214]) +1 other test dmesg-warn
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7846/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11129/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
>     - shard-dg2-set2:     [PASS][23] -> [SKIP][24] ([Intel XE#1201] / [Intel XE#1234]) +1 other test skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7846/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11129/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#1201] / [Intel XE#651]) +3 other tests skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11129/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#1201] / [Intel XE#653]) +2 other tests skip
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11129/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_getfb@getfb-handle-closed:
>     - shard-dg2-set2:     [PASS][27] -> [SKIP][28] ([Intel XE#1201] / [Intel XE#687])
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7846/shard-dg2-435/igt@kms_getfb@getfb-handle-closed.html
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11129/shard-dg2-436/igt@kms_getfb@getfb-handle-closed.html
> 
>   * igt@kms_invalid_mode@zero-clock:
>     - shard-dg2-set2:     [PASS][29] -> [SKIP][30] ([Intel XE#1201]) +16 other tests skip
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7846/shard-dg2-463/igt@kms_invalid_mode@zero-clock.html
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11129/shard-dg2-436/igt@kms_invalid_mode@zero-clock.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][31] ([Intel XE#1162] / [Intel XE#1214])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11129/shard-dg2-463/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][32] ([Intel XE#616]) +6 other tests fail
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11129/shard-dg2-463/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11129/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#1201] / [Intel XE#305]) +2 other tests skip
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11129/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#1201] / [Intel XE#455]) +5 other tests skip
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11129/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_prop_blob@invalid-set-prop-any:
>     - shard-dg2-set2:     [PASS][36] -> [SKIP][37] ([Intel XE#1201] / [Intel XE#780]) +1 other test skip
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7846/shard-dg2-464/igt@kms_prop_blob@invalid-set-prop-any.html
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11129/shard-dg2-436/igt@kms_prop_blob@invalid-set-prop-any.html
> 
>   * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#1201] / [Intel XE#929])
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11129/shard-dg2-435/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
> 
>   * igt@xe_evict@evict-beng-threads-large:
>     - shard-dg2-set2:     [PASS][39] -> [INCOMPLETE][40] ([Intel XE#1195] / [Intel XE#1473])
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7846/shard-dg2-464/igt@xe_evict@evict-beng-threads-large.html
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11129/shard-dg2-436/igt@xe_evict@evict-beng-threads-large.html
> 
>   * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-imm:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#1201] / [Intel XE#288])
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11129/shard-dg2-463/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-imm.html
> 
>   * igt@xe_live_ktest@xe_bo:
>     - shard-dg2-set2:     [PASS][42] -> [SKIP][43] ([Intel XE#1192] / [Intel XE#1201])
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7846/shard-dg2-436/igt@xe_live_ktest@xe_bo.html
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11129/shard-dg2-466/igt@xe_live_ktest@xe_bo.html

Looks like some tests caused kernel taint, after that no other
test could run.
All i915 kms test did run with success, I will merge this change.

Regards,
Kamil

> 
>   * igt@xe_pm@s3-basic-exec:
>     - shard-dg2-set2:     [PASS][44] -> [DMESG-WARN][45] ([Intel XE#1162] / [Intel XE#1214]) +7 other tests dmesg-warn
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7846/shard-dg2-464/igt@xe_pm@s3-basic-exec.html
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11129/shard-dg2-436/igt@xe_pm@s3-basic-exec.html
> 
>   * igt@xe_pm@s3-d3cold-basic-exec:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#1201] / [Intel XE#366])
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11129/shard-dg2-464/igt@xe_pm@s3-d3cold-basic-exec.html
> 
>   * igt@xe_query@multigpu-query-cs-cycles:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#1201] / [Intel XE#944])
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11129/shard-dg2-463/igt@xe_query@multigpu-query-cs-cycles.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@core_getversion@basic:
>     - shard-dg2-set2:     [CRASH][48] ([Intel XE#1835]) -> [PASS][49]
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7846/shard-dg2-435/igt@core_getversion@basic.html
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11129/shard-dg2-463/igt@core_getversion@basic.html
> 
>   * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
>     - shard-dg2-set2:     [DMESG-WARN][50] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][51] +2 other tests pass
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7846/shard-dg2-436/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11129/shard-dg2-433/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [FAIL][52] ([Intel XE#361]) -> [PASS][53]
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7846/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11129/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation:
>     - shard-dg2-set2:     [SKIP][54] ([Intel XE#1201]) -> [PASS][55] +2 other tests pass
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7846/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11129/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html
> 
>   * igt@kms_pm_rpm@i2c:
>     - shard-dg2-set2:     [FAIL][56] ([Intel XE#1787]) -> [PASS][57]
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7846/shard-dg2-464/igt@kms_pm_rpm@i2c.html
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11129/shard-dg2-436/igt@kms_pm_rpm@i2c.html
> 
>   * igt@kms_universal_plane@disable-primary-vs-flip:
>     - shard-dg2-set2:     [SKIP][58] ([Intel XE#1201] / [Intel XE#829]) -> [PASS][59]
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7846/shard-dg2-436/igt@kms_universal_plane@disable-primary-vs-flip.html
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11129/shard-dg2-464/igt@kms_universal_plane@disable-primary-vs-flip.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-small:
>     - shard-dg2-set2:     [TIMEOUT][60] ([Intel XE#1473] / [Intel XE#402]) -> [PASS][61]
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7846/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11129/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html
> 
>   * igt@xe_evict@evict-cm-threads-large:
>     - shard-dg2-set2:     [INCOMPLETE][62] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392]) -> [PASS][63]
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7846/shard-dg2-435/igt@xe_evict@evict-cm-threads-large.html
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11129/shard-dg2-463/igt@xe_evict@evict-cm-threads-large.html
> 
>   * igt@xe_module_load@reload:
>     - shard-dg2-set2:     [DMESG-WARN][64] ([Intel XE#1162] / [Intel XE#1214]) -> [PASS][65] +4 other tests pass
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7846/shard-dg2-464/igt@xe_module_load@reload.html
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11129/shard-dg2-463/igt@xe_module_load@reload.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][66] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][67] ([Intel XE#1201] / [Intel XE#829]) +1 other test skip
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7846/shard-dg2-466/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11129/shard-dg2-436/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
>     - shard-dg2-set2:     [SKIP][68] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][69] ([Intel XE#1201]) +1 other test skip
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7846/shard-dg2-436/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11129/shard-dg2-436/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
>     - shard-dg2-set2:     [SKIP][70] ([Intel XE#1201]) -> [SKIP][71] ([Intel XE#1201] / [Intel XE#367])
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7846/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11129/shard-dg2-464/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs:
>     - shard-dg2-set2:     [SKIP][72] ([Intel XE#1201] / [Intel XE#829]) -> [FAIL][73] ([Intel XE#650])
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7846/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs.html
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11129/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:
>     - shard-dg2-set2:     [SKIP][74] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][75] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787])
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7846/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11129/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html
> 
>   * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs:
>     - shard-dg2-set2:     [SKIP][76] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][77] ([Intel XE#1201] / [Intel XE#829]) +3 other tests skip
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7846/shard-dg2-466/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11129/shard-dg2-436/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
>     - shard-dg2-set2:     [SKIP][78] ([Intel XE#1201]) -> [SKIP][79] ([Intel XE#1201] / [Intel XE#373])
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7846/shard-dg2-436/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11129/shard-dg2-463/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:
>     - shard-dg2-set2:     [SKIP][80] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][81] ([Intel XE#1201]) +1 other test skip
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7846/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11129/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html
> 
>   * igt@kms_content_protection@atomic:
>     - shard-dg2-set2:     [SKIP][82] ([Intel XE#1201] / [Intel XE#455]) -> [FAIL][83] ([Intel XE#1178])
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7846/shard-dg2-464/igt@kms_content_protection@atomic.html
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11129/shard-dg2-463/igt@kms_content_protection@atomic.html
> 
>   * igt@kms_content_protection@dp-mst-type-0:
>     - shard-dg2-set2:     [SKIP][84] ([Intel XE#1201]) -> [SKIP][85] ([Intel XE#1201] / [Intel XE#307])
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7846/shard-dg2-436/igt@kms_content_protection@dp-mst-type-0.html
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11129/shard-dg2-463/igt@kms_content_protection@dp-mst-type-0.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
>     - shard-dg2-set2:     [SKIP][86] ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][87] ([Intel XE#1201])
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7846/shard-dg2-435/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11129/shard-dg2-436/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
>     - shard-dg2-set2:     [DMESG-WARN][88] ([Intel XE#1214] / [Intel XE#282]) -> [SKIP][89] ([Intel XE#1201])
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7846/shard-dg2-435/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11129/shard-dg2-436/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html
> 
>   * igt@kms_dsc@dsc-with-bpc:
>     - shard-dg2-set2:     [SKIP][90] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][91] ([Intel XE#1201]) +2 other tests skip
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7846/shard-dg2-466/igt@kms_dsc@dsc-with-bpc.html
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11129/shard-dg2-436/igt@kms_dsc@dsc-with-bpc.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-render:
>     - shard-dg2-set2:     [SKIP][92] ([Intel XE#1201]) -> [SKIP][93] ([Intel XE#1201] / [Intel XE#651]) +2 other tests skip
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7846/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-render.html
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11129/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-blt:
>     - shard-dg2-set2:     [SKIP][94] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][95] ([Intel XE#1201]) +6 other tests skip
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7846/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-blt.html
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11129/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
>     - shard-dg2-set2:     [SKIP][96] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][97] ([Intel XE#1201]) +5 other tests skip
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7846/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11129/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
>     - shard-dg2-set2:     [SKIP][98] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][99] ([Intel XE#1201] / [Intel XE#1234])
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7846/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11129/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-blt:
>     - shard-dg2-set2:     [SKIP][100] ([Intel XE#1201]) -> [SKIP][101] ([Intel XE#1201] / [Intel XE#653]) +1 other test skip
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7846/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-blt.html
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11129/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_plane@pixel-format:
>     - shard-dg2-set2:     [FAIL][102] ([Intel XE#650]) -> [SKIP][103] ([Intel XE#1201] / [Intel XE#829])
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7846/shard-dg2-435/igt@kms_plane@pixel-format.html
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11129/shard-dg2-436/igt@kms_plane@pixel-format.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:
>     - shard-dg2-set2:     [TIMEOUT][104] ([Intel XE#380] / [Intel XE#904] / [Intel XE#909]) -> [INCOMPLETE][105] ([Intel XE#1195] / [Intel XE#904] / [Intel XE#909])
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7846/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11129/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [TIMEOUT][106] ([Intel XE#904] / [Intel XE#909]) -> [INCOMPLETE][107] ([Intel XE#1195] / [Intel XE#904] / [Intel XE#909])
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7846/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11129/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format:
>     - shard-dg2-set2:     [INCOMPLETE][108] ([Intel XE#1195] / [Intel XE#904] / [Intel XE#909]) -> [TIMEOUT][109] ([Intel XE#380] / [Intel XE#904] / [Intel XE#909])
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7846/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11129/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [INCOMPLETE][110] ([Intel XE#1195] / [Intel XE#904] / [Intel XE#909]) -> [TIMEOUT][111] ([Intel XE#904] / [Intel XE#909])
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7846/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a-hdmi-a-6.html
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11129/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_pm_backlight@basic-brightness:
>     - shard-dg2-set2:     [SKIP][112] ([Intel XE#1201] / [Intel XE#870]) -> [SKIP][113] ([Intel XE#1201])
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7846/shard-dg2-436/igt@kms_pm_backlight@basic-brightness.html
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11129/shard-dg2-436/igt@kms_pm_backlight@basic-brightness.html
> 
>   * igt@kms_psr@fbc-psr2-cursor-plane-move:
>     - shard-dg2-set2:     [SKIP][114] ([Intel XE#1201]) -> [SKIP][115] ([Intel XE#1201] / [Intel XE#929]) +2 other tests skip
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7846/shard-dg2-436/igt@kms_psr@fbc-psr2-cursor-plane-move.html
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11129/shard-dg2-463/igt@kms_psr@fbc-psr2-cursor-plane-move.html
> 
>   * igt@kms_psr@psr2-cursor-plane-onoff:
>     - shard-dg2-set2:     [SKIP][116] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][117] ([Intel XE#1201]) +3 other tests skip
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7846/shard-dg2-434/igt@kms_psr@psr2-cursor-plane-onoff.html
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11129/shard-dg2-436/igt@kms_psr@psr2-cursor-plane-onoff.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
>     - shard-dg2-set2:     [SKIP][118] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][119] ([Intel XE#1201] / [Intel XE#829])
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7846/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11129/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
> 
>   * igt@kms_vrr@flip-basic:
>     - shard-dg2-set2:     [SKIP][120] ([Intel XE#1201]) -> [SKIP][121] ([Intel XE#1201] / [Intel XE#455])
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7846/shard-dg2-436/igt@kms_vrr@flip-basic.html
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11129/shard-dg2-463/igt@kms_vrr@flip-basic.html
> 
>   * igt@xe_evict@evict-beng-mixed-threads-large:
>     - shard-dg2-set2:     [DMESG-FAIL][122] ([Intel XE#482]) -> [TIMEOUT][123] ([Intel XE#1473] / [Intel XE#392])
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7846/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11129/shard-dg2-434/igt@xe_evict@evict-beng-mixed-threads-large.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-large:
>     - shard-dg2-set2:     [INCOMPLETE][124] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392]) -> [TIMEOUT][125] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392])
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7846/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-large.html
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11129/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-large.html
> 
>   * igt@xe_evict@evict-threads-large:
>     - shard-dg2-set2:     [INCOMPLETE][126] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392]) -> [TIMEOUT][127] ([Intel XE#1473] / [Intel XE#392]) +1 other test timeout
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7846/shard-dg2-466/igt@xe_evict@evict-threads-large.html
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11129/shard-dg2-464/igt@xe_evict@evict-threads-large.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>   [Intel XE#1234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1234
>   [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1609
>   [Intel XE#1787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1787
>   [Intel XE#1818]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1818
>   [Intel XE#1835]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1835
>   [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
>   [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/380
>   [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
>   [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/482
>   [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>   [Intel XE#650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/650
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#687]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/687
>   [Intel XE#780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/780
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/904
>   [Intel XE#909]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/909
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [i915#6077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7846 -> IGTPW_11129
>   * Linux: xe-1263-92f877dd46245e4a44b6d24b5e303b8c03c40c75 -> xe-1275-afd593c3e9f9218ececa93e30c33182346295ac9
> 
>   IGTPW_11129: 0bbb518164eda8a6e1a30d14f211779bafe002bf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_7846: 4a5fd4e7cb2798636f6464e2bd61399f3242b322 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1263-92f877dd46245e4a44b6d24b5e303b8c03c40c75: 92f877dd46245e4a44b6d24b5e303b8c03c40c75
>   xe-1275-afd593c3e9f9218ececa93e30c33182346295ac9: afd593c3e9f9218ececa93e30c33182346295ac9
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131961v3/index.html
