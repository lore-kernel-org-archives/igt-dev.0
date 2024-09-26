Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B39CCFA15
	for <igt-dev@archiver.kernel.org>; Thu, 26 Sep 2024 05:31:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF20610EA8E;
	Thu, 26 Sep 2024 05:31:28 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D38410E118;
 Thu, 26 Sep 2024 05:30:39 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8422640983954573742=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeFULL=3A_failure_for_lib/igt=5Ffb=3A_Fix_intel=5Fb?=
 =?utf-8?q?uf_surface_init?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 26 Sep 2024 05:30:39 -0000
Message-ID: <172732863924.1104422.12318710945852775246@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240923213620.12369-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20240923213620.12369-1-ville.syrjala@linux.intel.com>
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

--===============8422640983954573742==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/igt_fb: Fix intel_buf surface init
URL   : https://patchwork.freedesktop.org/series/139012/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8032_full -> XEIGTPW_11789_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11789_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11789_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11789_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-lnl:          NOTRUN -> [SKIP][1] +7 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-1/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][2] -> [FAIL][3]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_pm_backlight@fade:
    - shard-dg2-set2:     NOTRUN -> [SKIP][4]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-432/igt@kms_pm_backlight@fade.html

  * igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area@psr2-pipe-a-edp-1:
    - shard-lnl:          [PASS][5] -> [FAIL][6] +51 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-3/igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area@psr2-pipe-a-edp-1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-8/igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area@psr2-pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area@psr2-pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [FAIL][7] +1 other test fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-7/igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area@psr2-pipe-a-edp-1.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-lnl:          [PASS][8] -> [SKIP][9] +3 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-8/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  
#### Warnings ####

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     [SKIP][10] ([Intel XE#1201]) -> [SKIP][11] +28 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-466/igt@kms_pm_dc@dc6-dpms.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [FAIL][12] ([Intel XE#1430]) -> [SKIP][13]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-2/igt@kms_pm_dc@dc6-psr.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-8/igt@kms_pm_dc@dc6-psr.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@core_getversion@all-cards:
    - {shard-bmg}:        [PASS][14] -> [FAIL][15]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-7/igt@core_getversion@all-cards.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-6/igt@core_getversion@all-cards.html

  * igt@kms_async_flips@crc:
    - {shard-bmg}:        [DMESG-FAIL][16] ([Intel XE#1033]) -> [SKIP][17]
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-8/igt@kms_async_flips@crc.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-6/igt@kms_async_flips@crc.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - {shard-bmg}:        [SKIP][18] ([Intel XE#2370]) -> [SKIP][19]
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - {shard-bmg}:        [SKIP][20] ([Intel XE#2327]) -> [SKIP][21] +5 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-6/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-6/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - {shard-bmg}:        [FAIL][22] ([Intel XE#1659]) -> [SKIP][23]
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - {shard-bmg}:        [SKIP][24] ([Intel XE#1124]) -> [SKIP][25] +13 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-7/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-6/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - {shard-bmg}:        [SKIP][26] ([Intel XE#610]) -> [SKIP][27]
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-2/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-6/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - {shard-bmg}:        [SKIP][28] ([Intel XE#367]) -> [SKIP][29] +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-3/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-6/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - {shard-bmg}:        [SKIP][30] ([Intel XE#2652] / [Intel XE#787]) -> [SKIP][31] +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-6/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_content_protection@content-type-change:
    - {shard-bmg}:        [SKIP][32] ([Intel XE#2341]) -> [SKIP][33]
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-2/igt@kms_content_protection@content-type-change.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-6/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@legacy:
    - {shard-bmg}:        [FAIL][34] ([Intel XE#1178]) -> [SKIP][35] +2 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-8/igt@kms_content_protection@legacy.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-6/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@cursor-offscreen-max-size:
    - {shard-bmg}:        [SKIP][36] ([Intel XE#2320]) -> [SKIP][37] +5 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-max-size.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-max-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - {shard-bmg}:        [DMESG-WARN][38] ([Intel XE#2791] / [Intel XE#877]) -> [SKIP][39]
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - {shard-bmg}:        [SKIP][40] ([Intel XE#2244]) -> [SKIP][41] +3 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-7/igt@kms_dsc@dsc-fractional-bpp.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-6/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_fbcon_fbt@fbc:
    - {shard-bmg}:        [FAIL][42] ([Intel XE#1695]) -> [SKIP][43]
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-7/igt@kms_fbcon_fbt@fbc.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-6/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_flip@flip-vs-suspend:
    - {shard-bmg}:        [DMESG-WARN][44] -> [SKIP][45]
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-6/igt@kms_flip@flip-vs-suspend.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-6/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - {shard-bmg}:        [SKIP][46] ([Intel XE#2380]) -> [SKIP][47] +6 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - {shard-bmg}:        [SKIP][48] ([Intel XE#2311]) -> [SKIP][49] +41 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt:
    - {shard-bmg}:        NOTRUN -> [FAIL][50] +1 other test fail
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - {shard-bmg}:        [FAIL][51] ([Intel XE#2333]) -> [SKIP][52] +8 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:
    - {shard-bmg}:        [FAIL][53] -> [SKIP][54] +8 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - {shard-bmg}:        [SKIP][55] ([Intel XE#2312]) -> [SKIP][56] +8 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - {shard-bmg}:        [SKIP][57] ([Intel XE#2313]) -> [SKIP][58] +162 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_panel_fitting@legacy:
    - {shard-bmg}:        [SKIP][59] ([Intel XE#2486]) -> [SKIP][60]
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-2/igt@kms_panel_fitting@legacy.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-6/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane@pixel-format-source-clamping:
    - {shard-bmg}:        [DMESG-WARN][61] ([Intel XE#877]) -> [SKIP][62]
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-4/igt@kms_plane@pixel-format-source-clamping.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-6/igt@kms_plane@pixel-format-source-clamping.html

  * igt@kms_plane_lowres@tiling-y:
    - {shard-bmg}:        [SKIP][63] ([Intel XE#2393]) -> [SKIP][64]
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-5/igt@kms_plane_lowres@tiling-y.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-6/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@tiling-yf:
    - {shard-bmg}:        [SKIP][65] ([Intel XE#2493]) -> [SKIP][66]
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-7/igt@kms_plane_multiple@tiling-yf.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-6/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_properties@connector-properties-legacy:
    - {shard-bmg}:        [PASS][67] -> [SKIP][68] +136 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-3/igt@kms_properties@connector-properties-legacy.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-6/igt@kms_properties@connector-properties-legacy.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - {shard-bmg}:        [SKIP][69] ([Intel XE#2329]) -> [SKIP][70] +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-2/igt@kms_rotation_crc@bad-pixel-format.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-6/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - {shard-bmg}:        [SKIP][71] ([Intel XE#2426]) -> [SKIP][72]
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@flip-dpms:
    - {shard-bmg}:        [SKIP][73] ([Intel XE#1499]) -> [SKIP][74]
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-4/igt@kms_vrr@flip-dpms.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-6/igt@kms_vrr@flip-dpms.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - {shard-bmg}:        [SKIP][75] ([Intel XE#756]) -> [SKIP][76] +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-4/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-6/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - {shard-bmg}:        NOTRUN -> [SKIP][77] +61 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-3/igt@xe_exec_basic@multigpu-once-null-rebind.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_11789_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
    - shard-lnl:          [PASS][78] -> [FAIL][79] ([Intel XE#911]) +3 other tests fail
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-lnl:          [PASS][80] -> [FAIL][81] ([Intel XE#1426]) +1 other test fail
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#1407])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-1/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#1201] / [Intel XE#316])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-463/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#1124]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-5/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#1124] / [Intel XE#1201]) +3 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-464/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#1201] / [Intel XE#787]) +13 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-434/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-434/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#1201] / [Intel XE#1252])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#373]) +2 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-5/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#373])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-432/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#1201] / [Intel XE#373]) +3 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_cursor_crc@cursor-random-256x85:
    - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#1424])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-8/igt@kms_cursor_crc@cursor-random-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][94] ([Intel XE#1201] / [Intel XE#455]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-lnl:          [PASS][95] -> [SKIP][96] ([Intel XE#1508])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [PASS][97] -> [INCOMPLETE][98] ([Intel XE#2049] / [Intel XE#2597])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-463/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][99] -> [INCOMPLETE][100] ([Intel XE#2597])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-463/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#1401] / [Intel XE#1745])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#1401])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#1397] / [Intel XE#1745])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#1397])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#656]) +7 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#651])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#1201] / [Intel XE#651]) +9 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][108] ([Intel XE#1201] / [Intel XE#653]) +8 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [PASS][109] -> [SKIP][110] ([Intel XE#1201] / [Intel XE#455])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-435/igt@kms_hdr@invalid-hdr.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1:
    - shard-lnl:          [PASS][111] -> [INCOMPLETE][112] ([Intel XE#2622]) +1 other test incomplete
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-8/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html

  * igt@kms_plane@plane-position-covered:
    - shard-lnl:          [PASS][113] -> [DMESG-FAIL][114] ([Intel XE#324]) +2 other tests dmesg-fail
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-4/igt@kms_plane@plane-position-covered.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-5/igt@kms_plane@plane-position-covered.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-4:
    - shard-lnl:          [PASS][115] -> [DMESG-WARN][116] ([Intel XE#324]) +3 other tests dmesg-warn
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-4/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-4.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-2/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-4.html

  * igt@kms_psr@fbc-psr2-cursor-render@edp-1:
    - shard-lnl:          [PASS][117] -> [FAIL][118] ([Intel XE#1649]) +109 other tests fail
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-5/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-5/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-lnl:          NOTRUN -> [FAIL][119] ([Intel XE#1649]) +5 other tests fail
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-3/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@pr-sprite-blt:
    - shard-lnl:          NOTRUN -> [SKIP][120] ([Intel XE#1406])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-5/igt@kms_psr@pr-sprite-blt.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-lnl:          [PASS][121] -> [FAIL][122] ([Intel XE#899]) +1 other test fail
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_vblank@accuracy-idle:
    - shard-lnl:          [PASS][123] -> [FAIL][124] ([Intel XE#1523]) +1 other test fail
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-1/igt@kms_vblank@accuracy-idle.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-1/igt@kms_vblank@accuracy-idle.html

  * igt@kms_vrr@flip-basic:
    - shard-lnl:          [PASS][125] -> [FAIL][126] ([Intel XE#2443]) +3 other tests fail
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-1/igt@kms_vrr@flip-basic.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-8/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@flip-dpms:
    - shard-lnl:          [PASS][127] -> [FAIL][128] ([Intel XE#1522]) +1 other test fail
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-4/igt@kms_vrr@flip-dpms.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-3/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@lobf@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [FAIL][129] ([Intel XE#2443]) +1 other test fail
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-1/igt@kms_vrr@lobf@pipe-a-edp-1.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2-set2:     NOTRUN -> [SKIP][130] ([Intel XE#1201] / [Intel XE#756])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-433/igt@kms_writeback@writeback-fb-id.html

  * igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue:
    - shard-lnl:          [PASS][131] -> [FAIL][132] ([Intel XE#2667])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-7/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-2/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-dg2-set2:     NOTRUN -> [FAIL][133] ([Intel XE#1600])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-432/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-dg2-set2:     [PASS][134] -> [FAIL][135] ([Intel XE#1000])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-463/igt@xe_evict@evict-mixed-threads-large.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_evict@evict-threads-large:
    - shard-dg2-set2:     [PASS][136] -> [TIMEOUT][137] ([Intel XE#1473])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-435/igt@xe_evict@evict-threads-large.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-466/igt@xe_evict@evict-threads-large.html

  * igt@xe_exec_fault_mode@twice-basic-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][138] ([Intel XE#1201] / [Intel XE#288])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-436/igt@xe_exec_fault_mode@twice-basic-prefetch.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-dg2-set2:     [PASS][139] -> [TIMEOUT][140] ([Intel XE#2105])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-436/igt@xe_exec_reset@parallel-gt-reset.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-432/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-lnl:          [PASS][141] -> [ABORT][142] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-8/igt@xe_pm@s4-multiple-execs.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-lnl:          [PASS][143] -> [ABORT][144] ([Intel XE#1607] / [Intel XE#1794])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-5/igt@xe_pm@s4-vm-bind-prefetch.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     NOTRUN -> [SKIP][145] ([Intel XE#1201]) +11 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-433/igt@xe_query@multigpu-query-engines.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-lnl:          [PASS][146] -> [FAIL][147] ([Intel XE#2780])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-4/igt@xe_wedged@wedged-at-any-timeout.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-1/igt@xe_wedged@wedged-at-any-timeout.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotreplug-lateclose:
    - {shard-bmg}:        [ABORT][148] -> [PASS][149]
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-6/igt@core_hotunplug@hotreplug-lateclose.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-5/igt@core_hotunplug@hotreplug-lateclose.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - {shard-bmg}:        [FAIL][150] ([Intel XE#1426]) -> [PASS][151] +1 other test pass
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-2/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-3/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:
    - shard-lnl:          [FAIL][152] ([Intel XE#1426]) -> [PASS][153] +1 other test pass
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-8/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-8/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][154] ([Intel XE#1426]) -> [PASS][155] +1 other test pass
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-466/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-d-hdmi-a-3:
    - {shard-bmg}:        [DMESG-WARN][156] ([Intel XE#877]) -> [PASS][157] +2 other tests pass
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-4/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-d-hdmi-a-3.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-1/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1:
    - shard-lnl:          [INCOMPLETE][158] ([Intel XE#1616]) -> [PASS][159] +1 other test pass
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-4/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-2/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - {shard-bmg}:        [DMESG-WARN][160] -> [PASS][161] +3 other tests pass
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-8/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_display_modes@extended-mode-basic:
    - {shard-bmg}:        [SKIP][162] ([Intel XE#2425]) -> [PASS][163]
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-3/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-lnl:          [FAIL][164] ([Intel XE#886]) -> [PASS][165] +2 other tests pass
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-1/igt@kms_flip@blocking-wf_vblank.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-8/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     [INCOMPLETE][166] ([Intel XE#1195]) -> [PASS][167] +1 other test pass
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-valid-mode.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-valid-mode.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-1:
    - shard-lnl:          [DMESG-WARN][168] ([Intel XE#324]) -> [PASS][169] +1 other test pass
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-4/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-1.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-2/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-1.html

  * igt@kms_plane@plane-position-hole@pipe-a-plane-4:
    - shard-lnl:          [DMESG-FAIL][170] ([Intel XE#324]) -> [PASS][171] +2 other tests pass
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-3/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     [FAIL][172] ([Intel XE#616]) -> [PASS][173] +3 other tests pass
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-433/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-436/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2-set2:     [FAIL][174] -> [PASS][175]
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_plane_scaling@planes-upscale-20x20@pipe-a:
    - {shard-bmg}:        [SKIP][176] -> [PASS][177] +9 other tests pass
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-20x20@pipe-a.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-20x20@pipe-a.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [FAIL][178] -> [PASS][179]
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-7/igt@kms_pm_dc@dc5-dpms.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-dg2-set2:     [FAIL][180] ([Intel XE#1600]) -> [PASS][181]
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-463/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-464/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - {shard-bmg}:        [DMESG-WARN][182] ([Intel XE#569]) -> [PASS][183]
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-6/igt@xe_pm@s3-vm-bind-userptr.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-4/igt@xe_pm@s3-vm-bind-userptr.html
    - shard-dg2-set2:     [INCOMPLETE][184] ([Intel XE#1195] / [Intel XE#569]) -> [PASS][185]
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-464/igt@xe_pm@s3-vm-bind-userptr.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-434/igt@xe_pm@s3-vm-bind-userptr.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          [ABORT][186] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][187]
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-2/igt@xe_pm@s4-basic.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-1/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-lnl:          [ABORT][188] ([Intel XE#1794]) -> [PASS][189]
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-3/igt@xe_pm@s4-vm-bind-userptr.html

  
#### Warnings ####

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][190] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][191] ([Intel XE#316])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-464/igt@kms_big_fb@linear-32bpp-rotate-90.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-432/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][192] ([Intel XE#316]) -> [SKIP][193] ([Intel XE#1201] / [Intel XE#316]) +5 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-466/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][194] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][195] ([Intel XE#1124]) +3 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-435/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-432/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-dg2-set2:     [SKIP][196] ([Intel XE#619]) -> [SKIP][197] ([Intel XE#1201] / [Intel XE#619])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-435/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][198] ([Intel XE#610]) -> [SKIP][199] ([Intel XE#1201] / [Intel XE#610])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][200] ([Intel XE#1124]) -> [SKIP][201] ([Intel XE#1124] / [Intel XE#1201]) +4 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-434/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][202] ([Intel XE#367]) -> [SKIP][203] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-433/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][204] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][205] ([Intel XE#367]) +2 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-435/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-432/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][206] ([Intel XE#2191]) -> [SKIP][207] ([Intel XE#1201] / [Intel XE#2191]) +1 other test skip
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][208] ([Intel XE#787]) -> [SKIP][209] ([Intel XE#1201] / [Intel XE#787]) +69 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-436/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][210] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][211] ([Intel XE#787]) +27 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-6.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][212] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][213] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +19 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][214] ([Intel XE#1201] / [Intel XE#1252]) -> [SKIP][215] ([Intel XE#1252])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][216] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][217] ([Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-dg2-set2:     [SKIP][218] ([Intel XE#306]) -> [SKIP][219] ([Intel XE#1201] / [Intel XE#306])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_chamelium_color@ctm-0-25.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-436/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     [SKIP][220] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][221] ([Intel XE#306])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-434/igt@kms_chamelium_color@ctm-limited-range.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-432/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-dg2-set2:     [SKIP][222] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][223] ([Intel XE#373]) +1 other test skip
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-434/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     [SKIP][224] ([Intel XE#373]) -> [SKIP][225] ([Intel XE#1201] / [Intel XE#373]) +6 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-466/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     [SKIP][226] ([Intel XE#307]) -> [SKIP][227] ([Intel XE#1201] / [Intel XE#307])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-0.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-466/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg2-set2:     [SKIP][228] ([Intel XE#308]) -> [SKIP][229] ([Intel XE#1201] / [Intel XE#308])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-dg2-set2:     [SKIP][230] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][231] ([Intel XE#455]) +7 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     [SKIP][232] ([Intel XE#455]) -> [SKIP][233] ([Intel XE#1201] / [Intel XE#455]) +21 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][234] ([Intel XE#651]) -> [SKIP][235] ([Intel XE#1201] / [Intel XE#651]) +20 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][236] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][237] ([Intel XE#651]) +12 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][238] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][239] ([Intel XE#653]) +10 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][240] ([Intel XE#653]) -> [SKIP][241] ([Intel XE#1201] / [Intel XE#653]) +18 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_psr@psr-cursor-plane-move:
    - shard-dg2-set2:     [SKIP][242] ([Intel XE#2850]) -> [SKIP][243] ([Intel XE#1201] / [Intel XE#2850])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_psr@psr-cursor-plane-move.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-434/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-dg2-set2:     [SKIP][244] ([Intel XE#327]) -> [SKIP][245] ([Intel XE#1201] / [Intel XE#327]) +1 other test skip
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_rotation_crc@bad-pixel-format.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-466/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][246] ([Intel XE#1127] / [Intel XE#1201]) -> [SKIP][247] ([Intel XE#1127])
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][248] ([Intel XE#1201] / [Intel XE#1500]) -> [SKIP][249] ([Intel XE#1201] / [Intel XE#362])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_writeback@writeback-check-output:
    - shard-dg2-set2:     [SKIP][250] ([Intel XE#756]) -> [SKIP][251] ([Intel XE#1201] / [Intel XE#756])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_writeback@writeback-check-output.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-466/igt@kms_writeback@writeback-check-output.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2-set2:     [SKIP][252] ([Intel XE#2849]) -> [SKIP][253] ([Intel XE#1201] / [Intel XE#2849])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-463/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     [SKIP][254] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) -> [SKIP][255] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-435/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-432/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-rebind:
    - shard-dg2-set2:     [SKIP][256] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][257] ([Intel XE#288])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-434/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind:
    - shard-dg2-set2:     [SKIP][258] ([Intel XE#288]) -> [SKIP][259] ([Intel XE#1201] / [Intel XE#288]) +2 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-466/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][260] -> [SKIP][261] ([Intel XE#1201]) +38 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_live_ktest@xe_bo:
    - shard-dg2-set2:     [TIMEOUT][262] -> [INCOMPLETE][263] ([Intel XE#1195]) +1 other test incomplete
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-434/igt@xe_live_ktest@xe_bo.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-464/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-dg2-set2:     [SKIP][264] ([Intel XE#1201] / [Intel XE#2229]) -> [SKIP][265] ([Intel XE#2229])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-464/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-432/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_mmap@small-bar:
    - shard-dg2-set2:     [SKIP][266] ([Intel XE#512]) -> [SKIP][267] ([Intel XE#1201] / [Intel XE#512])
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@xe_mmap@small-bar.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-466/igt@xe_mmap@small-bar.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     [SKIP][268] ([Intel XE#1337]) -> [SKIP][269] ([Intel XE#1201] / [Intel XE#1337])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@xe_pat@display-vs-wb-transient.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-433/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     [SKIP][270] ([Intel XE#1201]) -> [SKIP][271] ([Intel XE#1201] / [Intel XE#977])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-466/igt@xe_pat@pat-index-xe2.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-463/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     [SKIP][272] ([Intel XE#1201] / [Intel XE#2838]) -> [SKIP][273] ([Intel XE#2838])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-466/igt@xe_pat@pat-index-xehpc.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-432/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-dg2-set2:     [SKIP][274] ([Intel XE#366]) -> [SKIP][275] ([Intel XE#1201] / [Intel XE#366]) +1 other test skip
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@xe_pm@d3cold-mmap-system.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-466/igt@xe_pm@d3cold-mmap-system.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1522
  [Intel XE#1523]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1523
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
  [Intel XE#1649]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
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
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2425
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2622]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2622
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2667]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667
  [Intel XE#2690]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2690
  [Intel XE#2780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2780
  [Intel XE#2791]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2791
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
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977


Build changes
-------------

  * IGT: IGT_8032 -> IGTPW_11789
  * Linux: xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47 -> xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b

  IGTPW_11789: 11789
  IGT_8032: 8032
  xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47: abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47
  xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b: 88d592f72f7bc508d6a027b1f96aa2e53f803e1b

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/index.html

--===============8422640983954573742==
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
<tr><td><b>Series:</b></td><td>lib/igt_fb: Fix intel_buf surface init</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139012/">https://patchwork.freedesktop.org/series/139012/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8032_full -&gt; XEIGTPW_11789_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11789_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11789_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11789_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-1/igt@kms_flip@2x-dpms-vs-vblank-race.html">SKIP</a> +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-432/igt@kms_pm_backlight@fade.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area@psr2-pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-3/igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area@psr2-pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-8/igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area@psr2-pipe-a-edp-1.html">FAIL</a> +51 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area@psr2-pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-7/igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area@psr2-pipe-a-edp-1.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-8/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-466/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-2/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-8/igt@kms_pm_dc@dc6-psr.html">SKIP</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@core_getversion@all-cards:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-7/igt@core_getversion@all-cards.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-6/igt@core_getversion@all-cards.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-8/igt@kms_async_flips@crc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-6/igt@kms_async_flips@crc.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-6/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-6/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-7/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-6/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-2/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-6/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-3/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-6/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-6/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-2/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-6/igt@kms_content_protection@content-type-change.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-8/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-6/igt@kms_content_protection@legacy.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-max-size:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-max-size.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2791">Intel XE#2791</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-7/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-6/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-7/igt@kms_fbcon_fbt@fbc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695">Intel XE#1695</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-6/igt@kms_fbcon_fbt@fbc.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-6/igt@kms_flip@flip-vs-suspend.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-6/igt@kms_flip@flip-vs-suspend.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> +162 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-2/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486">Intel XE#2486</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-6/igt@kms_panel_fitting@legacy.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-4/igt@kms_plane@pixel-format-source-clamping.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-6/igt@kms_plane@pixel-format-source-clamping.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-5/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-6/igt@kms_plane_lowres@tiling-y.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-7/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel XE#2493</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-6/igt@kms_plane_multiple@tiling-yf.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-legacy:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-3/igt@kms_properties@connector-properties-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-6/igt@kms_properties@connector-properties-legacy.html">SKIP</a> +136 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-2/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2329">Intel XE#2329</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-6/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-4/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-6/igt@kms_vrr@flip-dpms.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-4/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-6/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-3/igt@xe_exec_basic@multigpu-once-null-rebind.html">SKIP</a> +61 other tests skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11789_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/911">Intel XE#911</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-1/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-463/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-5/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-464/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-434/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-434/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-5/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm-disable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-432/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-8/igt@kms_cursor_crc@cursor-random-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-463/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-463/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-463/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-435/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-8/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2622">Intel XE#2622</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-4/igt@kms_plane@plane-position-covered.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-5/igt@kms_plane@plane-position-covered.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-4:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-4/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-2/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-render@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-5/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-5/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649">Intel XE#1649</a>) +109 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-3/igt@kms_psr@fbc-psr2-sprite-plane-move.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649">Intel XE#1649</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-5/igt@kms_psr@pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@accuracy-idle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-1/igt@kms_vblank@accuracy-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-1/igt@kms_vblank@accuracy-idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1523">Intel XE#1523</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-1/igt@kms_vrr@flip-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-8/igt@kms_vrr@flip-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-4/igt@kms_vrr@flip-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-3/igt@kms_vrr@flip-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1522">Intel XE#1522</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-1/igt@kms_vrr@lobf@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-433/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-7/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-2/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667">Intel XE#2667</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-432/igt@xe_evict@evict-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-463/igt@xe_evict@evict-mixed-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-435/igt@xe_evict@evict-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-466/igt@xe_evict@evict-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-basic-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-436/igt@xe_exec_fault_mode@twice-basic-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-436/igt@xe_exec_reset@parallel-gt-reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-432/igt@xe_exec_reset@parallel-gt-reset.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105">Intel XE#2105</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-8/igt@xe_pm@s4-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-5/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-433/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-4/igt@xe_wedged@wedged-at-any-timeout.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-1/igt@xe_wedged@wedged-at-any-timeout.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2780">Intel XE#2780</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-6/igt@core_hotunplug@hotreplug-lateclose.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-5/igt@core_hotunplug@hotreplug-lateclose.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-2/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-3/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-8/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-8/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-466/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-4/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-d-hdmi-a-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-1/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-d-hdmi-a-3.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-4/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616">Intel XE#1616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-2/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-toggle:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-8/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2425">Intel XE#2425</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-3/igt@kms_display_modes@extended-mode-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-1/igt@kms_flip@blocking-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-8/igt@kms_flip@blocking-wf_vblank.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-valid-mode.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-valid-mode.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-4/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-2/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-a-plane-4:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-3/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-433/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-436/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20@pipe-a:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-20x20@pipe-a.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-20x20@pipe-a.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-7/igt@kms_pm_dc@dc5-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-463/igt@xe_evict@evict-beng-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-464/igt@xe_evict@evict-beng-large-multi-vm-cm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-bmg-6/igt@xe_pm@s3-vm-bind-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-bmg-4/igt@xe_pm@s3-vm-bind-userptr.html">PASS</a></li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-464/igt@xe_pm@s3-vm-bind-userptr.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-434/igt@xe_pm@s3-vm-bind-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-2/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-1/igt@xe_pm@s4-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-lnl-3/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-464/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-432/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-466/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-435/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-432/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-435/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-434/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-433/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-435/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-432/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-436/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +69 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-436/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-434/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-432/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-434/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-466/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-466/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-434/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-466/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-466/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-463/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-435/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-432/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-434/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-466/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +38 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-434/igt@xe_live_ktest@xe_bo.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-464/igt@xe_live_ktest@xe_bo.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-464/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-432/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-466/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-433/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-466/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-463/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-466/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-432/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8032/shard-dg2-432/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11789/shard-dg2-466/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8032 -&gt; IGTPW_11789</li>
<li>Linux: xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47 -&gt; xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b</li>
</ul>
<p>IGTPW_11789: 11789<br />
  IGT_8032: 8032<br />
  xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47: abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47<br />
  xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b: 88d592f72f7bc508d6a027b1f96aa2e53f803e1b</p>

</body>
</html>

--===============8422640983954573742==--
