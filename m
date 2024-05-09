Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8292AC10F1A
	for <igt-dev@archiver.kernel.org>; Thu,  9 May 2024 14:47:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C0B710EB3C;
	Thu,  9 May 2024 14:47:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C/39Ry+3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E04810E18A;
 Thu,  9 May 2024 14:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715266020; x=1746802020;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=aiok+mFlzK4KEokv2oCcTOLIlWvTFFZJjB0xFw/sQ1E=;
 b=C/39Ry+3wOy5iNv5wTdEQdVCYZRGGLar0u6G5rH+mmzbAoDtyje5S3X4
 xZ+vfd/UW2/g3QMVZghno/8j+s+wDg8q8pCFtfsl6ZStf7EbHaO2TwAmv
 spud21NyqFg0pspnHPWIjk+AcmsqidtAvRLShmNcDwkk+fOJ4s+laLX+k
 GfIMz/JvuOv8bOdJBRbN6+DDHYTCIOsnwgKC/lbf8Y5VZGlv7+Dzb+zWm
 Rlg4YrdaE0+yMZR9NWMs8wLogEKF8rhxeCk3zg5KbuJUs+tbhwmBVSafU
 7wPyr+KXSrVjKmSCF+w6gJwq25Waf9jmvKi9/c22I9ZjGFmG5BI20mzO/ g==;
X-CSE-ConnectionGUID: zoU0z75STU2uQ2lgI5QJcg==
X-CSE-MsgGUID: G0Qbn0caR5Cl7eSpCKSVuw==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="11040017"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; d="scan'208";a="11040017"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 07:47:00 -0700
X-CSE-ConnectionGUID: JQT1L1AzTz6GXJF4XkoUfw==
X-CSE-MsgGUID: fnKGKFFdSzSRt9ddBTGZqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; d="scan'208";a="33810654"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 07:46:58 -0700
Date: Thu, 9 May 2024 16:46:55 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIENJLnhlRlVMTDogZmFpbHVy?= =?utf-8?Q?e?= for
 tests/device_reset: move later skips into subtests (rev5)
Message-ID: <20240509144655.sy5jql4dqazqulle@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20240508164550.52434-1-kamil.konieczny@linux.intel.com>
 <171523062594.2023341.7219911276516366045@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171523062594.2023341.7219911276516366045@8e613ede5ea5>
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
On 2024-05-09 at 04:57:05 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/device_reset: move later skips into subtests (rev5)
> URL   : https://patchwork.freedesktop.org/series/132040/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_7843_full -> XEIGTPW_11114_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_11114_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_11114_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (3 -> 1)
> ------------------------------
> 
>   ERROR: It appears as if the changes made in XEIGTPW_11114_full prevented too many machines from booting.
> 
>   Missing    (2): shard-adlp shard-lnl 

Test change in device_reset cannot do this.

Regards,
Kamil

> 
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_11114_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-4-4-rc-ccs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][1] ([Intel XE#1201] / [Intel XE#801]) +15 other tests skip
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-463/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-4-4-rc-ccs.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][2] ([Intel XE#650]) +11 other tests fail
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-463/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][3] -> [FAIL][4] ([Intel XE#1388]) +1 other test fail
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7843/shard-dg2-435/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-463/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_big_fb@linear-16bpp-rotate-90:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][5] ([Intel XE#1201] / [Intel XE#829])
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-463/igt@kms_big_fb@linear-16bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][6] ([Intel XE#1201] / [Intel XE#316])
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-466/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][7] ([Intel XE#1124] / [Intel XE#1201]) +3 other tests skip
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-434/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][8] ([Intel XE#1201] / [Intel XE#787]) +60 other tests skip
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-463/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-a-dp-4.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#1201] / [Intel XE#1252])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-436/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-7:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][10] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +16 other tests skip
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-7.html
> 
>   * igt@kms_chamelium_color@ctm-blue-to-red:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#1201] / [Intel XE#306])
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-463/igt@kms_chamelium_color@ctm-blue-to-red.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#1201] / [Intel XE#373]) +3 other tests skip
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-435/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html
> 
>   * igt@kms_content_protection@srm@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][13] ([Intel XE#1178])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-436/igt@kms_content_protection@srm@pipe-a-dp-4.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
>     - shard-dg2-set2:     [PASS][14] -> [DMESG-WARN][15] ([Intel XE#1214] / [Intel XE#282]) +2 other tests dmesg-warn
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7843/shard-dg2-436/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-433/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][16] ([Intel XE#1214] / [Intel XE#282])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
> 
>   * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#929])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-466/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-4.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-hdmi-a7:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][18] ([Intel XE#1214])
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-464/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-hdmi-a7.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#651]) +5 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#1201] / [Intel XE#653]) +5 other tests skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
> 
>   * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][21] ([Intel XE#616]) +3 other tests fail
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-466/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498])
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#1201] / [Intel XE#305]) +2 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-464/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#1201] / [Intel XE#455]) +4 other tests skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-464/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_pm_dc@dc9-dpms:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#1201])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-463/igt@kms_pm_dc@dc9-dpms.html
> 
>   * igt@kms_psr@fbc-psr-sprite-plane-onoff:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#1201] / [Intel XE#929]) +3 other tests skip
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-463/igt@kms_psr@fbc-psr-sprite-plane-onoff.html
> 
>   * igt@kms_rotation_crc@bad-tiling:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#1201] / [Intel XE#327]) +1 other test skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-435/igt@kms_rotation_crc@bad-tiling.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#1127] / [Intel XE#1201])
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-433/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
> 
>   * igt@kms_sysfs_edid_timing:
>     - shard-dg2-set2:     [PASS][30] -> [FAIL][31] ([Intel XE#1174])
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7843/shard-dg2-463/igt@kms_sysfs_edid_timing.html
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-464/igt@kms_sysfs_edid_timing.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][32] ([Intel XE#771] / [Intel XE#899])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][33] ([Intel XE#899])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_vblank@wait-forked-busy-hang:
>     - shard-dg2-set2:     [PASS][34] -> [SKIP][35] ([Intel XE#1201]) +5 other tests skip
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7843/shard-dg2-463/igt@kms_vblank@wait-forked-busy-hang.html
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-463/igt@kms_vblank@wait-forked-busy-hang.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0xfd:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#1126] / [Intel XE#1201])
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0xfd.html
> 
>   * igt@xe_evict@evict-large-multi-vm-cm:
>     - shard-dg2-set2:     [PASS][37] -> [FAIL][38] ([Intel XE#1600])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7843/shard-dg2-466/igt@xe_evict@evict-large-multi-vm-cm.html
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-433/igt@xe_evict@evict-large-multi-vm-cm.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-small:
>     - shard-dg2-set2:     [PASS][39] -> [TIMEOUT][40] ([Intel XE#1473])
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7843/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-small.html
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html
> 
>   * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#1201] / [Intel XE#288]) +7 other tests skip
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-463/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
> 
>   * igt@xe_gt_freq@freq_low_max:
>     - shard-dg2-set2:     [PASS][42] -> [FAIL][43] ([Intel XE#1045] / [Intel XE#1204])
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7843/shard-dg2-463/igt@xe_gt_freq@freq_low_max.html
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-436/igt@xe_gt_freq@freq_low_max.html
> 
>   * igt@xe_live_ktest@xe_bo:
>     - shard-dg2-set2:     [PASS][44] -> [SKIP][45] ([Intel XE#1192] / [Intel XE#1201])
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7843/shard-dg2-464/igt@xe_live_ktest@xe_bo.html
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-463/igt@xe_live_ktest@xe_bo.html
> 
>   * igt@xe_pm@s3-basic-exec:
>     - shard-dg2-set2:     [PASS][46] -> [DMESG-WARN][47] ([Intel XE#1162] / [Intel XE#1214]) +5 other tests dmesg-warn
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7843/shard-dg2-436/igt@xe_pm@s3-basic-exec.html
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-466/igt@xe_pm@s3-basic-exec.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_atomic_interruptible@legacy-setmode:
>     - shard-dg2-set2:     [SKIP][48] ([Intel XE#1201] / [Intel XE#1234]) -> [PASS][49]
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7843/shard-dg2-434/igt@kms_atomic_interruptible@legacy-setmode.html
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-433/igt@kms_atomic_interruptible@legacy-setmode.html
> 
>   * igt@kms_big_fb@linear-32bpp-rotate-180:
>     - shard-dg2-set2:     [SKIP][50] ([Intel XE#1201] / [Intel XE#829]) -> [PASS][51] +4 other tests pass
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7843/shard-dg2-434/igt@kms_big_fb@linear-32bpp-rotate-180.html
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-466/igt@kms_big_fb@linear-32bpp-rotate-180.html
> 
>   * igt@kms_color@ctm-0-75:
>     - shard-dg2-set2:     [SKIP][52] ([Intel XE#1201]) -> [PASS][53] +15 other tests pass
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7843/shard-dg2-434/igt@kms_color@ctm-0-75.html
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-463/igt@kms_color@ctm-0-75.html
> 
>   * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
>     - shard-dg2-set2:     [DMESG-WARN][54] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910]) -> [PASS][55]
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7843/shard-dg2-463/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-433/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
> 
>   * igt@kms_cursor_legacy@forked-move@pipe-a:
>     - shard-dg2-set2:     [DMESG-WARN][56] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][57] +7 other tests pass
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7843/shard-dg2-433/igt@kms_cursor_legacy@forked-move@pipe-a.html
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-464/igt@kms_cursor_legacy@forked-move@pipe-a.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
>     - shard-dg2-set2:     [SKIP][58] ([Intel XE#1201] / [Intel XE#455]) -> [PASS][59]
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7843/shard-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-463/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6:
>     - shard-dg2-set2:     [DMESG-WARN][60] ([Intel XE#1162] / [Intel XE#1214]) -> [PASS][61] +7 other tests pass
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7843/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6.html
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6.html
> 
>   * igt@kms_getfb@getfb-handle-zero:
>     - shard-dg2-set2:     [SKIP][62] ([Intel XE#1201] / [Intel XE#687]) -> [PASS][63]
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7843/shard-dg2-434/igt@kms_getfb@getfb-handle-zero.html
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-436/igt@kms_getfb@getfb-handle-zero.html
> 
>   * igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64:
>     - shard-dg2-set2:     [FAIL][64] ([Intel XE#616]) -> [PASS][65] +1 other test pass
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7843/shard-dg2-434/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64.html
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-464/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64.html
> 
>   * igt@kms_rotation_crc@multiplane-rotation-cropping-top:
>     - shard-dg2-set2:     [INCOMPLETE][66] ([Intel XE#1195]) -> [PASS][67]
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7843/shard-dg2-436/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-436/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html
> 
>   * igt@xe_evict@evict-beng-cm-threads-large:
>     - shard-dg2-set2:     [INCOMPLETE][68] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392]) -> [PASS][69]
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7843/shard-dg2-463/igt@xe_evict@evict-beng-cm-threads-large.html
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-466/igt@xe_evict@evict-beng-cm-threads-large.html
> 
>   * igt@xe_evict@evict-threads-large:
>     - shard-dg2-set2:     [TIMEOUT][70] ([Intel XE#1473] / [Intel XE#392]) -> [PASS][71] +1 other test pass
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7843/shard-dg2-463/igt@xe_evict@evict-threads-large.html
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-436/igt@xe_evict@evict-threads-large.html
> 
>   
> #### Warnings ####
> 
>   * igt@core_hotunplug@hotreplug-lateclose:
>     - shard-dg2-set2:     [DMESG-FAIL][72] ([Intel XE#1548]) -> [DMESG-FAIL][73] ([Intel XE#1162] / [Intel XE#1548])
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7843/shard-dg2-433/igt@core_hotunplug@hotreplug-lateclose.html
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-464/igt@core_hotunplug@hotreplug-lateclose.html
> 
>   * igt@core_hotunplug@hotunplug-rescan:
>     - shard-dg2-set2:     [DMESG-FAIL][74] ([Intel XE#1162] / [Intel XE#1345] / [Intel XE#1548]) -> [DMESG-FAIL][75] ([Intel XE#1345] / [Intel XE#1548])
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7843/shard-dg2-463/igt@core_hotunplug@hotunplug-rescan.html
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-436/igt@core_hotunplug@hotunplug-rescan.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events:
>     - shard-dg2-set2:     [SKIP][76] ([Intel XE#1201]) -> [FAIL][77] ([Intel XE#650])
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7843/shard-dg2-434/igt@kms_async_flips@async-flip-with-page-flip-events.html
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-463/igt@kms_async_flips@async-flip-with-page-flip-events.html
> 
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
>     - shard-dg2-set2:     [SKIP][78] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][79] ([Intel XE#1201] / [Intel XE#316])
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7843/shard-dg2-434/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-435/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:
>     - shard-dg2-set2:     [SKIP][80] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][81] ([Intel XE#1201] / [Intel XE#829])
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7843/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][82] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][83] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7843/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-463/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html
> 
>   * igt@kms_big_joiner@invalid-modeset:
>     - shard-dg2-set2:     [SKIP][84] ([Intel XE#1201]) -> [SKIP][85] ([Intel XE#1201] / [Intel XE#346])
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7843/shard-dg2-434/igt@kms_big_joiner@invalid-modeset.html
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-463/igt@kms_big_joiner@invalid-modeset.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:
>     - shard-dg2-set2:     [SKIP][86] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][87] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +1 other test skip
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7843/shard-dg2-434/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-463/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs:
>     - shard-dg2-set2:     [SKIP][88] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][89] ([Intel XE#1201] / [Intel XE#1252])
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7843/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html
> 
>   * igt@kms_chamelium_color@gamma:
>     - shard-dg2-set2:     [SKIP][90] ([Intel XE#1201]) -> [SKIP][91] ([Intel XE#1201] / [Intel XE#306])
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7843/shard-dg2-434/igt@kms_chamelium_color@gamma.html
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-463/igt@kms_chamelium_color@gamma.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
>     - shard-dg2-set2:     [SKIP][92] ([Intel XE#1201]) -> [SKIP][93] ([Intel XE#1201] / [Intel XE#373])
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7843/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
> 
>   * igt@kms_content_protection@atomic-dpms:
>     - shard-dg2-set2:     [FAIL][94] ([Intel XE#1178]) -> [SKIP][95] ([Intel XE#1201] / [Intel XE#455])
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7843/shard-dg2-436/igt@kms_content_protection@atomic-dpms.html
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-464/igt@kms_content_protection@atomic-dpms.html
> 
>   * igt@kms_content_protection@mei-interface:
>     - shard-dg2-set2:     [SKIP][96] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][97] ([Intel XE#1201])
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7843/shard-dg2-434/igt@kms_content_protection@mei-interface.html
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-463/igt@kms_content_protection@mei-interface.html
> 
>   * igt@kms_content_protection@srm:
>     - shard-dg2-set2:     [SKIP][98] ([Intel XE#1201] / [Intel XE#455]) -> [FAIL][99] ([Intel XE#1178])
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7843/shard-dg2-464/igt@kms_content_protection@srm.html
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-436/igt@kms_content_protection@srm.html
> 
>   * igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [FAIL][100] ([Intel XE#616]) -> [DMESG-FAIL][101] ([Intel XE#1162])
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7843/shard-dg2-434/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-434/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
>     - shard-dg2-set2:     [SKIP][102] ([Intel XE#1201]) -> [DMESG-WARN][103] ([Intel XE#1214] / [Intel XE#282]) +1 other test dmesg-warn
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7843/shard-dg2-434/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-433/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
> 
>   * igt@kms_cursor_legacy@forked-bo:
>     - shard-dg2-set2:     [DMESG-WARN][104] ([Intel XE#1214] / [Intel XE#282]) -> [SKIP][105] ([Intel XE#1201])
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7843/shard-dg2-435/igt@kms_cursor_legacy@forked-bo.html
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-463/igt@kms_cursor_legacy@forked-bo.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][106] ([Intel XE#1201] / [Intel XE#455] / [i915#3804]) -> [SKIP][107] ([Intel XE#1201] / [i915#3804])
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7843/shard-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-463/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_feature_discovery@chamelium:
>     - shard-dg2-set2:     [SKIP][108] ([Intel XE#1201]) -> [SKIP][109] ([Intel XE#1201] / [Intel XE#701])
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7843/shard-dg2-434/igt@kms_feature_discovery@chamelium.html
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-436/igt@kms_feature_discovery@chamelium.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend:
>     - shard-dg2-set2:     [DMESG-WARN][110] ([Intel XE#1162] / [Intel XE#1214]) -> [DMESG-WARN][111] ([Intel XE#1214])
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7843/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend.html
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-464/igt@kms_flip@2x-flip-vs-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-msflip-blt:
>     - shard-dg2-set2:     [SKIP][112] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][113] ([Intel XE#1201])
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7843/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-msflip-blt.html
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt:
>     - shard-dg2-set2:     [SKIP][114] ([Intel XE#1201] / [Intel XE#1234]) -> [SKIP][115] ([Intel XE#1201] / [Intel XE#651])
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7843/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
>     - shard-dg2-set2:     [SKIP][116] ([Intel XE#1201]) -> [SKIP][117] ([Intel XE#1201] / [Intel XE#651]) +5 other tests skip
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7843/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-stridechange:
>     - shard-dg2-set2:     [SKIP][118] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][119] ([Intel XE#1201])
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7843/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-stridechange.html
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-stridechange.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
>     - shard-dg2-set2:     [SKIP][120] ([Intel XE#1201]) -> [SKIP][121] ([Intel XE#1201] / [Intel XE#653]) +6 other tests skip
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7843/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
>     - shard-dg2-set2:     [DMESG-FAIL][122] ([Intel XE#1162]) -> [FAIL][123] ([Intel XE#616]) +2 other tests fail
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7843/shard-dg2-463/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-464/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
>     - shard-dg2-set2:     [SKIP][124] ([Intel XE#1201]) -> [SKIP][125] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498])
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7843/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:
>     - shard-dg2-set2:     [INCOMPLETE][126] ([Intel XE#1195] / [Intel XE#904] / [Intel XE#909]) -> [TIMEOUT][127] ([Intel XE#380] / [Intel XE#904] / [Intel XE#909])
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7843/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [INCOMPLETE][128] ([Intel XE#1195] / [Intel XE#904] / [Intel XE#909]) -> [TIMEOUT][129] ([Intel XE#904] / [Intel XE#909])
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7843/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
>     - shard-dg2-set2:     [SKIP][130] ([Intel XE#1201]) -> [SKIP][131] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455])
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7843/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-464/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
> 
>   * igt@kms_pm_backlight@bad-brightness:
>     - shard-dg2-set2:     [SKIP][132] ([Intel XE#1201]) -> [SKIP][133] ([Intel XE#1201] / [Intel XE#870])
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7843/shard-dg2-434/igt@kms_pm_backlight@bad-brightness.html
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-434/igt@kms_pm_backlight@bad-brightness.html
> 
>   * igt@kms_psr@psr-cursor-render:
>     - shard-dg2-set2:     [SKIP][134] ([Intel XE#1201]) -> [SKIP][135] ([Intel XE#1201] / [Intel XE#929]) +4 other tests skip
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7843/shard-dg2-434/igt@kms_psr@psr-cursor-render.html
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-464/igt@kms_psr@psr-cursor-render.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
>     - shard-dg2-set2:     [SKIP][136] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][137] ([Intel XE#1201] / [Intel XE#327])
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7843/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-dg2-set2:     [SKIP][138] ([Intel XE#1201]) -> [SKIP][139] ([Intel XE#1201] / [Intel XE#362])
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7843/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@kms_vrr@flip-dpms:
>     - shard-dg2-set2:     [SKIP][140] ([Intel XE#1201]) -> [SKIP][141] ([Intel XE#1201] / [Intel XE#455]) +1 other test skip
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7843/shard-dg2-434/igt@kms_vrr@flip-dpms.html
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-464/igt@kms_vrr@flip-dpms.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-large:
>     - shard-dg2-set2:     [TIMEOUT][142] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392]) -> [INCOMPLETE][143] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7843/shard-dg2-464/igt@xe_evict@evict-beng-mixed-many-threads-large.html
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-large.html
> 
>   * igt@xe_module_load@many-reload:
>     - shard-dg2-set2:     [DMESG-WARN][144] ([Intel XE#1214]) -> [TIMEOUT][145] ([Intel XE#1093] / [Intel XE#1206])
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7843/shard-dg2-463/igt@xe_module_load@many-reload.html
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11114/shard-dg2-464/igt@xe_module_load@many-reload.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
>   [Intel XE#1045]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1045
>   [Intel XE#1093]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1093
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
>   [Intel XE#1174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1174
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
>   [Intel XE#1206]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1206
>   [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>   [Intel XE#1234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1234
>   [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
>   [Intel XE#1345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1345
>   [Intel XE#1388]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1388
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1548
>   [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
>   [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
>   [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
>   [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/380
>   [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
>   [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>   [Intel XE#650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/650
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#687]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/687
>   [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
>   [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#801]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/801
>   [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   [Intel XE#904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/904
>   [Intel XE#909]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/909
>   [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7843 -> IGTPW_11114
> 
>   IGTPW_11114: feaeed4804c4e3f9ad789458b44e4f3e722ba21b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_7843: 0df7b9b97f9da0e364f5ee30fe331004b8c86b56 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1257-34d52122a69076639d526b035c8edd5b43201f84: 34d52122a69076639d526b035c8edd5b43201f84
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132040v5/index.html
