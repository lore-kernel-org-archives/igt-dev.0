Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9447C61DB9
	for <igt-dev@archiver.kernel.org>; Thu, 27 Aug 2026 23:17:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D9CA10E419;
	Thu, 27 Aug 2026 23:17:52 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D47B10E419;
 Thu, 27 Aug 2026 23:17:14 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7777654740630339595=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_tools=3A_rename_HDMI_compl?=
 =?utf-8?q?iance_utility?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 27 Aug 2026 23:17:14 -0000
Message-ID: <178787263410.93789.18377127124285614493@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260827185355.378279-1-swati2.sharma@intel.com>
In-Reply-To: <20260827185355.378279-1-swati2.sharma@intel.com>
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
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

--===============7777654740630339595==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tools: rename HDMI compliance utility
URL   : https://patchwork.freedesktop.org/series/172907/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9078_FULL -> XEIGTPW_15748_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_15748_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][1] ([Intel XE#2327]) +1 other test skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-3/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][2] ([Intel XE#1407])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-2/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#7059] / [Intel XE#7085])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-3/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#1124])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-10/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [SKIP][5] ([Intel XE#1124])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080p:
    - shard-lnl:          NOTRUN -> [SKIP][6] ([Intel XE#7679])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-8/igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080p.html

  * igt@kms_bw@linear-tiling-4-displays-target-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#367]) +2 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-6/igt@kms_bw@linear-tiling-4-displays-target-2560x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#2669] / [Intel XE#7389]) +3 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-3/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#2887])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-7/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2887]) +2 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#306] / [Intel XE#7358])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-5/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_color_pipeline@plane-ctm3x4:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#7358])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-5/igt@kms_chamelium_color_pipeline@plane-ctm3x4.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#373])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-8/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_sharpness_filter@filter-basic:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#6507])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-10/igt@kms_chamelium_sharpness_filter@filter-basic.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          NOTRUN -> [FAIL][15] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-3/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@legacy-hdcp14:
    - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#7642])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-6/igt@kms_content_protection@legacy-hdcp14.html

  * igt@kms_cursor_crc@cursor-offscreen-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2320]) +2 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-256x85.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#4331] / [Intel XE#7227])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-7/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#8265])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-2/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#4422] / [Intel XE#7442])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-8/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-bmg:          [PASS][21] -> [FAIL][22] ([Intel XE#6266]) +1 other test fail
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-bmg-9/igt@kms_flip@2x-blocking-wf_vblank.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-10/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#1421])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-3/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [PASS][24] -> [FAIL][25] ([Intel XE#301])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#7178] / [Intel XE#7349])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#7178] / [Intel XE#7351])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#7179])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#7178] / [Intel XE#7351])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2311]) +11 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#6312] / [Intel XE#651]) +2 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#4141]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#656] / [Intel XE#7905]) +5 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#7061] / [Intel XE#7356]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#7061] / [Intel XE#7356]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-move:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#6312]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2313]) +15 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#7061])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-indfb-msflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#7905]) +7 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-2/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#7865]) +5 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-5/igt@kms_frontbuffer_tracking@psrhdr-suspend.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#7283])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-5/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#599])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-3/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#4596] / [Intel XE#5854])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-3/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-4/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#8395] / [Intel XE#8396]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-4/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc3co-vpb-simulation@psr2-yuv420:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#8396]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-4/igt@kms_pm_dc@dc3co-vpb-simulation@psr2-yuv420.html

  * igt@kms_pm_dc@dc5-dpms-negative:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#1131])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-7/igt@kms_pm_dc@dc5-dpms-negative.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#1489])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-4/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2387] / [Intel XE#7429])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-3/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@pr-no-drrs:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2234] / [Intel XE#2850]) +3 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-9/igt@kms_psr@pr-no-drrs.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#1127] / [Intel XE#5813])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2413])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-2/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_vrr@negative-basic:
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#1499])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-1/igt@kms_vrr@negative-basic.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#6540] / [Intel XE#688]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-1/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [PASS][55] -> [INCOMPLETE][56] ([Intel XE#6321] / [Intel XE#8355]) +1 other test incomplete
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-mixed-threads-small-multi-queue:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#8370])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-5/igt@xe_evict@evict-mixed-threads-small-multi-queue.html

  * igt@xe_exec_balancer@once-cm-parallel-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#7482]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-1/igt@xe_exec_balancer@once-cm-parallel-userptr.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2322] / [Intel XE#7372]) +4 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-9/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#1392])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-6/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html

  * igt@xe_exec_fault_mode@twice-multi-queue-rebind-prefetch:
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#8374]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-4/igt@xe_exec_fault_mode@twice-multi-queue-rebind-prefetch.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#8374]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-8/igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-basic-smem:
    - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#8364]) +4 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-2/igt@xe_exec_multi_queue@few-execs-preempt-mode-basic-smem.html

  * igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-basic:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#8364]) +7 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-9/igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-basic.html

  * igt@xe_exec_threads@threads-multi-queue-hang-fd-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#8378]) +4 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-hang-fd-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-multi-queue-userptr-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#8378]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-6/igt@xe_exec_threads@threads-multi-queue-userptr-rebind.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:
    - shard-bmg:          NOTRUN -> [ABORT][67] ([Intel XE#8007])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-10/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#584] / [Intel XE#7369])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-8/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_multigpu_svm@mgpu-migration-basic:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#6964])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-2/igt@xe_multigpu_svm@mgpu-migration-basic.html

  * igt@xe_multigpu_svm@mgpu-pagefault-prefetch:
    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#6964])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-6/igt@xe_multigpu_svm@mgpu-pagefault-prefetch.html

  * igt@xe_pat@l2-flush-opt-svm-pat-restrict:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#7590] / [Intel XE#7772])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-2/igt@xe_pat@l2-flush-opt-svm-pat-restrict.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#1420] / [Intel XE#2838] / [Intel XE#7590])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-2/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-sw-hw-reset-compare:
    - shard-bmg:          NOTRUN -> [FAIL][73] ([Intel XE#7695])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-7/igt@xe_pat@pat-sw-hw-reset-compare.html

  * igt@xe_peer2peer@read:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2427] / [Intel XE#6953] / [Intel XE#7326] / [Intel XE#7353])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-2/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#2284] / [Intel XE#7370])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-10/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_prefetch_fault@l2-prefetch-fault-svm:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#8815])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-8/igt@xe_prefetch_fault@l2-prefetch-fault-svm.html

  * igt@xe_prefetch_fault@prefetch-fault:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#7599])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-4/igt@xe_prefetch_fault@prefetch-fault.html

  * igt@xe_sriov_admin@default-sched-attributes-vfs-disabled:
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#7174])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-2/igt@xe_sriov_admin@default-sched-attributes-vfs-disabled.html

  * igt@xe_sriov_auto_provisioning@exclusive-ranges@numvfs-random:
    - shard-bmg:          [PASS][79] -> [FAIL][80] ([Intel XE#7992]) +2 other tests fail
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-bmg-3/igt@xe_sriov_auto_provisioning@exclusive-ranges@numvfs-random.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-2/igt@xe_sriov_auto_provisioning@exclusive-ranges@numvfs-random.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-bmg:          NOTRUN -> [FAIL][81] ([Intel XE#7992])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-3/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_sriov_scheduling@equal-throughput-normal-priority:
    - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#8339])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-5/igt@xe_sriov_scheduling@equal-throughput-normal-priority.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-bmg:          [PASS][83] -> [ABORT][84] ([Intel XE#8007])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-bmg-3/igt@xe_wedged@wedged-mode-toggle.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-4/igt@xe_wedged@wedged-mode-toggle.html

  
#### Possible fixes ####

  * igt@kms_cursor_crc@cursor-random-64x64:
    - shard-bmg:          [SKIP][85] -> [PASS][86] +10 other tests pass
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-bmg-3/igt@kms_cursor_crc@cursor-random-64x64.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-3/igt@kms_cursor_crc@cursor-random-64x64.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-bmg:          [INCOMPLETE][87] ([Intel XE#8155]) -> [PASS][88] +1 other test pass
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-bmg-8/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-2/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [FAIL][89] ([Intel XE#301]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [FAIL][91] ([Intel XE#8399]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-lnl-7/igt@kms_pm_dc@dc6-psr.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html

  * igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute:
    - shard-bmg:          [DMESG-FAIL][93] -> [PASS][94] +1 other test pass
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-bmg-3/igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-4/igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-huge-nomemset:
    - shard-lnl:          [FAIL][95] ([Intel XE#8058]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-lnl-6/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-huge-nomemset.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-5/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-huge-nomemset.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-bmg:          [FAIL][97] ([Intel XE#6569]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-bmg-1/igt@xe_sriov_flr@flr-each-isolation.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-2/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_sriov_vram@vf-access-after-resize-down:
    - shard-bmg:          [FAIL][99] ([Intel XE#7992]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-bmg-10/igt@xe_sriov_vram@vf-access-after-resize-down.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-1/igt@xe_sriov_vram@vf-access-after-resize-down.html

  * igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:
    - shard-bmg:          [SKIP][101] ([Intel XE#8589]) -> [PASS][102] +74 other tests pass
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-bmg-3/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-2/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-bmg:          [SKIP][103] ([Intel XE#8589]) -> [SKIP][104] ([Intel XE#2327])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-bmg-3/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-3/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-bmg:          [SKIP][105] ([Intel XE#8589]) -> [SKIP][106] ([Intel XE#1124])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@linear-tiling-1-displays-target-3840x2160p:
    - shard-bmg:          [SKIP][107] -> [SKIP][108] ([Intel XE#367])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-bmg-3/igt@kms_bw@linear-tiling-1-displays-target-3840x2160p.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-target-3840x2160p.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:
    - shard-bmg:          [SKIP][109] ([Intel XE#8589]) -> [SKIP][110] ([Intel XE#2887])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-bmg-3/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-1/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
    - shard-bmg:          [SKIP][111] ([Intel XE#8589]) -> [SKIP][112] ([Intel XE#3432])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-bmg:          [SKIP][113] ([Intel XE#8589]) -> [SKIP][114] ([Intel XE#2724] / [Intel XE#7449])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-bmg-3/igt@kms_cdclk@plane-scaling.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-2/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-bmg:          [SKIP][115] -> [SKIP][116] ([Intel XE#2252]) +1 other test skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-bmg-3/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-7/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_dsc@dsc-fractional-bpp-ultrajoiner:
    - shard-bmg:          [SKIP][117] ([Intel XE#8589]) -> [SKIP][118] ([Intel XE#8265])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-bmg-3/igt@kms_dsc@dsc-fractional-bpp-ultrajoiner.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-9/igt@kms_dsc@dsc-fractional-bpp-ultrajoiner.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-bmg:          [SKIP][119] ([Intel XE#8589]) -> [SKIP][120] ([Intel XE#7178] / [Intel XE#7351])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-mmap-wc:
    - shard-bmg:          [SKIP][121] ([Intel XE#8589]) -> [SKIP][122] ([Intel XE#7061])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-bmg-3/igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-mmap-wc.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-7/igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc:
    - shard-bmg:          [SKIP][123] ([Intel XE#8589]) -> [SKIP][124] ([Intel XE#4141])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][125] ([Intel XE#8589]) -> [SKIP][126] ([Intel XE#2311]) +10 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc:
    - shard-bmg:          [SKIP][127] ([Intel XE#8589]) -> [SKIP][128] ([Intel XE#7061] / [Intel XE#7356])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][129] ([Intel XE#8589]) -> [SKIP][130] ([Intel XE#2313]) +5 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-bmg-3/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-4/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][131] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][132] ([Intel XE#3544])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:
    - shard-bmg:          [SKIP][133] -> [SKIP][134] ([Intel XE#7283])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-bmg-3/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-8/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          [SKIP][135] ([Intel XE#8589]) -> [SKIP][136] ([Intel XE#1489]) +1 other test skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-bmg-3/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-2/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@pr-cursor-plane-move:
    - shard-bmg:          [SKIP][137] ([Intel XE#8589]) -> [SKIP][138] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-bmg-3/igt@kms_psr@pr-cursor-plane-move.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-9/igt@kms_psr@pr-cursor-plane-move.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          [SKIP][139] -> [SKIP][140] ([Intel XE#3904] / [Intel XE#7342])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-bmg-3/igt@kms_rotation_crc@bad-pixel-format.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-4/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][141] ([Intel XE#2509] / [Intel XE#7437]) -> [SKIP][142] ([Intel XE#2426] / [Intel XE#5848])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@sriov_basic@pf-unbind-with-vf-probed:
    - shard-bmg:          [ABORT][143] ([Intel XE#8868]) -> [FAIL][144] ([Intel XE#7992])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-bmg-4/igt@sriov_basic@pf-unbind-with-vf-probed.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-3/igt@sriov_basic@pf-unbind-with-vf-probed.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-bmg:          [SKIP][145] ([Intel XE#8589]) -> [SKIP][146] ([Intel XE#2322] / [Intel XE#7372]) +1 other test skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-bmg-3/igt@xe_exec_basic@multigpu-once-null-rebind.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-7/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-prefetch:
    - shard-bmg:          [SKIP][147] ([Intel XE#8589]) -> [SKIP][148] ([Intel XE#8374])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-bmg-3/igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-prefetch.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-4/igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-prefetch.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-close-fd-smem:
    - shard-bmg:          [SKIP][149] ([Intel XE#8589]) -> [SKIP][150] ([Intel XE#8364]) +4 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-bmg-3/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-close-fd-smem.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-6/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-close-fd-smem.html

  * igt@xe_exec_reset@multi-queue-cancel-on-secondary:
    - shard-bmg:          [SKIP][151] ([Intel XE#8589]) -> [SKIP][152] ([Intel XE#8369])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-bmg-3/igt@xe_exec_reset@multi-queue-cancel-on-secondary.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-2/igt@xe_exec_reset@multi-queue-cancel-on-secondary.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-bmg:          [SKIP][153] ([Intel XE#8589]) -> [SKIP][154] ([Intel XE#579] / [Intel XE#7329] / [Intel XE#7517])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-bmg-3/igt@xe_pm@vram-d3cold-threshold.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-9/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_wedged@basic-wedged:
    - shard-lnl:          [ABORT][155] ([Intel XE#8963]) -> [DMESG-WARN][156] ([Intel XE#8963])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-lnl-6/igt@xe_wedged@basic-wedged.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-3/igt@xe_wedged@basic-wedged.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5854]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#6266]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7174
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
  [Intel XE#7227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7227
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7326]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326
  [Intel XE#7329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7329
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7369
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7389]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389
  [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442
  [Intel XE#7449]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7517]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7517
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695
  [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
  [Intel XE#7772]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7772
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7992]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8058]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8058
  [Intel XE#8155]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8155
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8339
  [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395
  [Intel XE#8396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396
  [Intel XE#8399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399
  [Intel XE#8589]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#8815]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8815
  [Intel XE#8868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8868
  [Intel XE#8963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963


Build changes
-------------

  * IGT: IGT_9078 -> IGTPW_15748

  IGTPW_15748: 15748
  IGT_9078: 9078
  xe-5656-108b145a702212f7cb6d40611f46c7ee7959d39e: 108b145a702212f7cb6d40611f46c7ee7959d39e

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/index.html

--===============7777654740630339595==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <title>Project List - Patchwork</title>
  <style id="css-table-select" type="text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>tools: rename HDMI compliance utility</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/172907/">https://patchwork.freedesktop.org/series/172907/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9078_FULL -&gt; XEIGTPW_15748_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15748_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-3/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-2/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-3/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059">Intel XE#7059</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-10/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-8/igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-6/igt@kms_bw@linear-tiling-4-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-3/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389">Intel XE#7389</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-7/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-5/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-ctm3x4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-5/igt@kms_chamelium_color_pipeline@plane-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-8/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_sharpness_filter@filter-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-10/igt@kms_chamelium_sharpness_filter@filter-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507">Intel XE#6507</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-3/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy-hdcp14:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-6/igt@kms_content_protection@legacy-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-7/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331">Intel XE#4331</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7227">Intel XE#7227</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-2/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-8/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442">Intel XE#7442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-bmg-9/igt@kms_flip@2x-blocking-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-10/igt@kms_flip@2x-blocking-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266">Intel XE#6266</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-3/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE#7349</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179">Intel XE#7179</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-2/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-5/igt@kms_frontbuffer_tracking@psrhdr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-5/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-3/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-3/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854">Intel XE#5854</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-4/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760">Intel XE#7760</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-4/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395">Intel XE#8395</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation@psr2-yuv420:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-4/igt@kms_pm_dc@dc3co-vpb-simulation@psr2-yuv420.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-negative:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-7/igt@kms_pm_dc@dc5-dpms-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131">Intel XE#1131</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-4/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-3/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429">Intel XE#7429</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-no-drrs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-9/igt@kms_psr@pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-2/igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-1/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-1/igt@xe_evict@evict-beng-mixed-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">Intel XE#8355</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-small-multi-queue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-5/igt@xe_evict@evict-mixed-threads-small-multi-queue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370">Intel XE#8370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-cm-parallel-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-1/igt@xe_exec_balancer@once-cm-parallel-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-9/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-6/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-rebind-prefetch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-4/igt@xe_exec_fault_mode@twice-multi-queue-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-8/igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-basic-smem:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-2/igt@xe_exec_multi_queue@few-execs-preempt-mode-basic-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-9/igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-hang-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-hang-fd-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-userptr-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-6/igt@xe_exec_threads@threads-multi-queue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-10/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-8/igt@xe_gt_freq@freq_suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7369">Intel XE#7369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-migration-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-2/igt@xe_multigpu_svm@mgpu-migration-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-pagefault-prefetch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-6/igt@xe_multigpu_svm@mgpu-pagefault-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@l2-flush-opt-svm-pat-restrict:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-2/igt@xe_pat@l2-flush-opt-svm-pat-restrict.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7772">Intel XE#7772</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-sw-hw-reset-compare:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-7/igt@xe_pat@pat-sw-hw-reset-compare.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695">Intel XE#7695</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-2/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">Intel XE#2427</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953">Intel XE#6953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326">Intel XE#7326</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353">Intel XE#7353</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-10/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_prefetch_fault@l2-prefetch-fault-svm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-8/igt@xe_prefetch_fault@l2-prefetch-fault-svm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8815">Intel XE#8815</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_prefetch_fault@prefetch-fault:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-4/igt@xe_prefetch_fault@prefetch-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599">Intel XE#7599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_admin@default-sched-attributes-vfs-disabled:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-2/igt@xe_sriov_admin@default-sched-attributes-vfs-disabled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7174">Intel XE#7174</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@exclusive-ranges@numvfs-random:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-bmg-3/igt@xe_sriov_auto_provisioning@exclusive-ranges@numvfs-random.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-2/igt@xe_sriov_auto_provisioning@exclusive-ranges@numvfs-random.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992">Intel XE#7992</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-3/igt@xe_sriov_flr@flr-vf1-clear.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992">Intel XE#7992</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput-normal-priority:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-5/igt@xe_sriov_scheduling@equal-throughput-normal-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8339">Intel XE#8339</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-bmg-3/igt@xe_wedged@wedged-mode-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-4/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_crc@cursor-random-64x64:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-bmg-3/igt@kms_cursor_crc@cursor-random-64x64.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-3/igt@kms_cursor_crc@cursor-random-64x64.html">PASS</a> +10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-bmg-8/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8155">Intel XE#8155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-2/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-lnl-7/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399">Intel XE#8399</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-bmg-3/igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-4/igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-huge-nomemset:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-lnl-6/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-huge-nomemset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8058">Intel XE#8058</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-5/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-huge-nomemset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-bmg-1/igt@xe_sriov_flr@flr-each-isolation.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel XE#6569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-2/igt@xe_sriov_flr@flr-each-isolation.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vram@vf-access-after-resize-down:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-bmg-10/igt@xe_sriov_vram@vf-access-after-resize-down.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992">Intel XE#7992</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-1/igt@xe_sriov_vram@vf-access-after-resize-down.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-bmg-3/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-2/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html">PASS</a> +74 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-bmg-3/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-3/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-bmg-3/igt@kms_bw@linear-tiling-1-displays-target-3840x2160p.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-bmg-3/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-1/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-bmg-3/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-2/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449">Intel XE#7449</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-bmg-3/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-7/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-ultrajoiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-bmg-3/igt@kms_dsc@dsc-fractional-bpp-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-9/igt@kms_dsc@dsc-fractional-bpp-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-bmg-3/igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-7/igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-bmg-3/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-4/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-bmg-3/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-8/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-bmg-3/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-2/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-bmg-3/igt@kms_psr@pr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-9/igt@kms_psr@pr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-bmg-3/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-4/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel XE#7437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@pf-unbind-with-vf-probed:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-bmg-4/igt@sriov_basic@pf-unbind-with-vf-probed.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8868">Intel XE#8868</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-3/igt@sriov_basic@pf-unbind-with-vf-probed.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992">Intel XE#7992</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-bmg-3/igt@xe_exec_basic@multigpu-once-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-7/igt@xe_exec_basic@multigpu-once-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-bmg-3/igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-4/igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-close-fd-smem:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-bmg-3/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-close-fd-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-6/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-close-fd-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-cancel-on-secondary:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-bmg-3/igt@xe_exec_reset@multi-queue-cancel-on-secondary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-2/igt@xe_exec_reset@multi-queue-cancel-on-secondary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-bmg-3/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-bmg-9/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7329">Intel XE#7329</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7517">Intel XE#7517</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/shard-lnl-6/igt@xe_wedged@basic-wedged.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963">Intel XE#8963</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15748/shard-lnl-3/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963">Intel XE#8963</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9078 -&gt; IGTPW_15748</li>
</ul>
<p>IGTPW_15748: 15748<br />
  IGT_9078: 9078<br />
  xe-5656-108b145a702212f7cb6d40611f46c7ee7959d39e: 108b145a702212f7cb6d40611f46c7ee7959d39e</p>

</body>
</html>

--===============7777654740630339595==--
