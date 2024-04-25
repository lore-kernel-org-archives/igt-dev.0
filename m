Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CAF7C10F15
	for <igt-dev@archiver.kernel.org>; Thu, 25 Apr 2024 13:55:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A95A611A489;
	Thu, 25 Apr 2024 13:55:37 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E2741139A5;
 Thu, 25 Apr 2024 13:55:37 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4358971169515299564=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeFULL=3A_failure_for_series_starting_with_=5Bv3=2C?=
 =?utf-8?q?1/2=5D_tests/kms=5Fvrr=3A_Add_a_subtest_for_seamless_modeset_to_a?=
 =?utf-8?q?_virtual_LRR_mode?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Manasi Navare" <navaremanasi@chromium.org>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 25 Apr 2024 13:55:37 -0000
Message-ID: <171405333705.1650662.2502586628900699295@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240424201344.783935-1-navaremanasi@chromium.org>
In-Reply-To: <20240424201344.783935-1-navaremanasi@chromium.org>
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

--===============4358971169515299564==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [v3,1/2] tests/kms_vrr: Add a subtest for seamless modeset to a virtual LRR mode
URL   : https://patchwork.freedesktop.org/series/132866/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7823_full -> XEIGTPW_11065_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11065_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11065_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 1)
------------------------------

  ERROR: It appears as if the changes made in XEIGTPW_11065_full prevented too many machines from booting.

  Missing    (2): shard-adlp shard-lnl 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11065_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pm_rpm@i2c:
    - shard-dg2-set2:     [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-466/igt@kms_pm_rpm@i2c.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-433/igt@kms_pm_rpm@i2c.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern.html

  
New tests
---------

  New tests have been introduced between XEIGT_7823_full and XEIGTPW_11065_full:

### New IGT tests (1) ###

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_11065_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@unused-pitches:
    - shard-dg2-set2:     [PASS][4] -> [SKIP][5] ([Intel XE#1201] / [i915#6077])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-464/igt@kms_addfb_basic@unused-pitches.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-466/igt@kms_addfb_basic@unused-pitches.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking:
    - shard-dg2-set2:     [PASS][6] -> [SKIP][7] ([Intel XE#1201]) +3 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-463/igt@kms_atomic_transition@modeset-transition-nonblocking.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-466/igt@kms_atomic_transition@modeset-transition-nonblocking.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][8] ([Intel XE#1201] / [Intel XE#610])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][10] ([Intel XE#1201] / [Intel XE#367])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#1201] / [Intel XE#787]) +76 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-7:
    - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +23 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-7.html

  * igt@kms_cdclk@mode-transition:
    - shard-dg2-set2:     [PASS][13] -> [SKIP][14] ([Intel XE#1201] / [Intel XE#1235])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-466/igt@kms_cdclk@mode-transition.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-466/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#1152] / [Intel XE#1201]) +3 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-433/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_frames@hdmi-frame-dump:
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#1201] / [Intel XE#373]) +4 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-435/igt@kms_chamelium_frames@hdmi-frame-dump.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#1201] / [Intel XE#307])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-463/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel XE#455]) +8 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-435/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][19] ([Intel XE#1178]) +1 other test fail
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-433/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-dg2-set2:     [PASS][20] -> [DMESG-WARN][21] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-464/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-435/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
    - shard-dg2-set2:     [PASS][22] -> [DMESG-WARN][23] ([Intel XE#1214] / [Intel XE#282]) +5 other tests dmesg-warn
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-466/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-434/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][24] ([Intel XE#1214] / [Intel XE#282]) +1 other test dmesg-warn
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-433/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@torture-bo:
    - shard-dg2-set2:     [PASS][25] -> [DMESG-WARN][26] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#877])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-466/igt@kms_cursor_legacy@torture-bo.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-434/igt@kms_cursor_legacy@torture-bo.html

  * igt@kms_cursor_legacy@torture-bo@pipe-a:
    - shard-dg2-set2:     [PASS][27] -> [DMESG-WARN][28] ([Intel XE#1214] / [Intel XE#877])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-466/igt@kms_cursor_legacy@torture-bo@pipe-a.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-434/igt@kms_cursor_legacy@torture-bo@pipe-a.html

  * igt@kms_flip@absolute-wf_vblank:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#1201]) +2 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-466/igt@kms_flip@absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a7:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][30] ([Intel XE#1162] / [Intel XE#1214]) +2 other tests dmesg-warn
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a7.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
    - shard-dg2-set2:     [PASS][31] -> [DMESG-WARN][32] ([Intel XE#1214])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#1201] / [Intel XE#651]) +7 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#1201] / [Intel XE#658])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#1201] / [Intel XE#653]) +17 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [PASS][36] -> [SKIP][37] ([Intel XE#1201] / [Intel XE#455])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-433/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane_multiple@tiling-4:
    - shard-dg2-set2:     [PASS][38] -> [SKIP][39] ([Intel XE#1201] / [Intel XE#829])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-435/igt@kms_plane_multiple@tiling-4.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-466/igt@kms_plane_multiple@tiling-4.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#1201] / [Intel XE#870])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-434/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#1129] / [Intel XE#1201])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-435/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#1201] / [Intel XE#1211])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-466/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg2-set2:     [PASS][45] -> [SKIP][46] ([Intel XE#1201] / [Intel XE#1211])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-466/igt@kms_pm_rpm@modeset-lpsp.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-436/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_prop_blob@basic:
    - shard-dg2-set2:     [PASS][47] -> [SKIP][48] ([Intel XE#1201] / [Intel XE#780])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-436/igt@kms_prop_blob@basic.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-466/igt@kms_prop_blob@basic.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#1122] / [Intel XE#1201])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-433/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-psr-sprite-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#1201] / [Intel XE#929]) +5 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-render.html

  * igt@kms_rmfb@close-fd@pipe-b-hdmi-a-7:
    - shard-dg2-set2:     NOTRUN -> [FAIL][51] ([Intel XE#294])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-464/igt@kms_rmfb@close-fd@pipe-b-hdmi-a-7.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#1201] / [Intel XE#327])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-434/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [PASS][53] -> [FAIL][54] ([Intel XE#899]) +2 other tests fail
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#1201] / [Intel XE#756])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-466/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-dg2-set2:     [PASS][56] -> [FAIL][57] ([Intel XE#1050])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-434/igt@xe_compute@ccs-mode-compute-kernel.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-433/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#1126] / [Intel XE#1201]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     NOTRUN -> [TIMEOUT][59] ([Intel XE#1473])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-threads-large:
    - shard-dg2-set2:     [PASS][60] -> [TIMEOUT][61] ([Intel XE#1473] / [Intel XE#392])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-463/igt@xe_evict@evict-threads-large.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-466/igt@xe_evict@evict-threads-large.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#1201] / [Intel XE#288]) +7 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-433/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr.html

  * igt@xe_exec_threads@threads-bal-mixed-fd-userptr:
    - shard-dg2-set2:     [PASS][63] -> [INCOMPLETE][64] ([Intel XE#1169] / [Intel XE#1195] / [Intel XE#1356])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-434/igt@xe_exec_threads@threads-bal-mixed-fd-userptr.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-436/igt@xe_exec_threads@threads-bal-mixed-fd-userptr.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#1201] / [Intel XE#378])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-436/igt@xe_module_load@load.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#1201] / [Intel XE#1337])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-463/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     NOTRUN -> [FAIL][67] ([Intel XE#1173]) +1 other test fail
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-434/igt@xe_peer2peer@read.html

  * igt@xe_pm@s3-basic-exec:
    - shard-dg2-set2:     [PASS][68] -> [DMESG-WARN][69] ([Intel XE#1162] / [Intel XE#1214]) +4 other tests dmesg-warn
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-466/igt@xe_pm@s3-basic-exec.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-466/igt@xe_pm@s3-basic-exec.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unplug-rescan:
    - shard-dg2-set2:     [DMESG-WARN][70] ([Intel XE#1214]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-464/igt@core_hotunplug@unplug-rescan.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-435/igt@core_hotunplug@unplug-rescan.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][72] ([Intel XE#1201] / [Intel XE#829]) -> [PASS][73] +2 other tests pass
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_cdclk@plane-scaling:
    - shard-dg2-set2:     [SKIP][74] ([Intel XE#1201] / [Intel XE#1234]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-434/igt@kms_cdclk@plane-scaling.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-433/igt@kms_cdclk@plane-scaling.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-dg2-set2:     [DMESG-WARN][76] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910]) -> [PASS][77] +1 other test pass
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-466/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-433/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@forked-bo@all-pipes:
    - shard-dg2-set2:     [DMESG-WARN][78] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][79] +8 other tests pass
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-434/igt@kms_cursor_legacy@forked-bo@all-pipes.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-436/igt@kms_cursor_legacy@forked-bo@all-pipes.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-dg2-set2:     [SKIP][80] ([Intel XE#1201] / [Intel XE#455]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-463/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:
    - shard-dg2-set2:     [SKIP][82] ([Intel XE#1201]) -> [PASS][83] +4 other tests pass
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html

  * igt@kms_plane_multiple@tiling-none:
    - shard-dg2-set2:     [INCOMPLETE][84] ([Intel XE#1195]) -> [PASS][85] +1 other test pass
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-433/igt@kms_plane_multiple@tiling-none.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-435/igt@kms_plane_multiple@tiling-none.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-dg2-set2:     [SKIP][86] ([Intel XE#1201] / [Intel XE#1211]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-436/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-436/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:
    - shard-dg2-set2:     [FAIL][88] ([Intel XE#899]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html

  * igt@xe_evict@evict-beng-cm-threads-large-multi-vm:
    - shard-dg2-set2:     [INCOMPLETE][90] ([Intel XE#1195] / [Intel XE#1473]) -> [PASS][91] +1 other test pass
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-435/igt@xe_evict@evict-beng-cm-threads-large-multi-vm.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-433/igt@xe_evict@evict-beng-cm-threads-large-multi-vm.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [TIMEOUT][92] ([Intel XE#1473] / [Intel XE#402]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-433/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate:
    - shard-dg2-set2:     [ABORT][94] ([Intel XE#1304]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-434/igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-463/igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate.html

  * igt@xe_live_ktest@xe_dma_buf:
    - shard-dg2-set2:     [SKIP][96] ([Intel XE#1192] / [Intel XE#1201]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-433/igt@xe_live_ktest@xe_dma_buf.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-434/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_module_load@many-reload:
    - shard-dg2-set2:     [INCOMPLETE][98] ([Intel XE#1044] / [Intel XE#1195]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-464/igt@xe_module_load@many-reload.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-433/igt@xe_module_load@many-reload.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-dg2-set2:     [DMESG-WARN][100] ([Intel XE#1162] / [Intel XE#1214]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-436/igt@xe_pm@s3-multiple-execs.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-466/igt@xe_pm@s3-multiple-execs.html

  
#### Warnings ####

  * igt@core_hotunplug@hotreplug-lateclose:
    - shard-dg2-set2:     [DMESG-FAIL][102] ([Intel XE#1162] / [Intel XE#1548]) -> [DMESG-FAIL][103] ([Intel XE#1548])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-464/igt@core_hotunplug@hotreplug-lateclose.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-434/igt@core_hotunplug@hotreplug-lateclose.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][104] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][105] ([Intel XE#1201] / [Intel XE#607])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-435/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-dg2-set2:     [SKIP][106] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][107] ([Intel XE#1201])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-464/igt@kms_chamelium_frames@dp-crc-fast.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-466/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_content_protection@legacy:
    - shard-dg2-set2:     [FAIL][108] ([Intel XE#1178]) -> [SKIP][109] ([Intel XE#1201] / [Intel XE#455])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-466/igt@kms_content_protection@legacy.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-464/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@srm:
    - shard-dg2-set2:     [SKIP][110] ([Intel XE#1201] / [Intel XE#455]) -> [FAIL][111] ([Intel XE#1178]) +1 other test fail
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-464/igt@kms_content_protection@srm.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-433/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-dg2-set2:     [SKIP][112] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][113] ([Intel XE#1201])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-464/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-466/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_legacy@single-move:
    - shard-dg2-set2:     [DMESG-WARN][114] ([Intel XE#1214] / [Intel XE#282]) -> [SKIP][115] ([Intel XE#1201])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-466/igt@kms_cursor_legacy@single-move.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-466/igt@kms_cursor_legacy@single-move.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][116] ([Intel XE#1201] / [Intel XE#455] / [i915#3804]) -> [SKIP][117] ([Intel XE#1201] / [i915#3804])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-463/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     [SKIP][118] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][119] ([Intel XE#1201] / [Intel XE#1234])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-blt:
    - shard-dg2-set2:     [SKIP][120] ([Intel XE#1201]) -> [SKIP][121] ([Intel XE#1201] / [Intel XE#651]) +1 other test skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-blt.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][122] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][123] ([Intel XE#1201])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-msflip-blt.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][124] ([Intel XE#1201]) -> [SKIP][125] ([Intel XE#1201] / [Intel XE#653]) +1 other test skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][126] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][127] ([Intel XE#1201]) +1 other test skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
    - shard-dg2-set2:     [DMESG-FAIL][128] ([Intel XE#1162]) -> [FAIL][129] ([Intel XE#616]) +3 other tests fail
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-436/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-436/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format:
    - shard-dg2-set2:     [INCOMPLETE][130] ([Intel XE#1195] / [Intel XE#904] / [Intel XE#909]) -> [TIMEOUT][131] ([Intel XE#380] / [Intel XE#904] / [Intel XE#909])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][132] ([Intel XE#1195] / [Intel XE#904] / [Intel XE#909]) -> [TIMEOUT][133] ([Intel XE#904] / [Intel XE#909]) +1 other test timeout
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a-hdmi-a-6.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format:
    - shard-dg2-set2:     [TIMEOUT][134] ([Intel XE#380] / [Intel XE#904] / [Intel XE#909]) -> [INCOMPLETE][135] ([Intel XE#1195] / [Intel XE#904] / [Intel XE#909])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-466/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-463/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [TIMEOUT][136] ([Intel XE#904] / [Intel XE#909]) -> [INCOMPLETE][137] ([Intel XE#1195] / [Intel XE#904] / [Intel XE#909])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-466/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a-hdmi-a-6.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-463/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:
    - shard-dg2-set2:     [INCOMPLETE][138] ([Intel XE#1195] / [Intel XE#909]) -> [TIMEOUT][139] ([Intel XE#295] / [Intel XE#380] / [Intel XE#909])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-436/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-433/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html

  * igt@kms_psr@fbc-pr-cursor-plane-move:
    - shard-dg2-set2:     [SKIP][140] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][141] ([Intel XE#1201]) +1 other test skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-436/igt@kms_psr@fbc-pr-cursor-plane-move.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-466/igt@kms_psr@fbc-pr-cursor-plane-move.html

  * igt@kms_psr@psr2-primary-blt:
    - shard-dg2-set2:     [SKIP][142] ([Intel XE#1201]) -> [SKIP][143] ([Intel XE#1201] / [Intel XE#929]) +2 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-434/igt@kms_psr@psr2-primary-blt.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-435/igt@kms_psr@psr2-primary-blt.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg2-set2:     [SKIP][144] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][145] ([Intel XE#1201] / [Intel XE#829]) +1 other test skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-463/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@xe_evict@evict-beng-cm-threads-large:
    - shard-dg2-set2:     [INCOMPLETE][146] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392]) -> [TIMEOUT][147] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-436/igt@xe_evict@evict-beng-cm-threads-large.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-466/igt@xe_evict@evict-beng-cm-threads-large.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-dg2-set2:     [TIMEOUT][148] ([Intel XE#1473] / [Intel XE#392] / [Intel XE#931]) -> [TIMEOUT][149] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-464/igt@xe_evict@evict-beng-mixed-threads-large.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-464/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-dg2-set2:     [DMESG-WARN][150] ([Intel XE#1162] / [Intel XE#1214]) -> [INCOMPLETE][151] ([Intel XE#1044] / [Intel XE#1195] / [Intel XE#1358] / [Intel XE#569])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-466/igt@xe_pm@s3-d3hot-basic-exec.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-436/igt@xe_pm@s3-d3hot-basic-exec.html

  * igt@xe_pm@s4-basic:
    - shard-dg2-set2:     [FAIL][152] ([Intel XE#1043] / [Intel XE#845]) -> [DMESG-FAIL][153] ([Intel XE#1162] / [Intel XE#1551])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-436/igt@xe_pm@s4-basic.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-466/igt@xe_pm@s4-basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
  [Intel XE#1043]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1043
  [Intel XE#1044]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044
  [Intel XE#1050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1211]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
  [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
  [Intel XE#1234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1234
  [Intel XE#1235]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1235
  [Intel XE#1304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1304
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1548
  [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/294
  [Intel XE#295]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/295
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/380
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/780
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
  [Intel XE#845]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/845
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/904
  [Intel XE#909]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/909
  [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#931]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/931
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
  [i915#6077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077


Build changes
-------------

  * IGT: IGT_7823 -> IGTPW_11065
  * Linux: xe-1170-7ec59c2fcb5419f0d48b7918200be26e360388e7 -> xe-1171-ad654139fd5a7773f0310b5f745c105cdba520e8

  IGTPW_11065: 11065
  IGT_7823: 61121a2eac4d191ad9f3077948c8ba19686fbb16 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1170-7ec59c2fcb5419f0d48b7918200be26e360388e7: 7ec59c2fcb5419f0d48b7918200be26e360388e7
  xe-1171-ad654139fd5a7773f0310b5f745c105cdba520e8: ad654139fd5a7773f0310b5f745c105cdba520e8

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132866v1/index.html

--===============4358971169515299564==
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
<tr><td><b>Series:</b></td><td>series starting with [v3,1/2] tests/kms_vrr: Add a subtest for seamless modeset to a virtual LRR mode</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132866/">https://patchwork.freedesktop.org/series/132866/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132866v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132866v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7823_full -&gt; XEIGTPW_11065_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11065_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11065_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 1)</h2>
<p>ERROR: It appears as if the changes made in XEIGTPW_11065_full prevented too many machines from booting.</p>
<p>Missing    (2): shard-adlp shard-lnl </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11065_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-466/igt@kms_pm_rpm@i2c.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-433/igt@kms_pm_rpm@i2c.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_7823_full and XEIGTPW_11065_full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_vrr@seamless-rr-switch-virtual:<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11065_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@unused-pitches:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-464/igt@kms_addfb_basic@unused-pitches.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-466/igt@kms_addfb_basic@unused-pitches.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077">i915#6077</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-463/igt@kms_atomic_transition@modeset-transition-nonblocking.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-466/igt@kms_atomic_transition@modeset-transition-nonblocking.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +76 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-7:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-466/igt@kms_cdclk@mode-transition.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-466/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1235">Intel XE#1235</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-433/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-frame-dump:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-435/igt@kms_chamelium_frames@hdmi-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-463/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-435/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-433/igt@kms_content_protection@srm@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-464/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-435/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-466/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-434/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-433/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-bo:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-466/igt@kms_cursor_legacy@torture-bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-434/igt@kms_cursor_legacy@torture-bo.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-bo@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-466/igt@kms_cursor_legacy@torture-bo@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-434/igt@kms_cursor_legacy@torture-bo@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-466/igt@kms_flip@absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a7:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a7.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-463/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-433/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-435/igt@kms_plane_multiple@tiling-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-466/igt@kms_plane_multiple@tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-434/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-435/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-466/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-466/igt@kms_pm_rpm@modeset-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-436/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-436/igt@kms_prop_blob@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-466/igt@kms_prop_blob@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/780">Intel XE#780</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-433/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rmfb@close-fd@pipe-b-hdmi-a-7:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-464/igt@kms_rmfb@close-fd@pipe-b-hdmi-a-7.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/294">Intel XE#294</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-434/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-466/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-434/igt@xe_compute@ccs-mode-compute-kernel.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-433/igt@xe_compute@ccs-mode-compute-kernel.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050">Intel XE#1050</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-463/igt@xe_evict@evict-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-466/igt@xe_evict@evict-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-433/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-fd-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-434/igt@xe_exec_threads@threads-bal-mixed-fd-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-436/igt@xe_exec_threads@threads-bal-mixed-fd-userptr.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-436/igt@xe_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-463/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-434/igt@xe_peer2peer@read.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-466/igt@xe_pm@s3-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-466/igt@xe_pm@s3-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unplug-rescan:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-464/igt@core_hotunplug@unplug-rescan.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-435/igt@core_hotunplug@unplug-rescan.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-434/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1234">Intel XE#1234</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-433/igt@kms_cdclk@plane-scaling.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-466/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-433/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-bo@all-pipes:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-434/igt@kms_cursor_legacy@forked-bo@all-pipes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-436/igt@kms_cursor_legacy@forked-bo@all-pipes.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-463/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-none:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-433/igt@kms_plane_multiple@tiling-none.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-435/igt@kms_plane_multiple@tiling-none.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-436/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-436/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large-multi-vm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-435/igt@xe_evict@evict-beng-cm-threads-large-multi-vm.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-433/igt@xe_evict@evict-beng-cm-threads-large-multi-vm.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-433/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-434/igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1304">Intel XE#1304</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-463/igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-433/igt@xe_live_ktest@xe_dma_buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-434/igt@xe_live_ktest@xe_dma_buf.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-464/igt@xe_module_load@many-reload.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044">Intel XE#1044</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-433/igt@xe_module_load@many-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-436/igt@xe_pm@s3-multiple-execs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-466/igt@xe_pm@s3-multiple-execs.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-464/igt@core_hotunplug@hotreplug-lateclose.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1548">Intel XE#1548</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-434/igt@core_hotunplug@hotreplug-lateclose.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1548">Intel XE#1548</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-435/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-464/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-466/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-466/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-464/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-464/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-433/igt@kms_content_protection@srm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-464/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-466/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-466/igt@kms_cursor_legacy@single-move.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-466/igt@kms_cursor_legacy@single-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-463/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1234">Intel XE#1234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-436/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-436/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/380">Intel XE#380</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a-hdmi-a-6.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-466/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/380">Intel XE#380</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-463/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-466/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a-hdmi-a-6.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-463/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-436/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-433/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/295">Intel XE#295</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/380">Intel XE#380</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-436/igt@kms_psr@fbc-pr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-466/igt@kms_psr@fbc-pr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-434/igt@kms_psr@psr2-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-435/igt@kms_psr@psr2-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-463/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-436/igt@xe_evict@evict-beng-cm-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-466/igt@xe_evict@evict-beng-cm-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041">Intel XE#1041</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-464/igt@xe_evict@evict-beng-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/931">Intel XE#931</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-464/igt@xe_evict@evict-beng-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041">Intel XE#1041</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-466/igt@xe_pm@s3-d3hot-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-436/igt@xe_pm@s3-d3hot-basic-exec.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044">Intel XE#1044</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7823/shard-dg2-436/igt@xe_pm@s4-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1043">Intel XE#1043</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/845">Intel XE#845</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11065/shard-dg2-466/igt@xe_pm@s4-basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7823 -&gt; IGTPW_11065</li>
<li>Linux: xe-1170-7ec59c2fcb5419f0d48b7918200be26e360388e7 -&gt; xe-1171-ad654139fd5a7773f0310b5f745c105cdba520e8</li>
</ul>
<p>IGTPW_11065: 11065<br />
  IGT_7823: 61121a2eac4d191ad9f3077948c8ba19686fbb16 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1170-7ec59c2fcb5419f0d48b7918200be26e360388e7: 7ec59c2fcb5419f0d48b7918200be26e360388e7<br />
  xe-1171-ad654139fd5a7773f0310b5f745c105cdba520e8: ad654139fd5a7773f0310b5f745c105cdba520e8</p>

</body>
</html>

--===============4358971169515299564==--
