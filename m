Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF64C43458
	for <igt-dev@archiver.kernel.org>; Fri, 10 Jul 2026 20:19:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68E5989B66;
	Fri, 10 Jul 2026 20:19:28 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E803310F96E;
 Fri, 10 Jul 2026 20:18:58 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2057157281019752657=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_tests/kms=5Fforce=5Fconnec?=
 =?utf-8?q?tor=5Fbasic=3A_fix_force-connector-state_for_HDMI_2=2E1?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sowmiya S" <sowmiya.s@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 10 Jul 2026 20:18:58 -0000
Message-ID: <178371473893.175489.8762316528222770332@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260710101924.2741256-1-sowmiya.s@intel.com>
In-Reply-To: <20260710101924.2741256-1-sowmiya.s@intel.com>
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

--===============2057157281019752657==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_force_connector_basic: fix force-connector-state for HDMI 2.1
URL   : https://patchwork.freedesktop.org/series/170186/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_9000_FULL -> XEIGTPW_15510_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_15510_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_15510_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_15510_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4:
    - shard-bmg:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9000/shard-bmg-7/igt@kms_color_pipeline@plane-lut1d-ctm3x4.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-bmg-10/igt@kms_color_pipeline@plane-lut1d-ctm3x4.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_15510_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          [PASS][3] -> [FAIL][4] ([Intel XE#3718] / [Intel XE#6078])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9000/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-3:
    - shard-bmg:          [PASS][5] -> [FAIL][6] ([Intel XE#6078]) +1 other test fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9000/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-3.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-3.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#1407])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-lnl-7/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#1124]) +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-lnl-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#1124]) +2 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-bmg-10/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#610] / [Intel XE#7387])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-bmg-8/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_bw@linear-tiling-2-displays-target-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#367])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-bmg-4/igt@kms_bw@linear-tiling-2-displays-target-1920x1080p.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#2887]) +3 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-lnl-3/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-yf-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2887]) +2 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-bmg-8/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#2669] / [Intel XE#7389]) +3 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-lnl-1/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#7358]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-bmg-6/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
    - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#373])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-lnl-7/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html

  * igt@kms_chamelium_frames@dp-crc-multiple:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2252]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-bmg-5/igt@kms_chamelium_frames@dp-crc-multiple.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2390] / [Intel XE#6974])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-bmg-6/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2321] / [Intel XE#7355])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-bmg-9/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#309] / [Intel XE#7343]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-lnl-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#4294] / [Intel XE#7477])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-lnl-5/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-with-output-formats-bigjoiner:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#8265]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-bmg-7/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#8265])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-lnl-8/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [PASS][24] -> [FAIL][25] ([Intel XE#301]) +1 other test fail
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9000/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#7178] / [Intel XE#7349])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2311]) +13 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#7061] / [Intel XE#7356])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@drrshdr-1p-offscreen-pri-shrfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#6312]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-lnl-5/igt@kms_frontbuffer_tracking@drrshdr-1p-offscreen-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#7061]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-lnl-4/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#4141]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#656] / [Intel XE#7905]) +8 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#7061] / [Intel XE#7356])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#6312] / [Intel XE#651]) +2 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-spr-indfb-move:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#7905]) +8 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#7061])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@hdr-rgb565-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#7865]) +7 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-lnl-8/igt@kms_frontbuffer_tracking@hdr-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-move:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2313]) +20 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-bmg-7/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-move.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#7308])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-bmg-6/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#6911] / [Intel XE#7378])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-bmg-4/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#7283])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-bmg-4/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-a-plane-5:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#8303]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-lnl-1/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-a-plane-5.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#2763] / [Intel XE#6886]) +7 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-lnl-1/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c.html

  * igt@kms_pm_dc@dc3co-vpb-simulation@pr:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#8395]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-bmg-5/igt@kms_pm_dc@dc3co-vpb-simulation@pr.html

  * igt@kms_pm_dc@dc3co-vpb-simulation@psr2:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#8396])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-bmg-5/igt@kms_pm_dc@dc3co-vpb-simulation@psr2.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [PASS][46] -> [FAIL][47] ([Intel XE#8399])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9000/shard-lnl-1/igt@kms_pm_dc@dc6-psr.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-lnl-5/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#2893] / [Intel XE#7304])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-lnl-6/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#1489]) +3 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-psr2-basic:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#1406] / [Intel XE#7345])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-lnl-4/igt@kms_psr@fbc-psr2-basic.html

  * igt@kms_psr@fbc-psr2-basic@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#1406] / [Intel XE#4609])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-lnl-4/igt@kms_psr@fbc-psr2-basic@edp-1.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-bmg-10/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-lnl:          [PASS][53] -> [SKIP][54] ([Intel XE#8361])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9000/shard-lnl-7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-lnl-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-lnl-5/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@xe_evict@evict-small-multi-queue-cm:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#6540] / [Intel XE#688]) +2 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-lnl-6/igt@xe_evict@evict-small-multi-queue-cm.html

  * igt@xe_evict@evict-small-multi-queue-priority-cm:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#8370])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-bmg-1/igt@xe_evict@evict-small-multi-queue-priority-cm.html

  * igt@xe_exec_balancer@no-exec-parallel-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#7482]) +4 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-lnl-3/igt@xe_exec_balancer@no-exec-parallel-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2322] / [Intel XE#7372]) +2 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#1392]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-lnl-3/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-multi-queue-userptr-imm:
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#8374]) +3 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-lnl-7/igt@xe_exec_fault_mode@many-multi-queue-userptr-imm.html

  * igt@xe_exec_fault_mode@once-multi-queue-userptr-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#8374])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-bmg-5/igt@xe_exec_fault_mode@once-multi-queue-userptr-prefetch.html

  * igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-close-fd-smem:
    - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#8364]) +6 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-lnl-8/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-close-fd-smem.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#8364]) +5 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-bmg-10/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority.html

  * igt@xe_exec_reset@multi-queue-cat-error:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#8369])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-lnl-2/igt@xe_exec_reset@multi-queue-cat-error.html

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-new-race:
    - shard-bmg:          [PASS][66] -> [ABORT][67] ([Intel XE#8007])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9000/shard-bmg-1/igt@xe_exec_system_allocator@many-large-execqueues-mmap-new-race.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-bmg-7/igt@xe_exec_system_allocator@many-large-execqueues-mmap-new-race.html
    - shard-lnl:          [PASS][68] -> [ABORT][69] ([Intel XE#8007])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9000/shard-lnl-4/igt@xe_exec_system_allocator@many-large-execqueues-mmap-new-race.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-lnl-2/igt@xe_exec_system_allocator@many-large-execqueues-mmap-new-race.html

  * igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#8378]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-lnl-1/igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr.html

  * igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#8378]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr-invalidate-race.html

  * igt@xe_mmap@small-bar:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#586] / [Intel XE#7323] / [Intel XE#7384])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-bmg-6/igt@xe_mmap@small-bar.html

  * igt@xe_non_msix@walker-interrupt-notification-non-msix:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#7622])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-lnl-6/igt@xe_non_msix@walker-interrupt-notification-non-msix.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#944])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-lnl-2/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:
    - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#4130] / [Intel XE#7366])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-lnl-2/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html

  * igt@xe_sriov_flr@flr-twice:
    - shard-bmg:          [PASS][76] -> [FAIL][77] ([Intel XE#6569])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9000/shard-bmg-10/igt@xe_sriov_flr@flr-twice.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-bmg-9/igt@xe_sriov_flr@flr-twice.html

  * igt@xe_sriov_scheduling@equal-throughput-low-priority:
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#8339])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-lnl-3/igt@xe_sriov_scheduling@equal-throughput-low-priority.html

  * igt@xe_wedged@basic-wedged:
    - shard-lnl:          [PASS][79] -> [ABORT][80] ([Intel XE#3119])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9000/shard-lnl-2/igt@xe_wedged@basic-wedged.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-lnl-3/igt@xe_wedged@basic-wedged.html

  
#### Possible fixes ####

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][81] ([Intel XE#7084] / [Intel XE#8150]) -> [PASS][82] +1 other test pass
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9000/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_flip@flip-vs-expired-vblank@c-dp2:
    - shard-bmg:          [FAIL][83] ([Intel XE#3321]) -> [PASS][84] +1 other test pass
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9000/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank@c-dp2.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-bmg-9/igt@kms_flip@flip-vs-expired-vblank@c-dp2.html

  * igt@xe_exec_threads@threads-fd-userptr:
    - shard-bmg:          [ABORT][85] ([Intel XE#8007]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9000/shard-bmg-2/igt@xe_exec_threads@threads-fd-userptr.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-bmg-9/igt@xe_exec_threads@threads-fd-userptr.html

  
#### Warnings ####

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][87] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][88] ([Intel XE#3544])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9000/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3119]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3119
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308
  [Intel XE#7323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7323
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7366
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7378
  [Intel XE#7384]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7384
  [Intel XE#7387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387
  [Intel XE#7389]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389
  [Intel XE#7477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7477
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7622]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7622
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8303]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303
  [Intel XE#8339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8339
  [Intel XE#8361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8361
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395
  [Intel XE#8396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396
  [Intel XE#8399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_9000 -> IGTPW_15510

  IGTPW_15510: 15510
  IGT_9000: 9000
  xe-5381-b9fb5de18ad076d077d7b45a3722cfb468ead956: b9fb5de18ad076d077d7b45a3722cfb468ead956

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/index.html

--===============2057157281019752657==
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
<tr><td><b>Series:</b></td><td>tests/kms_force_connector_basic: fix force-connector-state for HDMI 2.1</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/170186/">https://patchwork.freedesktop.org/series/170186/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9000_FULL -&gt; XEIGTPW_15510_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_15510_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_15510_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_15510_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_color_pipeline@plane-lut1d-ctm3x4:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9000/shard-bmg-7/igt@kms_color_pipeline@plane-lut1d-ctm3x4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-bmg-10/igt@kms_color_pipeline@plane-lut1d-ctm3x4.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15510_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9000/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9000/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-lnl-7/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-lnl-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-bmg-10/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-bmg-8/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387">Intel XE#7387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-bmg-4/igt@kms_bw@linear-tiling-2-displays-target-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-lnl-3/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-bmg-8/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-lnl-1/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389">Intel XE#7389</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-bmg-6/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-lnl-7/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-multiple:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-bmg-5/igt@kms_chamelium_frames@dp-crc-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-bmg-6/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-bmg-9/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-lnl-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-lnl-5/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294">Intel XE#4294</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7477">Intel XE#7477</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-bigjoiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-bmg-7/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-lnl-8/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9000/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE#7349</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-offscreen-pri-shrfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-lnl-5/igt@kms_frontbuffer_tracking@drrshdr-1p-offscreen-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-lnl-4/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-rgb565-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-lnl-8/igt@kms_frontbuffer_tracking@hdr-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-bmg-7/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-bmg-6/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308">Intel XE#7308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-bmg-4/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911">Intel XE#6911</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7378">Intel XE#7378</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-bmg-4/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-a-plane-5:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-lnl-1/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-a-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303">Intel XE#8303</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-lnl-1/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation@pr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-bmg-5/igt@kms_pm_dc@dc3co-vpb-simulation@pr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395">Intel XE#8395</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation@psr2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-bmg-5/igt@kms_pm_dc@dc3co-vpb-simulation@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9000/shard-lnl-1/igt@kms_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-lnl-5/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399">Intel XE#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-lnl-6/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-lnl-4/igt@kms_psr@fbc-psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-basic@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-lnl-4/igt@kms_psr@fbc-psr2-basic@edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609">Intel XE#4609</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-bmg-10/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9000/shard-lnl-7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-lnl-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8361">Intel XE#8361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-lnl-5/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue-cm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-lnl-6/igt@xe_evict@evict-small-multi-queue-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue-priority-cm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-bmg-1/igt@xe_evict@evict-small-multi-queue-priority-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370">Intel XE#8370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-parallel-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-lnl-3/igt@xe_exec_balancer@no-exec-parallel-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-lnl-3/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-userptr-imm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-lnl-7/igt@xe_exec_fault_mode@many-multi-queue-userptr-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-userptr-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-bmg-5/igt@xe_exec_fault_mode@once-multi-queue-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-close-fd-smem:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-lnl-8/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-close-fd-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-bmg-10/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-cat-error:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-lnl-2/igt@xe_exec_reset@multi-queue-cat-error.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-new-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9000/shard-bmg-1/igt@xe_exec_system_allocator@many-large-execqueues-mmap-new-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-bmg-7/igt@xe_exec_system_allocator@many-large-execqueues-mmap-new-race.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9000/shard-lnl-4/igt@xe_exec_system_allocator@many-large-execqueues-mmap-new-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-lnl-2/igt@xe_exec_system_allocator@many-large-execqueues-mmap-new-race.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-lnl-1/igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-bmg-6/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/586">Intel XE#586</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7323">Intel XE#7323</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7384">Intel XE#7384</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_non_msix@walker-interrupt-notification-non-msix:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-lnl-6/igt@xe_non_msix@walker-interrupt-notification-non-msix.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7622">Intel XE#7622</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-lnl-2/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-lnl-2/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7366">Intel XE#7366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-twice:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9000/shard-bmg-10/igt@xe_sriov_flr@flr-twice.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-bmg-9/igt@xe_sriov_flr@flr-twice.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel XE#6569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput-low-priority:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-lnl-3/igt@xe_sriov_scheduling@equal-throughput-low-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8339">Intel XE#8339</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9000/shard-lnl-2/igt@xe_wedged@basic-wedged.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-lnl-3/igt@xe_wedged@basic-wedged.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3119">Intel XE#3119</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9000/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9000/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank@c-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-bmg-9/igt@kms_flip@flip-vs-expired-vblank@c-dp2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-fd-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9000/shard-bmg-2/igt@xe_exec_threads@threads-fd-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-bmg-9/igt@xe_exec_threads@threads-fd-userptr.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_hdr@brightness-with-hdr:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9000/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15510/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9000 -&gt; IGTPW_15510</li>
</ul>
<p>IGTPW_15510: 15510<br />
  IGT_9000: 9000<br />
  xe-5381-b9fb5de18ad076d077d7b45a3722cfb468ead956: b9fb5de18ad076d077d7b45a3722cfb468ead956</p>

</body>
</html>

--===============2057157281019752657==--
