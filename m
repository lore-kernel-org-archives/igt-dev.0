Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D709C1090220
	for <igt-dev@archiver.kernel.org>; Thu, 19 Mar 2026 13:08:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8596C10EA0B;
	Thu, 19 Mar 2026 13:08:10 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FC8610EA27;
 Thu, 19 Mar 2026 13:08:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3306761908599288024=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_CSC_Colorop_tests?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Harry Wentland" <harry.wentland@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 19 Mar 2026 13:08:06 -0000
Message-ID: <177392568643.375689.2140903536656330440@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260317160443.229812-1-harry.wentland@amd.com>
In-Reply-To: <20260317160443.229812-1-harry.wentland@amd.com>
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

--===============3306761908599288024==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: CSC Colorop tests
URL   : https://patchwork.freedesktop.org/series/163393/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8807_FULL -> XEIGTPW_14794_FULL
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

  Here are the changes found in XEIGTPW_14794_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][1] ([Intel XE#2327]) +3 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-9/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][2] ([Intel XE#7059] / [Intel XE#7085])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-2/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#1124]) +7 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [PASS][4] -> [SKIP][5] ([Intel XE#2314] / [Intel XE#2894] / [Intel XE#7373]) +2 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-9/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#367] / [Intel XE#7354])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-2/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2887]) +6 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-10/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2:
    - shard-bmg:          [PASS][8] -> [INCOMPLETE][9] ([Intel XE#7084]) +1 other test incomplete
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#3432])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2652]) +8 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-9/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_chamelium_frames@vga-frame-dump:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2252]) +3 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-10/igt@kms_chamelium_frames@vga-frame-dump.html

  * igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][13] ([Intel XE#3304] / [Intel XE#7374])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-7/igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2.html

  * igt@kms_content_protection@atomic-hdcp14:
    - shard-bmg:          NOTRUN -> [FAIL][14] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +2 other tests fail
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-7/igt@kms_content_protection@atomic-hdcp14.html

  * igt@kms_content_protection@uevent-hdcp14:
    - shard-bmg:          NOTRUN -> [FAIL][15] ([Intel XE#6707] / [Intel XE#7439]) +1 other test fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-8/igt@kms_content_protection@uevent-hdcp14.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2321] / [Intel XE#7355])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2320]) +5 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-7/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-bmg:          [PASS][18] -> [SKIP][19] ([Intel XE#2291]) +4 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-4/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-5/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2291]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-bmg:          [PASS][21] -> [SKIP][22] ([Intel XE#2291] / [Intel XE#7343]) +2 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][23] -> [FAIL][24] ([Intel XE#7586])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [PASS][25] -> [SKIP][26] ([Intel XE#4302])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-7/igt@kms_display_modes@extended-mode-basic.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-3/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          [PASS][27] -> [SKIP][28] ([Intel XE#3009])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-3/igt@kms_dp_aux_dev.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-3/igt@kms_dp_aux_dev.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-bmg:          [PASS][29] -> [SKIP][30] ([Intel XE#2316]) +4 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-4/igt@kms_flip@2x-blocking-wf_vblank.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-3/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2316])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#7178] / [Intel XE#7351]) +3 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2311]) +19 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#4141]) +5 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#7061] / [Intel XE#7356]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2312]) +3 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2313]) +12 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2352] / [Intel XE#7399])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_hdr@static-swap:
    - shard-bmg:          [PASS][39] -> [SKIP][40] ([Intel XE#1503])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-4/igt@kms_hdr@static-swap.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-3/igt@kms_hdr@static-swap.html

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#7283])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-2/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#5021] / [Intel XE#7377])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2763] / [Intel XE#6886]) +3 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-10/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#7376] / [Intel XE#870])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-2/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2391] / [Intel XE#6927])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-9/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2505] / [Intel XE#7447])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-10/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#1489]) +4 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2387] / [Intel XE#7429])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-2/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2234] / [Intel XE#2850]) +5 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-3/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#1406] / [Intel XE#2414])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-10/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_sharpness_filter@filter-toggle:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#6503])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-4/igt@kms_sharpness_filter@filter-toggle.html

  * igt@kms_vrr@cmrr:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2168] / [Intel XE#7444])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-5/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@flip-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#1499]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-9/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [PASS][54] -> [SKIP][55] ([Intel XE#1499])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-2/igt@kms_vrr@negative-basic.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-3/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - shard-lnl:          [PASS][56] -> [FAIL][57] ([Intel XE#2142]) +1 other test fail
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-lnl-2/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-lnl-6/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  * igt@xe_eudebug@vma-ufence:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#4837]) +3 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-10/igt@xe_eudebug@vma-ufence.html

  * igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#4837] / [Intel XE#6665]) +4 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-6/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [PASS][60] -> [INCOMPLETE][61] ([Intel XE#6321])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#2322] / [Intel XE#7372]) +2 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-2/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_exec_fault_mode@once-multi-queue-rebind-imm:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#7136]) +5 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-2/igt@xe_exec_fault_mode@once-multi-queue-rebind-imm.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#6874]) +15 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-4/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:
    - shard-lnl:          [PASS][65] -> [FAIL][66] ([Intel XE#5625])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-lnl-5/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-lnl-7/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#7138]) +5 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#1420])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-5/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pm@d3cold-basic:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#2284] / [Intel XE#7370])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-3/igt@xe_pm@d3cold-basic.html

  * igt@xe_pxp@pxp-stale-queue-post-termination-irq:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#4733] / [Intel XE#7417])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-8/igt@xe_pxp@pxp-stale-queue-post-termination-irq.html

  * igt@xe_query@multigpu-query-engines:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#944])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-9/igt@xe_query@multigpu-query-engines.html

  * igt@xe_sriov_flr@flr-twice:
    - shard-bmg:          [PASS][72] -> [FAIL][73] ([Intel XE#6569]) +1 other test fail
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-8/igt@xe_sriov_flr@flr-twice.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-9/igt@xe_sriov_flr@flr-twice.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotreplug:
    - shard-bmg:          [ABORT][74] ([Intel XE#7578]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-8/igt@core_hotunplug@hotreplug.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-5/igt@core_hotunplug@hotreplug.html

  * igt@intel_hwmon@hwmon-write:
    - shard-bmg:          [FAIL][76] ([Intel XE#7445]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-1/igt@intel_hwmon@hwmon-write.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-10/igt@intel_hwmon@hwmon-write.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-bmg:          [SKIP][78] ([Intel XE#2291]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-10/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-bmg:          [SKIP][80] ([Intel XE#2291] / [Intel XE#7343]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop:
    - shard-bmg:          [SKIP][82] ([Intel XE#2316]) -> [PASS][83] +2 other tests pass
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms-on-nop.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a3:
    - shard-bmg:          [INCOMPLETE][84] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][85] +1 other test pass
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-6/igt@kms_flip@flip-vs-suspend@a-hdmi-a3.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-8/igt@kms_flip@flip-vs-suspend@a-hdmi-a3.html

  * igt@kms_flip@plain-flip-fb-recreate@c-hdmi-a3:
    - shard-bmg:          [DMESG-FAIL][86] ([Intel XE#5545]) -> [PASS][87] +1 other test pass
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-2/igt@kms_flip@plain-flip-fb-recreate@c-hdmi-a3.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-1/igt@kms_flip@plain-flip-fb-recreate@c-hdmi-a3.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][88] ([Intel XE#1503]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-2/igt@kms_hdr@invalid-hdr.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-3/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-bmg:          [SKIP][90] ([Intel XE#7086]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-5/igt@kms_joiner@basic-force-big-joiner.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [FAIL][92] ([Intel XE#7340]) -> [PASS][93] +1 other test pass
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-lnl-5/igt@kms_pm_dc@dc6-psr.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-lnl-5/igt@kms_pm_dc@dc6-psr.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-bmg:          [FAIL][94] ([Intel XE#5937]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-5/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-6/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][96] ([Intel XE#6321]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-1/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-7/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_exec_system_allocator@fault-threads-benchmark:
    - shard-bmg:          [FAIL][98] -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-5/igt@xe_exec_system_allocator@fault-threads-benchmark.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-5/igt@xe_exec_system_allocator@fault-threads-benchmark.html

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-nomemset:
    - shard-bmg:          [SKIP][100] ([Intel XE#6703]) -> [PASS][101] +117 other tests pass
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-2/igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-nomemset.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-10/igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-nomemset.html

  * igt@xe_exec_system_allocator@twice-large-mmap:
    - shard-bmg:          [SKIP][102] ([Intel XE#6557] / [Intel XE#6703]) -> [PASS][103] +2 other tests pass
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-2/igt@xe_exec_system_allocator@twice-large-mmap.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-9/igt@xe_exec_system_allocator@twice-large-mmap.html

  
#### Warnings ####

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-bmg:          [SKIP][104] ([Intel XE#6703]) -> [SKIP][105] ([Intel XE#1124]) +1 other test skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [SKIP][106] ([Intel XE#6703]) -> [SKIP][107] ([Intel XE#2314] / [Intel XE#2894] / [Intel XE#7373])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          [SKIP][108] ([Intel XE#6703]) -> [SKIP][109] ([Intel XE#2887]) +3 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-2/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-6/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_chamelium_edid@dp-edid-read:
    - shard-bmg:          [SKIP][110] ([Intel XE#6703]) -> [SKIP][111] ([Intel XE#2252]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-2/igt@kms_chamelium_edid@dp-edid-read.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-8/igt@kms_chamelium_edid@dp-edid-read.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [FAIL][112] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) -> [SKIP][113] ([Intel XE#2341]) +1 other test skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-7/igt@kms_content_protection@atomic.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-3/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms-hdcp14:
    - shard-bmg:          [SKIP][114] ([Intel XE#7194]) -> [FAIL][115] ([Intel XE#3304] / [Intel XE#7374])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-5/igt@kms_content_protection@atomic-dpms-hdcp14.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-7/igt@kms_content_protection@atomic-dpms-hdcp14.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          [SKIP][116] ([Intel XE#6703]) -> [SKIP][117] ([Intel XE#2390] / [Intel XE#6974])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-2/igt@kms_content_protection@dp-mst-type-1.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-1/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [SKIP][118] ([Intel XE#2341]) -> [FAIL][119] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-5/igt@kms_content_protection@srm.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-8/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@suspend-resume:
    - shard-bmg:          [FAIL][120] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) -> [SKIP][121] ([Intel XE#6705])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-1/igt@kms_content_protection@suspend-resume.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-5/igt@kms_content_protection@suspend-resume.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [FAIL][122] ([Intel XE#6707] / [Intel XE#7439]) -> [SKIP][123] ([Intel XE#2341])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-7/igt@kms_content_protection@uevent.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-5/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-random-256x85:
    - shard-bmg:          [SKIP][124] ([Intel XE#6703]) -> [SKIP][125] ([Intel XE#2320])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-2/igt@kms_cursor_crc@cursor-random-256x85.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-1/igt@kms_cursor_crc@cursor-random-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          [SKIP][126] ([Intel XE#6703]) -> [SKIP][127] ([Intel XE#2321] / [Intel XE#7355])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-bmg:          [SKIP][128] ([Intel XE#6703]) -> [SKIP][129] ([Intel XE#2244])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-2/igt@kms_dsc@dsc-with-formats.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-1/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-bmg:          [SKIP][130] ([Intel XE#6703]) -> [SKIP][131] ([Intel XE#7178] / [Intel XE#7351])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][132] ([Intel XE#6557] / [Intel XE#6703]) -> [SKIP][133] ([Intel XE#2311])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][134] ([Intel XE#2312]) -> [SKIP][135] ([Intel XE#2311]) +4 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][136] ([Intel XE#6703]) -> [SKIP][137] ([Intel XE#2311]) +6 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][138] ([Intel XE#4141]) -> [SKIP][139] ([Intel XE#2312]) +9 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][140] ([Intel XE#6703]) -> [SKIP][141] ([Intel XE#4141]) +1 other test skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][142] ([Intel XE#2312]) -> [SKIP][143] ([Intel XE#4141]) +8 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][144] ([Intel XE#2311]) -> [SKIP][145] ([Intel XE#2312]) +17 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-bmg:          [SKIP][146] ([Intel XE#6703]) -> [SKIP][147] ([Intel XE#2352] / [Intel XE#7399])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][148] ([Intel XE#6703]) -> [SKIP][149] ([Intel XE#2312]) +1 other test skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][150] ([Intel XE#2312]) -> [SKIP][151] ([Intel XE#2313]) +7 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:
    - shard-bmg:          [SKIP][152] ([Intel XE#6703]) -> [SKIP][153] ([Intel XE#2313]) +5 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][154] ([Intel XE#2313]) -> [SKIP][155] ([Intel XE#2312]) +16 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-bmg:          [SKIP][156] ([Intel XE#6703]) -> [SKIP][157] ([Intel XE#6901])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-2/igt@kms_joiner@basic-big-joiner.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-2/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-bmg:          [SKIP][158] ([Intel XE#6703]) -> [SKIP][159] ([Intel XE#7591])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-3/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier:
    - shard-bmg:          [SKIP][160] ([Intel XE#6703]) -> [SKIP][161] ([Intel XE#7283])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-2/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-3/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:
    - shard-bmg:          [SKIP][162] ([Intel XE#6703]) -> [SKIP][163] ([Intel XE#2763] / [Intel XE#6886])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-10/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
    - shard-bmg:          [SKIP][164] ([Intel XE#6703]) -> [SKIP][165] ([Intel XE#1489])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-2/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-3/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr@pr-cursor-plane-onoff:
    - shard-bmg:          [SKIP][166] ([Intel XE#6703]) -> [SKIP][167] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-2/igt@kms_psr@pr-cursor-plane-onoff.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-4/igt@kms_psr@pr-cursor-plane-onoff.html

  * igt@kms_sharpness_filter@filter-basic:
    - shard-bmg:          [SKIP][168] ([Intel XE#6703]) -> [SKIP][169] ([Intel XE#6503])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-2/igt@kms_sharpness_filter@filter-basic.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-8/igt@kms_sharpness_filter@filter-basic.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][170] ([Intel XE#2426] / [Intel XE#5848]) -> [SKIP][171] ([Intel XE#2509] / [Intel XE#7437])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_eudebug@multigpu-basic-client:
    - shard-bmg:          [SKIP][172] ([Intel XE#6703]) -> [SKIP][173] ([Intel XE#4837])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-2/igt@xe_eudebug@multigpu-basic-client.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-3/igt@xe_eudebug@multigpu-basic-client.html

  * igt@xe_evict@evict-threads-small-multi-queue:
    - shard-bmg:          [SKIP][174] ([Intel XE#6703]) -> [SKIP][175] ([Intel XE#7140])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-2/igt@xe_evict@evict-threads-small-multi-queue.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-2/igt@xe_evict@evict-threads-small-multi-queue.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:
    - shard-bmg:          [SKIP][176] ([Intel XE#6703]) -> [SKIP][177] ([Intel XE#2322] / [Intel XE#7372]) +1 other test skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race-imm:
    - shard-bmg:          [SKIP][178] ([Intel XE#6703]) -> [SKIP][179] ([Intel XE#7136]) +1 other test skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-2/igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race-imm.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-3/igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race-imm.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem:
    - shard-bmg:          [SKIP][180] ([Intel XE#6703]) -> [SKIP][181] ([Intel XE#6874]) +5 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-2/igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-8/igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem.html

  * igt@xe_exec_threads@threads-multi-queue-fd-userptr-rebind:
    - shard-bmg:          [SKIP][182] ([Intel XE#6703]) -> [SKIP][183] ([Intel XE#7138]) +1 other test skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-fd-userptr-rebind.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-4/igt@xe_exec_threads@threads-multi-queue-fd-userptr-rebind.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-bmg:          [SKIP][184] ([Intel XE#6703]) -> [SKIP][185] ([Intel XE#2284] / [Intel XE#7370])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-2/igt@xe_pm@d3cold-mmap-system.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-5/igt@xe_pm@d3cold-mmap-system.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6705
  [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
  [Intel XE#6927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6927
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7086
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7140]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7194]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7194
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7354
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7373
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7377]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439
  [Intel XE#7444]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7444
  [Intel XE#7445]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7445
  [Intel XE#7447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7447
  [Intel XE#7578]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7578
  [Intel XE#7586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7586
  [Intel XE#7591]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7591
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_8807 -> IGTPW_14794
  * Linux: xe-4735-113073d07f958385b5b80d29b62e10d2cf0181d6 -> xe-4740-c479cdf62a3f9a6101dd020abbc471f35142b3d1

  IGTPW_14794: 14794
  IGT_8807: 7f44d96d705f1583d689f1f8c2275b685b4ca11d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4735-113073d07f958385b5b80d29b62e10d2cf0181d6: 113073d07f958385b5b80d29b62e10d2cf0181d6
  xe-4740-c479cdf62a3f9a6101dd020abbc471f35142b3d1: c479cdf62a3f9a6101dd020abbc471f35142b3d1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/index.html

--===============3306761908599288024==
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
<tr><td><b>Series:</b></td><td>CSC Colorop tests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/163393/">https://patchwork.freedesktop.org/series/163393/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8807_FULL -&gt; XEIGTPW_14794_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14794_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-9/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-2/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059">Intel XE#7059</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-9/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7373">Intel XE#7373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-2/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7354">Intel XE#7354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-10/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-9/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@vga-frame-dump:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-10/igt@kms_chamelium_frames@vga-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-7/igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-hdcp14:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-7/igt@kms_content_protection@atomic-hdcp14.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent-hdcp14:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-8/igt@kms_content_protection@uevent-hdcp14.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707">Intel XE#6707</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439">Intel XE#7439</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-7/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-4/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-5/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7586">Intel XE#7586</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-7/igt@kms_display_modes@extended-mode-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-3/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-3/igt@kms_dp_aux_dev.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-3/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-4/igt@kms_flip@2x-blocking-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-3/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-4/igt@kms_hdr@static-swap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-3/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-2/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377">Intel XE#7377</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-10/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-2/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-9/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391">Intel XE#2391</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6927">Intel XE#6927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-10/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505">Intel XE#2505</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7447">Intel XE#7447</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-2/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429">Intel XE#7429</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-3/igt@kms_psr@fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-10/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-toggle:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-4/igt@kms_sharpness_filter@filter-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-5/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7444">Intel XE#7444</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-9/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-2/igt@kms_vrr@negative-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-3/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-lnl-2/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-lnl-6/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142">Intel XE#2142</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vma-ufence:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-10/igt@xe_eudebug@vma-ufence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-6/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-2/igt@xe_exec_basic@multigpu-once-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-rebind-imm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-2/igt@xe_exec_fault_mode@once-multi-queue-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-4/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-lnl-5/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-lnl-7/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625">Intel XE#5625</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-5/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-3/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-queue-post-termination-irq:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-8/igt@xe_pxp@pxp-stale-queue-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-9/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-twice:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-8/igt@xe_sriov_flr@flr-twice.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-9/igt@xe_sriov_flr@flr-twice.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel XE#6569</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-8/igt@core_hotunplug@hotreplug.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7578">Intel XE#7578</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-5/igt@core_hotunplug@hotreplug.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-1/igt@intel_hwmon@hwmon-write.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7445">Intel XE#7445</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-10/igt@intel_hwmon@hwmon-write.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-10/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms-on-nop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms-on-nop.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-6/igt@kms_flip@flip-vs-suspend@a-hdmi-a3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-8/igt@kms_flip@flip-vs-suspend@a-hdmi-a3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@c-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-2/igt@kms_flip@plain-flip-fb-recreate@c-hdmi-a3.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-1/igt@kms_flip@plain-flip-fb-recreate@c-hdmi-a3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-2/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-3/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-5/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7086">Intel XE#7086</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-lnl-5/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340">Intel XE#7340</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-lnl-5/igt@kms_pm_dc@dc6-psr.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-5/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937">Intel XE#5937</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-6/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-1/igt@xe_evict@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-7/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@fault-threads-benchmark:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-5/igt@xe_exec_system_allocator@fault-threads-benchmark.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-5/igt@xe_exec_system_allocator@fault-threads-benchmark.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-2/igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-10/igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-nomemset.html">PASS</a> +117 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-mmap:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-2/igt@xe_exec_system_allocator@twice-large-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-9/igt@xe_exec_system_allocator@twice-large-mmap.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7373">Intel XE#7373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-2/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-6/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-read:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-2/igt@kms_chamelium_edid@dp-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-8/igt@kms_chamelium_edid@dp-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-7/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-3/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-5/igt@kms_content_protection@atomic-dpms-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7194">Intel XE#7194</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-7/igt@kms_content_protection@atomic-dpms-hdcp14.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-2/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-1/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-5/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-8/igt@kms_content_protection@srm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@suspend-resume:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-1/igt@kms_content_protection@suspend-resume.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-5/igt@kms_content_protection@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6705">Intel XE#6705</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-7/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707">Intel XE#6707</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439">Intel XE#7439</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-5/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-2/igt@kms_cursor_crc@cursor-random-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-1/igt@kms_cursor_crc@cursor-random-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-2/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-1/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-2/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-2/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901">Intel XE#6901</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-3/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7591">Intel XE#7591</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-2/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-3/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-10/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-2/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-3/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-plane-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-2/igt@kms_psr@pr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-4/igt@kms_psr@pr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-2/igt@kms_sharpness_filter@filter-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-8/igt@kms_sharpness_filter@filter-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel XE#7437</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@multigpu-basic-client:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-2/igt@xe_eudebug@multigpu-basic-client.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-3/igt@xe_eudebug@multigpu-basic-client.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-small-multi-queue:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-2/igt@xe_evict@evict-threads-small-multi-queue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-2/igt@xe_evict@evict-threads-small-multi-queue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140">Intel XE#7140</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-2/igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-3/igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-2/igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-8/igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-fd-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-fd-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-4/igt@xe_exec_threads@threads-multi-queue-fd-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/shard-bmg-2/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14794/shard-bmg-5/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8807 -&gt; IGTPW_14794</li>
<li>Linux: xe-4735-113073d07f958385b5b80d29b62e10d2cf0181d6 -&gt; xe-4740-c479cdf62a3f9a6101dd020abbc471f35142b3d1</li>
</ul>
<p>IGTPW_14794: 14794<br />
  IGT_8807: 7f44d96d705f1583d689f1f8c2275b685b4ca11d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4735-113073d07f958385b5b80d29b62e10d2cf0181d6: 113073d07f958385b5b80d29b62e10d2cf0181d6<br />
  xe-4740-c479cdf62a3f9a6101dd020abbc471f35142b3d1: c479cdf62a3f9a6101dd020abbc471f35142b3d1</p>

</body>
</html>

--===============3306761908599288024==--
