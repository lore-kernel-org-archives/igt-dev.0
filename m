Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1879C02183
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jan 2025 08:18:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5870710E2F2;
	Fri, 17 Jan 2025 08:18:51 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D880410E2E6;
 Fri, 17 Jan 2025 08:18:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5665956350777069628=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Add_test_for_configurable_?=
 =?utf-8?q?OA_buffer_size_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sai Teja Pottumuttu" <sai.teja.pottumuttu@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 17 Jan 2025 08:18:49 -0000
Message-ID: <173710192986.610111.6306916315452880613@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250116135456.4066677-1-sai.teja.pottumuttu@intel.com>
In-Reply-To: <20250116135456.4066677-1-sai.teja.pottumuttu@intel.com>
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

--===============5665956350777069628==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add test for configurable OA buffer size (rev2)
URL   : https://patchwork.freedesktop.org/series/142128/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8195_full -> XEIGTPW_12450_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12450_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12450_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12450_full:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@hotreplug:
    - shard-dg2-set2:     [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-436/igt@core_hotunplug@hotreplug.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-463/igt@core_hotunplug@hotreplug.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-dg2-set2:     [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-464/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-433/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c:
    - shard-dg2-set2:     [PASS][5] -> [INCOMPLETE][6] +1 other test incomplete
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html

  
#### Warnings ####

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [SKIP][7] ([Intel XE#2423]) -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  
New tests
---------

  New tests have been introduced between XEIGT_8195_full and XEIGTPW_12450_full:

### New IGT tests (45) ###

  * igt@kms_atomic@crtc-invalid-params-fence@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.56] s

  * igt@kms_atomic@plane-primary-legacy@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.98] s

  * igt@kms_cursor_crc@cursor-alpha-transparent@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.67] s

  * igt@kms_cursor_crc@cursor-alpha-transparent@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.42] s

  * igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [2.48] s

  * igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [2.21] s

  * igt@kms_cursor_crc@cursor-sliding-128x128@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [4.20] s

  * igt@kms_cursor_crc@cursor-sliding-128x128@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [4.25] s

  * igt@kms_cursor_edge_walk@128x128-left-edge@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [3.39] s

  * igt@kms_cursor_edge_walk@128x128-left-edge@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [3.25] s

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.39] s

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@ab-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [2.30] s

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@ac-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [2.18] s

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@ad-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [2.15] s

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@bc-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [2.33] s

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@bd-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [2.33] s

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@cd-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [2.43] s

  * igt@kms_flip@basic-flip-vs-dpms@a-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [0.80] s

  * igt@kms_flip@basic-flip-vs-dpms@b-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [0.73] s

  * igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [0.74] s

  * igt@kms_flip@basic-flip-vs-dpms@d-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [0.74] s

  * igt@kms_flip@bo-too-big-interruptible@a-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [0.29] s

  * igt@kms_flip@bo-too-big-interruptible@b-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@kms_flip@bo-too-big-interruptible@c-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_flip@bo-too-big-interruptible@d-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_flip@busy-flip@a-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [0.81] s

  * igt@kms_flip@busy-flip@b-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [0.71] s

  * igt@kms_flip@busy-flip@c-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [0.72] s

  * igt@kms_flip@busy-flip@d-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [0.71] s

  * igt@kms_flip@nonexisting-fb@a-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [0.30] s

  * igt@kms_flip@nonexisting-fb@b-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [0.21] s

  * igt@kms_flip@nonexisting-fb@c-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [0.21] s

  * igt@kms_flip@nonexisting-fb@d-hdmi-a6:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_sequence@queue-busy@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [2.67] s

  * igt@kms_sequence@queue-busy@pipe-b-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [2.42] s

  * igt@kms_sequence@queue-busy@pipe-c-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [2.42] s

  * igt@kms_sequence@queue-busy@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [2.42] s

  * igt@kms_vblank@query-busy-hang@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [2.63] s

  * igt@kms_vblank@query-busy-hang@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [2.38] s

  * igt@xe_oa@non-zero-reason@ccs-0-16mb:
    - Statuses : 1 pass(s)
    - Exec time: [2.82] s

  * igt@xe_oa@non-zero-reason@ccs-0-32mb:
    - Statuses : 1 pass(s)
    - Exec time: [2.81] s

  * igt@xe_oa@non-zero-reason@ccs-0-8mb:
    - Statuses : 1 pass(s)
    - Exec time: [2.81] s

  * igt@xe_oa@non-zero-reason@rcs-0-16mb:
    - Statuses : 1 pass(s)
    - Exec time: [2.88] s

  * igt@xe_oa@non-zero-reason@rcs-0-32mb:
    - Statuses : 1 pass(s)
    - Exec time: [2.89] s

  * igt@xe_oa@non-zero-reason@rcs-0-8mb:
    - Statuses : 1 pass(s)
    - Exec time: [2.88] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_12450_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unplug-rescan:
    - shard-bmg:          [PASS][9] -> [SKIP][10] ([Intel XE#1885]) +2 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-2/igt@core_hotunplug@unplug-rescan.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-1/igt@core_hotunplug@unplug-rescan.html

  * igt@fbdev@unaligned-read:
    - shard-bmg:          [PASS][11] -> [SKIP][12] ([Intel XE#2134])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-3/igt@fbdev@unaligned-read.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-1/igt@fbdev@unaligned-read.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#873])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-435/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_async_flips@test-cursor:
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#664])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-5/igt@kms_async_flips@test-cursor.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2327])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-5/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#1407]) +2 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-1/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#316]) +3 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-435/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#1124]) +4 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-7/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#1124])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#1124]) +8 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#619])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-464/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#367]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-433/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#2191]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-435/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#367])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-7/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#367])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-8/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2887]) +4 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-2/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#455] / [Intel XE#787]) +28 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-433/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#2669]) +3 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][29] -> [SKIP][30] ([Intel XE#2136]) +23 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#3442])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#3432]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#2907])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#2887]) +6 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-6/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#787]) +118 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#314]) +3 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-463/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_cdclk@plane-scaling:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#1152]) +3 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-3/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2325])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-2/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#306]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-463/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_frames@hdmi-crc-planes-random:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2252]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-2/igt@kms_chamelium_frames@hdmi-crc-planes-random.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#3007])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-6/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#373]) +9 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#373]) +7 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-1/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#307])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-5/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@legacy@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][45] ([Intel XE#1178])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-5/igt@kms_content_protection@legacy@pipe-a-dp-2.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][46] ([Intel XE#1178]) +3 other tests fail
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-464/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-offscreen-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2423]) +13 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-256x85.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#308])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-432/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#1424]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-6/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#309]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2291])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-lnl:          [PASS][52] -> [FAIL][53] ([Intel XE#1475])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-lnl-5/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-5/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#323])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#1138])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-436/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#1137])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-435/igt@kms_feature_discovery@dp-mst.html
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#1137])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-3/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#1421]) +3 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][59] -> [FAIL][60] ([Intel XE#301] / [Intel XE#3321])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][61] -> [FAIL][62] ([Intel XE#301])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][63] ([Intel XE#3321])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][64] ([Intel XE#301]) +6 other tests fail
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-bmg:          [PASS][65] -> [SKIP][66] ([Intel XE#2316])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-3/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          NOTRUN -> [FAIL][67] ([Intel XE#886]) +2 other tests fail
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:
    - shard-lnl:          [PASS][68] -> [FAIL][69] ([Intel XE#886]) +4 other tests fail
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-lnl-7/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-8/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-suspend@c-edp1:
    - shard-lnl:          [PASS][70] -> [DMESG-WARN][71] ([Intel XE#2932]) +3 other tests dmesg-warn
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-lnl-6/igt@kms_flip@flip-vs-suspend@c-edp1.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-4/igt@kms_flip@flip-vs-suspend@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#1401]) +2 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#1401] / [Intel XE#1745]) +2 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling:
    - shard-bmg:          [PASS][74] -> [SKIP][75] ([Intel XE#2136] / [Intel XE#2231]) +2 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#2293]) +6 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#651]) +30 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [FAIL][78] ([Intel XE#2333]) +1 other test fail
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#656]) +20 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#2312])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#651]) +7 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#2311]) +5 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#2313]) +6 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#2136] / [Intel XE#2231]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#2136]) +18 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#653]) +29 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_getfb@getfb2-accept-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#2340])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-3/igt@kms_getfb@getfb2-accept-ccs.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#455]) +18 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-434/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@static-swap:
    - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#1503])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-6/igt@kms_hdr@static-swap.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#346])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-1/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#2925])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-436/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#2934])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][93] ([Intel XE#2927])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-464/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#3307])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-5/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][95] ([Intel XE#2763]) +11 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:
    - shard-bmg:          [PASS][96] -> [SKIP][97] ([Intel XE#2423]) +123 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-1/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c:
    - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#2763]) +7 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#2763] / [Intel XE#455]) +6 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#2763]) +19 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][101] ([Intel XE#2938])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-436/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#870])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-436/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [PASS][103] -> [FAIL][104] ([Intel XE#718])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-lnl-4/igt@kms_pm_dc@dc5-dpms.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-5/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#1129])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-432/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_rpm@cursor:
    - shard-bmg:          [PASS][106] -> [SKIP][107] ([Intel XE#2446]) +5 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-8/igt@kms_pm_rpm@cursor.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-1/igt@kms_pm_rpm@cursor.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-6/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_prop_blob@blob-prop-core:
    - shard-bmg:          [PASS][109] -> [SKIP][110] ([Intel XE#3007]) +7 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-6/igt@kms_prop_blob@blob-prop-core.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-6/igt@kms_prop_blob@blob-prop-core.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#2893])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-3/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][112] ([Intel XE#1489]) +12 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-435/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#1489]) +2 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-2/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@pr-basic:
    - shard-lnl:          NOTRUN -> [SKIP][114] ([Intel XE#1406])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-6/igt@kms_psr@pr-basic.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][115] ([Intel XE#2850] / [Intel XE#929]) +16 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-432/igt@kms_psr@psr-dpms.html

  * igt@kms_psr@psr2-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][116] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-8/igt@kms_psr@psr2-suspend.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][117] ([Intel XE#1127]) +1 other test skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][118] ([Intel XE#3414]) +1 other test skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-bmg:          NOTRUN -> [SKIP][119] ([Intel XE#2413])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-2/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [PASS][120] -> [FAIL][121] ([Intel XE#2883]) +2 other tests fail
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-lnl-3/igt@kms_setmode@basic@pipe-b-edp-1.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-7/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-lnl:          NOTRUN -> [SKIP][122] ([Intel XE#1435]) +1 other test skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-4/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     NOTRUN -> [SKIP][123] ([Intel XE#330])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-432/igt@kms_tv_load_detect@load-detect.html
    - shard-lnl:          NOTRUN -> [SKIP][124] ([Intel XE#330])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-6/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][125] ([Intel XE#3864])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-6/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-3.html

  * igt@kms_vrr@flip-basic:
    - shard-bmg:          NOTRUN -> [SKIP][126] ([Intel XE#1499])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-6/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@lobf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][127] ([Intel XE#2168])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-433/igt@kms_vrr@lobf.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2-set2:     NOTRUN -> [SKIP][128] ([Intel XE#756]) +2 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-432/igt@kms_writeback@writeback-fb-id.html

  * igt@xe_compute_preempt@compute-preempt@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     NOTRUN -> [SKIP][129] ([Intel XE#1280] / [Intel XE#455])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-436/igt@xe_compute_preempt@compute-preempt@engine-drm_xe_engine_class_compute.html

  * igt@xe_copy_basic@mem-copy-linear-0x369:
    - shard-dg2-set2:     NOTRUN -> [SKIP][130] ([Intel XE#1123])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0x369.html

  * igt@xe_eudebug@basic-vm-bind-ufence-reconnect:
    - shard-bmg:          NOTRUN -> [SKIP][131] ([Intel XE#3889])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-2/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html

  * igt@xe_eudebug_online@resume-dss:
    - shard-dg2-set2:     NOTRUN -> [SKIP][132] ([Intel XE#2905]) +10 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-436/igt@xe_eudebug_online@resume-dss.html

  * igt@xe_eudebug_online@stopped-thread:
    - shard-lnl:          NOTRUN -> [SKIP][133] ([Intel XE#2905]) +4 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-1/igt@xe_eudebug_online@stopped-thread.html

  * igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram:
    - shard-bmg:          NOTRUN -> [SKIP][134] ([Intel XE#2905]) +2 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-2/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram.html

  * igt@xe_evict@evict-beng-small:
    - shard-lnl:          NOTRUN -> [SKIP][135] ([Intel XE#688]) +1 other test skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-2/igt@xe_evict@evict-beng-small.html

  * igt@xe_exec_balancer@many-parallel-userptr-invalidate:
    - shard-bmg:          [PASS][136] -> [SKIP][137] ([Intel XE#1130]) +275 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-3/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-1/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][138] ([Intel XE#1392]) +1 other test skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html
    - shard-lnl:          NOTRUN -> [SKIP][139] ([Intel XE#1392]) +5 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-5/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-dg2-set2:     [PASS][140] -> [SKIP][141] ([Intel XE#1392])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-434/igt@xe_exec_basic@multigpu-once-null-rebind.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][142] ([Intel XE#288]) +20 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-464/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-dg2-set2:     [PASS][143] -> [ABORT][144] ([Intel XE#2625])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-463/igt@xe_gt_freq@freq_suspend.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-432/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][145] ([Intel XE#255])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-434/igt@xe_huc_copy@huc_copy.html

  * igt@xe_live_ktest@xe_bo:
    - shard-bmg:          [PASS][146] -> [SKIP][147] ([Intel XE#2229]) +1 other test skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-8/igt@xe_live_ktest@xe_bo.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-1/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-lnl:          NOTRUN -> [SKIP][148] ([Intel XE#1192] / [Intel XE#3026])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-8/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-dg2-set2:     NOTRUN -> [SKIP][149] ([Intel XE#2229])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-432/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-bmg:          [PASS][150] -> [FAIL][151] ([Intel XE#1999]) +2 other tests fail
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-5/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-7/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_module_load@force-load:
    - shard-lnl:          NOTRUN -> [SKIP][152] ([Intel XE#378])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-5/igt@xe_module_load@force-load.html

  * igt@xe_oa@unprivileged-single-ctx-counters:
    - shard-lnl:          NOTRUN -> [SKIP][153] ([Intel XE#2248])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-7/igt@xe_oa@unprivileged-single-ctx-counters.html

  * igt@xe_oa@whitelisted-registers-userspace-config:
    - shard-dg2-set2:     NOTRUN -> [SKIP][154] ([Intel XE#2541] / [Intel XE#3573]) +5 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-434/igt@xe_oa@whitelisted-registers-userspace-config.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][155] ([Intel XE#977])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-432/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][156] ([Intel XE#2838] / [Intel XE#979])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-433/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pm@d3cold-basic:
    - shard-bmg:          NOTRUN -> [SKIP][157] ([Intel XE#2284])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-3/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-dg2-set2:     NOTRUN -> [SKIP][158] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-433/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-dg2-set2:     [PASS][159] -> [ABORT][160] ([Intel XE#1358])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-434/igt@xe_pm@s2idle-basic-exec.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-432/igt@xe_pm@s2idle-basic-exec.html

  * igt@xe_pm@s2idle-vm-bind-unbind-all:
    - shard-dg2-set2:     NOTRUN -> [ABORT][161] ([Intel XE#1358] / [Intel XE#1794])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-unbind-all.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-lnl:          NOTRUN -> [SKIP][162] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-6/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-dg2-set2:     [PASS][163] -> [ABORT][164] ([Intel XE#1358] / [Intel XE#1794])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-464/igt@xe_pm@s3-d3hot-basic-exec.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-432/igt@xe_pm@s3-d3hot-basic-exec.html

  * igt@xe_pm@s4-basic-exec:
    - shard-lnl:          [PASS][165] -> [ABORT][166] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-lnl-1/igt@xe_pm@s4-basic-exec.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-2/igt@xe_pm@s4-basic-exec.html

  * igt@xe_query@multigpu-query-engines:
    - shard-bmg:          NOTRUN -> [SKIP][167] ([Intel XE#944])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-5/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-topology:
    - shard-dg2-set2:     NOTRUN -> [SKIP][168] ([Intel XE#944]) +3 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-435/igt@xe_query@multigpu-query-topology.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-lnl:          NOTRUN -> [SKIP][169] ([Intel XE#3342])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-4/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_vm@bind-no-array-conflict:
    - shard-bmg:          NOTRUN -> [SKIP][170] ([Intel XE#1130]) +28 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-7/igt@xe_vm@bind-no-array-conflict.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotrebind:
    - shard-bmg:          [SKIP][171] ([Intel XE#1885]) -> [PASS][172] +2 other tests pass
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-1/igt@core_hotunplug@hotrebind.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-4/igt@core_hotunplug@hotrebind.html

  * igt@core_setmaster@master-drop-set-user:
    - shard-bmg:          [FAIL][173] ([Intel XE#3249]) -> [PASS][174]
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-1/igt@core_setmaster@master-drop-set-user.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-2/igt@core_setmaster@master-drop-set-user.html

  * igt@fbdev@info:
    - shard-bmg:          [SKIP][175] ([Intel XE#2134]) -> [PASS][176] +3 other tests pass
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-7/igt@fbdev@info.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-6/igt@fbdev@info.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-bmg:          [INCOMPLETE][177] ([Intel XE#3861]) -> [PASS][178] +1 other test pass
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-6/igt@kms_async_flips@async-flip-suspend-resume.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-4/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic:
    - shard-lnl:          [FAIL][179] ([Intel XE#3719]) -> [PASS][180] +3 other tests pass
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-dg2-set2:     [SKIP][181] ([Intel XE#2136]) -> [PASS][182] +5 other tests pass
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-434/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-433/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@linear-16bpp-rotate-180:
    - shard-bmg:          [SKIP][183] ([Intel XE#2136]) -> [PASS][184] +21 other tests pass
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-1/igt@kms_big_fb@linear-16bpp-rotate-180.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-3/igt@kms_big_fb@linear-16bpp-rotate-180.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][185] ([Intel XE#2136] / [Intel XE#2351]) -> [PASS][186]
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-434/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-433/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][187] ([Intel XE#1727] / [Intel XE#3124]) -> [PASS][188]
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][189] ([Intel XE#3124]) -> [PASS][190]
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][191] ([Intel XE#1727] / [Intel XE#3113]) -> [PASS][192]
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-bmg:          [SKIP][193] ([Intel XE#2291]) -> [PASS][194] +3 other tests pass
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-dg2-set2:     [ABORT][195] -> [PASS][196]
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-432/igt@kms_fbcon_fbt@fbc-suspend.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-434/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:
    - shard-bmg:          [SKIP][197] ([Intel XE#2316]) -> [PASS][198] +1 other test pass
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-6/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-5/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][199] ([Intel XE#301]) -> [PASS][200] +3 other tests pass
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-dg2-set2:     [ABORT][201] ([Intel XE#2625]) -> [PASS][202]
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@busy-flip:
    - shard-dg2-set2:     [SKIP][203] ([Intel XE#2423] / [i915#2575]) -> [PASS][204] +14 other tests pass
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-434/igt@kms_flip@busy-flip.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-464/igt@kms_flip@busy-flip.html

  * igt@kms_flip@flip-vs-panning-interruptible:
    - shard-dg2-set2:     [INCOMPLETE][205] ([Intel XE#2049]) -> [PASS][206]
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-463/igt@kms_flip@flip-vs-panning-interruptible.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-464/igt@kms_flip@flip-vs-panning-interruptible.html

  * igt@kms_flip@flip-vs-panning-interruptible@c-dp4:
    - shard-dg2-set2:     [INCOMPLETE][207] -> [PASS][208] +1 other test pass
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-463/igt@kms_flip@flip-vs-panning-interruptible@c-dp4.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-464/igt@kms_flip@flip-vs-panning-interruptible@c-dp4.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [INCOMPLETE][209] ([Intel XE#2597]) -> [PASS][210]
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-wf_vblank-interruptible:
    - shard-lnl:          [FAIL][211] ([Intel XE#886]) -> [PASS][212] +7 other tests pass
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-lnl-2/igt@kms_flip@flip-vs-wf_vblank-interruptible.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-4/igt@kms_flip@flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip@plain-flip-ts-check:
    - shard-bmg:          [FAIL][213] ([Intel XE#2882]) -> [PASS][214] +2 other tests pass
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-4/igt@kms_flip@plain-flip-ts-check.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-2/igt@kms_flip@plain-flip-ts-check.html
    - shard-lnl:          [FAIL][215] ([Intel XE#3149] / [Intel XE#886]) -> [PASS][216]
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-lnl-1/igt@kms_flip@plain-flip-ts-check.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-7/igt@kms_flip@plain-flip-ts-check.html

  * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
    - shard-lnl:          [INCOMPLETE][217] ([Intel XE#2050]) -> [PASS][218]
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          [SKIP][219] ([Intel XE#2571]) -> [PASS][220]
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-3/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation:
    - shard-bmg:          [SKIP][221] ([Intel XE#2423]) -> [PASS][222] +103 other tests pass
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-7/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-8/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-bmg:          [SKIP][223] ([Intel XE#2446]) -> [PASS][224] +2 other tests pass
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-7/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-3/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-dg2-set2:     [SKIP][225] ([Intel XE#2446]) -> [PASS][226] +1 other test pass
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-434/igt@kms_pm_rpm@universal-planes-dpms.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-436/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_vrr@flipline:
    - shard-lnl:          [FAIL][227] ([Intel XE#1522]) -> [PASS][228] +1 other test pass
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-lnl-7/igt@kms_vrr@flipline.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-6/igt@kms_vrr@flipline.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:
    - shard-dg2-set2:     [SKIP][229] ([Intel XE#1392]) -> [PASS][230]
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html

  * igt@xe_mmap@pci-membarrier-bad-object:
    - shard-dg2-set2:     [SKIP][231] ([Intel XE#4045]) -> [PASS][232] +1 other test pass
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-433/igt@xe_mmap@pci-membarrier-bad-object.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-435/igt@xe_mmap@pci-membarrier-bad-object.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-dg2-set2:     [ABORT][233] ([Intel XE#1358] / [Intel XE#1794]) -> [PASS][234]
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-432/igt@xe_pm@s4-vm-bind-unbind-all.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-463/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_spin_batch@spin-all:
    - shard-bmg:          [SKIP][235] ([Intel XE#1130]) -> [PASS][236] +231 other tests pass
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-1/igt@xe_spin_batch@spin-all.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-8/igt@xe_spin_batch@spin-all.html

  * igt@xe_vm@invalid-extensions:
    - shard-dg2-set2:     [SKIP][237] ([Intel XE#1130]) -> [PASS][238] +27 other tests pass
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-434/igt@xe_vm@invalid-extensions.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-463/igt@xe_vm@invalid-extensions.html

  
#### Warnings ####

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          [SKIP][239] ([Intel XE#2423]) -> [SKIP][240] ([Intel XE#2370]) +1 other test skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-bmg:          [SKIP][241] ([Intel XE#2136]) -> [SKIP][242] ([Intel XE#2327]) +3 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-7/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-3/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][243] ([Intel XE#2136]) -> [SKIP][244] ([Intel XE#316])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-434/igt@kms_big_fb@linear-16bpp-rotate-270.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-bmg:          [SKIP][245] ([Intel XE#2327]) -> [SKIP][246] ([Intel XE#2136]) +2 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-8/igt@kms_big_fb@linear-8bpp-rotate-270.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-1/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-bmg:          [SKIP][247] ([Intel XE#2327]) -> [SKIP][248] ([Intel XE#2136] / [Intel XE#2231])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-4/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-6/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][249] ([Intel XE#2136]) -> [SKIP][250] ([Intel XE#1124]) +2 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-434/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-434/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-bmg:          [SKIP][251] ([Intel XE#2328]) -> [SKIP][252] ([Intel XE#2136])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          [SKIP][253] ([Intel XE#2136]) -> [SKIP][254] ([Intel XE#610])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-7/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-6/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [SKIP][255] ([Intel XE#2136]) -> [SKIP][256] ([Intel XE#1124]) +15 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          [SKIP][257] ([Intel XE#607]) -> [SKIP][258] ([Intel XE#2136])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-bmg:          [SKIP][259] ([Intel XE#1124]) -> [SKIP][260] ([Intel XE#2136]) +15 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-bmg:          [SKIP][261] ([Intel XE#1124]) -> [SKIP][262] ([Intel XE#2136] / [Intel XE#2231])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [SKIP][263] ([Intel XE#2423]) -> [SKIP][264] ([Intel XE#2314] / [Intel XE#2894])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-bmg:          [SKIP][265] ([Intel XE#2423]) -> [SKIP][266] ([Intel XE#367]) +2 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [SKIP][267] ([Intel XE#367]) -> [SKIP][268] ([Intel XE#2423]) +4 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-2/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-1/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs:
    - shard-bmg:          [SKIP][269] ([Intel XE#2887]) -> [SKIP][270] ([Intel XE#2136] / [Intel XE#2231])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-4/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-6/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][271] ([Intel XE#2136]) -> [SKIP][272] ([Intel XE#455] / [Intel XE#787])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-ccs:
    - shard-bmg:          [SKIP][273] ([Intel XE#2887]) -> [SKIP][274] ([Intel XE#2136]) +22 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-2/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-7/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-bmg:          [SKIP][275] ([Intel XE#3432]) -> [SKIP][276] ([Intel XE#2136]) +4 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          [SKIP][277] ([Intel XE#2136]) -> [SKIP][278] ([Intel XE#2887]) +25 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][279] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][280] ([Intel XE#455] / [Intel XE#787])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-bmg:          [SKIP][281] ([Intel XE#2136]) -> [SKIP][282] ([Intel XE#2724])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-1/igt@kms_cdclk@mode-transition.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-3/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          [SKIP][283] ([Intel XE#2724]) -> [SKIP][284] ([Intel XE#2136]) +1 other test skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-5/igt@kms_cdclk@mode-transition-all-outputs.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-7/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-bmg:          [SKIP][285] ([Intel XE#2325]) -> [SKIP][286] ([Intel XE#2423]) +2 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-3/igt@kms_chamelium_color@ctm-0-50.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-7/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-bmg:          [SKIP][287] ([Intel XE#2423]) -> [SKIP][288] ([Intel XE#2252]) +11 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-1/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-6/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-dg2-set2:     [SKIP][289] ([Intel XE#2423] / [i915#2575]) -> [SKIP][290] ([Intel XE#373]) +1 other test skip
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-434/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-436/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-bmg:          [SKIP][291] ([Intel XE#2252]) -> [SKIP][292] ([Intel XE#2423]) +12 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-5/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-7/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [SKIP][293] ([Intel XE#2423]) -> [FAIL][294] ([Intel XE#1178])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-1/igt@kms_content_protection@legacy.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-5/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          [FAIL][295] ([Intel XE#1178]) -> [SKIP][296] ([Intel XE#2423])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-3/igt@kms_content_protection@lic-type-0.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-1/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@mei-interface:
    - shard-bmg:          [SKIP][297] ([Intel XE#2341]) -> [SKIP][298] ([Intel XE#2423])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-3/igt@kms_content_protection@mei-interface.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-7/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [FAIL][299] ([Intel XE#1188]) -> [SKIP][300] ([Intel XE#2423])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-2/igt@kms_content_protection@uevent.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-7/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-bmg:          [SKIP][301] ([Intel XE#2423]) -> [SKIP][302] ([Intel XE#2321]) +2 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-4/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-bmg:          [SKIP][303] ([Intel XE#2320]) -> [SKIP][304] ([Intel XE#2423]) +10 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-2/igt@kms_cursor_crc@cursor-random-32x32.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-1/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-bmg:          [SKIP][305] ([Intel XE#2423]) -> [SKIP][306] ([Intel XE#2320]) +4 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-7/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-bmg:          [SKIP][307] ([Intel XE#2321]) -> [SKIP][308] ([Intel XE#2423])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-1/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          [SKIP][309] ([Intel XE#2321]) -> [SKIP][310] ([Intel XE#3007])
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-bmg:          [SKIP][311] ([Intel XE#2423]) -> [SKIP][312] ([Intel XE#2291])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-bmg:          [SKIP][313] ([Intel XE#2286]) -> [SKIP][314] ([Intel XE#2423]) +1 other test skip
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [DMESG-WARN][315] ([Intel XE#877]) -> [SKIP][316] ([Intel XE#2423])
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-bmg:          [SKIP][317] ([Intel XE#2291]) -> [SKIP][318] ([Intel XE#2423]) +1 other test skip
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2-set2:     [SKIP][319] ([Intel XE#2423] / [i915#2575]) -> [SKIP][320] ([Intel XE#323])
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-435/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][321] ([Intel XE#1508]) -> [SKIP][322] ([Intel XE#2136] / [Intel XE#2231])
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-5/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          [FAIL][323] ([Intel XE#2141]) -> [SKIP][324] ([Intel XE#2136])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-8/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-1/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-bmg:          [SKIP][325] ([Intel XE#2244]) -> [SKIP][326] ([Intel XE#2136]) +1 other test skip
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-5/igt@kms_dsc@dsc-with-bpc.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-1/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          [SKIP][327] ([Intel XE#776]) -> [SKIP][328] ([Intel XE#2136])
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-6/igt@kms_fbcon_fbt@psr-suspend.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-1/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-bmg:          [SKIP][329] ([Intel XE#2423]) -> [SKIP][330] ([Intel XE#2372])
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-7/igt@kms_feature_discovery@chamelium.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-2/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-bmg:          [SKIP][331] ([Intel XE#2375]) -> [SKIP][332] ([Intel XE#2423])
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-8/igt@kms_feature_discovery@dp-mst.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-1/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          [SKIP][333] ([Intel XE#2423]) -> [SKIP][334] ([Intel XE#2374])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-1/igt@kms_feature_discovery@psr2.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-4/igt@kms_feature_discovery@psr2.html
    - shard-dg2-set2:     [SKIP][335] ([Intel XE#2423] / [i915#2575]) -> [SKIP][336] ([Intel XE#1135])
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-434/igt@kms_feature_discovery@psr2.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-464/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-bmg:          [FAIL][337] -> [SKIP][338] ([Intel XE#2423])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-bmg:          [INCOMPLETE][339] -> [SKIP][340] ([Intel XE#3007])
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-4/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-6/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [SKIP][341] ([Intel XE#2316]) -> [SKIP][342] ([Intel XE#2423]) +2 other tests skip
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-1/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@2x-plain-flip:
    - shard-bmg:          [SKIP][343] ([Intel XE#2423]) -> [SKIP][344] ([Intel XE#2316]) +2 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-1/igt@kms_flip@2x-plain-flip.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-6/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][345] ([Intel XE#2136]) -> [SKIP][346] ([Intel XE#455])
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          [SKIP][347] ([Intel XE#2380]) -> [SKIP][348] ([Intel XE#2136])
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          [SKIP][349] ([Intel XE#2136]) -> [SKIP][350] ([Intel XE#2293] / [Intel XE#2380]) +6 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-bmg:          [SKIP][351] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][352] ([Intel XE#2136]) +6 other tests skip
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][353] ([Intel XE#2311]) -> [SKIP][354] ([Intel XE#2136] / [Intel XE#2231]) +1 other test skip
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][355] ([Intel XE#2136]) -> [SKIP][356] ([Intel XE#2312]) +5 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][357] ([Intel XE#2312]) -> [SKIP][358] ([Intel XE#2136]) +7 other tests skip
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][359] ([Intel XE#2312]) -> [SKIP][360] ([Intel XE#2311]) +4 other tests skip
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][361] ([Intel XE#2136]) -> [SKIP][362] ([Intel XE#651]) +1 other test skip
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:
    - shard-bmg:          [SKIP][363] ([Intel XE#2136]) -> [SKIP][364] ([Intel XE#2136] / [Intel XE#2231]) +15 other tests skip
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
    - shard-bmg:          [SKIP][365] ([Intel XE#2136]) -> [SKIP][366] ([Intel XE#2311]) +28 other tests skip
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [FAIL][367] ([Intel XE#2333]) -> [SKIP][368] ([Intel XE#2136]) +23 other tests skip
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [FAIL][369] ([Intel XE#2333]) -> [SKIP][370] ([Intel XE#2312])
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][371] ([Intel XE#2136]) -> [FAIL][372] ([Intel XE#2333]) +22 other tests fail
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [FAIL][373] ([Intel XE#2333]) -> [SKIP][374] ([Intel XE#2136] / [Intel XE#2231])
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:
    - shard-bmg:          [SKIP][375] ([Intel XE#2312]) -> [FAIL][376] ([Intel XE#2333])
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-bmg:          [SKIP][377] ([Intel XE#2136]) -> [SKIP][378] ([Intel XE#2352])
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][379] ([Intel XE#2311]) -> [SKIP][380] ([Intel XE#2136]) +37 other tests skip
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move:
    - shard-dg2-set2:     [SKIP][381] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][382] ([Intel XE#651]) +1 other test skip
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff:
    - shard-bmg:          [SKIP][383] ([Intel XE#2311]) -> [SKIP][384] ([Intel XE#2312]) +2 other tests skip
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][385] ([Intel XE#2312]) -> [SKIP][386] ([Intel XE#2313]) +2 other tests skip
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][387] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][388] ([Intel XE#653]) +1 other test skip
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][389] ([Intel XE#2313]) -> [SKIP][390] ([Intel XE#2312]) +5 other tests skip
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][391] ([Intel XE#2136]) -> [SKIP][392] ([Intel XE#2313]) +37 other tests skip
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][393] ([Intel XE#2313]) -> [SKIP][394] ([Intel XE#2136] / [Intel XE#2231]) +1 other test skip
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-bmg:          [SKIP][395] ([Intel XE#2313]) -> [SKIP][396] ([Intel XE#2136]) +37 other tests skip
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][397] ([Intel XE#2136]) -> [SKIP][398] ([Intel XE#653]) +4 other tests skip
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-bmg:          [SKIP][399] ([Intel XE#2502]) -> [SKIP][400] ([Intel XE#2423])
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-3/igt@kms_getfb@getfb-reject-ccs.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-1/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][401] ([Intel XE#2423]) -> [SKIP][402] ([Intel XE#3374] / [Intel XE#3544])
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][403] ([Intel XE#2423]) -> [SKIP][404] ([Intel XE#1503])
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-7/igt@kms_hdr@invalid-hdr.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-6/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-bmg:          [SKIP][405] ([Intel XE#2934]) -> [SKIP][406] ([Intel XE#2136]) +1 other test skip
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-4/igt@kms_joiner@basic-force-ultra-joiner.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-1/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-bmg:          [SKIP][407] ([Intel XE#2136]) -> [SKIP][408] ([Intel XE#2927])
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-1/igt@kms_joiner@basic-ultra-joiner.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-4/igt@kms_joiner@basic-ultra-joiner.html
    - shard-dg2-set2:     [SKIP][409] ([Intel XE#2136]) -> [SKIP][410] ([Intel XE#2927])
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-434/igt@kms_joiner@basic-ultra-joiner.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-433/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-bmg:          [SKIP][411] ([Intel XE#346]) -> [SKIP][412] ([Intel XE#2136])
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-4/igt@kms_joiner@invalid-modeset-big-joiner.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-7/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-bmg:          [SKIP][413] ([Intel XE#2136]) -> [SKIP][414] ([Intel XE#3012])
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-7/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-bmg:          [SKIP][415] ([Intel XE#2927]) -> [SKIP][416] ([Intel XE#2136])
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-6/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-1/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          [SKIP][417] ([Intel XE#2486]) -> [SKIP][418] ([Intel XE#2423]) +1 other test skip
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-6/igt@kms_panel_fitting@legacy.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-1/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          [SKIP][419] ([Intel XE#2423]) -> [SKIP][420] ([Intel XE#2493])
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-1/igt@kms_plane_multiple@tiling-yf.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-4/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - shard-dg2-set2:     [SKIP][421] ([Intel XE#2423] / [i915#2575]) -> [SKIP][422] ([Intel XE#2763] / [Intel XE#455])
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-bmg:          [SKIP][423] ([Intel XE#2423]) -> [SKIP][424] ([Intel XE#2763]) +4 other tests skip
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-bmg:          [SKIP][425] ([Intel XE#2763]) -> [SKIP][426] ([Intel XE#2423]) +3 other tests skip
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-bmg:          [SKIP][427] ([Intel XE#2136]) -> [SKIP][428] ([Intel XE#870])
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-7/igt@kms_pm_backlight@basic-brightness.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-4/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          [SKIP][429] ([Intel XE#2938]) -> [SKIP][430] ([Intel XE#2136])
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-2/igt@kms_pm_backlight@brightness-with-dpms.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-1/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade:
    - shard-bmg:          [SKIP][431] ([Intel XE#870]) -> [SKIP][432] ([Intel XE#2136]) +1 other test skip
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-6/igt@kms_pm_backlight@fade.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-1/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-bmg:          [SKIP][433] ([Intel XE#2391]) -> [SKIP][434] ([Intel XE#2136])
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-3/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-7/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-bmg:          [SKIP][435] ([Intel XE#2136]) -> [SKIP][436] ([Intel XE#2392])
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-1/igt@kms_pm_dc@dc5-psr.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-2/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          [SKIP][437] ([Intel XE#2446]) -> [SKIP][438] ([Intel XE#1439] / [Intel XE#836])
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-1/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-8/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][439] ([Intel XE#1489]) -> [SKIP][440] ([Intel XE#2136]) +10 other tests skip
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-4/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-1/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][441] ([Intel XE#2136]) -> [SKIP][442] ([Intel XE#1489]) +6 other tests skip
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-8/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][443] ([Intel XE#2136]) -> [SKIP][444] ([Intel XE#1489]) +1 other test skip
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-434/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-432/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-bmg:          [SKIP][445] ([Intel XE#2136]) -> [SKIP][446] ([Intel XE#2387])
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-7/igt@kms_psr2_su@page_flip-nv12.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-4/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-bmg:          [SKIP][447] ([Intel XE#2387]) -> [SKIP][448] ([Intel XE#2136] / [Intel XE#2231])
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-8/igt@kms_psr2_su@page_flip-xrgb8888.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-6/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
    - shard-dg2-set2:     [SKIP][449] ([Intel XE#2136]) -> [SKIP][450] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-434/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-436/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr2-primary-blt:
    - shard-bmg:          [SKIP][451] ([Intel XE#2136]) -> [SKIP][452] ([Intel XE#2234] / [Intel XE#2850]) +15 other tests skip
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-1/igt@kms_psr@fbc-psr2-primary-blt.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-2/igt@kms_psr@fbc-psr2-primary-blt.html

  * igt@kms_psr@psr-basic:
    - shard-bmg:          [SKIP][453] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][454] ([Intel XE#2136] / [Intel XE#2231]) +1 other test skip
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-5/igt@kms_psr@psr-basic.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-6/igt@kms_psr@psr-basic.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-bmg:          [SKIP][455] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][456] ([Intel XE#2136]) +23 other tests skip
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-5/igt@kms_psr@psr-primary-page-flip.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-7/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr@psr2-primary-blt:
    - shard-dg2-set2:     [SKIP][457] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][458] ([Intel XE#2850] / [Intel XE#929])
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-434/igt@kms_psr@psr2-primary-blt.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-434/igt@kms_psr@psr2-primary-blt.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          [SKIP][459] ([Intel XE#2136]) -> [SKIP][460] ([Intel XE#2234])
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-1/igt@kms_psr@psr2-primary-render.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-4/igt@kms_psr@psr2-primary-render.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          [SKIP][461] ([Intel XE#2136]) -> [SKIP][462] ([Intel XE#2414])
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-bmg:          [SKIP][463] ([Intel XE#2330]) -> [SKIP][464] ([Intel XE#2423])
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-bmg:          [SKIP][465] ([Intel XE#3414] / [Intel XE#3904]) -> [SKIP][466] ([Intel XE#2423]) +1 other test skip
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-bmg:          [SKIP][467] ([Intel XE#2423]) -> [SKIP][468] ([Intel XE#3414] / [Intel XE#3904]) +3 other tests skip
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-1/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-8/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-bmg:          [SKIP][469] ([Intel XE#2423]) -> [SKIP][470] ([Intel XE#3007]) +10 other tests skip
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-center.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-6/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-bmg:          [SKIP][471] ([Intel XE#2413]) -> [SKIP][472] ([Intel XE#2423])
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-2/igt@kms_scaling_modes@scaling-mode-full-aspect.html
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-bmg:          [SKIP][473] ([Intel XE#2450]) -> [SKIP][474] ([Intel XE#2423])
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-5/igt@kms_tv_load_detect@load-detect.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-1/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-bmg:          [SKIP][475] ([Intel XE#2423]) -> [INCOMPLETE][476] ([Intel XE#3864])
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-7/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-6/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vrr@cmrr:
    - shard-bmg:          [SKIP][477] ([Intel XE#2423]) -> [SKIP][478] ([Intel XE#2168])
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-7/igt@kms_vrr@cmrr.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-5/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@flip-dpms:
    - shard-bmg:          [SKIP][479] ([Intel XE#2423]) -> [SKIP][480] ([Intel XE#1499])
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-7/igt@kms_vrr@flip-dpms.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-8/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-dg2-set2:     [SKIP][481] ([Intel XE#2423] / [i915#2575]) -> [SKIP][482] ([Intel XE#455])
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-434/igt@kms_vrr@seamless-rr-switch-drrs.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-435/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-bmg:          [SKIP][483] ([Intel XE#1499]) -> [SKIP][484] ([Intel XE#2423]) +2 other tests skip
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-6/igt@kms_vrr@seamless-rr-switch-virtual.html
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-7/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-bmg:          [SKIP][485] ([Intel XE#756]) -> [SKIP][486] ([Intel XE#2423])
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-8/igt@kms_writeback@writeback-check-output-xrgb2101010.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-7/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-bmg:          [SKIP][487] ([Intel XE#2423]) -> [SKIP][488] ([Intel XE#1091] / [Intel XE#2849])
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-7/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-8/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-bmg:          [SKIP][489] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][490] ([Intel XE#2423])
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-4/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-1/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-dg2-set2:     [SKIP][491] ([Intel XE#1130]) -> [SKIP][492] ([Intel XE#1280] / [Intel XE#455])
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-434/igt@xe_compute_preempt@compute-preempt.html
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-436/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          [SKIP][493] ([Intel XE#1130]) -> [SKIP][494] ([Intel XE#2504])
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-1/igt@xe_create@multigpu-create-massive-size.html
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-3/igt@xe_create@multigpu-create-massive-size.html
    - shard-dg2-set2:     [SKIP][495] ([Intel XE#1130]) -> [SKIP][496] ([Intel XE#944])
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-434/igt@xe_create@multigpu-create-massive-size.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-463/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
    - shard-bmg:          [SKIP][497] ([Intel XE#1130]) -> [SKIP][498] ([Intel XE#2905]) +14 other tests skip
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html

  * igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:
    - shard-dg2-set2:     [SKIP][499] ([Intel XE#1130]) -> [SKIP][500] ([Intel XE#3889])
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-434/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-464/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html
    - shard-bmg:          [SKIP][501] ([Intel XE#1130]) -> [SKIP][502] ([Intel XE#3889])
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-1/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html

  * igt@xe_eudebug@discovery-empty:
    - shard-bmg:          [SKIP][503] ([Intel XE#2905]) -> [SKIP][504] ([Intel XE#1130]) +17 other tests skip
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-6/igt@xe_eudebug@discovery-empty.html
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-7/igt@xe_eudebug@discovery-empty.html

  * igt@xe_eudebug_online@set-breakpoint:
    - shard-dg2-set2:     [SKIP][505] ([Intel XE#1130]) -> [SKIP][506] ([Intel XE#2905])
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-434/igt@xe_eudebug_online@set-breakpoint.html
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-434/igt@xe_eudebug_online@set-breakpoint.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          [SKIP][507] ([Intel XE#1130]) -> [SKIP][508] ([Intel XE#2322]) +9 other tests skip
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-bmg:          [SKIP][509] ([Intel XE#2322]) -> [SKIP][510] ([Intel XE#1130]) +16 other tests skip
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-8/igt@xe_exec_basic@multigpu-once-null-rebind.html
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-1/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_exec_fault_mode@twice-basic-prefetch:
    - shard-dg2-set2:     [SKIP][511] ([Intel XE#1130]) -> [SKIP][512] ([Intel XE#288]) +3 other tests skip
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-434/igt@xe_exec_fault_mode@twice-basic-prefetch.html
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-435/igt@xe_exec_fault_mode@twice-basic-prefetch.html

  * igt@xe_media_fill@media-fill:
    - shard-bmg:          [SKIP][513] ([Intel XE#1130]) -> [SKIP][514] ([Intel XE#2459] / [Intel XE#2596])
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-1/igt@xe_media_fill@media-fill.html
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-5/igt@xe_media_fill@media-fill.html

  * igt@xe_mmap@pci-membarrier-bad-pagesize:
    - shard-bmg:          [SKIP][515] ([Intel XE#4045]) -> [SKIP][516] ([Intel XE#1130])
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-3/igt@xe_mmap@pci-membarrier-bad-pagesize.html
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-7/igt@xe_mmap@pci-membarrier-bad-pagesize.html

  * igt@xe_oa@buffer-fill:
    - shard-dg2-set2:     [SKIP][517] ([Intel XE#1130]) -> [SKIP][518] ([Intel XE#2541] / [Intel XE#3573])
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-434/igt@xe_oa@buffer-fill.html
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-434/igt@xe_oa@buffer-fill.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          [SKIP][519] ([Intel XE#1130]) -> [SKIP][520] ([Intel XE#2245])
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-1/igt@xe_pat@pat-index-xelp.html
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-4/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-bmg:          [SKIP][521] ([Intel XE#1130]) -> [SKIP][522] ([Intel XE#2236])
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-7/igt@xe_pat@pat-index-xelpg.html
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-4/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-bmg:          [SKIP][523] ([Intel XE#1130]) -> [SKIP][524] ([Intel XE#2284]) +1 other test skip
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-7/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-4/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-bmg:          [SKIP][525] ([Intel XE#2284]) -> [SKIP][526] ([Intel XE#1130]) +2 other tests skip
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-4/igt@xe_pm@s3-d3cold-basic-exec.html
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-7/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-bmg:          [SKIP][527] ([Intel XE#1130]) -> [SKIP][528] ([Intel XE#944]) +3 other tests skip
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-7/igt@xe_query@multigpu-query-hwconfig.html
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-2/igt@xe_query@multigpu-query-hwconfig.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-bmg:          [SKIP][529] ([Intel XE#944]) -> [SKIP][530] ([Intel XE#1130]) +5 other tests skip
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-2/igt@xe_query@multigpu-query-invalid-cs-cycles.html
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-1/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-bmg:          [SKIP][531] ([Intel XE#3342]) -> [SKIP][532] ([Intel XE#1130])
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-6/igt@xe_sriov_flr@flr-vf1-clear.html
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-1/igt@xe_sriov_flr@flr-vf1-clear.html

  
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1522
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2141
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
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
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2502]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2502
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
  [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2932]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#3007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#3026]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3026
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3719]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3719
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3861
  [Intel XE#3864]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3864
  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4045]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4045
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * IGT: IGT_8195 -> IGTPW_12450
  * Linux: xe-2497-2334d1179d652eb4032fcb0d8e6f53cbc6a1011c -> xe-2501-596a18adf934dd4a61e15c72b7e1e4ddae489474

  IGTPW_12450: c39b75a0b25211edcf46f78b95c8bf019186a04f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8195: 8195
  xe-2497-2334d1179d652eb4032fcb0d8e6f53cbc6a1011c: 2334d1179d652eb4032fcb0d8e6f53cbc6a1011c
  xe-2501-596a18adf934dd4a61e15c72b7e1e4ddae489474: 596a18adf934dd4a61e15c72b7e1e4ddae489474

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/index.html

--===============5665956350777069628==
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
<tr><td><b>Series:</b></td><td>Add test for configurable OA buffer size (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/142128/">https://patchwork.freedesktop.org/series/142128/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8195_full -&gt; XEIGTPW_12450_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12450_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_12450_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12450_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-436/igt@core_hotunplug@hotreplug.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-463/igt@core_hotunplug@hotreplug.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-464/igt@kms_dp_linktrain_fallback@dp-fallback.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-433/igt@kms_dp_linktrain_fallback@dp-fallback.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8195_full and XEIGTPW_12450_full:</p>
<h3>New IGT tests (45)</h3>
<ul>
<li>
<p>igt@kms_atomic@crtc-invalid-params-fence@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-legacy@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-transparent@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-transparent@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x128@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x128@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@128x128-left-edge@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@128x128-left-edge@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@ac-hdmi-a6-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@ad-hdmi-a6-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@bc-hdmi-a6-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@bd-hdmi-a6-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@a-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@b-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@d-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big-interruptible@a-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big-interruptible@b-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big-interruptible@c-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big-interruptible@d-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@busy-flip@a-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@busy-flip@b-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@busy-flip@c-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@busy-flip@d-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@nonexisting-fb@a-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@nonexisting-fb@b-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@nonexisting-fb@c-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@nonexisting-fb@d-hdmi-a6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@queue-busy@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@queue-busy@pipe-b-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@queue-busy@pipe-c-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@queue-busy@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-busy-hang@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-busy-hang@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.38] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-zero-reason@ccs-0-16mb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.82] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-zero-reason@ccs-0-32mb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.81] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-zero-reason@ccs-0-8mb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.81] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-zero-reason@rcs-0-16mb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.88] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-zero-reason@rcs-0-32mb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.89] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-zero-reason@rcs-0-8mb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.88] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12450_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unplug-rescan:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-2/igt@core_hotunplug@unplug-rescan.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-1/igt@core_hotunplug@unplug-rescan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-read:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-3/igt@fbdev@unaligned-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-1/igt@fbdev@unaligned-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-435/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-5/igt@kms_async_flips@test-cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/664">Intel XE#664</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-5/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-1/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-435/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-7/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-464/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-433/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-435/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-7/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-8/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-2/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-433/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +23 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442">Intel XE#3442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-6/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +118 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-463/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-3/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-2/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-463/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-planes-random:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-2/igt@kms_chamelium_frames@hdmi-crc-planes-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-6/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +9 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-1/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-5/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-5/igt@kms_content_protection@legacy@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-464/igt@kms_content_protection@srm@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-432/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-6/igt@kms_cursor_crc@cursor-random-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-varying-size:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-lnl-5/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-5/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-436/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-435/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-3/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-3/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-lnl-7/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-8/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-lnl-6/igt@kms_flip@flip-vs-suspend@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-4/igt@kms_flip@flip-vs-suspend@c-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932">Intel XE#2932</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-accept-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-3/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340">Intel XE#2340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-434/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-6/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-1/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-436/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934">Intel XE#2934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-464/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-5/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307">Intel XE#3307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-1/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +123 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-436/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-436/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-lnl-4/igt@kms_pm_dc@dc5-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-5/igt@kms_pm_dc@dc5-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-432/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-8/igt@kms_pm_rpm@cursor.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-1/igt@kms_pm_rpm@cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-6/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@blob-prop-core:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-6/igt@kms_prop_blob@blob-prop-core.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-6/igt@kms_prop_blob@blob-prop-core.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-3/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-435/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-2/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-6/igt@kms_psr@pr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-432/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-8/igt@kms_psr@psr2-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-2/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-lnl-3/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-7/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-4/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-432/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-6/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-6/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3864">Intel XE#3864</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-6/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-433/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-432/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt@engine-drm_xe_engine_class_compute:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-436/igt@xe_compute_preempt@compute-preempt@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-reconnect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-2/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@resume-dss:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-436/igt@xe_eudebug_online@resume-dss.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@stopped-thread:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-1/igt@xe_eudebug_online@stopped-thread.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-2/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-2/igt@xe_evict@evict-beng-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-parallel-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-3/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-1/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +275 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-5/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-434/igt@xe_exec_basic@multigpu-once-null-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-464/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-463/igt@xe_gt_freq@freq_suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-432/igt@xe_gt_freq@freq_suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-434/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-8/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-1/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-8/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3026">Intel XE#3026</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-432/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-5/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-7/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999">Intel XE#1999</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-5/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-7/igt@xe_oa@unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248">Intel XE#2248</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@whitelisted-registers-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-434/igt@xe_oa@whitelisted-registers-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-432/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-433/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-3/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-433/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-434/igt@xe_pm@s2idle-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-432/igt@xe_pm@s2idle-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-6/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-464/igt@xe_pm@s3-d3hot-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-432/igt@xe_pm@s3-d3hot-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-lnl-1/igt@xe_pm@s4-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-2/igt@xe_pm@s4-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-5/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-435/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-4/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-no-array-conflict:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-7/igt@xe_vm@bind-no-array-conflict.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +28 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-1/igt@core_hotunplug@hotrebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-4/igt@core_hotunplug@hotrebind.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-1/igt@core_setmaster@master-drop-set-user.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249">Intel XE#3249</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-2/igt@core_setmaster@master-drop-set-user.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-7/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-6/igt@fbdev@info.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-6/igt@kms_async_flips@async-flip-suspend-resume.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3861">Intel XE#3861</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-4/igt@kms_async_flips@async-flip-suspend-resume.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3719">Intel XE#3719</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-434/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-433/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-1/igt@kms_big_fb@linear-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-3/igt@kms_big_fb@linear-16bpp-rotate-180.html">PASS</a> +21 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-434/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-433/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-432/igt@kms_fbcon_fbt@fbc-suspend.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-434/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-6/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-5/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@busy-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-434/igt@kms_flip@busy-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-464/igt@kms_flip@busy-flip.html">PASS</a> +14 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-463/igt@kms_flip@flip-vs-panning-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-464/igt@kms_flip@flip-vs-panning-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-interruptible@c-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-463/igt@kms_flip@flip-vs-panning-interruptible@c-dp4.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-464/igt@kms_flip@flip-vs-panning-interruptible@c-dp4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-lnl-2/igt@kms_flip@flip-vs-wf_vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-4/igt@kms_flip@flip-vs-wf_vblank-interruptible.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-4/igt@kms_flip@plain-flip-ts-check.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-2/igt@kms_flip@plain-flip-ts-check.html">PASS</a> +2 other tests pass</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-lnl-1/igt@kms_flip@plain-flip-ts-check.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-7/igt@kms_flip@plain-flip-ts-check.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050">Intel XE#2050</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571">Intel XE#2571</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-3/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-7/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-8/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html">PASS</a> +103 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-7/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-3/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-434/igt@kms_pm_rpm@universal-planes-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-436/igt@kms_pm_rpm@universal-planes-dpms.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-lnl-7/igt@kms_vrr@flipline.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1522">Intel XE#1522</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-lnl-6/igt@kms_vrr@flipline.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier-bad-object:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-433/igt@xe_mmap@pci-membarrier-bad-object.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4045">Intel XE#4045</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-435/igt@xe_mmap@pci-membarrier-bad-object.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-432/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-463/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-all:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-1/igt@xe_spin_batch@spin-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-8/igt@xe_spin_batch@spin-all.html">PASS</a> +231 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_vm@invalid-extensions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-434/igt@xe_vm@invalid-extensions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-463/igt@xe_vm@invalid-extensions.html">PASS</a> +27 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-7/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-3/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-434/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-8/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-1/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-4/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-6/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-434/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-434/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328">Intel XE#2328</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-7/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-6/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-2/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-1/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-4/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-6/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-2/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-7/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-1/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-3/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-5/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-7/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-3/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-7/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-1/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-6/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-434/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-436/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-5/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-7/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-1/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-5/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-3/igt@kms_content_protection@lic-type-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-1/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-3/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-7/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-2/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-7/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-4/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-2/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-1/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-7/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-1/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-435/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-5/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-8/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2141">Intel XE#2141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-1/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-5/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-1/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-6/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-1/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-7/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-2/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372">Intel XE#2372</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-8/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375">Intel XE#2375</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-1/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-1/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-4/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#2374</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-434/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-464/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-4/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-6/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-1/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-1/igt@kms_flip@2x-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-6/igt@kms_flip@2x-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +22 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +37 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +37 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +37 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-3/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2502">Intel XE#2502</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-1/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-7/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-6/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-4/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934">Intel XE#2934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-1/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-1/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-4/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-434/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-433/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-4/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-7/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-7/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-6/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-1/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-6/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486">Intel XE#2486</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-1/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-1/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-4/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel XE#2493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-7/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-4/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-2/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-1/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-6/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-1/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-3/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391">Intel XE#2391</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-7/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-1/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-2/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">Intel XE#2392</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-1/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-8/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-4/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-1/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-8/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-434/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-432/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-7/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-4/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-8/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-6/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-434/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-436/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-1/igt@kms_psr@fbc-psr2-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-2/igt@kms_psr@fbc-psr2-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-5/igt@kms_psr@psr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-6/igt@kms_psr@psr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-5/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-7/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-434/igt@kms_psr@psr2-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-434/igt@kms_psr@psr2-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-1/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-4/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-1/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-8/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-6/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-2/igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-5/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450">Intel XE#2450</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-1/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-7/igt@kms_vblank@ts-continuation-dpms-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-6/igt@kms_vblank@ts-continuation-dpms-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3864">Intel XE#3864</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-7/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-5/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-7/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-8/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-434/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-435/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-6/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-7/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-8/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-7/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-7/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-8/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-4/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-1/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-434/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-436/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-1/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-3/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504">Intel XE#2504</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-434/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-463/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-metadata-discovery:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-434/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-464/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-1/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-empty:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-6/igt@xe_eudebug@discovery-empty.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-7/igt@xe_eudebug@discovery-empty.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-434/igt@xe_eudebug_online@set-breakpoint.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-434/igt@xe_eudebug_online@set-breakpoint.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-8/igt@xe_exec_basic@multigpu-once-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-1/igt@xe_exec_basic@multigpu-once-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-basic-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-434/igt@xe_exec_fault_mode@twice-basic-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-435/igt@xe_exec_fault_mode@twice-basic-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-1/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-5/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459">Intel XE#2459</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596">Intel XE#2596</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier-bad-pagesize:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-3/igt@xe_mmap@pci-membarrier-bad-pagesize.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4045">Intel XE#4045</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-7/igt@xe_mmap@pci-membarrier-bad-pagesize.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-fill:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-dg2-434/igt@xe_oa@buffer-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-dg2-434/igt@xe_oa@buffer-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-4/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-7/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-4/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-7/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-4/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-4/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-7/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-7/igt@xe_query@multigpu-query-hwconfig.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-2/igt@xe_query@multigpu-query-hwconfig.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-2/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-1/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8195/shard-bmg-6/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12450/shard-bmg-1/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8195 -&gt; IGTPW_12450</li>
<li>Linux: xe-2497-2334d1179d652eb4032fcb0d8e6f53cbc6a1011c -&gt; xe-2501-596a18adf934dd4a61e15c72b7e1e4ddae489474</li>
</ul>
<p>IGTPW_12450: c39b75a0b25211edcf46f78b95c8bf019186a04f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8195: 8195<br />
  xe-2497-2334d1179d652eb4032fcb0d8e6f53cbc6a1011c: 2334d1179d652eb4032fcb0d8e6f53cbc6a1011c<br />
  xe-2501-596a18adf934dd4a61e15c72b7e1e4ddae489474: 596a18adf934dd4a61e15c72b7e1e4ddae489474</p>

</body>
</html>

--===============5665956350777069628==--
