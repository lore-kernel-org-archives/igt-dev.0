Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C8A7E69E96
	for <igt-dev@archiver.kernel.org>; Mon,  2 Dec 2024 21:12:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD40E10E841;
	Mon,  2 Dec 2024 21:12:22 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C881410E841;
 Mon,  2 Dec 2024 21:12:21 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3560177085632519852=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_test/intel/xe=5Fsysfs=3A_R?=
 =?utf-8?q?estore_sysfs_params_correctly?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 02 Dec 2024 21:12:21 -0000
Message-ID: <173317394180.1756613.10179537891589940178@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241202180816.47538-1-jonathan.cavitt@intel.com>
In-Reply-To: <20241202180816.47538-1-jonathan.cavitt@intel.com>
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

--===============3560177085632519852==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: test/intel/xe_sysfs: Restore sysfs params correctly
URL   : https://patchwork.freedesktop.org/series/142000/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8133_full -> XEIGTPW_12229_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12229_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12229_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12229_full:

### IGT changes ###

#### Possible regressions ####

  * igt@core_getstats:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-8/igt@core_getstats.html

  
#### Warnings ####

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-d-hdmi-a-3:
    - shard-bmg:          [DMESG-WARN][2] ([Intel XE#3468]) -> [INCOMPLETE][3] +1 other test incomplete
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-7/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-hdmi-a-3.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-5/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-hdmi-a-3.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_12229_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#2385])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-1/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2370])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#2327]) +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-6/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#1124]) +7 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-6/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#610])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2328])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2314] / [Intel XE#2894])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#367]) +5 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html

  * igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2887]) +17 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-8/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2652] / [Intel XE#787]) +12 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2325]) +2 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-6/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2252]) +10 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-3/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html

  * igt@kms_color@deep-color:
    - shard-bmg:          [PASS][16] -> [DMESG-WARN][17] ([Intel XE#3468] / [Intel XE#877]) +2 other tests dmesg-warn
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-2/igt@kms_color@deep-color.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-3/igt@kms_color@deep-color.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][18] ([Intel XE#2715] / [Intel XE#3468]) +1 other test incomplete
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-1/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@content-type-change:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2341]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-5/igt@kms_content_protection@content-type-change.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2320]) +3 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2321]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-2/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_edge_walk@64x64-top-edge@pipe-a-dp-2:
    - shard-bmg:          [PASS][22] -> [DMESG-FAIL][23] ([Intel XE#3468]) +7 other tests dmesg-fail
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-4/igt@kms_cursor_edge_walk@64x64-top-edge@pipe-a-dp-2.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-1/igt@kms_cursor_edge_walk@64x64-top-edge@pipe-a-dp-2.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-bmg:          [PASS][24] -> [SKIP][25] ([Intel XE#2291]) +2 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-bmg:          [PASS][26] -> [DMESG-FAIL][27] ([Intel XE#2705] / [Intel XE#3468])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2286]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [PASS][29] -> [SKIP][30] ([Intel XE#2425])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-3/igt@kms_display_modes@extended-mode-basic.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2244])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-6/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2316])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-6/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-nonexisting-fb-interruptible@bc-dp2-hdmi-a3:
    - shard-bmg:          [PASS][33] -> [DMESG-WARN][34] ([Intel XE#3468]) +70 other tests dmesg-warn
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-4/igt@kms_flip@2x-nonexisting-fb-interruptible@bc-dp2-hdmi-a3.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-1/igt@kms_flip@2x-nonexisting-fb-interruptible@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-bmg:          [PASS][35] -> [SKIP][36] ([Intel XE#2316]) +2 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-3/igt@kms_flip@2x-plain-flip-ts-check.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2293]) +5 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2293] / [Intel XE#2380]) +5 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2311]) +28 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [FAIL][40] ([Intel XE#2333]) +11 other tests fail
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2313]) +28 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2352])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2312]) +10 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_getfb@getfb2-accept-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2340])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-7/igt@kms_getfb@getfb2-accept-ccs.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#3374] / [Intel XE#3544])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][46] -> [SKIP][47] ([Intel XE#1503])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-8/igt@kms_hdr@invalid-hdr.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-6/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2927])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-2/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2501])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2486])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-7/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          [PASS][51] -> [SKIP][52] ([Intel XE#2571])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-2/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation:
    - shard-bmg:          [PASS][53] -> [DMESG-WARN][54] ([Intel XE#1727]) +1 other test dmesg-warn
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-1/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-3/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2763]) +14 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2391])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-1/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-bmg:          NOTRUN -> [FAIL][57] ([Intel XE#1430])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-3/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@cursor:
    - shard-bmg:          [PASS][58] -> [INCOMPLETE][59] ([Intel XE#1727] / [Intel XE#3468])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-8/igt@kms_pm_rpm@cursor.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-2/igt@kms_pm_rpm@cursor.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@universal-planes-dpms@plane-50:
    - shard-bmg:          [PASS][61] -> [DMESG-WARN][62] ([Intel XE#1727] / [Intel XE#3468]) +7 other tests dmesg-warn
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-8/igt@kms_pm_rpm@universal-planes-dpms@plane-50.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-4/igt@kms_pm_rpm@universal-planes-dpms@plane-50.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#1489]) +8 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#2387]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-7/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#3189]) +2 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-5/igt@kms_psr@fbc-psr-suspend.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2234] / [Intel XE#2850]) +12 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-1/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#2330])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#3414]) +2 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-1/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#2413]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#1435])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-6/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#2426])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vblank@wait-forked-busy@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][72] ([Intel XE#3468]) +5 other tests dmesg-fail
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-7/igt@kms_vblank@wait-forked-busy@pipe-a-dp-2.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#1499])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-6/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#756])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-8/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#1091] / [Intel XE#2849])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-4/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_eudebug@connect-user:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#2905]) +18 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-5/igt@xe_eudebug@connect-user.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-bmg:          NOTRUN -> [TIMEOUT][77] ([Intel XE#1473])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_evict@evict-threads-large:
    - shard-bmg:          [PASS][78] -> [FAIL][79] ([Intel XE#1000])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-8/igt@xe_evict@evict-threads-large.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-5/igt@xe_evict@evict-threads-large.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#2322]) +8 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-3/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][81] ([Intel XE#3468]) +9 other tests dmesg-warn
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-7/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate-race.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init:
    - shard-bmg:          [PASS][82] -> [DMESG-WARN][83] ([Intel XE#3343])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][84] ([Intel XE#3467] / [Intel XE#3468])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][85] ([Intel XE#3343] / [Intel XE#3468])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html

  * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run:
    - shard-bmg:          [PASS][86] -> [DMESG-WARN][87] ([Intel XE#3467] / [Intel XE#3468])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-5/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][88] ([Intel XE#1727] / [Intel XE#3468])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-1/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#1192])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-8/igt@xe_live_ktest@xe_mocs.html

  * igt@xe_media_fill@media-fill:
    - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#2459] / [Intel XE#2596])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-4/igt@xe_media_fill@media-fill.html

  * igt@xe_mmap@small-bar:
    - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#586])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-1/igt@xe_mmap@small-bar.html

  * igt@xe_module_load@reload:
    - shard-bmg:          [PASS][92] -> [DMESG-WARN][93] ([Intel XE#3467])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-8/igt@xe_module_load@reload.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-3/igt@xe_module_load@reload.html

  * igt@xe_module_load@reload-no-display:
    - shard-bmg:          [PASS][94] -> [DMESG-FAIL][95] ([Intel XE#3467])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-1/igt@xe_module_load@reload-no-display.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-5/igt@xe_module_load@reload-no-display.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#2248])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-5/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_peer2peer@read:
    - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#2427])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-4/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3cold-basic:
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#2284]) +1 other test skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-5/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-bmg:          NOTRUN -> [ABORT][99] ([Intel XE#1616])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-8/igt@xe_pm@s2idle-basic-exec.html

  * igt@xe_pm@s3-vm-bind-unbind-all:
    - shard-bmg:          [PASS][100] -> [DMESG-WARN][101] ([Intel XE#1727] / [Intel XE#3468] / [Intel XE#569])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-1/igt@xe_pm@s3-vm-bind-unbind-all.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-3/igt@xe_pm@s3-vm-bind-unbind-all.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#944]) +4 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-4/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#3342])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-1/igt@xe_sriov_flr@flr-vf1-clear.html

  
#### Possible fixes ####

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [SKIP][104] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_cursor_crc@cursor-onscreen-128x128:
    - shard-bmg:          [DMESG-FAIL][106] ([Intel XE#3468]) -> [PASS][107] +13 other tests pass
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-128x128.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-128x128.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-bmg:          [DMESG-WARN][108] ([Intel XE#877]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][110] ([Intel XE#3321]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][112] ([Intel XE#3640]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-bmg:          [SKIP][114] ([Intel XE#2316]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-6/igt@kms_flip@2x-modeset-vs-vblank-race.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-7/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-bmg:          [FAIL][116] ([Intel XE#2882]) -> [PASS][117] +1 other test pass
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3:
    - shard-bmg:          [FAIL][118] ([Intel XE#3597]) -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html

  * igt@kms_flip@wf_vblank-ts-check:
    - shard-bmg:          [DMESG-FAIL][120] ([Intel XE#2705] / [Intel XE#3468]) -> [PASS][121] +1 other test pass
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-1/igt@kms_flip@wf_vblank-ts-check.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-6/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_plane_cursor@overlay@pipe-d-dp-2-size-64:
    - shard-bmg:          [DMESG-WARN][122] ([Intel XE#3468]) -> [PASS][123] +80 other tests pass
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-1/igt@kms_plane_cursor@overlay@pipe-d-dp-2-size-64.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-7/igt@kms_plane_cursor@overlay@pipe-d-dp-2-size-64.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format:
    - shard-bmg:          [DMESG-WARN][124] ([Intel XE#2566] / [Intel XE#3468]) -> [PASS][125] +1 other test pass
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-1/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-4/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-a:
    - shard-bmg:          [DMESG-WARN][126] ([Intel XE#2705] / [Intel XE#3468]) -> [PASS][127] +1 other test pass
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-1/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-a.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b:
    - shard-bmg:          [DMESG-WARN][128] -> [PASS][129]
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-3/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-3/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-d:
    - shard-bmg:          [DMESG-WARN][130] ([Intel XE#2566]) -> [PASS][131] +1 other test pass
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-3/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-d.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-3/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-d.html

  * igt@kms_sequence@get-forked-busy@pipe-a-dp-2:
    - shard-bmg:          [INCOMPLETE][132] ([Intel XE#1727]) -> [PASS][133] +1 other test pass
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-1/igt@kms_sequence@get-forked-busy@pipe-a-dp-2.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-4/igt@kms_sequence@get-forked-busy@pipe-a-dp-2.html

  * igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-hdmi-a-3:
    - shard-bmg:          [DMESG-WARN][134] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][135] +3 other tests pass
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-7/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-hdmi-a-3.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-6/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-hdmi-a-3.html

  * igt@xe_exec_compute_mode@once-rebind:
    - shard-bmg:          [DMESG-WARN][136] ([Intel XE#1727]) -> [PASS][137] +4 other tests pass
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-8/igt@xe_exec_compute_mode@once-rebind.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-8/igt@xe_exec_compute_mode@once-rebind.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init:
    - shard-bmg:          [DMESG-WARN][138] ([Intel XE#3343] / [Intel XE#3468]) -> [PASS][139]
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html

  * igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:
    - shard-bmg:          [DMESG-WARN][140] ([Intel XE#3467] / [Intel XE#3468]) -> [PASS][141] +3 other tests pass
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-4/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-6/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-bmg:          [SKIP][142] ([Intel XE#1192]) -> [PASS][143]
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-8/igt@xe_live_ktest@xe_migrate.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-6/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_module_load@unload:
    - shard-bmg:          [DMESG-WARN][144] ([Intel XE#3467]) -> [PASS][145]
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-7/igt@xe_module_load@unload.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-5/igt@xe_module_load@unload.html

  * igt@xe_pm@s3-basic:
    - shard-bmg:          [DMESG-WARN][146] ([Intel XE#1727] / [Intel XE#3468] / [Intel XE#569]) -> [PASS][147]
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-8/igt@xe_pm@s3-basic.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-7/igt@xe_pm@s3-basic.html

  
#### Warnings ####

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [INCOMPLETE][148] ([Intel XE#2715] / [Intel XE#3468]) -> [INCOMPLETE][149] ([Intel XE#2715]) +1 other test incomplete
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-1/igt@kms_content_protection@legacy.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-3/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [FAIL][150] ([Intel XE#1188]) -> [DMESG-FAIL][151] ([Intel XE#3468]) +1 other test dmesg-fail
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-3/igt@kms_content_protection@uevent.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-7/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-bmg:          [SKIP][152] ([Intel XE#2291]) -> [DMESG-WARN][153] ([Intel XE#877])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-2:
    - shard-bmg:          [FAIL][154] ([Intel XE#2141]) -> [DMESG-FAIL][155] ([Intel XE#3468]) +2 other tests dmesg-fail
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-5/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-2.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-3/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-2.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          [DMESG-FAIL][156] ([Intel XE#3468]) -> [FAIL][157] ([Intel XE#1695])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-8/igt@kms_fbcon_fbt@fbc-suspend.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-5/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][158] ([Intel XE#2311]) -> [SKIP][159] ([Intel XE#2312]) +6 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][160] ([Intel XE#2312]) -> [DMESG-FAIL][161] ([Intel XE#3468])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:
    - shard-bmg:          [SKIP][162] ([Intel XE#2312]) -> [FAIL][163] ([Intel XE#2333]) +1 other test fail
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [FAIL][164] ([Intel XE#2333]) -> [SKIP][165] ([Intel XE#2312])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:
    - shard-bmg:          [FAIL][166] ([Intel XE#2333]) -> [DMESG-FAIL][167] ([Intel XE#3468]) +5 other tests dmesg-fail
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [FAIL][168] ([Intel XE#2333]) -> [SKIP][169] ([Intel XE#3189])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [DMESG-FAIL][170] ([Intel XE#3468]) -> [SKIP][171] ([Intel XE#2312]) +1 other test skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [DMESG-FAIL][172] ([Intel XE#3468]) -> [FAIL][173] ([Intel XE#2333]) +7 other tests fail
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][174] ([Intel XE#2312]) -> [SKIP][175] ([Intel XE#2311]) +3 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][176] ([Intel XE#2313]) -> [SKIP][177] ([Intel XE#3189])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][178] ([Intel XE#2313]) -> [SKIP][179] ([Intel XE#2312]) +10 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][180] ([Intel XE#2312]) -> [SKIP][181] ([Intel XE#2313]) +6 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_psr@psr-cursor-blt:
    - shard-bmg:          [SKIP][182] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][183] ([Intel XE#3189])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-4/igt@kms_psr@psr-cursor-blt.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-5/igt@kms_psr@psr-cursor-blt.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-bmg:          [TIMEOUT][184] ([Intel XE#1473]) -> [INCOMPLETE][185] ([Intel XE#1473])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-3/igt@xe_evict@evict-beng-mixed-many-threads-large.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-8/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-bmg:          [DMESG-FAIL][186] ([Intel XE#3468]) -> [FAIL][187] ([Intel XE#2364])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-7/igt@xe_evict@evict-large-multi-vm-cm.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-6/igt@xe_evict@evict-large-multi-vm-cm.html

  
  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
  [Intel XE#1695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#2141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2141
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2385
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2425
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
  [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3189]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3189
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467
  [Intel XE#3468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3597
  [Intel XE#3640]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3640
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_8133 -> IGTPW_12229
  * Linux: xe-2302-77777471ae59ce2f0d0e74d55c60014cf02bd4df -> xe-2303-26715037f44d6dd8c755dd7c3e115cf9b29782a4

  IGTPW_12229: 569a859f53b6b6b4089f223f26f3bd4f3cbc455a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8133: 16f2bfe294cc103df8ebb208aa2e64415262f534 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2302-77777471ae59ce2f0d0e74d55c60014cf02bd4df: 77777471ae59ce2f0d0e74d55c60014cf02bd4df
  xe-2303-26715037f44d6dd8c755dd7c3e115cf9b29782a4: 26715037f44d6dd8c755dd7c3e115cf9b29782a4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/index.html

--===============3560177085632519852==
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
<tr><td><b>Series:</b></td><td>test/intel/xe_sysfs: Restore sysfs params correctly</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/142000/">https://patchwork.freedesktop.org/series/142000/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8133_full -&gt; XEIGTPW_12229_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12229_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_12229_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12229_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@core_getstats:<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-8/igt@core_getstats.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_async_flips@async-flip-suspend-resume@pipe-d-hdmi-a-3:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-7/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-hdmi-a-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-5/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-hdmi-a-3.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12229_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-1/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2385">Intel XE#2385</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-6/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-6/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328">Intel XE#2328</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-8/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-6/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-3/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-2/igt@kms_color@deep-color.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-3/igt@kms_color@deep-color.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-1/igt@kms_content_protection@atomic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715">Intel XE#2715</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-5/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-2/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@64x64-top-edge@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-4/igt@kms_cursor_edge_walk@64x64-top-edge@pipe-a-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-1/igt@kms_cursor_edge_walk@64x64-top-edge@pipe-a-dp-2.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +7 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-3/igt@kms_display_modes@extended-mode-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2425">Intel XE#2425</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-6/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-6/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb-interruptible@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-4/igt@kms_flip@2x-nonexisting-fb-interruptible@bc-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-1/igt@kms_flip@2x-nonexisting-fb-interruptible@bc-dp2-hdmi-a3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +70 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-3/igt@kms_flip@2x-plain-flip-ts-check.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +11 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-accept-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-7/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340">Intel XE#2340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-8/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-6/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-2/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501">Intel XE#2501</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-7/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-2/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571">Intel XE#2571</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-1/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-3/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-1/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391">Intel XE#2391</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-3/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-8/igt@kms_pm_rpm@cursor.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-2/igt@kms_pm_rpm@cursor.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms@plane-50:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-8/igt@kms_pm_rpm@universal-planes-dpms@plane-50.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-4/igt@kms_pm_rpm@universal-planes-dpms@plane-50.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +7 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-7/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-5/igt@kms_psr@fbc-psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3189">Intel XE#3189</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-1/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-1/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-6/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-busy@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-7/igt@kms_vblank@wait-forked-busy@pipe-a-dp-2.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +5 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-6/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-8/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-4/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@connect-user:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-5/igt@xe_eudebug@connect-user.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-8/igt@xe_evict@evict-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-5/igt@xe_evict@evict-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-3/igt@xe_exec_basic@multigpu-once-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-7/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate-race.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +9 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-5/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-1/igt@xe_gt_freq@freq_suspend.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-8/igt@xe_live_ktest@xe_mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-4/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459">Intel XE#2459</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596">Intel XE#2596</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-1/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/586">Intel XE#586</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-8/igt@xe_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-3/igt@xe_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-1/igt@xe_module_load@reload-no-display.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-5/igt@xe_module_load@reload-no-display.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-5/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248">Intel XE#2248</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-4/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">Intel XE#2427</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-5/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-8/igt@xe_pm@s2idle-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616">Intel XE#1616</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-unbind-all:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-1/igt@xe_pm@s3-vm-bind-unbind-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-3/igt@xe_pm@s3-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-4/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-1/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x128:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-128x128.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-128x128.html">PASS</a> +13 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3640">Intel XE#3640</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-6/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-7/igt@kms_flip@2x-modeset-vs-vblank-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3597">Intel XE#3597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-1/igt@kms_flip@wf_vblank-ts-check.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-6/igt@kms_flip@wf_vblank-ts-check.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-d-dp-2-size-64:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-1/igt@kms_plane_cursor@overlay@pipe-d-dp-2-size-64.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-7/igt@kms_plane_cursor@overlay@pipe-d-dp-2-size-64.html">PASS</a> +80 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-1/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-4/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-a:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-1/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-a.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-3/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-3/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-d:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-3/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-d.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-3/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-d.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-forked-busy@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-1/igt@kms_sequence@get-forked-busy@pipe-a-dp-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-4/igt@kms_sequence@get-forked-busy@pipe-a-dp-2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-7/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-hdmi-a-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-6/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-hdmi-a-3.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@once-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-8/igt@xe_exec_compute_mode@once-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-8/igt@xe_exec_compute_mode@once-rebind.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-4/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-6/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-8/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-6/igt@xe_live_ktest@xe_migrate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@unload:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-7/igt@xe_module_load@unload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-5/igt@xe_module_load@unload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-8/igt@xe_pm@s3-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-7/igt@xe_pm@s3-basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-1/igt@kms_content_protection@legacy.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715">Intel XE#2715</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-3/igt@kms_content_protection@legacy.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715">Intel XE#2715</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-3/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-7/igt@kms_content_protection@uevent.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-5/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2141">Intel XE#2141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-3/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-2.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-8/igt@kms_fbcon_fbt@fbc-suspend.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-5/igt@kms_fbcon_fbt@fbc-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695">Intel XE#1695</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +5 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3189">Intel XE#3189</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3189">Intel XE#3189</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-4/igt@kms_psr@psr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-5/igt@kms_psr@psr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3189">Intel XE#3189</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-3/igt@xe_evict@evict-beng-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-8/igt@xe_evict@evict-beng-mixed-many-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8133/shard-bmg-7/igt@xe_evict@evict-large-multi-vm-cm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12229/shard-bmg-6/igt@xe_evict@evict-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364">Intel XE#2364</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8133 -&gt; IGTPW_12229</li>
<li>Linux: xe-2302-77777471ae59ce2f0d0e74d55c60014cf02bd4df -&gt; xe-2303-26715037f44d6dd8c755dd7c3e115cf9b29782a4</li>
</ul>
<p>IGTPW_12229: 569a859f53b6b6b4089f223f26f3bd4f3cbc455a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8133: 16f2bfe294cc103df8ebb208aa2e64415262f534 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2302-77777471ae59ce2f0d0e74d55c60014cf02bd4df: 77777471ae59ce2f0d0e74d55c60014cf02bd4df<br />
  xe-2303-26715037f44d6dd8c755dd7c3e115cf9b29782a4: 26715037f44d6dd8c755dd7c3e115cf9b29782a4</p>

</body>
</html>

--===============3560177085632519852==--
