Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63DB5CCF9E9
	for <igt-dev@archiver.kernel.org>; Thu, 26 Sep 2024 06:07:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2221B10EA95;
	Thu, 26 Sep 2024 06:07:39 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AE7410EA93;
 Thu, 26 Sep 2024 06:07:37 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3005674532114638447=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeFULL=3A_failure_for_Add_forcewake_support_for_xe_?=
 =?utf-8?q?=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 26 Sep 2024 06:07:37 -0000
Message-ID: <172733085762.1104498.17863092981806190079@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240923221146.125848-1-lucas.demarchi@intel.com>
In-Reply-To: <20240923221146.125848-1-lucas.demarchi@intel.com>
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

--===============3005674532114638447==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add forcewake support for xe (rev3)
URL   : https://patchwork.freedesktop.org/series/138836/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8032_full -> XEIGTPW_11790_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11790_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11790_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11790_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-lnl:          NOTRUN -> [SKIP][1] +8 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-7/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-edp-1:
    - shard-lnl:          [PASS][2] -> [INCOMPLETE][3]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-edp-1.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-edp-1.html

  * igt@kms_pm_backlight@fade:
    - shard-dg2-set2:     NOTRUN -> [SKIP][4] +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-432/igt@kms_pm_backlight@fade.html

  * igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area@psr2-pipe-a-edp-1:
    - shard-lnl:          [PASS][5] -> [FAIL][6] +54 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-3/igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area@psr2-pipe-a-edp-1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-3/igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area@psr2-pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area@psr2-pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [FAIL][7] +1 other test fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-7/igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area@psr2-pipe-a-edp-1.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-lnl:          [PASS][8] -> [SKIP][9] +2 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-8/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  
#### Warnings ####

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [FAIL][10] ([Intel XE#1430]) -> [SKIP][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-2/igt@kms_pm_dc@dc6-psr.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     [SKIP][12] ([Intel XE#1201]) -> [SKIP][13] +40 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-464/igt@kms_psr@psr-dpms.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-432/igt@kms_psr@psr-dpms.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-lnl:          [SKIP][14] ([Intel XE#2833]) -> [SKIP][15]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-3/igt@xe_live_ktest@xe_eudebug.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-4/igt@xe_live_ktest@xe_eudebug.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - {shard-bmg}:        [SKIP][16] ([Intel XE#2370]) -> [SKIP][17]
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - {shard-bmg}:        [SKIP][18] ([Intel XE#2327]) -> [SKIP][19] +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-2/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-bmg-6/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - {shard-bmg}:        [PASS][20] -> [SKIP][21] +143 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-bmg-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - {shard-bmg}:        [FAIL][22] ([Intel XE#1659]) -> [SKIP][23]
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-bmg-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - {shard-bmg}:        [SKIP][24] ([Intel XE#607]) -> [SKIP][25]
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-bmg-6/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - {shard-bmg}:        [SKIP][26] ([Intel XE#1124]) -> [SKIP][27] +13 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-bmg-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
    - {shard-bmg}:        [SKIP][28] ([Intel XE#367]) -> [SKIP][29] +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-bmg-6/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - {shard-bmg}:        [SKIP][30] ([Intel XE#2652] / [Intel XE#787]) -> [SKIP][31]
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-4/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-bmg-6/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_content_protection@atomic-dpms:
    - {shard-bmg}:        [FAIL][32] ([Intel XE#1178]) -> [SKIP][33]
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-4/igt@kms_content_protection@atomic-dpms.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-bmg-6/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - {shard-bmg}:        [SKIP][34] ([Intel XE#2390]) -> [SKIP][35]
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-2/igt@kms_content_protection@dp-mst-lic-type-0.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-bmg-6/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - {shard-bmg}:        [SKIP][36] ([Intel XE#2320]) -> [SKIP][37] +5 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-4/igt@kms_cursor_crc@cursor-onscreen-128x42.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - {shard-bmg}:        [DMESG-WARN][38] ([Intel XE#877]) -> [SKIP][39]
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@single-bo:
    - {shard-bmg}:        [PASS][40] -> [INCOMPLETE][41] +3 other tests incomplete
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-3/igt@kms_cursor_legacy@single-bo.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-bmg-1/igt@kms_cursor_legacy@single-bo.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - {shard-bmg}:        [FAIL][42] ([Intel XE#2141]) -> [SKIP][43]
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-4/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-bmg-6/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dsc@dsc-with-output-formats:
    - {shard-bmg}:        [SKIP][44] ([Intel XE#2244]) -> [SKIP][45] +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-2/igt@kms_dsc@dsc-with-output-formats.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-bmg-6/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_fbcon_fbt@psr:
    - {shard-bmg}:        [SKIP][46] ([Intel XE#776]) -> [SKIP][47]
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-5/igt@kms_fbcon_fbt@psr.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-bmg-6/igt@kms_fbcon_fbt@psr.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - {shard-bmg}:        [SKIP][48] ([Intel XE#2380]) -> [SKIP][49] +6 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt:
    - {shard-bmg}:        [SKIP][50] ([Intel XE#2312]) -> [SKIP][51] +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - {shard-bmg}:        [SKIP][52] ([Intel XE#2311]) -> [SKIP][53] +37 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render:
    - {shard-bmg}:        NOTRUN -> [FAIL][54]
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - {shard-bmg}:        [FAIL][55] ([Intel XE#2333]) -> [SKIP][56] +9 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-linear:
    - {shard-bmg}:        [FAIL][57] -> [SKIP][58] +12 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - {shard-bmg}:        [SKIP][59] ([Intel XE#2313]) -> [SKIP][60] +37 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_plane_lowres@tiling-y:
    - {shard-bmg}:        [SKIP][61] ([Intel XE#2393]) -> [SKIP][62]
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-5/igt@kms_plane_lowres@tiling-y.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-bmg-6/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@tiling-y:
    - {shard-bmg}:        [SKIP][63] ([Intel XE#2493]) -> [SKIP][64]
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-5/igt@kms_plane_multiple@tiling-y.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-bmg-6/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - {shard-bmg}:        [SKIP][65] ([Intel XE#2329]) -> [SKIP][66] +2 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-2/igt@kms_rotation_crc@bad-pixel-format.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-bmg-6/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - {shard-bmg}:        [SKIP][67] ([Intel XE#2413]) -> [SKIP][68]
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-full.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-bmg-6/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_vrr@flipline:
    - {shard-bmg}:        [SKIP][69] ([Intel XE#1499]) -> [SKIP][70] +2 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-8/igt@kms_vrr@flipline.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-bmg-6/igt@kms_vrr@flipline.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - {shard-bmg}:        NOTRUN -> [SKIP][71] +52 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-bmg-8/igt@xe_exec_basic@multigpu-once-null-rebind.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_11790_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_atomic_transition@modeset-transition-nonblocking:
    - shard-lnl:          [PASS][72] -> [FAIL][73] ([Intel XE#1701]) +1 other test fail
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-7/igt@kms_atomic_transition@modeset-transition-nonblocking.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-4/igt@kms_atomic_transition@modeset-transition-nonblocking.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:
    - shard-lnl:          [PASS][74] -> [FAIL][75] ([Intel XE#1426]) +1 other test fail
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-lnl:          [PASS][76] -> [FAIL][77] ([Intel XE#1659])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-8/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-8/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#1407])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-8/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][79] ([Intel XE#1201] / [Intel XE#316])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-463/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][80] ([Intel XE#1124])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#1124]) +1 other test skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#1124] / [Intel XE#1201]) +2 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-435/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#1201] / [Intel XE#787]) +13 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-433/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-466/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#1201] / [Intel XE#1252])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_chamelium_edid@hdmi-mode-timings:
    - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#373])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-432/igt@kms_chamelium_edid@hdmi-mode-timings.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#373]) +2 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-8/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#1201] / [Intel XE#373]) +3 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#455])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-random-256x85:
    - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#1424])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-4/igt@kms_cursor_crc@cursor-random-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#1201] / [Intel XE#455])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-lnl:          [PASS][93] -> [SKIP][94] ([Intel XE#1508])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-8/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][95] -> [FAIL][96] ([Intel XE#886]) +2 other tests fail
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-466/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ab-hdmi-a6-dp4.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-434/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ab-hdmi-a6-dp4.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1:
    - shard-lnl:          [PASS][97] -> [FAIL][98] ([Intel XE#886]) +4 other tests fail
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-3/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-5/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#1401] / [Intel XE#1745])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#1401])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#1397] / [Intel XE#1745])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#1397])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#656]) +7 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#651])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#1201] / [Intel XE#651]) +7 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#651]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#1201] / [Intel XE#653]) +8 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [PASS][108] -> [SKIP][109] ([Intel XE#1201] / [Intel XE#455])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-435/igt@kms_hdr@invalid-hdr.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-lnl:          [PASS][110] -> [INCOMPLETE][111] ([Intel XE#2622])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-1/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-1/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_plane@plane-position-covered:
    - shard-lnl:          [PASS][112] -> [DMESG-FAIL][113] ([Intel XE#324]) +3 other tests dmesg-fail
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-4/igt@kms_plane@plane-position-covered.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-2/igt@kms_plane@plane-position-covered.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:
    - shard-lnl:          [PASS][114] -> [DMESG-WARN][115] ([Intel XE#324]) +7 other tests dmesg-warn
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-4/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-3/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html

  * igt@kms_psr@fbc-psr2-cursor-render@edp-1:
    - shard-lnl:          [PASS][116] -> [FAIL][117] ([Intel XE#1649]) +111 other tests fail
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-5/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-2/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-lnl:          NOTRUN -> [FAIL][118] ([Intel XE#1649]) +5 other tests fail
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-2/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@pr-sprite-blt:
    - shard-lnl:          NOTRUN -> [SKIP][119] ([Intel XE#1406])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-3/igt@kms_psr@pr-sprite-blt.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][120] -> [FAIL][121] ([Intel XE#2159]) +1 other test fail
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-lnl:          [PASS][122] -> [FAIL][123] ([Intel XE#2443]) +1 other test fail
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-8/igt@kms_vrr@flip-basic-fastset.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-1/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@lobf@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [FAIL][124] ([Intel XE#2443]) +1 other test fail
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-4/igt@kms_vrr@lobf@pipe-a-edp-1.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#1201] / [Intel XE#756])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-434/igt@kms_writeback@writeback-fb-id.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [PASS][126] -> [TIMEOUT][127] ([Intel XE#1473] / [Intel XE#402])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-dg2-set2:     NOTRUN -> [FAIL][128] ([Intel XE#1600])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-436/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     [PASS][129] -> [TIMEOUT][130] ([Intel XE#1473]) +1 other test timeout
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-464/igt@xe_evict@evict-mixed-many-threads-small.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_fault_mode@twice-basic-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][131] ([Intel XE#1201] / [Intel XE#288])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-434/igt@xe_exec_fault_mode@twice-basic-prefetch.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-dg2-set2:     [PASS][132] -> [TIMEOUT][133] ([Intel XE#2105])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-436/igt@xe_exec_reset@parallel-gt-reset.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-435/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-lnl:          [PASS][134] -> [ABORT][135] ([Intel XE#1607] / [Intel XE#1794])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-5/igt@xe_pm@s4-vm-bind-prefetch.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     NOTRUN -> [SKIP][136] ([Intel XE#1201]) +10 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-463/igt@xe_query@multigpu-query-engines.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotreplug-lateclose:
    - {shard-bmg}:        [ABORT][137] -> [PASS][138]
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-6/igt@core_hotunplug@hotreplug-lateclose.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-bmg-7/igt@core_hotunplug@hotreplug-lateclose.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - {shard-bmg}:        [FAIL][139] ([Intel XE#1426]) -> [PASS][140] +1 other test pass
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-2/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-bmg-7/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - {shard-bmg}:        [INCOMPLETE][141] -> [PASS][142]
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-8/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-bmg-3/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          [FAIL][143] ([Intel XE#1659]) -> [PASS][144]
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-d-hdmi-a-3:
    - {shard-bmg}:        [DMESG-WARN][145] ([Intel XE#877]) -> [PASS][146] +2 other tests pass
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-4/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-d-hdmi-a-3.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-bmg-2/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1:
    - shard-lnl:          [INCOMPLETE][147] ([Intel XE#1616]) -> [PASS][148] +1 other test pass
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-4/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-8/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html

  * igt@kms_display_modes@extended-mode-basic:
    - {shard-bmg}:        [SKIP][149] ([Intel XE#2425]) -> [PASS][150]
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-bmg-8/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - {shard-bmg}:        [SKIP][151] -> [PASS][152] +5 other tests pass
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-lnl:          [FAIL][153] ([Intel XE#886]) -> [PASS][154] +4 other tests pass
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-1/igt@kms_flip@blocking-wf_vblank.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-8/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a3:
    - {shard-bmg}:        [DMESG-WARN][155] -> [PASS][156] +5 other tests pass
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-6/igt@kms_flip@flip-vs-suspend@b-hdmi-a3.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-bmg-2/igt@kms_flip@flip-vs-suspend@b-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     [INCOMPLETE][157] ([Intel XE#1195]) -> [PASS][158] +1 other test pass
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-valid-mode.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-valid-mode.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-1:
    - shard-lnl:          [DMESG-WARN][159] ([Intel XE#324]) -> [PASS][160] +1 other test pass
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-4/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-1.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-3/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-1.html

  * igt@kms_plane@plane-position-hole@pipe-a-plane-4:
    - shard-lnl:          [DMESG-FAIL][161] ([Intel XE#324]) -> [PASS][162] +1 other test pass
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-3/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     [FAIL][163] ([Intel XE#616]) -> [PASS][164] +3 other tests pass
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-433/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-433/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [FAIL][165] -> [PASS][166]
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-2/igt@kms_pm_dc@dc5-dpms.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - {shard-bmg}:        [TIMEOUT][167] ([Intel XE#1473] / [Intel XE#2472]) -> [PASS][168]
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - {shard-bmg}:        [DMESG-WARN][169] ([Intel XE#569]) -> [PASS][170]
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-6/igt@xe_pm@s3-vm-bind-userptr.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-bmg-2/igt@xe_pm@s3-vm-bind-userptr.html
    - shard-dg2-set2:     [INCOMPLETE][171] ([Intel XE#1195] / [Intel XE#569]) -> [PASS][172]
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-464/igt@xe_pm@s3-vm-bind-userptr.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-434/igt@xe_pm@s3-vm-bind-userptr.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          [ABORT][173] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][174]
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-2/igt@xe_pm@s4-basic.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-3/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-lnl:          [ABORT][175] ([Intel XE#1794]) -> [PASS][176]
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-4/igt@xe_pm@s4-vm-bind-userptr.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][177] ([Intel XE#316]) -> [SKIP][178] ([Intel XE#1201] / [Intel XE#316]) +4 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-464/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-dg2-set2:     [SKIP][179] ([Intel XE#619]) -> [SKIP][180] ([Intel XE#1201] / [Intel XE#619])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][181] ([Intel XE#610]) -> [SKIP][182] ([Intel XE#1201] / [Intel XE#610])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][183] ([Intel XE#1124]) -> [SKIP][184] ([Intel XE#1124] / [Intel XE#1201]) +4 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-435/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-dg2-set2:     [SKIP][185] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][186] ([Intel XE#1124]) +6 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][187] ([Intel XE#367]) -> [SKIP][188] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-463/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][189] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][190] ([Intel XE#367]) +1 other test skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-466/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][191] ([Intel XE#1201] / [Intel XE#2191]) -> [SKIP][192] ([Intel XE#2191])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-464/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][193] ([Intel XE#2191]) -> [SKIP][194] ([Intel XE#1201] / [Intel XE#2191]) +1 other test skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][195] ([Intel XE#787]) -> [SKIP][196] ([Intel XE#1201] / [Intel XE#787]) +76 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-436/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][197] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][198] ([Intel XE#787]) +41 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-434/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-432/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][199] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][200] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +21 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][201] ([Intel XE#1201] / [Intel XE#1252]) -> [SKIP][202] ([Intel XE#1252])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][203] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][204] ([Intel XE#455] / [Intel XE#787]) +11 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     [SKIP][205] ([Intel XE#1152] / [Intel XE#1201]) -> [SKIP][206] ([Intel XE#1152]) +3 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-435/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-dg2-set2:     [SKIP][207] ([Intel XE#306]) -> [SKIP][208] ([Intel XE#1201] / [Intel XE#306])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_chamelium_color@ctm-0-25.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-463/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm:
    - shard-dg2-set2:     [SKIP][209] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][210] ([Intel XE#373]) +5 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd-storm.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-storm.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     [SKIP][211] ([Intel XE#373]) -> [SKIP][212] ([Intel XE#1201] / [Intel XE#373]) +5 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-436/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     [SKIP][213] ([Intel XE#307]) -> [SKIP][214] ([Intel XE#1201] / [Intel XE#307])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-0.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-463/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2-set2:     [SKIP][215] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][216] ([Intel XE#307])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-434/igt@kms_content_protection@dp-mst-lic-type-1.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@lic-type-1:
    - shard-dg2-set2:     [SKIP][217] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][218] ([Intel XE#455]) +6 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-463/igt@kms_content_protection@lic-type-1.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-432/igt@kms_content_protection@lic-type-1.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     [SKIP][219] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][220] ([Intel XE#308])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg2-set2:     [SKIP][221] ([Intel XE#308]) -> [SKIP][222] ([Intel XE#1201] / [Intel XE#308])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     [SKIP][223] ([Intel XE#455]) -> [SKIP][224] ([Intel XE#1201] / [Intel XE#455]) +20 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2-set2:     [SKIP][225] ([Intel XE#1201] / [i915#5274]) -> [SKIP][226] ([i915#5274])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-433/igt@kms_force_connector_basic@prune-stale-modes.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-432/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][227] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][228] ([Intel XE#651]) +17 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][229] ([Intel XE#651]) -> [SKIP][230] ([Intel XE#1201] / [Intel XE#651]) +19 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     [SKIP][231] ([Intel XE#1201]) -> [SKIP][232] ([Intel XE#1201] / [Intel XE#658]) +2 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     [SKIP][233] ([Intel XE#1158] / [Intel XE#1201]) -> [SKIP][234] ([Intel XE#1158])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-463/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-432/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][235] ([Intel XE#653]) -> [SKIP][236] ([Intel XE#1201] / [Intel XE#653]) +18 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][237] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][238] ([Intel XE#653]) +20 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2-set2:     [SKIP][239] ([Intel XE#1201] / [Intel XE#605]) -> [SKIP][240] ([Intel XE#605])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-433/igt@kms_getfb@getfb-reject-ccs.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-432/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_psr@psr-cursor-plane-move:
    - shard-dg2-set2:     [SKIP][241] ([Intel XE#2850]) -> [SKIP][242] ([Intel XE#1201] / [Intel XE#2850])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_psr@psr-cursor-plane-move.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-464/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-dg2-set2:     [SKIP][243] ([Intel XE#327]) -> [SKIP][244] ([Intel XE#1201] / [Intel XE#327]) +1 other test skip
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_rotation_crc@bad-pixel-format.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-433/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2-set2:     [SKIP][245] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][246] ([Intel XE#327]) +1 other test skip
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-433/igt@kms_rotation_crc@bad-tiling.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-432/igt@kms_rotation_crc@bad-tiling.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2-set2:     [SKIP][247] ([Intel XE#2849]) -> [SKIP][248] ([Intel XE#1201] / [Intel XE#2849])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-463/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind:
    - shard-dg2-set2:     [SKIP][249] ([Intel XE#288]) -> [SKIP][250] ([Intel XE#1201] / [Intel XE#288]) +2 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-436/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:
    - shard-dg2-set2:     [SKIP][251] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][252] ([Intel XE#288]) +3 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][253] -> [SKIP][254] ([Intel XE#1201]) +40 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_mmap@small-bar:
    - shard-dg2-set2:     [SKIP][255] ([Intel XE#512]) -> [SKIP][256] ([Intel XE#1201] / [Intel XE#512])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@xe_mmap@small-bar.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-463/igt@xe_mmap@small-bar.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     [SKIP][257] ([Intel XE#1337]) -> [SKIP][258] ([Intel XE#1201] / [Intel XE#1337])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@xe_pat@display-vs-wb-transient.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-436/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     [SKIP][259] ([Intel XE#1201]) -> [SKIP][260] ([Intel XE#1201] / [Intel XE#977])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-466/igt@xe_pat@pat-index-xe2.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-464/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     [SKIP][261] ([Intel XE#1201] / [Intel XE#2838]) -> [SKIP][262] ([Intel XE#2838])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-466/igt@xe_pat@pat-index-xehpc.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-432/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][263] ([Intel XE#1201] / [Intel XE#366]) -> [SKIP][264] ([Intel XE#366])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-464/igt@xe_pm@d3cold-basic-exec.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-432/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-dg2-set2:     [SKIP][265] ([Intel XE#366]) -> [SKIP][266] ([Intel XE#1201] / [Intel XE#366]) +1 other test skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@xe_pm@d3cold-mmap-system.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-463/igt@xe_pm@d3cold-mmap-system.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
  [Intel XE#1649]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2141
  [Intel XE#2159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2329
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2425
  [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2622]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2622
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2690]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2690
  [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274


Build changes
-------------

  * IGT: IGT_8032 -> IGTPW_11790
  * Linux: xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47 -> xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b

  IGTPW_11790: 11790
  IGT_8032: 8032
  xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47: abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47
  xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b: 88d592f72f7bc508d6a027b1f96aa2e53f803e1b

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/index.html

--===============3005674532114638447==
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
<tr><td><b>Series:</b></td><td>Add forcewake support for xe (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138836/">https://patchwork.freedesktop.org/series/138836/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8032_full -&gt; XEIGTPW_11790_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11790_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11790_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11790_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-7/igt@kms_flip@2x-dpms-vs-vblank-race.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-edp-1.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-432/igt@kms_pm_backlight@fade.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area@psr2-pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-3/igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area@psr2-pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-3/igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area@psr2-pipe-a-edp-1.html">FAIL</a> +54 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area@psr2-pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-7/igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area@psr2-pipe-a-edp-1.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-8/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-2/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-464/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-432/igt@kms_psr@psr-dpms.html">SKIP</a> +40 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-3/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833">Intel XE#2833</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-4/igt@xe_live_ktest@xe_eudebug.html">SKIP</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-2/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-bmg-6/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-bmg-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> +143 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-bmg-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-bmg-6/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-bmg-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-bmg-6/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-4/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-bmg-6/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-4/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-bmg-6/igt@kms_content_protection@atomic-dpms.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-2/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-bmg-6/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-4/igt@kms_cursor_crc@cursor-onscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-128x42.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-bo:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-3/igt@kms_cursor_legacy@single-bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-bmg-1/igt@kms_cursor_legacy@single-bo.html">INCOMPLETE</a> +3 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-4/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2141">Intel XE#2141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-bmg-6/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-2/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-bmg-6/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-5/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-bmg-6/igt@kms_fbcon_fbt@psr.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> +37 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-linear:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html">SKIP</a> +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SKIP</a> +37 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-5/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-bmg-6/igt@kms_plane_lowres@tiling-y.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-5/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel XE#2493</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-bmg-6/igt@kms_plane_multiple@tiling-y.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-2/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2329">Intel XE#2329</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-bmg-6/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-bmg-6/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-8/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-bmg-6/igt@kms_vrr@flipline.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-bmg-8/igt@xe_exec_basic@multigpu-once-null-rebind.html">SKIP</a> +52 other tests skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11790_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-7/igt@kms_atomic_transition@modeset-transition-nonblocking.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-4/igt@kms_atomic_transition@modeset-transition-nonblocking.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#1701</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-8/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-8/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-8/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-463/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-435/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-433/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-466/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-mode-timings:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-432/igt@kms_chamelium_edid@hdmi-mode-timings.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-8/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-4/igt@kms_cursor_crc@cursor-random-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-8/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-466/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ab-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-434/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ab-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-3/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-5/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-463/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-435/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-1/igt@kms_pipe_crc_basic@suspend-read-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-1/igt@kms_pipe_crc_basic@suspend-read-crc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2622">Intel XE#2622</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-4/igt@kms_plane@plane-position-covered.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-2/igt@kms_plane@plane-position-covered.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +3 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-4/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-3/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +7 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-render@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-5/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-2/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649">Intel XE#1649</a>) +111 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-2/igt@kms_psr@fbc-psr2-sprite-plane-move.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649">Intel XE#1649</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-3/igt@kms_psr@pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159">Intel XE#2159</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-8/igt@kms_vrr@flip-basic-fastset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-1/igt@kms_vrr@flip-basic-fastset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-4/igt@kms_vrr@lobf@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-434/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-436/igt@xe_evict@evict-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-464/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-basic-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-434/igt@xe_exec_fault_mode@twice-basic-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-436/igt@xe_exec_reset@parallel-gt-reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-435/igt@xe_exec_reset@parallel-gt-reset.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105">Intel XE#2105</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-5/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-463/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +10 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-6/igt@core_hotunplug@hotreplug-lateclose.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-bmg-7/igt@core_hotunplug@hotreplug-lateclose.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-2/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-bmg-7/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-8/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-bmg-3/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-4/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-d-hdmi-a-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-bmg-2/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-d-hdmi-a-3.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-4/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616">Intel XE#1616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-8/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2425">Intel XE#2425</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-bmg-8/igt@kms_display_modes@extended-mode-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-1/igt@kms_flip@blocking-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-8/igt@kms_flip@blocking-wf_vblank.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-6/igt@kms_flip@flip-vs-suspend@b-hdmi-a3.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-bmg-2/igt@kms_flip@flip-vs-suspend@b-hdmi-a3.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-valid-mode.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-valid-mode.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-4/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-3/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-a-plane-4:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-3/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-433/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-433/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-2/igt@kms_pm_dc@dc5-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472">Intel XE#2472</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-6/igt@xe_pm@s3-vm-bind-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-bmg-2/igt@xe_pm@s3-vm-bind-userptr.html">PASS</a></li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-464/igt@xe_pm@s3-vm-bind-userptr.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-434/igt@xe_pm@s3-vm-bind-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-2/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-3/igt@xe_pm@s4-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-lnl-4/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-464/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-435/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-463/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-466/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-464/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-436/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +76 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-434/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-432/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-435/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-463/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd-storm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-storm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-436/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-463/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-434/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-463/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-432/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-433/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-432/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-463/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158">Intel XE#1158</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-432/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158">Intel XE#1158</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-433/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-432/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-464/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-433/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-433/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-432/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-463/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-436/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +40 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-463/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-436/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-466/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-464/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-466/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-432/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-464/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-432/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11790/shard-dg2-463/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8032 -&gt; IGTPW_11790</li>
<li>Linux: xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47 -&gt; xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b</li>
</ul>
<p>IGTPW_11790: 11790<br />
  IGT_8032: 8032<br />
  xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47: abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47<br />
  xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b: 88d592f72f7bc508d6a027b1f96aa2e53f803e1b</p>

</body>
</html>

--===============3005674532114638447==--
